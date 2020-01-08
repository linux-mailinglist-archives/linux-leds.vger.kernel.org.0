Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4A4571337E2
	for <lists+linux-leds@lfdr.de>; Wed,  8 Jan 2020 01:18:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727180AbgAHARn (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 7 Jan 2020 19:17:43 -0500
Received: from mail-ot1-f65.google.com ([209.85.210.65]:37440 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726558AbgAHARn (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 7 Jan 2020 19:17:43 -0500
Received: by mail-ot1-f65.google.com with SMTP id k14so1883083otn.4;
        Tue, 07 Jan 2020 16:17:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vhRizbEqjOFpCdYt8Xl2D4rezrn4DghKeK86iwi5Mag=;
        b=NxAdfv6BgNABL7/tT9aFhuiv41ddGdf6tJc+PKqsHCSLSdIw3WJraBD1a4ZQmvj3NF
         sx4UPK2/mEtOl1OeGskLWV9qTTOVA8JBp0/zWMBRzVp+ka3/bM6rt2aGH1nem5mh9ViF
         pAD+dbtgULmZtisEA5QCMqCyd+mbHDp+taMj9ZJ8X1ijyXnF8hcd1D6oZu1LRy8oKm7A
         vXGByBnbaXmi2e8fx1VFZ/dYoZbQQDs/ZPV3njPlEpiBjxXHa0EMp51TgpxJtbzDX+k+
         8RrCJtUHDigxqlZ8foVs+l/oR2+at/zgj+89FbW4rZ8f+asTeUoufxSElMLypYR5i0Fc
         GvRg==
X-Gm-Message-State: APjAAAXm6Uu38Hy68RdGnCdT5o9gi/Bcgon+X/ikc+eQfPkD843oD3+D
        dEP8zGcWVcjOElWG9K5qmI5cHHg=
X-Google-Smtp-Source: APXvYqwABKYJiEwaLgR6rFMuikUNrFiOA0c8Yyxol+l6IPKYYwsF1pCw4PxRogedAU7gAgJHGIAiDg==
X-Received: by 2002:a9d:4902:: with SMTP id e2mr2284817otf.116.1578442661913;
        Tue, 07 Jan 2020 16:17:41 -0800 (PST)
Received: from xps15.herring.priv (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.googlemail.com with ESMTPSA id g19sm489263otj.1.2020.01.07.16.17.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2020 16:17:41 -0800 (PST)
From:   Rob Herring <robh@kernel.org>
To:     linux-leds@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: [PATCH v2 2/2] dt-bindings: leds: Convert gpio-leds to DT schema
Date:   Tue,  7 Jan 2020 18:17:38 -0600
Message-Id: <20200108001738.8209-2-robh@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200108001738.8209-1-robh@kernel.org>
References: <20200108001738.8209-1-robh@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Convert the gpio-leds binding to DT schema format.

Drop the last example as the node name collides when built, and it doesn't
add much value.

Cc: Pavel Machek <pavel@ucw.cz>
Cc: Dan Murphy <dmurphy@ti.com>
Acked-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Signed-off-by: Rob Herring <robh@kernel.org>
---
Jacek, Please take this via led tree

v2:
- no change

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

