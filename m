Return-Path: <linux-leds+bounces-1646-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 539B28C11E9
	for <lists+linux-leds@lfdr.de>; Thu,  9 May 2024 17:22:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 77D4E1C21583
	for <lists+linux-leds@lfdr.de>; Thu,  9 May 2024 15:22:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F334E16F825;
	Thu,  9 May 2024 15:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mailerdienst.de header.i=@mailerdienst.de header.b="Qvj+NSbY"
X-Original-To: linux-leds@vger.kernel.org
Received: from mxout4.routing.net (mxout4.routing.net [134.0.28.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8378A16F823;
	Thu,  9 May 2024 15:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.0.28.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715268138; cv=none; b=ig6AbiKC1/Bmr6YY9S7toUo/q9g4MfKhjK93PEIc7cqntCXUZ5iIZkVtA1O9umADTnevHZonBX+2PZVoBk6V7UIb/oOB/szwEKLVkiOQgvTr8NF/rRFKRUa7gBu3AeueFcZJKT1bkRGjWN2KC/SGj+R+HIE9lpJ/n87ZSOtxtJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715268138; c=relaxed/simple;
	bh=g27TH0GfwlXlPIR4iWQEmDfVasbH2Cyw1Js+fUjLFUg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=clgKmF4CQ/OyRWoMF0/RGnN6Oy6jlwYdrPJuMdtWb0MPGNr8D4Xdjifng0CEUjzpCIr2qr1DD5DqzssT2RAxomw9ms7gjUHpWwaOfjKCXUQPR/tplb7aSvDx9pJ4V80KJ0GngtdRZ1Xrf/B9otbUbs2Q+aGcB0lL8CVm0w/6Fq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fw-web.de; spf=pass smtp.mailfrom=fw-web.de; dkim=pass (1024-bit key) header.d=mailerdienst.de header.i=@mailerdienst.de header.b=Qvj+NSbY; arc=none smtp.client-ip=134.0.28.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fw-web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fw-web.de
Received: from mxbox3.masterlogin.de (unknown [192.168.10.78])
	by mxout4.routing.net (Postfix) with ESMTP id 2A134100D7C;
	Thu,  9 May 2024 15:22:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1715268128;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KSApDUWx3Ivo0aH4pfh174rewacA6nt9Ad68I5vywH0=;
	b=Qvj+NSbYm57YM2N37NaH2wCl1ncUtwYtnjecppIcwvLvA406zo0kdwgRPgz57e+OTh5wvx
	mTr18q5S1iFyIRIORukbwaQ4IL5cXnQC5mySJ459WnHgnLhqgGUnFFQiTGaloWudlZKJgg
	gE2Bsm/+YubngVS46ZZ0NgneSbLviL4=
Received: from frank-G5.. (fttx-pool-217.61.150.116.bambit.de [217.61.150.116])
	by mxbox3.masterlogin.de (Postfix) with ESMTPSA id 28FCF36025A;
	Thu,  9 May 2024 15:22:07 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Frank Wunderlich <frank-w@public-files.de>,
	Eric Woudstra <ericwouds@gmail.com>,
	Tianling Shen <cnsztl@immortalwrt.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-leds@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Tianling Shen <cnsztl@gmail.com>
Subject: [PATCH v2 2/2] arm64: dts: mediatek: Add  mt7986 based Bananapi R3 Mini
Date: Thu,  9 May 2024 17:21:57 +0200
Message-Id: <20240509152157.10162-3-linux@fw-web.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240509152157.10162-1-linux@fw-web.de>
References: <20240509152157.10162-1-linux@fw-web.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mail-ID: 7414568c-cc8c-488f-a1d6-9e11e8596d71

From: Frank Wunderlich <frank-w@public-files.de>

Add devicetree for Bananapi R3 Mini SBC.

Key features:
- MediaTek MT7986A(Filogic 830) Quad core ARM Cortex A53
- Wifi 6 2.4G/5G（MT7976C）
- 2G DDR RAM
- 8G eMMC flash
- 128MB Nand flash
- 2x 2.5GbE network port
- 1x M.2 Key B USB interface
- 1x M.2 KEY M PCIe interface
- 1x USB2.0 interface

source: https://wiki.banana-pi.org/Banana_Pi_BPI-R3_Mini

Co-developed-by: Eric Woudstra <ericwouds@gmail.com>
Signed-off-by: Eric Woudstra <ericwouds@gmail.com>
Co-developed-by: Tianling Shen <cnsztl@gmail.com>
Signed-off-by: Tianling Shen <cnsztl@gmail.com>
Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
v2:
- add missing node for nand
- add some information about the board in description

change dts based on review from angelo+krzysztof

- drop fan status
- rename phy14 to phy0 and phy15 to phy1
- drop default-trigger from phys and so also the binding-patch
- use regulator names based on regexp regulator-[0-9]+v[0-9]+
- add comment for pwm
---
 arch/arm64/boot/dts/mediatek/Makefile         |   1 +
 .../mediatek/mt7986a-bananapi-bpi-r3-mini.dts | 493 ++++++++++++++++++
 2 files changed, 494 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-mini.dts

diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/mediatek/Makefile
index 37b4ca3a87c9..1763b001ab06 100644
--- a/arch/arm64/boot/dts/mediatek/Makefile
+++ b/arch/arm64/boot/dts/mediatek/Makefile
@@ -11,6 +11,7 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt7622-bananapi-bpi-r64.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt7981b-xiaomi-ax3000t.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-acelink-ew-7886cax.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-bananapi-bpi-r3.dtb
+dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-bananapi-bpi-r3-mini.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-bananapi-bpi-r3-emmc.dtbo
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-bananapi-bpi-r3-nand.dtbo
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-bananapi-bpi-r3-nor.dtbo
diff --git a/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-mini.dts b/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-mini.dts
new file mode 100644
index 000000000000..e2a2fea7adf0
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-mini.dts
@@ -0,0 +1,493 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright (C) 2021 MediaTek Inc.
+ * Authors: Frank Wunderlich <frank-w@public-files.de>
+ *          Eric Woudstra <ericwouds@gmail.com>
+ *          Tianling Shen <cnsztl@immortalwrt.org>
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/leds/common.h>
+#include <dt-bindings/pinctrl/mt65xx.h>
+
+#include "mt7986a.dtsi"
+
+/ {
+	model = "Bananapi BPI-R3 Mini";
+	chassis-type = "embedded";
+	compatible = "bananapi,bpi-r3mini", "mediatek,mt7986a";
+
+	aliases {
+		serial0 = &uart0;
+		ethernet0 = &gmac0;
+		ethernet1 = &gmac1;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	dcin: regulator-12v {
+		compatible = "regulator-fixed";
+		regulator-name = "12vd";
+		regulator-min-microvolt = <12000000>;
+		regulator-max-microvolt = <12000000>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
+	fan: pwm-fan {
+		compatible = "pwm-fan";
+		#cooling-cells = <2>;
+		/*
+		 * The signal is inverted on this board and the PWM driver
+		 * does not support polarity inversion.
+		 */
+		/* cooling level (0, 1, 2) */
+		cooling-levels = <255 96 0>;
+		pwms = <&pwm 0 10000>;
+	};
+
+	reg_1p8v: regulator-1v8 {
+		compatible = "regulator-fixed";
+		regulator-name = "1.8vd";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-boot-on;
+		regulator-always-on;
+		vin-supply = <&dcin>;
+	};
+
+	reg_3p3v: regulator-3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "3.3vd";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-boot-on;
+		regulator-always-on;
+		vin-supply = <&dcin>;
+	};
+
+	usb_vbus: regulator-5v {
+		compatible = "regulator-fixed";
+		regulator-name = "usb_vbus";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		gpios = <&pio 20 GPIO_ACTIVE_LOW>;
+		regulator-boot-on;
+	};
+
+	en8811_a: regulator-phy1 {
+		compatible = "regulator-fixed";
+		regulator-name = "phy1";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&pio 16 GPIO_ACTIVE_LOW>;
+		regulator-always-on;
+	};
+
+	en8811_b: regulator-phy2 {
+		compatible = "regulator-fixed";
+		regulator-name = "phy2";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&pio 17 GPIO_ACTIVE_LOW>;
+		regulator-always-on;
+	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		green_led: led-0 {
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_POWER;
+			gpios = <&pio 19 GPIO_ACTIVE_HIGH>;
+			default-state = "on";
+		};
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		reset-key {
+			label = "reset";
+			linux,code = <KEY_RESTART>;
+			gpios = <&pio 7 GPIO_ACTIVE_LOW>;
+		};
+	};
+
+};
+
+&cpu_thermal {
+	cooling-maps {
+		map0 {
+			/* active: set fan to cooling level 2 */
+			cooling-device = <&fan 2 2>;
+			trip = <&cpu_trip_active_high>;
+		};
+
+		map1 {
+			/* active: set fan to cooling level 1 */
+			cooling-device = <&fan 1 1>;
+			trip = <&cpu_trip_active_med>;
+		};
+
+		map2 {
+			/* active: set fan to cooling level 0 */
+			cooling-device = <&fan 0 0>;
+			trip = <&cpu_trip_active_low>;
+		};
+	};
+};
+
+&crypto {
+	status = "okay";
+};
+
+&eth {
+	status = "okay";
+
+	gmac0: mac@0 {
+		compatible = "mediatek,eth-mac";
+		reg = <0>;
+		phy-mode = "2500base-x";
+		phy-handle = <&phy0>;
+	};
+
+	gmac1: mac@1 {
+		compatible = "mediatek,eth-mac";
+		reg = <1>;
+		phy-mode = "2500base-x";
+		phy-handle = <&phy1>;
+	};
+
+	mdio: mdio-bus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+	};
+};
+
+&mmc0 {
+	pinctrl-names = "default", "state_uhs";
+	pinctrl-0 = <&mmc0_pins_default>;
+	pinctrl-1 = <&mmc0_pins_uhs>;
+	vmmc-supply = <&reg_3p3v>;
+	vqmmc-supply = <&reg_1p8v>;
+};
+
+
+&i2c0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c_pins>;
+	status = "okay";
+
+	/* MAC Address EEPROM */
+	eeprom@50 {
+		compatible = "atmel,24c02";
+		reg = <0x50>;
+
+		address-width = <8>;
+		pagesize = <8>;
+		size = <256>;
+	};
+};
+
+&mdio {
+	phy0: ethernet-phy@14 {
+		reg = <14>;
+		interrupts-extended = <&pio 48 IRQ_TYPE_EDGE_FALLING>;
+		reset-gpios = <&pio 49 GPIO_ACTIVE_LOW>;
+		reset-assert-us = <10000>;
+		reset-deassert-us = <20000>;
+		phy-mode = "2500base-x";
+		full-duplex;
+		pause;
+		airoha,pnswap-rx;
+
+		leds {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			led@0 { /* en8811_a_gpio5 */
+				reg = <0>;
+				color = <LED_COLOR_ID_YELLOW>;
+				function = LED_FUNCTION_LAN;
+				function-enumerator = <1>;
+				default-state = "keep";
+			};
+			led@1 { /* en8811_a_gpio4 */
+				reg = <1>;
+				color = <LED_COLOR_ID_GREEN>;
+				function = LED_FUNCTION_LAN;
+				function-enumerator = <2>;
+				default-state = "keep";
+			};
+		};
+	};
+
+	phy1: ethernet-phy@15 {
+		reg = <15>;
+		interrupts-extended = <&pio 46 IRQ_TYPE_EDGE_FALLING>;
+		reset-gpios = <&pio 47 GPIO_ACTIVE_LOW>;
+		reset-assert-us = <10000>;
+		reset-deassert-us = <20000>;
+		phy-mode = "2500base-x";
+		full-duplex;
+		pause;
+		airoha,pnswap-rx;
+
+		leds {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			led@0 { /* en8811_b_gpio5 */
+				reg = <0>;
+				color = <LED_COLOR_ID_YELLOW>;
+				function = LED_FUNCTION_WAN;
+				function-enumerator = <1>;
+				default-state = "keep";
+			};
+			led@1 { /* en8811_b_gpio4 */
+				reg = <1>;
+				color = <LED_COLOR_ID_GREEN>;
+				function = LED_FUNCTION_WAN;
+				function-enumerator = <2>;
+				default-state = "keep";
+			};
+		};
+	};
+};
+
+&pcie {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pcie_pins>;
+	status = "okay";
+};
+
+&pcie_phy {
+	status = "okay";
+};
+
+&pio {
+	i2c_pins: i2c-pins {
+		mux {
+			function = "i2c";
+			groups = "i2c";
+		};
+	};
+
+	mmc0_pins_default: mmc0-pins {
+		mux {
+			function = "emmc";
+			groups = "emmc_51";
+		};
+		conf-cmd-dat {
+			pins = "EMMC_DATA_0", "EMMC_DATA_1", "EMMC_DATA_2",
+			       "EMMC_DATA_3", "EMMC_DATA_4", "EMMC_DATA_5",
+			       "EMMC_DATA_6", "EMMC_DATA_7", "EMMC_CMD";
+			input-enable;
+			drive-strength = <4>;
+			bias-pull-up = <MTK_PUPD_SET_R1R0_01>; /* pull-up 10K */
+		};
+		conf-clk {
+			pins = "EMMC_CK";
+			drive-strength = <6>;
+			bias-pull-down = <MTK_PUPD_SET_R1R0_10>; /* pull-down 50K */
+		};
+		conf-ds {
+			pins = "EMMC_DSL";
+			bias-pull-down = <MTK_PUPD_SET_R1R0_10>; /* pull-down 50K */
+		};
+		conf-rst {
+			pins = "EMMC_RSTB";
+			drive-strength = <4>;
+			bias-pull-up = <MTK_PUPD_SET_R1R0_01>; /* pull-up 10K */
+		};
+	};
+
+	mmc0_pins_uhs: mmc0-uhs-pins {
+		mux {
+			function = "emmc";
+			groups = "emmc_51";
+		};
+		conf-cmd-dat {
+			pins = "EMMC_DATA_0", "EMMC_DATA_1", "EMMC_DATA_2",
+			       "EMMC_DATA_3", "EMMC_DATA_4", "EMMC_DATA_5",
+			       "EMMC_DATA_6", "EMMC_DATA_7", "EMMC_CMD";
+			input-enable;
+			drive-strength = <4>;
+			bias-pull-up = <MTK_PUPD_SET_R1R0_01>; /* pull-up 10K */
+		};
+		conf-clk {
+			pins = "EMMC_CK";
+			drive-strength = <6>;
+			bias-pull-down = <MTK_PUPD_SET_R1R0_10>; /* pull-down 50K */
+		};
+		conf-ds {
+			pins = "EMMC_DSL";
+			bias-pull-down = <MTK_PUPD_SET_R1R0_10>; /* pull-down 50K */
+		};
+		conf-rst {
+			pins = "EMMC_RSTB";
+			drive-strength = <4>;
+			bias-pull-up = <MTK_PUPD_SET_R1R0_01>; /* pull-up 10K */
+		};
+	};
+
+	pcie_pins: pcie-pins {
+		mux {
+			function = "pcie";
+			groups = "pcie_clk", "pcie_wake", "pcie_pereset";
+		};
+	};
+
+	pwm_pins: pwm-pins {
+		mux {
+			function = "pwm";
+			groups = "pwm0";
+		};
+	};
+
+	spi_flash_pins: spi-flash-pins {
+		mux {
+			function = "spi";
+			groups = "spi0", "spi0_wp_hold";
+		};
+	};
+
+	usb_ngff_pins: usb-ngff-pins {
+		ngff-gnss-off-conf {
+			pins = "GPIO_6";
+			drive-strength = <8>;
+			mediatek,pull-up-adv = <1>;
+		};
+		ngff-pe-rst-conf {
+			pins = "GPIO_7";
+			drive-strength = <8>;
+			mediatek,pull-up-adv = <1>;
+		};
+		ngff-wwan-off-conf {
+			pins = "GPIO_8";
+			drive-strength = <8>;
+			mediatek,pull-up-adv = <1>;
+		};
+		ngff-pwr-off-conf {
+			pins = "GPIO_9";
+			drive-strength = <8>;
+			mediatek,pull-up-adv = <1>;
+		};
+		ngff-rst-conf {
+			pins = "GPIO_10";
+			drive-strength = <8>;
+			mediatek,pull-up-adv = <1>;
+		};
+		ngff-coex-conf {
+			pins = "SPI1_CS";
+			drive-strength = <8>;
+			mediatek,pull-up-adv = <1>;
+		};
+	};
+
+	wf_2g_5g_pins: wf-2g-5g-pins {
+		mux {
+			function = "wifi";
+			groups = "wf_2g", "wf_5g";
+		};
+		conf {
+			pins = "WF0_HB1", "WF0_HB2", "WF0_HB3", "WF0_HB4",
+			       "WF0_HB0", "WF0_HB0_B", "WF0_HB5", "WF0_HB6",
+			       "WF0_HB7", "WF0_HB8", "WF0_HB9", "WF0_HB10",
+			       "WF0_TOP_CLK", "WF0_TOP_DATA", "WF1_HB1",
+			       "WF1_HB2", "WF1_HB3", "WF1_HB4", "WF1_HB0",
+			       "WF1_HB5", "WF1_HB6", "WF1_HB7", "WF1_HB8",
+			       "WF1_TOP_CLK", "WF1_TOP_DATA";
+			drive-strength = <4>;
+		};
+	};
+
+	wf_dbdc_pins: wf-dbdc-pins {
+		mux {
+			function = "wifi";
+			groups = "wf_dbdc";
+		};
+		conf {
+			pins = "WF0_HB1", "WF0_HB2", "WF0_HB3", "WF0_HB4",
+			       "WF0_HB0", "WF0_HB0_B", "WF0_HB5", "WF0_HB6",
+			       "WF0_HB7", "WF0_HB8", "WF0_HB9", "WF0_HB10",
+			       "WF0_TOP_CLK", "WF0_TOP_DATA", "WF1_HB1",
+			       "WF1_HB2", "WF1_HB3", "WF1_HB4", "WF1_HB0",
+			       "WF1_HB5", "WF1_HB6", "WF1_HB7", "WF1_HB8",
+			       "WF1_TOP_CLK", "WF1_TOP_DATA";
+			drive-strength = <4>;
+		};
+	};
+
+	wf_led_pins: wf-led-pins {
+		mux {
+			function = "led";
+			groups = "wifi_led";
+		};
+	};
+};
+
+&pwm {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pwm_pins>;
+	status = "okay";
+};
+
+&spi0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&spi_flash_pins>;
+	status = "okay";
+
+	flash@0 {
+		compatible = "spi-nand";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		reg = <0>;
+
+		spi-max-frequency = <20000000>;
+		spi-tx-bus-width = <4>;
+		spi-rx-bus-width = <4>;
+	};
+};
+
+&ssusb {
+	pinctrl-names = "default";
+	pinctrl-0 = <&usb_ngff_pins>;
+	vusb33-supply = <&reg_3p3v>;
+	vbus-supply = <&usb_vbus>;
+	status = "okay";
+};
+
+&trng {
+	status = "okay";
+};
+
+&uart0 {
+	status = "okay";
+};
+
+&usb_phy {
+	status = "okay";
+};
+
+&watchdog {
+	status = "okay";
+};
+
+&wifi {
+	status = "okay";
+	pinctrl-names = "default", "dbdc";
+	pinctrl-0 = <&wf_2g_5g_pins>, <&wf_led_pins>;
+	pinctrl-1 = <&wf_dbdc_pins>, <&wf_led_pins>;
+
+	led {
+		led-active-low;
+	};
+};
+
-- 
2.34.1


