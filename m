Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B06572C5EFF
	for <lists+linux-leds@lfdr.de>; Fri, 27 Nov 2020 04:29:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404295AbgK0D33 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 26 Nov 2020 22:29:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727037AbgK0D33 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 26 Nov 2020 22:29:29 -0500
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 532C6C0613D1;
        Thu, 26 Nov 2020 19:29:29 -0800 (PST)
Received: by mail-pl1-x643.google.com with SMTP id k5so2037344plt.6;
        Thu, 26 Nov 2020 19:29:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=H/noxsdqbHTy7YTJLMe8Q0bNJzadLfFfvDoNP+7iW/w=;
        b=eCCROTxcAGQIvTAZyw0q40VwHnkw+8WKDYBVzMFqN0Vs1prz5X7Z6qnR5nKuCdnDG+
         PcubRdrKel/v/PHyejO4JVJL0VvlbzevBtg2pMnpHeW44lMaKxG9WNv3tnN6v4FthSSp
         tUEGVdynhCH9qUysiYd5GPm6u3sWFirGT08pQTFR4doybaHvYSGNhY0ec7Mzw2nS8Eos
         RJeKW4bUdLqY7rrMsIJgIh3kU5V/IHX5ylkk4nre2mrBvGwcsvbupRxtNvHEcknLkWKA
         mDf/jVGS/0nsc1CrDfqzzQ1JZ5HrYLpCEvp7PKs1klwR7iIEotr/qEF0GlRUhn2nnIFb
         R7Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=H/noxsdqbHTy7YTJLMe8Q0bNJzadLfFfvDoNP+7iW/w=;
        b=CqHuopjO7UKfhtT3Wka7jDiMw9ONm6C2VMUZA1UMp2hzQ4nvles1AvIbdySAlNXW/f
         q2fcc2KW4RGX7VdnYXaP+ilj6WYdekW4+FaLhdHZbeq4twC07akYK2dqTMskoePs+4xe
         QDbZxJOKbPb/4CrZQTQvtMV6Es1sLEtw+o0A+tCPYmV744ZGIxvQGl+R5rIsUMSBxIgs
         olpAAqkuxb3fYXZERhmMYdaVSD6FWsSHNkkh13lHS5Luf/PWy/fHcXL/uwALSms7E5ER
         xNjpO9aT49bhN3ISNpRMcbLhSzGG/QFVE2ktnpDhW2wEXrBtYx9w4aKKZ2Eegc6ClVai
         uoTA==
X-Gm-Message-State: AOAM533vKVSHc+hvicpKcCMXy1rrXJhUpr/FwSnbgKOApLI4NMgHWVdl
        UyGdCP9gPdE6F9JTfoT7Yko=
X-Google-Smtp-Source: ABdhPJxuar9sbgx4fRwniQiDkYLqwkGhnxb0vfNHIbJKvOo/wN9OlkM/DI9uJdquHCNAtTynbWBYlw==
X-Received: by 2002:a17:902:c24a:b029:da:1a77:c3ac with SMTP id 10-20020a170902c24ab02900da1a77c3acmr5262603plg.78.1606447768928;
        Thu, 26 Nov 2020 19:29:28 -0800 (PST)
Received: from localhost.localdomain ([101.12.27.127])
        by smtp.gmail.com with ESMTPSA id m73sm6063962pfd.106.2020.11.26.19.29.24
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 26 Nov 2020 19:29:28 -0800 (PST)
From:   Gene Chen <gene.chen.richtek@gmail.com>
To:     jacek.anaszewski@gmail.com, pavel@ucw.cz, robh+dt@kernel.org,
        matthias.bgg@gmail.com
Cc:     dmurphy@ti.com, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        gene_chen@richtek.com, Wilma.Wu@mediatek.com,
        shufan_lee@richtek.com, cy_huang@richtek.com,
        benjamin.chao@mediatek.com
Subject: [PATCH v10 5/6] dt-bindings: leds: Add bindings for MT6360 LED
Date:   Fri, 27 Nov 2020 11:28:55 +0800
Message-Id: <1606447736-7944-6-git-send-email-gene.chen.richtek@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1606447736-7944-1-git-send-email-gene.chen.richtek@gmail.com>
References: <1606447736-7944-1-git-send-email-gene.chen.richtek@gmail.com>
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

