Return-Path: <linux-leds+bounces-2355-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FB3F9413A9
	for <lists+linux-leds@lfdr.de>; Tue, 30 Jul 2024 15:53:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BF289281DBD
	for <lists+linux-leds@lfdr.de>; Tue, 30 Jul 2024 13:53:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 166D21A08A9;
	Tue, 30 Jul 2024 13:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thorsis.com header.i=@thorsis.com header.b="oIXmMkeD"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail.thorsis.com (mail.thorsis.com [217.92.40.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73A5E198856;
	Tue, 30 Jul 2024 13:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.92.40.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722347582; cv=none; b=g2nIw/ohVG2DTa1XQ4a/5nfD/ZopuT60o7yVa+81zg2qF67g/f6xcCCbWqWvjkh82EcmCZzUOgryXzW0VCDFrC7NUVtbTiBe+DHAQUSG2Vl8F/NH0t7vQl06n6vrE/1g3ag54yTc1Ct0y4bja65keGY8raeHMF4YvRfr1KFHNyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722347582; c=relaxed/simple;
	bh=qIyOcQsZcyT5YWOcsocqXDlV8I27Gls55oT7rTXEyRk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qitmn78LDsnkfCiVIZj+E/pI0mhWN4NCl/SzN1n/pGe79Y68cnXsTeo8914C813z6dDoi3h7X+9JVKX/XIMcauO9aO8q8EJN5SwGLf/mQGLtsFsWsDnWeT0S5/s6EgcoMNDeLJk5NWT1hVH+prSbcG4PWH2FMblSt8M2wDadRNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=thorsis.com; spf=pass smtp.mailfrom=thorsis.com; dkim=pass (2048-bit key) header.d=thorsis.com header.i=@thorsis.com header.b=oIXmMkeD; arc=none smtp.client-ip=217.92.40.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=thorsis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thorsis.com
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AB0FA14816A2;
	Tue, 30 Jul 2024 15:45:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thorsis.com; s=dkim;
	t=1722347105; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=/fTKcRBjAzVsRyje9tb3MZmm69iEkcK43nYIiGT3dF4=;
	b=oIXmMkeD6jKO0IeS6YRhFOzKwAfwGhX/jWysS21OyZEdD8JRcfM2ak6lTO1vD/YmGV0N2R
	tyU2FkHK2lwgjKOQ1uu8G7dVqt+IOLDXkO2kEdd1QtVDd5Ekk3m0MIy9dawELFgaMXlT54
	13yCEyMhDvXbnRWHEobjDo1aJV0QW1P933Xk1sTDCaNqglP8pKXrpuSVFPXfmgE17Ng01N
	ejhLZtbogcWjQbUaDtdr9laZXosXfNroOl7OrMaRn6BugDj1L14J6ElF6e2Ymm8yLiKk9e
	M5KM/oMraoRU/LMcG04+Rw1LpovfDyot+WJeF5Fw3PvrflyK4ZcVsocgNeQ0tQ==
Date: Tue, 30 Jul 2024 15:44:56 +0200
From: Alexander Dahl <ada@thorsis.com>
To: Andrei Simion <andrei.simion@microchip.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-leds@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: microchip: Rename node, sub-node, and clean up
 spacing
Message-ID: <20240730-rambling-helping-2f03f5ddee6a@thorsis.com>
Mail-Followup-To: Andrei Simion <andrei.simion@microchip.com>,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-leds@vger.kernel.org
References: <20240723131228.189308-1-andrei.simion@microchip.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240723131228.189308-1-andrei.simion@microchip.com>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-Last-TLS-Session-Version: TLSv1.3

Hello Andrei,

Am Tue, Jul 23, 2024 at 04:12:28PM +0300 schrieb Andrei Simion:
> Cosmetic work:
> Rename the eeprom node according to device tree specification.
> Rename the usb node according to device tree specification.
> Rename the led sub nodes according to device tree specification.

You have to be careful here if sysfs file names should stay stable,
see below.

> Rename the pmic node according to the device tree specification.
> Clean up spacing and indentation.
> 
> Signed-off-by: Andrei Simion <andrei.simion@microchip.com>
> ---
> Modifications Based On:
> https://lore.kernel.org/linux-arm-kernel/c4b23da5-10fc-476e-8acc-8ba0815f5def@kernel.org/
> ---
>  arch/arm/boot/dts/microchip/aks-cdu.dts       | 12 +++++-----
>  arch/arm/boot/dts/microchip/animeo_ip.dts     | 10 ++++----
>  .../dts/microchip/at91-cosino_mega2560.dts    |  2 +-
>  arch/arm/boot/dts/microchip/at91-foxg20.dts   |  4 ++--
>  .../arm/boot/dts/microchip/at91-qil_a9260.dts |  4 ++--
>  .../boot/dts/microchip/at91-sam9_l9260.dts    |  2 +-
>  .../arm/boot/dts/microchip/at91-sam9x60ek.dts |  6 ++---
>  .../dts/microchip/at91-sama5d27_som1.dtsi     |  2 +-
>  .../dts/microchip/at91-sama5d27_som1_ek.dts   | 14 +++++------
>  .../dts/microchip/at91-sama5d27_wlsom1.dtsi   |  2 +-
>  .../dts/microchip/at91-sama5d29_curiosity.dts |  2 +-
>  .../boot/dts/microchip/at91-sama5d2_icp.dts   | 10 ++++----
>  .../dts/microchip/at91-sama5d2_ptc_ek.dts     |  8 +++----
>  .../dts/microchip/at91-sama5d2_xplained.dts   |  8 +++----
>  .../dts/microchip/at91-sama5d3_xplained.dts   |  6 ++---
>  .../dts/microchip/at91-sama5d4_ma5d4evk.dts   |  6 ++---
>  .../dts/microchip/at91-sama5d4_xplained.dts   |  6 ++---
>  .../arm/boot/dts/microchip/at91-sama5d4ek.dts |  6 ++---
>  .../arm/boot/dts/microchip/at91-sama7g5ek.dts |  2 +-
>  arch/arm/boot/dts/microchip/at91-vinco.dts    |  6 ++---
>  arch/arm/boot/dts/microchip/at91rm9200.dtsi   |  4 ++--
>  arch/arm/boot/dts/microchip/at91rm9200ek.dts  | 10 ++++----
>  arch/arm/boot/dts/microchip/at91sam9260.dtsi  |  4 ++--
>  arch/arm/boot/dts/microchip/at91sam9260ek.dts | 10 ++++----
>  arch/arm/boot/dts/microchip/at91sam9261.dtsi  |  4 ++--
>  arch/arm/boot/dts/microchip/at91sam9261ek.dts | 10 ++++----
>  arch/arm/boot/dts/microchip/at91sam9263.dtsi  |  4 ++--
>  arch/arm/boot/dts/microchip/at91sam9263ek.dts | 12 +++++-----
>  arch/arm/boot/dts/microchip/at91sam9g20ek.dts |  4 ++--
>  .../boot/dts/microchip/at91sam9g20ek_2mmc.dts |  4 ++--
>  .../dts/microchip/at91sam9g20ek_common.dtsi   |  6 ++---
>  .../at91sam9g25-gardena-smart-gateway.dts     | 24 +++++++++----------
>  arch/arm/boot/dts/microchip/at91sam9g45.dtsi  |  6 ++---
>  .../boot/dts/microchip/at91sam9m10g45ek.dts   |  6 ++---
>  arch/arm/boot/dts/microchip/at91sam9n12.dtsi  |  4 ++--
>  arch/arm/boot/dts/microchip/at91sam9n12ek.dts | 10 ++++----
>  arch/arm/boot/dts/microchip/at91sam9rl.dtsi   |  2 +-
>  arch/arm/boot/dts/microchip/at91sam9rlek.dts  |  2 +-
>  arch/arm/boot/dts/microchip/at91sam9x5.dtsi   |  6 ++---
>  arch/arm/boot/dts/microchip/at91sam9x5cm.dtsi |  4 ++--
>  arch/arm/boot/dts/microchip/ethernut5.dts     |  4 ++--
>  arch/arm/boot/dts/microchip/evk-pro3.dts      |  4 ++--
>  arch/arm/boot/dts/microchip/mpa1600.dts       |  2 +-
>  arch/arm/boot/dts/microchip/pm9g45.dts        |  4 ++--
>  arch/arm/boot/dts/microchip/sam9x60.dtsi      |  6 ++---
>  arch/arm/boot/dts/microchip/sama5d2.dtsi      |  6 ++---
>  arch/arm/boot/dts/microchip/sama5d3.dtsi      |  6 ++---
>  arch/arm/boot/dts/microchip/sama5d34ek.dts    |  2 +-
>  arch/arm/boot/dts/microchip/sama5d3xmb.dtsi   |  6 ++---
>  .../boot/dts/microchip/sama5d3xmb_cmp.dtsi    |  2 +-
>  arch/arm/boot/dts/microchip/sama5d4.dtsi      |  6 ++---
>  arch/arm/boot/dts/microchip/tny_a9263.dts     |  2 +-
>  .../boot/dts/microchip/usb_a9260_common.dtsi  |  4 ++--
>  arch/arm/boot/dts/microchip/usb_a9263.dts     |  4 ++--
>  54 files changed, 156 insertions(+), 156 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/microchip/aks-cdu.dts b/arch/arm/boot/dts/microchip/aks-cdu.dts
> index 742fcf525e1b..cdb8ff27b13c 100644
> --- a/arch/arm/boot/dts/microchip/aks-cdu.dts
> +++ b/arch/arm/boot/dts/microchip/aks-cdu.dts
> @@ -50,13 +50,13 @@ macb0: ethernet@fffc4000 {
>  				status = "okay";
>  			};
>  
> -			usb1: gadget@fffa4000 {
> +			usb1: usb@fffa4000 {
>  				atmel,vbus-gpio = <&pioC 15 GPIO_ACTIVE_HIGH>;
>  				status = "okay";
>  			};
>  		};
>  
> -		usb0: ohci@500000 {
> +		usb0: usb@500000 {
>  			num-ports = <2>;
>  			status = "okay";
>  		};
> @@ -98,23 +98,23 @@ rootfs@500000 {
>  	leds {
>  		compatible = "gpio-leds";
>  
> -		red {
> +		led-0 {
>  			gpios = <&pioC 10 GPIO_ACTIVE_HIGH>;
>  			linux,default-trigger = "none";
>  		};
>  
> -		green {
> +		led-1 {
>  			gpios = <&pioA 5 GPIO_ACTIVE_LOW>;
>  			linux,default-trigger = "none";
>  			default-state = "on";
>  		};
>  
> -		yellow {
> +		led-2 {
>  			gpios = <&pioB 20 GPIO_ACTIVE_LOW>;
>  			linux,default-trigger = "none";
>  		};
>  
> -		blue {
> +		led-3 {
>  			gpios = <&pioB 21 GPIO_ACTIVE_LOW>;
>  			linux,default-trigger = "none";
>  		};

For all these paths would probably change, for example from
/sys/class/leds/blue to /sys/class/leds/led-3 … which might break
userspace depending on these paths.  To keep the old path, an
additional node "label" can be added, see other boards for examples.
Other boards in this patch don't seem to be affected.

Added linux-leds@vger.kernel.org to Cc.

Greets
Alex

> diff --git a/arch/arm/boot/dts/microchip/animeo_ip.dts b/arch/arm/boot/dts/microchip/animeo_ip.dts
> index 29936bfbeeb7..553320ccce89 100644
> --- a/arch/arm/boot/dts/microchip/animeo_ip.dts
> +++ b/arch/arm/boot/dts/microchip/animeo_ip.dts
> @@ -136,7 +136,7 @@ ubi@60000 {
>  			};
>  		};
>  
> -		usb0: ohci@500000 {
> +		usb0: usb@500000 {
>  			num-ports = <2>;
>  			atmel,vbus-gpio = <&pioB 15 GPIO_ACTIVE_LOW>;
>  			status = "okay";
> @@ -146,23 +146,23 @@ usb0: ohci@500000 {
>  	leds {
>  		compatible = "gpio-leds";
>  
> -		power_green {
> +		led-0 {
>  			label = "power_green";
>  			gpios = <&pioC 17 GPIO_ACTIVE_HIGH>;
>  			linux,default-trigger = "heartbeat";
>  		};
>  
> -		power_red {
> +		led-1 {
>  			label = "power_red";
>  			gpios = <&pioA 2 GPIO_ACTIVE_HIGH>;
>  		};
>  
> -		tx_green {
> +		led-2 {
>  			label = "tx_green";
>  			gpios = <&pioC 19 GPIO_ACTIVE_HIGH>;
>  		};
>  
> -		tx_red {
> +		led-3 {
>  			label = "tx_red";
>  			gpios = <&pioC 18 GPIO_ACTIVE_HIGH>;
>  		};
> diff --git a/arch/arm/boot/dts/microchip/at91-cosino_mega2560.dts b/arch/arm/boot/dts/microchip/at91-cosino_mega2560.dts
> index 04cb7bee937d..1279dfb38300 100644
> --- a/arch/arm/boot/dts/microchip/at91-cosino_mega2560.dts
> +++ b/arch/arm/boot/dts/microchip/at91-cosino_mega2560.dts
> @@ -7,7 +7,7 @@
>   *			HCE Engineering
>   *
>   * Derived from at91sam9g35ek.dts by:
> - * 	Copyright (C) 2012 Atmel,
> + *	Copyright (C) 2012 Atmel,
>   *      2012 Nicolas Ferre <nicolas.ferre@atmel.com>
>   */
>  
> diff --git a/arch/arm/boot/dts/microchip/at91-foxg20.dts b/arch/arm/boot/dts/microchip/at91-foxg20.dts
> index 9dfd5de808d1..9ee71fab7ee1 100644
> --- a/arch/arm/boot/dts/microchip/at91-foxg20.dts
> +++ b/arch/arm/boot/dts/microchip/at91-foxg20.dts
> @@ -45,7 +45,7 @@ timer@2 {
>  				};
>  			};
>  
> -			usb1: gadget@fffa4000 {
> +			usb1: usb@fffa4000 {
>  				atmel,vbus-gpio = <&pioC 6 GPIO_ACTIVE_HIGH>;
>  				status = "okay";
>  			};
> @@ -131,7 +131,7 @@ watchdog@fffffd40 {
>  			};
>  		};
>  
> -		usb0: ohci@500000 {
> +		usb0: usb@500000 {
>  			num-ports = <2>;
>  			status = "okay";
>  		};
> diff --git a/arch/arm/boot/dts/microchip/at91-qil_a9260.dts b/arch/arm/boot/dts/microchip/at91-qil_a9260.dts
> index 5ccb3c139592..0088e40a87bd 100644
> --- a/arch/arm/boot/dts/microchip/at91-qil_a9260.dts
> +++ b/arch/arm/boot/dts/microchip/at91-qil_a9260.dts
> @@ -42,7 +42,7 @@ timer@2 {
>  				};
>  			};
>  
> -			usb1: gadget@fffa4000 {
> +			usb1: usb@fffa4000 {
>  				atmel,vbus-gpio = <&pioC 5 GPIO_ACTIVE_HIGH>;
>  				status = "okay";
>  			};
> @@ -114,7 +114,7 @@ shdwc: poweroff@fffffd10 {
>  			};
>  		};
>  
> -		usb0: ohci@500000 {
> +		usb0: usb@500000 {
>  			num-ports = <2>;
>  			status = "okay";
>  		};
> diff --git a/arch/arm/boot/dts/microchip/at91-sam9_l9260.dts b/arch/arm/boot/dts/microchip/at91-sam9_l9260.dts
> index 2fb51b9aca2a..49dc1a4ccb36 100644
> --- a/arch/arm/boot/dts/microchip/at91-sam9_l9260.dts
> +++ b/arch/arm/boot/dts/microchip/at91-sam9_l9260.dts
> @@ -105,7 +105,7 @@ nand0: nand@40000000 {
>  			status = "okay";
>  		};
>  
> -		usb0: ohci@500000 {
> +		usb0: usb@500000 {
>  			status = "okay";
>  		};
>  
> diff --git a/arch/arm/boot/dts/microchip/at91-sam9x60ek.dts b/arch/arm/boot/dts/microchip/at91-sam9x60ek.dts
> index f3cbb675cea4..66b03e32a79a 100644
> --- a/arch/arm/boot/dts/microchip/at91-sam9x60ek.dts
> +++ b/arch/arm/boot/dts/microchip/at91-sam9x60ek.dts
> @@ -53,17 +53,17 @@ leds {
>  		pinctrl-0 = <&pinctrl_gpio_leds>;
>  		status = "okay"; /* Conflict with pwm0. */
>  
> -		red {
> +		led-0 {
>  			label = "red";
>  			gpios = <&pioB 11 GPIO_ACTIVE_HIGH>;
>  		};
>  
> -		green {
> +		led-1 {
>  			label = "green";
>  			gpios = <&pioB 12 GPIO_ACTIVE_HIGH>;
>  		};
>  
> -		blue {
> +		led-2 {
>  			label = "blue";
>  			gpios = <&pioB 13 GPIO_ACTIVE_HIGH>;
>  			linux,default-trigger = "heartbeat";
> diff --git a/arch/arm/boot/dts/microchip/at91-sama5d27_som1.dtsi b/arch/arm/boot/dts/microchip/at91-sama5d27_som1.dtsi
> index 95ecb7d040a8..8ac85dac5a96 100644
> --- a/arch/arm/boot/dts/microchip/at91-sama5d27_som1.dtsi
> +++ b/arch/arm/boot/dts/microchip/at91-sama5d27_som1.dtsi
> @@ -106,7 +106,7 @@ i2c0: i2c@f8028000 {
>  				scl-gpios = <&pioA PIN_PD22 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
>  				status = "okay";
>  
> -				at24@50 {
> +				eeprom@50 {
>  					compatible = "atmel,24c02";
>  					reg = <0x50>;
>  					pagesize = <8>;
> diff --git a/arch/arm/boot/dts/microchip/at91-sama5d27_som1_ek.dts b/arch/arm/boot/dts/microchip/at91-sama5d27_som1_ek.dts
> index f3ffb8f01d8a..ac595ba23f5f 100644
> --- a/arch/arm/boot/dts/microchip/at91-sama5d27_som1_ek.dts
> +++ b/arch/arm/boot/dts/microchip/at91-sama5d27_som1_ek.dts
> @@ -30,14 +30,14 @@ chosen {
>  	};
>  
>  	ahb {
> -		usb0: gadget@300000 {
> +		usb0: usb@300000 {
>  			atmel,vbus-gpio = <&pioA PIN_PD20 GPIO_ACTIVE_HIGH>;
>  			pinctrl-names = "default";
>  			pinctrl-0 = <&pinctrl_usba_vbus>;
>  			status = "okay";
>  		};
>  
> -		usb1: ohci@400000 {
> +		usb1: usb@400000 {
>  			num-ports = <3>;
>  			atmel,vbus-gpio = <0 /* &pioA PIN_PD20 GPIO_ACTIVE_HIGH */
>  					   &pioA PIN_PA27 GPIO_ACTIVE_HIGH
> @@ -48,7 +48,7 @@ &pioA PIN_PA27 GPIO_ACTIVE_HIGH
>  			status = "okay";
>  		};
>  
> -		usb2: ehci@500000 {
> +		usb2: usb@500000 {
>  			status = "okay";
>  		};
>  
> @@ -258,10 +258,10 @@ pinctrl_i2c1_default: i2c1_default {
>  				};
>  
>  				pinctrl_i2c1_gpio: i2c1_gpio {
> -                                        pinmux = <PIN_PD4__GPIO>,
> -                                                 <PIN_PD5__GPIO>;
> -                                        bias-disable;
> -                                };
> +					pinmux = <PIN_PD4__GPIO>,
> +						 <PIN_PD5__GPIO>;
> +					bias-disable;
> +				};
>  
>  
>  				pinctrl_isc_base: isc_base {
> diff --git a/arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1.dtsi b/arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1.dtsi
> index 4617805c7748..2114b2ad9a91 100644
> --- a/arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1.dtsi
> +++ b/arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1.dtsi
> @@ -67,7 +67,7 @@ &i2c1 {
>  	scl-gpios = <&pioA PIN_PD20 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
>  	status = "okay";
>  
> -	mcp16502@5b {
> +	pmic@5b {
>  		compatible = "microchip,mcp16502";
>  		reg = <0x5b>;
>  		status = "okay";
> diff --git a/arch/arm/boot/dts/microchip/at91-sama5d29_curiosity.dts b/arch/arm/boot/dts/microchip/at91-sama5d29_curiosity.dts
> index 6b02b7bcfd49..412cc65472ff 100644
> --- a/arch/arm/boot/dts/microchip/at91-sama5d29_curiosity.dts
> +++ b/arch/arm/boot/dts/microchip/at91-sama5d29_curiosity.dts
> @@ -141,7 +141,7 @@ &i2c0 {
>  	i2c-sda-hold-time-ns = <350>;
>  	status = "okay";
>  
> -	mcp16502@5b {
> +	pmic@5b {
>  		compatible = "microchip,mcp16502";
>  		reg = <0x5b>;
>  		status = "okay";
> diff --git a/arch/arm/boot/dts/microchip/at91-sama5d2_icp.dts b/arch/arm/boot/dts/microchip/at91-sama5d2_icp.dts
> index 999adeca6f33..e4648682c994 100644
> --- a/arch/arm/boot/dts/microchip/at91-sama5d2_icp.dts
> +++ b/arch/arm/boot/dts/microchip/at91-sama5d2_icp.dts
> @@ -187,7 +187,7 @@ i2c6: i2c@600 {
>  		i2c-digital-filter-width-ns = <35>;
>  		status = "okay";
>  
> -		mcp16502@5b {
> +		pmic@5b {
>  			compatible = "microchip,mcp16502";
>  			reg = <0x5b>;
>  			status = "okay";
> @@ -407,10 +407,10 @@ pinctrl_i2c1_default: i2c1_default {
>  	};
>  
>  	pinctrl_i2c1_gpio: i2c1_gpio {
> -                pinmux = <PIN_PD19__GPIO>,
> -                         <PIN_PD20__GPIO>;
> -                bias-disable;
> -        };
> +		pinmux = <PIN_PD19__GPIO>,
> +			 <PIN_PD20__GPIO>;
> +		bias-disable;
> +	};
>  
>  	pinctrl_key_gpio_default: key_gpio_default {
>  		pinmux = <PIN_PD0__GPIO>;
> diff --git a/arch/arm/boot/dts/microchip/at91-sama5d2_ptc_ek.dts b/arch/arm/boot/dts/microchip/at91-sama5d2_ptc_ek.dts
> index 200b20515ab1..0857f4aed939 100644
> --- a/arch/arm/boot/dts/microchip/at91-sama5d2_ptc_ek.dts
> +++ b/arch/arm/boot/dts/microchip/at91-sama5d2_ptc_ek.dts
> @@ -40,14 +40,14 @@ main_xtal {
>  	};
>  
>  	ahb {
> -		usb0: gadget@300000 {
> +		usb0: usb@300000 {
>  			atmel,vbus-gpio = <&pioA PIN_PB11 GPIO_ACTIVE_HIGH>;
>  			pinctrl-names = "default";
>  			pinctrl-0 = <&pinctrl_usba_vbus>;
>  			status = "okay";
>  		};
>  
> -		usb1: ohci@400000 {
> +		usb1: usb@400000 {
>  			num-ports = <3>;
>  			atmel,vbus-gpio = <0
>  					   &pioA PIN_PB12 GPIO_ACTIVE_HIGH
> @@ -58,7 +58,7 @@ &pioA PIN_PB12 GPIO_ACTIVE_HIGH
>  			status = "okay";
>  		};
>  
> -		usb2: ehci@500000 {
> +		usb2: usb@500000 {
>  			status = "okay";
>  		};
>  
> @@ -231,7 +231,7 @@ i2c1: i2c@fc028000 {
>  				scl-gpios = <&pioA PIN_PC7 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
>  				status = "okay";
>  
> -				at24@50 {
> +				eeprom@50 {
>  					compatible = "atmel,24c02";
>  					reg = <0x50>;
>  					pagesize = <8>;
> diff --git a/arch/arm/boot/dts/microchip/at91-sama5d2_xplained.dts b/arch/arm/boot/dts/microchip/at91-sama5d2_xplained.dts
> index 6680031387e8..13cb1c298bd5 100644
> --- a/arch/arm/boot/dts/microchip/at91-sama5d2_xplained.dts
> +++ b/arch/arm/boot/dts/microchip/at91-sama5d2_xplained.dts
> @@ -39,14 +39,14 @@ main_xtal {
>  	};
>  
>  	ahb {
> -		usb0: gadget@300000 {
> +		usb0: usb@300000 {
>  			atmel,vbus-gpio = <&pioA PIN_PA31 GPIO_ACTIVE_HIGH>;
>  			pinctrl-names = "default";
>  			pinctrl-0 = <&pinctrl_usba_vbus>;
>  			status = "okay";
>  		};
>  
> -		usb1: ohci@400000 {
> +		usb1: usb@400000 {
>  			num-ports = <3>;
>  			atmel,vbus-gpio = <0 /* &pioA PIN_PB9 GPIO_ACTIVE_HIGH */
>  					   &pioA PIN_PB10 GPIO_ACTIVE_HIGH
> @@ -57,7 +57,7 @@ &pioA PIN_PB10 GPIO_ACTIVE_HIGH
>  			status = "okay";
>  		};
>  
> -		usb2: ehci@500000 {
> +		usb2: usb@500000 {
>  			status = "okay";
>  		};
>  
> @@ -411,7 +411,7 @@ i2c1: i2c@fc028000 {
>  				scl-gpios = <&pioA PIN_PD5 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
>  				status = "okay";
>  
> -				at24@54 {
> +				eeprom@54 {
>  					compatible = "atmel,24c02";
>  					reg = <0x54>;
>  					pagesize = <16>;
> diff --git a/arch/arm/boot/dts/microchip/at91-sama5d3_xplained.dts b/arch/arm/boot/dts/microchip/at91-sama5d3_xplained.dts
> index 820033727088..c1949d02147f 100644
> --- a/arch/arm/boot/dts/microchip/at91-sama5d3_xplained.dts
> +++ b/arch/arm/boot/dts/microchip/at91-sama5d3_xplained.dts
> @@ -276,14 +276,14 @@ pinctrl_vcc_mmc0_reg_gpio: vcc_mmc0_reg_gpio_default {
>  			};
>  		};
>  
> -		usb0: gadget@500000 {
> +		usb0: usb@500000 {
>  			atmel,vbus-gpio = <&pioE 9 GPIO_ACTIVE_HIGH>;	/* PE9, conflicts with A9 */
>  			pinctrl-names = "default";
>  			pinctrl-0 = <&pinctrl_usba_vbus>;
>  			status = "okay";
>  		};
>  
> -		usb1: ohci@600000 {
> +		usb1: usb@600000 {
>  			num-ports = <3>;
>  			atmel,vbus-gpio = <0
>  					   &pioE 3 GPIO_ACTIVE_LOW
> @@ -294,7 +294,7 @@ &pioE 4 GPIO_ACTIVE_LOW
>  			status = "okay";
>  		};
>  
> -		usb2: ehci@700000 {
> +		usb2: usb@700000 {
>  			status = "okay";
>  		};
>  
> diff --git a/arch/arm/boot/dts/microchip/at91-sama5d4_ma5d4evk.dts b/arch/arm/boot/dts/microchip/at91-sama5d4_ma5d4evk.dts
> index 8adf567f2f0f..2196f05a21c7 100644
> --- a/arch/arm/boot/dts/microchip/at91-sama5d4_ma5d4evk.dts
> +++ b/arch/arm/boot/dts/microchip/at91-sama5d4_ma5d4evk.dts
> @@ -15,14 +15,14 @@ chosen {
>  	};
>  
>  	ahb {
> -		usb0: gadget@400000 {
> +		usb0: usb@400000 {
>  			atmel,vbus-gpio = <&pioE 31 GPIO_ACTIVE_HIGH>;
>  			pinctrl-names = "default";
>  			pinctrl-0 = <&pinctrl_usba_vbus>;
>  			status = "okay";
>  		};
>  
> -		usb1: ohci@500000 {
> +		usb1: usb@500000 {
>  			num-ports = <3>;
>  			atmel,vbus-gpio = <0
>  					   &pioE 11 GPIO_ACTIVE_LOW
> @@ -31,7 +31,7 @@ &pioE 14 GPIO_ACTIVE_LOW
>  			status = "okay";
>  		};
>  
> -		usb2: ehci@600000 {
> +		usb2: usb@600000 {
>  			status = "okay";
>  		};
>  
> diff --git a/arch/arm/boot/dts/microchip/at91-sama5d4_xplained.dts b/arch/arm/boot/dts/microchip/at91-sama5d4_xplained.dts
> index 95d701d13fef..ae6f127bf807 100644
> --- a/arch/arm/boot/dts/microchip/at91-sama5d4_xplained.dts
> +++ b/arch/arm/boot/dts/microchip/at91-sama5d4_xplained.dts
> @@ -157,14 +157,14 @@ pinctrl_vcc_mmc1_reg: vcc_mmc1_reg {
>  			};
>  		};
>  
> -		usb0: gadget@400000 {
> +		usb0: usb@400000 {
>  			atmel,vbus-gpio = <&pioE 31 GPIO_ACTIVE_HIGH>;
>  			pinctrl-names = "default";
>  			pinctrl-0 = <&pinctrl_usba_vbus>;
>  			status = "okay";
>  		};
>  
> -		usb1: ohci@500000 {
> +		usb1: usb@500000 {
>  			num-ports = <3>;
>  			atmel,vbus-gpio = <0
>  					   &pioE 11 GPIO_ACTIVE_HIGH
> @@ -175,7 +175,7 @@ &pioE 14 GPIO_ACTIVE_HIGH
>  			status = "okay";
>  		};
>  
> -		usb2: ehci@600000 {
> +		usb2: usb@600000 {
>  			status = "okay";
>  		};
>  
> diff --git a/arch/arm/boot/dts/microchip/at91-sama5d4ek.dts b/arch/arm/boot/dts/microchip/at91-sama5d4ek.dts
> index 20ac775059ca..819336231d56 100644
> --- a/arch/arm/boot/dts/microchip/at91-sama5d4ek.dts
> +++ b/arch/arm/boot/dts/microchip/at91-sama5d4ek.dts
> @@ -191,14 +191,14 @@ pinctrl_mxt_ts: mxt_irq {
>  			};
>  		};
>  
> -		usb0: gadget@400000 {
> +		usb0: usb@400000 {
>  			atmel,vbus-gpio = <&pioE 31 GPIO_ACTIVE_HIGH>;
>  			pinctrl-names = "default";
>  			pinctrl-0 = <&pinctrl_usba_vbus>;
>  			status = "okay";
>  		};
>  
> -		usb1: ohci@500000 {
> +		usb1: usb@500000 {
>  			num-ports = <3>;
>  			atmel,vbus-gpio = <0 /* &pioE 10 GPIO_ACTIVE_LOW */
>  					   &pioE 11 GPIO_ACTIVE_LOW
> @@ -207,7 +207,7 @@ &pioE 12 GPIO_ACTIVE_LOW
>  			status = "okay";
>  		};
>  
> -		usb2: ehci@600000 {
> +		usb2: usb@600000 {
>  			status = "okay";
>  		};
>  
> diff --git a/arch/arm/boot/dts/microchip/at91-sama7g5ek.dts b/arch/arm/boot/dts/microchip/at91-sama7g5ek.dts
> index 20b2497657ae..3eb22d7f2a46 100644
> --- a/arch/arm/boot/dts/microchip/at91-sama7g5ek.dts
> +++ b/arch/arm/boot/dts/microchip/at91-sama7g5ek.dts
> @@ -236,7 +236,7 @@ i2c1: i2c@600 {
>  		i2c-digital-filter-width-ns = <35>;
>  		status = "okay";
>  
> -		mcp16502@5b {
> +		pmic@5b {
>  			compatible = "microchip,mcp16502";
>  			reg = <0x5b>;
>  			status = "okay";
> diff --git a/arch/arm/boot/dts/microchip/at91-vinco.dts b/arch/arm/boot/dts/microchip/at91-vinco.dts
> index ecbdacf48708..fd087b4c62d6 100644
> --- a/arch/arm/boot/dts/microchip/at91-vinco.dts
> +++ b/arch/arm/boot/dts/microchip/at91-vinco.dts
> @@ -155,14 +155,14 @@ pinctrl_usba_vbus: usba_vbus {
>  			};
>  		};
>  
> -		usb0: gadget@400000 {
> +		usb0: usb@400000 {
>  			atmel,vbus-gpio = <&pioE 31 GPIO_ACTIVE_HIGH>;
>  			pinctrl-names = "default";
>  			pinctrl-0 = <&pinctrl_usba_vbus>;
>  			status = "disabled";
>  		};
>  
> -		usb1: ohci@500000 {
> +		usb1: usb@500000 {
>  			num-ports = <3>;
>  			atmel,vbus-gpio = <0
>  					   &pioE 11 GPIO_ACTIVE_LOW
> @@ -171,7 +171,7 @@ &pioE 12 GPIO_ACTIVE_LOW
>  			status = "disabled";
>  		};
>  
> -		usb2: ehci@600000 {
> +		usb2: usb@600000 {
>  			/* 4G Modem */
>  			status = "okay";
>  		};
> diff --git a/arch/arm/boot/dts/microchip/at91rm9200.dtsi b/arch/arm/boot/dts/microchip/at91rm9200.dtsi
> index 16c675e3a890..0f123308fbe1 100644
> --- a/arch/arm/boot/dts/microchip/at91rm9200.dtsi
> +++ b/arch/arm/boot/dts/microchip/at91rm9200.dtsi
> @@ -662,7 +662,7 @@ usart3: serial@fffcc000 {
>  				status = "disabled";
>  			};
>  
> -			usb1: gadget@fffb0000 {
> +			usb1: usb@fffb0000 {
>  				compatible = "atmel,at91rm9200-udc";
>  				reg = <0xfffb0000 0x4000>;
>  				interrupts = <11 IRQ_TYPE_LEVEL_HIGH 2>;
> @@ -702,7 +702,7 @@ &pioB 1 GPIO_ACTIVE_HIGH
>  			status = "disabled";
>  		};
>  
> -		usb0: ohci@300000 {
> +		usb0: usb@300000 {
>  			compatible = "atmel,at91rm9200-ohci", "usb-ohci";
>  			reg = <0x00300000 0x100000>;
>  			interrupts = <23 IRQ_TYPE_LEVEL_HIGH 2>;
> diff --git a/arch/arm/boot/dts/microchip/at91rm9200ek.dts b/arch/arm/boot/dts/microchip/at91rm9200ek.dts
> index 4624a6f076f8..516a4c313b47 100644
> --- a/arch/arm/boot/dts/microchip/at91rm9200ek.dts
> +++ b/arch/arm/boot/dts/microchip/at91rm9200ek.dts
> @@ -43,7 +43,7 @@ timer@2 {
>  				};
>  			};
>  
> -			usb1: gadget@fffb0000 {
> +			usb1: usb@fffb0000 {
>  				atmel,vbus-gpio = <&pioD 4 GPIO_ACTIVE_HIGH>;
>  				atmel,pullup-gpio = <&pioD 5 GPIO_ACTIVE_HIGH>;
>  				status = "okay";
> @@ -89,7 +89,7 @@ rtc: rtc@fffffe00 {
>  			};
>  		};
>  
> -		usb0: ohci@300000 {
> +		usb0: usb@300000 {
>  			num-ports = <2>;
>  			status = "okay";
>  		};
> @@ -127,19 +127,19 @@ root@350000  {
>  	leds {
>  		compatible = "gpio-leds";
>  
> -		ds2 {
> +		led-ds2 {
>  			label = "green";
>  			gpios = <&pioB 0 GPIO_ACTIVE_LOW>;
>  			linux,default-trigger = "mmc0";
>  		};
>  
> -		ds4 {
> +		led-ds4 {
>  			label = "yellow";
>  			gpios = <&pioB 1 GPIO_ACTIVE_LOW>;
>  			linux,default-trigger = "heartbeat";
>  		};
>  
> -		ds6 {
> +		led-ds6 {
>  			label = "red";
>  			gpios = <&pioB 2 GPIO_ACTIVE_LOW>;
>  		};
> diff --git a/arch/arm/boot/dts/microchip/at91sam9260.dtsi b/arch/arm/boot/dts/microchip/at91sam9260.dtsi
> index e56d5546554c..c57efecad967 100644
> --- a/arch/arm/boot/dts/microchip/at91sam9260.dtsi
> +++ b/arch/arm/boot/dts/microchip/at91sam9260.dtsi
> @@ -637,7 +637,7 @@ macb0: ethernet@fffc4000 {
>  				status = "disabled";
>  			};
>  
> -			usb1: gadget@fffa4000 {
> +			usb1: usb@fffa4000 {
>  				compatible = "atmel,at91sam9260-udc";
>  				reg = <0xfffa4000 0x4000>;
>  				interrupts = <10 IRQ_TYPE_LEVEL_HIGH 2>;
> @@ -742,7 +742,7 @@ gpbr: syscon@fffffd50 {
>  			};
>  		};
>  
> -		usb0: ohci@500000 {
> +		usb0: usb@500000 {
>  			compatible = "atmel,at91rm9200-ohci", "usb-ohci";
>  			reg = <0x00500000 0x100000>;
>  			interrupts = <20 IRQ_TYPE_LEVEL_HIGH 2>;
> diff --git a/arch/arm/boot/dts/microchip/at91sam9260ek.dts b/arch/arm/boot/dts/microchip/at91sam9260ek.dts
> index 720c15472c4a..f24a5497b294 100644
> --- a/arch/arm/boot/dts/microchip/at91sam9260ek.dts
> +++ b/arch/arm/boot/dts/microchip/at91sam9260ek.dts
> @@ -45,7 +45,7 @@ timer@2 {
>  				};
>  			};
>  
> -			usb1: gadget@fffa4000 {
> +			usb1: usb@fffa4000 {
>  				atmel,vbus-gpio = <&pioC 5 GPIO_ACTIVE_HIGH>;
>  				status = "okay";
>  			};
> @@ -131,7 +131,7 @@ gpbr: syscon@fffffd50 {
>  			};
>  		};
>  
> -		usb0: ohci@500000 {
> +		usb0: usb@500000 {
>  			num-ports = <2>;
>  			status = "okay";
>  		};
> @@ -165,7 +165,7 @@ button-4 {
>  	i2c-gpio-0 {
>  		status = "okay";
>  
> -		24c512@50 {
> +		eeprom@50 {
>  			compatible = "atmel,24c512";
>  			reg = <0x50>;
>  		};
> @@ -174,13 +174,13 @@ i2c-gpio-0 {
>  	leds {
>  		compatible = "gpio-leds";
>  
> -		ds1 {
> +		led-ds1 {
>  			label = "ds1";
>  			gpios = <&pioA 9 GPIO_ACTIVE_HIGH>;
>  			linux,default-trigger = "heartbeat";
>  		};
>  
> -		ds5 {
> +		led-ds5 {
>  			label = "ds5";
>  			gpios = <&pioA 6 GPIO_ACTIVE_LOW>;
>  		};
> diff --git a/arch/arm/boot/dts/microchip/at91sam9261.dtsi b/arch/arm/boot/dts/microchip/at91sam9261.dtsi
> index 307b60658014..47977ef49428 100644
> --- a/arch/arm/boot/dts/microchip/at91sam9261.dtsi
> +++ b/arch/arm/boot/dts/microchip/at91sam9261.dtsi
> @@ -77,7 +77,7 @@ ahb {
>  		#size-cells = <1>;
>  		ranges;
>  
> -		usb0: ohci@500000 {
> +		usb0: usb@500000 {
>  			compatible = "atmel,at91rm9200-ohci", "usb-ohci";
>  			reg = <0x00500000 0x100000>;
>  			interrupts = <20 IRQ_TYPE_LEVEL_HIGH 2>;
> @@ -142,7 +142,7 @@ tcb0: timer@fffa0000 {
>  				clock-names = "t0_clk", "t1_clk", "t2_clk", "slow_clk";
>  			};
>  
> -			usb1: gadget@fffa4000 {
> +			usb1: usb@fffa4000 {
>  				compatible = "atmel,at91sam9261-udc";
>  				reg = <0xfffa4000 0x4000>;
>  				interrupts = <10 IRQ_TYPE_LEVEL_HIGH 2>;
> diff --git a/arch/arm/boot/dts/microchip/at91sam9261ek.dts b/arch/arm/boot/dts/microchip/at91sam9261ek.dts
> index 045cb253f23a..2f2ee43a2336 100644
> --- a/arch/arm/boot/dts/microchip/at91sam9261ek.dts
> +++ b/arch/arm/boot/dts/microchip/at91sam9261ek.dts
> @@ -31,7 +31,7 @@ main_xtal {
>  	};
>  
>  	ahb {
> -		usb0: ohci@500000 {
> +		usb0: usb@500000 {
>  			status = "okay";
>  		};
>  
> @@ -136,7 +136,7 @@ timer1: timer@2 {
>  				};
>  			};
>  
> -			usb1: gadget@fffa4000 {
> +			usb1: usb@fffa4000 {
>  				atmel,vbus-gpio = <&pioB 29 GPIO_ACTIVE_HIGH>;
>  				status = "okay";
>  			};
> @@ -192,19 +192,19 @@ watchdog@fffffd40 {
>  	leds {
>  		compatible = "gpio-leds";
>  
> -		ds8 {
> +		led-ds8 {
>  			label = "ds8";
>  			gpios = <&pioA 13 GPIO_ACTIVE_LOW>;
>  			linux,default-trigger = "none";
>  		};
>  
> -		ds7 {
> +		led-ds7 {
>  			label = "ds7";
>  			gpios = <&pioA 14 GPIO_ACTIVE_LOW>;
>  			linux,default-trigger = "nand-disk";
>  		};
>  
> -		ds1 {
> +		led-ds1 {
>  			label = "ds1";
>  			gpios = <&pioA 23 GPIO_ACTIVE_LOW>;
>  			linux,default-trigger = "heartbeat";
> diff --git a/arch/arm/boot/dts/microchip/at91sam9263.dtsi b/arch/arm/boot/dts/microchip/at91sam9263.dtsi
> index 75d8ff2d12c8..030c5c9c8b3c 100644
> --- a/arch/arm/boot/dts/microchip/at91sam9263.dtsi
> +++ b/arch/arm/boot/dts/microchip/at91sam9263.dtsi
> @@ -636,7 +636,7 @@ macb0: ethernet@fffbc000 {
>  				status = "disabled";
>  			};
>  
> -			usb1: gadget@fff78000 {
> +			usb1: usb@fff78000 {
>  				compatible = "atmel,at91sam9263-udc";
>  				reg = <0xfff78000 0x4000>;
>  				interrupts = <24 IRQ_TYPE_LEVEL_HIGH 2>;
> @@ -768,7 +768,7 @@ fb0: fb@700000 {
>  			status = "disabled";
>  		};
>  
> -		usb0: ohci@a00000 {
> +		usb0: usb@a00000 {
>  			compatible = "atmel,at91rm9200-ohci", "usb-ohci";
>  			reg = <0x00a00000 0x100000>;
>  			interrupts = <29 IRQ_TYPE_LEVEL_HIGH 2>;
> diff --git a/arch/arm/boot/dts/microchip/at91sam9263ek.dts b/arch/arm/boot/dts/microchip/at91sam9263ek.dts
> index ce8baff6a9f4..812ad757e4ea 100644
> --- a/arch/arm/boot/dts/microchip/at91sam9263ek.dts
> +++ b/arch/arm/boot/dts/microchip/at91sam9263ek.dts
> @@ -61,7 +61,7 @@ macb0: ethernet@fffbc000 {
>  				status = "okay";
>  			};
>  
> -			usb1: gadget@fff78000 {
> +			usb1: usb@fff78000 {
>  				atmel,vbus-gpio = <&pioA 25 GPIO_ACTIVE_HIGH>;
>  				status = "okay";
>  			};
> @@ -86,7 +86,7 @@ pinctrl@fffff200 {
>  				mmc0 {
>  					pinctrl_board_mmc0: mmc0-board {
>  						atmel,pins =
> -							<AT91_PIOE 18 AT91_PERIPH_GPIO AT91_PINCTRL_PULL_UP_DEGLITCH 	/* PE18 gpio CD pin pull up and deglitch */
> +							<AT91_PIOE 18 AT91_PERIPH_GPIO AT91_PINCTRL_PULL_UP_DEGLITCH	/* PE18 gpio CD pin pull up and deglitch */
>  							 AT91_PIOE 19 AT91_PERIPH_GPIO AT91_PINCTRL_PULL_UP>;	/* PE19 gpio WP pin pull up */
>  					};
>  				};
> @@ -207,7 +207,7 @@ data@7ca0000 {
>  			};
>  		};
>  
> -		usb0: ohci@a00000 {
> +		usb0: usb@a00000 {
>  			num-ports = <2>;
>  			status = "okay";
>  			atmel,vbus-gpio = <&pioA 24 GPIO_ACTIVE_HIGH
> @@ -219,13 +219,13 @@ &pioA 21 GPIO_ACTIVE_HIGH
>  	leds {
>  		compatible = "gpio-leds";
>  
> -		d3 {
> +		led-d3 {
>  			label = "d3";
>  			gpios = <&pioB 7 GPIO_ACTIVE_HIGH>;
>  			linux,default-trigger = "heartbeat";
>  		};
>  
> -		d2 {
> +		led-d2 {
>  			label = "d2";
>  			gpios = <&pioC 29 GPIO_ACTIVE_LOW>;
>  			linux,default-trigger = "nand-disk";
> @@ -253,7 +253,7 @@ button-right-click {
>  	i2c-gpio-0 {
>  		status = "okay";
>  
> -		24c512@50 {
> +		eeprom@50 {
>  			compatible = "atmel,24c512";
>  			reg = <0x50>;
>  			pagesize = <128>;
> diff --git a/arch/arm/boot/dts/microchip/at91sam9g20ek.dts b/arch/arm/boot/dts/microchip/at91sam9g20ek.dts
> index 6de7a7cd3c07..1e62fd371ddb 100644
> --- a/arch/arm/boot/dts/microchip/at91sam9g20ek.dts
> +++ b/arch/arm/boot/dts/microchip/at91sam9g20ek.dts
> @@ -14,13 +14,13 @@ / {
>  	leds {
>  		compatible = "gpio-leds";
>  
> -		ds1 {
> +		led-ds1 {
>  			label = "ds1";
>  			gpios = <&pioA 9 GPIO_ACTIVE_HIGH>;
>  			linux,default-trigger = "heartbeat";
>  		};
>  
> -		ds5 {
> +		led-ds5 {
>  			label = "ds5";
>  			gpios = <&pioA 6 GPIO_ACTIVE_LOW>;
>  		};
> diff --git a/arch/arm/boot/dts/microchip/at91sam9g20ek_2mmc.dts b/arch/arm/boot/dts/microchip/at91sam9g20ek_2mmc.dts
> index 172af6ff4b18..3e5eab57d1a5 100644
> --- a/arch/arm/boot/dts/microchip/at91sam9g20ek_2mmc.dts
> +++ b/arch/arm/boot/dts/microchip/at91sam9g20ek_2mmc.dts
> @@ -40,13 +40,13 @@ pinctrl_board_mmc0_slot0: mmc0_slot0-board {
>  	leds {
>  		compatible = "gpio-leds";
>  
> -		ds1 {
> +		led-ds1 {
>  			label = "ds1";
>  			gpios = <&pioB 9 GPIO_ACTIVE_HIGH>;
>  			linux,default-trigger = "heartbeat";
>  		};
>  
> -		ds5 {
> +		led-ds5 {
>  			label = "ds5";
>  			gpios = <&pioB 8 GPIO_ACTIVE_LOW>;
>  		};
> diff --git a/arch/arm/boot/dts/microchip/at91sam9g20ek_common.dtsi b/arch/arm/boot/dts/microchip/at91sam9g20ek_common.dtsi
> index 565b99e79c52..e969f50257b5 100644
> --- a/arch/arm/boot/dts/microchip/at91sam9g20ek_common.dtsi
> +++ b/arch/arm/boot/dts/microchip/at91sam9g20ek_common.dtsi
> @@ -90,7 +90,7 @@ macb0: ethernet@fffc4000 {
>  				status = "okay";
>  			};
>  
> -			usb1: gadget@fffa4000 {
> +			usb1: usb@fffa4000 {
>  				pinctrl-0 = <&pinctrl_usb1_vbus_gpio>;
>  				pinctrl-names = "default";
>  				atmel,vbus-gpio = <&pioC 5 GPIO_ACTIVE_HIGH>;
> @@ -211,7 +211,7 @@ data@7ca0000 {
>  			};
>  		};
>  
> -		usb0: ohci@500000 {
> +		usb0: usb@500000 {
>  			num-ports = <2>;
>  			status = "okay";
>  		};
> @@ -220,7 +220,7 @@ usb0: ohci@500000 {
>  	i2c-gpio-0 {
>  		status = "okay";
>  
> -		24c512@50 {
> +		eeprom@50 {
>  			compatible = "atmel,24c512";
>  			reg = <0x50>;
>  			vcc-supply = <&reg_3v3>;
> diff --git a/arch/arm/boot/dts/microchip/at91sam9g25-gardena-smart-gateway.dts b/arch/arm/boot/dts/microchip/at91sam9g25-gardena-smart-gateway.dts
> index af70eb8a3a02..60560e4c1696 100644
> --- a/arch/arm/boot/dts/microchip/at91sam9g25-gardena-smart-gateway.dts
> +++ b/arch/arm/boot/dts/microchip/at91sam9g25-gardena-smart-gateway.dts
> @@ -37,71 +37,71 @@ button {
>  	leds {
>  		compatible = "gpio-leds";
>  
> -		power_blue {
> +		led-0 {
>  			label = "smartgw:power:blue";
>  			gpios = <&pioC 21 GPIO_ACTIVE_HIGH>;
>  			default-state = "off";
>  		};
>  
> -		power_green {
> +		led-1 {
>  			label = "smartgw:power:green";
>  			gpios = <&pioC 20 GPIO_ACTIVE_HIGH>;
>  			default-state = "on";
>  		};
>  
> -		power_red {
> +		led-2 {
>  			label = "smartgw:power:red";
>  			gpios = <&pioC 19 GPIO_ACTIVE_HIGH>;
>  			default-state = "off";
>  		};
>  
> -		radio_blue {
> +		led-3 {
>  			label = "smartgw:radio:blue";
>  			gpios = <&pioC 18 GPIO_ACTIVE_HIGH>;
>  			default-state = "off";
>  		};
>  
> -		radio_green {
> +		led-4 {
>  			label = "smartgw:radio:green";
>  			gpios = <&pioC 17 GPIO_ACTIVE_HIGH>;
>  			default-state = "off";
>  		};
>  
> -		radio_red {
> +		led-5 {
>  			label = "smartgw:radio:red";
>  			gpios = <&pioC 16 GPIO_ACTIVE_HIGH>;
>  			default-state = "off";
>  		};
>  
> -		internet_blue {
> +		led-6 {
>  			label = "smartgw:internet:blue";
>  			gpios = <&pioC 15 GPIO_ACTIVE_HIGH>;
>  			default-state = "off";
>  		};
>  
> -		internet_green {
> +		led-7 {
>  			label = "smartgw:internet:green";
>  			gpios = <&pioC 14 GPIO_ACTIVE_HIGH>;
>  			default-state = "off";
>  		};
>  
> -		internet_red {
> +		led-8 {
>  			label = "smartgw:internet:red";
>  			gpios = <&pioC 13 GPIO_ACTIVE_HIGH>;
>  			default-state = "off";
>  		};
>  
> -		heartbeat {
> +		led-9 {
>  			label = "smartgw:heartbeat";
>  			gpios = <&pioB 8 GPIO_ACTIVE_HIGH>;
>  			linux,default-trigger = "heartbeat";
>  		};
>  
> -		pb18 {
> +		led-pb18 {
>  			status = "disabled";
>  		};
>  
> -		pd21 {
> +		led-pd21 {
>  			status = "disabled";
>  		};
>  	};
> diff --git a/arch/arm/boot/dts/microchip/at91sam9g45.dtsi b/arch/arm/boot/dts/microchip/at91sam9g45.dtsi
> index 325c63a53118..56cca6035c79 100644
> --- a/arch/arm/boot/dts/microchip/at91sam9g45.dtsi
> +++ b/arch/arm/boot/dts/microchip/at91sam9g45.dtsi
> @@ -913,7 +913,7 @@ spi1: spi@fffa8000 {
>  				status = "disabled";
>  			};
>  
> -			usb2: gadget@fff78000 {
> +			usb2: usb@fff78000 {
>  				compatible = "atmel,at91sam9g45-udc";
>  				reg = <0x00600000 0x80000
>  				       0xfff78000 0x400>;
> @@ -964,7 +964,7 @@ fb0: fb@500000 {
>  			status = "disabled";
>  		};
>  
> -		usb0: ohci@700000 {
> +		usb0: usb@700000 {
>  			compatible = "atmel,at91rm9200-ohci", "usb-ohci";
>  			reg = <0x00700000 0x100000>;
>  			interrupts = <22 IRQ_TYPE_LEVEL_HIGH 2>;
> @@ -973,7 +973,7 @@ usb0: ohci@700000 {
>  			status = "disabled";
>  		};
>  
> -		usb1: ehci@800000 {
> +		usb1: usb@800000 {
>  			compatible = "atmel,at91sam9g45-ehci", "usb-ehci";
>  			reg = <0x00800000 0x100000>;
>  			interrupts = <22 IRQ_TYPE_LEVEL_HIGH 2>;
> diff --git a/arch/arm/boot/dts/microchip/at91sam9m10g45ek.dts b/arch/arm/boot/dts/microchip/at91sam9m10g45ek.dts
> index 071db4f16313..63150cc61b5f 100644
> --- a/arch/arm/boot/dts/microchip/at91sam9m10g45ek.dts
> +++ b/arch/arm/boot/dts/microchip/at91sam9m10g45ek.dts
> @@ -174,7 +174,7 @@ flash@0 {
>  				};
>  			};
>  
> -			usb2: gadget@fff78000 {
> +			usb2: usb@fff78000 {
>  				atmel,vbus-gpio = <&pioB 19 GPIO_ACTIVE_HIGH>;
>  				status = "okay";
>  			};
> @@ -303,14 +303,14 @@ data@4000000 {
>  			};
>  		};
>  
> -		usb0: ohci@700000 {
> +		usb0: usb@700000 {
>  			status = "okay";
>  			num-ports = <2>;
>  			atmel,vbus-gpio = <&pioD 1 GPIO_ACTIVE_LOW
>  					   &pioD 3 GPIO_ACTIVE_LOW>;
>  		};
>  
> -		usb1: ehci@800000 {
> +		usb1: usb@800000 {
>  			status = "okay";
>  		};
>  	};
> diff --git a/arch/arm/boot/dts/microchip/at91sam9n12.dtsi b/arch/arm/boot/dts/microchip/at91sam9n12.dtsi
> index 8dc04e9031a6..7f69be02b27a 100644
> --- a/arch/arm/boot/dts/microchip/at91sam9n12.dtsi
> +++ b/arch/arm/boot/dts/microchip/at91sam9n12.dtsi
> @@ -738,7 +738,7 @@ pwm0: pwm@f8034000 {
>  				status = "disabled";
>  			};
>  
> -			usb1: gadget@f803c000 {
> +			usb1: usb@f803c000 {
>  				compatible = "atmel,at91sam9260-udc";
>  				reg = <0xf803c000 0x4000>;
>  				interrupts = <23 IRQ_TYPE_LEVEL_HIGH 2>;
> @@ -748,7 +748,7 @@ usb1: gadget@f803c000 {
>  			};
>  		};
>  
> -		usb0: ohci@500000 {
> +		usb0: usb@500000 {
>  			compatible = "atmel,at91rm9200-ohci", "usb-ohci";
>  			reg = <0x00500000 0x00100000>;
>  			interrupts = <22 IRQ_TYPE_LEVEL_HIGH 2>;
> diff --git a/arch/arm/boot/dts/microchip/at91sam9n12ek.dts b/arch/arm/boot/dts/microchip/at91sam9n12ek.dts
> index 4c644d4c6be7..ce165f198c74 100644
> --- a/arch/arm/boot/dts/microchip/at91sam9n12ek.dts
> +++ b/arch/arm/boot/dts/microchip/at91sam9n12ek.dts
> @@ -142,7 +142,7 @@ hlcdc_panel_output: endpoint@0 {
>  				};
>  			};
>  
> -			usb1: gadget@f803c000 {
> +			usb1: usb@f803c000 {
>  				pinctrl-names = "default";
>  				pinctrl-0 = <&pinctrl_usb1_vbus_sense>;
>  				atmel,vbus-gpio = <&pioB 16 GPIO_ACTIVE_HIGH>;
> @@ -180,7 +180,7 @@ nand@3 {
>  			};
>  		};
>  
> -		usb0: ohci@500000 {
> +		usb0: usb@500000 {
>  			num-ports = <1>;
>  			atmel,vbus-gpio = <&pioB 7 GPIO_ACTIVE_LOW>;
>  			status = "okay";
> @@ -207,19 +207,19 @@ bl_reg: backlight_regulator {
>  	leds {
>  		compatible = "gpio-leds";
>  
> -		d8 {
> +		led-d8 {
>  			label = "d8";
>  			gpios = <&pioB 4 GPIO_ACTIVE_LOW>;
>  			linux,default-trigger = "mmc0";
>  		};
>  
> -		d9 {
> +		led-d9 {
>  			label = "d9";
>  			gpios = <&pioB 5 GPIO_ACTIVE_LOW>;
>  			linux,default-trigger = "nand-disk";
>  		};
>  
> -		d10 {
> +		led-d10 {
>  			label = "d10";
>  			gpios = <&pioB 6 GPIO_ACTIVE_HIGH>;
>  			linux,default-trigger = "heartbeat";
> diff --git a/arch/arm/boot/dts/microchip/at91sam9rl.dtsi b/arch/arm/boot/dts/microchip/at91sam9rl.dtsi
> index 7436b5c862b1..c7e70c0438ec 100644
> --- a/arch/arm/boot/dts/microchip/at91sam9rl.dtsi
> +++ b/arch/arm/boot/dts/microchip/at91sam9rl.dtsi
> @@ -282,7 +282,7 @@ adc0: adc@fffd0000 {
>  				atmel,adc-startup-time = <40>;
>  			};
>  
> -			usb0: gadget@fffd4000 {
> +			usb0: usb@fffd4000 {
>  				compatible = "atmel,at91sam9rl-udc";
>  				reg = <0x00600000 0x100000>,
>  				      <0xfffd4000 0x4000>;
> diff --git a/arch/arm/boot/dts/microchip/at91sam9rlek.dts b/arch/arm/boot/dts/microchip/at91sam9rlek.dts
> index a57351270551..252af64ff8ac 100644
> --- a/arch/arm/boot/dts/microchip/at91sam9rlek.dts
> +++ b/arch/arm/boot/dts/microchip/at91sam9rlek.dts
> @@ -172,7 +172,7 @@ &pinctrl_adc0_ad5
>  				status = "okay";
>  			};
>  
> -			usb0: gadget@fffd4000 {
> +			usb0: usb@fffd4000 {
>  				atmel,vbus-gpio = <&pioA 8 GPIO_ACTIVE_HIGH>;
>  				status = "okay";
>  			};
> diff --git a/arch/arm/boot/dts/microchip/at91sam9x5.dtsi b/arch/arm/boot/dts/microchip/at91sam9x5.dtsi
> index a7456c2191fa..30914ac4174b 100644
> --- a/arch/arm/boot/dts/microchip/at91sam9x5.dtsi
> +++ b/arch/arm/boot/dts/microchip/at91sam9x5.dtsi
> @@ -847,7 +847,7 @@ spi1: spi@f0004000 {
>  				status = "disabled";
>  			};
>  
> -			usb2: gadget@f803c000 {
> +			usb2: usb@f803c000 {
>  				compatible = "atmel,at91sam9g45-udc";
>  				reg = <0x00500000 0x80000
>  				       0xf803c000 0x400>;
> @@ -886,7 +886,7 @@ pwm0: pwm@f8034000 {
>  			};
>  		};
>  
> -		usb0: ohci@600000 {
> +		usb0: usb@600000 {
>  			compatible = "atmel,at91rm9200-ohci", "usb-ohci";
>  			reg = <0x00600000 0x100000>;
>  			interrupts = <22 IRQ_TYPE_LEVEL_HIGH 2>;
> @@ -895,7 +895,7 @@ usb0: ohci@600000 {
>  			status = "disabled";
>  		};
>  
> -		usb1: ehci@700000 {
> +		usb1: usb@700000 {
>  			compatible = "atmel,at91sam9g45-ehci", "usb-ehci";
>  			reg = <0x00700000 0x100000>;
>  			interrupts = <22 IRQ_TYPE_LEVEL_HIGH 2>;
> diff --git a/arch/arm/boot/dts/microchip/at91sam9x5cm.dtsi b/arch/arm/boot/dts/microchip/at91sam9x5cm.dtsi
> index cdd37f67280b..fb3c19bdfcb6 100644
> --- a/arch/arm/boot/dts/microchip/at91sam9x5cm.dtsi
> +++ b/arch/arm/boot/dts/microchip/at91sam9x5cm.dtsi
> @@ -120,13 +120,13 @@ rootfs@800000 {
>  	leds {
>  		compatible = "gpio-leds";
>  
> -		pb18 {
> +		led-pb18 {
>  			label = "pb18";
>  			gpios = <&pioB 18 GPIO_ACTIVE_LOW>;
>  			linux,default-trigger = "heartbeat";
>  		};
>  
> -		pd21 {
> +		led-pd21 {
>  			label = "pd21";
>  			gpios = <&pioD 21 GPIO_ACTIVE_HIGH>;
>  		};
> diff --git a/arch/arm/boot/dts/microchip/ethernut5.dts b/arch/arm/boot/dts/microchip/ethernut5.dts
> index ad7a0850252a..c5273c52bca3 100644
> --- a/arch/arm/boot/dts/microchip/ethernut5.dts
> +++ b/arch/arm/boot/dts/microchip/ethernut5.dts
> @@ -60,7 +60,7 @@ macb0: ethernet@fffc4000 {
>  				status = "okay";
>  			};
>  
> -			usb1: gadget@fffa4000 {
> +			usb1: usb@fffa4000 {
>  				atmel,vbus-gpio = <&pioC 5 GPIO_ACTIVE_HIGH>;
>  				status = "okay";
>  			};
> @@ -101,7 +101,7 @@ data@20000 {
>  			};
>  		};
>  
> -		usb0: ohci@500000 {
> +		usb0: usb@500000 {
>  			num-ports = <2>;
>  			status = "okay";
>  		};
> diff --git a/arch/arm/boot/dts/microchip/evk-pro3.dts b/arch/arm/boot/dts/microchip/evk-pro3.dts
> index 6d519d02d190..d4fd28da6d20 100644
> --- a/arch/arm/boot/dts/microchip/evk-pro3.dts
> +++ b/arch/arm/boot/dts/microchip/evk-pro3.dts
> @@ -35,7 +35,7 @@ usart2: serial@fffb8000 {
>  				status = "okay";
>  			};
>  
> -			usb1: gadget@fffa4000 {
> +			usb1: usb@fffa4000 {
>  				atmel,vbus-gpio = <&pioC 5 GPIO_ACTIVE_HIGH>;
>  				status = "okay";
>  			};
> @@ -45,7 +45,7 @@ watchdog@fffffd40 {
>  			};
>  		};
>  
> -		usb0: ohci@500000 {
> +		usb0: usb@500000 {
>  			num-ports = <2>;
>  			status = "okay";
>  		};
> diff --git a/arch/arm/boot/dts/microchip/mpa1600.dts b/arch/arm/boot/dts/microchip/mpa1600.dts
> index 005c2758e229..2a97e2c0b894 100644
> --- a/arch/arm/boot/dts/microchip/mpa1600.dts
> +++ b/arch/arm/boot/dts/microchip/mpa1600.dts
> @@ -57,7 +57,7 @@ ssc1: ssc@fffd4000 {
>  			};
>  		};
>  
> -		usb0: ohci@300000 {
> +		usb0: usb@300000 {
>  			num-ports = <1>;
>  			status = "okay";
>  		};
> diff --git a/arch/arm/boot/dts/microchip/pm9g45.dts b/arch/arm/boot/dts/microchip/pm9g45.dts
> index c349fd3758a6..2258e62f5864 100644
> --- a/arch/arm/boot/dts/microchip/pm9g45.dts
> +++ b/arch/arm/boot/dts/microchip/pm9g45.dts
> @@ -139,12 +139,12 @@ data@900000 {
>  			};
>  		};
>  
> -		usb0: ohci@700000 {
> +		usb0: usb@700000 {
>  			status = "okay";
>  			num-ports = <2>;
>  		};
>  
> -		usb1: ehci@800000 {
> +		usb1: usb@800000 {
>  			status = "okay";
>  		};
>  	};
> diff --git a/arch/arm/boot/dts/microchip/sam9x60.dtsi b/arch/arm/boot/dts/microchip/sam9x60.dtsi
> index 291540e5d81e..3471d8245fb5 100644
> --- a/arch/arm/boot/dts/microchip/sam9x60.dtsi
> +++ b/arch/arm/boot/dts/microchip/sam9x60.dtsi
> @@ -74,7 +74,7 @@ ahb {
>  		#size-cells = <1>;
>  		ranges;
>  
> -		usb0: gadget@500000 {
> +		usb0: usb@500000 {
>  			#address-cells = <1>;
>  			#size-cells = <0>;
>  			compatible = "microchip,sam9x60-udc";
> @@ -88,7 +88,7 @@ usb0: gadget@500000 {
>  			status = "disabled";
>  		};
>  
> -		usb1: ohci@600000 {
> +		usb1: usb@600000 {
>  			compatible = "atmel,at91rm9200-ohci", "usb-ohci";
>  			reg = <0x00600000 0x100000>;
>  			interrupts = <22 IRQ_TYPE_LEVEL_HIGH 2>;
> @@ -97,7 +97,7 @@ usb1: ohci@600000 {
>  			status = "disabled";
>  		};
>  
> -		usb2: ehci@700000 {
> +		usb2: usb@700000 {
>  			compatible = "atmel,at91sam9g45-ehci", "usb-ehci";
>  			reg = <0x00700000 0x100000>;
>  			interrupts = <22 IRQ_TYPE_LEVEL_HIGH 2>;
> diff --git a/arch/arm/boot/dts/microchip/sama5d2.dtsi b/arch/arm/boot/dts/microchip/sama5d2.dtsi
> index 5f8e297e19ed..6757eb8fbaa6 100644
> --- a/arch/arm/boot/dts/microchip/sama5d2.dtsi
> +++ b/arch/arm/boot/dts/microchip/sama5d2.dtsi
> @@ -126,7 +126,7 @@ nfc_sram: sram@100000 {
>  
>  		};
>  
> -		usb0: gadget@300000 {
> +		usb0: usb@300000 {
>  			compatible = "atmel,sama5d3-udc";
>  			reg = <0x00300000 0x100000
>  			       0xfc02c000 0x400>;
> @@ -136,7 +136,7 @@ usb0: gadget@300000 {
>  			status = "disabled";
>  		};
>  
> -		usb1: ohci@400000 {
> +		usb1: usb@400000 {
>  			compatible = "atmel,at91rm9200-ohci", "usb-ohci";
>  			reg = <0x00400000 0x100000>;
>  			interrupts = <41 IRQ_TYPE_LEVEL_HIGH 2>;
> @@ -145,7 +145,7 @@ usb1: ohci@400000 {
>  			status = "disabled";
>  		};
>  
> -		usb2: ehci@500000 {
> +		usb2: usb@500000 {
>  			compatible = "atmel,at91sam9g45-ehci", "usb-ehci";
>  			reg = <0x00500000 0x100000>;
>  			interrupts = <41 IRQ_TYPE_LEVEL_HIGH 2>;
> diff --git a/arch/arm/boot/dts/microchip/sama5d3.dtsi b/arch/arm/boot/dts/microchip/sama5d3.dtsi
> index d4fc0c1dfc10..37acbbcbe5f6 100644
> --- a/arch/arm/boot/dts/microchip/sama5d3.dtsi
> +++ b/arch/arm/boot/dts/microchip/sama5d3.dtsi
> @@ -1064,7 +1064,7 @@ nfc_sram: sram@200000 {
>  			ranges = <0 0x200000 0x2400>;
>  		};
>  
> -		usb0: gadget@500000 {
> +		usb0: usb@500000 {
>  			compatible = "atmel,sama5d3-udc";
>  			reg = <0x00500000 0x100000
>  			       0xf8030000 0x4000>;
> @@ -1074,7 +1074,7 @@ usb0: gadget@500000 {
>  			status = "disabled";
>  		};
>  
> -		usb1: ohci@600000 {
> +		usb1: usb@600000 {
>  			compatible = "atmel,at91rm9200-ohci", "usb-ohci";
>  			reg = <0x00600000 0x100000>;
>  			interrupts = <32 IRQ_TYPE_LEVEL_HIGH 2>;
> @@ -1083,7 +1083,7 @@ usb1: ohci@600000 {
>  			status = "disabled";
>  		};
>  
> -		usb2: ehci@700000 {
> +		usb2: usb@700000 {
>  			compatible = "atmel,at91sam9g45-ehci", "usb-ehci";
>  			reg = <0x00700000 0x100000>;
>  			interrupts = <32 IRQ_TYPE_LEVEL_HIGH 2>;
> diff --git a/arch/arm/boot/dts/microchip/sama5d34ek.dts b/arch/arm/boot/dts/microchip/sama5d34ek.dts
> index bffd61397cb5..18943b873fff 100644
> --- a/arch/arm/boot/dts/microchip/sama5d34ek.dts
> +++ b/arch/arm/boot/dts/microchip/sama5d34ek.dts
> @@ -36,7 +36,7 @@ i2c0: i2c@f0014000 {
>  			i2c1: i2c@f0018000 {
>  				status = "okay";
>  
> -				24c256@50 {
> +				eeprom@50 {
>  					compatible = "atmel,24c256";
>  					reg = <0x50>;
>  					pagesize = <64>;
> diff --git a/arch/arm/boot/dts/microchip/sama5d3xmb.dtsi b/arch/arm/boot/dts/microchip/sama5d3xmb.dtsi
> index 3652c9e24124..1212a8df0c0a 100644
> --- a/arch/arm/boot/dts/microchip/sama5d3xmb.dtsi
> +++ b/arch/arm/boot/dts/microchip/sama5d3xmb.dtsi
> @@ -165,14 +165,14 @@ watchdog@fffffe40 {
>  			};
>  		};
>  
> -		usb0: gadget@500000 {
> +		usb0: usb@500000 {
>  			atmel,vbus-gpio = <&pioD 29 GPIO_ACTIVE_HIGH>;
>  			pinctrl-names = "default";
>  			pinctrl-0 = <&pinctrl_usba_vbus>;
>  			status = "okay";
>  		};
>  
> -		usb1: ohci@600000 {
> +		usb1: usb@600000 {
>  			num-ports = <3>;
>  			atmel,vbus-gpio = <&pioD 25 GPIO_ACTIVE_HIGH
>  					   &pioD 26 GPIO_ACTIVE_LOW
> @@ -181,7 +181,7 @@ &pioD 27 GPIO_ACTIVE_LOW
>  			status = "okay";
>  		};
>  
> -		usb2: ehci@700000 {
> +		usb2: usb@700000 {
>  			status = "okay";
>  		};
>  	};
> diff --git a/arch/arm/boot/dts/microchip/sama5d3xmb_cmp.dtsi b/arch/arm/boot/dts/microchip/sama5d3xmb_cmp.dtsi
> index 5d9e97fecf83..389d0506b942 100644
> --- a/arch/arm/boot/dts/microchip/sama5d3xmb_cmp.dtsi
> +++ b/arch/arm/boot/dts/microchip/sama5d3xmb_cmp.dtsi
> @@ -216,7 +216,7 @@ watchdog@fffffe40 {
>  			};
>  		};
>  
> -		usb0: gadget@500000 {
> +		usb0: usb@500000 {
>  			atmel,vbus-gpio = <&pioD 29 GPIO_ACTIVE_HIGH>;
>  			pinctrl-names = "default";
>  			pinctrl-0 = <&pinctrl_usba_vbus>;
> diff --git a/arch/arm/boot/dts/microchip/sama5d4.dtsi b/arch/arm/boot/dts/microchip/sama5d4.dtsi
> index 58ceed997889..5a80ae176141 100644
> --- a/arch/arm/boot/dts/microchip/sama5d4.dtsi
> +++ b/arch/arm/boot/dts/microchip/sama5d4.dtsi
> @@ -109,7 +109,7 @@ vdec0: vdec@300000 {
>  			clocks = <&pmc PMC_TYPE_PERIPHERAL 19>;
>  		};
>  
> -		usb0: gadget@400000 {
> +		usb0: usb@400000 {
>  			compatible = "atmel,sama5d3-udc";
>  			reg = <0x00400000 0x100000
>  			       0xfc02c000 0x4000>;
> @@ -119,7 +119,7 @@ usb0: gadget@400000 {
>  			status = "disabled";
>  		};
>  
> -		usb1: ohci@500000 {
> +		usb1: usb@500000 {
>  			compatible = "atmel,at91rm9200-ohci", "usb-ohci";
>  			reg = <0x00500000 0x100000>;
>  			interrupts = <46 IRQ_TYPE_LEVEL_HIGH 2>;
> @@ -128,7 +128,7 @@ usb1: ohci@500000 {
>  			status = "disabled";
>  		};
>  
> -		usb2: ehci@600000 {
> +		usb2: usb@600000 {
>  			compatible = "atmel,at91sam9g45-ehci", "usb-ehci";
>  			reg = <0x00600000 0x100000>;
>  			interrupts = <46 IRQ_TYPE_LEVEL_HIGH 2>;
> diff --git a/arch/arm/boot/dts/microchip/tny_a9263.dts b/arch/arm/boot/dts/microchip/tny_a9263.dts
> index 62b7d9f9a926..ca928355f784 100644
> --- a/arch/arm/boot/dts/microchip/tny_a9263.dts
> +++ b/arch/arm/boot/dts/microchip/tny_a9263.dts
> @@ -47,7 +47,7 @@ timer@2 {
>  				};
>  			};
>  
> -			usb1: gadget@fff78000 {
> +			usb1: usb@fff78000 {
>  				atmel,vbus-gpio = <&pioB 11 GPIO_ACTIVE_HIGH>;
>  				status = "okay";
>  			};
> diff --git a/arch/arm/boot/dts/microchip/usb_a9260_common.dtsi b/arch/arm/boot/dts/microchip/usb_a9260_common.dtsi
> index 8744b5f6f792..5ef60b7e2288 100644
> --- a/arch/arm/boot/dts/microchip/usb_a9260_common.dtsi
> +++ b/arch/arm/boot/dts/microchip/usb_a9260_common.dtsi
> @@ -39,7 +39,7 @@ macb0: ethernet@fffc4000 {
>  				status = "okay";
>  			};
>  
> -			usb1: gadget@fffa4000 {
> +			usb1: usb@fffa4000 {
>  				atmel,vbus-gpio = <&pioC 5 GPIO_ACTIVE_HIGH>;
>  				status = "okay";
>  			};
> @@ -111,7 +111,7 @@ data@7ca0000 {
>  			};
>  		};
>  
> -		usb0: ohci@500000 {
> +		usb0: usb@500000 {
>  			num-ports = <2>;
>  			status = "okay";
>  		};
> diff --git a/arch/arm/boot/dts/microchip/usb_a9263.dts b/arch/arm/boot/dts/microchip/usb_a9263.dts
> index 45745915b2e1..6421e9c55384 100644
> --- a/arch/arm/boot/dts/microchip/usb_a9263.dts
> +++ b/arch/arm/boot/dts/microchip/usb_a9263.dts
> @@ -52,7 +52,7 @@ macb0: ethernet@fffbc000 {
>  				status = "okay";
>  			};
>  
> -			usb1: gadget@fff78000 {
> +			usb1: usb@fff78000 {
>  				atmel,vbus-gpio = <&pioB 11 GPIO_ACTIVE_HIGH>;
>  				status = "okay";
>  			};
> @@ -139,7 +139,7 @@ data@7ca0000 {
>  			};
>  		};
>  
> -		usb0: ohci@a00000 {
> +		usb0: usb@a00000 {
>  			num-ports = <2>;
>  			status = "okay";
>  		};
> 
> base-commit: 2347b4c79f5e6cd3f4996e80c2d3c15f53006bf5
> -- 
> 2.34.1
> 
> 

