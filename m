Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 528721337DF
	for <lists+linux-leds@lfdr.de>; Wed,  8 Jan 2020 01:18:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727135AbgAHARm (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 7 Jan 2020 19:17:42 -0500
Received: from mail-oi1-f196.google.com ([209.85.167.196]:34699 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725601AbgAHARm (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 7 Jan 2020 19:17:42 -0500
Received: by mail-oi1-f196.google.com with SMTP id l136so1179210oig.1;
        Tue, 07 Jan 2020 16:17:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Ck7AHLGonX7UEedk8NAVpYPHRwqjxhAXzQKRh/xv8/s=;
        b=iBjVOBAudM3zNdET2YBsLZWLEVkQ0hkRzuWHc7/Ehe1nAkHUlzqkBjoGScIk95ETRq
         DB68kOTs5YMbkzZqKphLwtj+DS6NfyJnXUk5SMb2NhjmxMt8iqbjIOes981daKzIWx3Y
         gI92LdtDWCZ3IHVzwIELr92TjVhLUB1Wf5sbuPq+nyweC6m5axSLutmyQJ2/0aVm+G0g
         rHDGXVNy24HP5WYvrHhrKBL/APUBINUfVGLWUEy6EBH2Qrh/OROZRcljVsFZp/XF03PW
         HYQcjK1v3qBsdtsEQzOaDqgQN4ShtCLaHJH9O/Hqhshp0IR7aSjZGnrRBoBSzrb9D72s
         AtCQ==
X-Gm-Message-State: APjAAAWJidPHeXvRn8jAPOK3gtqa0aMP9CRDoQzdYXDnBVKGria55tJ7
        46UHQFO1BhGSCfpXxJKeGW8XoJc=
X-Google-Smtp-Source: APXvYqz7VH5C1Hh4gcZB6UDv1LJ4+Ar2EQYinwrFtQUyfVO/HIFtS2jFIz8mdiw0XZ3aqzg0s0Jr9w==
X-Received: by 2002:aca:568f:: with SMTP id k137mr943738oib.63.1578442660858;
        Tue, 07 Jan 2020 16:17:40 -0800 (PST)
Received: from xps15.herring.priv (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.googlemail.com with ESMTPSA id g19sm489263otj.1.2020.01.07.16.17.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2020 16:17:39 -0800 (PST)
From:   Rob Herring <robh@kernel.org>
To:     linux-leds@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: [PATCH v2 1/2] dt-bindings: leds: Convert common LED binding to schema
Date:   Tue,  7 Jan 2020 18:17:37 -0600
Message-Id: <20200108001738.8209-1-robh@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Convert the common LEDs properties bindings to a schema. As trigger source
providers are different nodes, we need to split trigger source properties
to a separate file.

Bindings for LED controllers can reference the common schema for the LED
child nodes:

patternProperties:
  "^led@[0-4]":
    type: object
    allOf:
      - $ref: common.yaml#

Cc: Pavel Machek <pavel@ucw.cz>
Cc: Dan Murphy <dmurphy@ti.com>
Cc: linux-leds@vger.kernel.org
Acked-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Signed-off-by: Rob Herring <robh@kernel.org>
---
Jacek, Please take this via led tree

v2:
- Fix typo in function

 .../devicetree/bindings/leds/common.txt       | 174 +------------
 .../devicetree/bindings/leds/common.yaml      | 228 ++++++++++++++++++
 .../bindings/leds/trigger-source.yaml         |  24 ++
 3 files changed, 253 insertions(+), 173 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/leds/common.yaml
 create mode 100644 Documentation/devicetree/bindings/leds/trigger-source.yaml

diff --git a/Documentation/devicetree/bindings/leds/common.txt b/Documentation/devicetree/bindings/leds/common.txt
index 9fa6f9795d50..26d770ef3601 100644
--- a/Documentation/devicetree/bindings/leds/common.txt
+++ b/Documentation/devicetree/bindings/leds/common.txt
@@ -1,173 +1 @@
-* Common leds properties.
-
-LED and flash LED devices provide the same basic functionality as current
-regulators, but extended with LED and flash LED specific features like
-blinking patterns, flash timeout, flash faults and external flash strobe mode.
-
-Many LED devices expose more than one current output that can be connected
-to one or more discrete LED component. Since the arrangement of connections
-can influence the way of the LED device initialization, the LED components
-have to be tightly coupled with the LED device binding. They are represented
-by child nodes of the parent LED device binding.
-
-
-Optional properties for child nodes:
-- led-sources : List of device current outputs the LED is connected to. The
-		outputs are identified by the numbers that must be defined
-		in the LED device binding documentation.
-
-- function: LED functon. Use one of the LED_FUNCTION_* prefixed definitions
-	    from the header include/dt-bindings/leds/common.h.
-	    If there is no matching LED_FUNCTION available, add a new one.
-
-- color : Color of the LED. Use one of the LED_COLOR_ID_* prefixed definitions
-	  from the header include/dt-bindings/leds/common.h.
-	  If there is no matching LED_COLOR_ID available, add a new one.
-
-- function-enumerator: Integer to be used when more than one instance
-                       of the same function is needed, differing only with
-		       an ordinal number.
-
-- label : The label for this LED. If omitted, the label is taken from the node
-	  name (excluding the unit address). It has to uniquely identify
-	  a device, i.e. no other LED class device can be assigned the same
-	  label. This property is deprecated - use 'function' and 'color'
-	  properties instead. function-enumerator has no effect when this
-	  property is present.
-
-- default-state : The initial state of the LED. Valid values are "on", "off",
-  and "keep". If the LED is already on or off and the default-state property is
-  set the to same value, then no glitch should be produced where the LED
-  momentarily turns off (or on). The "keep" setting will keep the LED at
-  whatever its current state is, without producing a glitch.  The default is
-  off if this property is not present.
-
-- linux,default-trigger :  This parameter, if present, is a
-    string defining the trigger assigned to the LED.  Current triggers are:
-     "backlight" - LED will act as a back-light, controlled by the framebuffer
-		   system
-     "default-on" - LED will turn on (but for leds-gpio see "default-state"
-		    property in Documentation/devicetree/bindings/leds/leds-gpio.txt)
-     "heartbeat" - LED "double" flashes at a load average based rate
-     "disk-activity" - LED indicates disk activity
-     "ide-disk" - LED indicates IDE disk activity (deprecated),
-                  in new implementations use "disk-activity"
-     "timer" - LED flashes at a fixed, configurable rate
-     "pattern" - LED alters the brightness for the specified duration with one
-                 software timer (requires "led-pattern" property)
-
-- led-pattern : Array of integers with default pattern for certain triggers.
-                Each trigger may parse this property differently:
-                - one-shot : two numbers specifying delay on and delay off (in ms),
-                - timer : two numbers specifying delay on and delay off (in ms),
-                - pattern : the pattern is given by a series of tuples, of
-                  brightness and duration (in ms).  The exact format is
-                  described in:
-                  Documentation/devicetree/bindings/leds/leds-trigger-pattern.txt
-
-
-- led-max-microamp : Maximum LED supply current in microamperes. This property
-                     can be made mandatory for the board configurations
-                     introducing a risk of hardware damage in case an excessive
-                     current is set.
-                     For flash LED controllers with configurable current this
-                     property is mandatory for the LEDs in the non-flash modes
-                     (e.g. torch or indicator).
-
-- panic-indicator : This property specifies that the LED should be used,
-		    if at all possible, as a panic indicator.
-
-- trigger-sources : List of devices which should be used as a source triggering
-		    this LED activity. Some LEDs can be related to a specific
-		    device and should somehow indicate its state. E.g. USB 2.0
-		    LED may react to device(s) in a USB 2.0 port(s).
-		    Another common example is switch or router with multiple
-		    Ethernet ports each of them having its own LED assigned
-		    (assuming they are not hardwired). In such cases this
-		    property should contain phandle(s) of related source
-		    device(s).
-		    In many cases LED can be related to more than one device
-		    (e.g. one USB LED vs. multiple USB ports). Each source
-		    should be represented by a node in the device tree and be
-		    referenced by a phandle and a set of phandle arguments. A
-		    length of arguments should be specified by the
-		    #trigger-source-cells property in the source node.
-
-Required properties for flash LED child nodes:
-- flash-max-microamp : Maximum flash LED supply current in microamperes.
-- flash-max-timeout-us : Maximum timeout in microseconds after which the flash
-                         LED is turned off.
-
-For controllers that have no configurable current the flash-max-microamp
-property can be omitted.
-For controllers that have no configurable timeout the flash-max-timeout-us
-property can be omitted.
-
-* Trigger source providers
-
-Each trigger source should be represented by a device tree node. It may be e.g.
-a USB port or an Ethernet device.
-
-Required properties for trigger source:
-- #trigger-source-cells : Number of cells in a source trigger. Typically 0 for
-			  nodes of simple trigger sources (e.g. a specific USB
-			  port).
-
-* Examples
-
-#include <dt-bindings/leds/common.h>
-
-led-controller@0 {
-	compatible = "gpio-leds";
-
-	led0 {
-		function = LED_FUNCTION_STATUS;
-		linux,default-trigger = "heartbeat";
-		gpios = <&gpio0 0 GPIO_ACTIVE_HIGH>;
-	};
-
-	led1 {
-		function = LED_FUNCTION_USB;
-		gpios = <&gpio0 1 GPIO_ACTIVE_HIGH>;
-		trigger-sources = <&ohci_port1>, <&ehci_port1>;
-	};
-};
-
-led-controller@0 {
-	compatible = "maxim,max77693-led";
-
-	led {
-		function = LED_FUNCTION_FLASH;
-		color = <LED_COLOR_ID_WHITE>;
-		led-sources = <0>, <1>;
-		led-max-microamp = <50000>;
-		flash-max-microamp = <320000>;
-		flash-max-timeout-us = <500000>;
-	};
-};
-
-led-controller@30 {
-        compatible = "panasonic,an30259a";
-        reg = <0x30>;
-        #address-cells = <1>;
-        #size-cells = <0>;
-
-        led@1 {
-		reg = <1>;
-		linux,default-trigger = "heartbeat";
-		function = LED_FUNCTION_INDICATOR;
-		function-enumerator = <1>;
-        };
-
-        led@2 {
-		reg = <2>;
-		function = LED_FUNCTION_INDICATOR;
-		function-enumerator = <2>;
-        };
-
-        led@3 {
-		reg = <3>;
-		function = LED_FUNCTION_INDICATOR;
-		function-enumerator = <3>;
-        };
-};
+This file has moved to ./common.yaml.
diff --git a/Documentation/devicetree/bindings/leds/common.yaml b/Documentation/devicetree/bindings/leds/common.yaml
new file mode 100644
index 000000000000..d97d099b87e5
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/common.yaml
@@ -0,0 +1,228 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/common.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Common leds properties
+
+maintainers:
+  - Jacek Anaszewski <jacek.anaszewski@gmail.com>
+  - Pavel Machek <pavel@ucw.cz>
+
+description:
+  LED and flash LED devices provide the same basic functionality as current
+  regulators, but extended with LED and flash LED specific features like
+  blinking patterns, flash timeout, flash faults and external flash strobe mode.
+
+  Many LED devices expose more than one current output that can be connected
+  to one or more discrete LED component. Since the arrangement of connections
+  can influence the way of the LED device initialization, the LED components
+  have to be tightly coupled with the LED device binding. They are represented
+  by child nodes of the parent LED device binding.
+
+properties:
+  led-sources:
+    description:
+      List of device current outputs the LED is connected to. The outputs are
+      identified by the numbers that must be defined in the LED device binding
+      documentation.
+    $ref: /schemas/types.yaml#definitions/uint32-array
+
+  function:
+    description:
+      LED function. Use one of the LED_FUNCTION_* prefixed definitions
+      from the header include/dt-bindings/leds/common.h. If there is no
+      matching LED_FUNCTION available, add a new one.
+    $ref: /schemas/types.yaml#definitions/string
+
+  color:
+    description:
+      Color of the LED. Use one of the LED_COLOR_ID_* prefixed definitions from
+      the header include/dt-bindings/leds/common.h. If there is no matching
+      LED_COLOR_ID available, add a new one.
+    allOf:
+      - $ref: /schemas/types.yaml#definitions/uint32
+    minimum: 0
+    maximum: 8
+
+  function-enumerator:
+    description:
+      Integer to be used when more than one instance of the same function is
+      needed, differing only with an ordinal number.
+    $ref: /schemas/types.yaml#definitions/uint32
+
+  label:
+    description:
+      The label for this LED. If omitted, the label is taken from the node name
+      (excluding the unit address). It has to uniquely identify a device, i.e.
+      no other LED class device can be assigned the same label. This property is
+      deprecated - use 'function' and 'color' properties instead.
+      function-enumerator has no effect when this property is present.
+
+  default-state:
+    description:
+      The initial state of the LED. If the LED is already on or off and the
+      default-state property is set the to same value, then no glitch should be
+      produced where the LED momentarily turns off (or on). The "keep" setting
+      will keep the LED at whatever its current state is, without producing a
+      glitch.
+    allOf:
+      - $ref: /schemas/types.yaml#definitions/string
+    enum:
+      - on
+      - off
+      - keep
+    default: off
+
+  linux,default-trigger:
+    description:
+      This parameter, if present, is a string defining the trigger assigned to
+      the LED.
+    allOf:
+      - $ref: /schemas/types.yaml#definitions/string
+    enum:
+        # LED will act as a back-light, controlled by the framebuffer system
+      - backlight
+        # LED will turn on (but for leds-gpio see "default-state" property in
+        # Documentation/devicetree/bindings/leds/leds-gpio.txt)
+      - default-on
+        # LED "double" flashes at a load average based rate
+      - heartbeat
+        # LED indicates disk activity
+      - disk-activity
+        # LED indicates IDE disk activity (deprecated), in new implementations
+        # use "disk-activity"
+      - ide-disk
+        # LED flashes at a fixed, configurable rate
+      - timer
+        # LED alters the brightness for the specified duration with one software
+        # timer (requires "led-pattern" property)
+      - pattern
+
+  led-pattern:
+    description: |
+      Array of integers with default pattern for certain triggers.
+
+      Each trigger may parse this property differently:
+        - one-shot : two numbers specifying delay on and delay off (in ms),
+        - timer : two numbers specifying delay on and delay off (in ms),
+        - pattern : the pattern is given by a series of tuples, of
+          brightness and duration (in ms).  The exact format is
+          described in:
+          Documentation/devicetree/bindings/leds/leds-trigger-pattern.txt
+    allOf:
+      - $ref: /schemas/types.yaml#definitions/uint32-matrix
+    items:
+      minItems: 2
+      maxItems: 2
+
+  led-max-microamp:
+    description:
+      Maximum LED supply current in microamperes. This property can be made
+      mandatory for the board configurations introducing a risk of hardware
+      damage in case an excessive current is set.
+      For flash LED controllers with configurable current this property is
+      mandatory for the LEDs in the non-flash modes (e.g. torch or indicator).
+
+  panic-indicator:
+    description:
+      This property specifies that the LED should be used, if at all possible,
+      as a panic indicator.
+    type: boolean
+
+  trigger-sources:
+    description: |
+      List of devices which should be used as a source triggering this LED
+      activity. Some LEDs can be related to a specific device and should somehow
+      indicate its state. E.g. USB 2.0 LED may react to device(s) in a USB 2.0
+      port(s).
+      Another common example is switch or router with multiple Ethernet ports
+      each of them having its own LED assigned (assuming they are not
+      hardwired). In such cases this property should contain phandle(s) of
+      related source device(s).
+      In many cases LED can be related to more than one device (e.g. one USB LED
+      vs. multiple USB ports). Each source should be represented by a node in
+      the device tree and be referenced by a phandle and a set of phandle
+      arguments. A length of arguments should be specified by the
+      #trigger-source-cells property in the source node.
+    $ref: /schemas/types.yaml#definitions/phandle-array
+
+  # Required properties for flash LED child nodes:
+  flash-max-microamp:
+    description:
+      Maximum flash LED supply current in microamperes. Required for flash LED
+      nodes with configurable current.
+
+  flash-max-timeout-us:
+    description:
+      Maximum timeout in microseconds after which the flash LED is turned off.
+      Required for flash LED nodes with configurable timeout.
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/leds/common.h>
+
+    led-controller {
+        compatible = "gpio-leds";
+
+        led0 {
+            function = LED_FUNCTION_STATUS;
+            linux,default-trigger = "heartbeat";
+            gpios = <&gpio0 0 GPIO_ACTIVE_HIGH>;
+        };
+
+        led1 {
+            function = LED_FUNCTION_USB;
+            gpios = <&gpio0 1 GPIO_ACTIVE_HIGH>;
+            trigger-sources = <&ohci_port1>, <&ehci_port1>;
+        };
+    };
+
+    led-controller@0 {
+        compatible = "maxim,max77693-led";
+        reg = <0 0x100>;
+
+        led {
+            function = LED_FUNCTION_FLASH;
+            color = <LED_COLOR_ID_WHITE>;
+            led-sources = <0>, <1>;
+            led-max-microamp = <50000>;
+            flash-max-microamp = <320000>;
+            flash-max-timeout-us = <500000>;
+        };
+    };
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        led-controller@30 {
+            compatible = "panasonic,an30259a";
+            reg = <0x30>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            led@1 {
+                reg = <1>;
+                linux,default-trigger = "heartbeat";
+                function = LED_FUNCTION_INDICATOR;
+                function-enumerator = <1>;
+            };
+
+            led@2 {
+                reg = <2>;
+                function = LED_FUNCTION_INDICATOR;
+                function-enumerator = <2>;
+            };
+
+            led@3 {
+                reg = <3>;
+                function = LED_FUNCTION_INDICATOR;
+                function-enumerator = <3>;
+            };
+        };
+    };
+
+...
diff --git a/Documentation/devicetree/bindings/leds/trigger-source.yaml b/Documentation/devicetree/bindings/leds/trigger-source.yaml
new file mode 100644
index 000000000000..0618003e40bd
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/trigger-source.yaml
@@ -0,0 +1,24 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/trigger-source.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Trigger source providers
+
+maintainers:
+  - Jacek Anaszewski <jacek.anaszewski@gmail.com>
+  - Pavel Machek <pavel@ucw.cz>
+
+description:
+  Each trigger source provider should be represented by a device tree node. It
+  may be e.g. a USB port or an Ethernet device.
+
+properties:
+  '#trigger-source-cells':
+    description:
+      Number of cells in a source trigger. Typically 0 for nodes of simple
+      trigger sources (e.g. a specific USB port).
+    enum: [ 0, 1 ]
+
+...
-- 
2.20.1

