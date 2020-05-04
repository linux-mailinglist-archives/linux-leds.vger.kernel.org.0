Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2089F1C48FF
	for <lists+linux-leds@lfdr.de>; Mon,  4 May 2020 23:24:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728233AbgEDVXG (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 4 May 2020 17:23:06 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:46298 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726419AbgEDVWf (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 4 May 2020 17:22:35 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 044LMTAI098893;
        Mon, 4 May 2020 16:22:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1588627349;
        bh=V9LB33rXy8LgavJjYcfH69H/hQk1t7xNCdsx8reeIv0=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=GVq2cgRlzo4qtQNmvb9CvhKH3pKBx8hnIFq/HwApVyjtF5BJeIoi6cbVrHD4Fcnhd
         wdU7NGohrBrloqHvRM6dw9/ZodyWT1vp2mzAkGnH5nYT1j+pswSjpR+HTIxaC8cn0S
         FwLT7JAvKNGqSwXgad9s37QIJYAFHdFPS0wGzx+o=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 044LMToO021074
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 4 May 2020 16:22:29 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 4 May
 2020 16:22:29 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 4 May 2020 16:22:29 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 044LMTdB102062;
        Mon, 4 May 2020 16:22:29 -0500
From:   Dan Murphy <dmurphy@ti.com>
To:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>
CC:     <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Dan Murphy <dmurphy@ti.com>
Subject: [PATCH v25 03/16] dt: bindings: lp50xx: Introduce the lp50xx family of RGB drivers
Date:   Mon, 4 May 2020 16:13:31 -0500
Message-ID: <20200504211344.13221-4-dmurphy@ti.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200504211344.13221-1-dmurphy@ti.com>
References: <20200504211344.13221-1-dmurphy@ti.com>
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

Acked-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 .../devicetree/bindings/leds/leds-lp50xx.yaml | 180 ++++++++++++++++++
 1 file changed, 180 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-lp50xx.yaml

diff --git a/Documentation/devicetree/bindings/leds/leds-lp50xx.yaml b/Documentation/devicetree/bindings/leds/leds-lp50xx.yaml
new file mode 100644
index 000000000000..a2ea03e07f6d
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/leds-lp50xx.yaml
@@ -0,0 +1,180 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/leds-lp50xx.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: LED driver for LP50XX RGB LED from Texas Instruments.
+
+maintainers:
+  - Dan Murphy <dmurphy@ti.com>
+
+description: |
+  The LP50XX is multi-channel, I2C RGB LED Drivers that can group RGB LEDs into
+  a LED group or control them individually.
+
+  The difference in these RGB LED drivers is the number of supported RGB
+  modules.
+
+  For more product information please see the link below:
+  http://www.ti.com/lit/ds/symlink/lp5012.pdf
+  http://www.ti.com/lit/ds/symlink/lp5024.pdf
+  http://www.ti.com/lit/ds/symlink/lp5036.pdf
+
+properties:
+  compatible:
+     oneOf:
+      - const: ti,lp5009
+      - const: ti,lp5012
+      - const: ti,lp5018
+      - const: ti,lp5024
+      - const: ti,lp5030
+      - const: ti,lp5036
+
+  reg:
+    maxItems: 1
+    description:
+      I2C slave address
+      lp5009/12 - 0x14, 0x15, 0x16, 0x17
+      lp5018/24 - 0x28, 0x29, 0x2a, 0x2b
+      lp5030/36 - 0x30, 0x31, 0x32, 0x33
+
+  enable-gpios:
+    description: GPIO pin to enable/disable the device.
+
+  vled-supply:
+    description: LED supply.
+
+  child-node:
+    type: object
+    properties:
+      reg:
+        description: This is the LED module number.
+
+      color:
+        description: Must be LED_COLOR_ID_MULTI
+
+      function:
+        description: see Documentation/devicetree/bindings/leds/common.txt
+
+      ti,led-bank:
+        description:
+          This property denotes the LED module numbers that will be controlled as
+          a single RGB cluster.  Each LED module number will be controlled by a
+          single LED class instance.
+          There can only be one instance of the ti,led-bank
+          property for each device node.  This is a required node is the LED
+          modules are to be backed.
+        $ref: /schemas/types.yaml#definitions/uint32-array
+
+    required:
+      - reg
+      - color
+      - function
+
+  grandchild-node:
+    type: object
+    properties:
+      reg:
+        description:
+          A single entry denoting the LED output that controls the monochrome LED.
+
+      color:
+        description:
+          see Documentation/devicetree/bindings/leds/common.txt
+
+      led-sources:
+        description:
+          see Documentation/devicetree/bindings/leds/common.txt
+          The LED outputs associated with the LED modules are defined in Table 1
+          of the corresponding data sheets.
+          LP5009 - 3 Total RGB cluster LED outputs 0-2
+          LP5012 - 4 Total RGB cluster LED outputs 0-3
+          LP5018 - 6 Total RGB cluster LED outputs 0-5
+          LP5024 - 8 Total RGB cluster LED outputs 0-7
+          LP5030 - 10 Total RGB cluster LED outputs 0-9
+          LP5036 - 12 Total RGB cluster LED outputs 0-11
+
+      label:
+        description: |
+          Optional node - see Documentation/devicetree/bindings/leds/common.txt
+
+      linux,default-trigger:
+        description: |
+          Optional node - see Documentation/devicetree/bindings/leds/common.txt
+
+    required:
+      - reg
+      - color
+
+required:
+  - compatible
+  - reg
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
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
+          enable-gpios = <&gpio1 16>;
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
+
+          multi-led@2 {
+            #address-cells = <1>;
+            #size-cells = <0>;
+            reg = <2>;
+            color = <LED_COLOR_ID_MULTI>;
+            function = LED_FUNCTION_STANDBY;
+            ti,led-bank = <2 3 5>;
+
+            led@6 {
+              reg = <0x6>;
+              color = <LED_COLOR_ID_RED>;
+              led-sources = <6 9 15>;
+            };
+
+            led@7 {
+              reg = <0x7>;
+              color = <LED_COLOR_ID_GREEN>;
+              led-sources = <7 10 16>;
+            };
+
+            led@8 {
+              reg = <0x8>;
+              color = <LED_COLOR_ID_BLUE>;
+              led-sources = <8 11 17>;
+            };
+         };
+       };
+    };
+
+...
-- 
2.25.1

