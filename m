Return-Path: <linux-leds+bounces-1608-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BEDF78BD209
	for <lists+linux-leds@lfdr.de>; Mon,  6 May 2024 18:01:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 48FD51F21FF9
	for <lists+linux-leds@lfdr.de>; Mon,  6 May 2024 16:01:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8045015574C;
	Mon,  6 May 2024 16:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=public-files.de header.i=frank-w@public-files.de header.b="lECczozP"
X-Original-To: linux-leds@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9B51155385;
	Mon,  6 May 2024 16:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715011267; cv=none; b=SiiKVXEW9Ve0EnOf2IWgCEwJxPADC/ekmGvJ7WapiuMXpFQkHl+2icQrbmsn7Vz3/wLYeeCo/YsLk/g5TEvNvrBpGF5KaCF4bN9ZxX+Iuja7Ymtz/UQFt/nJqgg/ID/tVIlWzA8+95dmOFGe3wjl+e/ABQv+mkkNedRbU6A2LQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715011267; c=relaxed/simple;
	bh=Not41Q6h3ptm7vf5+S5xcpNg3zIel9+F2NHBCSQ7NhI=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=kUVLXvXFoA3pqNInCqqdA3s0rJxrhd1LPYwrRzFoaAnECa3/H+4IQZqE4ap8MVdXsq2dXtUSvBhhNJgrl8cMGkTP82za0oqnIg7lygZLRTEycn+9ltAnI5CnuUHFIpYY3HogSxTXcKhqxLgKC3VvWK3bNTSdivALHWUOW+JoSO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=public-files.de; spf=pass smtp.mailfrom=public-files.de; dkim=pass (2048-bit key) header.d=public-files.de header.i=frank-w@public-files.de header.b=lECczozP; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=public-files.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=public-files.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=public-files.de;
	s=s31663417; t=1715011232; x=1715616032; i=frank-w@public-files.de;
	bh=zFAoAFMPSDAF2hSbEFLdE/+HaXvlvZ8+PKbWUnzgWKA=;
	h=X-UI-Sender-Class:Date:From:To:CC:Subject:Reply-to:In-Reply-To:
	 References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=lECczozPYgtFgQrcICyUzEC0UxuR1o1hopHkKbOVEyykpM0jdqUUY8p2nSe8y20b
	 hGiVtNmSas2qQYnWkGO+An73APii4lR5aEaU3SuIZfHUETHTSwaBuqKGXZav+2Nbd
	 1jO0a4MhqzarlsHnF40ihJJ8IRz51lD/TaQkNVQYj5bTW1v3Y2BVAv0m+E6bcdDx8
	 HuN52MDjiQvGcJIuW7z2qgMoubGGYXkAmb49w4s6fYE716L/pdfAa37l1XM62PSt9
	 o2iXiT8oGWhVdXy3aNU+uQH1H0tGwb4v7n522e4d+8tggh6K5/bL59RNY248fytfq
	 LT+YYi6wrSUm++9i8w==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [IPv6:::1] ([80.187.68.153]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M9Wuq-1s0gqB3iIW-0053Rs; Mon, 06
 May 2024 18:00:32 +0200
Date: Mon, 06 May 2024 18:00:30 +0200
From: Frank Wunderlich <frank-w@public-files.de>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Frank Wunderlich <linux@fw-web.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
CC: Eric Woudstra <ericwouds@gmail.com>, Tianling Shen <cnsztl@immortalwrt.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-leds@vger.kernel.org,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Tianling Shen <cnsztl@gmail.com>
Subject: =?US-ASCII?Q?Re=3A_=5BRFC_v1_5/5=5D_arm64=3A_dts=3A_mediate?=
 =?US-ASCII?Q?k=3A_Add_mt7986_based_Bananapi_R3_Mini?=
User-Agent: K-9 Mail for Android
Reply-to: frank-w@public-files.de
In-Reply-To: <a4099612-a4ae-4211-9674-c7053d2a995a@collabora.com>
References: <20240505164549.65644-1-linux@fw-web.de> <20240505164549.65644-6-linux@fw-web.de> <a4099612-a4ae-4211-9674-c7053d2a995a@collabora.com>
Message-ID: <3E013BA7-0264-4AC3-B677-BDD16B1F8D90@public-files.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:1dgAYaFHtc7EJBv4muaawIW5tkqlZguEe0+jz8+syRMCYxnVPhv
 X8CKcSrs+AZOloZfdprln+g2RDW58Z9+M8nBBC2GhWB/XvKA7q3+Y06W8GfdXi5rsoJ95sL
 nMF7/TJ9ZAMCzgdIatsSwa3M0Ow9mm0TEe0rFNFHj2EVU85xIiNnxy/sfwdjtsucAnT9/HK
 Vz7ZLUpgpncF7rzUmGp3g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:yZZXYFhajyk=;jIsWIYDIG590kXssQqWzksnl0jK
 HESedwIkaVtq/L8KOVlJtOOT3E58mruCCzM1QXINqtwt5poGVjQDm/EC2BFIcr0F+Y9D9dmXK
 YSjELakaX682EVxztKaV/2NuBuADqTdOE9xAnN1YPKPlCHXIL5L/Nt5OR/3LLXVbv4IXs7LpS
 5tuYs4aPskKdRPRyoDArVGyIDdBMJ/fezE+Zqn2WdDTFPgB+Tw/+ZNWbEz4r1JHTPRawbAo4w
 +L/0b6LMGy54rcShlQneoEFENwiSBGxx6uKmeh0MRBE/cgREcn6ZHNE1K4tpxnP2ewg/jY5ZP
 7SfxJKQ9SzfzsK5EtSrltpAWI7pdneUUCsQRERYru7lee2E4XuJNijZ2s66J84LbQfBAjbvsu
 vHgXrZxkJZ1TZ/xydaHp2YLtNDLcmj3Ta5DJAs9uwkZX5DTSQBNidePO4qRoYAM8AGVOfTwiH
 k1qxuJCbSrkQK6EgdnIbbfjY3//UIXKPVSHsGkRIEohNAHbqYxLgaI7w95urYgSVZQu/ft6UH
 nbcJhtzVVXo6EwZd4wfufXMvZ21WJYFgGwCnkmkqIjD0axFy/8/+rxYiyNWhq44z1mE0BnO31
 69ybdSpGWE8kdj8xTUFBYJ1mCEWxPzlSG2hn/Mv2ONhv2ylJ09oyV9zgK1/m9qcmbDAri7aZb
 WMTYFRpr5ZOzJ+522cRhunp/JmNGiRfS4uRF5N1J182v1ICJIlcfgXFgM5cZZ+2ofpD9A9M6/
 JhQ6MSUPEm1hdpBJD62NdgJpPGrpZMg0URUCwCZD8dFBLIBEypYlXeCpax/mI/K8PlXztUMLu
 pp6VCA8jnQAXphLzN851vKizwQUUTLbnYXyYBPibWma90=

Hi

Thanks for review=2E

Am 6=2E Mai 2024 14:48:59 MESZ schrieb AngeloGioacchino Del Regno <angelog=
ioacchino=2Edelregno@collabora=2Ecom>:
>Il 05/05/24 18:45, Frank Wunderlich ha scritto:
>> From: Frank Wunderlich <frank-w@public-files=2Ede>
>>=20
>> Add device Tree for Bananapi R3 Mini SBC=2E
>>=20
>> Co-developed-by: Eric Woudstra <ericwouds@gmail=2Ecom>
>> Signed-off-by: Eric Woudstra <ericwouds@gmail=2Ecom>
>> Co-developed-by: Tianling Shen <cnsztl@gmail=2Ecom>
>> Signed-off-by: Tianling Shen <cnsztl@gmail=2Ecom>
>> Signed-off-by: Frank Wunderlich <frank-w@public-files=2Ede>
>> ---
>>   arch/arm64/boot/dts/mediatek/Makefile         |   1 +
>>   =2E=2E=2E/mediatek/mt7986a-bananapi-bpi-r3-mini=2Edts | 486 +++++++++=
+++++++++
>>   2 files changed, 487 insertions(+)
>>   create mode 100644 arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-=
r3-mini=2Edts
>>=20
>> diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dt=
s/mediatek/Makefile
>> index 37b4ca3a87c9=2E=2E1763b001ab06 100644
>> --- a/arch/arm64/boot/dts/mediatek/Makefile
>> +++ b/arch/arm64/boot/dts/mediatek/Makefile
>> @@ -11,6 +11,7 @@ dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt7622-bananapi-bpi-=
r64=2Edtb
>>   dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt7981b-xiaomi-ax3000t=2Edtb
>>   dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt7986a-acelink-ew-7886cax=2Edtb
>>   dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt7986a-bananapi-bpi-r3=2Edtb
>> +dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt7986a-bananapi-bpi-r3-mini=2Edtb
>>   dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt7986a-bananapi-bpi-r3-emmc=2Edtbo
>>   dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt7986a-bananapi-bpi-r3-nand=2Edtbo
>>   dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt7986a-bananapi-bpi-r3-nor=2Edtbo
>> diff --git a/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-mini=
=2Edts b/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-mini=2Edts
>> new file mode 100644
>> index 000000000000=2E=2Ec764b4dc4752
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-mini=2Edts
>> @@ -0,0 +1,486 @@
>> +// SPDX-License-Identifier: (GPL-2=2E0 OR MIT)
>> +/*
>> + * Copyright (C) 2021 MediaTek Inc=2E
>> + * Authors: Frank Wunderlich <frank-w@public-files=2Ede>
>> + *          Eric Woudstra <ericwouds@gmail=2Ecom>
>> + *          Tianling Shen <cnsztl@immortalwrt=2Eorg>
>> + */
>> +
>> +/dts-v1/;
>> +
>> +#include <dt-bindings/gpio/gpio=2Eh>
>> +#include <dt-bindings/input/input=2Eh>
>> +#include <dt-bindings/leds/common=2Eh>
>> +#include <dt-bindings/pinctrl/mt65xx=2Eh>
>> +
>> +#include "mt7986a=2Edtsi"
>> +
>> +/ {
>> +	model =3D "Bananapi BPI-R3 Mini";
>> +	chassis-type =3D "embedded";
>> +	compatible =3D "bananapi,bpi-r3mini", "mediatek,mt7986a";
>> +
>> +	aliases {
>> +		serial0 =3D &uart0;
>> +		ethernet0 =3D &gmac0;
>> +		ethernet1 =3D &gmac1;
>> +	};
>> +
>> +	chosen {
>> +		stdout-path =3D "serial0:115200n8";
>> +	};
>> +
>> +	dcin: regulator-12vd {
>> +		compatible =3D "regulator-fixed";
>> +		regulator-name =3D "12vd";
>> +		regulator-min-microvolt =3D <12000000>;
>> +		regulator-max-microvolt =3D <12000000>;
>> +		regulator-boot-on;
>> +		regulator-always-on;
>> +	};
>> +
>> +	fan: pwm-fan {
>> +		compatible =3D "pwm-fan";
>> +		#cooling-cells =3D <2>;
>> +		/* cooling level (0, 1, 2) - pwm inverted */
>> +		cooling-levels =3D <255 96 0>;
>
>Did you try to actually invert the PWM?
>
>Look for PWM_POLARITY_INVERTED ;-)

Mtk pwm driver does not support it

https://elixir=2Ebootlin=2Ecom/linux/latest/source/drivers/pwm/pwm-mediate=
k=2Ec#L211

>> +		pwms =3D <&pwm 0 10000>;
>> +		status =3D "okay";
>> +	};
>> +
>> +	reg_1p8v: regulator-1p8v {
>> +		compatible =3D "regulator-fixed";
>> +		regulator-name =3D "1=2E8vd";
>> +		regulator-min-microvolt =3D <1800000>;
>> +		regulator-max-microvolt =3D <1800000>;
>> +		regulator-boot-on;
>> +		regulator-always-on;
>> +		vin-supply =3D <&dcin>;
>> +	};
>> +
>> +	reg_3p3v: regulator-3p3v {
>> +		compatible =3D "regulator-fixed";
>> +		regulator-name =3D "3=2E3vd";
>> +		regulator-min-microvolt =3D <3300000>;
>> +		regulator-max-microvolt =3D <3300000>;
>> +		regulator-boot-on;
>> +		regulator-always-on;
>> +		vin-supply =3D <&dcin>;
>> +	};
>> +
>> +	usb_vbus: regulator-usb-vbus {
>> +		compatible =3D "regulator-fixed";
>> +		regulator-name =3D "usb_vbus";
>> +		regulator-min-microvolt =3D <5000000>;
>> +		regulator-max-microvolt =3D <5000000>;
>> +		gpios =3D <&pio 20 GPIO_ACTIVE_LOW>;
>> +		regulator-boot-on;
>> +	};
>> +
>> +	en8811_a: regulator-phy1 {
>> +		compatible =3D "regulator-fixed";
>> +		regulator-name =3D "phy1";
>> +		regulator-min-microvolt =3D <3300000>;
>> +		regulator-max-microvolt =3D <3300000>;
>> +		gpio =3D <&pio 16 GPIO_ACTIVE_LOW>;
>> +		regulator-always-on;
>> +	};
>> +
>> +	en8811_b: regulator-phy2 {
>> +		compatible =3D "regulator-fixed";
>> +		regulator-name =3D "phy2";
>> +		regulator-min-microvolt =3D <3300000>;
>> +		regulator-max-microvolt =3D <3300000>;
>> +		gpio =3D <&pio 17 GPIO_ACTIVE_LOW>;
>> +		regulator-always-on;
>> +	};
>> +
>> +	leds {
>> +		compatible =3D "gpio-leds";
>> +
>> +		green_led: led-0 {
>> +			color =3D <LED_COLOR_ID_GREEN>;
>> +			function =3D LED_FUNCTION_POWER;
>> +			gpios =3D <&pio 19 GPIO_ACTIVE_HIGH>;
>> +			default-state =3D "on";
>> +		};
>> +	};
>> +
>> +	gpio-keys {
>> +		compatible =3D "gpio-keys";
>> +
>> +		reset-key {
>> +			label =3D "reset";
>> +			linux,code =3D <KEY_RESTART>;
>> +			gpios =3D <&pio 7 GPIO_ACTIVE_LOW>;
>> +		};
>> +	};
>> +
>> +};
>> +
>> +&cpu_thermal {
>> +	cooling-maps {
>> +		map0 {
>> +			/* active: set fan to cooling level 2 */
>> +			cooling-device =3D <&fan 2 2>;
>> +			trip =3D <&cpu_trip_active_high>;
>> +		};
>> +
>> +		map1 {
>> +			/* active: set fan to cooling level 1 */
>> +			cooling-device =3D <&fan 1 1>;
>> +			trip =3D <&cpu_trip_active_med>;
>> +		};
>> +
>> +		map2 {
>> +			/* active: set fan to cooling level 0 */
>> +			cooling-device =3D <&fan 0 0>;
>> +			trip =3D <&cpu_trip_active_low>;
>> +		};
>> +	};
>> +};
>> +
>> +&crypto {
>> +	status =3D "okay";
>> +};
>> +
>> +&eth {
>> +	status =3D "okay";
>> +
>> +	gmac0: mac@0 {
>> +		compatible =3D "mediatek,eth-mac";
>> +		reg =3D <0>;
>> +		phy-mode =3D "2500base-x";
>> +		phy-handle =3D <&phy14>;
>> +	};
>> +
>> +	gmac1: mac@1 {
>> +		compatible =3D "mediatek,eth-mac";
>> +		reg =3D <1>;
>> +		phy-mode =3D "2500base-x";
>> +		phy-handle =3D <&phy15>;
>> +	};
>> +
>> +	mdio: mdio-bus {
>> +		#address-cells =3D <1>;
>> +		#size-cells =3D <0>;
>> +	};
>> +};
>> +
>> +&mmc0 {
>> +	pinctrl-names =3D "default", "state_uhs";
>> +	pinctrl-0 =3D <&mmc0_pins_default>;
>> +	pinctrl-1 =3D <&mmc0_pins_uhs>;
>> +	vmmc-supply =3D <&reg_3p3v>;
>> +	vqmmc-supply =3D <&reg_1p8v>;
>> +};
>> +
>> +
>> +&i2c0 {
>> +	pinctrl-names =3D "default";
>> +	pinctrl-0 =3D <&i2c_pins>;
>> +	status =3D "okay";
>> +
>> +	/* MAC Address EEPROM */
>> +	eeprom@50 {
>> +		compatible =3D "atmel,24c02";
>> +		reg =3D <0x50>;
>> +
>> +		address-width =3D <8>;
>> +		pagesize =3D <8>;
>> +		size =3D <256>;
>> +	};
>> +};
>> +
>> +&mdio {
>
>You can just move all this stuff to where you declare the mdio-bus=2E=2E=
=2E=2E

Ok,see these 2 lines are already above,so can be dropped here=2E

>> +	#address-cells =3D <1>;
>> +	#size-cells =3D <0>;
>> +
>> +	phy14: ethernet-phy@14 {
>
>I say that this is `phy0: ethernet-phy@14` - because this is the first PH=
Y on this
>board=2E

Ok,i change this and phy15

>> +		reg =3D <14>;
>
>Uhm=2E=2E doesn't this require the ethernet-phy-id03a2=2Ea411 compatible?

I can add it,but worked without it=2E

There was a discussion about that and result was we don't need it in board=
 dts,maybe add compatible in binding example=2E

https://patchwork=2Ekernel=2Eorg/project/netdevbpf/patch/20240206194751=2E=
1901802-2-ericwouds@gmail=2Ecom/#25703356

>> +		interrupts-extended =3D <&pio 48 IRQ_TYPE_EDGE_FALLING>;
>> +		reset-gpios =3D <&pio 49 GPIO_ACTIVE_LOW>;
>> +		reset-assert-us =3D <10000>;
>> +		reset-deassert-us =3D <20000>;
>> +		phy-mode =3D "2500base-x";
>> +		full-duplex;
>> +		pause;
>> +		airoha,pnswap-rx;
>> +
>> +		leds {
>> +			#address-cells =3D <1>;
>> +			#size-cells =3D <0>;
>> +
>> +			led@0 { /* en8811_a_gpio5 */
>> +				reg =3D <0>;
>> +				color =3D <LED_COLOR_ID_YELLOW>;
>> +				function =3D LED_FUNCTION_LAN;
>> +				function-enumerator =3D <1>;
>
>Why aren't you simply using a label?

You mean the comment? I can add it of course like for regulators=2E

>> +				default-state =3D "keep";
>> +				linux,default-trigger =3D "netdev";
>> +			};
>> +			led@1 { /* en8811_a_gpio4 */
>> +				reg =3D <1>;
>> +				color =3D <LED_COLOR_ID_GREEN>;
>> +				function =3D LED_FUNCTION_LAN;
>> +				function-enumerator =3D <2>;
>> +				default-state =3D "keep";
>> +				linux,default-trigger =3D "netdev";
>> +			};
>> +		};
>> +	};
>> +
>> +	phy15: ethernet-phy@15 {
>> +		reg =3D <15>;
>
>Same here=2E
>
>Cheers,
>Angelo
>


regards Frank

