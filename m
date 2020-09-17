Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49DCF26E092
	for <lists+linux-leds@lfdr.de>; Thu, 17 Sep 2020 18:23:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728476AbgIQQXB convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-leds@lfdr.de>); Thu, 17 Sep 2020 12:23:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728474AbgIQQW7 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 17 Sep 2020 12:22:59 -0400
Received: from mail.nic.cz (lists.nic.cz [IPv6:2001:1488:800:400::400])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32365C061354;
        Thu, 17 Sep 2020 08:54:09 -0700 (PDT)
Received: from localhost (unknown [IPv6:2a0e:b107:ae1:0:3e97:eff:fe61:c680])
        by mail.nic.cz (Postfix) with ESMTPSA id F3C5113F681;
        Thu, 17 Sep 2020 17:54:06 +0200 (CEST)
Date:   Thu, 17 Sep 2020 17:54:06 +0200
From:   Marek Behun <marek.behun@nic.cz>
To:     Dan Murphy <dmurphy@ti.com>
Cc:     <linux-leds@vger.kernel.org>, Pavel Machek <pavel@ucw.cz>,
        =?UTF-8?B?T25kxZllag==?= Jirman <megous@megous.com>,
        <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
        <devicetree@vger.kernel.org>
Subject: Re: [PATCH leds v1 09/10] leds: lm36274: use struct led_init_data
 when registering
Message-ID: <20200917175406.361395d3@nic.cz>
In-Reply-To: <7940ab2f-f4a5-c909-9270-4b713b76261d@ti.com>
References: <20200916231650.11484-1-marek.behun@nic.cz>
        <20200916231650.11484-10-marek.behun@nic.cz>
        <7940ab2f-f4a5-c909-9270-4b713b76261d@ti.com>
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
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Thu, 17 Sep 2020 10:28:12 -0500
Dan Murphy <dmurphy@ti.com> wrote:

> Marek
> 
> On 9/16/20 6:16 PM, Marek Behún wrote:
> > By using struct led_init_data when registering we do not need to parse
> > `label` DT property nor `linux,default-trigger` property.
> >
> > A small refactor was also done:
> > - with using devm_led_classdev_register_ext the driver remove method is
> >    not needed
> > - since only one child node is allowed for this driver, use
> >    device_get_next_child_node instead of device_for_each_child_node
> >
> > Previously if the `label` DT property was not present, the code composed
> > name for the LED in the form
> >    "parent_name::"
> > For backwards compatibility we therefore set
> >    init_data->default_label = ":";
> > so that the LED will not get a different name if `label` property is not
> > present.  
> 
> You are going to re-factor this as well a lot of changes in a single 
> patch is hard to review
> 
> Dan
> 
I am trying to do this now.
