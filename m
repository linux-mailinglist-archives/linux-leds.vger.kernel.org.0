Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A17EBA5ED4
	for <lists+linux-leds@lfdr.de>; Tue,  3 Sep 2019 03:29:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726090AbfICB3B (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 2 Sep 2019 21:29:01 -0400
Received: from inva020.nxp.com ([92.121.34.13]:50022 "EHLO inva020.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725306AbfICB3B (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Mon, 2 Sep 2019 21:29:01 -0400
Received: from inva020.nxp.com (localhost [127.0.0.1])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id C2EFA1A09E7;
        Tue,  3 Sep 2019 03:28:59 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id C75341A09F3;
        Tue,  3 Sep 2019 03:28:47 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 0401F402B1;
        Tue,  3 Sep 2019 09:28:39 +0800 (SGT)
From:   Anson Huang <Anson.Huang@nxp.com>
To:     robh+dt@kernel.org, mark.rutland@arm.com, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc:     Linux-imx@nxp.com, jacek.anaszewski@gmail.com, pavel@ucw.cz,
        dmurphy@ti.com
Subject: [PATCH V2] arm64: dts: imx8mn-ddr4-evk: Enable GPIO LED
Date:   Tue,  3 Sep 2019 09:27:57 -0400
Message-Id: <1567517277-30919-1-git-send-email-Anson.Huang@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

i.MX8MN DDR4 EVK board has a GPIO LED to indicate status,
add support for it.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
Changes since V1:
	- Mention color in the label.
---
 arch/arm64/boot/dts/freescale/imx8mn-ddr4-evk.dts | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn-ddr4-evk.dts b/arch/arm64/boot/dts/freescale/imx8mn-ddr4-evk.dts
index b698061..bf1c097 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-ddr4-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mn-ddr4-evk.dts
@@ -15,6 +15,18 @@
 		stdout-path = &uart2;
 	};
 
+	gpio-leds {
+		compatible = "gpio-leds";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_gpio_led>;
+
+		status {
+			label = "yellow:status";
+			gpios = <&gpio3 16 GPIO_ACTIVE_HIGH>;
+			default-state = "on";
+		};
+	};
+
 	reg_usdhc2_vmmc: regulator-usdhc2 {
 		compatible = "regulator-fixed";
 		pinctrl-names = "default";
@@ -54,6 +66,12 @@
 		>;
 	};
 
+	pinctrl_gpio_led: gpioledgrp {
+		fsl,pins = <
+			MX8MN_IOMUXC_NAND_READY_B_GPIO3_IO16	0x19
+		>;
+	};
+
 	pinctrl_i2c1: i2c1grp {
 		fsl,pins = <
 			MX8MN_IOMUXC_I2C1_SCL_I2C1_SCL		0x400001c3
-- 
2.7.4

