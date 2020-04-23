Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 462771B6034
	for <lists+linux-leds@lfdr.de>; Thu, 23 Apr 2020 18:04:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729606AbgDWQDH (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 23 Apr 2020 12:03:07 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:41104 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729589AbgDWQDG (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 23 Apr 2020 12:03:06 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 03NG2jIs101896;
        Thu, 23 Apr 2020 11:02:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1587657765;
        bh=gecQ/nrPzueOFwjU/S7YNaMux9NZT6tuIgXOBnNn0KY=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=gergmXJrNHpP1waSl03oyckhpBeVmUY4aWa3VZsVR0645iBqKbvnNGAdF6tpz6PS5
         AGirhLoOJCsEKyTbZ+sMm3r++2oRDyhK0NTTjpA/ePKOJrMTFloj4gG+Rrm05bNF0a
         vx4hVfJA0+zi35D4UO7CixWc4zNO8cXrNImabCso=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 03NG2jD9060813
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 23 Apr 2020 11:02:45 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 23
 Apr 2020 11:02:45 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 23 Apr 2020 11:02:45 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 03NG2igx028478;
        Thu, 23 Apr 2020 11:02:45 -0500
From:   Dan Murphy <dmurphy@ti.com>
To:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>
CC:     <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Dan Murphy <dmurphy@ti.com>, Rob Herring <robh+dt@kernel.org>,
        Tony Lindgren <tony@atomide.com>,
        =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>
Subject: [PATCH v20 17/17] dt: bindings: Update lp55xx binding to recommended LED naming
Date:   Thu, 23 Apr 2020 10:55:24 -0500
Message-ID: <20200423155524.13971-18-dmurphy@ti.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200423155524.13971-1-dmurphy@ti.com>
References: <20200423155524.13971-1-dmurphy@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Update the LP55xx DT binding examples to the recommended node
naming convention.  There are no changes to the DT properties.

Signed-off-by: Dan Murphy <dmurphy@ti.com>
CC: Rob Herring <robh+dt@kernel.org>
CC: Tony Lindgren <tony@atomide.com>
CC: "Benoît Cousson" <bcousson@baylibre.com>
CC: Linus Walleij <linus.walleij@linaro.org>
CC: Shawn Guo <shawnguo@kernel.org>
CC: Sascha Hauer <s.hauer@pengutronix.de>
CC: Pengutronix Kernel Team <kernel@pengutronix.de>
CC: Fabio Estevam <festevam@gmail.com>
CC: NXP Linux Team <linux-imx@nxp.com>
Acked-by: Pavel Machek <pavel@ucw.cz>
---
 .../devicetree/bindings/leds/leds-lp55xx.txt  | 58 +++++++++----------
 1 file changed, 29 insertions(+), 29 deletions(-)

diff --git a/Documentation/devicetree/bindings/leds/leds-lp55xx.txt b/Documentation/devicetree/bindings/leds/leds-lp55xx.txt
index 0ccc1efc2499..5475f45ef51f 100644
--- a/Documentation/devicetree/bindings/leds/leds-lp55xx.txt
+++ b/Documentation/devicetree/bindings/leds/leds-lp55xx.txt
@@ -48,7 +48,7 @@ example 1) LP5521
 'lp5521_pri:channel1' and 'lp5521_pri:channel2', with a heartbeat trigger
 on channel 0.
 
-lp5521@32 {
+led-controller@32 {
 	#address-cells = <1>;
 	#size-cells = <0>;
 	compatible = "national,lp5521";
@@ -56,20 +56,20 @@ lp5521@32 {
 	label = "lp5521_pri";
 	clock-mode = /bits/ 8 <2>;
 
-	chan@0 {
+	led@0 {
 		reg = <0>;
 		led-cur = /bits/ 8 <0x2f>;
 		max-cur = /bits/ 8 <0x5f>;
 		linux,default-trigger = "heartbeat";
 	};
 
-	chan@1 {
+	led@1 {
 		reg = <1>;
 		led-cur = /bits/ 8 <0x2f>;
 		max-cur = /bits/ 8 <0x5f>;
 	};
 
-	chan@2 {
+	led@2 {
 		reg = <2>;
 		led-cur = /bits/ 8 <0x2f>;
 		max-cur = /bits/ 8 <0x5f>;
@@ -88,70 +88,70 @@ ASEL1    ASEL0    Address
  VEN      GND       34h
  VEN      VEN       35h
 
-lp5523@32 {
+led-controller@32 {
 	#address-cells = <1>;
 	#size-cells = <0>;
 	compatible = "national,lp5523";
 	reg = <0x32>;
 	clock-mode = /bits/ 8 <1>;
 
-	chan@0 {
+	led@0 {
 		reg = <0>;
 		chan-name = "d1";
 		led-cur = /bits/ 8 <0x14>;
 		max-cur = /bits/ 8 <0x20>;
 	};
 
-	chan@1 {
+	led@1 {
 		reg = <1>;
 		chan-name = "d2";
 		led-cur = /bits/ 8 <0x14>;
 		max-cur = /bits/ 8 <0x20>;
 	};
 
-	chan@2 {
+	led@2 {
 		reg = <2>;
 		chan-name = "d3";
 		led-cur = /bits/ 8 <0x14>;
 		max-cur = /bits/ 8 <0x20>;
 	};
 
-	chan@3 {
+	led@3 {
 		reg = <3>;
 		chan-name = "d4";
 		led-cur = /bits/ 8 <0x14>;
 		max-cur = /bits/ 8 <0x20>;
 	};
 
-	chan@4 {
+	led@4 {
 		reg = <4>;
 		chan-name = "d5";
 		led-cur = /bits/ 8 <0x14>;
 		max-cur = /bits/ 8 <0x20>;
 	};
 
-	chan@5 {
+	led@5 {
 		reg = <5>;
 		chan-name = "d6";
 		led-cur = /bits/ 8 <0x14>;
 		max-cur = /bits/ 8 <0x20>;
 	};
 
-	chan@6 {
+	led@6 {
 		reg = <6>;
 		chan-name = "d7";
 		led-cur = /bits/ 8 <0x14>;
 		max-cur = /bits/ 8 <0x20>;
 	};
 
-	chan@7 {
+	led@7 {
 		reg = <7>;
 		chan-name = "d8";
 		led-cur = /bits/ 8 <0x14>;
 		max-cur = /bits/ 8 <0x20>;
 	};
 
-	chan@8 {
+	led@8 {
 		reg = <8>;
 		chan-name = "d9";
 		led-cur = /bits/ 8 <0x14>;
@@ -162,35 +162,35 @@ lp5523@32 {
 example 3) LP5562
 4 channels are defined.
 
-lp5562@30 {
+led-controller@30 {
 	#address-cells = <1>;
 	#size-cells = <0>;
 	compatible = "ti,lp5562";
 	reg = <0x30>;
 	clock-mode = /bits/8 <2>;
 
-	chan@0 {
+	led@0 {
 		reg = <0>;
 		chan-name = "R";
 		led-cur = /bits/ 8 <0x20>;
 		max-cur = /bits/ 8 <0x60>;
 	};
 
-	chan@1 {
+	led@1 {
 		reg = <1>;
 		chan-name = "G";
 		led-cur = /bits/ 8 <0x20>;
 		max-cur = /bits/ 8 <0x60>;
 	};
 
-	chan@2 {
+	led@2 {
 		reg = <2>;
 		chan-name = "B";
 		led-cur = /bits/ 8 <0x20>;
 		max-cur = /bits/ 8 <0x60>;
 	};
 
-	chan@3 {
+	led@3 {
 		reg = <3>;
 		chan-name = "W";
 		led-cur = /bits/ 8 <0x20>;
@@ -202,7 +202,7 @@ example 4) LP8501
 9 channels are defined. The 'pwr-sel' is LP8501 specific property.
 Others are same as LP5523.
 
-lp8501@32 {
+led-controller@32 {
 	#address-cells = <1>;
 	#size-cells = <0>;
 	compatible = "ti,lp8501";
@@ -210,63 +210,63 @@ lp8501@32 {
 	clock-mode = /bits/ 8 <2>;
 	pwr-sel = /bits/ 8 <3>;	/* D1~9 connected to VOUT */
 
-	chan@0 {
+	led@0 {
 		reg = <0>;
 		chan-name = "d1";
 		led-cur = /bits/ 8 <0x14>;
 		max-cur = /bits/ 8 <0x20>;
 	};
 
-	chan@1 {
+	led@1 {
 		reg = <1>;
 		chan-name = "d2";
 		led-cur = /bits/ 8 <0x14>;
 		max-cur = /bits/ 8 <0x20>;
 	};
 
-	chan@2 {
+	led@2 {
 		reg = <2>;
 		chan-name = "d3";
 		led-cur = /bits/ 8 <0x14>;
 		max-cur = /bits/ 8 <0x20>;
 	};
 
-	chan@3 {
+	led@3 {
 		reg = <3>;
 		chan-name = "d4";
 		led-cur = /bits/ 8 <0x14>;
 		max-cur = /bits/ 8 <0x20>;
 	};
 
-	chan@4 {
+	led@4 {
 		reg = <4>;
 		chan-name = "d5";
 		led-cur = /bits/ 8 <0x14>;
 		max-cur = /bits/ 8 <0x20>;
 	};
 
-	chan@5 {
+	led@5 {
 		reg = <5>;
 		chan-name = "d6";
 		led-cur = /bits/ 8 <0x14>;
 		max-cur = /bits/ 8 <0x20>;
 	};
 
-	chan@6 {
+	led@6 {
 		reg = <6>;
 		chan-name = "d7";
 		led-cur = /bits/ 8 <0x14>;
 		max-cur = /bits/ 8 <0x20>;
 	};
 
-	chan@7 {
+	led@7 {
 		reg = <7>;
 		chan-name = "d8";
 		led-cur = /bits/ 8 <0x14>;
 		max-cur = /bits/ 8 <0x20>;
 	};
 
-	chan@8 {
+	led@8 {
 		reg = <8>;
 		chan-name = "d9";
 		led-cur = /bits/ 8 <0x14>;
-- 
2.25.1

