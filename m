Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1CE02749179
	for <lists+linux-leds@lfdr.de>; Thu,  6 Jul 2023 01:13:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231700AbjGEXNp (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 5 Jul 2023 19:13:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230487AbjGEXNn (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 5 Jul 2023 19:13:43 -0400
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC1381BC5;
        Wed,  5 Jul 2023 16:13:39 -0700 (PDT)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id C4BF7856C4;
        Thu,  6 Jul 2023 01:13:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1688598817;
        bh=LOHtMFS18+L5fALnNMFx2Si5gyvPq/4kU7bBxSwehQo=;
        h=From:To:Cc:Subject:Date:From;
        b=DIATDz/ywTd1JKLR0k5NJOlHkaGIN6vPhasl8XiFGvbX9aWsnOrcacQs2F4CzHPNV
         gwmXLyPn6sd7uRcAZhoqNQVp1KKgNs57Mpa0UIFVkGpvjBFYxh+rRJc7sXInkJGgas
         JZKnfkbaSDFG5XnfbzoSmm9+4HmpjxbL7nNVgkqTRaBoU/OSf+WAc3I4Hu/LHm+LW2
         SYDTEnNcSAcZBemnpXPvTZ9Y4C43tYo6HXg77NStUcGHkhIlEnd1jkqMU6bRWOyFTN
         DwWBplKTlOUlaoVom5uEb/FNtutWycIhLWFO+/9JVfAQkBbFlMKPGj7idCydpLpchJ
         Osgr4YePES+xA==
From:   Marek Vasut <marex@denx.de>
To:     linux-leds@vger.kernel.org
Cc:     Marek Vasut <marex@denx.de>, Conor Dooley <conor+dt@kernel.org>,
        Isai Gaspar <isaiezequiel.gaspar@nxp.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Lee Jones <lee@kernel.org>, Pavel Machek <pavel@ucw.cz>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Subject: [PATCH v3 1/2] dt-bindings: leds: pca995x: Add binding document for PCA995X chips
Date:   Thu,  6 Jul 2023 01:13:25 +0200
Message-Id: <20230705231326.232356-1-marex@denx.de>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

The PCA995x chips are I2C controlled LED drivers. Each chip has
up to 16 outputs, each one with an individual 8-bit resolution
PWM for brightness control. Add binding document.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Isai Gaspar <isaiezequiel.gaspar@nxp.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Lee Jones <lee@kernel.org>
Cc: Marek Vasut <marex@denx.de>
Cc: Pavel Machek <pavel@ucw.cz>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-leds@vger.kernel.org
---
V2: Fix the led@[0-9]+ match
V3: Unit addresses for leds@ are hex, add a-f into the glob
---
 .../devicetree/bindings/leds/nxp,pca995x.yaml | 81 +++++++++++++++++++
 1 file changed, 81 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/nxp,pca995x.yaml

diff --git a/Documentation/devicetree/bindings/leds/nxp,pca995x.yaml b/Documentation/devicetree/bindings/leds/nxp,pca995x.yaml
new file mode 100644
index 0000000000000..654915c1f687f
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/nxp,pca995x.yaml
@@ -0,0 +1,81 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/nxp,pca995x.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP PCA995x LED controllers
+
+maintainers:
+  - Isai Gaspar <isaiezequiel.gaspar@nxp.com>
+  - Marek Vasut <marex@denx.de>
+
+description:
+  The NXP PCA9952/PCA9955B are programmable LED controllers connected via I2C
+  that can drive 16 separate lines. Each of them can be individually switched
+  on and off, and brightness can be controlled via individual PWM.
+
+  Datasheets are available at
+  https://www.nxp.com/docs/en/data-sheet/PCA9952_PCA9955.pdf
+  https://www.nxp.com/docs/en/data-sheet/PCA9955B.pdf
+
+properties:
+  compatible:
+    enum:
+      - nxp,pca9952
+      - nxp,pca9955b
+
+  reg:
+    maxItems: 1
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+patternProperties:
+  "^led@[0-9a-f]+$":
+    type: object
+    $ref: common.yaml#
+    unevaluatedProperties: false
+
+    properties:
+      reg:
+        minimum: 0
+        maximum: 15
+
+    required:
+      - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/leds/common.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        led-controller@1 {
+            compatible = "nxp,pca9955b";
+            reg = <0x01>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            led@0 {
+                reg = <0x0>;
+                color = <LED_COLOR_ID_RED>;
+                function = LED_FUNCTION_POWER;
+            };
+
+            led@2 {
+                reg = <0x2>;
+                color = <LED_COLOR_ID_WHITE>;
+                function = LED_FUNCTION_STATUS;
+            };
+        };
+    };
+
+...
-- 
2.40.1

