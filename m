Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 38B8D28558A
	for <lists+linux-leds@lfdr.de>; Wed,  7 Oct 2020 02:50:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726902AbgJGAuD (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 6 Oct 2020 20:50:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726672AbgJGAuB (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 6 Oct 2020 20:50:01 -0400
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com [IPv6:2a00:1450:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA335C061755
        for <linux-leds@vger.kernel.org>; Tue,  6 Oct 2020 17:49:59 -0700 (PDT)
Received: by mail-ed1-x544.google.com with SMTP id dn5so348323edb.10
        for <linux-leds@vger.kernel.org>; Tue, 06 Oct 2020 17:49:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=aKXhASnbwI3DU5+uZfrFm6rdTWVPfT7vuUbIcV7FULg=;
        b=WZ2L/tA1P9Pn/MltFAy9oxOHfiW75xCaK8WZXZNwgruWw2c8IMx/mLr0tIUAuZoKfw
         avU5n7Vht6hgDMlEbxqLwFYyogiGSv45cDrdw0aL3/p+s63+kMX2p83kKfJRZa7pfVm0
         1wctyHR7ZiPzBYI3rsRf+nCgyEYDpZkVzRuMlY7VoZodLnKeVotxQh0w3fTVWZgFDEuS
         j8RKlkJn5pgdaiFkz9jdgougcJSTrJCjhrg25MRr+4VO5QcXF5SBH8VOUG0iWw16bCR/
         7TJaKaZ9sAPRDcuPlFJ9T/zelG0Ymx/jEblCRb8/kvZnSLkqSgVoJ5x0KdG/jMUQ7BDr
         YOQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aKXhASnbwI3DU5+uZfrFm6rdTWVPfT7vuUbIcV7FULg=;
        b=BIQZRsyBcm77rKt1bGamiVq5TaZ5/sVfd0c8zswMSmtp9hHcoYExyUxiHrg+BdTJkN
         4DunPWbEcZf5KLQnEFi+RatRcLZ2ojcVeY7+cG60zSAUG8HWTI6r3ZJg6nmySlxrOGJd
         CXS2FIs5HjUx4RWALET8bx41n5itu3lbpWu45Y32utgrmespbnGmfJlHI0uQ38TP14Mu
         v2qwqLbkztVtWy0n2yBUiJHEHUNHdNj2KcK4TS57iD7/XnCycV1U0vFrX6PIBWeam4OY
         lSQNOl6G7kg6MQ8dlzBHTjGwGr/SDcIvqYT85gKkNl5qhPVsn3JxtKMWhLKvWlUfciUJ
         IgCA==
X-Gm-Message-State: AOAM531xiowlHnU365H8oJKAt2p50FpVhEVEwQXuE66bKO1CVOZ2fo6S
        7zCv6W/ZNRnMpJBNrUfuVn/9jg==
X-Google-Smtp-Source: ABdhPJxMgnZx35GYgZ4kQKzPOWXjkObIOrGZAd2uR+cH1k5lcWZjG3bwiKeiUSAM2n4AUd+oPQroYg==
X-Received: by 2002:a05:6402:1c10:: with SMTP id ck16mr842436edb.7.1602031798391;
        Tue, 06 Oct 2020 17:49:58 -0700 (PDT)
Received: from localhost.localdomain ([2a00:ee2:4b0d:3002:290:faff:fe54:449c])
        by smtp.gmail.com with ESMTPSA id bw25sm261090ejb.119.2020.10.06.17.49.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2020 17:49:57 -0700 (PDT)
From:   Luka Kovacic <luka.kovacic@sartura.hr>
To:     linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-leds@vger.kernel.org
Cc:     lee.jones@linaro.org, pavel@ucw.cz, dmurphy@ti.com,
        robh+dt@kernel.org, jdelvare@suse.com, linux@roeck-us.net,
        marek.behun@nic.cz, luka.perkov@sartura.hr,
        robert.marko@sartura.hr, Luka Kovacic <luka.kovacic@sartura.hr>
Subject: [PATCH v4 1/6] dt-bindings: Add iEi vendor prefix and iEi WT61P803 PUZZLE driver bindings
Date:   Wed,  7 Oct 2020 02:48:56 +0200
Message-Id: <20201007004901.39859-2-luka.kovacic@sartura.hr>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201007004901.39859-1-luka.kovacic@sartura.hr>
References: <20201007004901.39859-1-luka.kovacic@sartura.hr>
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

