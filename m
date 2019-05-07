Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EAF8316BFF
	for <lists+linux-leds@lfdr.de>; Tue,  7 May 2019 22:13:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726411AbfEGUM1 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 7 May 2019 16:12:27 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:41346 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726495AbfEGUMG (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 7 May 2019 16:12:06 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x47KBsOm103333;
        Tue, 7 May 2019 15:11:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1557259914;
        bh=4lobOehpHKxAz9Z2v1fQplOERI0AEUJYx6XR9ln2I/Y=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=wUgyjDDnORdUYEWUz5S0oBdiZlenR+GZ4CDSUcO4g+ZHcpfXYFrDGsLNm4ZnUOq1Z
         ufZUwmmA0vUuvXkXE3d4a2k6zvmCsKLyJiF4IBGd47G4BsdzbqIKRs05wbWTHCZ6hm
         k9VYqJtI+GthdioxE5OLMJGVMMc4lEbpZg+stTK0=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x47KBsms108668
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 7 May 2019 15:11:54 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 7 May
 2019 15:11:53 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 7 May 2019 15:11:53 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x47KBrGt035466;
        Tue, 7 May 2019 15:11:53 -0500
From:   Dan Murphy <dmurphy@ti.com>
To:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>
CC:     <lee.jones@linaro.org>, <rdunlap@infradead.org>,
        <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Dan Murphy <dmurphy@ti.com>, Rob Herring <robh@kernel.org>
Subject: [PATCH v4 2/6] dt-bindings: mfd: Add lm36274 bindings to ti-lmu
Date:   Tue, 7 May 2019 15:11:55 -0500
Message-ID: <20190507201159.13940-3-dmurphy@ti.com>
X-Mailer: git-send-email 2.21.0.5.gaeb582a983
In-Reply-To: <20190507201159.13940-1-dmurphy@ti.com>
References: <20190507201159.13940-1-dmurphy@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Add the LM36274 backlight driver with regulator support.
This is a multi-function device for backlight applications.

Backlight properties will be documented in it's a supplemental
bindings document.

Regulator support is documented in the regulator/lm363x-regulator.txt

http://www.ti.com/lit/ds/symlink/lm36274.pdf

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 .../devicetree/bindings/mfd/ti-lmu.txt        | 54 +++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/ti-lmu.txt b/Documentation/devicetree/bindings/mfd/ti-lmu.txt
index 782d3c9812ed..2296b8f24de4 100644
--- a/Documentation/devicetree/bindings/mfd/ti-lmu.txt
+++ b/Documentation/devicetree/bindings/mfd/ti-lmu.txt
@@ -8,6 +8,7 @@ TI LMU driver supports lighting devices below.
   LM3632       Backlight and regulator
   LM3633       Backlight, LED and fault monitor
   LM3695       Backlight
+  LM36274      Backlight and regulator
 
 Required properties:
   - compatible: Should be one of:
@@ -15,11 +16,13 @@ Required properties:
                 "ti,lm3632"
                 "ti,lm3633"
                 "ti,lm3695"
+		"ti,lm36274"
   - reg: I2C slave address.
          0x11 for LM3632
          0x29 for LM3631
          0x36 for LM3633
          0x63 for LM3695
+         0x11 for LM36274
 
 Optional properties:
   - enable-gpios: A GPIO specifier for hardware enable pin.
@@ -50,12 +53,14 @@ Optional nodes:
       - compatible: Should be one of:
                     "ti,lm3633-fault-monitor"
   - leds: LED properties for LM3633. Please refer to [2].
+	  LED properties for LM36274. Please refer to [4].
   - regulators: Regulator properties for LM3631 and LM3632.
                 Please refer to [3].
 
 [1] ../leds/backlight/ti-lmu-backlight.txt
 [2] ../leds/leds-lm3633.txt
 [3] ../regulator/lm363x-regulator.txt
+[4] ../leds/leds-lm36274.txt
 
 lm3631@29 {
 	compatible = "ti,lm3631";
@@ -213,3 +218,52 @@ lm3695@63 {
 		};
 	};
 };
+
+lm36274@11 {
+	compatible = "ti,lm36274";
+	#address-cells = <1>;
+	#size-cells = <0>;
+	reg = <0x11>;
+
+	enable-gpios = <&pioC 2 GPIO_ACTIVE_HIGH>;
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
-- 
2.21.0.5.gaeb582a983

