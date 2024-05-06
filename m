Return-Path: <linux-leds+bounces-1610-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ED188BD22C
	for <lists+linux-leds@lfdr.de>; Mon,  6 May 2024 18:12:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 30E041C21933
	for <lists+linux-leds@lfdr.de>; Mon,  6 May 2024 16:12:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E544B155A59;
	Mon,  6 May 2024 16:12:33 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from pidgin.makrotopia.org (pidgin.makrotopia.org [185.142.180.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BF4E15575A;
	Mon,  6 May 2024 16:12:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.142.180.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715011953; cv=none; b=BO9+7slw7Cpr8Tyc1VixE2j/ruRTaRlpI+++05NwtGjIgbh2bW+PKtD4eFjGvbG1uX1RwJUC4/DlCar7nYMUeowzA7O7suDmG96XEtXueVPus3Mv1VpVqILUCBl4dxJLx4EWRL8Kwyasy8542fyn1y8GmfqfQhN38YtEQxq5avc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715011953; c=relaxed/simple;
	bh=dOVbZjy5Np+6iNe8Yn80HNEbgSSJFtmFE3mL7T3bEf8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sRXVGcrqtCX81iMDEHAeej/R+fx6YTKjGsPCN4D8UuouAcE+/oc0P46diCfGitI9a4h90SO+HAn+J1ZCV4ui0ndCUJBfEDbipw7rjSfnI67OPwOur2BRUZCE6c5+FJhi878POOBCb7Ab8iyjZ9QvJhyESUqHi2/jMzPtXWcK4is=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org; spf=pass smtp.mailfrom=makrotopia.org; arc=none smtp.client-ip=185.142.180.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=makrotopia.org
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.97.1)
	(envelope-from <daniel@makrotopia.org>)
	id 1s40wt-000000007Gd-1wsn;
	Mon, 06 May 2024 16:12:19 +0000
Date: Mon, 6 May 2024 17:12:15 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Frank Wunderlich <linux@fw-web.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee@kernel.org>, "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Eric Woudstra <ericwouds@gmail.com>,
	Tianling Shen <cnsztl@immortalwrt.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-leds@vger.kernel.org, netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Tianling Shen <cnsztl@gmail.com>
Subject: Re: [RFC v1 5/5] arm64: dts: mediatek: Add mt7986 based Bananapi R3
 Mini
Message-ID: <ZjkBX9T_xzx1D66m@makrotopia.org>
References: <20240505164549.65644-1-linux@fw-web.de>
 <20240505164549.65644-6-linux@fw-web.de>
 <a4099612-a4ae-4211-9674-c7053d2a995a@collabora.com>
 <3E013BA7-0264-4AC3-B677-BDD16B1F8D90@public-files.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3E013BA7-0264-4AC3-B677-BDD16B1F8D90@public-files.de>

On Mon, May 06, 2024 at 06:00:30PM +0200, Frank Wunderlich wrote:
> Hi
> 
> Thanks for review.
> 
> Am 6. Mai 2024 14:48:59 MESZ schrieb AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>:
> >Il 05/05/24 18:45, Frank Wunderlich ha scritto:
> >> From: Frank Wunderlich <frank-w@public-files.de>
> >> 
> >> Add device Tree for Bananapi R3 Mini SBC.
> >> 
> >> Co-developed-by: Eric Woudstra <ericwouds@gmail.com>
> >> Signed-off-by: Eric Woudstra <ericwouds@gmail.com>
> >> Co-developed-by: Tianling Shen <cnsztl@gmail.com>
> >> Signed-off-by: Tianling Shen <cnsztl@gmail.com>
> >> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> >> ---
> >>   arch/arm64/boot/dts/mediatek/Makefile         |   1 +
> >>   .../mediatek/mt7986a-bananapi-bpi-r3-mini.dts | 486 ++++++++++++++++++
> >>   2 files changed, 487 insertions(+)
> >>   create mode 100644 arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-mini.dts
> >> 
> >> diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/mediatek/Makefile
> >> index 37b4ca3a87c9..1763b001ab06 100644
> >> --- a/arch/arm64/boot/dts/mediatek/Makefile
> >> +++ b/arch/arm64/boot/dts/mediatek/Makefile
> >> @@ -11,6 +11,7 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt7622-bananapi-bpi-r64.dtb
> >>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt7981b-xiaomi-ax3000t.dtb
> >>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-acelink-ew-7886cax.dtb
> >>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-bananapi-bpi-r3.dtb
> >> +dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-bananapi-bpi-r3-mini.dtb
> >>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-bananapi-bpi-r3-emmc.dtbo
> >>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-bananapi-bpi-r3-nand.dtbo
> >>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-bananapi-bpi-r3-nor.dtbo
> >> diff --git a/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-mini.dts b/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-mini.dts
> >> new file mode 100644
> >> index 000000000000..c764b4dc4752
> >> --- /dev/null
> >> +++ b/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-mini.dts
> >> @@ -0,0 +1,486 @@
> >> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> >> +/*
> >> + * Copyright (C) 2021 MediaTek Inc.
> >> + * Authors: Frank Wunderlich <frank-w@public-files.de>
> >> + *          Eric Woudstra <ericwouds@gmail.com>
> >> + *          Tianling Shen <cnsztl@immortalwrt.org>
> >> + */
> >> +
> >> +/dts-v1/;
> >> +
> >> +#include <dt-bindings/gpio/gpio.h>
> >> +#include <dt-bindings/input/input.h>
> >> +#include <dt-bindings/leds/common.h>
> >> +#include <dt-bindings/pinctrl/mt65xx.h>
> >> +
> >> +#include "mt7986a.dtsi"
> >> +
> >> +/ {
> >> +	model = "Bananapi BPI-R3 Mini";
> >> +	chassis-type = "embedded";
> >> +	compatible = "bananapi,bpi-r3mini", "mediatek,mt7986a";
> >> +
> >> +	aliases {
> >> +		serial0 = &uart0;
> >> +		ethernet0 = &gmac0;
> >> +		ethernet1 = &gmac1;
> >> +	};
> >> +
> >> +	chosen {
> >> +		stdout-path = "serial0:115200n8";
> >> +	};
> >> +
> >> +	dcin: regulator-12vd {
> >> +		compatible = "regulator-fixed";
> >> +		regulator-name = "12vd";
> >> +		regulator-min-microvolt = <12000000>;
> >> +		regulator-max-microvolt = <12000000>;
> >> +		regulator-boot-on;
> >> +		regulator-always-on;
> >> +	};
> >> +
> >> +	fan: pwm-fan {
> >> +		compatible = "pwm-fan";
> >> +		#cooling-cells = <2>;
> >> +		/* cooling level (0, 1, 2) - pwm inverted */
> >> +		cooling-levels = <255 96 0>;
> >
> >Did you try to actually invert the PWM?
> >
> >Look for PWM_POLARITY_INVERTED ;-)
> 
> Mtk pwm driver does not support it
> 
> https://elixir.bootlin.com/linux/latest/source/drivers/pwm/pwm-mediatek.c#L211
> 
> >> +		pwms = <&pwm 0 10000>;
> >> +		status = "okay";
> >> +	};
> >> +
> >> +	reg_1p8v: regulator-1p8v {
> >> +		compatible = "regulator-fixed";
> >> +		regulator-name = "1.8vd";
> >> +		regulator-min-microvolt = <1800000>;
> >> +		regulator-max-microvolt = <1800000>;
> >> +		regulator-boot-on;
> >> +		regulator-always-on;
> >> +		vin-supply = <&dcin>;
> >> +	};
> >> +
> >> +	reg_3p3v: regulator-3p3v {
> >> +		compatible = "regulator-fixed";
> >> +		regulator-name = "3.3vd";
> >> +		regulator-min-microvolt = <3300000>;
> >> +		regulator-max-microvolt = <3300000>;
> >> +		regulator-boot-on;
> >> +		regulator-always-on;
> >> +		vin-supply = <&dcin>;
> >> +	};
> >> +
> >> +	usb_vbus: regulator-usb-vbus {
> >> +		compatible = "regulator-fixed";
> >> +		regulator-name = "usb_vbus";
> >> +		regulator-min-microvolt = <5000000>;
> >> +		regulator-max-microvolt = <5000000>;
> >> +		gpios = <&pio 20 GPIO_ACTIVE_LOW>;
> >> +		regulator-boot-on;
> >> +	};
> >> +
> >> +	en8811_a: regulator-phy1 {
> >> +		compatible = "regulator-fixed";
> >> +		regulator-name = "phy1";
> >> +		regulator-min-microvolt = <3300000>;
> >> +		regulator-max-microvolt = <3300000>;
> >> +		gpio = <&pio 16 GPIO_ACTIVE_LOW>;
> >> +		regulator-always-on;
> >> +	};
> >> +
> >> +	en8811_b: regulator-phy2 {
> >> +		compatible = "regulator-fixed";
> >> +		regulator-name = "phy2";
> >> +		regulator-min-microvolt = <3300000>;
> >> +		regulator-max-microvolt = <3300000>;
> >> +		gpio = <&pio 17 GPIO_ACTIVE_LOW>;
> >> +		regulator-always-on;
> >> +	};
> >> +
> >> +	leds {
> >> +		compatible = "gpio-leds";
> >> +
> >> +		green_led: led-0 {
> >> +			color = <LED_COLOR_ID_GREEN>;
> >> +			function = LED_FUNCTION_POWER;
> >> +			gpios = <&pio 19 GPIO_ACTIVE_HIGH>;
> >> +			default-state = "on";
> >> +		};
> >> +	};
> >> +
> >> +	gpio-keys {
> >> +		compatible = "gpio-keys";
> >> +
> >> +		reset-key {
> >> +			label = "reset";
> >> +			linux,code = <KEY_RESTART>;
> >> +			gpios = <&pio 7 GPIO_ACTIVE_LOW>;
> >> +		};
> >> +	};
> >> +
> >> +};
> >> +
> >> +&cpu_thermal {
> >> +	cooling-maps {
> >> +		map0 {
> >> +			/* active: set fan to cooling level 2 */
> >> +			cooling-device = <&fan 2 2>;
> >> +			trip = <&cpu_trip_active_high>;
> >> +		};
> >> +
> >> +		map1 {
> >> +			/* active: set fan to cooling level 1 */
> >> +			cooling-device = <&fan 1 1>;
> >> +			trip = <&cpu_trip_active_med>;
> >> +		};
> >> +
> >> +		map2 {
> >> +			/* active: set fan to cooling level 0 */
> >> +			cooling-device = <&fan 0 0>;
> >> +			trip = <&cpu_trip_active_low>;
> >> +		};
> >> +	};
> >> +};
> >> +
> >> +&crypto {
> >> +	status = "okay";
> >> +};
> >> +
> >> +&eth {
> >> +	status = "okay";
> >> +
> >> +	gmac0: mac@0 {
> >> +		compatible = "mediatek,eth-mac";
> >> +		reg = <0>;
> >> +		phy-mode = "2500base-x";
> >> +		phy-handle = <&phy14>;
> >> +	};
> >> +
> >> +	gmac1: mac@1 {
> >> +		compatible = "mediatek,eth-mac";
> >> +		reg = <1>;
> >> +		phy-mode = "2500base-x";
> >> +		phy-handle = <&phy15>;
> >> +	};
> >> +
> >> +	mdio: mdio-bus {
> >> +		#address-cells = <1>;
> >> +		#size-cells = <0>;
> >> +	};
> >> +};
> >> +
> >> +&mmc0 {
> >> +	pinctrl-names = "default", "state_uhs";
> >> +	pinctrl-0 = <&mmc0_pins_default>;
> >> +	pinctrl-1 = <&mmc0_pins_uhs>;
> >> +	vmmc-supply = <&reg_3p3v>;
> >> +	vqmmc-supply = <&reg_1p8v>;
> >> +};
> >> +
> >> +
> >> +&i2c0 {
> >> +	pinctrl-names = "default";
> >> +	pinctrl-0 = <&i2c_pins>;
> >> +	status = "okay";
> >> +
> >> +	/* MAC Address EEPROM */
> >> +	eeprom@50 {
> >> +		compatible = "atmel,24c02";
> >> +		reg = <0x50>;
> >> +
> >> +		address-width = <8>;
> >> +		pagesize = <8>;
> >> +		size = <256>;
> >> +	};
> >> +};
> >> +
> >> +&mdio {
> >
> >You can just move all this stuff to where you declare the mdio-bus....
> 
> Ok,see these 2 lines are already above,so can be dropped here.
> 
> >> +	#address-cells = <1>;
> >> +	#size-cells = <0>;
> >> +
> >> +	phy14: ethernet-phy@14 {
> >
> >I say that this is `phy0: ethernet-phy@14` - because this is the first PHY on this
> >board.
> 
> Ok,i change this and phy15
> 
> >> +		reg = <14>;
> >
> >Uhm.. doesn't this require the ethernet-phy-id03a2.a411 compatible?
> 
> I can add it,but worked without it.
> 
> There was a discussion about that and result was we don't need it in board dts,maybe add compatible in binding example.
> 
> https://patchwork.kernel.org/project/netdevbpf/patch/20240206194751.1901802-2-ericwouds@gmail.com/#25703356

I confirm that setting the PHY ID in DT is **not** needed.

The PHY probes fine and it's possible to read the PHY ID even before
firmware has been loaded.

> 
> >> +		interrupts-extended = <&pio 48 IRQ_TYPE_EDGE_FALLING>;
> >> +		reset-gpios = <&pio 49 GPIO_ACTIVE_LOW>;
> >> +		reset-assert-us = <10000>;
> >> +		reset-deassert-us = <20000>;
> >> +		phy-mode = "2500base-x";
> >> +		full-duplex;
> >> +		pause;
> >> +		airoha,pnswap-rx;
> >> +
> >> +		leds {
> >> +			#address-cells = <1>;
> >> +			#size-cells = <0>;
> >> +
> >> +			led@0 { /* en8811_a_gpio5 */
> >> +				reg = <0>;
> >> +				color = <LED_COLOR_ID_YELLOW>;
> >> +				function = LED_FUNCTION_LAN;
> >> +				function-enumerator = <1>;
> >
> >Why aren't you simply using a label?
> 
> You mean the comment? I can add it of course like for regulators.
> 
> >> +				default-state = "keep";
> >> +				linux,default-trigger = "netdev";

Using linux,default-trigger = "netdev" will NOT work as intended,
see also the reply to your other patch where you are adding netdev
trigger to dt-bindings.
If you do this, it will seemingly work, but if you check
/sys/class/leds/foo/hw_control
it will always be 0, and hardware offloading will hence never be used.
Please just set the LED trigger in userspace for now.

> >> +			};
> >> +			led@1 { /* en8811_a_gpio4 */
> >> +				reg = <1>;
> >> +				color = <LED_COLOR_ID_GREEN>;
> >> +				function = LED_FUNCTION_LAN;
> >> +				function-enumerator = <2>;
> >> +				default-state = "keep";
> >> +				linux,default-trigger = "netdev";
> >> +			};
> >> +		};
> >> +	};
> >> +
> >> +	phy15: ethernet-phy@15 {
> >> +		reg = <15>;
> >
> >Same here.
> >
> >Cheers,
> >Angelo
> >
> 
> 
> regards Frank
> 

