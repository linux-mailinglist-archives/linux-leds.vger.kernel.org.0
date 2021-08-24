Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0ABD63F5E38
	for <lists+linux-leds@lfdr.de>; Tue, 24 Aug 2021 14:46:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237308AbhHXMra (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 24 Aug 2021 08:47:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237135AbhHXMr2 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 24 Aug 2021 08:47:28 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D61EEC061764
        for <linux-leds@vger.kernel.org>; Tue, 24 Aug 2021 05:46:43 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id x2-20020a1c7c02000000b002e6f1f69a1eso1781329wmc.5
        for <linux-leds@vger.kernel.org>; Tue, 24 Aug 2021 05:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jgaaiT/CWG3/PhxsQccIFMhDHs05bvsHs/Xpo61jD+s=;
        b=ylyNxQ2iiY6Cm5+JWs9eZQ3nVZlNiiegEymsSuJYuOxy9/7WhOxaDiWNFnB77lHsVo
         HucaoOisb9NVcOA29OOlgqk6GthLKXnWIzWZck7ZezWtzgg9djo6GhnuImV8yPkQWFoJ
         ZKELx4hL5a/tcMsOdTKqAvb4qU/1H29RKuxbOQf7XyPtjV5Byu8FhYidKv+fekX7AwiJ
         2tLhWe6qWFHErjJC22cocIQTHGt/gqWduev7YLNiqrv0YqMG2KRSQEpvs12l0kWRO5zR
         4AC7M5Qse2LkphMpHZchcONwH2BkqtmCSt04If9YL5FlYtAhWp075SrTKbqAdLmpf6ry
         Gh6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jgaaiT/CWG3/PhxsQccIFMhDHs05bvsHs/Xpo61jD+s=;
        b=IgxDEsnZm2f7XB7BQRJkJBwLdn5/lFD06ANhvFinPB54UAykJZhdI70xoEuv5hJDX2
         /QBLEOrihwmwvhpgzsjBYfK7LImTp8HA8nKM8UslDnWVdxhvyJzlOifc5Ukgy9RW12w7
         se+cALyyDX1w2x4A928k29lzO7tO1O24mp0uGjDArQl49yFhe+ArmGSmwi18nmIQgGsx
         ONSHpSGjt0n0m/g8v0WYyg4q24FZ5nquwCWIHu5g8wZf8eoedFTw+FakGxKzQnbUGCrZ
         9kEK7AJcicyRaqu2EKJZ79cwfoyR21QWIDg+xBlbwlHK4yj6GTIQItrsx1qDTZOagm2n
         yiZw==
X-Gm-Message-State: AOAM5323OO1pcRAp7y38VQ13/y8dlaWLDomJYKNd6mcmrqJKmnKCRwyd
        bx4NWnme+Zmy3w0v2F2Ui9eOug==
X-Google-Smtp-Source: ABdhPJxMEmafbF3plTR4UC1qva2vnU3YJZOI+6is+3n6mOCnOMRTBps4IsZmPdkw9XgZDuB+LHrfZQ==
X-Received: by 2002:a7b:cc16:: with SMTP id f22mr3893973wmh.99.1629809202423;
        Tue, 24 Aug 2021 05:46:42 -0700 (PDT)
Received: from localhost.localdomain ([2a00:ee2:4b0d:3001:fe74:75c8:e909:251b])
        by smtp.gmail.com with ESMTPSA id i14sm2255454wmq.40.2021.08.24.05.46.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Aug 2021 05:46:42 -0700 (PDT)
From:   Luka Kovacic <luka.kovacic@sartura.hr>
To:     linux-doc@vger.kernel.org, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org, geert+renesas@glider.be,
        Max.Merchel@tq-group.com, linux@rempel-privat.de, daniel@0x0f.com,
        shawnguo@kernel.org, sam@ravnborg.org, arnd@arndb.de,
        krzysztof.kozlowski@canonical.com, pavo.banicevic@sartura.hr,
        corbet@lwn.net, lee.jones@linaro.org, pavel@ucw.cz,
        robh+dt@kernel.org, linux@roeck-us.net, jdelvare@suse.com,
        goran.medic@sartura.hr, luka.perkov@sartura.hr,
        robert.marko@sartura.hr
Cc:     Luka Kovacic <luka.kovacic@sartura.hr>
Subject: [PATCH v9 1/7] dt-bindings: Add IEI vendor prefix and IEI WT61P803 PUZZLE driver bindings
Date:   Tue, 24 Aug 2021 14:44:32 +0200
Message-Id: <20210824124438.14519-2-luka.kovacic@sartura.hr>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210824124438.14519-1-luka.kovacic@sartura.hr>
References: <20210824124438.14519-1-luka.kovacic@sartura.hr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Add the IEI WT61P803 PUZZLE Device Tree bindings for MFD, HWMON and LED
drivers. A new vendor prefix is also added accordingly for
IEI Integration Corp.

Signed-off-by: Luka Kovacic <luka.kovacic@sartura.hr>
Signed-off-by: Pavo Banicevic <pavo.banicevic@sartura.hr>
Cc: Luka Perkov <luka.perkov@sartura.hr>
Cc: Robert Marko <robert.marko@sartura.hr>
---
 .../hwmon/iei,wt61p803-puzzle-hwmon.yaml      | 53 ++++++++++++
 .../leds/iei,wt61p803-puzzle-leds.yaml        | 39 +++++++++
 .../bindings/mfd/iei,wt61p803-puzzle.yaml     | 82 +++++++++++++++++++
 .../devicetree/bindings/vendor-prefixes.yaml  |  2 +
 4 files changed, 176 insertions(+)
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
index 000000000000..af219ddc190f
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/iei,wt61p803-puzzle-leds.yaml
@@ -0,0 +1,39 @@
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
+  led@0:
+    type: object
+    $ref: common.yaml
+    description: |
+      Properties for a single LED.
+
+required:
+  - compatible
+  - "#address-cells"
+  - "#size-cells"
+
+additionalProperties: false
diff --git a/Documentation/devicetree/bindings/mfd/iei,wt61p803-puzzle.yaml b/Documentation/devicetree/bindings/mfd/iei,wt61p803-puzzle.yaml
new file mode 100644
index 000000000000..8ce18c29177b
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
+    $ref: /schemas/hwmon/iei,wt61p803-puzzle-hwmon.yaml
+
+  leds:
+    $ref: /schemas/leds/iei,wt61p803-puzzle-leds.yaml
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
index 07fb0d25fc15..2d800454542e 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -515,6 +515,8 @@ patternProperties:
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

