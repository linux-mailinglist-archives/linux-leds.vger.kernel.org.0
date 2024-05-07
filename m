Return-Path: <linux-leds+bounces-1627-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CABC48BE471
	for <lists+linux-leds@lfdr.de>; Tue,  7 May 2024 15:41:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EEE671C23591
	for <lists+linux-leds@lfdr.de>; Tue,  7 May 2024 13:41:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18AB015EFDC;
	Tue,  7 May 2024 13:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="rfMbzHuE"
X-Original-To: linux-leds@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D99C215F3E3;
	Tue,  7 May 2024 13:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715088919; cv=none; b=MezbIJ180SDGVy0zVOtV1N3CjVnwSLx3hX/LViVemRDUZqxH0iPRA6ahabF1P0rGUX13toeRx8Ms5kjRmkd12lC4tKLlEIOuDePR+kolzWpmg0Vrml8HNnJ8+J5c8SFDP/I8pdtPyg5/QWbtodkRXClTU3x4nwzI4dNQjfpWjos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715088919; c=relaxed/simple;
	bh=pOCQz3gNCarQ5ERyPBaqmc183TaFYRqz2TLXiHRUir0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tze2VLCdUppilWj4EIRK4fKBg0J/F7Henlw3MQtAj+bo1bd+t9HjVb8KzyO5heIRG0rWyAn2tyZPyhrUB5l3YMuRtIkceRYNwjXTZK+CyiTOzMSVkhKfJM3mNcuCjZHXmaboV4Qt1D1jwwh4P4BzSImW72TTM3BRyafbuzb6Z7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=rfMbzHuE; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1715088914;
	bh=pOCQz3gNCarQ5ERyPBaqmc183TaFYRqz2TLXiHRUir0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=rfMbzHuEK8B1UvOiS8atKWGCHk0UHqHkaiuYgPG4wxBDpcwwMW7hEt1bJPi3Rs/l5
	 Fxq0yo/LZO2xuviFM1XfTfAIVKm8ntX0gvhwVV7o4bpuOTTHLi0R3J5jp567rOoXki
	 XsYxwtAYtpOwSUl0dYaGrD02zAyBGeBeiopZ5uHa44w96p7B1j8ijeDtMafnFrTDGw
	 Ld4ChAjd98t/YbeJoEIUmogP6UDCfJL6D9Z1k6PANQ002b14NseyKHWtSoVY9vJe4I
	 uh1AoMPFn5cxIkcP4fvxe698ek5LfqkxLK+6KTxFfu8FN6jC3+Kynf9bwPkbVvJTDG
	 45sMrHdFyleiA==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 4DF1B3782134;
	Tue,  7 May 2024 13:35:13 +0000 (UTC)
Message-ID: <a18a10e5-42e1-4302-b9f3-43c6174e2cf9@collabora.com>
Date: Tue, 7 May 2024 15:35:12 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v1 5/5] arm64: dts: mediatek: Add mt7986 based Bananapi R3
 Mini
To: frank-w@public-files.de, Frank Wunderlich <linux@fw-web.de>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Eric Woudstra <ericwouds@gmail.com>,
 Tianling Shen <cnsztl@immortalwrt.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-leds@vger.kernel.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Tianling Shen <cnsztl@gmail.com>
References: <20240505164549.65644-1-linux@fw-web.de>
 <20240505164549.65644-6-linux@fw-web.de>
 <a4099612-a4ae-4211-9674-c7053d2a995a@collabora.com>
 <3E013BA7-0264-4AC3-B677-BDD16B1F8D90@public-files.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <3E013BA7-0264-4AC3-B677-BDD16B1F8D90@public-files.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 06/05/24 18:00, Frank Wunderlich ha scritto:
