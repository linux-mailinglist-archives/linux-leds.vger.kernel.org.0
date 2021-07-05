Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BBB643BBDB0
	for <lists+linux-leds@lfdr.de>; Mon,  5 Jul 2021 15:48:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231404AbhGENux (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 5 Jul 2021 09:50:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231317AbhGENur (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 5 Jul 2021 09:50:47 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0B4FC061760
        for <linux-leds@vger.kernel.org>; Mon,  5 Jul 2021 06:48:10 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id o5so29150633ejy.7
        for <linux-leds@vger.kernel.org>; Mon, 05 Jul 2021 06:48:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PDXNeIlgEF5rXgCgnEfoqWrZcJ4/okqK6cSz5M/BpB8=;
        b=jHrIAnF/KGMolmPQdhTKxMr5MV60qeaudoLFm198lqf+3OB0gpysMsPIDmDYXbws5j
         SpIv5Cf84SJKBaMJSB5yiI379IZMU5UvVDJZrpGFRcBvYz3Z/cWA9IniYKv9LKWBXaZ2
         WMssZC+yvGb9tD3Os3nwmn7/GSzAh307s1rAXziMhB86b4SRHxlh+c1rtdmM3B7q8RAi
         LWJ5ZwWmi3SfeQornhcs6Y9mQjyDBc+39DuJ1oMpgODyejzGdCR4BpMuC08AmL8s3QmC
         UKfgztbOUnzSFalQ9S9YM6lbUPBRfB8tpaLbLxKqaPdLtppVs4v2oJKqU7jU9yWnrnU4
         oAzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PDXNeIlgEF5rXgCgnEfoqWrZcJ4/okqK6cSz5M/BpB8=;
        b=B0EtIYg/JkVpJlShwnoK4itUlKPqVE+QffOZkwUDMhr+R17CQKpgQ8aptal35b24MA
         ER9s99XmaBGhwy4e9SQrvw8FwXefLkVPNSBpfFvCTOexph5vfrKR0r6mfzAIofJqQq01
         s+vj1p70uiFPtuYqvUB0EbOCoZfPFdm6kQ03nlcCs6G47br3vveAlnMehEki1Fo/zvha
         kCbpuhC7PZq+humQEFoC02XiZVAOdu7UZF8+eMmClafprMWGoXs2DX/3ny3tkQxUDfjD
         oT4JHMA9K90784ZqCXb+WoZ8Zk2qbXsi3Pp9K3oDS65PW8CWSXgPMWyMjm05KolvHgT2
         4D4A==
X-Gm-Message-State: AOAM532b7q9tItqmGidkr38fBZJw7T+ksXfDBIXhkbl5DQOX7nCF2jug
        rb1h5Gsn+w0pPkcPt0nr7EWJug==
X-Google-Smtp-Source: ABdhPJyzFsc3Z8TQS/D0B30SPATyCpAb01gqS+SG05wduR839yRjkBJ9WsaZUrSd4cZ46R/GlrEkpQ==
X-Received: by 2002:a17:907:1b06:: with SMTP id mp6mr14045009ejc.188.1625492889134;
        Mon, 05 Jul 2021 06:48:09 -0700 (PDT)
Received: from localhost.localdomain ([89.18.44.40])
        by smtp.gmail.com with ESMTPSA id cf29sm1557637edb.14.2021.07.05.06.48.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jul 2021 06:48:08 -0700 (PDT)
From:   Pavo Banicevic <pavo.banicevic@sartura.hr>
To:     linux-doc@vger.kernel.org, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org, geert+renesas@glider.be,
        Max.Merchel@tq-group.com, linux@rempel-privat.de, daniel@0x0f.com,
        shawnguo@kernel.org, sam@ravnborg.org, arnd@arndb.de,
        krzysztof.kozlowski@canonical.com, pavo.banicevic@sartura.hr,
        corbet@lwn.net, lee.jones@linaro.org, pavel@ucw.cz,
        robh+dt@kernel.org, linux@roeck-us.net, jdelvare@suse.com,
        goran.medic@sartura.hr, luka.perkov@sartura.hr,
        luka.kovacic@sartura.hr
Cc:     Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH v8 1/7] dt-bindings: Add IEI vendor prefix and IEI WT61P803 PUZZLE driver bindings
Date:   Mon,  5 Jul 2021 15:49:33 +0200
Message-Id: <20210705134939.28691-2-pavo.banicevic@sartura.hr>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210705134939.28691-1-pavo.banicevic@sartura.hr>
References: <20210705134939.28691-1-pavo.banicevic@sartura.hr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

From: Luka Kovacic <luka.kovacic@sartura.hr>

Add the IEI WT61P803 PUZZLE Device Tree bindings for MFD, HWMON and LED
drivers. A new vendor prefix is also added accordingly for
IEI Integration Corp.

Signed-off-by: Luka Kovacic <luka.kovacic@sartura.hr>
Signed-off-by: Pavo Banicevic <pavo.banicevic@sartura.hr>
Cc: Luka Perkov <luka.perkov@sartura.hr>
Cc: Robert Marko <robert.marko@sartura.hr>
---
 .../hwmon/iei,wt61p803-puzzle-hwmon.yaml      | 53 ++++++++++++
 .../leds/iei,wt61p803-puzzle-leds.yaml        | 44 ++++++++++
 .../bindings/mfd/iei,wt61p803-puzzle.yaml     | 82 +++++++++++++++++++
 .../devicetree/bindings/vendor-prefixes.yaml  |  2 +
 4 files changed, 181 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/iei,wt61p803-puzzle-hwmon.yaml
 create mode 100644 Documentation/devicetree/bindings/leds/iei,wt61p803-puzzle-leds.yaml
 create mode 100644 Documentation/devicetree/bindings/mfd/iei,wt61p803-puzzle.yaml

diff --git a/Documentation/devicetree/bindings/hwmon/iei,wt61p803-puzzle-hwmon.yaml b/Documentation/devicetree/bindings/hwmon/iei,wt61p803-puzzle-hwmon.yaml
new file mode 100644
index 000000000000..c24a24e90495
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/iei,wt61p803-puzzle-hwmon.yaml
@@ -0,0 +1,53 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hwmon/iei,wt61p803-puzzle-hwmon.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: IEI WT61P803 PUZZLE MCU HWMON module from IEI Integration Corp.
+
+maintainers:
+  - Luka Kovacic <luka.kovacic@sartura.hr>
+
+description: |
+  This module is a part of the IEI WT61P803 PUZZLE MFD device. For more details
+  see Documentation/devicetree/bindings/mfd/iei,wt61p803-puzzle.yaml.
+
+  The HWMON module is a sub-node of the MCU node in the Device Tree.
+
+properties:
+  compatible:
+    const: iei,wt61p803-puzzle-hwmon
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
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
+
+      cooling-levels:
+        minItems: 1
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
+  - "#address-cells"
+  - "#size-cells"
+
+additionalProperties: false
diff --git a/Documentation/devicetree/bindings/leds/iei,wt61p803-puzzle-leds.yaml b/Documentation/devicetree/bindings/leds/iei,wt61p803-puzzle-leds.yaml
new file mode 100644
index 000000000000..dc3e39aafd3e
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/iei,wt61p803-puzzle-leds.yaml
@@ -0,0 +1,44 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/iei,wt61p803-puzzle-leds.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: IEI WT61P803 PUZZLE MCU LED module from IEI Integration Corp.
+
+maintainers:
+  - Luka Kovacic <luka.kovacic@sartura.hr>
+
+description: |
+  This module is a part of the IEI WT61P803 PUZZLE MFD device. For more details
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
+  "led@0":
+    type: object
+    $ref: common.yaml
+    description: |
+      Properties for a single LED.
+    properties:
+      reg:
+        description:
+          Index of the LED. Only one LED is supported at the moment.
+        const: 0
+
+required:
+  - compatible
+  - "#address-cells"
+  - "#size-cells"
+
+additionalProperties: false
diff --git a/Documentation/devicetree/bindings/mfd/iei,wt61p803-puzzle.yaml b/Documentation/devicetree/bindings/mfd/iei,wt61p803-puzzle.yaml
new file mode 100644
index 000000000000..2452631505cc
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/iei,wt61p803-puzzle.yaml
@@ -0,0 +1,82 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/iei,wt61p803-puzzle.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: IEI WT61P803 PUZZLE MCU from IEI Integration Corp.
+
+maintainers:
+  - Luka Kovacic <luka.kovacic@sartura.hr>
+
+description: |
+  IEI WT61P803 PUZZLE MCU is embedded in some IEI Puzzle series boards.
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
+  hwmon:
+    $ref: ../hwmon/iei,wt61p803-puzzle-hwmon.yaml
+
+  leds:
+    $ref: ../leds/iei,wt61p803-puzzle-leds.yaml
+
+required:
+  - compatible
+  - current-speed
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/leds/common.h>
+    serial {
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
+            hwmon {
+                compatible = "iei,wt61p803-puzzle-hwmon";
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
index b868cefc7c55..e02b6d6eb568 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -509,6 +509,8 @@ patternProperties:
     description: IC Plus Corp.
   "^idt,.*":
     description: Integrated Device Technologies, Inc.
+  "^iei,.*":
+    description: IEI Integration Corp.
   "^ifi,.*":
     description: Ingenieurburo Fur Ic-Technologie (I/F/I)
   "^ilitek,.*":
-- 
2.31.1

