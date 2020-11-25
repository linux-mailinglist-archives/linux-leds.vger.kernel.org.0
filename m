Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F97C2C3FCE
	for <lists+linux-leds@lfdr.de>; Wed, 25 Nov 2020 13:19:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726009AbgKYMTc (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 25 Nov 2020 07:19:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725616AbgKYMTb (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 25 Nov 2020 07:19:31 -0500
Received: from mail.nic.cz (lists.nic.cz [IPv6:2001:1488:800:400::400])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4C6FC0613D4;
        Wed, 25 Nov 2020 04:19:31 -0800 (PST)
Received: from localhost (unknown [IPv6:2a0e:b107:ae1:0:3e97:eff:fe61:c680])
        by mail.nic.cz (Postfix) with ESMTPSA id 75A41142095;
        Wed, 25 Nov 2020 13:19:28 +0100 (CET)
Date:   Wed, 25 Nov 2020 13:19:26 +0100
From:   Marek Behun <marek.behun@nic.cz>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     linux-leds@vger.kernel.org, Dan Murphy <dmurphy@ti.com>,
        =?UTF-8?B?T25kxZllag==?= Jirman <megous@megous.com>,
        Russell King <linux@armlinux.org.uk>,
        Andrew Lunn <andrew@lunn.ch>, linux-kernel@vger.kernel.org,
        Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH leds + devicetree v2 2/2] leds: trigger: netdev: parse
 `trigger-sources` from device tree
Message-ID: <20201125131926.4e47359a@nic.cz>
In-Reply-To: <20201125104242.GD25562@amd>
References: <20200915152616.20591-1-marek.behun@nic.cz>
        <20200915152616.20591-3-marek.behun@nic.cz>
        <20201125104242.GD25562@amd>
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-100.0 required=5.9 tests=SHORTCIRCUIT,URIBL_BLOCKED,
        USER_IN_WELCOMELIST,USER_IN_WHITELIST shortcircuit=ham
        autolearn=disabled version=3.4.2
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.nic.cz
X-Virus-Scanned: clamav-milter 0.102.2 at mail
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Wed, 25 Nov 2020 11:42:42 +0100
Pavel Machek <pavel@ucw.cz> wrote:

> Hi!
> 
> > Allow setting netdev LED trigger as default when given LED DT node has
> > the `trigger-sources` property pointing to a node corresponding to a
> > network device.
> > 
> > The specific netdev trigger mode is determined from the `function` LED
> > property.  
> 
> Sounds reasonable.
> 
> > +	netdev = of_find_net_device_by_node(args.np);
> > +	if (!netdev)
> > +		return false;
> > +
> > +	np = dev_of_node(led_cdev->dev);
> > +	if (!np)
> > +		return false;  
> 
> Missing of_node_put?

I will look into this.

> 
> > +++ b/include/dt-bindings/leds/common.h
> > @@ -77,6 +77,7 @@
> >  #define LED_FUNCTION_HEARTBEAT "heartbeat"
> >  #define LED_FUNCTION_INDICATOR "indicator"
> >  #define LED_FUNCTION_LAN "lan"
> > +#define LED_FUNCTION_LINK "link"
> >  #define LED_FUNCTION_MAIL "mail"
> >  #define LED_FUNCTION_MTD "mtd"
> >  #define LED_FUNCTION_PANIC "panic"  
> 
> We have function "lan" already defined; "link" would do mostly same
> thing. Should we use "lan"? Or should we delete "lan" and replace it
> with "link"?

Removal of "lan" should depend on whether it is used somewhere...

But I think "link" is more sensible since:
- it can distinguish better from "activity" if "activity" should mean
  blinking on RX/TX
- the interface must not necessarily be a LAN (in the sense that on
  routers we have WAN and LAN and possibly other, user defined
  networks).

We could use "lan" though to mean "link" and "activity" together (ie.
LED on when interface linked, LED blinking on RX/TX).

We have to decide whether specifying more LED functions to one LED in
DT should look like:

  function = LED_FUNCTION_LINK, LED_FUNCTION_ACTIVITY;

or rather like

  function = LED_FUNCTION_LAN;

The problem with the second one is that we would need specific
functions for different compound modes (if we wanted to do that), eg:
  function = LED_FUNCTION_LAN_RX;

Marek
