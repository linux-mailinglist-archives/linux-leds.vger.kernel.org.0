Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 64F1D285660
	for <lists+linux-leds@lfdr.de>; Wed,  7 Oct 2020 03:43:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727078AbgJGBnC (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 6 Oct 2020 21:43:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725996AbgJGBnC (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 6 Oct 2020 21:43:02 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 530E5C061755;
        Tue,  6 Oct 2020 18:43:02 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id g9so364799pgh.8;
        Tue, 06 Oct 2020 18:43:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=QOazEkwt2I/0csuiwBLL8ll1GjbM8fWDAADr2I807qA=;
        b=HYm8yoZYFKgCKGEyGT5FGaGt3IkTrnUluDI7tVdyBF9zD4Vndc1zTJv2hrU6rxb7BY
         HvNtURL8x5qT0G1zkmWSv7kURxtLIKoh3wS9WWZ7KDTWPWYx+s7GKG2mC3uczwONoXyx
         oBDBLti74gRsDfn1lYFqi6AAt/89tnly2XIrNaZezBI3pKptZpK5tmcxTbtE3uyK2jtX
         0MEfw6aBxdmThdL2xsXHHU2FO0uNPh1ml9uUX+uZ/uvf5ghjMN275eViRYb9LTAaGqe2
         wWza6wTWeArtEGnITUPaMeapEHqbhD33hgGgytdUFY3kaylezb3Vp8cTZxWS0HVzX/Pv
         3MhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=QOazEkwt2I/0csuiwBLL8ll1GjbM8fWDAADr2I807qA=;
        b=ZGNQc4vhlgop3CEmjpBUApw+JYv42Qgc66YKXhoBKFs0PVPXlj5Y6Ok5Jed15/r1On
         qmD4iEnV/f4mELN4O1k5N7k9ZzDKsxTgnBmuNGjYDaFSvCH5Er2rYvYxNaO0Hm037kP7
         Cnsp1ovxBBNpOmOrsNK2RNFLfkP6iHuR86oKec01l3v4V1YphH6dbT4wlecyjxVrwZWT
         CvRQ6MwI54++4sYGjy+Q3DlvtXbuqxHcWlqIfYlZ+kOEoTNHjSQeyQnd/JaFjv6Efq2O
         oKPED9g7TaTzXt0miUMbgLI9W1AqS7pWVRl+QmORlgNJhtPCB0xl932APnWJ4uT40f+I
         9FwQ==
X-Gm-Message-State: AOAM5317uoYIgsmt19NvaLwyccJU14tHMdHwdOXnLeYd2xI9afq9jVdf
        XjORgrlqe2GVTbmrjeh8YS0=
X-Google-Smtp-Source: ABdhPJzG3B+dHZZuwOsql6xHs1utQat0dBLhS7uutJaG6I4U8bvkOGeNvWI63LKz1/d1BJXC5f/DzQ==
X-Received: by 2002:a63:f90a:: with SMTP id h10mr841792pgi.361.1602034981851;
        Tue, 06 Oct 2020 18:43:01 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:46a:dc67:6c85:26f7:3457:384d])
        by smtp.gmail.com with ESMTPSA id a185sm485863pgc.46.2020.10.06.18.42.57
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 06 Oct 2020 18:43:01 -0700 (PDT)
From:   Gene Chen <gene.chen.richtek@gmail.com>
To:     jacek.anaszewski@gmail.com, pavel@ucw.cz, robh+dt@kernel.org,
        matthias.bgg@gmail.com
Cc:     dmurphy@ti.com, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        gene_chen@richtek.com, Wilma.Wu@mediatek.com,
        shufan_lee@richtek.com, cy_huang@richtek.com,
        benjamin.chao@mediatek.com
Subject: [PATCH v5 1/2] dt-bindings: leds: Add bindings for MT6360 LED
Date:   Wed,  7 Oct 2020 09:42:45 +0800
Message-Id: <1602034966-3524-2-git-send-email-gene.chen.richtek@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1602034966-3524-1-git-send-email-gene.chen.richtek@gmail.com>
References: <1602034966-3524-1-git-send-email-gene.chen.richtek@gmail.com>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

From: Gene Chen <gene_chen@richtek.com>

Add bindings document for LED support on MT6360 PMIC

Signed-off-by: Gene Chen <gene_chen@richtek.com>
---
 .../devicetree/bindings/leds/leds-mt6360.yaml      | 95 ++++++++++++++++++++++
 1 file changed, 95 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-mt6360.yaml

diff --git a/Documentation/devicetree/bindings/leds/leds-mt6360.yaml b/Documentation/devicetree/bindings/leds/leds-mt6360.yaml
new file mode 100644
index 0000000..2fa636f
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/leds-mt6360.yaml
@@ -0,0 +1,95 @@
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
+  "^led@[0-3]$":
+    type: object
+    $ref: common.yaml#
+    description:
+      Properties for a single LED.
+
+    properties:
+      reg:
+        description: Index of the LED.
+        enum:
+          - 0 # LED output INDICATOR1_RGB
+          - 1 # LED output INDICATOR2
+          - 2 # LED output FLED1
+          - 3 # LED output FLED2
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
+       color = <LED_COLOR_ID_RGB>;
+       led-max-microamp = <24000>;
+     };
+     led@1 {
+       reg = <1>;
+       function = LED_FUNCTION_INDICATOR;
+       color = <LED_COLOR_ID_AMBER>;
+       default-state = "off";
+       led-max-microamp = <150000>;
+     };
+     led@2 {
+       reg = <2>;
+       function = LED_FUNCTION_FLASH;
+       color = <LED_COLOR_ID_WHITE>;
+       function-enumerator = <1>;
+       default-state = "off";
+       led-max-microamp = <200000>;
+       flash-max-microamp = <500000>;
+       flash-max-timeout-us = <1024000>;
+     };
+     led@3 {
+       reg = <3>;
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

