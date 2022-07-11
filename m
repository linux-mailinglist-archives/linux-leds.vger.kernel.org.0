Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7839755EC77
	for <lists+linux-leds@lfdr.de>; Tue, 28 Jun 2022 20:22:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233779AbiF1SWR (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 28 Jun 2022 14:22:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233118AbiF1SWP (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 28 Jun 2022 14:22:15 -0400
Received: from msg-1.mailo.com (msg-1.mailo.com [213.182.54.11])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A786320BE7;
        Tue, 28 Jun 2022 11:22:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailoo.org; s=mailo;
        t=1656440516; bh=7FI93fg6UiWf63jthDNwyiZAvWrgrxP6crYj+ERcw3g=;
        h=X-EA-Auth:From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:
         References:MIME-Version:Content-Transfer-Encoding;
        b=PFgxDOafAvAezwRqFycGz7AJXPy+qYXBs8SkXsBZIqLBxLpyzTvsw+MALz0Hb/Dma
         QQlJot3DNHHmCRMZZQ5aeQIzhiOOwG+CXlhy6sXgx84eW/s5XeuhIH1xfePYedjW8A
         DRIdgVOjEN08IBEqq+BJsV4Rg1dj5OO1WC9WMVRs=
Received: by b-1.in.mailobj.net [192.168.90.11] with ESMTP
        via [213.182.55.207]
        Tue, 28 Jun 2022 20:21:56 +0200 (CEST)
X-EA-Auth: aU2DNDTmS2sdwfiHYOb8GQGoxZVyjR39WvtekFaHTonoEiugEpJIy2d6BwECHypQk6QE8mRC2YAYoRBb76ec9o3zlPlrf72MIoTRMVZ1UwY=
From:   Vincent Knecht <vincent.knecht@mailoo.org>
To:     Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Vincent Knecht <vincent.knecht@mailoo.org>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht
Subject: [PATCH v1 RESEND 1/7] dt-bindings: leds: Convert is31fl319x to dtschema
Date:   Tue, 28 Jun 2022 20:21:39 +0200
Message-Id: <20220628182147.2837180-2-vincent.knecht@mailoo.org>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220628182147.2837180-1-vincent.knecht@mailoo.org>
References: <20220628182147.2837180-1-vincent.knecht@mailoo.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Convert leds-is31fl319x.txt to dtschema.
Set license to the one recommended by DT project.

Signed-off-by: Vincent Knecht <vincent.knecht@mailoo.org>
---
 .../bindings/leds/issi,is31fl319x.yaml        | 113 ++++++++++++++++++
 .../bindings/leds/leds-is31fl319x.txt         |  61 ----------
 2 files changed, 113 insertions(+), 61 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/leds/issi,is31fl319x.yaml
 delete mode 100644 Documentation/devicetree/bindings/leds/leds-is31fl319x.txt

diff --git a/Documentation/devicetree/bindings/leds/issi,is31fl319x.yaml b/Documentation/devicetree/bindings/leds/issi,is31fl319x.yaml
new file mode 100644
index 000000000000..0d684aeeb8cd
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/issi,is31fl319x.yaml
@@ -0,0 +1,113 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/issi,is31fl319x.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ISSI LED controllers bindings for IS31FL319{0,1,3,6,9}
+
+maintainers:
+  - Vincent Knecht <vincent.knecht@mailoo.org>
+
+description: |
+  The IS31FL319X are LED controllers with I2C interface.
+  Previously known as Si-En SN319{0,1,3,6,9}.
+
+  For more product information please see the links below:
+    https://lumissil.com/assets/pdf/core/IS31FL3190_DS.pdf
+    https://lumissil.com/assets/pdf/core/IS31FL3191_DS.pdf
+    https://lumissil.com/assets/pdf/core/IS31FL3193_DS.pdf
+    https://lumissil.com/assets/pdf/core/IS31FL3196_DS.pdf
+    https://lumissil.com/assets/pdf/core/IS31FL3199_DS.pdf
+
+properties:
+  compatible:
+    enum:
+      - issi,is31fl3190
+      - issi,is31fl3191
+      - issi,is31fl3193
+      - issi,is31fl3196
+      - issi,is31fl3199
+      - si-en,sn3199
+
+  reg:
+    maxItems: 1
+
+  shutdown-gpios:
+    maxItems: 1
+    description: GPIO attached to the SDB pin.
+
+  audio-gain-db:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    default: 0
+    description: Audio gain selection for external analog modulation input.
+    enum: [0, 3, 6, 9, 12, 15, 18, 21]
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+patternProperties:
+  "^led@[1-9]$":
+    type: object
+    $ref: common.yaml#
+
+    properties:
+      reg:
+        description: Index of the LED.
+        minimum: 1
+        maximum: 9
+
+      led-max-microamp:
+        default: 20000
+        enum: [5000, 10000, 15000, 20000, 25000, 30000, 35000, 40000]
+        description:
+          Note that a driver will take the lowest of all LED limits
+          since the chip has a single global setting. The lowest value
+          will be chosen due to the PWM specificity, where lower
+          brightness is achieved by reducing the duty-cycle of pulses
+          and not the current, which will always have its peak value
+          equal to led-max-microamp.
+
+required:
+  - compatible
+  - reg
+  - "#address-cells"
+  - "#size-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/leds/common.h>
+
+    i2c0 {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        led-controller@65 {
+            compatible = "issi,is31fl3196";
+            reg = <0x65>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            shutdown-gpios = <&gpio0 11 GPIO_ACTIVE_HIGH>;
+
+            led@1 {
+                reg = <1>;
+                label = "red:aux";
+                led-max-microamp = <10000>;
+            };
+
+            led@5 {
+                reg = <5>;
+                label = "green:power";
+                linux,default-trigger = "default-on";
+            };
+        };
+    };
+...
+
diff --git a/Documentation/devicetree/bindings/leds/leds-is31fl319x.txt b/Documentation/devicetree/bindings/leds/leds-is31fl319x.txt
deleted file mode 100644
index 676d43ec8169..000000000000
--- a/Documentation/devicetree/bindings/leds/leds-is31fl319x.txt
+++ /dev/null
@@ -1,61 +0,0 @@
-LEDs connected to is31fl319x LED controller chip
-
-Required properties:
-- compatible : Should be any of
-	"issi,is31fl3190"
-	"issi,is31fl3191"
-	"issi,is31fl3193"
-	"issi,is31fl3196"
-	"issi,is31fl3199"
-	"si-en,sn3199".
-- #address-cells: Must be 1.
-- #size-cells: Must be 0.
-- reg: 0x64, 0x65, 0x66, or 0x67.
-
-Optional properties:
-- audio-gain-db : audio gain selection for external analog modulation input.
-	Valid values: 0 - 21, step by 3 (rounded down)
-	Default: 0
-- shutdown-gpios : Specifier of the GPIO connected to SDB pin of the chip.
-
-Each led is represented as a sub-node of the issi,is31fl319x device.
-There can be less leds subnodes than the chip can support but not more.
-
-Required led sub-node properties:
-- reg : number of LED line
-	Valid values: 1 - number of leds supported by the chip variant.
-
-Optional led sub-node properties:
-- label : see Documentation/devicetree/bindings/leds/common.txt.
-- linux,default-trigger :
-	see Documentation/devicetree/bindings/leds/common.txt.
-- led-max-microamp : (optional)
-	Valid values: 5000 - 40000, step by 5000 (rounded down)
-	Default: 20000 (20 mA)
-	Note: a driver will take the lowest of all led limits since the
-	chip has a single global setting. The lowest value will be chosen
-	due to the PWM specificity, where lower brightness is achieved
-	by reducing the dury-cycle of pulses and not the current, which
-	will always have its peak value equal to led-max-microamp.
-
-Examples:
-
-fancy_leds: leds@65 {
-	compatible = "issi,is31fl3196";
-	#address-cells = <1>;
-	#size-cells = <0>;
-	reg = <0x65>;
-	shutdown-gpios = <&gpio0 11 GPIO_ACTIVE_HIGH>;
-
-	red_aux: led@1 {
-		label = "red:aux";
-		reg = <1>;
-		led-max-microamp = <10000>;
-	};
-
-	green_power: led@5 {
-		label = "green:power";
-		reg = <5>;
-		linux,default-trigger = "default-on";
-	};
-};
-- 
2.35.3



