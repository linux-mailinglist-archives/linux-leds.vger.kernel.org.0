Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B06111E2774
	for <lists+linux-leds@lfdr.de>; Tue, 26 May 2020 18:48:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388896AbgEZQrJ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 26 May 2020 12:47:09 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:49992 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388295AbgEZQrI (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 26 May 2020 12:47:08 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 04QGl4Xg069301;
        Tue, 26 May 2020 11:47:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1590511624;
        bh=9VhwbEA312S5jn2e02G3zURBnKiTzVYqGi5OHCo+NQo=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=lRQSWthJyUmXrzXO1V+4WMv+s9ROMqe5iaGN2JR0FUub8hBOZzH36CrPKUBvM4+du
         QRcWVkbOTcL9Z/kOxPkgepUP4pnaxwuMXyYoIRHvU0RfIMqiUGQLMbHUZs3l1Gx4OZ
         lN/cq9z3aJjJ64qAKPqhuPU75Xvt6+UFlNum/w4U=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 04QGl4nG129951
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 26 May 2020 11:47:04 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 26
 May 2020 11:47:03 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 26 May 2020 11:47:03 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04QGl3l5129946;
        Tue, 26 May 2020 11:47:03 -0500
From:   Dan Murphy <dmurphy@ti.com>
To:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>, <robh@kernel.org>
CC:     <devicetree@vger.kernel.org>, <linux-leds@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Dan Murphy <dmurphy@ti.com>
Subject: [PATCH v25 01/16] dt: bindings: Add multicolor class dt bindings documention
Date:   Tue, 26 May 2020 11:46:37 -0500
Message-ID: <20200526164652.2331-2-dmurphy@ti.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200526164652.2331-1-dmurphy@ti.com>
References: <20200526164652.2331-1-dmurphy@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Add DT bindings for the LEDs multicolor class framework.
Add multicolor ID to the color ID list for device tree bindings.

CC: Rob Herring <robh@kernel.org>
Acked-by: Pavel Machek <pavel@ucw.cz>
Acked-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 .../bindings/leds/leds-class-multicolor.yaml  | 71 +++++++++++++++++++
 drivers/leds/led-core.c                       |  1 +
 include/dt-bindings/leds/common.h             |  3 +-
 3 files changed, 74 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-class-multicolor.yaml

diff --git a/Documentation/devicetree/bindings/leds/leds-class-multicolor.yaml b/Documentation/devicetree/bindings/leds/leds-class-multicolor.yaml
new file mode 100644
index 000000000000..fa6ea8e5c46b
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/leds-class-multicolor.yaml
@@ -0,0 +1,71 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/leds-class-multicolor.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Common properties for the multicolor LED class.
+
+maintainers:
+  - Dan Murphy <dmurphy@ti.com>
+
+description: |
+  Bindings for multi color LEDs show how to describe current outputs of
+  either integrated multi-color LED elements (like RGB, RGBW, RGBWA-UV
+  etc.) or standalone LEDs, to achieve logically grouped multi-color LED
+  modules. This is achieved by adding multi-led nodes layer to the
+  monochrome LED bindings.
+  The nodes and properties defined in this document are unique to the multicolor
+  LED class.  Common LED nodes and properties are inherited from the common.txt
+  within this documentation directory.
+
+properties:
+  color:
+    description: |
+      For multicolor LED support this property should be defined as
+      LED_COLOR_ID_MULTI and further definition can be found in
+      include/linux/leds/common.h.
+
+required:
+  - color
+
+examples:
+  - |
+    #include <dt-bindings/leds/common.h>
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        led-controller@14 {
+          #address-cells = <1>;
+          #size-cells = <0>;
+          compatible = "ti,lp5009";
+          reg = <0x14>;
+
+          multi-led@1 {
+            #address-cells = <1>;
+            #size-cells = <0>;
+            reg = <1>;
+            color = <LED_COLOR_ID_MULTI>;
+            function = LED_FUNCTION_CHARGING;
+
+            led@0 {
+              reg = <0>;
+              color = <LED_COLOR_ID_RED>;
+            };
+
+            led@1 {
+              reg = <1>;
+              color = <LED_COLOR_ID_GREEN>;
+            };
+
+            led@2 {
+              reg = <2>;
+              color = <LED_COLOR_ID_BLUE>;
+            };
+          };
+        };
+    };
+
+additionalProperties: false
+...
diff --git a/drivers/leds/led-core.c b/drivers/leds/led-core.c
index f1f718dbe0f8..846248a0693d 100644
--- a/drivers/leds/led-core.c
+++ b/drivers/leds/led-core.c
@@ -34,6 +34,7 @@ const char * const led_colors[LED_COLOR_ID_MAX] = {
 	[LED_COLOR_ID_VIOLET] = "violet",
 	[LED_COLOR_ID_YELLOW] = "yellow",
 	[LED_COLOR_ID_IR] = "ir",
+	[LED_COLOR_ID_MULTI] = "multicolor",
 };
 EXPORT_SYMBOL_GPL(led_colors);
 
diff --git a/include/dt-bindings/leds/common.h b/include/dt-bindings/leds/common.h
index 0ce7dfc00dcb..a463ce6a8794 100644
--- a/include/dt-bindings/leds/common.h
+++ b/include/dt-bindings/leds/common.h
@@ -30,7 +30,8 @@
 #define LED_COLOR_ID_VIOLET	5
 #define LED_COLOR_ID_YELLOW	6
 #define LED_COLOR_ID_IR		7
-#define LED_COLOR_ID_MAX	8
+#define LED_COLOR_ID_MULTI	8
+#define LED_COLOR_ID_MAX	9
 
 /* Standard LED functions */
 /* Keyboard LEDs, usually it would be input4::capslock etc. */
-- 
2.25.1

