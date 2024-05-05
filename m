Return-Path: <linux-leds+bounces-1596-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A6A968BC2A1
	for <lists+linux-leds@lfdr.de>; Sun,  5 May 2024 18:53:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CA5781C20866
	for <lists+linux-leds@lfdr.de>; Sun,  5 May 2024 16:53:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E16064F890;
	Sun,  5 May 2024 16:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mailerdienst.de header.i=@mailerdienst.de header.b="cnmCwKrQ"
X-Original-To: linux-leds@vger.kernel.org
Received: from mxout3.routing.net (mxout3.routing.net [134.0.28.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BE81381D1;
	Sun,  5 May 2024 16:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.0.28.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714927957; cv=none; b=n1/zeOEl1tcU4pe6IsbdWQ0PKB+Rt7vxkuK3pqJcy+VT6pK2iGTzvy/nji5oEV+sMIPsd5rWmgp3Br9eE0sRlUGZ1lEXx4Ofh+q65jj42mhXCs1fYWIGgmTYebgYqV6owhyw5FSrPdBe7ykBoW1Ego0wnQy+0F316GGzU7r1LaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714927957; c=relaxed/simple;
	bh=EcV8ZD+P458u487RgAGjM2Ou70RwyI3RjnlF1+xjQd4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hR7gJbSjdppO6NLiXgw8eY2AfHxwdx62Q6/4sehWxP5oxY5V6CwC6lCzFyAoNA0ZQiRgnHzRk3vqm0obedQ5YEZISguwVztKFiXa3LCZbTgS1Fpi0m0+KE7nar9PMzliR0xCshm6Jy5yFIQ+ftvYASFUqHcu1b/YY7rN8UXVC5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fw-web.de; spf=pass smtp.mailfrom=fw-web.de; dkim=pass (1024-bit key) header.d=mailerdienst.de header.i=@mailerdienst.de header.b=cnmCwKrQ; arc=none smtp.client-ip=134.0.28.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fw-web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fw-web.de
Received: from mxbox3.masterlogin.de (unknown [192.168.10.78])
	by mxout3.routing.net (Postfix) with ESMTP id 61DA060387;
	Sun,  5 May 2024 16:46:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1714927563;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WfQqspoj71+FxpGCEJ8ZWeoj7IsIk6d99GjgkZWahNc=;
	b=cnmCwKrQSPXqzhZTZ4AxUhETYeALYGqYiPa+OjzvcawVDU6mz6v5VjOmXJxBi2hRprcBJQ
	TJQ8Mv9GzKVRDm5pRQK4djzE+dpXjscgrCB+gdxBA0phVqD+VsyZwXPQWZLhuu3aJpCewy
	si0y4NawJlveYc8HVz0cpyFVqwseTbM=
Received: from frank-G5.. (fttx-pool-217.61.153.24.bambit.de [217.61.153.24])
	by mxbox3.masterlogin.de (Postfix) with ESMTPSA id 541473604D6;
	Sun,  5 May 2024 16:46:02 +0000 (UTC)
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
Subject: [RFC v1 5/5] arm64: dts: mediatek: Add  mt7986 based Bananapi R3 Mini
Date: Sun,  5 May 2024 18:45:49 +0200
Message-Id: <20240505164549.65644-6-linux@fw-web.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240505164549.65644-1-linux@fw-web.de>
References: <20240505164549.65644-1-linux@fw-web.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: e9e85cae-a0b8-45d3-a30a-40942efcc1a2

From: Frank Wunderlich <frank-w@public-files.de>

Add device Tree for Bananapi R3 Mini SBC.

Co-developed-by: Eric Woudstra <ericwouds@gmail.com>
Signed-off-by: Eric Woudstra <ericwouds@gmail.com>
Co-developed-by: Tianling Shen <cnsztl@gmail.com>
Signed-off-by: Tianling Shen <cnsztl@gmail.com>
Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
 arch/arm64/boot/dts/mediatek/Makefile         |   1 +
 .../mediatek/mt7986a-bananapi-bpi-r3-mini.dts | 486 ++++++++++++++++++
 2 files changed, 487 insertions(+)
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
index 000000000000..c764b4dc4752
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-mini.dts
@@ -0,0 +1,486 @@
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
+	dcin: regulator-12vd {
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
+		/* cooling level (0, 1, 2) - pwm inverted */
+		cooling-levels = <255 96 0>;
+		pwms = <&pwm 0 10000>;
+		status = "okay";
+	};
+
+	reg_1p8v: regulator-1p8v {
+		compatible = "regulator-fixed";
+		regulator-name = "1.8vd";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-boot-on;
+		regulator-always-on;
+		vin-supply = <&dcin>;
+	};
+
+	reg_3p3v: regulator-3p3v {
+		compatible = "regulator-fixed";
+		regulator-name = "3.3vd";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-boot-on;
+		regulator-always-on;
+		vin-supply = <&dcin>;
+	};
+
+	usb_vbus: regulator-usb-vbus {
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
+		phy-handle = <&phy14>;
+	};
+
+	gmac1: mac@1 {
+		compatible = "mediatek,eth-mac";
+		reg = <1>;
+		phy-mode = "2500base-x";
+		phy-handle = <&phy15>;
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
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	phy14: ethernet-phy@14 {
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
+				linux,default-trigger = "netdev";
+			};
+			led@1 { /* en8811_a_gpio4 */
+				reg = <1>;
+				color = <LED_COLOR_ID_GREEN>;
+				function = LED_FUNCTION_LAN;
+				function-enumerator = <2>;
+				default-state = "keep";
+				linux,default-trigger = "netdev";
+			};
+		};
+	};
+
+	phy15: ethernet-phy@15 {
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
+				linux,default-trigger = "netdev";
+			};
+			led@1 { /* en8811_b_gpio4 */
+				reg = <1>;
+				color = <LED_COLOR_ID_GREEN>;
+				function = LED_FUNCTION_WAN;
+				function-enumerator = <2>;
+				default-state = "keep";
+				linux,default-trigger = "netdev";
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


