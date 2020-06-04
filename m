Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 785EA1EE3F3
	for <lists+linux-leds@lfdr.de>; Thu,  4 Jun 2020 14:06:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728330AbgFDMF6 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 4 Jun 2020 08:05:58 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:58280 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728321AbgFDMF6 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 4 Jun 2020 08:05:58 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 054C5sSf052201;
        Thu, 4 Jun 2020 07:05:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1591272354;
        bh=/xXFRiCNKcZQtTbRCBa/lBYEKvCoqCgiDGwXeEGeNjo=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=RpQ96cR/OAzjYYyNsS8RjqM5R3CwYCLVVqXtE483124VNt2hJMDutFF8s1fkybvlO
         CvRRGjctdZMYGYOZJ9XJxjccr5haLU4p0Z16sPKku6BGGcsaQz55UixgDjFnMB3RwR
         LOhhuBppNBm1i0wIrHAFKVsGGs4DZAjAqKuHjlaM=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 054C5s9G059437;
        Thu, 4 Jun 2020 07:05:54 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 4 Jun
 2020 07:05:54 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 4 Jun 2020 07:05:54 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 054C5sFQ027476;
        Thu, 4 Jun 2020 07:05:54 -0500
From:   Dan Murphy <dmurphy@ti.com>
To:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>
CC:     <devicetree@vger.kernel.org>, <linux-leds@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Dan Murphy <dmurphy@ti.com>
Subject: [PATCH v26 04/15] dt: bindings: lp50xx: Introduce the lp50xx family of RGB drivers
Date:   Thu, 4 Jun 2020 07:04:53 -0500
Message-ID: <20200604120504.32425-5-dmurphy@ti.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200604120504.32425-1-dmurphy@ti.com>
References: <20200604120504.32425-1-dmurphy@ti.com>
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
 .../devicetree/bindings/leds/leds-lp50xx.yaml | 136 ++++++++++++++++++
 1 file changed, 136 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-lp50xx.yaml

diff --git a/Documentation/devicetree/bindings/leds/leds-lp50xx.yaml b/Documentation/devicetree/bindings/leds/leds-lp50xx.yaml
new file mode 100644
index 000000000000..02fcdc13262f
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/leds-lp50xx.yaml
@@ -0,0 +1,136 @@
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
+  #allOf:
+    #- $ref: "common.yaml#"
+    #- $ref: "leds-class-multicolor.yaml#"
+
+  compatible:
+    enum:
+      - ti,lp5009
+      - ti,lp5012
+      - ti,lp5018
+      - ti,lp5024
+      - ti,lp5030
+      - ti,lp5036
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
+    maxItems: 1
+    description: GPIO pin to enable/disable the device.
+
+  vled-supply:
+    description: LED supply.
+
+  child-node:
+    type: object
+    properties:
+      ti,led-bank:
+        description:
+          This property denotes the LED module numbers that will be controlled as
+          a single RGB cluster.  Each LED module number will be controlled by a
+          single LED class instance.
+          There can only be one instance of the ti,led-bank
+          property for each device node.  This is a required node if the LED
+          modules are to be banked.
+        $ref: /schemas/types.yaml#definitions/uint32-array
+
+required:
+  - compatible
+  - reg
+
+examples:
+  - |
+   #include <dt-bindings/gpio/gpio.h>
+   #include <dt-bindings/leds/common.h>
+
+   i2c {
+       #address-cells = <1>;
+       #size-cells = <0>;
+
+       led-controller@14 {
+           compatible = "ti,lp5009";
+           reg = <0x14>;
+           #address-cells = <1>;
+           #size-cells = <0>;
+           enable-gpios = <&gpio1 16>;
+
+           multi-led@1 {
+               #address-cells = <1>;
+               #size-cells = <0>;
+               reg = <1>;
+               color = <LED_COLOR_ID_MULTI>;
+               function = LED_FUNCTION_CHARGING;
+
+               led@0 {
+                   reg = <0>;
+                   color = <LED_COLOR_ID_RED>;
+               };
+
+               led@1 {
+                   reg = <1>;
+                   color = <LED_COLOR_ID_GREEN>;
+               };
+
+               led@2 {
+                   reg = <2>;
+                   color = <LED_COLOR_ID_BLUE>;
+               };
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
-- 
2.26.2

