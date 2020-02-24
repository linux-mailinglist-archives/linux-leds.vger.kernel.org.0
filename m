Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BEE5E16AB61
	for <lists+linux-leds@lfdr.de>; Mon, 24 Feb 2020 17:28:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727177AbgBXQ2m (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 24 Feb 2020 11:28:42 -0500
Received: from vps.xff.cz ([195.181.215.36]:59288 "EHLO vps.xff.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727299AbgBXQ2m (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Mon, 24 Feb 2020 11:28:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=megous.com; s=mail;
        t=1582561720; bh=wkV253iNdu34zWLZa2QqrlFlrBm18YkIXQNR8JlEGXc=;
        h=Date:From:To:Cc:Subject:References:X-My-GPG-KeyId:From;
        b=WDKWj//9hWJyzQ+9eJs8ZC/lnXAkW5HiOq9ChU8ruQvc7s2a8caBEhBu0EBTqedJL
         oF0QzLdL5peysOVfOP4s0H2nZXya9z8FBi6xQQZP8L8Am/AvpCoJXQZQq6M2YpXbpR
         Z5xeQIUsADukIZgVk853toibAnc2nrgeVvxDR+jk=
Date:   Mon, 24 Feb 2020 17:28:40 +0100
From:   =?utf-8?Q?Ond=C5=99ej?= Jirman <megous@megous.com>
To:     Stefan Mavrodiev <stefan@olimex.com>
Cc:     linux-sunxi@googlegroups.com,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Maxime Ripard <mripard@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Lee Jones <lee.jones@linaro.org>, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [linux-sunxi] Re: [PATCH 0/4] Add support for charger LED for
 AXP813 and TBS A711 Tablet
Message-ID: <20200224162840.z7csqagz2frwvmf3@core.my.home>
Mail-Followup-To: =?utf-8?Q?Ond=C5=99ej?= Jirman <megous@megous.com>,
        Stefan Mavrodiev <stefan@olimex.com>, linux-sunxi@googlegroups.com,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Maxime Ripard <mripard@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Lee Jones <lee.jones@linaro.org>, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20200223131435.681620-1-megous@megous.com>
 <20200223132730.6g7tnm2f263oubhv@core.my.home>
 <20200223133517.hfqrg5dta2xk4zj3@core.my.home>
 <1464324b-2b69-c20e-4af8-f32ae5451ea6@olimex.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1464324b-2b69-c20e-4af8-f32ae5451ea6@olimex.com>
X-My-GPG-KeyId: EBFBDDE11FB918D44D1F56C1F9F0A873BE9777ED
 <https://xff.cz/key.txt>
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Mon, Feb 24, 2020 at 08:31:06AM +0200, Stefan Mavrodiev wrote:
> 
> On 2/23/20 3:35 PM, Ondřej Jirman wrote:
> > On Sun, Feb 23, 2020 at 02:27:30PM +0100, megous hlavni wrote:
> > > On Sun, Feb 23, 2020 at 02:14:31PM +0100, megous hlavni wrote:
> > > > The tablet has a charger LED exposed on the top. This LED is controlled
> > > > by AXP813 PMIC. Add support for enabling the LED and using it either
> > > > for charging indication (handled by PMIC automatically) or for other uses
> > > > via user control.
> > > Dang, I just noticed someone sent a similar driver recently, although I had this
> > > one prepared for quite some time (since 2017) in my tree. I guess I should have
> > > sent it earlier.
> > > 
> > > Please ignore.
> > Though the meaning of "recently" is a bit relative. The other work was sent in
> > a year ago. Here's a reference:
> > 
> >    https://lore.kernel.org/patchwork/cover/1042764/
> 
> Hi,
> 
> I'm the author of the 'other' work. I don't know the full story here, but I
> don't
> mind someone else submitting this patch as his.

Hello Stefan,

There's really no story. Just me being a bit anoyed at myself, for not checking
the mailing lists prior to spending some time cleaning up and extending some old
patches to upstream them, and wasting quite a bit of time in the process.

https://megous.com/git/linux/commit/?h=linux-tbs&id=737eec64565d328cab98b75879e3f9eb1cf2f609

> When I submitted the last patch, there was the proposal to use the
> ledtrig-pattern instead
> of sysfs entries. Also AXP209 has inverted CTRL bit.
> 
> Please read the the 'other' discussion.

Thanks, I'll check it out.

regards,
	o.

> Best regards,
> Stefan Mavrodiev
> 
> > 
> > > regards,
> > > 	o.
> > > 
> > > 
> > > > Please take a look.
> > > > 
> > > > thank you and regards,
> > > >    Ondrej Jirman
> > > > 
> > > > Ondrej Jirman (4):
> > > >    dt-bindings: leds: Add a binding for AXP813 charger led
> > > >    leds: axp20x: Support charger LED on AXP20x like PMICs
> > > >    ARM: dts: axp813: Add charger LED
> > > >    ARM: dts: sun8i-a83t-tbs-a711: Enable charging LED
> > > > 
> > > >   .../devicetree/bindings/leds/leds-axp20x.yaml |  24 ++
> > > >   arch/arm/boot/dts/axp81x.dtsi                 |   5 +
> > > >   arch/arm/boot/dts/sun8i-a83t-tbs-a711.dts     |   4 +
> > > >   drivers/leds/Kconfig                          |   7 +
> > > >   drivers/leds/Makefile                         |   1 +
> > > >   drivers/leds/leds-axp20x.c                    | 240 ++++++++++++++++++
> > > >   drivers/mfd/axp20x.c                          |   3 +
> > > >   7 files changed, 284 insertions(+)
> > > >   create mode 100644 Documentation/devicetree/bindings/leds/leds-axp20x.yaml
> > > >   create mode 100644 drivers/leds/leds-axp20x.c
> > > > 
> > > > -- 
> > > > 2.25.1
> > > > 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
