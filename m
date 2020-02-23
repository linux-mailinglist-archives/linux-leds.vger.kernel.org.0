Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 93F111697D6
	for <lists+linux-leds@lfdr.de>; Sun, 23 Feb 2020 14:35:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727004AbgBWNfT (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 23 Feb 2020 08:35:19 -0500
Received: from vps.xff.cz ([195.181.215.36]:42976 "EHLO vps.xff.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726208AbgBWNfT (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Sun, 23 Feb 2020 08:35:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=megous.com; s=mail;
        t=1582464917; bh=6VpUk0yfA5m3J1dhx2/b9+a44uEwfNvyw0oTvOwyDQ8=;
        h=Date:From:To:Subject:References:X-My-GPG-KeyId:From;
        b=GNXtzobtRQPe3S+1nOVOlPHRI/Ge3Segzb4xN/kEe/qKGExn1bm5nxfwvFQY0lNyy
         FTGLhJiA07xtjUTLNaUfDOQnsSHB1Q91iYt9YyquDI04pFGGH3Hy0X1cwlpJV+2hq0
         FhgOh997uamzbxcmGs3pi4m1VIpMtVeMN6BrbbAs=
Date:   Sun, 23 Feb 2020 14:35:17 +0100
From:   =?utf-8?Q?Ond=C5=99ej?= Jirman <megous@megous.com>
To:     linux-sunxi@googlegroups.com,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Maxime Ripard <mripard@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Lee Jones <lee.jones@linaro.org>, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/4] Add support for charger LED for AXP813 and TBS A711
 Tablet
Message-ID: <20200223133517.hfqrg5dta2xk4zj3@core.my.home>
Mail-Followup-To: linux-sunxi@googlegroups.com,
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
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200223132730.6g7tnm2f263oubhv@core.my.home>
X-My-GPG-KeyId: EBFBDDE11FB918D44D1F56C1F9F0A873BE9777ED
 <https://xff.cz/key.txt>
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Sun, Feb 23, 2020 at 02:27:30PM +0100, megous hlavni wrote:
> On Sun, Feb 23, 2020 at 02:14:31PM +0100, megous hlavni wrote:
> > The tablet has a charger LED exposed on the top. This LED is controlled
> > by AXP813 PMIC. Add support for enabling the LED and using it either
> > for charging indication (handled by PMIC automatically) or for other uses
> > via user control.
> 
> Dang, I just noticed someone sent a similar driver recently, although I had this
> one prepared for quite some time (since 2017) in my tree. I guess I should have
> sent it earlier.
> 
> Please ignore.

Though the meaning of "recently" is a bit relative. The other work was sent in
a year ago. Here's a reference:

  https://lore.kernel.org/patchwork/cover/1042764/

> regards,
> 	o.
> 
> 
> > Please take a look.
> > 
> > thank you and regards,
> >   Ondrej Jirman
> > 
> > Ondrej Jirman (4):
> >   dt-bindings: leds: Add a binding for AXP813 charger led
> >   leds: axp20x: Support charger LED on AXP20x like PMICs
> >   ARM: dts: axp813: Add charger LED
> >   ARM: dts: sun8i-a83t-tbs-a711: Enable charging LED
> > 
> >  .../devicetree/bindings/leds/leds-axp20x.yaml |  24 ++
> >  arch/arm/boot/dts/axp81x.dtsi                 |   5 +
> >  arch/arm/boot/dts/sun8i-a83t-tbs-a711.dts     |   4 +
> >  drivers/leds/Kconfig                          |   7 +
> >  drivers/leds/Makefile                         |   1 +
> >  drivers/leds/leds-axp20x.c                    | 240 ++++++++++++++++++
> >  drivers/mfd/axp20x.c                          |   3 +
> >  7 files changed, 284 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/leds/leds-axp20x.yaml
> >  create mode 100644 drivers/leds/leds-axp20x.c
> > 
> > -- 
> > 2.25.1
> > 
