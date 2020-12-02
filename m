Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54DAA2CBAFD
	for <lists+linux-leds@lfdr.de>; Wed,  2 Dec 2020 11:50:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388752AbgLBKrz (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 2 Dec 2020 05:47:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388717AbgLBKry (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 2 Dec 2020 05:47:54 -0500
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C2FCC061A04;
        Wed,  2 Dec 2020 02:47:14 -0800 (PST)
Received: by mail-pj1-x1043.google.com with SMTP id b12so775495pjl.0;
        Wed, 02 Dec 2020 02:47:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=uLCNDAv0Ql7OLVZjh06E9abD1yJnDrs0beu+eilRT6A=;
        b=NDW2fQcrEkzIjV8f6u/i830TiaH/VPKo4RpNDoFUMj60XZpN50vsanMUgewKhDClyy
         SRMid+W65FeJcsQLFGUlz2lhpshe4/3RV52wKLuXc37EVld7HTp1bK2plv/Bx6jvX1fO
         lCoH064HyLeIBMyOI1lr89V2JSpzJ1O5Rn0Oy9hsHpoMOscrZyLFxqvyke6+Znu97s92
         8vYAwzgo3GwzF965iIhy6oXGSEdaHEF+N95KCfdeyjubIn0DcPNQNe9KatqBTmC0WiFv
         l1W7fbbceX1WHVxsmqIFDnPZnqTbHLCmQSMesGHJreX2ce2+w0dt2quoMDh5J7xMZTr2
         uNgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=uLCNDAv0Ql7OLVZjh06E9abD1yJnDrs0beu+eilRT6A=;
        b=ZFqpOdRIAPYlwpnJ1z+p3fNg0956/IsIx4FXszynaNUU9AlWHwbN2GEHBB9NT+5WyX
         yApkihJimTTZ7uB+2X8+L//4nQ0D2xRBHflF/TujTIiKvFmY6yBjipcoJhK+Elk4bHY9
         bbtMP0X7aRmBiIf8G4r6LSQVepmw8nHq89MXeAEZ4/DjqAQ9vtg5ssMFaeVAActzSvsG
         LUTXeRiE/kaY4EyWnb3ow4G5jA3QyQDwvA+6lWpxYb/GVJ9eW5gQt15HqghhdblTc9uh
         9uj/0cdPO6WqFDDL+tvWVq+3fQ68fay5/cnjo9dE6d+kYHWs02IyaIq++6WbXwDB+FC0
         psCA==
X-Gm-Message-State: AOAM533sVlGC7gKtioo2c+zNeZwcMxXmDFelWzZkyzbBkW1NM85Ip+Xb
        gge4dtjM23zHfhoQc8cQq1Xdb8fUlB2pxQ==
X-Google-Smtp-Source: ABdhPJyhdaAZuX09Ggnt7f8CqvD6f18kE3Ll+FBJSx2D6IANh3+3Dx9fHG/F3zbTH83SAgfTnNGKqg==
X-Received: by 2002:a17:90b:4c41:: with SMTP id np1mr1814849pjb.186.1606906034182;
        Wed, 02 Dec 2020 02:47:14 -0800 (PST)
Received: from localhost.localdomain ([2402:7500:561:5929:abfa:5e69:aaf7:6f59])
        by smtp.gmail.com with ESMTPSA id e14sm1648109pjt.17.2020.12.02.02.47.10
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 02 Dec 2020 02:47:13 -0800 (PST)
From:   Gene Chen <gene.chen.richtek@gmail.com>
To:     jacek.anaszewski@gmail.com, pavel@ucw.cz, robh+dt@kernel.org,
        matthias.bgg@gmail.com
Cc:     dmurphy@ti.com, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        gene_chen@richtek.com, Wilma.Wu@mediatek.com,
        shufan_lee@richtek.com, cy_huang@richtek.com,
        benjamin.chao@mediatek.com
Subject: [PATCH v11 4/5] dt-bindings: leds: Add bindings for MT6360 LED
Date:   Wed,  2 Dec 2020 18:46:50 +0800
Message-Id: <1606906011-25633-5-git-send-email-gene.chen.richtek@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1606906011-25633-1-git-send-email-gene.chen.richtek@gmail.com>
References: <1606906011-25633-1-git-send-email-gene.chen.richtek@gmail.com>
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
index 0000000..73c67b1
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
+  "(^led@[0-5]$|led)":
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

