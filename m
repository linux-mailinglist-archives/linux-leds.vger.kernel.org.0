Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 11A42D9638
	for <lists+linux-leds@lfdr.de>; Wed, 16 Oct 2019 18:01:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405932AbfJPQAf (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 16 Oct 2019 12:00:35 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:41860 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2393106AbfJPQAe (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 16 Oct 2019 12:00:34 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9GG0U00121862;
        Wed, 16 Oct 2019 11:00:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1571241630;
        bh=p9d1hK21+zYim5C98n2xvff9PG7G57BLUcO3H2vU7Wg=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=u71gn4oKcNYPXbDbK/8JUHVZA9uyC8xB3kx6tZGi27GL/1boKPDcNfAiUsq7pHXoF
         begExAV7LBvwmsC2ayoPXqt3pSR1QPAqdruMaXdHEM6/vIppIM3YewUGQI1myJdGJC
         Ny7vp92CEKcAQ1lHGf8uK223E34t2NI69B4sORxI=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9GG0Tti094782
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 16 Oct 2019 11:00:30 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 16
 Oct 2019 11:00:22 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 16 Oct 2019 11:00:29 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9GG0TS2113213;
        Wed, 16 Oct 2019 11:00:29 -0500
From:   Dan Murphy <dmurphy@ti.com>
To:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>
CC:     <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Dan Murphy <dmurphy@ti.com>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v13 05/18] dt: bindings: lp50xx: Introduce the lp50xx family of RGB drivers
Date:   Wed, 16 Oct 2019 10:59:41 -0500
Message-ID: <20191016155954.29044-6-dmurphy@ti.com>
X-Mailer: git-send-email 2.22.0.214.g8dca754b1e
In-Reply-To: <20191016155954.29044-1-dmurphy@ti.com>
References: <20191016155954.29044-1-dmurphy@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Introduce the bindings for the Texas Instruments LP5036, LP5030, LP5024,
LP5018, LP5012 and LP5009 RGB LED device driver.  The LP5036/30/24/18/12/9
can control RGB LEDs individually or as part of a control bank group.
These devices have the ability to adjust the mixing control for the RGB
LEDs to obtain different colors independent of the overall brightness of
the LED grouping.

Datasheet:
http://www.ti.com/lit/ds/symlink/lp5012.pdf
http://www.ti.com/lit/ds/symlink/lp5024.pdf
http://www.ti.com/lit/ds/symlink/lp5036.pdf

Signed-off-by: Dan Murphy <dmurphy@ti.com>
CC: Rob Herring <robh+dt@kernel.org>
---
 .../devicetree/bindings/leds/leds-lp50xx.txt  | 148 ++++++++++++++++++
 1 file changed, 148 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-lp50xx.txt

diff --git a/Documentation/devicetree/bindings/leds/leds-lp50xx.txt b/Documentation/devicetree/bindings/leds/leds-lp50xx.txt
new file mode 100644
index 000000000000..8a0a21f1056c
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/leds-lp50xx.txt
@@ -0,0 +1,148 @@
+* Texas Instruments - LP5009/12/18/24/30/36 RGB LED driver
+
+The LP50XX is multi-channel, I2C RGB LED Drivers that can group RGB LEDs into
+a LED group or control them individually.
+
+The difference in these RGB LED drivers is the number of supported RGB modules.
+
+Required parent properties:
+	- compatible:
+		"ti,lp5009"
+		"ti,lp5012"
+		"ti,lp5018"
+		"ti,lp5024"
+		"ti,lp5030"
+		"ti,lp5036"
+	- reg :  I2C slave address
+		lp5009/12 - 0x14, 0x15, 0x16, 0x17
+		lp5018/24 - 0x28, 0x29, 0x2a, 0x2b
+		lp5030/36 - 0x30, 0x31, 0x32, 0x33
+	- #address-cells : 1
+	- #size-cells : 0
+
+Optional parent properties:
+	- enable-gpios : gpio pin to enable/disable the device.
+	- vled-supply : LED supply
+
+Required child properties:
+	- #address-cells : 1
+	- #size-cells : 0
+	- reg : This is the LED module number.
+	- color : Must be LED_COLOR_ID_MULTI
+	- function : see Documentation/devicetree/bindings/leds/common.txt
+
+Required child properties only is LED modules will be banked:
+	- ti,led-bank : This property denotes the LED module numbers that will
+			be controlled as a single RGB cluster.  Each LED module
+			number will be controlled by a single LED class instance.
+			There can only be one instance of the ti,led-bank
+			property for each device node.
+
+Required grandchildren properties:
+	- reg : A single entry denoting the LED output that controls
+		the monochrome LED.
+	- color : see Documentation/devicetree/bindings/leds/common.txt
+	- led-sources : see Documentation/devicetree/bindings/leds/common.txt
+
+The LED outputs associated with the LED modules are defined in Table 1 of the
+corresponding data sheets.
+
+LP5009 - 3 Total RGB cluster LED outputs 0-2
+LP5012 - 4 Total RGB cluster LED outputs 0-3
+LP5018 - 6 Total RGB cluster LED outputs 0-5
+LP5024 - 8 Total RGB cluster LED outputs 0-7
+LP5030 - 10 Total RGB cluster LED outputs 0-9
+LP5036 - 12 Total RGB cluster LED outputs 0-11
+
+Optional child properties:
+	- label : see Documentation/devicetree/bindings/leds/common.txt
+	- linux,default-trigger :
+	   see Documentation/devicetree/bindings/leds/common.txt
+
+Examples:
+led-controller@29 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	compatible = "ti,lp5024";
+	reg = <0x29>;
+	enable-gpios = <&gpio1 28 GPIO_ACTIVE_HIGH>;
+	vled-supply = <&vmmcsd_fixed>;
+
+	multi-led@1 {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		reg = <1>;
+		color = <LED_COLOR_ID_MULTI>;
+		function = LED_FUNCTION_STATUS;
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
+		reg = <2>;
+		color = <LED_COLOR_ID_MULTI>;
+		function = LED_FUNCTION_STANDBY;
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
+};
+
+For more product information please see the link below:
+http://www.ti.com/lit/ds/symlink/lp5012.pdf
+http://www.ti.com/lit/ds/symlink/lp5024.pdf
+http://www.ti.com/lit/ds/symlink/lp5036.pdf
-- 
2.22.0.214.g8dca754b1e

