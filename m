Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EABE1287293
	for <lists+linux-leds@lfdr.de>; Thu,  8 Oct 2020 12:32:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727273AbgJHKcS (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 8 Oct 2020 06:32:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725917AbgJHKcS (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 8 Oct 2020 06:32:18 -0400
Received: from mail.nic.cz (lists.nic.cz [IPv6:2001:1488:800:400::400])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E57A2C061755
        for <linux-leds@vger.kernel.org>; Thu,  8 Oct 2020 03:32:17 -0700 (PDT)
Received: from localhost (unknown [IPv6:2a0e:b107:ae1:0:3e97:eff:fe61:c680])
        by mail.nic.cz (Postfix) with ESMTPSA id 5A4B9140A25;
        Thu,  8 Oct 2020 12:32:15 +0200 (CEST)
Date:   Thu, 8 Oct 2020 12:32:14 +0200
From:   Marek Behun <marek.behun@nic.cz>
To:     Vadim Pasternak <vadimp@nvidia.com>
Cc:     Pavel Machek <pavel@ucw.cz>,
        "jacek.anaszewski@gmail.com" <jacek.anaszewski@gmail.com>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>
Subject: Re: [PATCH led-next 1/1] leds: mlxreg: Allow multi-instantiation of
 same name LED for modular systems
Message-ID: <20201008123214.2a5de507@nic.cz>
In-Reply-To: <DM6PR12MB3898D2BDC4AC32036E792548AF0B0@DM6PR12MB3898.namprd12.prod.outlook.com>
References: <20201006165850.17790-1-vadimp@nvidia.com>
        <20201007113105.GE12224@duo.ucw.cz>
        <20201007142049.02d8c3ba@nic.cz>
        <DM6PR12MB38986A442F12A2DFB5769235AF0B0@DM6PR12MB3898.namprd12.prod.outlook.com>
        <20201008075619.GB32424@amd>
        <DM6PR12MB389877E86421231E18EF7DCDAF0B0@DM6PR12MB3898.namprd12.prod.outlook.com>
        <20201008105550.44fa3165@nic.cz>
        <DM6PR12MB3898D2BDC4AC32036E792548AF0B0@DM6PR12MB3898.namprd12.prod.outlook.com>
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-100.0 required=5.9 tests=SHORTCIRCUIT,
        USER_IN_WELCOMELIST,USER_IN_WHITELIST shortcircuit=ham
        autolearn=disabled version=3.4.2
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.nic.cz
X-Virus-Scanned: clamav-milter 0.102.2 at mail
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

> > 
> > Vadim, the LED core constructs names in form
> >   device:color:function-enumerator
> > so if you must have number there, IMO it should be
> >   mlxreg:green:status-48
> >   mlxreg:green:status-56
> >   ...  
> 
> But why you consider it as function enumerator?
> For example card48, card56 are two different devices
> of same type.
> Both have 'status' LED.

OK this is a fair point.

I was thinking such because in my mind I had this idea that for an
ethernet switch with interfaces lan0 - lan4 it would make sense to use
the LED_FUNCTION_LAN function with function enumerator. But thinking
about this now again makes me wonder if instead the lan0 - lan4 should
be devicenames instead, since normally they are network interface names.

Vadim, the reason why Pavel and I think that mlxreg (or mlxregN) is not
valid devicename part (although mlxreg has to stay since many users
already depend on it, as you say), is that the mlxreg name is not
exposed anywhere else in Linux from userspace point of view.

Devicename eth0 is okay, because it is network interface name.
Devicename sda would be okay, because everyone knows it is a block
device and you can access it via /dev/sda.
Devicename hci0 would be okay because it is bluetooth interface
accessible via hcitool.
Devicenames mtd0, kbd0, mouse0 would be okay, I think.

But mlxreg is not accessible via anything else in the system. Unless
your systems also have something like /dev/mlxreg, that is.

Do the LEDs on these cards only indicate status of the cards
themselves as a whole? Or are there LEDs on these cards dedicated to
their peripherals? For example if there is an ethernet port with LEDs on
one of these cards, the devicename part for these LEDs should be of the
device of that ethernet port, not mlxreg...

Marek
