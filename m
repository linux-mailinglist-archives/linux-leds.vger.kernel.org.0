Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1E291D4081
	for <lists+linux-leds@lfdr.de>; Fri, 11 Oct 2019 15:09:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728377AbfJKNHf (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 11 Oct 2019 09:07:35 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:36974 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728252AbfJKNHf (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 11 Oct 2019 09:07:35 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9BD7KXJ078497;
        Fri, 11 Oct 2019 08:07:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1570799240;
        bh=JLAX1GO8r1BPAaQSP8nT877GyOWJiBCNm5vdl8bnxYc=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=dLDs2JnZk/WVVSC+eI7LkyUUolPAstp2e0aTvCtDcji8PQgC52mdme9ahOt9Jq5F6
         wIRji60tWo81XrW1g0CNImfNq/ZfyX36HKYmX4Bh0LTioL8iDcK5b5/5NCSi17kW3W
         IH7Cm1ZOho6mo6yVTf/FaXd7Qtkhe/2ZjQwS1Q6w=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9BD7K7t090711
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 11 Oct 2019 08:07:20 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 11
 Oct 2019 08:07:16 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 11 Oct 2019 08:07:20 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9BD7Kla105215;
        Fri, 11 Oct 2019 08:07:20 -0500
From:   Dan Murphy <dmurphy@ti.com>
To:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>
CC:     <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Dan Murphy <dmurphy@ti.com>, Tony Lindgren <tony@atomide.com>,
        =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>
Subject: [PATCH v12 08/16] dt: bindings: lp55xx: Update binding for Multicolor Framework
Date:   Fri, 11 Oct 2019 08:06:49 -0500
Message-ID: <20191011130657.4713-9-dmurphy@ti.com>
X-Mailer: git-send-email 2.22.0.214.g8dca754b1e
In-Reply-To: <20191011130657.4713-1-dmurphy@ti.com>
References: <20191011130657.4713-1-dmurphy@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Update the DT binding to include the properties to use the
multicolor framework for the devices that use the LP55xx
framework.

Signed-off-by: Dan Murphy <dmurphy@ti.com>
CC: Tony Lindgren <tony@atomide.com>
CC: "Benoît Cousson" <bcousson@baylibre.com>
CC: Linus Walleij <linus.walleij@linaro.org>
CC: Shawn Guo <shawnguo@kernel.org>
CC: Sascha Hauer <s.hauer@pengutronix.de>
CC: Pengutronix Kernel Team <kernel@pengutronix.de>
CC: Fabio Estevam <festevam@gmail.com>
CC: NXP Linux Team <linux-imx@nxp.com>
---
 .../devicetree/bindings/leds/leds-lp55xx.txt  | 149 +++++++++++++++---
 1 file changed, 124 insertions(+), 25 deletions(-)

diff --git a/Documentation/devicetree/bindings/leds/leds-lp55xx.txt b/Documentation/devicetree/bindings/leds/leds-lp55xx.txt
index bfe2805c5534..736a2e1538be 100644
--- a/Documentation/devicetree/bindings/leds/leds-lp55xx.txt
+++ b/Documentation/devicetree/bindings/leds/leds-lp55xx.txt
@@ -1,6 +1,8 @@
 Binding for TI/National Semiconductor LP55xx LED Drivers
 
 Required properties:
+- #address-cells: 1
+- #size-cells: 0
 - compatible: one of
 	national,lp5521
 	national,lp5523
@@ -14,6 +16,18 @@ Required properties:
 Each child has own specific current settings
 - led-cur: Current setting at each LED channel (mA x10, 0 if LED is not connected)
 - max-cur: Maximun current at each LED channel.
+- reg: Output channel for the LED.  This is zero based channel identifier and
+	the data sheet is a one based channel identifier.
+	reg value to output to LED output number
+	D1 = reg value is 0
+	D2 = reg value is 1
+	D3 = reg value is 2
+	D4 = reg value is 3
+	D5 = reg value is 4
+	D6 = reg value is 5
+	D7 = reg value is 6
+	D8 = reg value is 7
+	D9 = reg value is 8
 
 Optional properties:
 - enable-gpio: GPIO attached to the chip's enable pin
@@ -35,23 +49,28 @@ example 1) LP5521
 on channel 0.
 
 lp5521@32 {
+	#address-cells = <1>;
+	#size-cells = <0>;
 	compatible = "national,lp5521";
 	reg = <0x32>;
 	label = "lp5521_pri";
 	clock-mode = /bits/ 8 <2>;
 
-	chan0 {
+	chan@0 {
+		reg = <0>;
 		led-cur = /bits/ 8 <0x2f>;
 		max-cur = /bits/ 8 <0x5f>;
 		linux,default-trigger = "heartbeat";
 	};
 
-	chan1 {
+	chan@1 {
+		reg = <1>;
 		led-cur = /bits/ 8 <0x2f>;
 		max-cur = /bits/ 8 <0x5f>;
 	};
 
-	chan2 {
+	chan@2 {
+		reg = <2>;
 		led-cur = /bits/ 8 <0x2f>;
 		max-cur = /bits/ 8 <0x5f>;
 	};
@@ -70,59 +89,70 @@ ASEL1    ASEL0    Address
  VEN      VEN       35h
 
 lp5523@32 {
+	#address-cells = <1>;
+	#size-cells = <0>;
 	compatible = "national,lp5523";
 	reg = <0x32>;
 	clock-mode = /bits/ 8 <1>;
 
-	chan0 {
+	chan@0 {
+		reg = <0>;
 		chan-name = "d1";
 		led-cur = /bits/ 8 <0x14>;
 		max-cur = /bits/ 8 <0x20>;
 	};
 
-	chan1 {
+	chan@1 {
+		reg = <1>;
 		chan-name = "d2";
 		led-cur = /bits/ 8 <0x14>;
 		max-cur = /bits/ 8 <0x20>;
 	};
 
-	chan2 {
+	chan@2 {
+		reg = <2>;
 		chan-name = "d3";
 		led-cur = /bits/ 8 <0x14>;
 		max-cur = /bits/ 8 <0x20>;
 	};
 
-	chan3 {
+	chan@3 {
+		reg = <3>;
 		chan-name = "d4";
 		led-cur = /bits/ 8 <0x14>;
 		max-cur = /bits/ 8 <0x20>;
 	};
 
-	chan4 {
+	chan@4 {
+		reg = <4>;
 		chan-name = "d5";
 		led-cur = /bits/ 8 <0x14>;
 		max-cur = /bits/ 8 <0x20>;
 	};
 
-	chan5 {
+	chan@5 {
+		reg = <5>;
 		chan-name = "d6";
 		led-cur = /bits/ 8 <0x14>;
 		max-cur = /bits/ 8 <0x20>;
 	};
 
-	chan6 {
+	chan@6 {
+		reg = <6>;
 		chan-name = "d7";
 		led-cur = /bits/ 8 <0x14>;
 		max-cur = /bits/ 8 <0x20>;
 	};
 
-	chan7 {
+	chan@7 {
+		reg = <7>;
 		chan-name = "d8";
 		led-cur = /bits/ 8 <0x14>;
 		max-cur = /bits/ 8 <0x20>;
 	};
 
-	chan8 {
+	chan@8 {
+		reg = <8>;
 		chan-name = "d9";
 		led-cur = /bits/ 8 <0x14>;
 		max-cur = /bits/ 8 <0x20>;
@@ -133,29 +163,35 @@ example 3) LP5562
 4 channels are defined.
 
 lp5562@30 {
+	#address-cells = <1>;
+	#size-cells = <0>;
 	compatible = "ti,lp5562";
 	reg = <0x30>;
 	clock-mode = /bits/8 <2>;
 
-	chan0 {
+	chan@0 {
+		reg = <0>;
 		chan-name = "R";
 		led-cur = /bits/ 8 <0x20>;
 		max-cur = /bits/ 8 <0x60>;
 	};
 
-	chan1 {
+	chan@1 {
+		reg = <1>;
 		chan-name = "G";
 		led-cur = /bits/ 8 <0x20>;
 		max-cur = /bits/ 8 <0x60>;
 	};
 
-	chan2 {
+	chan@2 {
+		reg = <2>;
 		chan-name = "B";
 		led-cur = /bits/ 8 <0x20>;
 		max-cur = /bits/ 8 <0x60>;
 	};
 
-	chan3 {
+	chan@3 {
+		reg = <3>;
 		chan-name = "W";
 		led-cur = /bits/ 8 <0x20>;
 		max-cur = /bits/ 8 <0x60>;
@@ -167,62 +203,125 @@ example 4) LP8501
 Others are same as LP5523.
 
 lp8501@32 {
+	#address-cells = <1>;
+	#size-cells = <0>;
 	compatible = "ti,lp8501";
 	reg = <0x32>;
 	clock-mode = /bits/ 8 <2>;
 	pwr-sel = /bits/ 8 <3>;	/* D1~9 connected to VOUT */
 
-	chan0 {
+	chan@0 {
+		reg = <0>;
 		chan-name = "d1";
 		led-cur = /bits/ 8 <0x14>;
 		max-cur = /bits/ 8 <0x20>;
 	};
 
-	chan1 {
+	chan@1 {
+		reg = <1>;
 		chan-name = "d2";
 		led-cur = /bits/ 8 <0x14>;
 		max-cur = /bits/ 8 <0x20>;
 	};
 
-	chan2 {
+	chan@2 {
+		reg = <2>;
 		chan-name = "d3";
 		led-cur = /bits/ 8 <0x14>;
 		max-cur = /bits/ 8 <0x20>;
 	};
 
-	chan3 {
+	chan@3 {
+		reg = <3>;
 		chan-name = "d4";
 		led-cur = /bits/ 8 <0x14>;
 		max-cur = /bits/ 8 <0x20>;
 	};
 
-	chan4 {
+	chan@4 {
+		reg = <4>;
 		chan-name = "d5";
 		led-cur = /bits/ 8 <0x14>;
 		max-cur = /bits/ 8 <0x20>;
 	};
 
-	chan5 {
+	chan@5 {
+		reg = <5>;
 		chan-name = "d6";
 		led-cur = /bits/ 8 <0x14>;
 		max-cur = /bits/ 8 <0x20>;
 	};
 
-	chan6 {
+	chan@6 {
+		reg = <6>;
 		chan-name = "d7";
 		led-cur = /bits/ 8 <0x14>;
 		max-cur = /bits/ 8 <0x20>;
 	};
 
-	chan7 {
+	chan@7 {
+		reg = <7>;
 		chan-name = "d8";
 		led-cur = /bits/ 8 <0x14>;
 		max-cur = /bits/ 8 <0x20>;
 	};
 
-	chan8 {
+	chan@8 {
+		reg = <8>;
 		chan-name = "d9";
 		led-cur = /bits/ 8 <0x14>;
 		max-cur = /bits/ 8 <0x20>;
 	};
 };
+
+Multicolor Framework Support
+In addition to the nodes and properties defined above for device support the
+properties below are needed for multicolor framework support as defined in
+Documentation/devicetree/bindings/leds/leds-class-multicolor.txt
+
+Required child properties for multicolor framework
+	- color : Must be LED_COLOR_ID_MULTI
+	- function : see Documentation/devicetree/bindings/leds/common.txt
+
+Required grandchildren properties
+	- reg : This is the LED output of the device
+	- color : see Documentation/devicetree/bindings/leds/common.txt
+
+Multicolor LED example:
+lp5523: lp5523@32 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	compatible = "national,lp5523";
+	reg = <0x32>;
+	clock-mode = /bits/ 8 <0>; /* LP55XX_CLOCK_AUTO */
+
+	multi-led@2 {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		reg = <2>;
+		color = <LED_COLOR_ID_MULTI>;
+		function = LED_FUNCTION_STANDBY;
+		linux,default-trigger = "heartbeat";
+
+		led@0 {
+			led-cur = /bits/ 8 <50>;
+			max-cur = /bits/ 8 <100>;
+			reg = <0x0>;
+			color = <LED_COLOR_ID_GREEN>;
+		};
+
+		led@1 {
+			led-cur = /bits/ 8 <50>;
+			max-cur = /bits/ 8 <100>;
+			reg = <0x1>;
+			color = <LED_COLOR_ID_BLUE>;
+		};
+
+		led@6 {
+			led-cur = /bits/ 8 <50>;
+			max-cur = /bits/ 8 <100>;
+			reg = <0x6>;
+			color = <LED_COLOR_ID_RED>;
+		};
+	};
+};
-- 
2.22.0.214.g8dca754b1e

