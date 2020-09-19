Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 747A82710F2
	for <lists+linux-leds@lfdr.de>; Sun, 20 Sep 2020 00:15:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726680AbgISWPx (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 19 Sep 2020 18:15:53 -0400
Received: from mail.nic.cz ([217.31.204.67]:49976 "EHLO mail.nic.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726617AbgISWPw (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Sat, 19 Sep 2020 18:15:52 -0400
Received: from dellmb.labs.office.nic.cz (unknown [IPv6:2001:1488:fffe:6:cac7:3539:7f1f:463])
        by mail.nic.cz (Postfix) with ESMTP id 0A8D7140A47;
        Sun, 20 Sep 2020 00:15:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
        t=1600553750; bh=gFflTJB0pjcJQCo0ox/mMiuMmClTppQKAMVvJucj2Yo=;
        h=From:To:Date;
        b=FRxxRaAW1sFwE4ePul2glErSL6BxONvsgwpjTdD7rfkeo/T2GmOIcRNMTUQ0c1Kvm
         0hd2Xg1hlypNvGe6heKtJbANY7RWz++aB6ZzG2L2Kxm7r5XSHn7/UxsY1PQrW9HFnb
         9eF8EVZ+MY6bxwJr0iL+wHcEroWAhVUii5J+dhIY=
From:   =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>
To:     linux-leds@vger.kernel.org
Cc:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>,
        NeilBrown <neilb@suse.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        "H . Nikolaus Schaller" <hns@goldelico.com>,
        Tony Lindgren <tony@atomide.com>,
        Adam Ford <aford173@gmail.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Subject: [PATCH leds + devicetree 03/13] dt-bindings: leds: tca6507: convert to YAML
Date:   Sun, 20 Sep 2020 00:15:38 +0200
Message-Id: <20200919221548.29984-4-marek.behun@nic.cz>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200919221548.29984-1-marek.behun@nic.cz>
References: <20200919221548.29984-1-marek.behun@nic.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.nic.cz
X-Spam-Status: No, score=0.00
X-Spamd-Bar: /
X-Virus-Scanned: clamav-milter 0.102.2 at mail
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

This converts the tca6507 LED binding to yaml.

Signed-off-by: Marek Behún <marek.behun@nic.cz>
Cc: NeilBrown <neilb@suse.de>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: H. Nikolaus Schaller <hns@goldelico.com>
Cc: Tony Lindgren <tony@atomide.com>
Cc: Adam Ford <aford173@gmail.com>
Cc: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org
---
 .../devicetree/bindings/leds/tca6507.txt      |  49 -------
 .../devicetree/bindings/leds/ti,tca6507.yaml  | 134 ++++++++++++++++++
 2 files changed, 134 insertions(+), 49 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/leds/tca6507.txt
 create mode 100644 Documentation/devicetree/bindings/leds/ti,tca6507.yaml

diff --git a/Documentation/devicetree/bindings/leds/tca6507.txt b/Documentation/devicetree/bindings/leds/tca6507.txt
deleted file mode 100644
index bad9102796f32..0000000000000
--- a/Documentation/devicetree/bindings/leds/tca6507.txt
+++ /dev/null
@@ -1,49 +0,0 @@
-LEDs connected to tca6507
-
-Required properties:
-- compatible : should be : "ti,tca6507".
-- #address-cells: must be 1
-- #size-cells: must be 0
-- reg: typically 0x45.
-
-Optional properties:
-- gpio-controller: allows lines to be used as output-only GPIOs.
-- #gpio-cells: if present, must not be 0.
-
-Each led is represented as a sub-node of the ti,tca6507 device.
-
-LED sub-node properties:
-- label : (optional) see Documentation/devicetree/bindings/leds/common.txt
-- reg : number of LED line (could be from 0 to 6)
-- linux,default-trigger : (optional)
-   see Documentation/devicetree/bindings/leds/common.txt
-- compatible: either "led" (the default) or "gpio".
-
-Examples:
-
-tca6507@45 {
-	compatible = "ti,tca6507";
-	#address-cells = <1>;
-	#size-cells = <0>;
-	reg = <0x45>;
-
-	gpio-controller;
-	#gpio-cells = <2>;
-
-	led0: red-aux@0 {
-		label = "red:aux";
-		reg = <0x0>;
-	};
-
-	led1: green-aux@1 {
-		label = "green:aux";
-		reg = <0x5>;
-		linux,default-trigger = "default-on";
-	};
-
-	wifi-reset@6 {
-		reg = <0x6>;
-		compatible = "gpio";
-	};
-};
-
diff --git a/Documentation/devicetree/bindings/leds/ti,tca6507.yaml b/Documentation/devicetree/bindings/leds/ti,tca6507.yaml
new file mode 100644
index 0000000000000..94c307c987621
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/ti,tca6507.yaml
@@ -0,0 +1,134 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/ti,tca6507.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: TCA6507 LED and GPIO controller
+
+maintainers:
+  - NeilBrown <neilb@suse.de>
+
+description:
+  The TCA6507 is a programmable LED controller connected via I2C that can drive
+  7 separate lines either by holding them low, or by pulsing them with modulated
+  width.
+
+properties:
+  compatible:
+    const: ti,tca6507
+
+  reg:
+    description: I2C slave address of the controller.
+    maxItems: 1
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+  gpio-controller: true
+
+  "#gpio-cells":
+    const: 2
+
+  gpio-line-names: true
+
+patternProperties:
+  "^led@[0-6]$":
+    type: object
+
+    $ref: common.yaml#
+
+    properties:
+      reg:
+        minimum: 0
+        maximum: 6
+
+    required:
+      - reg
+
+  "^gpio@[0-6]$":
+    type: object
+
+    properties:
+      compatible:
+        const: gpio
+
+      reg:
+        minimum: 0
+        maximum: 6
+
+    additionalProperties: false
+
+    required:
+      - reg
+      - compatible
+
+if:
+  patternProperties:
+    "^gpio@[0-6]$":
+      properties:
+        compatible:
+          contains:
+            const: gpio
+then:
+  required:
+    - gpio-controller
+    - "#gpio-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/leds/common.h>
+
+    i2c0 {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        led-controller@45 {
+            compatible = "ti,tca6507";
+            #address-cells = <1>;
+            #size-cells = <0>;
+            reg = <0x45>;
+
+            gpio-controller;
+            #gpio-cells = <2>;
+
+            gpio-line-names = "wifi_reset@6";
+
+            led@0 {
+                label = "gta04:red:aux";
+                reg = <0x0>;
+            };
+
+            led@1 {
+                label = "gta04:green:aux";
+                reg = <0x1>;
+            };
+
+            led@3 {
+                reg = <0x3>;
+                color = <LED_COLOR_ID_RED>;
+                function = LED_FUNCTION_POWER;
+                linux,default-trigger = "default-on";
+            };
+
+            led@4 {
+                color = <LED_COLOR_ID_GREEN>;
+                function = LED_FUNCTION_POWER;
+                reg = <0x4>;
+            };
+
+            gpio@6 {
+                compatible = "gpio";
+                reg = <0x6>;
+            };
+        };
+    };
+
+...
-- 
2.26.2

