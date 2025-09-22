Return-Path: <linux-leds+bounces-5536-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 21775B9165A
	for <lists+linux-leds@lfdr.de>; Mon, 22 Sep 2025 15:29:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 84DCF424195
	for <lists+linux-leds@lfdr.de>; Mon, 22 Sep 2025 13:29:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE7AB30C0FB;
	Mon, 22 Sep 2025 13:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="E3+R4Fb7"
X-Original-To: linux-leds@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12CC630AD16;
	Mon, 22 Sep 2025 13:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758547750; cv=none; b=CJINABijv0xGFRK64Kcql2GAqvTYCZhOls/4AzYmN8smJeMIH4UAZw1WXoHW4oY5+xPp7ecg3IbbyyzjLYxllgTVcHSiMxKEgZmGDiAduLj9uYtREDTTHcUob3vIxduIlWK2RvVB6x0aQ9CUN3i5RXVpI8p6GHFGiEHV7Qdr5Cs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758547750; c=relaxed/simple;
	bh=ZVX1e3ohbjMRT6yvQbtfGjCtUWRTySjeKIAiaDp53hA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=IT+3gPYrtrCXBUmJsK7nhmzIC9UVDm/0UJA2q893gcaTCYZEiKe4uyd/diuusFsNenFVAg2pGJwyaspxoe+ZnHJ538TeodHEUmMptz3hh7Ig7M5CxzKaD+pmCYUhXCYrovtZHrnPQUl/36+DbEB4FgC5+IzD2iGi+0MEGCQze2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=E3+R4Fb7; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1758547749; x=1790083749;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=ZVX1e3ohbjMRT6yvQbtfGjCtUWRTySjeKIAiaDp53hA=;
  b=E3+R4Fb7RFk81DV77SXX5TyLS3eq4C69rVwYAWxZJXDIbXm+KNcfcqoj
   2gxcnw91VeHyqh/godiMTRUgEAIwlsoUiH4DoxOdF75g1AFYbZViK2eHx
   hzQtK2YY8yHjsf5H2yZqhkcNGsStJ2ZLnjILwOpamBU6yJHrQN3iFcAZW
   0PdIY8QHjKOtfBNfjNgWDRFjw+QaIBONkpgeS2O1qjBcEKVTWXDFVjTnC
   1rfVhgrQAFKArG6D6T+JxQgoAHF7NY+5Q6LttLS5rBL041LgVf4wnTZQv
   oMdtEklD+43R+MoxEMwfFqN1p3CSkOaZsugZUT9HqDVd4oKDiTjSch4D3
   g==;
X-CSE-ConnectionGUID: qeIO0Q34ST+dI1Wb5TenNg==
X-CSE-MsgGUID: wfSfsjMHTbqnLogYXVIlXg==
X-IronPort-AV: E=Sophos;i="6.18,285,1751266800"; 
   d="scan'208";a="214200816"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 22 Sep 2025 06:29:07 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Mon, 22 Sep 2025 06:28:42 -0700
Received: from [10.159.245.205] (10.10.85.11) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Mon, 22 Sep 2025 06:28:40 -0700
Message-ID: <d06e5323-995e-425e-8ace-c04e9140f5d0@microchip.com>
Date: Mon, 22 Sep 2025 15:28:40 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ARM: dts: microchip: sama7d65: Add GPIO buttons and
 LEDs
To: <Ryan.Wanner@microchip.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-leds@vger.kernel.org>
References: <20250917210409.503830-1-Ryan.Wanner@microchip.com>
From: Nicolas Ferre <nicolas.ferre@microchip.com>
Content-Language: en-US, fr
Organization: microchip
In-Reply-To: <20250917210409.503830-1-Ryan.Wanner@microchip.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 17/09/2025 at 23:04, Ryan.Wanner@microchip.com wrote:
> From: Ryan Wanner <Ryan.Wanner@microchip.com>
> 
> Add the USER button as a GPIO input as well as add the LEDs and enable
> the blue LED as a heartbeat.
> 
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>

Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>
And queued in at91-dt branch.

Regards,
   Nicolas

> ---
> Changes v1 -> v2:
> - Remove the label node in the LEDs.
> - Use properties color and function to describe the LEDs.
> - Add phandles for the LEDs.
> 
>   .../dts/microchip/at91-sama7d65_curiosity.dts | 51 +++++++++++++++++++
>   1 file changed, 51 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dts b/arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dts
> index f091cc40a9f0..927c27260b6c 100644
> --- a/arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dts
> +++ b/arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dts
> @@ -11,6 +11,8 @@
>   #include "sama7d65-pinfunc.h"
>   #include "sama7d65.dtsi"
>   #include <dt-bindings/mfd/atmel-flexcom.h>
> +#include <dt-bindings/input/input.h>
> +#include <dt-bindings/leds/common.h>
>   #include <dt-bindings/pinctrl/at91.h>
>   
>   / {
> @@ -26,6 +28,43 @@ chosen {
>   		stdout-path = "serial0:115200n8";
>   	};
>   
> +	gpio-keys {
> +		compatible = "gpio-keys";
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_key_gpio_default>;
> +
> +		button {
> +			label = "PB_USER";
> +			gpios = <&pioa PIN_PC10 GPIO_ACTIVE_LOW>;
> +			linux,code = <KEY_PROG1>;
> +			wakeup-source;
> +		};
> +	};
> +
> +	leds {
> +		compatible = "gpio-leds";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_led_gpio_default>;
> +
> +		led0: led-red {
> +			color = <LED_COLOR_ID_RED>;
> +			gpios = <&pioa PIN_PB17 GPIO_ACTIVE_HIGH>; /* Conflict with pwm. */
> +		};
> +
> +		led1: led-green {
> +			color = <LED_COLOR_ID_GREEN>;
> +			gpios = <&pioa PIN_PB15 GPIO_ACTIVE_HIGH>; /* Conflict with pwm. */
> +		};
> +
> +		led2: led-blue {
> +			color = <LED_COLOR_ID_BLUE>;
> +			function = LED_FUNCTION_HEARTBEAT;
> +			gpios = <&pioa PIN_PA21 GPIO_ACTIVE_HIGH>;
> +			linux,default-trigger = "heartbeat";
> +		};
> +	};
> +
>   	memory@60000000 {
>   		device_type = "memory";
>   		reg = <0x60000000 0x40000000>;
> @@ -352,6 +391,18 @@ pinctrl_i2c10_default: i2c10-default {
>   		bias-pull-up;
>   	};
>   
> +	pinctrl_key_gpio_default: key-gpio-default {
> +		pinmux = <PIN_PC10__GPIO>;
> +		bias-pull-up;
> +	};
> +
> +	pinctrl_led_gpio_default: led-gpio-default {
> +		pinmux = <PIN_PB15__GPIO>,
> +			 <PIN_PB17__GPIO>,
> +			 <PIN_PA21__GPIO>;
> +		bias-pull-up;
> +	};
> +
>   	pinctrl_sdmmc1_default: sdmmc1-default {
>   		cmd-data {
>   			pinmux = <PIN_PB22__SDMMC1_CMD>,


