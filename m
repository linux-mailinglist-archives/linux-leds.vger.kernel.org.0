Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0CA6738F0DF
	for <lists+linux-leds@lfdr.de>; Mon, 24 May 2021 18:07:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235019AbhEXQGm (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 24 May 2021 12:06:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237722AbhEXQFf (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 24 May 2021 12:05:35 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8644C045A55;
        Mon, 24 May 2021 08:24:53 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id v13-20020a17090abb8db029015f9f7d7290so154416pjr.0;
        Mon, 24 May 2021 08:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uzzcXIffejAkWyzdFpgb0HO7sS9re1Oy9rLKP31iBDE=;
        b=MLxtYKaaVll8pWz5+nbVi/IfMBRtx4DyjzB8VCy8RDUkUMw+tKWP6lE/Qy9mjynuQK
         O3wgJcW/kIlEFNVnkXSwNPmVujBx99MMssFDcafUx8NvWKRjC0hSPXAagZ9KyVdSEPan
         GuH58Ty4fRkBNK6t0pGXJuzRly51HjreFOwL6wyoQirzCZqqQM7E7jTLKTMKWCWeGPCV
         KU5BDOhhBlVgRoQwDUaMjHYi9Wniecjyz3oIso2LBlBeJCQGWockHSY39kEWgl5gGEYW
         JdsXVY5R8CORXyd2TCKXaOGNz3tpbo+o2UvbDzcFHONA6DljIlfdJSeKeh7my14N6Qwv
         IACg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uzzcXIffejAkWyzdFpgb0HO7sS9re1Oy9rLKP31iBDE=;
        b=sI8GjFgnQC28DYVL4TRzkGwRlBCIYaD2KUfMV2jKHahknpFArHKzH2EkpYvXAQd02p
         j1R+H1rz3dHa99wYnrcJmOVqEV2xb22HpQ6ok5sUlGEKS2Q6Qm00nqkX23L8QRo8cyMY
         lH/dTAQ2of9O5q6FoaCpDL97fGJO5PbxSe1tcujDDp6tsGEsg1xJpH4DzWtUbqukW+RH
         kx2nHn4nENYtLWcUknsS/h9MiwVMYa+UfguMK5joTbjP0TN23kurmhwogWVKogk2QlZ6
         nFoR3JG1fOYvaIJgh/0LuyFnRtwAMWeL2ELEUE10FP81arQTLiSIUJRkkVHX4BjzyCWo
         AuHQ==
X-Gm-Message-State: AOAM5323A6zxcM4RRyw5LvGA8BbQl2oSDinNPBKz8/gwTS3DsHjFNfwH
        YNWg0ppGvzhLsJMJF93h5cF+yI5YPrU=
X-Google-Smtp-Source: ABdhPJwTr/Qpj2lQO22nca5tCgF7+O0qzNIiGrZITrSnMb5xGM0u5fQPJNms44pcBnVIi+ouIu6Xxg==
X-Received: by 2002:a17:902:bd90:b029:f2:c88c:5b2c with SMTP id q16-20020a170902bd90b02900f2c88c5b2cmr25951360pls.8.1621869893326;
        Mon, 24 May 2021 08:24:53 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:469:b4c4:1464:a4f2:334c:afaf])
        by smtp.gmail.com with ESMTPSA id a15sm10821597pff.128.2021.05.24.08.24.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 May 2021 08:24:53 -0700 (PDT)
From:   Gene Chen <gene.chen.richtek@gmail.com>
To:     jacek.anaszewski@gmail.com, pavel@ucw.cz, matthias.bgg@gmail.com
Cc:     dmurphy@ti.com, linux-leds@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        gene_chen@richtek.com, Wilma.Wu@mediatek.com,
        shufan_lee@richtek.com, cy_huang@richtek.com,
        benjamin.chao@mediatek.com, Rob Herring <robh@kernel.org>
Subject: [PATCH v14 1/2] dt-bindings: leds: Add bindings for MT6360 LED
Date:   Mon, 24 May 2021 23:24:26 +0800
Message-Id: <20210524152427.123856-2-gene.chen.richtek@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210524152427.123856-1-gene.chen.richtek@gmail.com>
References: <20210524152427.123856-1-gene.chen.richtek@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

From: Gene Chen <gene_chen@richtek.com>

Add bindings document for LED support on MT6360 PMIC

Signed-off-by: Gene Chen <gene_chen@richtek.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/leds/leds-mt6360.yaml | 159 ++++++++++++++++++
 1 file changed, 159 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-mt6360.yaml

diff --git a/Documentation/devicetree/bindings/leds/leds-mt6360.yaml b/Documentation/devicetree/bindings/leds/leds-mt6360.yaml
new file mode 100644
index 000000000000..235315531d3b
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/leds-mt6360.yaml
@@ -0,0 +1,159 @@
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
+  "^(multi-)?led@[0-5]$":
+    type: object
+    $ref: common.yaml#
+    description:
+      Properties for a single LED.
+
+    properties:
+      reg:
+        description: Index of the LED.
+        enum:
+          - 0 # LED output ISINK1
+          - 1 # LED output ISINK2
+          - 2 # LED output ISINK3
+          - 3 # LED output ISINKML
+          - 4 # LED output FLASH1
+          - 5 # LED output FLASH2
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
+  - |
+   #include <dt-bindings/leds/common.h>
+   led-controller {
+     compatible = "mediatek,mt6360-led";
+     #address-cells = <1>;
+     #size-cells = <0>;
+
+     multi-led@0 {
+       reg = <0>;
+       function = LED_FUNCTION_INDICATOR;
+       color = <LED_COLOR_ID_RGB>;
+       led-max-microamp = <24000>;
+       #address-cells = <1>;
+       #size-cells = <0>;
+       led@0 {
+         reg = <0>;
+         color = <LED_COLOR_ID_RED>;
+       };
+       led@1 {
+         reg = <1>;
+         color = <LED_COLOR_ID_GREEN>;
+       };
+       led@2 {
+         reg = <2>;
+         color = <LED_COLOR_ID_BLUE>;
+       };
+     };
+     led@3 {
+       reg = <3>;
+       function = LED_FUNCTION_INDICATOR;
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
+
+  - |
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
2.25.1