> Hi
> 
> Thanks for review.
> 
> Am 6. Mai 2024 14:48:59 MESZ schrieb AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>:
>> Il 05/05/24 18:45, Frank Wunderlich ha scritto:
>>> From: Frank Wunderlich <frank-w@public-files.de>
>>>
>>> Add device Tree for Bananapi R3 Mini SBC.
>>>
>>> Co-developed-by: Eric Woudstra <ericwouds@gmail.com>
>>> Signed-off-by: Eric Woudstra <ericwouds@gmail.com>
>>> Co-developed-by: Tianling Shen <cnsztl@gmail.com>
>>> Signed-off-by: Tianling Shen <cnsztl@gmail.com>
>>> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
>>> ---
>>>    arch/arm64/boot/dts/mediatek/Makefile         |   1 +
>>>    .../mediatek/mt7986a-bananapi-bpi-r3-mini.dts | 486 ++++++++++++++++++
>>>    2 files changed, 487 insertions(+)
>>>    create mode 100644 arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-mini.dts
>>>
>>> diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/mediatek/Makefile
>>> index 37b4ca3a87c9..1763b001ab06 100644
>>> --- a/arch/arm64/boot/dts/mediatek/Makefile
>>> +++ b/arch/arm64/boot/dts/mediatek/Makefile
>>> @@ -11,6 +11,7 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt7622-bananapi-bpi-r64.dtb
>>>    dtb-$(CONFIG_ARCH_MEDIATEK) += mt7981b-xiaomi-ax3000t.dtb
>>>    dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-acelink-ew-7886cax.dtb
>>>    dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-bananapi-bpi-r3.dtb
>>> +dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-bananapi-bpi-r3-mini.dtb
>>>    dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-bananapi-bpi-r3-emmc.dtbo
>>>    dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-bananapi-bpi-r3-nand.dtbo
>>>    dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-bananapi-bpi-r3-nor.dtbo
>>> diff --git a/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-mini.dts b/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-mini.dts
>>> new file mode 100644
>>> index 000000000000..c764b4dc4752
>>> --- /dev/null
>>> +++ b/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-mini.dts
>>> @@ -0,0 +1,486 @@
>>> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
>>> +/*
>>> + * Copyright (C) 2021 MediaTek Inc.
>>> + * Authors: Frank Wunderlich <frank-w@public-files.de>
>>> + *          Eric Woudstra <ericwouds@gmail.com>
>>> + *          Tianling Shen <cnsztl@immortalwrt.org>
>>> + */
>>> +
>>> +/dts-v1/;
>>> +
>>> +#include <dt-bindings/gpio/gpio.h>
>>> +#include <dt-bindings/input/input.h>
>>> +#include <dt-bindings/leds/common.h>
>>> +#include <dt-bindings/pinctrl/mt65xx.h>
>>> +
>>> +#include "mt7986a.dtsi"
>>> +
>>> +/ {
>>> +	model = "Bananapi BPI-R3 Mini";
>>> +	chassis-type = "embedded";
>>> +	compatible = "bananapi,bpi-r3mini", "mediatek,mt7986a";
>>> +
>>> +	aliases {
>>> +		serial0 = &uart0;
>>> +		ethernet0 = &gmac0;
>>> +		ethernet1 = &gmac1;
>>> +	};
>>> +
>>> +	chosen {
>>> +		stdout-path = "serial0:115200n8";
>>> +	};
>>> +
>>> +	dcin: regulator-12vd {
>>> +		compatible = "regulator-fixed";
>>> +		regulator-name = "12vd";
>>> +		regulator-min-microvolt = <12000000>;
>>> +		regulator-max-microvolt = <12000000>;
>>> +		regulator-boot-on;
>>> +		regulator-always-on;
>>> +	};
>>> +
>>> +	fan: pwm-fan {
>>> +		compatible = "pwm-fan";
>>> +		#cooling-cells = <2>;
>>> +		/* cooling level (0, 1, 2) - pwm inverted */
>>> +		cooling-levels = <255 96 0>;
>>
>> Did you try to actually invert the PWM?
>>
>> Look for PWM_POLARITY_INVERTED ;-)
> 
> Mtk pwm driver does not support it
> 
> https://elixir.bootlin.com/linux/latest/source/drivers/pwm/pwm-mediatek.c#L211
> 

You're right, sorry - I confused the general purpose PWM controller with the
rather specific DISP_PWM controller (which does support polarity inversion).

It's good - but I'd appreciate if you can please add a comment stating that
the PWM values are inverted in SW because the controller does *not* support
polarity inversion... so that next time someone looks at this will immediately
understand what's going on and why :-)

>>> +		pwms = <&pwm 0 10000>;
>>> +		status = "okay";
>>> +	};
>>> +
>>> +	reg_1p8v: regulator-1p8v {
>>> +		compatible = "regulator-fixed";
>>> +		regulator-name = "1.8vd";
>>> +		regulator-min-microvolt = <1800000>;
>>> +		regulator-max-microvolt = <1800000>;
>>> +		regulator-boot-on;
>>> +		regulator-always-on;
>>> +		vin-supply = <&dcin>;
>>> +	};
>>> +
>>> +	reg_3p3v: regulator-3p3v {
>>> +		compatible = "regulator-fixed";
>>> +		regulator-name = "3.3vd";
>>> +		regulator-min-microvolt = <3300000>;
>>> +		regulator-max-microvolt = <3300000>;
>>> +		regulator-boot-on;
>>> +		regulator-always-on;
>>> +		vin-supply = <&dcin>;
>>> +	};
>>> +
>>> +	usb_vbus: regulator-usb-vbus {
>>> +		compatible = "regulator-fixed";
>>> +		regulator-name = "usb_vbus";
>>> +		regulator-min-microvolt = <5000000>;
>>> +		regulator-max-microvolt = <5000000>;
>>> +		gpios = <&pio 20 GPIO_ACTIVE_LOW>;
>>> +		regulator-boot-on;
>>> +	};
>>> +
>>> +	en8811_a: regulator-phy1 {
>>> +		compatible = "regulator-fixed";
>>> +		regulator-name = "phy1";
>>> +		regulator-min-microvolt = <3300000>;
>>> +		regulator-max-microvolt = <3300000>;
>>> +		gpio = <&pio 16 GPIO_ACTIVE_LOW>;
>>> +		regulator-always-on;
>>> +	};
>>> +
>>> +	en8811_b: regulator-phy2 {
>>> +		compatible = "regulator-fixed";
>>> +		regulator-name = "phy2";
>>> +		regulator-min-microvolt = <3300000>;
>>> +		regulator-max-microvolt = <3300000>;
>>> +		gpio = <&pio 17 GPIO_ACTIVE_LOW>;
>>> +		regulator-always-on;
>>> +	};
>>> +
>>> +	leds {
>>> +		compatible = "gpio-leds";
>>> +
>>> +		green_led: led-0 {
>>> +			color = <LED_COLOR_ID_GREEN>;
>>> +			function = LED_FUNCTION_POWER;
>>> +			gpios = <&pio 19 GPIO_ACTIVE_HIGH>;
>>> +			default-state = "on";
>>> +		};
>>> +	};
>>> +
>>> +	gpio-keys {
>>> +		compatible = "gpio-keys";
>>> +
>>> +		reset-key {
>>> +			label = "reset";
>>> +			linux,code = <KEY_RESTART>;
>>> +			gpios = <&pio 7 GPIO_ACTIVE_LOW>;
>>> +		};
>>> +	};
>>> +
>>> +};
>>> +
>>> +&cpu_thermal {
>>> +	cooling-maps {
>>> +		map0 {
>>> +			/* active: set fan to cooling level 2 */
>>> +			cooling-device = <&fan 2 2>;
>>> +			trip = <&cpu_trip_active_high>;
>>> +		};
>>> +
>>> +		map1 {
>>> +			/* active: set fan to cooling level 1 */
>>> +			cooling-device = <&fan 1 1>;
>>> +			trip = <&cpu_trip_active_med>;
>>> +		};
>>> +
>>> +		map2 {
>>> +			/* active: set fan to cooling level 0 */
>>> +			cooling-device = <&fan 0 0>;
>>> +			trip = <&cpu_trip_active_low>;
>>> +		};
>>> +	};
>>> +};
>>> +
>>> +&crypto {
>>> +	status = "okay";
>>> +};
>>> +
>>> +&eth {
>>> +	status = "okay";
>>> +
>>> +	gmac0: mac@0 {
>>> +		compatible = "mediatek,eth-mac";
>>> +		reg = <0>;
>>> +		phy-mode = "2500base-x";
>>> +		phy-handle = <&phy14>;
>>> +	};
>>> +
>>> +	gmac1: mac@1 {
>>> +		compatible = "mediatek,eth-mac";
>>> +		reg = <1>;
>>> +		phy-mode = "2500base-x";
>>> +		phy-handle = <&phy15>;
>>> +	};
>>> +
>>> +	mdio: mdio-bus {
>>> +		#address-cells = <1>;
>>> +		#size-cells = <0>;
>>> +	};
>>> +};
>>> +
>>> +&mmc0 {
>>> +	pinctrl-names = "default", "state_uhs";
>>> +	pinctrl-0 = <&mmc0_pins_default>;
>>> +	pinctrl-1 = <&mmc0_pins_uhs>;
>>> +	vmmc-supply = <&reg_3p3v>;
>>> +	vqmmc-supply = <&reg_1p8v>;
>>> +};
>>> +
>>> +
>>> +&i2c0 {
>>> +	pinctrl-names = "default";
>>> +	pinctrl-0 = <&i2c_pins>;
>>> +	status = "okay";
>>> +
>>> +	/* MAC Address EEPROM */
>>> +	eeprom@50 {
>>> +		compatible = "atmel,24c02";
>>> +		reg = <0x50>;
>>> +
>>> +		address-width = <8>;
>>> +		pagesize = <8>;
>>> +		size = <256>;
>>> +	};
>>> +};
>>> +
>>> +&mdio {
>>
>> You can just move all this stuff to where you declare the mdio-bus....
> 
> Ok,see these 2 lines are already above,so can be dropped here.
> 
>>> +	#address-cells = <1>;
>>> +	#size-cells = <0>;
>>> +
>>> +	phy14: ethernet-phy@14 {
>>
>> I say that this is `phy0: ethernet-phy@14` - because this is the first PHY on this
>> board.
> 
> Ok,i change this and phy15
> 
>>> +		reg = <14>;
>>
>> Uhm.. doesn't this require the ethernet-phy-id03a2.a411 compatible?
> 
> I can add it,but worked without it.
> 
> There was a discussion about that and result was we don't need it in board dts,maybe add compatible in binding example.
> 
> https://patchwork.kernel.org/project/netdevbpf/patch/20240206194751.1901802-2-ericwouds@gmail.com/#25703356
> 

Ah, okay. Leave it then.

>>> +		interrupts-extended = <&pio 48 IRQ_TYPE_EDGE_FALLING>;
>>> +		reset-gpios = <&pio 49 GPIO_ACTIVE_LOW>;
>>> +		reset-assert-us = <10000>;
>>> +		reset-deassert-us = <20000>;
>>> +		phy-mode = "2500base-x";
>>> +		full-duplex;
>>> +		pause;
>>> +		airoha,pnswap-rx;
>>> +
>>> +		leds {
>>> +			#address-cells = <1>;
>>> +			#size-cells = <0>;
>>> +
>>> +			led@0 { /* en8811_a_gpio5 */
>>> +				reg = <0>;
>>> +				color = <LED_COLOR_ID_YELLOW>;
>>> +				function = LED_FUNCTION_LAN;
>>> +				function-enumerator = <1>;
>>
>> Why aren't you simply using a label?
> 
> You mean the comment? I can add it of course like for regulators.
> 

I mean in place of the function-enumerator... that's practically used to
distinguish between instances, it's not too common to see it, and usually
"label" replaces exactly that - just that, instead of a different number,
it gets a different name with no (usually) meaningless numbers :-)

Cheers!

>>> +				default-state = "keep";
>>> +				linux,default-trigger = "netdev";
>>> +			};
>>> +			led@1 { /* en8811_a_gpio4 */
>>> +				reg = <1>;
>>> +				color = <LED_COLOR_ID_GREEN>;
>>> +				function = LED_FUNCTION_LAN;
>>> +				function-enumerator = <2>;
>>> +				default-state = "keep";
>>> +				linux,default-trigger = "netdev";
>>> +			};
>>> +		};
>>> +	};
>>> +
>>> +	phy15: ethernet-phy@15 {
>>> +		reg = <15>;
>>
>> Same here.
>>
>> Cheers,
>> Angelo
>>
> 
> 
> regards Frank


