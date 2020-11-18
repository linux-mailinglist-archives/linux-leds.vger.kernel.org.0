Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 48FC02B7BC3
	for <lists+linux-leds@lfdr.de>; Wed, 18 Nov 2020 11:49:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726297AbgKRKsk (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 18 Nov 2020 05:48:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726223AbgKRKsk (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 18 Nov 2020 05:48:40 -0500
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58AE1C0613D4;
        Wed, 18 Nov 2020 02:48:40 -0800 (PST)
Received: by mail-pg1-x543.google.com with SMTP id 81so946830pgf.0;
        Wed, 18 Nov 2020 02:48:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=mIkNkxYk93iDCiAPvVn6s6TZl21dQVEhzr19RttgEmk=;
        b=WXiYfa3S96qPHgeBUzgDY+4DKuFxtQfzD+tE63QONdH9JXEKa03Mms6D06SSRQcZRE
         a3QDB3Q6FMTga5PNATbLBAhOlUdy10oAXzn6CRHwsAIAZXxrQ2uCc4u+vJw1JOTGZJWD
         84SzFfVGO3rPafzYdGvsAlbKcQtiMZBWYCY3dXj4wYh/8orSFC8R6HrrkWLSwBwUwBRv
         opOAhLBbaHeHwNiqzfvXbGOKmnSaqStZbipZ9vO2H41sTEyOlURe1OEB8M3HePwO5Hyk
         htfuDbDqqmul2n3z9Av6ABfkzQHy7UzZ4jLs63+U8PE5RXCbq4ocBNH4yEOG/S3dmq+N
         Dalg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=mIkNkxYk93iDCiAPvVn6s6TZl21dQVEhzr19RttgEmk=;
        b=UehxaIrJgeqVDrTmWee932FCaibY6r1SbyN3CCcfi6uBicm4DO8h4ApG6//E0Pp17J
         u1Nkp0P2MZXP4NdRQH3f3NcZIgJAPB0aANIT/+Dkus098K2Ie+LlDPux/nQXmDoAXrK+
         hg+ALdxwnzZjdeLQSiCnnGDOCs3r2A/qoTORQv1VMy3TxI4E7FkcDFFxubONDYiAWXsW
         s/ad4Q4Tdmpcf9/egcfoI/aOrdGJ4/B+nJgHEuzPkLq0fRTAnMf0+sMolz7q3XpPoVOj
         NVxp8SyHe703Nfv9aHTW5qE2LAjg74rMv4fxmkiODeaJmOU3ekNxiuV5v0ISjuH6PlSP
         RoFA==
X-Gm-Message-State: AOAM533OyUqM0ivduviXeBrsq5EEaZeyVV4rgga9SKoKXEn0UgQ5+YAx
        PNIK60DLK04g9WM3hIADn9Zf44AePzs=
X-Google-Smtp-Source: ABdhPJwLpdNBOd+7epZBRLciV3HO+J0SQSOnWvId9MTiuA3oH0r3Fhb6j7LIiOvdU0BWajNUcRtRaA==
X-Received: by 2002:a63:545:: with SMTP id 66mr7769156pgf.124.1605696519990;
        Wed, 18 Nov 2020 02:48:39 -0800 (PST)
Received: from localhost.localdomain ([2402:7500:575:2174:b7aa:599:e762:e486])
        by smtp.gmail.com with ESMTPSA id a3sm25345154pfd.58.2020.11.18.02.48.34
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 18 Nov 2020 02:48:39 -0800 (PST)
From:   Gene Chen <gene.chen.richtek@gmail.com>
To:     jacek.anaszewski@gmail.com, pavel@ucw.cz, robh+dt@kernel.org,
        matthias.bgg@gmail.com
Cc:     dmurphy@ti.com, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        gene_chen@richtek.com, Wilma.Wu@mediatek.com,
        shufan_lee@richtek.com, cy_huang@richtek.com,
        benjamin.chao@mediatek.com
Subject: [PATCH v7 4/5] dt-bindings: leds: Add bindings for MT6360 LED
Date:   Wed, 18 Nov 2020 18:47:41 +0800
Message-Id: <1605696462-391-5-git-send-email-gene.chen.richtek@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1605696462-391-1-git-send-email-gene.chen.richtek@gmail.com>
References: <1605696462-391-1-git-send-email-gene.chen.richtek@gmail.com>
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
index 0000000..9bd6cbe
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
+       function = LED_FUNCTION_INDICATOR;
+       color = <LED_COLOR_ID_MOONLIGHT>;
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
+       function = LED_FUNCTION_INDICATOR;
+       color = <LED_COLOR_ID_MOONLIGHT>;
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

