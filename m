Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4872237A686
	for <lists+linux-leds@lfdr.de>; Tue, 11 May 2021 14:25:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231587AbhEKM0k (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 11 May 2021 08:26:40 -0400
Received: from polaris.svanheule.net ([84.16.241.116]:35924 "EHLO
        polaris.svanheule.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231478AbhEKM0i (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 11 May 2021 08:26:38 -0400
Received: from terra.local.svanheule.net (unknown [IPv6:2a02:a03f:eafb:ee01:a5bf:613f:4f5:f348])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: sander@svanheule.net)
        by polaris.svanheule.net (Postfix) with ESMTPSA id 31EA71FCC20;
        Tue, 11 May 2021 14:25:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svanheule.net;
        s=mail1707; t=1620735931;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Pt5VbHjv7TStXCyOId4oblbPWK+NoFcaQiOp8x5WPqo=;
        b=LgkPSm1BZM3fRNKHQUxbn2GffmERC4XYR3V+zLw9ZkfrbnnaGXfAy22kAdD7V13Z7Wm+m4
        Wh/AUbcehTDyX5cRKRhkkKuBgSzC8+humvzL6los91XWrZouDxxnb/gtIDbRzpl6q1dNf1
        9UQo2UYJZLjOEshIqFDfsIEjLoLLVQfpYcf3KqLMa3malwDmRIl3Zlh2CJZyy7IoiNKAfR
        qye7czyIges5qODmQNJZP84AMV2QLZWQ42yf7TmufnOXYt5y1ATpvk2CPb3b/LhBnWktSc
        uzlgi4YQ9zSbtJspgomIvu0cZc99saLV/hT9WZMgAyr7/ro2lEaQIVbFXVy/tw==
From:   Sander Vanheule <sander@svanheule.net>
To:     Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Sander Vanheule <sander@svanheule.net>
Subject: [PATCH 2/5] dt-bindings: mfd: Binding for RTL8231
Date:   Tue, 11 May 2021 14:25:20 +0200
Message-Id: <73e017d08117cee1290b9483c23f79f956f41a6d.1620735871.git.sander@svanheule.net>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1620735871.git.sander@svanheule.net>
References: <cover.1620735871.git.sander@svanheule.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Add a binding description for the Realtek RTL8231, a GPIO and LED
expander chip commonly used in ethernet switches based on a Realtek
switch SoC. These chips can be addressed via an MDIO or SMI bus, or used
as a plain 36-bit shift register.

This binding only describes the feature set provided by the MDIO/SMI
configuration, and covers the GPIO, PWM, and pin control properties. The
LED properties are defined in a separate binding.

Signed-off-by: Sander Vanheule <sander@svanheule.net>
---
 .../bindings/mfd/realtek,rtl8231.yaml         | 202 ++++++++++++++++++
 1 file changed, 202 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/realtek,rtl8231.yaml

diff --git a/Documentation/devicetree/bindings/mfd/realtek,rtl8231.yaml b/Documentation/devicetree/bindings/mfd/realtek,rtl8231.yaml
new file mode 100644
index 000000000000..2023cfa887a3
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/realtek,rtl8231.yaml
@@ -0,0 +1,202 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/realtek,rtl8231.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Realtek RTL8231 GPIO and LED expander.
+
+maintainers:
+  - Sander Vanheule <sander@svanheule.net>
+
+description: |
+  The RTL8231 is a GPIO and LED expander chip, providing up to 37 GPIOs, up to
+  88 LEDs, and up to one PWM output. This device is frequently used alongside
+  Realtek switch SoCs, to provide additional I/O capabilities.
+
+  To manage the RTL8231's features, its strapping pins can be used to configure
+  it in one of three modes: shift register, MDIO device, or SMI device. The
+  shift register mode does not need special support. In MDIO or SMI mode, most
+  pins can be configured as a GPIO output, LED matrix scan line/column, or as a
+  PWM output.
+
+  The GPIO and pin control are part of the main node. PWM and LED support are
+  configured as sub-nodes.
+
+properties:
+  compatible:
+    const: realtek,rtl8231
+
+  reg:
+    description: MDIO or SMI device address.
+    maxItems: 1
+
+  # GPIO support
+  gpio-controller: true
+
+  "#gpio-cells":
+    const: 2
+    description: |
+      The first cell is the pin number and the second cell is used to specify
+      the gpio active state.
+
+  gpio-ranges:
+    description: |
+      Must reference itself, and provide a zero-based mapping for 37 pins.
+    maxItems: 1
+
+  # Pin muxing and configuration
+  realtek,drive-strength:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: |
+      Common drive strength used for all GPIO output pins, must be 4mA or 8mA.
+      On reset, this value will default to 8mA.
+    enum: [4, 8]
+
+  # LED scanning matrix
+  leds:
+    $ref: ../leds/realtek,rtl8231-leds.yaml#
+
+  # PWM output
+  pwm:
+    type: object
+    description: |
+      Subnode describing the PWM peripheral. To use the PWM output, gpio35 must
+      be muxed to its 'pwm' function. Valid frequency values for consumers are
+      1200, 1600, 2000, 2400, 2800, 3200, 4000, and 4800.
+
+    properties:
+      "#pwm-cells":
+        description: |
+          Twos cells with PWM index (must be 0) and PWM frequency in Hz.
+        const: 2
+
+    required:
+      - "#pwm-cells"
+
+patternProperties:
+  "-pins$":
+    type: object
+    $ref: ../pinctrl/pinmux-node.yaml#
+
+    properties:
+      pins:
+        items:
+          oneOf:
+            - enum: ["gpio0", "gpio1", "gpio2", "gpio3", "gpio4", "gpio5", "gpio6",
+                     "gpio7", "gpio8", "gpio9", "gpio10", "gpio11", "gpio12", "gpio13",
+                     "gpio14", "gpio15", "gpio16", "gpio17", "gpio18", "gpio19", "gpio20",
+                     "gpio21", "gpio22", "gpio23", "gpio24", "gpio25", "gpio26", "gpio27",
+                     "gpio28", "gpio29", "gpio30", "gpio31", "gpio32", "gpio33", "gpio34",
+                     "gpio35", "gpio36"]
+        minItems: 1
+        maxItems: 37
+      function:
+        description: |
+          Select which function to use. "gpio" is supported for all pins, "led" is supported
+          for pins 0-34, "pwm" is supported for for pin 35.
+        enum: ["gpio", "led", "pwm"]
+
+    required:
+      - pins
+      - function
+
+required:
+  - compatible
+  - reg
+  - gpio-controller
+  - "#gpio-cells"
+  - gpio-ranges
+
+additionalProperties: false
+
+examples:
+  - |
+    // Minimal example
+    mdio {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        expander0: expander@0 {
+            compatible = "realtek,rtl8231";
+            reg = <0>;
+
+            gpio-controller;
+            #gpio-cells = <2>;
+            gpio-ranges = <&expander0 0 0 37>;
+        };
+    };
+  - |
+    // All bells and whistles included
+    #include <dt-bindings/leds/common.h>
+    mdio {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        expander1: expander@1 {
+            compatible = "realtek,rtl8231";
+            reg = <1>;
+
+            gpio-controller;
+            #gpio-cells = <2>;
+            gpio-ranges = <&expander1 0 0 37>;
+
+            realtek,drive-strength = <4>;
+
+            button-pins {
+                pins = "gpio36";
+                function = "gpio";
+                input-debounce = "100000";
+            };
+
+            pwm-pins {
+                pins = "gpio35";
+                function = "pwm";
+            };
+
+            led-pins {
+                pins = "gpio0", "gpio1", "gpio3", "gpio4";
+                function = "led";
+            };
+
+            pwm {
+                #pwm-cells = <2>;
+            };
+
+            leds {
+                compatible = "realtek,rtl8231-leds";
+                #address-cells = <2>;
+                #size-cells = <0>;
+
+                realtek,led-scan-mode = "single-color";
+
+                led@0,0 {
+                    reg = <0 0>;
+                    color = <LED_COLOR_ID_GREEN>;
+                    function = LED_FUNCTION_LAN;
+                    function-enumerator = <0>;
+                };
+
+                led@0,1 {
+                    reg = <0 1>;
+                    color = <LED_COLOR_ID_AMBER>;
+                    function = LED_FUNCTION_LAN;
+                    function-enumerator = <0>;
+                };
+
+                led@1,0 {
+                    reg = <1 0>;
+                    color = <LED_COLOR_ID_GREEN>;
+                    function = LED_FUNCTION_LAN;
+                    function-enumerator = <1>;
+                };
+
+                led@1,1 {
+                    reg = <1 1>;
+                    color = <LED_COLOR_ID_AMBER>;
+                    function = LED_FUNCTION_LAN;
+                    function-enumerator = <1>;
+                };
+            };
+        };
+    };
-- 
2.31.1

