Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E33A2338833
	for <lists+linux-leds@lfdr.de>; Fri, 12 Mar 2021 10:04:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232509AbhCLJDz convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-leds@lfdr.de>); Fri, 12 Mar 2021 04:03:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232417AbhCLJDa (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 12 Mar 2021 04:03:30 -0500
X-Greylist: delayed 62617 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 12 Mar 2021 01:03:30 PST
Received: from mail.nic.cz (mail.nic.cz [IPv6:2001:1488:800:400::400])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 889A6C061574;
        Fri, 12 Mar 2021 01:03:30 -0800 (PST)
Received: from localhost (unknown [IPv6:2a0e:b107:ae1:0:3e97:eff:fe61:c680])
        by mail.nic.cz (Postfix) with ESMTPSA id 493681408F2;
        Fri, 12 Mar 2021 10:03:28 +0100 (CET)
Date:   Fri, 12 Mar 2021 10:03:27 +0100
From:   Marek Behun <marek.behun@nic.cz>
To:     Hermes Zhang <Hermes.Zhang@axis.com>
Cc:     Alexander Dahl <ada@thorsis.com>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        kernel <kernel@axis.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] leds: leds-dual-gpio: Add dual GPIO LEDs driver
Message-ID: <20210312100327.3c3c47ba@nic.cz>
In-Reply-To: <e56946d1d85948c7b6ce94982a221981@XBOX03.axis.com>
References: <20210311130408.10820-1-chenhui.zhang@axis.com>
        <2315048.uTtSMl1LR1@ada>
        <e56946d1d85948c7b6ce94982a221981@XBOX03.axis.com>
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
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

On Fri, 12 Mar 2021 08:48:55 +0000
Hermes Zhang <Hermes.Zhang@axis.com> wrote:

> Hi Alexander,
> 
> > Am Donnerstag, 11. März 2021, 14:04:08 CET schrieb Hermes Zhang:  
> > > From: Hermes Zhang <chenhuiz@axis.com>
> > >
> > > Introduce a new Dual GPIO LED driver. These two GPIOs LED will act as
> > > one LED as normal GPIO LED but give the possibility to change the
> > > intensity in four levels: OFF, LOW, MIDDLE and HIGH.  
> > 
> > Interesting use case. Is there any real world hardware wired like that you
> > could point to?
> >   
> 
> Yes, we have the HW, it's not a chip but just some circuit to made of.
>  
> > > +config LEDS_DUAL_GPIO
> > > +	tristate "LED Support for Dual GPIO connected LEDs"
> > > +	depends on LEDS_CLASS
> > > +	depends on GPIOLIB || COMPILE_TEST
> > > +	help
> > > +	  This option enables support for the two LEDs connected to GPIO
> > > +	  outputs. These two GPIO LEDs act as one LED in the sysfs and
> > > +	  perform different intensity by enable either one of them or both.  
> > 
> > Well, although I never had time to implement that, I suspect that could
> > conflict if someone will eventually write a driver for two pin dual color LEDs
> > connected to GPIO pins.  We actually do that on our hardware and I know
> > others do, too.
> > 
> > I asked about that back in 2019, see this thread:
> > 
> > https://www.spinics.net/lists/linux-leds/msg11665.html
> > 
> > At the time the multicolor framework was not yet merged, so today I would
> > probably make something which either uses the multicolor framework or at
> > least has a similar interface to userspace. However, it probably won't surprise
> > you all, this is not highest priority on my ToDo list. ;-)
> > 
> > (What we actually do is pretend those are separate LEDs and ignore the
> > conflicting case where both GPIOs are on and the LED is dark then.)
> >   
> 
> Yes, that case seems conflict with mine, the pattern for me is like:
> 
> P1 | P2 | LED
> -- + -- + -----
>  0 |  0 | off
>  0 |  1 | Any color
>  1 |  0 | Any color
>  1 |  1 | both on
> 
> Now I'm investigate another way from Marek's suggestion by using REGULATOR_GPIO, to see if could meet my requirement. If yes, then I do think no new  driver is needed.

Maybe you could even implement multicolor-gpio, now that we have
multicolor LED class :)

Marek
