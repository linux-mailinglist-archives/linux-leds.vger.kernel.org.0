Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E42212C5359
	for <lists+linux-leds@lfdr.de>; Thu, 26 Nov 2020 12:55:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388022AbgKZLx2 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 26 Nov 2020 06:53:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732436AbgKZLx1 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 26 Nov 2020 06:53:27 -0500
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79463C0613D4;
        Thu, 26 Nov 2020 03:53:27 -0800 (PST)
Received: by mail-pf1-x442.google.com with SMTP id b63so1418076pfg.12;
        Thu, 26 Nov 2020 03:53:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=H/noxsdqbHTy7YTJLMe8Q0bNJzadLfFfvDoNP+7iW/w=;
        b=bJU25zwAVPJLYkFyHYvalMdGzuRUPkroRW17lec6/IRVNpTmqgz5VQefEmlje4KJou
         wNR9O2nW4LhejshofYdMtYFuV0jn1m7tNGXCauthD4DFOxODS7WHZW01o6qwxUaE2/Vq
         nrs5LQUrKsjhu9PPku4NsVhlvZq5RGY1Z+E1x/bYURRKXmGevbO3uQb+LtrGihi/Pi0q
         u5+SdRwRp6F+h/iLGQUtBoj9+8ONWlv1XKUNY+HUVmuuHRb9zJFVggXbUokXgPlZKplp
         BBIeU5CHNp3LBNm4o0U9KNiiNaplx4jwhqYtFWhtOHhB2dNKCk0Tgo+2QU4GSQWjeIPb
         vXjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=H/noxsdqbHTy7YTJLMe8Q0bNJzadLfFfvDoNP+7iW/w=;
        b=NeCKJPcaRZUOCqi1BaNqUcWAM4DSP6EuHBRQuTjC1KQ0SUemXPQPL14jtxfIFqWsMZ
         b5AKO17DsKNH8KZvFqTkTelrTRpQkbgeeHG9gLrZaVkTl/hjKX5BDISqlVq87VS9m5hq
         RAaFM4TbELrcHs2cBywlf1Ojr815Ge85XsTevEKtmwP8SeS9ki2Hl4mqV0GKXygMWWPm
         5xEQSj5JH0FbH6qRCiZxNso62Vv0+uVy3HWNovYzJuDPLHzjUQtgjIU+TGMhzm187c72
         rmWqTUUS9aOl53xsQpML/XkN/j55phbqH87HHjvrdNogECdylnkmdTVgM+FPugpMjm+M
         rIFw==
X-Gm-Message-State: AOAM533xXMgEMc7zk47A4EII1ICG4vllbOd8G5ht46VdfOqJMHJ6Q8V/
        bBysOs10tD+Cy7xJ3zJ4lPY=
X-Google-Smtp-Source: ABdhPJy59FZOddM7Bn6UIyFd5SykaUuV/ItpRFbHHEDzAliJZnRNdV0Tblq0c9F8zO5KC/nNMVuomg==
X-Received: by 2002:a17:90a:a10c:: with SMTP id s12mr3371776pjp.86.1606391607106;
        Thu, 26 Nov 2020 03:53:27 -0800 (PST)
Received: from localhost.localdomain ([101.10.31.14])
        by smtp.gmail.com with ESMTPSA id r4sm4721617pgs.54.2020.11.26.03.53.23
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 26 Nov 2020 03:53:26 -0800 (PST)
From:   Gene Chen <gene.chen.richtek@gmail.com>
To:     jacek.anaszewski@gmail.com, pavel@ucw.cz, robh+dt@kernel.org,
        matthias.bgg@gmail.com
Cc:     dmurphy@ti.com, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        gene_chen@richtek.com, Wilma.Wu@mediatek.com,
        shufan_lee@richtek.com, cy_huang@richtek.com,
        benjamin.chao@mediatek.com
Subject: [PATCH v9 5/6] dt-bindings: leds: Add bindings for MT6360 LED
Date:   Thu, 26 Nov 2020 19:37:33 +0800
Message-Id: <1606390654-6075-6-git-send-email-gene.chen.richtek@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1606390654-6075-1-git-send-email-gene.chen.richtek@gmail.com>
References: <1606390654-6075-1-git-send-email-gene.chen.richtek@gmail.com>
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

