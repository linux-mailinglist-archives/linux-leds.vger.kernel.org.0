Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA1982A7AD9
	for <lists+linux-leds@lfdr.de>; Thu,  5 Nov 2020 10:44:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726280AbgKEJoA (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 5 Nov 2020 04:44:00 -0500
Received: from mga09.intel.com ([134.134.136.24]:33602 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725468AbgKEJoA (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Thu, 5 Nov 2020 04:44:00 -0500
IronPort-SDR: +2VlLOwP1p23HIyz47RPZrXHhWEcY7AdUQ1SJccvp6s2+PAV3clPWxYaTO6g9TFhwfYEPoZ2yl
 k8BlcgWgof/A==
X-IronPort-AV: E=McAfee;i="6000,8403,9795"; a="169498711"
X-IronPort-AV: E=Sophos;i="5.77,453,1596524400"; 
   d="scan'208";a="169498711"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2020 01:43:59 -0800
IronPort-SDR: pE9UuVIndlimvwkB72VNabhAXd/FqGcBZObmaBwyHY15DMDeMHAoaQakKYtlV36JAvfOs45bCr
 +A04c/EJNZ5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,453,1596524400"; 
   d="scan'208";a="397197968"
Received: from sgsxdev004.isng.intel.com (HELO localhost) ([10.226.88.13])
  by orsmga001.jf.intel.com with ESMTP; 05 Nov 2020 01:43:57 -0800
From:   Amireddy Mallikarjuna reddy <mallikarjunax.reddy@linux.intel.com>
To:     linux-leds@vger.kernel.org, pavel@ucw.cz, dmurphy@ti.com,
        devicetree@vger.kernel.org, robh+dt@kernel.org
Cc:     linux-kernel@vger.kernel.org, cheol.yong.kim@intel.com,
        qi-ming.wu@intel.com, mallikarjunax.reddy@linux.intel.com,
        malliamireddy009@gmail.com, yixin.zhu@intel.com
Subject: [PATCH v1 1/2] dt-bindings: leds: Add bindings for intel LGM SOC
Date:   Thu,  5 Nov 2020 17:43:50 +0800
Message-Id: <c9c963a2d03fbd03bd21f71f3d776ac5800cf6cc.1604331498.git.mallikarjunax.reddy@linux.intel.com>
X-Mailer: git-send-email 2.11.0
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Add DT bindings YAML schema for SSO controller driver
of Lightning Mountain(LGM) SoC.

Signed-off-by: Amireddy Mallikarjuna reddy <mallikarjunax.reddy@linux.intel.com>
---
 .../devicetree/bindings/leds/leds-lgm.yaml         | 116 +++++++++++++++++++++
 1 file changed, 116 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-lgm.yaml

diff --git a/Documentation/devicetree/bindings/leds/leds-lgm.yaml b/Documentation/devicetree/bindings/leds/leds-lgm.yaml
new file mode 100644
index 000000000000..1acf1fa9643b
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/leds-lgm.yaml
@@ -0,0 +1,116 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/leds-lgm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Intel LGM Soc LED SSO driver
+
+maintainers:
+  - Yixin.zhu@intel.com
+  - mallikarjunax.reddy@intel.com
+
+properties:
+ compatible:
+   const: intel,sso-led
+
+ reg:
+  maxItems: 1
+
+ clocks:
+  maxItems: 2
+
+ gpio-controller: true
+
+ '#gpio-cells':
+   const: 2
+
+ intel,sso-gpio-base:
+  $ref: /schemas/types.yaml#definitions/uint32
+  description:
+    Identifies the first gpio handled.
+
+ ngpios:
+  minimum: 0
+  maximum: 32
+  description:
+    Number of GPIOs this controller provides.
+
+ intel,sso-update-rate:
+  $ref: /schemas/types.yaml#definitions/uint32
+  description:
+    Blink frequency for SOUTs in Hz.
+
+ ssoled:
+    type: object
+    description:
+       This sub-node must contain a sub-node for each leds.
+
+    patternProperties:
+      "^led@[0-23]$":
+        type: object
+
+        properties:
+          intel,led-pin:
+            $ref: /schemas/types.yaml#/definitions/uint32
+            description:
+               This indicates the LED pin number.
+
+          intel,sso-brightness:
+            $ref: /schemas/types.yaml#/definitions/uint32
+            description: brightness level of the LED.
+            minimum: 0
+            maximum: 255
+
+          intel,sso-hw-trigger:
+            type: boolean
+            description: This property indicates Hardware driven/control LED.
+
+          intel,sso-hw-blink:
+            type: boolean
+            description: This property indicates Enable LED blink by Hardware.
+
+          intel,sso-blink-rate:
+            $ref: /schemas/types.yaml#/definitions/uint32
+            description: LED HW blink frequency.
+
+required:
+ - compatible
+ - reg
+ - clocks
+ - "#gpio-cells"
+ - gpio-controller
+
+additionalProperties: false
+
+examples:
+ - |
+   #include <dt-bindings/clock/intel,lgm-clk.h>
+
+   ssogpio: ssogpio@E0D40000 {
+     compatible = "intel,sso-led";
+     reg = <0xE0D40000 0x2E4>;
+     gpio-controller;
+     #gpio-cells = <2>;
+     ngpios = <32>;
+     pinctrl-names = "default";
+     pinctrl-0 = <&pinctrl_ledc>;
+     clocks = <&cgu0 LGM_GCLK_LEDC0>, <&afeclk>;
+     clock-names = "sso", "fpid";
+     intel,sso-update-rate = <250000>;
+
+     ssoled {
+        led0 {
+          label = "led0:green:gphy";
+          led-gpio = <&ssogpio 0 0>;
+          intel,led-pin = <0>;
+        };
+
+        led23 {
+          label = "led23:green:power_led";
+          led-gpio = <&ssogpio 23 0>;
+          intel,led-pin = <23>;
+          intel,sso-brightness = <0x255>;
+        };
+     };
+   };
-- 
2.11.0

