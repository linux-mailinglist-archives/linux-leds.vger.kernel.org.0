Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 58BF027426A
	for <lists+linux-leds@lfdr.de>; Tue, 22 Sep 2020 14:51:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726578AbgIVMvZ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 22 Sep 2020 08:51:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726652AbgIVMvZ (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 22 Sep 2020 08:51:25 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2328C061755;
        Tue, 22 Sep 2020 05:51:24 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id z19so12339981pfn.8;
        Tue, 22 Sep 2020 05:51:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=cI5BHwp+MlxCTXFP/uAUll4x2qI1gUgr+gdLHHRNN+8=;
        b=dbhh2YTP65ilBwuzIUG81L5iMBu5AqRJHerUVn8gUQjr8ROkC9fqfxIe5q2deRvuoB
         Fu7pSH2QO4qvvNgmifzhXwaoVE4U9R6jOkipLPIM5T5msnN/R1xX1oWpB1UeEmo2YVYw
         2BsUDMv/PlR0Frz12xTyk7bfqfnd9u72U2dfRe8HRZREwo/74JZSXNr4xrWyBcAPI7Lo
         Rkt5l3Oi/YKJI6qHv6ANbLHhnqF25WJnCsuPgu75gK2e1dHOlwmygOk2JYhT06gcwChD
         UgPyiC4DikJdbovTB7kWa4sQf/b7cYM5xIyS2dgGk20p0/vaIRiippWCuAAsLmJx2YpM
         rImg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=cI5BHwp+MlxCTXFP/uAUll4x2qI1gUgr+gdLHHRNN+8=;
        b=oZ5IYAXvze7r0XrPNMoRM6BA6lScczSIA6sNho04KDBseSw7NUlNClfLZGdnmb/PBJ
         oVIC5XGgwV15xS0VnXiBvLgzAx57PoJmPuJVgzrxmJhAO+bGzsqnH7pjt+9aBWHX2pkV
         F7GiOeaiP95R3KNC+yObDFV6FgqUn0OyERcfO1zYq+8qB+mxcy1L2JAQVUw5mGjrRnRS
         YgA/BhvDdfR4PZ55MgSWH/iMKHUfkWGvIhio2ophdgGSjiVc462Sw9PYcMmQ0kUmESJc
         vSXkquwATyCIeZF//53HWJpndZcP0H3U1M0eDRTC3DfbR/f6ziRRrjsDcVa+eMGkgyGJ
         cUIA==
X-Gm-Message-State: AOAM531/7xq58mvEUBA2bjkR1TjzjW3OlaIUzE9WzFDmApAZSnv/lPFt
        O2ye9BkRRP9CJSCaqz8v5yA=
X-Google-Smtp-Source: ABdhPJxPK8PwS9/shyDrmbHkK2oHrafpMjY15tyWe8z65rQrgT36bn2rpzwEPSNK+qHxB2gJIj0dZw==
X-Received: by 2002:a63:ce17:: with SMTP id y23mr3447908pgf.447.1600779084478;
        Tue, 22 Sep 2020 05:51:24 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:489:56d9:501b:f524:c013:2733])
        by smtp.gmail.com with ESMTPSA id b18sm14995695pfr.4.2020.09.22.05.51.19
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 22 Sep 2020 05:51:24 -0700 (PDT)
From:   Gene Chen <gene.chen.richtek@gmail.com>
To:     jacek.anaszewski@gmail.com, pavel@ucw.cz, robh+dt@kernel.org,
        matthias.bgg@gmail.com
Cc:     dmurphy@ti.com, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        gene_chen@richtek.com, Wilma.Wu@mediatek.com,
        shufan_lee@richtek.com, cy_huang@richtek.com,
        benjamin.chao@mediatek.com
Subject: [PATCH v4 1/2] dt-bindings: leds: Add bindings for MT6360 LED
Date:   Wed, 23 Sep 2020 20:50:51 +0800
Message-Id: <1600865452-19649-2-git-send-email-gene.chen.richtek@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1600865452-19649-1-git-send-email-gene.chen.richtek@gmail.com>
References: <1600865452-19649-1-git-send-email-gene.chen.richtek@gmail.com>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

From: Gene Chen <gene_chen@richtek.com>

Add bindings document for LED support on MT6360 PMIC

Signed-off-by: Gene Chen <gene_chen@richtek.com>
---
 .../devicetree/bindings/leds/leds-mt6360.yaml      | 107 +++++++++++++++++++++
 1 file changed, 107 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-mt6360.yaml

diff --git a/Documentation/devicetree/bindings/leds/leds-mt6360.yaml b/Documentation/devicetree/bindings/leds/leds-mt6360.yaml
new file mode 100644
index 0000000..a356a1f
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/leds-mt6360.yaml
@@ -0,0 +1,107 @@
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
+  "^led@[0-5]$":
+    type: object
+    $ref: common.yaml#
+    description:
+      Properties for a single LED.
+
+    properties:
+      reg:
+        description: Index of the LED.
+        enum:
+          - 0 # LED output INDICATOR1
+          - 1 # LED output INDICATOR2
+          - 2 # LED output INDICATOR3
+          - 3 # LED output INDICATOR4
+          - 4 # LED output FLED1
+          - 5 # LED output FLED2
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
+       default-state = "off";
+     };
+     led@1 {
+       reg = <1>;
+       function = LED_FUNCTION_INDICATOR;
+       color = <LED_COLOR_ID_GREEN>;
+       default-state = "off";
+     };
+     led@2 {
+       reg = <2>;
+       function = LED_FUNCTION_INDICATOR;
+       color = <LED_COLOR_ID_BLUE>;
+       default-state = "off";
+     };
+     led@3 {
+       reg = <3>;
+       function = LED_FUNCTION_INDICATOR;
+       color = <LED_COLOR_ID_AMBER>;
+       default-state = "off";
+     };
+     led@4 {
+       reg = <4>;
+       function = LED_FUNCTION_FLASH;
+       color = <LED_COLOR_ID_WHITE>;
+       function-enumerator = <1>;
+       default-state = "off";
+       led-max-microamp = <200000>;
+       flash-max-microamp = <500000>;
+       flash-max-timeout-us = <1024000>;
+     };
+     led@5 {
+       reg = <5>;
+       function = LED_FUNCTION_FLASH;
+       color = <LED_COLOR_ID_WHITE>;
+       function-enumerator = <2>;
+       default-state = "off";
+       led-max-microamp = <200000>;
+       flash-max-microamp = <500000>;
+       flash-max-timeout-us = <1024000>;
+     };
+   };
+...
-- 
2.7.4

