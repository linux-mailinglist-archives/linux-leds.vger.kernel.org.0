Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A7372C3E85
	for <lists+linux-leds@lfdr.de>; Wed, 25 Nov 2020 11:52:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729336AbgKYKvo (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 25 Nov 2020 05:51:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729240AbgKYKvn (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 25 Nov 2020 05:51:43 -0500
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC73BC0613D6;
        Wed, 25 Nov 2020 02:51:43 -0800 (PST)
Received: by mail-pf1-x443.google.com with SMTP id c66so1949203pfa.4;
        Wed, 25 Nov 2020 02:51:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=H/noxsdqbHTy7YTJLMe8Q0bNJzadLfFfvDoNP+7iW/w=;
        b=mxMlVoo36yXqSwZ5A1co9g3vx20sd6nPfiuI/Cb7gXx2y2ulmsQw1WKDpoNbWMH0KB
         1Fs2YPS8rxFNb7RY28iL1h1CYKsEt+SuRQmiAHneGJOGiN675oFs7fw9loGY5RxO9KGw
         GNkaasug5aNMaDhzfIeVIaAlp+Ypu9A/CE83OhTsVUU6D+O6Jan8k2/Pcap9Yvw0t/tt
         SlO8arLT9wumJm5NOv1tgAyqhdkQDGCCxt8FUh9Rs3xhJUSp6PTp9pGI15fLQxoGLHVM
         WVreF+oUyEyLX+Zv/QMJQJLXad5raBeSU6z2stCQcLCiJ49AltB1NmVPT9uXXm+4XaXr
         /2ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=H/noxsdqbHTy7YTJLMe8Q0bNJzadLfFfvDoNP+7iW/w=;
        b=bunHAHS9qw3mLVAuav5PuQ+BI7r9YLDx9M5ewP0LF7pVoYP5N8F2kGadq7W9BKiHz2
         rcLFS7fbB+fDWc0a2tijKA1nEXqj0DC5zK0ZLVWrenfLj5IdnouW8IIHUnSBFmlUFbva
         ndzJXi5Ml122PF5u9wJrzZ5QWKbHfjzEpNQkiRTzPISF9mbi/23wOtvToomHGayLPByk
         bnLkRYfcSqhgcZvFDIMzMFlrNlisifJz3wINxSJiFgD4eXxDLulSBMTrPhepbeqHARuG
         r7llAwmFgTJYo76rLEWROVG7CsabyzZelNTcOOizFAzfmHNEGvGb/a7ffLB2+l2UrtPS
         +CGg==
X-Gm-Message-State: AOAM533VR9wO6vemd5ZY8ixVAf8m0GASCxyU72bpMB1qiQaBgkbZW2KF
        V/kFQrUdeKpCT1GZ1cJzNIM=
X-Google-Smtp-Source: ABdhPJyxMfLBuGP17F6Yut6oaqlrlz8elJSBm7PHigoQka3qrqDybmPN8HBzK+ygUDO2IKJUe7FZ+Q==
X-Received: by 2002:aa7:8c47:0:b029:197:de59:cfec with SMTP id e7-20020aa78c470000b0290197de59cfecmr2030433pfd.0.1606301503406;
        Wed, 25 Nov 2020 02:51:43 -0800 (PST)
Received: from localhost.localdomain ([2402:7500:48b:4d7:7339:ae2d:114e:3859])
        by smtp.gmail.com with ESMTPSA id j10sm2049520pgc.85.2020.11.25.02.51.39
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 25 Nov 2020 02:51:43 -0800 (PST)
From:   Gene Chen <gene.chen.richtek@gmail.com>
To:     jacek.anaszewski@gmail.com, pavel@ucw.cz, robh+dt@kernel.org,
        matthias.bgg@gmail.com
Cc:     dmurphy@ti.com, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        gene_chen@richtek.com, Wilma.Wu@mediatek.com,
        shufan_lee@richtek.com, cy_huang@richtek.com,
        benjamin.chao@mediatek.com
Subject: [PATCH v8 5/6] dt-bindings: leds: Add bindings for MT6360 LED
Date:   Wed, 25 Nov 2020 18:51:14 +0800
Message-Id: <1606301475-7030-6-git-send-email-gene.chen.richtek@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1606301475-7030-1-git-send-email-gene.chen.richtek@gmail.com>
References: <1606301475-7030-1-git-send-email-gene.chen.richtek@gmail.com>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

From: Gene Chen <gene_chen@richtek.com>

Add bindings document for LED support on MT6360 PMIC

Signed-off-by: Gene Chen <gene_chen@richtek.com>
---
 .../devicetree/bindings/leds/leds-mt6360.yaml      | 164 +++++++++++++++++++++
 1 file changed, 164 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-mt6360.yaml

diff --git a/Documentation/devicetree/bindings/leds/leds-mt6360.yaml b/Documentation/devicetree/bindings/leds/leds-mt6360.yaml
new file mode 100644
index 0000000..b2ffbc6
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/leds-mt6360.yaml
@@ -0,0 +1,164 @@
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
+     led@3 {
+       reg = <3>;
+       function = LED_FUNCTION_MOONLIGHT;
+       color = <LED_COLOR_ID_WHITE>;
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
+       color = <LED_COLOR_ID_RGB>;
+       led-max-microamp = <24000>;
+       #address-cells = <1>;
+       #size-cells = <0>;
+
+       led@0 {
+         reg = <0>;
+         function = LED_FUNCTION_INDICATOR;
+         color = <LED_COLOR_ID_RED>;
+       };
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
+
+ - |
+
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
+     led@1 {
+       reg = <1>;
+       function = LED_FUNCTION_INDICATOR;
+       color = <LED_COLOR_ID_GREEN>;
+       led-max-microamp = <24000>;
+     };
+     led@2 {
+       reg = <2>;
+       function = LED_FUNCTION_INDICATOR;
+       color = <LED_COLOR_ID_BLUE>;
+       led-max-microamp = <24000>;
+     };
+     led@3 {
+       reg = <3>;
+       function = LED_FUNCTION_MOONLIGHT;
+       color = <LED_COLOR_ID_WHITE>;
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
+   };
+...
-- 
2.7.4

