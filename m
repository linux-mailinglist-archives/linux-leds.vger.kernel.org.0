Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F3D311C48F6
	for <lists+linux-leds@lfdr.de>; Mon,  4 May 2020 23:24:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728147AbgEDVWr (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 4 May 2020 17:22:47 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:57910 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728102AbgEDVWq (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 4 May 2020 17:22:46 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 044LMXx8104294;
        Mon, 4 May 2020 16:22:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1588627353;
        bh=l5RB1BFBNGs53h/lFYd+NbwK21SIGQnFwb+EHjWJYqg=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=tF0aZ+XP/8Ofiy1lHCrUPX27C+7U2U4YNVEgOu52UOyz3qFv+1gyy0nxhR3SZBGgs
         2x3g5QyYG/+yfihIV5RvqdcjtAIrPB4XkRnxyT8kh6MhNLWbjRcdpoQbpAX5ylng14
         Udmi27nuZbJvGGqYDW/BBJ3PMsZR4N8cbjn7Bt8o=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 044LMXme021116
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 4 May 2020 16:22:33 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 4 May
 2020 16:22:33 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 4 May 2020 16:22:33 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 044LMXV9098314;
        Mon, 4 May 2020 16:22:33 -0500
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
Subject: [PATCH v25 16/16] dt: bindings: Update lp55xx binding to recommended LED naming
Date:   Mon, 4 May 2020 16:13:44 -0500
Message-ID: <20200504211344.13221-17-dmurphy@ti.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200504211344.13221-1-dmurphy@ti.com>
References: <20200504211344.13221-1-dmurphy@ti.com>
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

Acked-by: Pavel Machek <pavel@ucw.cz>
Acked-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
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

