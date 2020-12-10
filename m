Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 467B12D56BB
	for <lists+linux-leds@lfdr.de>; Thu, 10 Dec 2020 10:22:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388373AbgLJJOI (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 10 Dec 2020 04:14:08 -0500
Received: from mga07.intel.com ([134.134.136.100]:18524 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388701AbgLJJOF (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Thu, 10 Dec 2020 04:14:05 -0500
IronPort-SDR: oNjLU9Kn+gE76P2Kephz3iVLEtsoutBtnFopXTlJSrbv3Tu+38OntBNI3jNxA2CAH1dZCBEz9x
 QMH1om7Mt0zw==
X-IronPort-AV: E=McAfee;i="6000,8403,9830"; a="238330376"
X-IronPort-AV: E=Sophos;i="5.78,408,1599548400"; 
   d="scan'208";a="238330376"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2020 01:12:18 -0800
IronPort-SDR: Gge6ZG/APD0xChqxyv5yqhDKIcq3bmYXBPkkA4xphzExKt4LrGplRPQM/SR0QYjVmrYVPHkfJv
 gpWhXiSSuHlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,408,1599548400"; 
   d="scan'208";a="364543079"
Received: from sgsxdev004.isng.phoenix.local (HELO localhost) ([10.226.81.179])
  by orsmga008.jf.intel.com with ESMTP; 10 Dec 2020 01:12:16 -0800
From:   Amireddy Mallikarjuna reddy <mallikarjunax.reddy@linux.intel.com>
To:     linux-leds@vger.kernel.org, pavel@ucw.cz, dmurphy@ti.com,
        devicetree@vger.kernel.org, robh+dt@kernel.org
Cc:     linux-kernel@vger.kernel.org, cheol.yong.kim@intel.com,
        qi-ming.wu@intel.com, mallikarjunax.reddy@linux.intel.com,
        malliamireddy009@gmail.com, yixin.zhu@intel.com
Subject: [PATCH v3 1/2] dt-bindings: leds: Add bindings for Intel LGM SoC
Date:   Thu, 10 Dec 2020 17:12:11 +0800
Message-Id: <49ebc8e27958cb77cde36e5f95ad530803259907.1607591119.git.mallikarjunax.reddy@linux.intel.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Add DT bindings YAML schema for SSO controller driver
of Lightning Mountain (LGM) SoC.

Signed-off-by: Amireddy Mallikarjuna reddy <mallikarjunax.reddy@linux.intel.com>
---
v1:
- Initial version.

v2:
- Fix bot errors (wrong indentation).
- Spell out LGM and SSO.
- Remove vendor specific name for LED properites.
- removed deprecating property "label"
- Include 'reg', 'function' & 'color' properties.

v3:
- Included full names(maintainers).
- changed compatible SoC specific.
- Remove redundant properties.
- Updated vendor prefix and unit suffix to properties.
---
 .../devicetree/bindings/leds/leds-lgm.yaml    | 113 ++++++++++++++++++
 1 file changed, 113 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-lgm.yaml

diff --git a/Documentation/devicetree/bindings/leds/leds-lgm.yaml b/Documentation/devicetree/bindings/leds/leds-lgm.yaml
new file mode 100644
index 000000000000..32bbf146c01d
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/leds-lgm.yaml
@@ -0,0 +1,113 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/leds-lgm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Intel Lightning Mountain (LGM) SoC LED Serial Shift Output (SSO) Controller driver
+
+maintainers:
+  - Zhu, Yi Xin <Yixin.zhu@intel.com>
+  - Amireddy Mallikarjuna reddy <mallikarjunax.reddy@intel.com>
+
+properties:
+  compatible:
+    const: intel,lgm-ssoled
+
+  gpio-controller: true
+
+  '#gpio-cells':
+    const: 2
+
+  ngpios:
+    minimum: 0
+    maximum: 32
+    description:
+      Number of GPIOs this controller provides.
+
+  intel,sso-update-rate-hz:
+    description:
+      Blink frequency for SOUTs in Hz.
+
+  led-controller:
+    type: object
+    description:
+      This sub-node must contain a sub-node for each leds.
+
+    additionalProperties: false
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
+          intel,sso-hw-trigger:
+            type: boolean
+            description: This property indicates Hardware driven/control LED.
+
+          intel,sso-hw-blink:
+            type: boolean
+            description: This property indicates Enable LED blink by Hardware.
+
+          intel,sso-blink-rate-hz:
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
+    ssogpio: ssogpio@e0d40000 {
+      compatible = "intel,sso-led";
+      reg = <0xE0D40000 0x2E4>;
+      gpio-controller;
+      #gpio-cells = <2>;
+      ngpios = <32>;
+      pinctrl-names = "default";
+      pinctrl-0 = <&pinctrl_ledc>;
+      clocks = <&cgu0 LGM_GCLK_LEDC0>, <&afeclk>;
+      clock-names = "sso", "fpid";
+      intel,sso-update-rate-hz = <250000>;
+
+      led-controller {
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
2.17.1

