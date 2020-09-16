Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 304A526B702
	for <lists+linux-leds@lfdr.de>; Wed, 16 Sep 2020 02:15:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727050AbgIPAPw convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-leds@lfdr.de>); Tue, 15 Sep 2020 20:15:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726736AbgIPAPp (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 15 Sep 2020 20:15:45 -0400
Received: from mail.nic.cz (lists.nic.cz [IPv6:2001:1488:800:400::400])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44535C06174A;
        Tue, 15 Sep 2020 17:15:45 -0700 (PDT)
Received: from localhost (unknown [IPv6:2a0e:b107:ae1:0:3e97:eff:fe61:c680])
        by mail.nic.cz (Postfix) with ESMTPSA id 20D78140A47;
        Wed, 16 Sep 2020 02:15:38 +0200 (CEST)
Date:   Wed, 16 Sep 2020 02:15:37 +0200
From:   Marek Behun <marek.behun@nic.cz>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc:     linux-leds@vger.kernel.org, Pavel Machek <pavel@ucw.cz>,
        Dan Murphy <dmurphy@ti.com>,
        =?UTF-8?B?T25kxZllag==?= Jirman <megous@megous.com>,
        Russell King <linux@armlinux.org.uk>,
        Andrew Lunn <andrew@lunn.ch>, linux-kernel@vger.kernel.org,
        Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH leds + devicetree v2 2/2] leds: trigger: netdev: parse
 `trigger-sources` from device tree
Message-ID: <20200916021537.106a29e5@nic.cz>
In-Reply-To: <03fc62d8-eeaa-7b74-5ed9-7e482ea6b888@gmail.com>
References: <20200915152616.20591-1-marek.behun@nic.cz>
        <20200915152616.20591-3-marek.behun@nic.cz>
        <03fc62d8-eeaa-7b74-5ed9-7e482ea6b888@gmail.com>
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-100.0 required=5.9 tests=SHORTCIRCUIT,URIBL_BLOCKED,
        USER_IN_WELCOMELIST,USER_IN_WHITELIST shortcircuit=ham
        autolearn=disabled version=3.4.2
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.nic.cz
X-Virus-Scanned: clamav-milter 0.102.2 at mail
X-Virus-Status: Clean
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Tue, 15 Sep 2020 23:35:25 +0200
Jacek Anaszewski <jacek.anaszewski@gmail.com> wrote:

> Hi Marek,
> 
> On 9/15/20 5:26 PM, Marek Behún wrote:
> > Allow setting netdev LED trigger as default when given LED DT node has
> > the `trigger-sources` property pointing to a node corresponding to a
> > network device.
> > 
> > The specific netdev trigger mode is determined from the `function` LED
> > property.
> > 
> > Example:
> >    eth0: ethernet@30000 {
> >      compatible = "xyz";
> >      #trigger-source-cells = <0>;
> >    };
> > 
> >    led {
> >      color = <LED_COLOR_ID_GREEN>;
> >      function = LED_FUNCTION_LINK;
> >      trigger-sources = <&eth0>;
> >    };
> > 
> > Signed-off-by: Marek Behún <marek.behun@nic.cz>
> > Cc: Rob Herring <robh+dt@kernel.org>
> > Cc: devicetree@vger.kernel.org
> > ---
> >   drivers/leds/trigger/ledtrig-netdev.c | 80 ++++++++++++++++++++++++++-
> >   include/dt-bindings/leds/common.h     |  1 +
> >   2 files changed, 80 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/leds/trigger/ledtrig-netdev.c b/drivers/leds/trigger/ledtrig-netdev.c
> > index d5e774d830215..99fc2f0c68e12 100644
> > --- a/drivers/leds/trigger/ledtrig-netdev.c
> > +++ b/drivers/leds/trigger/ledtrig-netdev.c
> > @@ -20,6 +20,7 @@  
> [...]
> 
> >   static int netdev_trig_activate(struct led_classdev *led_cdev)
> >   {
> >   	struct led_netdev_data *trigger_data;
> > @@ -414,10 +479,17 @@ static int netdev_trig_activate(struct led_classdev *led_cdev)
> >   	trigger_data->last_activity = 0;
> >   
> >   	led_set_trigger_data(led_cdev, trigger_data);
> > +	netdev_trig_of_parse(led_cdev, trigger_data);  
> 
> Please be aware of LED_INIT_DEFAULT_TRIGGER flag - it would make
> sense to use it here so as not to unnecessarily call
> netdev_trig_of_parse(), which makes sense only if trigger will be
> default, I presume.
> 
> See timer_trig_activate() in  drivers/leds/trigger/ledtrig-timer.c
> for reference.
> 

Hmmm. Jacek, all the triggers that work with the macro
LED_INIT_DEFAULT_TRIGGER are oneshot, timer and pattern.
If this macro is set, they all call pattern_init function where they
read led-pattern from fwnode.

But there is no device tree in Linux sources using this property.
In fact the command
  git grep led-pattern
yields only 2 files:
  Documentation/devicetree/bindings/leds/common.yaml
  drivers/leds/led-core.c

What is the purpose if no device tree uses this property? Is this used
from other fwnode sources, like acpi or efi?

The reason why I am asking this is that the `led-pattern` property in
device tree goes against the principle of device tree, that it
shouldn't set settings settable from userspace, only describe the
devices on the system and how they are connected to each other.

This is the same reason why multi-CPU DSA proposals which proposed to
set mappings between CPU ports and user ports were rejected...

Marek
