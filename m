Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 11E9CB0347
	for <lists+linux-leds@lfdr.de>; Wed, 11 Sep 2019 20:02:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729971AbfIKSBs (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 11 Sep 2019 14:01:48 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:55974 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729727AbfIKSBX (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 11 Sep 2019 14:01:23 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8BI1H8u000904;
        Wed, 11 Sep 2019 13:01:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1568224877;
        bh=FmX84wdoIvKOF4QfyScCM6+x89vt6CsCWXDGcqUhLqw=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=q06ncsNDgn4TyFv8BrgKqptSB419/FBge+C95IAVTWOfDXA9YBs5Poo7wVVqCUfHd
         QvcE4ZZXvMAIrmyJRddj9CCrpMa9GYPjHp0K5iSOFo0zh6mk11SEaaogQBLaXVIvst
         xHaspIacKmgt+dbqgXMgUqGVzVoSE7UZBTgOTFTA=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8BI1H7o102539;
        Wed, 11 Sep 2019 13:01:17 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 11
 Sep 2019 13:01:17 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 11 Sep 2019 13:01:17 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8BI1Hrd040990;
        Wed, 11 Sep 2019 13:01:17 -0500
From:   Dan Murphy <dmurphy@ti.com>
To:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>
CC:     <robh+dt@kernel.org>, <linux-leds@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Dan Murphy <dmurphy@ti.com>
Subject: [PATCH v5 3/9] dt: bindings: Add multicolor class dt bindings documention
Date:   Wed, 11 Sep 2019 13:01:09 -0500
Message-ID: <20190911180115.21035-4-dmurphy@ti.com>
X-Mailer: git-send-email 2.22.0.214.g8dca754b1e
In-Reply-To: <20190911180115.21035-1-dmurphy@ti.com>
References: <20190911180115.21035-1-dmurphy@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Add DT bindings for the LEDs multicolor class framework.

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 .../bindings/leds/leds-class-multicolor.txt   | 96 +++++++++++++++++++
 1 file changed, 96 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-class-multicolor.txt

diff --git a/Documentation/devicetree/bindings/leds/leds-class-multicolor.txt b/Documentation/devicetree/bindings/leds/leds-class-multicolor.txt
new file mode 100644
index 000000000000..5d36327b18fc
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/leds-class-multicolor.txt
@@ -0,0 +1,96 @@
+* Multicolor LED properties
+
+Multicolor LEDs can consist of a RGB, RGBW or a RGBA LED clusters.  These devices
+can be grouped together and also provide a modeling mechanism so that the
+cluster LEDs can vary in hue and intensity to produce a wide range of colors.
+
+The nodes and properties defined in this document are unique to the multicolor
+LED class.  Common LED nodes and properties are inherited from the common.txt
+within this documentation directory.
+
+Required LED Child properties:
+	- color : For multicolor LED support this property should be defined as
+		  LED_COLOR_ID_MULTI and further definition can be found in
+		  include/linux/leds/common.h.
+
+led-controller@30 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	compatible = "ti,lp5024";
+	reg = <0x29>;
+
+	multi-led@1 {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		reg = <1>;
+		color = <LED_COLOR_ID_MULTI>;
+		function = LED_FUNCTION_;
+
+
+		led@3 {
+			reg = <3>;
+			color = <LED_COLOR_ID_RED>;
+		};
+
+		led@4 {
+			reg = <4>;
+			color = <LED_COLOR_ID_GREEN>;
+		};
+
+		led@5 {
+			reg = <5>;
+			color = <LED_COLOR_ID_BLUE>;
+		};
+	};
+
+	multi-led@2 {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		color = <LED_COLOR_ID_MULTI>;
+		function = LED_FUNCTION_ACTIVITY;
+		reg = <2>;
+		ti,led-bank = <2 3 5>;
+
+		led@6 {
+			reg = <0x6>;
+			color = <LED_COLOR_ID_RED>;
+			led-sources = <6 9 15>;
+		};
+
+		led@7 {
+			reg = <0x7>;
+			color = <LED_COLOR_ID_GREEN>;
+			led-sources = <7 10 16>;
+		};
+
+		led@8 {
+			reg = <0x8>;
+			color = <LED_COLOR_ID_BLUE>;
+			led-sources = <8 11 17>;
+		};
+	};
+
+	multi-led@4 {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		reg = <4>;
+		color = <LED_COLOR_ID_MULTI>;
+		function = LED_FUNCTION_ACTIVITY;
+
+		led@12 {
+			reg = <12>;
+			color = <LED_COLOR_ID_RED>;
+		};
+
+		led@13 {
+			reg = <13>;
+			color = <LED_COLOR_ID_GREEN>;
+		};
+
+		led@14 {
+			reg = <14>;
+			color = <LED_COLOR_ID_BLUE>;
+		};
+	};
+
+};
-- 
2.22.0.214.g8dca754b1e

