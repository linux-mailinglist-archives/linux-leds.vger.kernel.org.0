Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6558929310E
	for <lists+linux-leds@lfdr.de>; Tue, 20 Oct 2020 00:19:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387446AbgJSWTY (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 19 Oct 2020 18:19:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733219AbgJSWTX (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 19 Oct 2020 18:19:23 -0400
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61270C0613CE
        for <linux-leds@vger.kernel.org>; Mon, 19 Oct 2020 15:19:23 -0700 (PDT)
Received: by mail-ej1-x642.google.com with SMTP id t25so1199138ejd.13
        for <linux-leds@vger.kernel.org>; Mon, 19 Oct 2020 15:19:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=aKXhASnbwI3DU5+uZfrFm6rdTWVPfT7vuUbIcV7FULg=;
        b=dTph7LhhauhTSQ9H4dRuh868JSX1rF9nJv6Xs6nNecVI34yv8hC6rrKRFEMhsdEi92
         5piv3CwSRtiI4Se3vscHkjsoisXNn0i13jQNfvnWXgfPW5NiJtlgZRTY7HfybD4xT2DE
         WHcxa+9AHUzHXXkieShF3biDwRiJIVgYZMhWskWk2iDXr0JeIW7iuYY7Cx9F42swdY91
         uwVkMgteKAax8XYaNoBOR/qHK3YBQCxir8QBhHuOav14dPUUhZvFskA9/+/5NxJ8QcUM
         2KNbwIPrntCmZoRRwiKCS0XOMvG8LiIn6BxG8Wi0iA9/GhqJBQTIxAsGcyCJyNDNlyy/
         OMnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aKXhASnbwI3DU5+uZfrFm6rdTWVPfT7vuUbIcV7FULg=;
        b=bVVrj0kt/yEd+eLUVy1InIvt9FWVKtom4ipE6mDJKfspzCa13xMiwk6EXEmFnDd4Dr
         t6B/LI3CT86Zxlh1tEUH7+PX3qAUZsfqSz6T0f/ld5q2EJJxL1wRzL/2dYazTAXsX6q0
         /DXAawpX7EZCFY39zHeIllxbEi3ja9Pecljnq+J7vwhBwqwQ4kw91bMc6UI8NSpBdFi/
         oNBlWGn2HZ2f87ud15Q3JeuGn4a5T9eIAmedzue5YD/be5U1hr1Im/40WxWygUGugXsW
         Cz7WGpzzoXLHNRft4sfscpXMu43BPkqDYzcfLdtU2Dap7RgnkHJdbI++9uL+HqS2uwgh
         bNwA==
X-Gm-Message-State: AOAM531ahYRJOiXYsk3z/iI2MB7DAIgERK6lrVTS3gAWEO8YQ+GFeSM3
        tmEqVQa26MaCAuSrVJNn1xikpA==
X-Google-Smtp-Source: ABdhPJzpLLaMmPbhsrJtZfaXoVnXtort9GhV5XvXoBQq/CBH8KugrWBJhksSNRUST470LSdWWDRgcQ==
X-Received: by 2002:a17:906:5402:: with SMTP id q2mr16376ejo.316.1603145962065;
        Mon, 19 Oct 2020 15:19:22 -0700 (PDT)
Received: from localhost.localdomain ([2a00:ee2:4b0d:3001:fbc5:498b:ed6d:cfac])
        by smtp.gmail.com with ESMTPSA id e17sm1645400ejh.64.2020.10.19.15.19.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2020 15:19:21 -0700 (PDT)
From:   Luka Kovacic <luka.kovacic@sartura.hr>
To:     linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org
Cc:     lee.jones@linaro.org, pavel@ucw.cz, dmurphy@ti.com,
        robh+dt@kernel.org, jdelvare@suse.com, linux@roeck-us.net,
        marek.behun@nic.cz, luka.perkov@sartura.hr,
        andy.shevchenko@gmail.com, robert.marko@sartura.hr,
        Luka Kovacic <luka.kovacic@sartura.hr>
Subject: [PATCH v6 1/6] dt-bindings: Add iEi vendor prefix and iEi WT61P803 PUZZLE driver bindings
Date:   Tue, 20 Oct 2020 00:18:54 +0200
Message-Id: <20201019221859.56680-2-luka.kovacic@sartura.hr>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201019221859.56680-1-luka.kovacic@sartura.hr>
References: <20201019221859.56680-1-luka.kovacic@sartura.hr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Add the iEi WT61P803 PUZZLE Device Tree bindings for MFD, HWMON and LED
drivers. A new vendor prefix is also added accordingly for
IEI Integration Corp.

Signed-off-by: Luka Kovacic <luka.kovacic@sartura.hr>
Cc: Luka Perkov <luka.perkov@sartura.hr>
Cc: Robert Marko <robert.marko@sartura.hr>
---
 .../hwmon/iei,wt61p803-puzzle-hwmon.yaml      | 41 ++++++++++
 .../leds/iei,wt61p803-puzzle-leds.yaml        | 45 ++++++++++
 .../bindings/mfd/iei,wt61p803-puzzle.yaml     | 82 +++++++++++++++++++
 .../devicetree/bindings/vendor-prefixes.yaml  |  2 +
 4 files changed, 170 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/iei,wt61p803-puzzle-hwmon.yaml
 create mode 100644 Documentation/devicetree/bindings/leds/iei,wt61p803-puzzle-leds.yaml
 create mode 100644 Documentation/devicetree/bindings/mfd/iei,wt61p803-puzzle.yaml

diff --git a/Documentation/devicetree/bindings/hwmon/iei,wt61p803-puzzle-hwmon.yaml b/Documentation/devicetree/bindings/hwmon/iei,wt61p803-puzzle-hwmon.yaml
new file mode 100644
index 000000000000..37f0030df237
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/iei,wt61p803-puzzle-hwmon.yaml
@@ -0,0 +1,41 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hwmon/iei,wt61p803-puzzle-hwmon.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: iEi WT61P803 PUZZLE MCU HWMON module from IEI Integration Corp.
+
+maintainers:
+  - Luka Kovacic <luka.kovacic@sartura.hr>
+
+description: |
+  This module is a part of the iEi WT61P803 PUZZLE MFD device. For more details
+  see Documentation/devicetree/bindings/mfd/iei,wt61p803-puzzle.yaml.
+
+  The HWMON module is a sub-node of the MCU node in the Device Tree.
+
+properties:
+  compatible:
+    const: iei,wt61p803-puzzle-hwmon
+
+patternProperties:
+  "^fan-group@[0-1]$":
+    type: object
+    properties:
+      reg:
+        minimum: 0
+        maximum: 1
+        description:
+          Fan group ID
+      cooling-levels:
+        maxItems: 255
+        description:
+          Cooling levels for the fans (PWM value mapping)
+    description: |
+      Properties for each fan group.
+    required:
+      - reg
+
+required:
+  - compatible
diff --git a/Documentation/devicetree/bindings/leds/iei,wt61p803-puzzle-leds.yaml b/Documentation/devicetree/bindings/leds/iei,wt61p803-puzzle-leds.yaml
new file mode 100644
index 000000000000..0d353e5803bf
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/iei,wt61p803-puzzle-leds.yaml
@@ -0,0 +1,45 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/iei,wt61p803-puzzle-leds.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: iEi WT61P803 PUZZLE MCU LED module from IEI Integration Corp.
+
+maintainers:
+  - Luka Kovacic <luka.kovacic@sartura.hr>
+
+description: |
+  This module is a part of the iEi WT61P803 PUZZLE MFD device. For more details
+  see Documentation/devicetree/bindings/mfd/iei,wt61p803-puzzle.yaml.
+
+  The LED module is a sub-node of the MCU node in the Device Tree.
+
+properties:
+  compatible:
+    const: iei,wt61p803-puzzle-leds
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+patternProperties:
+  "^led@0$":
+    type: object
+    $ref: common.yaml
+    description: |
+      Properties for a single LED.
+
+    properties:
+      reg:
+        description:
+          Index of the LED. Only one LED is supported at the moment.
+        minimum: 0
+        maximum: 0
+
+required:
+  - compatible
+  - "#address-cells"
+  - "#size-cells"
diff --git a/Documentation/devicetree/bindings/mfd/iei,wt61p803-puzzle.yaml b/Documentation/devicetree/bindings/mfd/iei,wt61p803-puzzle.yaml
new file mode 100644
index 000000000000..79a232d75093
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/iei,wt61p803-puzzle.yaml
@@ -0,0 +1,82 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/iei,wt61p803-puzzle.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: iEi WT61P803 PUZZLE MCU from IEI Integration Corp.
+
+maintainers:
+  - Luka Kovacic <luka.kovacic@sartura.hr>
+
+description: |
+  iEi WT61P803 PUZZLE MCU is embedded in some iEi Puzzle series boards.
+  It's used for controlling system power states, fans, LEDs and temperature
+  sensors.
+
+  For Device Tree bindings of other sub-modules (HWMON, LEDs) refer to the
+  binding documents under the respective subsystem directories.
+
+properties:
+  compatible:
+    const: iei,wt61p803-puzzle
+
+  current-speed:
+    description:
+      Serial bus speed in bps
+    maxItems: 1
+
+  enable-beep: true
+
+  iei-wt61p803-hwmon:
+    $ref: ../hwmon/iei,wt61p803-puzzle-hwmon.yaml
+
+  leds:
+    $ref: ../leds/iei,wt61p803-puzzle-leds.yaml
+
+required:
+  - compatible
+  - current-speed
+
+examples:
+  - |
+    #include <dt-bindings/leds/common.h>
+    serial {
+        status = "okay";
+        mcu {
+            compatible = "iei,wt61p803-puzzle";
+            current-speed = <115200>;
+            enable-beep;
+
+            leds {
+                compatible = "iei,wt61p803-puzzle-leds";
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                led@0 {
+                    reg = <0>;
+                    function = LED_FUNCTION_POWER;
+                    color = <LED_COLOR_ID_BLUE>;
+                };
+            };
+
+            iei-wt61p803-puzzle-hwmon {
+                compatible = "iei,wt61p803-puzzle-hwmon";
+
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                fan-group@0 {
+                    #cooling-cells = <2>;
+                    reg = <0x00>;
+                    cooling-levels = <64 102 170 230 250>;
+                };
+
+                fan-group@1 {
+                    #cooling-cells = <2>;
+                    reg = <0x01>;
+                    cooling-levels = <64 102 170 230 250>;
+                };
+            };
+        };
+    };
diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 63996ab03521..5f2595f0b2ad 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -467,6 +467,8 @@ patternProperties:
     description: IC Plus Corp.
   "^idt,.*":
     description: Integrated Device Technologies, Inc.
+  "^iei,.*":
+    description: IEI Integration Corp.
   "^ifi,.*":
     description: Ingenieurburo Fur Ic-Technologie (I/F/I)
   "^ilitek,.*":
-- 
2.26.2

