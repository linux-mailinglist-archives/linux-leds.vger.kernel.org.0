Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C667C102CF5
	for <lists+linux-leds@lfdr.de>; Tue, 19 Nov 2019 20:46:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727243AbfKSTq3 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 19 Nov 2019 14:46:29 -0500
Received: from mail-oi1-f194.google.com ([209.85.167.194]:39133 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726792AbfKSTq1 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 19 Nov 2019 14:46:27 -0500
Received: by mail-oi1-f194.google.com with SMTP id v138so20158673oif.6;
        Tue, 19 Nov 2019 11:46:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kTnf204e4/6v4ZQSg9LcgMx6NRHz1lPy82NiYqgJ+LM=;
        b=L0Zj1gSQDzksIPb9KCg3jpSEMDKpN5Qo99yWrvrFBwnPq37g+tqhZos7sLvzvaRqAL
         NwiOEE4c4c2130aXJSMLkRKJ0/gfYtSD28lGSwpom9aNFPC0FZel05XaIdcCuH2csa6C
         6u0nSPcjvc1RQdmT/YDH1aVwVPe4hECNwzZU5qyfTzVy6DrzNY0ScQ50jwica9FavYQI
         pEy5ZKDetXw6hOS3sDrdxeSpCw84uhdI0GYRmnzZaprfvYL8k9PkIaX51AE91191PWVS
         oLw5OIOd5RsZt7uzSP5kA9fsFLF2Cu32AqnHpcBqfU17xyWyLkYZftVELhpjIEYcDHIr
         ENUg==
X-Gm-Message-State: APjAAAWFidWC/p9B/kWsiZmFtAqgki3JBGxcsc2ZDAA6/+zGIRLvg0YE
        79gMLy/kBmGvTpjQ5YAmq3/0wXg=
X-Google-Smtp-Source: APXvYqx/M0FGJTvZfwP0CyuXu2Or4obsBckJgfC44jHBbCCJ5abAxV1/gIR8RUQCVwNu3STBG8I0cA==
X-Received: by 2002:a05:6808:9a2:: with SMTP id e2mr5315728oig.123.1574192786813;
        Tue, 19 Nov 2019 11:46:26 -0800 (PST)
Received: from xps15.herring.priv (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.googlemail.com with ESMTPSA id j2sm7509614otn.20.2019.11.19.11.46.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Nov 2019 11:46:25 -0800 (PST)
From:   Rob Herring <robh@kernel.org>
To:     linux-leds@vger.kernel.org
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>
Subject: [PATCH 2/2] dt-bindings: leds: Convert gpio-leds to DT schema
Date:   Tue, 19 Nov 2019 13:46:23 -0600
Message-Id: <20191119194623.23854-2-robh@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191119194623.23854-1-robh@kernel.org>
References: <20191119194623.23854-1-robh@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Convert the gpio-leds binding to DT schema format.

Drop the last example as the node name collides when built, and it doesn't
add much value.

Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Pavel Machek <pavel@ucw.cz>
Cc: Dan Murphy <dmurphy@ti.com>
Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/leds/leds-gpio.txt    | 75 ----------------
 .../devicetree/bindings/leds/leds-gpio.yaml   | 86 +++++++++++++++++++
 2 files changed, 86 insertions(+), 75 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/leds/leds-gpio.txt
 create mode 100644 Documentation/devicetree/bindings/leds/leds-gpio.yaml

diff --git a/Documentation/devicetree/bindings/leds/leds-gpio.txt b/Documentation/devicetree/bindings/leds/leds-gpio.txt
deleted file mode 100644
index d21281b63d38..000000000000
--- a/Documentation/devicetree/bindings/leds/leds-gpio.txt
+++ /dev/null
@@ -1,75 +0,0 @@
-LEDs connected to GPIO lines
-
-Required properties:
-- compatible : should be "gpio-leds".
-
-Each LED is represented as a sub-node of the gpio-leds device.  Each
-node's name represents the name of the corresponding LED.
-
-LED sub-node properties:
-- gpios :  Should specify the LED's GPIO, see "gpios property" in
-  Documentation/devicetree/bindings/gpio/gpio.txt.  Active low LEDs should be
-  indicated using flags in the GPIO specifier.
-- function :  (optional)
-  see Documentation/devicetree/bindings/leds/common.txt
-- color :  (optional)
-  see Documentation/devicetree/bindings/leds/common.txt
-- label :  (optional)
-  see Documentation/devicetree/bindings/leds/common.txt (deprecated)
-- linux,default-trigger :  (optional)
-  see Documentation/devicetree/bindings/leds/common.txt
-- default-state:  (optional) The initial state of the LED.
-  see Documentation/devicetree/bindings/leds/common.txt
-- retain-state-suspended: (optional) The suspend state can be retained.Such
-  as charge-led gpio.
-- retain-state-shutdown: (optional) Retain the state of the LED on shutdown.
-  Useful in BMC systems, for example when the BMC is rebooted while the host
-  remains up.
-- panic-indicator : (optional)
-  see Documentation/devicetree/bindings/leds/common.txt
-
-Examples:
-
-#include <dt-bindings/gpio/gpio.h>
-#include <dt-bindings/leds/common.h>
-
-leds {
-	compatible = "gpio-leds";
-	led0 {
-		gpios = <&mcu_pio 0 GPIO_ACTIVE_LOW>;
-		linux,default-trigger = "disk-activity";
-		function = LED_FUNCTION_DISK;
-	};
-
-	led1 {
-		gpios = <&mcu_pio 1 GPIO_ACTIVE_HIGH>;
-		/* Keep LED on if BIOS detected hardware fault */
-		default-state = "keep";
-		function = LED_FUNCTION_FAULT;
-	};
-};
-
-run-control {
-	compatible = "gpio-leds";
-	led0 {
-		gpios = <&mpc8572 6 GPIO_ACTIVE_HIGH>;
-		color = <LED_COLOR_ID_RED>;
-		default-state = "off";
-	};
-	led1 {
-		gpios = <&mpc8572 7 GPIO_ACTIVE_HIGH>;
-		color = <LED_COLOR_ID_GREEN>;
-		default-state = "on";
-	};
-};
-
-leds {
-	compatible = "gpio-leds";
-
-	led0 {
-		gpios = <&gpio1 2 GPIO_ACTIVE_HIGH>;
-		linux,default-trigger = "max8903-charger-charging";
-		retain-state-suspended;
-		function = LED_FUNCTION_CHARGE;
-	};
-};
diff --git a/Documentation/devicetree/bindings/leds/leds-gpio.yaml b/Documentation/devicetree/bindings/leds/leds-gpio.yaml
new file mode 100644
index 000000000000..0e75b185dd19
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/leds-gpio.yaml
@@ -0,0 +1,86 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/leds-gpio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: LEDs connected to GPIO lines
+
+maintainers:
+  - Jacek Anaszewski <jacek.anaszewski@gmail.com>
+  - Pavel Machek <pavel@ucw.cz>
+
+description:
+  Each LED is represented as a sub-node of the gpio-leds device.  Each
+  node's name represents the name of the corresponding LED.
+
+properties:
+  compatible:
+    const: gpio-leds
+
+patternProperties:
+  # The first form is preferred, but fall back to just 'led' anywhere in the
+  # node name to at least catch some child nodes.
+  "(^led-[0-9a-f]$|led)":
+    type: object
+
+    allOf:
+      - $ref: common.yaml#
+
+    properties:
+      gpios:
+        maxItems: 1
+
+      retain-state-suspended:
+        description:
+          The suspend state can be retained.Such as charge-led gpio.
+        type: boolean
+
+      retain-state-shutdown:
+        description:
+          Retain the state of the LED on shutdown. Useful in BMC systems, for
+          example when the BMC is rebooted while the host remains up.
+        type: boolean
+
+    required:
+      - gpios
+
+additionalProperties: false
+
+examples:
+  - |
+
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/leds/common.h>
+
+    leds {
+        compatible = "gpio-leds";
+        led-0 {
+            gpios = <&mcu_pio 0 GPIO_ACTIVE_LOW>;
+            linux,default-trigger = "disk-activity";
+            function = LED_FUNCTION_DISK;
+        };
+
+        led-1 {
+            gpios = <&mcu_pio 1 GPIO_ACTIVE_HIGH>;
+            /* Keep LED on if BIOS detected hardware fault */
+            default-state = "keep";
+            function = LED_FUNCTION_FAULT;
+        };
+    };
+
+    run-control {
+        compatible = "gpio-leds";
+        led-0 {
+            gpios = <&mpc8572 6 GPIO_ACTIVE_HIGH>;
+            color = <LED_COLOR_ID_RED>;
+            default-state = "off";
+        };
+        led-1 {
+            gpios = <&mpc8572 7 GPIO_ACTIVE_HIGH>;
+            color = <LED_COLOR_ID_GREEN>;
+            default-state = "on";
+        };
+    };
+
+...
-- 
2.20.1

