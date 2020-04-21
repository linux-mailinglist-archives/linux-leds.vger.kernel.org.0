Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 101FF1B2E18
	for <lists+linux-leds@lfdr.de>; Tue, 21 Apr 2020 19:17:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729066AbgDURRg (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 21 Apr 2020 13:17:36 -0400
Received: from mail.nic.cz ([217.31.204.67]:35680 "EHLO mail.nic.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729038AbgDURRf (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Tue, 21 Apr 2020 13:17:35 -0400
Received: from dellmb.labs.office.nic.cz (unknown [IPv6:2001:1488:fffe:6:cac7:3539:7f1f:463])
        by mail.nic.cz (Postfix) with ESMTP id 7380B14132D;
        Tue, 21 Apr 2020 19:17:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
        t=1587489453; bh=f97zZx4/UNYBeqtX/DcGEzy5aOSlc0UQXnCw29LoaMY=;
        h=From:To:Date;
        b=ssCyKtWOecVtv+WifYacxzP2qgha/qJpW4+1TyLeZLIUdKHFcJTMLED4pzE7z1YAC
         esPaJNLFTYF2nQ8ItLIzDDA/4pw54yTt6kLNiNUa4KxQONPOOqNLlb2HLdFlHuHv9D
         XD30h5vPz2FVKCJ7lqQQZJhaqceXLrXr1u+fF+ec=
From:   =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>
To:     linux-leds@vger.kernel.org
Cc:     Pavel Machek <pavel@ucw.cz>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: leds: add cznic,turris-omnia-leds binding
Date:   Tue, 21 Apr 2020 19:17:31 +0200
Message-Id: <20200421171732.8277-2-marek.behun@nic.cz>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200421171732.8277-1-marek.behun@nic.cz>
References: <20200421171732.8277-1-marek.behun@nic.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.nic.cz
X-Spam-Status: No, score=0.00
X-Spamd-Bar: /
X-Virus-Scanned: clamav-milter 0.101.4 at mail
X-Virus-Status: Clean
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Add device-tree bindings documentation for Turris Omnia RGB LEDs.

Signed-off-by: Marek Behún <marek.behun@nic.cz>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org
---
 .../leds/cznic,turris-omnia-leds.yaml         | 113 ++++++++++++++++++
 MAINTAINERS                                   |   5 +-
 2 files changed, 116 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/leds/cznic,turris-omnia-leds.yaml

diff --git a/Documentation/devicetree/bindings/leds/cznic,turris-omnia-leds.yaml b/Documentation/devicetree/bindings/leds/cznic,turris-omnia-leds.yaml
new file mode 100644
index 000000000000..f3d13fa65df2
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/cznic,turris-omnia-leds.yaml
@@ -0,0 +1,113 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/cznic,turris-omnia-leds.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: CZ.NIC's Turris Omnia LEDs driver
+
+maintainers:
+  - Marek Behún <marek.behun@nic.cz>
+
+description:
+  This module adds support for the RGB LEDs found on the fron panel of the
+  Turris Omnia router. There are 12 RGB LEDs, they are controlled by device's
+  microcontroller with which the system communicates via I2C. Each LED is
+  described as a subnode of this I2C device.
+
+properties:
+  compatible:
+    const: cznic,turris-omnia-leds
+
+  reg:
+    description: I2C slave address of the microcontroller.
+    maxItems: 1
+
+patternProperties:
+  "^led[0-9][0-9]?$":
+    type: object
+    allOf:
+      - $ref: /schemas/leds/common.yaml#
+    description:
+      This node can either represent one channel of a RGB LED or a whole RGB
+      LED.
+
+    properties:
+      led-sources:
+        description:
+          List of device current outputs the LED connects to. If one number is
+          given, the device described by this node will control one channel of a
+          RGB LED. If three numbers are given (one for each channel of a RGB
+          LED), the device described by this node will control one RGB LED. In
+          this case the numbers must increase by one and the first must be a
+          multiple of 3.
+        allOf:
+          - $ref: /schemas/leds/common.yaml#/properties/led-sources
+          - oneOf:
+              - items:
+                  minimum: 0
+                  maximum: 35
+                minItems: 1
+                maxItems: 1
+              - items:
+                  enum: [ [ 0, 1, 2 ], [ 3, 4, 5 ], [ 6, 7, 8 ], [ 9, 10, 11 ],
+                          [ 12, 13, 14 ], [ 15, 16, 17 ], [ 18, 19, 20 ],
+                          [ 21, 22, 23 ], [ 24, 25, 26 ], [ 27, 28, 29 ],
+                          [ 30, 31, 32 ], [ 33, 34, 35] ]
+
+      color:
+        description:
+          Should be one of LED_COLOR_ID_*. Allowed values are red, green or blue
+          if there is one item in led-sources, otherwise white.
+        allOf:
+          - $ref: /schemas/leds/common.yaml#/properties/color
+          - enum: [ 0, 1, 2, 3 ]
+
+    required:
+      - led-sources
+      - color
+
+examples:
+  - |
+
+    #include <dt-bindings/leds/common.h>
+
+    i2c0 {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        led-controller@2b {
+            compatible = "cznic,turris-omnia-leds";
+            reg = <0x2b>;
+
+            led0 {
+                led-sources = <33 34 35>;
+                color = <LED_COLOR_ID_WHITE>;
+                function = LED_FUNCTION_POWER;
+                linux,default-trigger = "heartbeat";
+            };
+
+            led1 {
+                led-sources = <3>;
+                color = <LED_COLOR_ID_RED>;
+                function = LED_FUNCTION_INDICATOR;
+                function-enumerator = <1>;
+            };
+
+            led2 {
+                led-sources = <4>;
+                color = <LED_COLOR_ID_GREEN>;
+                function = LED_FUNCTION_INDICATOR;
+                function-enumerator = <1>;
+            };
+
+            led3 {
+                led-sources = <5>;
+                color = <LED_COLOR_ID_BLUE>;
+                function = LED_FUNCTION_INDICATOR;
+                function-enumerator = <1>;
+            };
+        };
+    };
+
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index e64e5db31497..35c58d0b8fd9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1751,16 +1751,17 @@ F:	drivers/clocksource/timer-prima2.c
 X:	drivers/gnss
 N:	[^a-z]sirf
 
-ARM/CZ.NIC TURRIS MOX SUPPORT
+ARM/CZ.NIC TURRIS ROUTERS SUPPORT
 M:	Marek Behun <marek.behun@nic.cz>
 S:	Maintained
-W:	http://mox.turris.cz
+W:	http://www.turris.cz
 F:	Documentation/ABI/testing/debugfs-moxtet
 F:	Documentation/ABI/testing/sysfs-bus-moxtet-devices
 F:	Documentation/ABI/testing/sysfs-firmware-turris-mox-rwtm
 F:	Documentation/devicetree/bindings/bus/moxtet.txt
 F:	Documentation/devicetree/bindings/firmware/cznic,turris-mox-rwtm.txt
 F:	Documentation/devicetree/bindings/gpio/gpio-moxtet.txt
+F:	Documentation/devicetree/bindings/leds/cznic,turris-omnia-leds.yaml
 F:	drivers/bus/moxtet.c
 F:	drivers/firmware/turris-mox-rwtm.c
 F:	drivers/gpio/gpio-moxtet.c
-- 
2.24.1

