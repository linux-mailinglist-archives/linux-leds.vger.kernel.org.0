Return-Path: <linux-leds+bounces-5491-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 59D0FB52979
	for <lists+linux-leds@lfdr.de>; Thu, 11 Sep 2025 09:01:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 022E91C806C8
	for <lists+linux-leds@lfdr.de>; Thu, 11 Sep 2025 07:01:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A11F26A0E7;
	Thu, 11 Sep 2025 07:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thorsis.com header.i=@thorsis.com header.b="SkDTEaxA"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail.thorsis.com (mail.thorsis.com [217.92.40.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 337D426A1B6;
	Thu, 11 Sep 2025 07:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.92.40.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757574022; cv=none; b=mEXg8vMs3O4ckzhb4NCHwde//9fff+cBtBT1KCQQ3oe9qvqpQc8sgBdFODadWF0wmftDBLE64yl/C/OsF7zXs1+ALtXLk2X+//VEEdRvew5G9W99AkUS92pEZpqn6alBwwRU9CZUs/3f2u+jtrifjSGp8bL5+i3+k6U0EI8m35o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757574022; c=relaxed/simple;
	bh=e02AXsrIhddBZnge/kfTWxo3s0wzqn5n5hJK4I40gEI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Uh+soEzq7IcqCEfdRhhHO+Naw8xJoWIzhUFRvmlZQtfFoUXI2r2/2HpOi07yJuRE4KvHOl3dkk0KTfILa+5hcK5XAwHM9HWfk2Eift93pdoN6QK/p//oak1vG8acLkJtSdHjJXaNkxwu1N5pXhHpHmtR77KMBcBLPOT4BxURB0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=thorsis.com; spf=pass smtp.mailfrom=thorsis.com; dkim=pass (2048-bit key) header.d=thorsis.com header.i=@thorsis.com header.b=SkDTEaxA; arc=none smtp.client-ip=217.92.40.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=thorsis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thorsis.com
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1172A14864B3;
	Thu, 11 Sep 2025 09:00:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thorsis.com; s=dkim;
	t=1757574009; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=QsXFqDE+gmRD/x0bUEZx45QWv+5GScBR7g2luqrlIYA=;
	b=SkDTEaxAF/y7/E/ddlcleMBHPgPMOy3DyxO+bPFOYjadfbjxLx8Vn35uRe8fGrp3g5Wl7O
	9mcjOrYctUVC+BV7dGmXGw677vFln8Gph0+gKxp/s6N1I+5d5uV6wFDZ8w+kbEcqj8PwDx
	zGpGQWmWCqCKMlAd3L989jVNWSb4cLGBfXRAjDgkAlsEHNdHDEvKZzTIeKYxELrozdhtwB
	SCNwLW/uTWnu/R9/fzksJSDvvbVDId/2NHzR9kQ8Vo+ZyqxH3AxhT2LJYATQuTQKXdmp8b
	OP9//XgDNL4EGE5U75+FjIOxQc05qgd27U81taWCbHoku9d74a6Y52tN9IfnDg==
Date: Thu, 11 Sep 2025 09:00:03 +0200
From: Alexander Dahl <ada@thorsis.com>
To: Ryan Wanner <ryan.wanner@microchip.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: microchip: sama7d65: Add GPIO buttons and LEDs
Message-ID: <20250911-breeder-hardness-d3ffa4bfbb6d@thorsis.com>
Mail-Followup-To: Ryan Wanner <ryan.wanner@microchip.com>, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org
References: <20250909160842.392075-1-Ryan.Wanner@microchip.com>
 <20250910-retake-attic-ac1fe3429a1e@thorsis.com>
 <20250910-alkalize-overtime-930a59a7d169@thorsis.com>
 <fa5d44ca-d1ea-4c72-a998-b10f098b25f8@microchip.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fa5d44ca-d1ea-4c72-a998-b10f098b25f8@microchip.com>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-Last-TLS-Session-Version: TLSv1.3

Hello Ryan,

Am Wed, Sep 10, 2025 at 10:16:03AM -0700 schrieb Ryan Wanner:
> On 9/9/25 23:25, Alexander Dahl wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> > 
> > Hello Ryan,
> > 
> > Am Wed, Sep 10, 2025 at 08:20:28AM +0200 schrieb Alexander Dahl:
> >> Hello Ryan,
> >>
> >> Am Tue, Sep 09, 2025 at 09:08:38AM -0700 schrieb Ryan.Wanner@microchip.com:
> >>> From: Ryan Wanner <Ryan.Wanner@microchip.com>
> >>>
> >>> Add the USER button as a GPIO input as well as add the LEDs and enable
> >>> the blue LED as a heartbeat.
> >>>
> >>> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> >>> ---
> >>>  .../dts/microchip/at91-sama7d65_curiosity.dts | 49 +++++++++++++++++++
> >>>  1 file changed, 49 insertions(+)
> >>>
> >>> diff --git a/arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dts b/arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dts
> >>> index f091cc40a9f0..2fe34c59d942 100644
> >>> --- a/arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dts
> >>> +++ b/arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dts
> >>> @@ -11,6 +11,7 @@
> >>>  #include "sama7d65-pinfunc.h"
> >>>  #include "sama7d65.dtsi"
> >>>  #include <dt-bindings/mfd/atmel-flexcom.h>
> >>> +#include <dt-bindings/input/input.h>
> >>>  #include <dt-bindings/pinctrl/at91.h>
> >>>
> >>>  / {
> >>> @@ -26,6 +27,42 @@ chosen {
> >>>             stdout-path = "serial0:115200n8";
> >>>     };
> >>>
> >>> +   gpio-keys {
> >>> +           compatible = "gpio-keys";
> >>> +
> >>> +           pinctrl-names = "default";
> >>> +           pinctrl-0 = <&pinctrl_key_gpio_default>;
> >>> +
> >>> +           button {
> >>> +                   label = "PB_USER";
> >>> +                   gpios = <&pioa PIN_PC10 GPIO_ACTIVE_LOW>;
> >>> +                   linux,code = <KEY_PROG1>;
> >>> +                   wakeup-source;
> >>> +           };
> >>> +   };
> >>> +
> >>> +   leds {
> >>> +           compatible = "gpio-leds";
> >>> +           pinctrl-names = "default";
> >>> +           pinctrl-0 = <&pinctrl_led_gpio_default>;
> >>> +
> >>> +           led-red {
> >>> +                   label = "red";
> >>> +                   gpios = <&pioa PIN_PB17 GPIO_ACTIVE_HIGH>; /* Conflict with pwm. */
> >>> +           };
> >>> +
> >>> +           led-green {
> >>> +                   label = "green";
> >>> +                   gpios = <&pioa PIN_PB15 GPIO_ACTIVE_HIGH>; /* Conflict with pwm. */
> >>> +           };
> >>> +
> >>> +           led-blue {
> >>> +                   label = "blue";
> >>> +                   gpios = <&pioa PIN_PA21 GPIO_ACTIVE_HIGH>;
> >>> +                   linux,default-trigger = "heartbeat";
> >>> +           };
> >>> +   };
> >>
> >> The label property is deprecated.  Please use the properties "color"
> >> and "function" for new boards.  See devicetree binding documentation
> >> for LEDs.
> > 
> > From a quick glance, this seems to be an RGB-LED, so I would suggest
> > to not model it as three distinct LEDs, but make use of the
> > "leds-group-multicolor" feature, example:
> > 
> >  59         multi-led {
> >  60                 compatible = "leds-group-multicolor";
> >  61                 color = <LED_COLOR_ID_RGB>;
> >  62                 function = LED_FUNCTION_INDICATOR;
> >  63                 leds = <&led_red>, <&led_green>, <&led_blue>;
> >  64         };
> 
> I see, I was not aware of this feature. This would combine all of the
> LED pins into one RGB light correct, it seems from sysfs that this is
> the case.

The group-multicolor feature was merged for kernel v6.6 so it's still
quite new.  I tried this some time ago, so this is from memory only.
The three single color gpio leds are still visible in sysfs, but you
can not control them independently anymore, only through the sysfs
interface of that one multicolor led.

> Would having the default-trigger="heartbeat" still be allowed for the
> led-blue node or should that be moved into the multi-led node? From the
> bindings it seems that the default trigger is still in the gpio-led nodes.

Sorry, not sure here.  I put linux-leds in Cc, maybe someone over
there can answer.  If this does not fit how Microchip wants to handle
that LED on their boards I think that's fine, too.  Just wanted to
make people aware of the possibility.

Greets
Alex

> 
> Best,
> Ryan
> > 
> > Greets
> > Alex
> > 
> >>
> >> Thanks and greetings
> >> Alex
> >>
> >>> +
> >>>     memory@60000000 {
> >>>             device_type = "memory";
> >>>             reg = <0x60000000 0x40000000>;
> >>> @@ -352,6 +389,18 @@ pinctrl_i2c10_default: i2c10-default {
> >>>             bias-pull-up;
> >>>     };
> >>>
> >>> +   pinctrl_key_gpio_default: key-gpio-default {
> >>> +           pinmux = <PIN_PC10__GPIO>;
> >>> +           bias-pull-up;
> >>> +   };
> >>> +
> >>> +   pinctrl_led_gpio_default: led-gpio-default {
> >>> +           pinmux = <PIN_PB15__GPIO>,
> >>> +                    <PIN_PB17__GPIO>,
> >>> +                    <PIN_PA21__GPIO>;
> >>> +           bias-pull-up;
> >>> +   };
> >>> +
> >>>     pinctrl_sdmmc1_default: sdmmc1-default {
> >>>             cmd-data {
> >>>                     pinmux = <PIN_PB22__SDMMC1_CMD>,
> >>> --
> >>> 2.43.0
> >>>
> >>>
> >>
> 
> 

