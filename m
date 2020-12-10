Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 25F792D538A
	for <lists+linux-leds@lfdr.de>; Thu, 10 Dec 2020 07:02:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732927AbgLJGCm (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 10 Dec 2020 01:02:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732919AbgLJGCj (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 10 Dec 2020 01:02:39 -0500
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FF55C06179C;
        Wed,  9 Dec 2020 22:01:59 -0800 (PST)
Received: by mail-pl1-x644.google.com with SMTP id y8so2226171plp.8;
        Wed, 09 Dec 2020 22:01:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=OsAt27GJx/yfIuSismvAOUoH5ALaVjBNeqL7IyNT1i8=;
        b=tvVLvrNy3ad7bqs2d/NtQuKs/U6j37CWI639yg/aU33vGTcEYC/2J9A50oByK3sx3M
         T0TQ85B1pAEv91bJiqzeqw6rAZp1mqPgoN3zD+gErT7GxYpfLiTBk+End1tOdUtI3/oy
         jWPxkpVexn6+qR3bW2+u1YyshdAKVh5V2VuSg9RP5KUH8BDo68O48DEd0FxodlXp9D2v
         1WqKapyDS6jc8ChHv3qldSRozpirhHf8zuntY+YHV/vQtNEaN7uwRtT1EmkVnb9qDTz1
         dLV0qgfDOKodGww4wVXkEUv4BVMZ3ZOqikuYjPSD4AFNZ+u4wafZ6os1v18KOY1z2Fy5
         TCdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=OsAt27GJx/yfIuSismvAOUoH5ALaVjBNeqL7IyNT1i8=;
        b=ls2E4eMqmgQ8mB8ENf7UKVnoXoXw8KoP3DxvdFEfenE0hTjP94eOQM+MstXqZPqHt+
         Ci6KihhBzISriByLm3rB67KCQrgTi8X+bq+vRcAihma5idrt21gDlBsxr7U1IV5r/Nd5
         2HKPuGV63sHJxdz8k9fFt7Ia3Z88f3y6wWA8paa+/BYSVUZhQpjeiimQ9w2lQk9izUmt
         0S7tYFxs/CaRSLUlhiPQ6TTug7hEqvdAnE7+F7QNMl5dJZ/0ZOG2ztOH9PI4tvt59Y79
         +yzqVQOMYPSwUL648Rp4eV4PpepxqwafSn+qvwCsGBNfEN4yMYb+YXVPj2bt4Jyal2eJ
         g87g==
X-Gm-Message-State: AOAM531XHsR2ygdcwHYI2pcPd2gYUmjy6v02PFRBLhZAWJZztE/eKjHC
        nWAl2ftczc724GEa91yLwdQ=
X-Google-Smtp-Source: ABdhPJx7bDM1TUZWjqvmAGdFk9Y1r8aozHgW1VTC8bWlfhPgav/dJSwyZTvjD4ZnI/6aUY/151a2lA==
X-Received: by 2002:a17:902:9f8b:b029:da:726d:3f17 with SMTP id g11-20020a1709029f8bb02900da726d3f17mr5058904plq.35.1607580119035;
        Wed, 09 Dec 2020 22:01:59 -0800 (PST)
Received: from localhost.localdomain ([2402:7500:568:b3ad:229b:9ee7:b946:7876])
        by smtp.gmail.com with ESMTPSA id j19sm4355377pff.74.2020.12.09.22.01.55
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 09 Dec 2020 22:01:58 -0800 (PST)
From:   Gene Chen <gene.chen.richtek@gmail.com>
To:     jacek.anaszewski@gmail.com, pavel@ucw.cz, robh+dt@kernel.org,
        matthias.bgg@gmail.com
Cc:     dmurphy@ti.com, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        gene_chen@richtek.com, Wilma.Wu@mediatek.com,
        shufan_lee@richtek.com, cy_huang@richtek.com,
        benjamin.chao@mediatek.com
Subject: [PATCH v12 4/5] dt-bindings: leds: Add bindings for MT6360 LED
Date:   Thu, 10 Dec 2020 14:00:56 +0800
Message-Id: <1607580057-4408-5-git-send-email-gene.chen.richtek@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1607580057-4408-1-git-send-email-gene.chen.richtek@gmail.com>
References: <1607580057-4408-1-git-send-email-gene.chen.richtek@gmail.com>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

From: Gene Chen <gene_chen@richtek.com>

Add bindings document for LED support on MT6360 PMIC

Signed-off-by: Gene Chen <gene_chen@richtek.com>
---
 .../devicetree/bindings/leds/leds-mt6360.yaml      | 159 +++++++++++++++++++++
 1 file changed, 159 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-mt6360.yaml

diff --git a/Documentation/devicetree/bindings/leds/leds-mt6360.yaml b/Documentation/devicetree/bindings/leds/leds-mt6360.yaml
new file mode 100644
index 0000000..cb1f4b7
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
2.7.4

