Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 73A182DFB3C
	for <lists+linux-leds@lfdr.de>; Mon, 21 Dec 2020 11:54:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726499AbgLUKxB (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 21 Dec 2020 05:53:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725791AbgLUKxA (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 21 Dec 2020 05:53:00 -0500
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49B00C061248;
        Mon, 21 Dec 2020 02:52:00 -0800 (PST)
Received: by mail-pj1-x1031.google.com with SMTP id m5so6230889pjv.5;
        Mon, 21 Dec 2020 02:52:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=YCb/WX7jYkxYBGiGcndgZSShZvSpoJWAB1n8TjnlLUo=;
        b=b38qve1raqBnja17o0vCNhKoxCdEqtI4YFpqPcpHqdjb57wQPAOLEX1ad65ad2glKQ
         I3qns6h5Nmi8jwezyKrRAFS17mnByaLgoun5QrAETFRHr+e7m7wubigszIshyZ9tWMK9
         RxN8aSvckb1o3Jl2+ulM3BifLJEDlu0pOvqFDFcaBdXu5oweEXqkEPDiw3OKcV0fAr3D
         ckIjDgPdv0aEru+mGm859d875ZbHTcx2ek5zeN/fnOn1EdWN4ht1iRyufxYQwibcjc8z
         /Kj9W6uD5uG4gWbCDvxCK0kd8+H1cY2HzdM8SOMi04/Dj6zonxRZYw5K6ttVp062i6+x
         ADrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=YCb/WX7jYkxYBGiGcndgZSShZvSpoJWAB1n8TjnlLUo=;
        b=tUxIxm6MQ0ThpxZKX0hziYaHqxmTg8zGRMcW5OjRmguR/xek3qkbN/kLsSrnt7TWNL
         NE8FFu6QdhnHAF3vZSQlbkzVtxROKciXbH6P5dcgxDkj9+jp9LQWdYiqf6clIMIePsxn
         kKkgsrMlctTFQO4oJ2vQUxb1MndtC71ZksrNCXybGkMbQUtgZsbv+Td26rbEZnCHAsAU
         CTvxJjNEfblOyuHd2P/kjHcYsdx0swOgxyElQE6ibLga7cn4ZGbSzzGq92i4zBmLz5wx
         KKTO4lmyebS8bfDsGrdWdkDpdI/2D7V4llglS7n/OkBXs1sUvACuEGj53n+MMeqR0fDd
         AvsQ==
X-Gm-Message-State: AOAM531oCeaEMq/jc8z8pzy/9zjHjbqTdb2Tvrxyi6OPwYLS8qOnnHUJ
        X5h8DgcBbQtqJ/De//2K8yQ=
X-Google-Smtp-Source: ABdhPJzmoAxlpNc4tgzqH6WA3iOzt+HxuhJHDR/ZE9ds8kDtOcjnFkT168mB8cPb72ahWebfjrljnQ==
X-Received: by 2002:a17:90a:9483:: with SMTP id s3mr16409320pjo.61.1608547919870;
        Mon, 21 Dec 2020 02:51:59 -0800 (PST)
Received: from localhost.localdomain ([2402:7500:469:a113:4308:e075:646d:7374])
        by smtp.gmail.com with ESMTPSA id p4sm15364193pjl.30.2020.12.21.02.51.54
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 21 Dec 2020 02:51:59 -0800 (PST)
From:   Gene Chen <gene.chen.richtek@gmail.com>
To:     jacek.anaszewski@gmail.com, pavel@ucw.cz, robh+dt@kernel.org,
        matthias.bgg@gmail.com
Cc:     dmurphy@ti.com, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        gene_chen@richtek.com, Wilma.Wu@mediatek.com,
        shufan_lee@richtek.com, cy_huang@richtek.com,
        benjamin.chao@mediatek.com
Subject: [PATCH v13 4/5] dt-bindings: leds: Add bindings for MT6360 LED
Date:   Mon, 21 Dec 2020 18:45:53 +0800
Message-Id: <1608547554-6602-5-git-send-email-gene.chen.richtek@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1608547554-6602-1-git-send-email-gene.chen.richtek@gmail.com>
References: <1608547554-6602-1-git-send-email-gene.chen.richtek@gmail.com>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

From: Gene Chen <gene_chen@richtek.com>

Add bindings document for LED support on MT6360 PMIC

Signed-off-by: Gene Chen <gene_chen@richtek.com>
Reviewed-by: Rob Herring <robh@kernel.org>
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

