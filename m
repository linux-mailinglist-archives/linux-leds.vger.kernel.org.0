Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 71D2F2B4311
	for <lists+linux-leds@lfdr.de>; Mon, 16 Nov 2020 12:44:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728356AbgKPLm7 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 16 Nov 2020 06:42:59 -0500
Received: from mga03.intel.com ([134.134.136.65]:49271 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726487AbgKPLm7 (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Mon, 16 Nov 2020 06:42:59 -0500
IronPort-SDR: ClaXI4WNnmdTKwU5AtUVFvzAUJPs6Btt3ajormKV7qICe1xa2EbMJM50aV3mIir7QHmRaRIdrd
 yFYEFR0M4jrA==
X-IronPort-AV: E=McAfee;i="6000,8403,9806"; a="170835769"
X-IronPort-AV: E=Sophos;i="5.77,482,1596524400"; 
   d="scan'208";a="170835769"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2020 03:42:58 -0800
IronPort-SDR: Qi1s0Ek/xRNPEsHppnSRiF+tJP9437Rko+uhHEB8Mt9me4JBXN4fv1yzm0tOpKcg2FN7tOIqSf
 dIljw7Wey9pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,482,1596524400"; 
   d="scan'208";a="367679963"
Received: from sgsxdev004.isng.intel.com (HELO localhost) ([10.226.88.13])
  by orsmga007.jf.intel.com with ESMTP; 16 Nov 2020 03:42:55 -0800
From:   Amireddy Mallikarjuna reddy <mallikarjunax.reddy@linux.intel.com>
To:     linux-leds@vger.kernel.org, pavel@ucw.cz, dmurphy@ti.com,
        devicetree@vger.kernel.org, robh+dt@kernel.org
Cc:     linux-kernel@vger.kernel.org, cheol.yong.kim@intel.com,
        qi-ming.wu@intel.com, mallikarjunax.reddy@linux.intel.com,
        malliamireddy009@gmail.com, yixin.zhu@intel.com
Subject: [PATCH v2 1/2] dt-bindings: leds: Add bindings for Intel LGM SoC
Date:   Mon, 16 Nov 2020 19:42:51 +0800
Message-Id: <bce27bce2df36e04c5b9b688b1defd9c4fc9b191.1605526923.git.mallikarjunax.reddy@linux.intel.com>
X-Mailer: git-send-email 2.11.0
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Add DT bindings YAML schema for SSO controller driver
of Lightning Mountain (LGM) SoC.

Signed-off-by: Amireddy Mallikarjuna reddy <mallikarjunax.reddy@linux.intel.com>
---
v1:
- Initial version

v2:
- Fix bot errors (wrong indentation).
- Spell out LGM and SSO.
- Remove vendor specific name for LED properites.
- removed deprecating property "label"
- Include 'reg', 'function' & 'color' properties.
---
 .../devicetree/bindings/leds/leds-lgm.yaml         | 130 +++++++++++++++++++++
 1 file changed, 130 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-lgm.yaml

diff --git a/Documentation/devicetree/bindings/leds/leds-lgm.yaml b/Documentation/devicetree/bindings/leds/leds-lgm.yaml
new file mode 100644
index 000000000000..d9c53ec30ad1
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/leds-lgm.yaml
@@ -0,0 +1,130 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/leds-lgm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Intel Lightning Mountain (LGM) SoC LED Serial Shift Output (SSO) Controller driver
+
+maintainers:
+  - Yixin.zhu@intel.com
+  - mallikarjunax.reddy@intel.com
+
+properties:
+  compatible:
+    const: intel,sso-led
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 2
+
+  clock-names:
+    maxItems: 2
+    items:
+      - const: sso
+      - const: fpid
+
+  gpio-controller: true
+
+  '#gpio-cells':
+    const: 2
+
+  intel,sso-gpio-base:
+    $ref: /schemas/types.yaml#definitions/uint32
+    description:
+      Identifies the first gpio handled.
+
+  ngpios:
+    minimum: 0
+    maximum: 32
+    description:
+      Number of GPIOs this controller provides.
+
+  intel,sso-update-rate:
+    $ref: /schemas/types.yaml#definitions/uint32
+    description:
+      Blink frequency for SOUTs in Hz.
+
+  ssoled:
+    type: object
+    description:
+      This sub-node must contain a sub-node for each leds.
+
+    patternProperties:
+      "^led@[0-23]$":
+        type: object
+
+        properties:
+          reg:
+            description: Index of the LED.
+            minimum: 0
+            maximum: 2
+
+          sso-hw-trigger:
+            type: boolean
+            description: This property indicates Hardware driven/control LED.
+
+          sso-hw-blink:
+            type: boolean
+            description: This property indicates Enable LED blink by Hardware.
+
+          sso-blink-rate:
+            $ref: /schemas/types.yaml#/definitions/uint32
+            description: LED HW blink frequency.
+
+          retain-state-suspended:
+            type: boolean
+            description: The suspend state of LED can be retained.
+
+          retain-state-shutdown:
+            type: boolean
+            description: Retain the state of the LED on shutdown.
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - "#gpio-cells"
+  - gpio-controller
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/intel,lgm-clk.h>
+    #include <dt-bindings/leds/common.h>
+
+    ssogpio: ssogpio@E0D40000 {
+      compatible = "intel,sso-led";
+      reg = <0xE0D40000 0x2E4>;
+      gpio-controller;
+      #gpio-cells = <2>;
+      ngpios = <32>;
+      pinctrl-names = "default";
+      pinctrl-0 = <&pinctrl_ledc>;
+      clocks = <&cgu0 LGM_GCLK_LEDC0>, <&afeclk>;
+      clock-names = "sso", "fpid";
+      intel,sso-update-rate = <250000>;
+
+      ssoled {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        led@0 {
+          reg = <0>;
+          function = "gphy";
+          color = <LED_COLOR_ID_GREEN>;
+          led-gpio = <&ssogpio 0 0>;
+        };
+
+        led@23 {
+          reg = <23>;
+          function = LED_FUNCTION_POWER;
+          color = <LED_COLOR_ID_GREEN>;
+          led-gpio = <&ssogpio 23 0>;
+        };
+      };
+    };
-- 
2.11.0

