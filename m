Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C401F1C3FE5
	for <lists+linux-leds@lfdr.de>; Mon,  4 May 2020 18:31:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729640AbgEDQbS (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 4 May 2020 12:31:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729360AbgEDQbR (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 4 May 2020 12:31:17 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00288C061A0E;
        Mon,  4 May 2020 09:31:16 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id b20so10034570lff.2;
        Mon, 04 May 2020 09:31:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pkr+IhGoxSKRTkwbFYF/J9fJ7I9LmIIqclNwQQn9boY=;
        b=lrl5AsjkZw9lGeYjO6SlD/Sws0svWw6a7clLXkuizVKtmfOm18mF8zA/01y+ZC/X5j
         NM8q8yGRjLwMRUZWtCIzonVXL+AQPQldm3e91NhtW81Cx4dvlhc/BqHQV/iTeXd4+MGd
         Vjv0wOXPUUhJCyqqyNiz3GRjf0nBKQCGtROgLPVcKvtNqRw/GMjpC/LQkrAwxWpEfJ+w
         oMyy0yQTDCN/V3yeDKOggnZJz1iCLugDCrMGbbiNTEnXZKe73kscn8DgMYALR0lrcCtV
         bwlHljLhQ/3FQ//GUkzZ7BkNN6CSPqsOqF/prpt45Dopvpl76sMP302peWPeiuKOvtAp
         ii2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pkr+IhGoxSKRTkwbFYF/J9fJ7I9LmIIqclNwQQn9boY=;
        b=pjxzPCf+Q5NZTCp2QPOiDQCYWXd+q2yeJZkvgLP2KFKFY3p8UnSFyJtP4D8rSvS0As
         an6HI/W6S9Ehebalco18u/KsveF0gDJjnV7mqNaeNshRydrYJOnWF28EJvhUCpDPOB/o
         /cFNh4jOjkpDjJFH1peuTWyzEjxDiVM+XP2yp21T5v+L1oDEcW+X6Rflivai2jZeb6S8
         Mj9dI2CjUACmWzp6uBVCKbJz97Mv2UrlKrwFOxjBA5+c1UwqTY9ybkZbDFLmP/EQWEwy
         ApH3NwtVAl8fE5U0kYaGHG1OZjJBwB90+VvjGd0yp6hMA3KzZulrkIs67iChGOfYbvxH
         qdmg==
X-Gm-Message-State: AGi0PuZKoHtcyYdbIBjvudSOKBHbiHmWk2/UIpJ3/v7tWmHyZikFob4z
        Ak6YgEDGjX9y0LpEuZ2WJFg=
X-Google-Smtp-Source: APiQypLiWMXZVKoH6va69HUirICzYQ5zbqzr75wr/MAPJBDPngiGmlwGF4YcfNDN7ErgJe/l74e9qQ==
X-Received: by 2002:a19:e041:: with SMTP id g1mr12019009lfj.70.1588609875461;
        Mon, 04 May 2020 09:31:15 -0700 (PDT)
Received: from localhost.localdomain ([2a01:540:22b8:4400:7ca3:a735:45d1:7107])
        by smtp.gmail.com with ESMTPSA id o3sm10166624lfl.78.2020.05.04.09.31.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2020 09:31:14 -0700 (PDT)
From:   nikitos.tr@gmail.com
To:     pavel@ucw.cz
Cc:     dmurphy@ti.com, robh+dt@kernel.org, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Nikita Travkin <nikitos.tr@gmail.com>
Subject: [PATCH 2/3] dt-bindings: leds: Add binding for aw2013
Date:   Mon,  4 May 2020 21:29:33 +0500
Message-Id: <20200504162934.4693-2-nikitos.tr@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200504162934.4693-1-nikitos.tr@gmail.com>
References: <20200504162934.4693-1-nikitos.tr@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

From: Nikita Travkin <nikitos.tr@gmail.com>

Add YAML devicetree binding for AWINIC AW2013 3-channel led driver

Signed-off-by: Nikita Travkin <nikitos.tr@gmail.com>
---
 .../devicetree/bindings/leds/leds-aw2013.yaml | 91 +++++++++++++++++++
 1 file changed, 91 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-aw2013.yaml

diff --git a/Documentation/devicetree/bindings/leds/leds-aw2013.yaml b/Documentation/devicetree/bindings/leds/leds-aw2013.yaml
new file mode 100644
index 000000000000..f118721df1e8
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/leds-aw2013.yaml
@@ -0,0 +1,91 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/leds-aw2013.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: AWINIC AW2013 3-channel LED Driver
+
+maintainers:
+  - Nikita Travkin <nikitos.tr@gmail.com>
+
+description: |
+  The AW2013 is a 3-channel LED driver with I2C interface. It can control
+  LED brightness with PWM output.
+
+properties:
+  compatible:
+    const: awinic,aw2013
+
+  reg:
+    maxItems: 1
+
+  vcc-supply:
+    description: Regulator providing power to the "VCC" pin.
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+patternProperties:
+  "^led@[0-2]$":
+    type: object
+    allOf:
+      - $ref: common.yaml#
+
+    properties:
+      reg:
+        description: Index of the LED.
+        minimum: 0
+        maximum: 2
+
+required:
+  - compatible
+  - reg
+  - "#address-cells"
+  - "#size-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/leds/common.h>
+
+    i2c0 {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        led-controller@45 {
+            compatible = "awinic,aw2013";
+            reg = <0x45>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            vcc-supply = <&pm8916_l17>;
+
+            led@0 {
+                reg = <0>;
+                led-max-microamp = <5000>;
+                function = LED_FUNCTION_INDICATOR;
+                color = <LED_COLOR_ID_RED>;
+            };
+
+            led@1 {
+                reg = <1>;
+                led-max-microamp = <5000>;
+                function = LED_FUNCTION_INDICATOR;
+                color = <LED_COLOR_ID_GREEN>;
+            };
+
+            led@2 {
+                reg = <2>;
+                led-max-microamp = <5000>;
+                function = LED_FUNCTION_INDICATOR;
+                color = <LED_COLOR_ID_BLUE>;
+            };
+        };
+    };
+...
-- 
2.20.1

