Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 133472B5DA7
	for <lists+linux-leds@lfdr.de>; Tue, 17 Nov 2020 11:59:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727884AbgKQK5j (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 17 Nov 2020 05:57:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727991AbgKQK4Y (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 17 Nov 2020 05:56:24 -0500
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9BCDC0613CF;
        Tue, 17 Nov 2020 02:56:22 -0800 (PST)
Received: by mail-pf1-x444.google.com with SMTP id 131so6517423pfb.9;
        Tue, 17 Nov 2020 02:56:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=UFOkrqv8D0s1VQZofj/qpSo54qwXq6P87Ff6S5jSme8=;
        b=Q6m6c3KY7pGQ+ilpM3l0lEmH+UZi2wZFw+i5xy7iyvdZWORiDerPbWfF6J9y9Uoe9Q
         wgPxwa4WBA0tImifzXp3519UCgPTrXClHdjz8zeNuQN6AfF3zq6p9sqPT2PEaxGVfZPQ
         wh9CbJD1LdvQOZjZm8TEtyCadT+UMORRjJNju3okVd4rnsWY9MfRtJ3zoBw5TwP4d42T
         nGKPlVw5cr+V23C8mshzV4qXmL6VbGkMD1IGozE01Jw+bcUP8VAWEWl2Gw4GWwCSe9xz
         x4nMBfSB9pAE7KWUhAIOlx37hx9nODCCiP827xE1LdRvjmbHQ0E4kwjdtYp/ubhRHc6j
         zn4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=UFOkrqv8D0s1VQZofj/qpSo54qwXq6P87Ff6S5jSme8=;
        b=FqQE3+lQU//J+7Gw4lGjRfwsrSL4ZSSbj7THRNbihhEmICRu6JoEhlhsCi7QYCmyFE
         XkZ225Gw26NRU1uzmgw2Zyc/185L2qPZgYvVL0L13IQ98NF1lE0e2TxKt0eIid8vgBqh
         Ct11XXrFNNxa25P3SBrbl3wzgtei6I1KDmy6XF89G4eZe4YoRtln+Xpo9vay0ai7jQhT
         tV7TPIJ+fZUxRTXbZrMxBE1j47cpbAll+OPPr7BgAiENjdMlrdjW0YcbmPre4E4BfiHI
         9BHTJ2JeujSe4rhhI8FENzG4ClDeX5275jXbkxnCTHM6YkCsfitDfJAqhf6fyS8iR/cW
         GBlQ==
X-Gm-Message-State: AOAM532WEPUMxhVk44oUr29nS4Z0ZMYN9CdvAK1vHlRz5JP2qp2s9mcw
        L43IrBo1dolsdFR/32qebYQ=
X-Google-Smtp-Source: ABdhPJxwm9qhmmP9nme2SnhYDYX9Z4zwFxuE/1lW8h22yA39Ful+U0mjSCEJO25WY68uBo3jV2hlqw==
X-Received: by 2002:a63:da18:: with SMTP id c24mr3089153pgh.12.1605610582267;
        Tue, 17 Nov 2020 02:56:22 -0800 (PST)
Received: from localhost.localdomain ([2402:7500:462:32e6:3119:2966:5eda:751d])
        by smtp.gmail.com with ESMTPSA id j11sm17708214pgp.82.2020.11.17.02.56.17
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 17 Nov 2020 02:56:21 -0800 (PST)
From:   Gene Chen <gene.chen.richtek@gmail.com>
To:     jacek.anaszewski@gmail.com, pavel@ucw.cz, robh+dt@kernel.org,
        matthias.bgg@gmail.com
Cc:     dmurphy@ti.com, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        gene_chen@richtek.com, Wilma.Wu@mediatek.com,
        shufan_lee@richtek.com, cy_huang@richtek.com,
        benjamin.chao@mediatek.com
Subject: [PATCH v6 1/2] dt-bindings: leds: Add bindings for MT6360 LED
Date:   Tue, 17 Nov 2020 18:55:36 +0800
Message-Id: <1605610537-18085-2-git-send-email-gene.chen.richtek@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1605610537-18085-1-git-send-email-gene.chen.richtek@gmail.com>
References: <1605610537-18085-1-git-send-email-gene.chen.richtek@gmail.com>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

From: Gene Chen <gene_chen@richtek.com>

Add bindings document for LED support on MT6360 PMIC

Signed-off-by: Gene Chen <gene_chen@richtek.com>
---
 .../devicetree/bindings/leds/leds-mt6360.yaml      | 114 +++++++++++++++++++++
 1 file changed, 114 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-mt6360.yaml

diff --git a/Documentation/devicetree/bindings/leds/leds-mt6360.yaml b/Documentation/devicetree/bindings/leds/leds-mt6360.yaml
new file mode 100644
index 0000000..871db4d
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/leds-mt6360.yaml
@@ -0,0 +1,114 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/leds-mt6360.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: LED driver for MT6360 PMIC from MediaTek Integrated.
+
+maintainers:
+  - Gene Chen <gene_chen@richtek.com>
+
+description: |
+  This module is part of the MT6360 MFD device.
+  see Documentation/devicetree/bindings/mfd/mt6360.yaml
+  Add MT6360 LED driver include 2-channel Flash LED with torch/strobe mode,
+  and 4-channel RGB LED support Register/Flash/Breath Mode
+
+properties:
+  compatible:
+    const: mediatek,mt6360-led
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+patternProperties:
+  "^led@[0-6]$":
+    type: object
+    $ref: common.yaml#
+    description:
+      Properties for a single LED.
+
+    properties:
+      reg:
+        description: Index of the LED.
+        enum:
+          - 0 # LED output INDICATOR1_RED
+          - 1 # LED output INDICATOR1_GREEN
+          - 2 # LED output INDICATOR1_BLUE
+          - 3 # LED output INDICATOR2_ML
+          - 4 # LED output FLED1
+          - 5 # LED output FLED2
+          - 6 # LED output MULTICOLOR
+
+unevaluatedProperties: false
+
+required:
+  - compatible
+  - "#address-cells"
+  - "#size-cells"
+
+additionalProperties: false
+
+examples:
+ - |
+   #include <dt-bindings/leds/common.h>
+   led-controller {
+     compatible = "mediatek,mt6360-led";
+     #address-cells = <1>;
+     #size-cells = <0>;
+
+     led@0 {
+       reg = <0>;
+       function = LED_FUNCTION_INDICATOR;
+       color = <LED_COLOR_ID_RED>;
+       led-max-microamp = <24000>;
+     };
+     led@3 {
+       reg = <3>;
+       function = LED_FUNCTION_INDICATOR;
+       color = <LED_COLOR_ID_AMBER>;
+       led-max-microamp = <150000>;
+     };
+     led@4 {
+       reg = <4>;
+       function = LED_FUNCTION_FLASH;
+       color = <LED_COLOR_ID_WHITE>;
+       function-enumerator = <1>;
+       led-max-microamp = <200000>;
+       flash-max-microamp = <500000>;
+       flash-max-timeout-us = <1024000>;
+     };
+     led@5 {
+       reg = <5>;
+       function = LED_FUNCTION_FLASH;
+       color = <LED_COLOR_ID_WHITE>;
+       function-enumerator = <2>;
+       led-max-microamp = <200000>;
+       flash-max-microamp = <500000>;
+       flash-max-timeout-us = <1024000>;
+     };
+     led@6 {
+       reg = <6>;
+       function = LED_FUNCTION_INDICATOR;
+       color = <LED_COLOR_ID_MULTI>;
+       led-max-microamp = <24000>;
+       #address-cells = <1>;
+       #size-cells = <0>;
+
+       led@1 {
+         reg = <1>;
+         function = LED_FUNCTION_INDICATOR;
+         color = <LED_COLOR_ID_GREEN>;
+       };
+       led@2 {
+         reg = <2>;
+         function = LED_FUNCTION_INDICATOR;
+         color = <LED_COLOR_ID_BLUE>;
+       };
+     };
+   };
+...
-- 
2.7.4

