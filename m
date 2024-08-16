Return-Path: <linux-leds+bounces-2443-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BD995954528
	for <lists+linux-leds@lfdr.de>; Fri, 16 Aug 2024 11:07:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3CE691F2645E
	for <lists+linux-leds@lfdr.de>; Fri, 16 Aug 2024 09:07:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DAE213D890;
	Fri, 16 Aug 2024 09:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thorsis.com header.i=@thorsis.com header.b="SNfQ/sZS"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail.thorsis.com (mail.thorsis.com [217.92.40.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 344617581B;
	Fri, 16 Aug 2024 09:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.92.40.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723799233; cv=none; b=NKlkJFbOlfli3q/l2+nupdeMP2QntIkXVwpkpqDbsSRD5yzPl5Rws28DnV/km9nfYKmN7Bdyk8Tcg8lIzivdYdTrBa5brUBv23uGcXdEbxNt4gsXSQaLtaJpDneVKTU7jJn5NVfqcG4g6rNZa6I3Pgt7frGaV7ppbV4GoebUK2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723799233; c=relaxed/simple;
	bh=aDi33gnq827IsLeQojqZBT6YfKs0Um8l69tkdh2P+kw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HfuELESdIUlx8V0VGLJ/uwAD//+aaS/OjRM9qefSU1Lnst0Imjdb45MHsjIif/hxyQgPvYP21IPyp91Uf8IiLL05gVt+rhqHRFrNlLxz+EX5nRVPCKpRP2wWqHkosgZfh2w/RAHLoXRcr+suHnQbWGNbiaMiBkXsa2rkg+FXuB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=thorsis.com; spf=pass smtp.mailfrom=thorsis.com; dkim=pass (2048-bit key) header.d=thorsis.com header.i=@thorsis.com header.b=SNfQ/sZS; arc=none smtp.client-ip=217.92.40.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=thorsis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thorsis.com
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C218B1487947;
	Fri, 16 Aug 2024 11:06:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thorsis.com; s=dkim;
	t=1723799221; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=vzhuOaZRrz7wvypL0j5SsmkvRUltT4LkYMrLgENZ3Yc=;
	b=SNfQ/sZSy0WnDn3riywMCvN1/p7NOeDwtGcyozGJ8jE4J92OvEmSDyDvOQTjtWmRV3reV6
	yIC58i/2wtEO6Ki+NEZoxfbeVCl6lPmv/BaHutNW0n0pT7GQQ9EKXUxtQeaawpEvZRyHtn
	Z1r1HpocRjXD9tozUffYrHLgV5PTsFjeDZyoaqh1HVvAx3QNDA8FmVjZ0zA4AR0ErDHd2j
	dY2JFwANv0mQ3djSrinGX39eYFZeUJ3Hy49j3LDRVmLFgptO9cqeE9mOvrVZ7KjBFvPNJK
	Ol1+ParhoKlTG+HHR+ainkHgSfKkJQm6AbsBv4KeXzVJVyj4QvJPMxunKPGLLA==
Date: Fri, 16 Aug 2024 11:06:54 +0200
From: Alexander Dahl <ada@thorsis.com>
To: Andrei.Simion@microchip.com
Cc: claudiu.beznea@tuxon.dev, Nicolas.Ferre@microchip.com,
	alexandre.belloni@bootlin.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, peda@axentia.se,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, Cristian.Birsan@microchip.com,
	linux-leds@vger.kernel.org
Subject: Re: [PATCH 5/5] ARM: dts: microchip: Rename LED sub nodes name
Message-ID: <20240816-maturity-yin-d58e0e20b08d@thorsis.com>
Mail-Followup-To: Andrei.Simion@microchip.com, claudiu.beznea@tuxon.dev,
	Nicolas.Ferre@microchip.com, alexandre.belloni@bootlin.com,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	peda@axentia.se, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	Cristian.Birsan@microchip.com, linux-leds@vger.kernel.org
References: <20240814122633.198562-1-andrei.simion@microchip.com>
 <20240814122633.198562-6-andrei.simion@microchip.com>
 <20240815-ambush-cavalier-80adf0260765@thorsis.com>
 <13ac28fe-e2ae-4c9b-a350-e7d2ba400340@microchip.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <13ac28fe-e2ae-4c9b-a350-e7d2ba400340@microchip.com>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-Last-TLS-Session-Version: TLSv1.3

Hello Andrei,

Am Fri, Aug 16, 2024 at 08:52:14AM +0000 schrieb Andrei.Simion@microchip.com:
> Hello Alex,
> 
> On 15.08.2024 10:57, Alexander Dahl wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> > 
> > Hello Andrei,
> >> Am Wed, Aug 14, 2024 at 03:26:33PM +0300 schrieb Andrei Simion:
> >> dtbs_check warnings:
> >> leds: 'd[0-9]', 'ds[0-9]' do not match any of the regexes:
> >> '(^led-[0-9a-f]$|led)', 'pinctrl-[0-9]+'
> >> leds: 'red', 'green', 'blue' do not match any of regexes:
> >> '(^led-[0-9a-f]$|led)', 'pinctrl-[0-9]+'
> >>
> >> Rename the led sub nodes according to devicetree
> >> specification and leds-gpio.yaml.
> >>
> >> Signed-off-by: Andrei Simion <andrei.simion@microchip.com>
> >> ---
> >> Split the bloadted patch into small patches on topics
> >> based on comments:
> >> https://lore.kernel.org/linux-arm-kernel/89f51615-0dee-4ab0-ab72-e3c057fee1e7@tuxon.dev/
> >> ---
> >>  arch/arm/boot/dts/microchip/aks-cdu.dts        | 8 ++++----
> >>  arch/arm/boot/dts/microchip/animeo_ip.dts      | 8 ++++----
> >>  arch/arm/boot/dts/microchip/at91-sam9x60ek.dts | 6 +++---
> >>  arch/arm/boot/dts/microchip/at91rm9200ek.dts   | 6 +++---
> >>  arch/arm/boot/dts/microchip/at91sam9260ek.dts  | 4 ++--
> >>  arch/arm/boot/dts/microchip/at91sam9261ek.dts  | 6 +++---
> >>  arch/arm/boot/dts/microchip/at91sam9263ek.dts  | 4 ++--
> >>  arch/arm/boot/dts/microchip/at91sam9g20ek.dts  | 4 ++--
> >>  8 files changed, 23 insertions(+), 23 deletions(-)
> >>
> >> diff --git a/arch/arm/boot/dts/microchip/aks-cdu.dts b/arch/arm/boot/dts/microchip/aks-cdu.dts
> >> index 52e166c8a365..95a0639c5579 100644
> >> --- a/arch/arm/boot/dts/microchip/aks-cdu.dts
> >> +++ b/arch/arm/boot/dts/microchip/aks-cdu.dts
> >> @@ -98,23 +98,23 @@ rootfs@500000 {
> >>       leds {
> >>               compatible = "gpio-leds";
> >>
> >> -             red {
> >> +             led-red {
> >>                       gpios = <&pioC 10 GPIO_ACTIVE_HIGH>;
> >>                       linux,default-trigger = "none";
> >>               };
> >>
> >> -             green {
> >> +             led-green {
> >>                       gpios = <&pioA 5 GPIO_ACTIVE_LOW>;
> >>                       linux,default-trigger = "none";
> >>                       default-state = "on";
> >>               };
> >>
> >> -             yellow {
> >> +             led-yellow {
> >>                       gpios = <&pioB 20 GPIO_ACTIVE_LOW>;
> >>                       linux,default-trigger = "none";
> >>               };
> >>
> >> -             blue {
> >> +             led-blue {
> >>                       gpios = <&pioB 21 GPIO_ACTIVE_LOW>;
> >>                       linux,default-trigger = "none";
> >>               };
> > 
> > As reported with <20240730-rambling-helping-2f03f5ddee6a@thorsis.com>
> > already, this will probably change sysfs paths and thus might break
> > userspace depending on those paths.  Did you consider adding a label
> > to avoid this?
> > 
> > (Added linux-leds to Cc.)
> > 
> 
> https://elixir.bootlin.com/linux/v6.11-rc3/source/Documentation/devicetree/bindings/leds/common.yaml#L54
> Based on the information provided above: "If omitted, the label is 
> taken from the node name (excluding the unit address)." and "This 
> property is deprecated"
> So, in your opinion what should I do? use function and color?
> My patch reason is to rename the label to avoid the warnings.

I understood the intention, and I appreciate the effort of eliminating
those warnings.  I would add the label property here and use the
previous node name as value.  The deprecation statement makes sense
when introducing new nodes with new LEDs.  In this case there's
already a somewhat deprecated name, but if that should stay stable,
then in my opinion adding the label property is the best choice.

Example, before:

  yellow {
    gpios = < ... >;
    linux,default-trigger = ...;
  };

After:

  led-yellow {
    label = "yellow";
    gpios = < ... >;
    linux,default-trigger = ...;
  };

This way the sysfs path should be /sys/class/leds/yellow before and
after, and the dts warnings be gone, right?

Greets
Alex

> 
> Best Regards,
> Andrei Simion
> 
> > Greets
> > Alex
> > 
> >> diff --git a/arch/arm/boot/dts/microchip/animeo_ip.dts b/arch/arm/boot/dts/microchip/animeo_ip.dts
> >> index 911c8d9ee013..52ac840bcd35 100644
> >> --- a/arch/arm/boot/dts/microchip/animeo_ip.dts
> >> +++ b/arch/arm/boot/dts/microchip/animeo_ip.dts
> >> @@ -146,23 +146,23 @@ ohci: usb@500000 {
> >>       leds {
> >>               compatible = "gpio-leds";
> >>
> >> -             power_green {
> >> +             led-power-green {
> >>                       label = "power_green";
> >>                       gpios = <&pioC 17 GPIO_ACTIVE_HIGH>;
> >>                       linux,default-trigger = "heartbeat";
> >>               };
> >>
> >> -             power_red {
> >> +             led-power-red {
> >>                       label = "power_red";
> >>                       gpios = <&pioA 2 GPIO_ACTIVE_HIGH>;
> >>               };
> >>
> >> -             tx_green {
> >> +             led-tx-green {
> >>                       label = "tx_green";
> >>                       gpios = <&pioC 19 GPIO_ACTIVE_HIGH>;
> >>               };
> >>
> >> -             tx_red {
> >> +             led-tx-red {
> >>                       label = "tx_red";
> >>                       gpios = <&pioC 18 GPIO_ACTIVE_HIGH>;
> >>               };
> >> diff --git a/arch/arm/boot/dts/microchip/at91-sam9x60ek.dts b/arch/arm/boot/dts/microchip/at91-sam9x60ek.dts
> >> index b9a21f9f9a6d..da31b07d6828 100644
> >> --- a/arch/arm/boot/dts/microchip/at91-sam9x60ek.dts
> >> +++ b/arch/arm/boot/dts/microchip/at91-sam9x60ek.dts
> >> @@ -53,17 +53,17 @@ leds {
> >>               pinctrl-0 = <&pinctrl_gpio_leds>;
> >>               status = "okay"; /* Conflict with pwm0. */
> >>
> >> -             red {
> >> +             led-red {
> >>                       label = "red";
> >>                       gpios = <&pioB 11 GPIO_ACTIVE_HIGH>;
> >>               };
> >>
> >> -             green {
> >> +             led-green {
> >>                       label = "green";
> >>                       gpios = <&pioB 12 GPIO_ACTIVE_HIGH>;
> >>               };
> >>
> >> -             blue {
> >> +             led-blue {
> >>                       label = "blue";
> >>                       gpios = <&pioB 13 GPIO_ACTIVE_HIGH>;
> >>                       linux,default-trigger = "heartbeat";
> >> diff --git a/arch/arm/boot/dts/microchip/at91rm9200ek.dts b/arch/arm/boot/dts/microchip/at91rm9200ek.dts
> >> index 3089912dd6be..641d443e6ca9 100644
> >> --- a/arch/arm/boot/dts/microchip/at91rm9200ek.dts
> >> +++ b/arch/arm/boot/dts/microchip/at91rm9200ek.dts
> >> @@ -127,19 +127,19 @@ root@350000  {
> >>       leds {
> >>               compatible = "gpio-leds";
> >>
> >> -             ds2 {
> >> +             led-ds2 {
> >>                       label = "green";
> >>                       gpios = <&pioB 0 GPIO_ACTIVE_LOW>;
> >>                       linux,default-trigger = "mmc0";
> >>               };
> >>
> >> -             ds4 {
> >> +             led-ds4 {
> >>                       label = "yellow";
> >>                       gpios = <&pioB 1 GPIO_ACTIVE_LOW>;
> >>                       linux,default-trigger = "heartbeat";
> >>               };
> >>
> >> -             ds6 {
> >> +             led-ds6 {
> >>                       label = "red";
> >>                       gpios = <&pioB 2 GPIO_ACTIVE_LOW>;
> >>               };
> >> diff --git a/arch/arm/boot/dts/microchip/at91sam9260ek.dts b/arch/arm/boot/dts/microchip/at91sam9260ek.dts
> >> index ed259e2cb853..4933971d0585 100644
> >> --- a/arch/arm/boot/dts/microchip/at91sam9260ek.dts
> >> +++ b/arch/arm/boot/dts/microchip/at91sam9260ek.dts
> >> @@ -174,13 +174,13 @@ eeprom@50 {
> >>       leds {
> >>               compatible = "gpio-leds";
> >>
> >> -             ds1 {
> >> +             led-ds1 {
> >>                       label = "ds1";
> >>                       gpios = <&pioA 9 GPIO_ACTIVE_HIGH>;
> >>                       linux,default-trigger = "heartbeat";
> >>               };
> >>
> >> -             ds5 {
> >> +             led-ds5 {
> >>                       label = "ds5";
> >>                       gpios = <&pioA 6 GPIO_ACTIVE_LOW>;
> >>               };
> >> diff --git a/arch/arm/boot/dts/microchip/at91sam9261ek.dts b/arch/arm/boot/dts/microchip/at91sam9261ek.dts
> >> index 4d9269cc5f32..9c44177db714 100644
> >> --- a/arch/arm/boot/dts/microchip/at91sam9261ek.dts
> >> +++ b/arch/arm/boot/dts/microchip/at91sam9261ek.dts
> >> @@ -192,19 +192,19 @@ watchdog@fffffd40 {
> >>       leds {
> >>               compatible = "gpio-leds";
> >>
> >> -             ds8 {
> >> +             led-ds8 {
> >>                       label = "ds8";
> >>                       gpios = <&pioA 13 GPIO_ACTIVE_LOW>;
> >>                       linux,default-trigger = "none";
> >>               };
> >>
> >> -             ds7 {
> >> +             led-ds7 {
> >>                       label = "ds7";
> >>                       gpios = <&pioA 14 GPIO_ACTIVE_LOW>;
> >>                       linux,default-trigger = "nand-disk";
> >>               };
> >>
> >> -             ds1 {
> >> +             led-ds1 {
> >>                       label = "ds1";
> >>                       gpios = <&pioA 23 GPIO_ACTIVE_LOW>;
> >>                       linux,default-trigger = "heartbeat";
> >> diff --git a/arch/arm/boot/dts/microchip/at91sam9263ek.dts b/arch/arm/boot/dts/microchip/at91sam9263ek.dts
> >> index a8ea36db4c04..cf5434f9449d 100644
> >> --- a/arch/arm/boot/dts/microchip/at91sam9263ek.dts
> >> +++ b/arch/arm/boot/dts/microchip/at91sam9263ek.dts
> >> @@ -219,13 +219,13 @@ &pioA 21 GPIO_ACTIVE_HIGH
> >>       leds {
> >>               compatible = "gpio-leds";
> >>
> >> -             d3 {
> >> +             led-d3 {
> >>                       label = "d3";
> >>                       gpios = <&pioB 7 GPIO_ACTIVE_HIGH>;
> >>                       linux,default-trigger = "heartbeat";
> >>               };
> >>
> >> -             d2 {
> >> +             led-d2 {
> >>                       label = "d2";
> >>                       gpios = <&pioC 29 GPIO_ACTIVE_LOW>;
> >>                       linux,default-trigger = "nand-disk";
> >> diff --git a/arch/arm/boot/dts/microchip/at91sam9g20ek.dts b/arch/arm/boot/dts/microchip/at91sam9g20ek.dts
> >> index 6de7a7cd3c07..1e62fd371ddb 100644
> >> --- a/arch/arm/boot/dts/microchip/at91sam9g20ek.dts
> >> +++ b/arch/arm/boot/dts/microchip/at91sam9g20ek.dts
> >> @@ -14,13 +14,13 @@ / {
> >>       leds {
> >>               compatible = "gpio-leds";
> >>
> >> -             ds1 {
> >> +             led-ds1 {
> >>                       label = "ds1";
> >>                       gpios = <&pioA 9 GPIO_ACTIVE_HIGH>;
> >>                       linux,default-trigger = "heartbeat";
> >>               };
> >>
> >> -             ds5 {
> >> +             led-ds5 {
> >>                       label = "ds5";
> >>                       gpios = <&pioA 6 GPIO_ACTIVE_LOW>;
> >>               };
> >> --
> >> 2.34.1
> >>
> >>
> 

