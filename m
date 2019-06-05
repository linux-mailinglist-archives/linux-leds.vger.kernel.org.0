Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4456835D4B
	for <lists+linux-leds@lfdr.de>; Wed,  5 Jun 2019 14:56:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727878AbfFEM4m (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 5 Jun 2019 08:56:42 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:35936 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727642AbfFEM4l (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 5 Jun 2019 08:56:41 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x55Cubj8099180;
        Wed, 5 Jun 2019 07:56:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1559739397;
        bh=MW4TST/iMuLpCixIrt5ZyAqpd2KHqAWFnSQ6CUHkxQU=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=Pp9uk+YJbWCOcqXQ6BF+5YHSKTqwsVrMBfdRV/pnAujBKAYiqEMVS/o6llTjh6ySJ
         in1yY1OsR2jBpaaUNfOHjNqgVU1+D9pkIN/dheLnFnLBmJMmxZaFIbxm6kRQ6W2Mq0
         CkegS35JiCKzjYloLqokKYrMZoWAWILhca3jY5eQ=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x55CubnS130529
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 5 Jun 2019 07:56:37 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 5 Jun
 2019 07:56:37 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 5 Jun 2019 07:56:37 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x55CubGE087372;
        Wed, 5 Jun 2019 07:56:37 -0500
From:   Dan Murphy <dmurphy@ti.com>
To:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>, <broonie@kernel.org>,
        <lgirdwood@gmail.com>
CC:     <lee.jones@linaro.org>, <linux-leds@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Dan Murphy <dmurphy@ti.com>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v6 4/5] dt-bindings: leds: Add LED bindings for the LM36274
Date:   Wed, 5 Jun 2019 07:56:33 -0500
Message-ID: <20190605125634.7042-5-dmurphy@ti.com>
X-Mailer: git-send-email 2.21.0.5.gaeb582a983
In-Reply-To: <20190605125634.7042-1-dmurphy@ti.com>
References: <20190605125634.7042-1-dmurphy@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Add the LM36274 LED specific bindings.

Signed-off-by: Dan Murphy <dmurphy@ti.com>
Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
---
 .../devicetree/bindings/leds/leds-lm36274.txt | 82 +++++++++++++++++++
 1 file changed, 82 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-lm36274.txt

diff --git a/Documentation/devicetree/bindings/leds/leds-lm36274.txt b/Documentation/devicetree/bindings/leds/leds-lm36274.txt
new file mode 100644
index 000000000000..329393700191
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/leds-lm36274.txt
@@ -0,0 +1,82 @@
+* Texas Instruments LM36274 4-Channel LCD Backlight Driver w/Integrated Bias
+
+The LM36274 is an integrated four-channel WLED driver and LCD bias supply.
+The backlight boost provides the power to bias four parallel LED strings with
+up to 29V total output voltage. The 11-bit LED current is programmable via
+the I2C bus and/or controlled via a logic level PWM input from 60 μA to 30 mA.
+
+Parent device properties are documented in ../mfd/ti_lmu.txt
+Regulator properties are documented in ../regulator/lm363x-regulator.txt
+
+Required backlight properties:
+	- compatible:
+		"ti,lm36274-backlight"
+	- reg : 0
+	- #address-cells : 1
+	- #size-cells : 0
+	- led-sources : Indicates which LED strings will be enabled.
+			Values from 0-3, sources is 0 based so strings will be
+			source value + 1.
+
+Optional backlight properties:
+	- label : see Documentation/devicetree/bindings/leds/common.txt
+	- linux,default-trigger :
+	   see Documentation/devicetree/bindings/leds/common.txt
+
+Example:
+
+HVLED string 1 and 3 are controlled by control bank A and HVLED 2 string is
+controlled by control bank B.
+
+lm36274@11 {
+	compatible = "ti,lm36274";
+	#address-cells = <1>;
+	#size-cells = <0>;
+	reg = <0x11>;
+
+	enable-gpios = <&gpio1 28 GPIO_ACTIVE_HIGH>;
+
+	regulators {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		compatible = "ti,lm363x-regulator";
+
+		enable-gpios = <&pioC 0 GPIO_ACTIVE_HIGH>,
+			       <&pioC 1 GPIO_ACTIVE_HIGH>;
+
+		vboost {
+			regulator-name = "lcd_boost";
+			regulator-min-microvolt = <4000000>;
+			regulator-max-microvolt = <7150000>;
+			regulator-always-on;
+		};
+
+		vpos {
+			regulator-name = "lcd_vpos";
+			regulator-min-microvolt = <4000000>;
+			regulator-max-microvolt = <6500000>;
+		};
+
+		vneg {
+			regulator-name = "lcd_vneg";
+			regulator-min-microvolt = <4000000>;
+			regulator-max-microvolt = <6500000>;
+		};
+	};
+
+	backlight {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		compatible = "ti,lm36274-backlight";
+
+		led@0 {
+			reg = <0>;
+			led-sources = <0 2>;
+			label = "white:backlight_cluster";
+			linux,default-trigger = "backlight";
+		};
+	};
+};
+
+For more product information please see the link below:
+http://www.ti.com/lit/ds/symlink/lm36274.pdf
-- 
2.21.0.5.gaeb582a983

