Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C28226E1BF7
	for <lists+linux-leds@lfdr.de>; Fri, 14 Apr 2023 07:53:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229656AbjDNFxz (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 14 Apr 2023 01:53:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229476AbjDNFxx (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 14 Apr 2023 01:53:53 -0400
Received: from mail.andi.de1.cc (mail.andi.de1.cc [IPv6:2a01:238:4321:8900:456f:ecd6:43e:202c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1623421E;
        Thu, 13 Apr 2023 22:53:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=kemnade.info; s=20220719; h=Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Subject:To:From:Sender:Reply-To:Cc:
        Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=pHX4cBQBdsKSwFa+sVgCNh/+VSVOS4pC36SXu+xXPXw=; b=e6sLqcCaFHjMqbt+H20hHFwpYe
        ll2PwMjoYy+JSmvlYYG4dzuipnQqhhUPkNQGqTDQQ3ncehzu6WKmGFZRUyyFzt/1uVs6QQmsky5y4
        bZXyWoazovIfAKD5oJ2kGFpzBGaYgHPcKFeZJIsecde2klEp28NEV3bBS/z1KUZTWVKNUA2zMQwwW
        FcQZP/fuIG83dPci4G7H+3+aEH9hOl9JHCBhsKYG/Ha3JdT8kLgLcY/elO8SqgMKzK1MmlO60h/Pi
        4b8wTotg0FyXPHiU1DarjtkPDUUPaRYtgX0g384pOrocThirMvwZii5yhHST0Ccy+EXVIv4uUMcyy
        6OVb78FQ==;
Received: from p200300ccff0c0d001a3da2fffebfd33a.dip0.t-ipconnect.de ([2003:cc:ff0c:d00:1a3d:a2ff:febf:d33a] helo=aktux)
        by mail.andi.de1.cc with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <andreas@kemnade.info>)
        id 1pnCNV-0005Me-L2; Fri, 14 Apr 2023 07:53:46 +0200
Received: from andi by aktux with local (Exim 4.96)
        (envelope-from <andreas@kemnade.info>)
        id 1pnCNV-001PH0-0a;
        Fri, 14 Apr 2023 07:53:45 +0200
From:   Andreas Kemnade <andreas@kemnade.info>
To:     pavel@ucw.cz, lee@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, andreas@kemnade.info,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Matti Vaittinen <mazziesaccount@gmail.com>
Subject: [PATCH v4 1/2] dt-bindings: leds: Add ROHM BD2606MVV LED driver
Date:   Fri, 14 Apr 2023 07:53:40 +0200
Message-Id: <20230414055341.335456-2-andreas@kemnade.info>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230414055341.335456-1-andreas@kemnade.info>
References: <20230414055341.335456-1-andreas@kemnade.info>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -1.0 (-)
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Document ROHM BD2606MVV LED driver devicetree bindings.

Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
Reviewed-by: Matti Vaittinen <mazziesaccount@gmail.com>
---
 .../bindings/leds/rohm,bd2606mvv.yaml         | 81 +++++++++++++++++++
 1 file changed, 81 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/rohm,bd2606mvv.yaml

diff --git a/Documentation/devicetree/bindings/leds/rohm,bd2606mvv.yaml b/Documentation/devicetree/bindings/leds/rohm,bd2606mvv.yaml
new file mode 100644
index 0000000000000..14700a2e5feaa
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/rohm,bd2606mvv.yaml
@@ -0,0 +1,81 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/rohm,bd2606mvv.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ROHM BD2606MVV LED controller
+
+maintainers:
+  - Andreas Kemnade <andreas@kemnade.info>
+
+description:
+  The BD2606 MVV is a programmable LED controller connected via I2C that can
+  drive 6 separate lines. Each of them can be individually switched on and off,
+  but the brightness setting is shared between pairs of them.
+
+  Datasheet is available at
+  https://fscdn.rohm.com/en/products/databook/datasheet/ic/power/led_driver/bd2606mvv_1-e.pdf
+
+properties:
+  compatible:
+    const: rohm,bd2606mvv
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
+  enable-gpios:
+    maxItems: 1
+    description: GPIO pin to enable/disable the device.
+
+patternProperties:
+  "^led@[0-6]$":
+    type: object
+    $ref: common.yaml#
+    unevaluatedProperties: false
+
+    properties:
+      reg:
+        minimum: 0
+        maximum: 6
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
+        led-controller@66 {
+            compatible = "rohm,bd2606mvv";
+            reg = <0x66>;
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
2.39.2

