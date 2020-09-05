Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D11EB25E7B4
	for <lists+linux-leds@lfdr.de>; Sat,  5 Sep 2020 15:06:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728616AbgIENGR (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 5 Sep 2020 09:06:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728596AbgIENFz (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 5 Sep 2020 09:05:55 -0400
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E0C8C061251
        for <linux-leds@vger.kernel.org>; Sat,  5 Sep 2020 06:05:55 -0700 (PDT)
Received: by mail-ej1-x642.google.com with SMTP id i22so12083696eja.5
        for <linux-leds@vger.kernel.org>; Sat, 05 Sep 2020 06:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=322eLsEkmbv53gakapl+TlGOtJ3WQUkBPPAQWpyScfE=;
        b=kQNjQbg24wE2noUhH/XL3Yv48U/r42eVaF/Vcl6GP9z139gppRyLfkLNMKrcUheWD8
         St2+aHKvpcrSBPge0mIzvBo3Hfg/iLDojHnF8cwbUuSvyDyuZm+fuhMTKxlPdI8NaxCh
         JIWUsqGem8KmLGBftrsb1MIXf3av9mgDc55ZsqIOtDjJZ9V4SNelbJqI8DfFrk9HYJRD
         EemIaP+fOJOQOueqoIaTqnGnAanjJzzUl71Z33NzkOwDuwO+ZVCeCPGkZZVp1ZEdWLlP
         lFBI03nMva2ZDWuYc77pPrq7LeyevivgPlX8wetBM8Qqut/kbl5IjlsgBPRrUMKBPlVT
         CSGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=322eLsEkmbv53gakapl+TlGOtJ3WQUkBPPAQWpyScfE=;
        b=hxlfTWkOLjV9o8lS6C7BSUN1EtvW+QMacyus4Cya+01y4qLCzF+G08h/F/OJ1/e8Kj
         AYjsc8UOsu6In3LBxvHTmKyMHyXrJ/ucL5bUh/a/e7rOc3nfd417o9NVlt6K/iZwQQCL
         9779dRSEO7REPpmwsFJVxukBc8raciegJ8g9C6U8+fThtVw4AyJ30ubyLMR1VQdcNtq8
         OJspp1ocYiI3hYZVSvpbHJp6DYADwhlsQs5XmfiHJEaybE1YQR6Y2uyiPmAvUMyWAUAQ
         5e9idPpi3pekRJVxqSQSta++RcT61b3LQ6EXot6PW6F8mPLy9CS3iR9FcICWB5TMma5c
         LHAg==
X-Gm-Message-State: AOAM533VhyZ482a3kLX7ElY1S3ajXYTQPprWpjWbrRztrIVs78Kf7I+p
        kWZqo3o6k7bcTk1LlyuLyzjtWA==
X-Google-Smtp-Source: ABdhPJwTFofQxT5+Xqmduh9lEX7PsTno/supz5boDjSPMZy4MCfbWku9BL2CzrpPh1wWjP/gUjz9/w==
X-Received: by 2002:a17:906:4cc7:: with SMTP id q7mr12780600ejt.437.1599311153536;
        Sat, 05 Sep 2020 06:05:53 -0700 (PDT)
Received: from localhost.localdomain ([2a00:ee2:4b0d:3002:290:faff:fe54:449c])
        by smtp.gmail.com with ESMTPSA id s18sm9372655ejd.54.2020.09.05.06.05.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2020 06:05:52 -0700 (PDT)
From:   Luka Kovacic <luka.kovacic@sartura.hr>
To:     linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-leds@vger.kernel.org
Cc:     lee.jones@linaro.org, pavel@ucw.cz, dmurphy@ti.com,
        robh+dt@kernel.org, jdelvare@suse.com, linux@roeck-us.net,
        andrew@lunn.ch, jason@lakedaemon.net, gregory.clement@bootlin.com,
        luka.perkov@sartura.hr, Luka Kovacic <luka.kovacic@sartura.hr>
Subject: [PATCH 7/7] arm64: dts: marvell: Add a device tree for the iEi Puzzle-M801 board
Date:   Sat,  5 Sep 2020 15:03:36 +0200
Message-Id: <20200905130336.967622-8-luka.kovacic@sartura.hr>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200905130336.967622-1-luka.kovacic@sartura.hr>
References: <20200905130336.967622-1-luka.kovacic@sartura.hr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Add initial support for the iEi Puzzle-M801 1U Rackmount Network
Appliance board.

The board is based on the quad-core Marvell Armada 8040 SoC and supports
up to 16 GB of DDR4 2400 MHz ECC RAM. It has a PCIe x16 slot (x2 lanes
only) and an M.2 type B slot.

Main system hardware:
2x USB 3.0
4x Gigabit Ethernet
2x SFP+
1x SATA 3.0
1x M.2 type B
1x RJ45 UART
1x SPI flash
1x iEi WT61P803 PUZZLE Microcontroller
1x EPSON RX8010 RTC (used instead of the integrated Marvell RTC controller)
6x SFP+ LED
1x HDD LED

All of the hardware listed above is supported and tested in this port.

Signed-off-by: Luka Kovacic <luka.kovacic@sartura.hr>
Cc: Luka Perkov <luka.perkov@sartura.hr>
---
 arch/arm64/boot/dts/marvell/Makefile          |   1 +
 .../dts/marvell/armada-8040-puzzle-m801.dts   | 519 ++++++++++++++++++
 2 files changed, 520 insertions(+)
 create mode 100644 arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dts

diff --git a/arch/arm64/boot/dts/marvell/Makefile b/arch/arm64/boot/dts/marvell/Makefile
index 3e5f2e7a040c..e413c3261792 100644
--- a/arch/arm64/boot/dts/marvell/Makefile
+++ b/arch/arm64/boot/dts/marvell/Makefile
@@ -12,6 +12,7 @@ dtb-$(CONFIG_ARCH_MVEBU) += armada-8040-clearfog-gt-8k.dtb
 dtb-$(CONFIG_ARCH_MVEBU) += armada-8040-db.dtb
 dtb-$(CONFIG_ARCH_MVEBU) += armada-8040-mcbin.dtb
 dtb-$(CONFIG_ARCH_MVEBU) += armada-8040-mcbin-singleshot.dtb
+dtb-$(CONFIG_ARCH_MVEBU) += armada-8040-puzzle-m801.dtb
 dtb-$(CONFIG_ARCH_MVEBU) += armada-8080-db.dtb
 dtb-$(CONFIG_ARCH_MVEBU) += cn9130-db.dtb
 dtb-$(CONFIG_ARCH_MVEBU) += cn9131-db.dtb
diff --git a/arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dts b/arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dts
new file mode 100644
index 000000000000..2921202b4f7b
--- /dev/null
+++ b/arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dts
@@ -0,0 +1,519 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (C) 2016 Marvell Technology Group Ltd.
+ * Copyright (C) 2020 Sartura Ltd.
+ *
+ * Device Tree file for iEi Puzzle-M801
+ */
+
+#include "armada-8040.dtsi"
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/leds/common.h>
+
+/ {
+	model = "iEi-Puzzle-M801";
+	compatible = "marvell,armada8040", "marvell,armada-ap806-quad", "marvell,armada-ap806";
+
+	aliases {
+		ethernet0 = &cp0_eth0;
+		ethernet1 = &cp1_eth0;
+		ethernet2 = &cp0_eth1;
+		ethernet3 = &cp0_eth2;
+		ethernet4 = &cp1_eth1;
+		ethernet5 = &cp1_eth2;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	memory@0 {
+		device_type = "memory";
+		reg = <0x0 0x0 0x0 0x80000000>;
+	};
+
+	/* Regulator labels correspond with schematics */
+	v_3_3: regulator-3-3v {
+		compatible = "regulator-fixed";
+		regulator-name = "v_3_3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+		status = "okay";
+	};
+
+	v_5v0_usb3_hst_vbus: regulator-usb3-vbus0 {
+		compatible = "regulator-fixed";
+		enable-active-high;
+		gpio = <&cp0_gpio2 15 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&cp0_xhci_vbus_pins>;
+		regulator-name = "v_5v0_usb3_hst_vbus";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		status = "okay";
+	};
+
+	v_vddo_h: regulator-1-8v {
+		compatible = "regulator-fixed";
+		regulator-name = "v_vddo_h";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-always-on;
+		status = "okay";
+	};
+
+	sfp_cp0_eth0: sfp-cp0-eth0 {
+		compatible = "sff,sfp";
+		i2c-bus = <&sfpplus0_i2c>;
+		los-gpio = <&sfpplus_gpio 11 GPIO_ACTIVE_HIGH>;
+		mod-def0-gpio = <&sfpplus_gpio 10 GPIO_ACTIVE_LOW>;
+		tx-disable-gpio = <&sfpplus_gpio 9 GPIO_ACTIVE_HIGH>;
+		tx-fault-gpio  = <&sfpplus_gpio 8 GPIO_ACTIVE_HIGH>;
+		maximum-power-milliwatt = <3000>;
+	};
+
+	sfp_cp1_eth0: sfp-cp1-eth0 {
+		compatible = "sff,sfp";
+		i2c-bus = <&sfpplus1_i2c>;
+		los-gpio = <&sfpplus_gpio 3 GPIO_ACTIVE_HIGH>;
+		mod-def0-gpio = <&sfpplus_gpio 2 GPIO_ACTIVE_LOW>;
+		tx-disable-gpio = <&sfpplus_gpio 1 GPIO_ACTIVE_HIGH>;
+		tx-fault-gpio  = <&sfpplus_gpio 0 GPIO_ACTIVE_HIGH>;
+		maximum-power-milliwatt = <3000>;
+	};
+
+	leds {
+		compatible = "gpio-leds";
+		status = "okay";
+		pinctrl-0 = <&cp0_sfpplus_led_pins &cp1_sfpplus_led_pins>;
+		pinctrl-names = "default";
+
+		led0 {
+			function = LED_FUNCTION_STATUS;
+			label = "p2_act";
+			gpios = <&cp1_gpio1 6 GPIO_ACTIVE_LOW>;
+		};
+
+		led1 {
+			function = LED_FUNCTION_STATUS;
+			label = "p1_act";
+			gpios = <&cp1_gpio1 14 GPIO_ACTIVE_LOW>;
+		};
+
+		led2 {
+			function = LED_FUNCTION_STATUS;
+			label = "p2_10g";
+			gpios = <&cp1_gpio1 7 GPIO_ACTIVE_LOW>;
+		};
+
+		led3 {
+			function = LED_FUNCTION_STATUS;
+			label = "p2_1g";
+			gpios = <&cp1_gpio1 8 GPIO_ACTIVE_LOW>;
+		};
+
+		led4 {
+			function = LED_FUNCTION_STATUS;
+			label = "p1_10g";
+			gpios = <&cp1_gpio1 10 GPIO_ACTIVE_LOW>;
+		};
+
+		led5 {
+			function = LED_FUNCTION_STATUS;
+			label = "p1_1g";
+			gpios = <&cp1_gpio1 31 GPIO_ACTIVE_LOW>;
+		};
+
+		led6 {
+			function = LED_FUNCTION_STATUS;
+			linux,default-trigger = "disk-activity";
+			label = "front-hdd-led";
+			gpios = <&cp0_gpio2 22 GPIO_ACTIVE_HIGH>;
+		};
+
+	};
+};
+
+&ap_sdhci0 {
+	bus-width = <8>;
+	/*
+	 * Not stable in HS modes - phy needs "more calibration", so add
+	 * the "slow-mode" and disable SDR104, SDR50 and DDR50 modes.
+	 */
+	marvell,xenon-phy-slow-mode;
+	no-1-8-v;
+	no-sd;
+	no-sdio;
+	non-removable;
+	status = "okay";
+	vqmmc-supply = <&v_vddo_h>;
+};
+
+&ap_thermal_cpu1 {
+	trips {
+		cpu_active: cpu-active {
+			temperature = <44000>;
+			hysteresis = <2000>;
+			type = "active";
+		};
+	};
+	cooling-maps {
+		fan-map {
+			trip = <&cpu_active>;
+			cooling-device = <&chassis_fan_group0 64 THERMAL_NO_LIMIT>,
+					<&chassis_fan_group1 64 THERMAL_NO_LIMIT>;
+		};
+	};
+};
+
+&i2c0 {
+	clock-frequency = <100000>;
+	status = "okay";
+
+	rtc@32 {
+		compatible = "epson,rx8010";
+		reg = <0x32>;
+	};
+};
+
+&spi0 {
+	status = "okay";
+	spi-flash@0 {
+		#address-cells = <0x1>;
+		#size-cells = <0x1>;
+		compatible = "jedec,spi-nor";
+		reg = <0x0>;
+		spi-max-frequency = <20000000>;
+		partition@u-boot {
+			label = "u-boot";
+			reg = <0x00000000 0x001f0000>;
+		};
+		partition@u-boot-env {
+			label = "u-boot-env";
+			reg = <0x001f0000 0x00010000>;
+		};
+		partition@ubi1 {
+			label = "ubi1";
+			reg = <0x00200000 0x03f00000>;
+		};
+		partition@ubi2 {
+			label = "ubi2";
+			reg = <0x04100000 0x03f00000>;
+		};
+	};
+};
+
+&uart0 {
+	status = "okay";
+	pinctrl-0 = <&uart0_pins>;
+	pinctrl-names = "default";
+};
+
+&uart1 {
+	status = "okay";
+	/* iEi WT61P803 PUZZLE MCU Controller */
+	mcu {
+		compatible = "iei,wt61p803-puzzle";
+		current-speed = <115200>;
+		enable-probe-beep;
+
+		leds {
+			compatible = "iei,wt61p803-puzzle-leds";
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			led@0 {
+				reg = <0>;
+				color = <LED_COLOR_ID_BLUE>;
+				label = "front-power-led";
+			};
+		};
+
+		iei-wt61p803-puzzle-hwmon {
+			compatible = "iei,wt61p803-puzzle-hwmon";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			chassis_fan_group0:fan-group@0 {
+				#cooling-cells = <2>;
+				reg = <0x00>;
+				cooling-levels = <64 102 170 230 250>;
+			};
+
+			chassis_fan_group1:fan-group@1 {
+				#cooling-cells = <2>;
+				reg = <0x01>;
+				cooling-levels = <64 102 170 230 250>;
+			};
+		};
+	};
+};
+
+&cp0_rtc {
+	status = "disabled";
+};
+
+&cp0_i2c0 {
+	clock-frequency = <100000>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&cp0_i2c0_pins>;
+	status = "okay";
+
+	sfpplus_gpio: gpio@21 {
+		compatible = "nxp,pca9555";
+		reg = <0x21>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
+	eeprom@54 {
+		compatible = "atmel,24c04";
+		reg = <0x54>;
+	};
+};
+
+&cp0_i2c1 {
+	clock-frequency = <100000>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&cp0_i2c1_pins>;
+	status = "okay";
+
+	i2c-switch@70 {
+		compatible = "nxp,pca9544";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		reg = <0x70>;
+
+		sfpplus0_i2c: i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+		};
+
+		sfpplus1_i2c: i2c@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+		};
+	};
+};
+
+&cp0_uart1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&cp0_uart1_pins>;
+	status = "okay";
+};
+
+&cp0_mdio {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	status = "okay";
+
+	ge_phy2: ethernet-phy@2 {
+		reg = <0>;
+	};
+
+	ge_phy3: ethernet-phy@3 {
+		reg = <1>;
+	};
+};
+
+&cp0_pcie0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&cp0_pcie_pins>;
+	num-lanes = <1>;
+	num-viewport = <8>;
+	reset-gpios = <&cp0_gpio2 20 GPIO_ACTIVE_LOW>;
+	ranges = <0x82000000 0x0 0xc0000000 0x0 0xc0000000 0x0 0x20000000>;
+	phys = <&cp0_comphy0 0>;
+	phy-names = "cp0-pcie0-x1-phy";
+	status = "okay";
+};
+
+&cp0_pinctrl {
+	cp0_ge_mdio_pins: ge-mdio-pins {
+		marvell,pins = "mpp32", "mpp34";
+		marvell,function = "ge";
+	};
+	cp0_i2c1_pins: i2c1-pins {
+		marvell,pins = "mpp35", "mpp36";
+		marvell,function = "i2c1";
+	};
+	cp0_i2c0_pins: i2c0-pins {
+		marvell,pins = "mpp37", "mpp38";
+		marvell,function = "i2c0";
+	};
+	cp0_uart1_pins: uart1-pins {
+		marvell,pins = "mpp40", "mpp41";
+		marvell,function = "uart1";
+	};
+	cp0_xhci_vbus_pins: xhci0-vbus-pins {
+		marvell,pins = "mpp47";
+		marvell,function = "gpio";
+	};
+	cp0_pcie_pins: pcie-pins {
+		marvell,pins = "mpp52";
+		marvell,function = "gpio";
+	};
+	cp0_sdhci_pins: sdhci-pins {
+		marvell,pins = "mpp55", "mpp56", "mpp57", "mpp58", "mpp59",
+			       "mpp60", "mpp61";
+		marvell,function = "sdio";
+	};
+	cp0_sfpplus_led_pins: sfpplus-led-pins {
+		marvell,pins = "mpp54";
+		marvell,function = "gpio";
+	};
+};
+
+&cp0_ethernet {
+	status = "okay";
+};
+
+&cp0_eth0 {
+	status = "okay";
+	phy-mode = "10gbase-r";
+	phys = <&cp0_comphy4 0>;
+	local-mac-address = [00 50 43 de ff 00];
+	sfp = <&sfp_cp0_eth0>;
+	managed = "in-band-status";
+};
+
+&cp0_eth1 {
+	status = "okay";
+	phy = <&ge_phy2>;
+	phy-mode = "sgmii";
+	local-mac-address = [00 50 43 de ff 01];
+	phys = <&cp0_comphy3 1>;
+};
+
+&cp0_eth2 {
+	status = "okay";
+	phy-mode = "sgmii";
+	phys = <&cp0_comphy1 2>;
+	local-mac-address = [00 50 43 de ff 02];
+	phy = <&ge_phy3>;
+};
+
+&cp0_sata0 {
+	status = "okay";
+
+	sata-port@0 {
+		phys = <&cp0_comphy2 0>;
+		phy-names = "cp0-sata0-0-phy";
+	};
+
+	sata-port@1 {
+		phys = <&cp0_comphy5 1>;
+		phy-names = "cp0-sata0-1-phy";
+	};
+};
+
+&cp0_sdhci0 {
+	broken-cd;
+	bus-width = <4>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&cp0_sdhci_pins>;
+	status = "okay";
+	vqmmc-supply = <&v_3_3>;
+};
+
+&cp0_usb3_0 {
+	status = "okay";
+};
+
+&cp0_usb3_1 {
+	status = "okay";
+};
+
+&cp1_i2c0 {
+	clock-frequency = <100000>;
+	status = "disabled";
+};
+
+&cp1_i2c1 {
+	clock-frequency = <100000>;
+	status = "disabled";
+};
+
+&cp1_rtc {
+	status = "disabled";
+};
+
+&cp1_ethernet {
+	status = "okay";
+};
+
+&cp1_eth0 {
+	status = "okay";
+	phy-mode = "10gbase-r";
+	phys = <&cp1_comphy4 0>;
+	local-mac-address = [00 50 43 de ff 03];
+	sfp = <&sfp_cp1_eth0>;
+	managed = "in-band-status";
+};
+
+&cp1_eth1 {
+	status = "okay";
+	phy = <&ge_phy4>;
+	phy-mode = "sgmii";
+	local-mac-address = [00 50 43 de ff 04];
+	phys = <&cp1_comphy3 1>;
+};
+
+&cp1_eth2 {
+	status = "okay";
+	phy-mode = "sgmii";
+	local-mac-address = [00 50 43 de ff 05];
+	phys = <&cp1_comphy5 2>;
+	phy = <&ge_phy5>;
+};
+
+&cp1_pinctrl {
+	cp1_sfpplus_led_pins: sfpplus-led-pins {
+		marvell,pins = "mpp6", "mpp7", "mpp8", "mpp10", "mpp14", "mpp31";
+		marvell,function = "gpio";
+	};
+};
+
+&cp1_uart0 {
+	status = "disabled";
+};
+
+&cp1_comphy2 {
+	cp1_usbh0_con: connector {
+		compatible = "usb-a-connector";
+		phy-supply = <&v_5v0_usb3_hst_vbus>;
+	};
+};
+
+&cp1_usb3_0 {
+	phys = <&cp1_comphy2 0>;
+	phy-names = "cp1-usb3h0-comphy";
+	status = "okay";
+};
+
+&cp1_mdio {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	status = "okay";
+
+	ge_phy4: ethernet-phy@4 {
+		reg = <1>;
+	};
+	ge_phy5: ethernet-phy@5 {
+		reg = <0>;
+	};
+};
+
+&cp1_pcie0 {
+	num-lanes = <2>;
+	phys = <&cp1_comphy0 0>, <&cp1_comphy1 0>;
+	phy-names = "cp1-pcie0-x2-lane0-phy", "cp1-pcie0-x2-lane1-phy";
+	status = "okay";
+};
-- 
2.20.1

