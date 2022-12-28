Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B62DC657777
	for <lists+linux-leds@lfdr.de>; Wed, 28 Dec 2022 15:05:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230050AbiL1OFF (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 28 Dec 2022 09:05:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232646AbiL1OFD (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 28 Dec 2022 09:05:03 -0500
Received: from mickerik.phytec.de (mickerik.phytec.de [91.26.50.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8198CBC96
        for <linux-leds@vger.kernel.org>; Wed, 28 Dec 2022 06:05:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; d=phytec.de; s=a4; c=relaxed/simple;
        q=dns/txt; i=@phytec.de; t=1672236300; x=1674828300;
        h=From:Sender:Reply-To:Subject:Date:Message-ID:To:CC:MIME-Version:Content-Type:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=GwSs+KUwXHQ2Ihg0DYscgWCUYNBP9lqK47lonGDBpvk=;
        b=r1xUhPBC00OIvMBnT4x2cWKeBTgGr0Guh2QQ8AhCfOHYdjUSEHjSwIatjN+47oKL
        AqroC8yva6fBF/iJIFq8bF+kzj11g3KUVszKw6o4TtIBvDA+3DWClOJ6rXZ7vivz
        mCqCSPRpG7lqO5Xl+pAYg/Fk3Wi6pt+mRhmES/4U31A=;
X-AuditID: ac14000a-923ff70000007ecb-83-63ac4d0c4137
Received: from berlix.phytec.de (Unknown_Domain [172.25.0.12])
        (using TLS with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (Client did not present a certificate)
        by mickerik.phytec.de (PHYTEC Mail Gateway) with SMTP id BA.B5.32459.C0D4CA36; Wed, 28 Dec 2022 15:05:00 +0100 (CET)
Received: from augenblix2.phytec.de (172.25.0.11) by Berlix.phytec.de
 (172.25.0.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Wed, 28 Dec
 2022 15:04:59 +0100
From:   Wadim Egorov <w.egorov@phytec.de>
To:     <upstream@lists.phytec.de>, <devicetree@vger.kernel.org>,
        <linux-leds@vger.kernel.org>
CC:     <jacek.anaszewski@gmail.com>, <krzysztof.kozlowski+dt@linaro.org>,
        <robh+dt@kernel.org>, <lee@kernel.org>, <pavel@ucw.cz>
Subject: [PATCH] dt-bindings: leds: Convert PCA9532 to dtschema
Date:   Wed, 28 Dec 2022 15:04:49 +0100
Message-ID: <20221228140449.938513-1-w.egorov@phytec.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.25.0.11]
X-ClientProxiedBy: Berlix.phytec.de (172.25.0.12) To Berlix.phytec.de
 (172.25.0.12)
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrELMWRmVeSWpSXmKPExsWyRpKBR5fHd02ywdYjPBbzj5xjtbi9dQOL
        Rd+Lh8wWO9oWslhsfbOO0eLuqaNsFq17j7BbdL9Td+Dw2DnrLrvHplWdbB53ru1h8+jvbmH1
        WLH6O7vH501yAWxRXDYpqTmZZalF+nYJXBlX1nSxFDxXrfiw4wV7A+MG6S5GTg4JAROJi3tX
        M3YxcnEICSxmkjjZ1cwIkhASeMIocet9NIjNJqAucWfDN1YQW0QgRqJ583wwm1mgXqL/3AR2
        EFtYwF5iyoOPbCA2i4CqxN+Vk4DiHBy8AhYScx6GQOySl5h56TtYOa+AoMTJmU9YIMbISzRv
        nc0MYUtIHHzxghniBHmJF5eWs8D0Tjv3mhnCDpXY+mU70wRGgVlIRs1CMmoWklELGJlXMQrl
        ZiZnpxZlZusVZFSWpCbrpaRuYgSFuwgD1w7GvjkehxiZOBgPMUpwMCuJ8GqcXZ0sxJuSWFmV
        WpQfX1Sak1p8iFGag0VJnPd+D1OikEB6YklqdmpqQWoRTJaJg1OqgdEmP4DfWebqy5JWiYcZ
        oTO/8HryfvBrnFgWHp5tY/B+Hq/ZS81HlYsq3jOs+aCcGhi6Sm3u9JNlqcdTrv2tmy5fXrNB
        deqNf1NMkibqR2QbbNue1+Zax33iz8ZT86P29XoWdErM5vvnPnWjT19c7+majUf+FR2dVHgw
        Q3S1puAW/i0fnvq8/afEUpyRaKjFXFScCAAm8YmiZQIAAA==
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Convert the PCA9532 LED dimmer to dtschema.
While at it, also update and the the example to match
recommended node names and the link to the product datasheet.

Signed-off-by: Wadim Egorov <w.egorov@phytec.de>
---
 .../devicetree/bindings/leds/leds-pca9532.txt | 49 -----------
 .../bindings/leds/leds-pca9532.yaml           | 86 +++++++++++++++++++
 2 files changed, 86 insertions(+), 49 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/leds/leds-pca9532.txt
 create mode 100644 Documentation/devicetree/bindings/leds/leds-pca9532.yaml

diff --git a/Documentation/devicetree/bindings/leds/leds-pca9532.txt b/Documentation/devicetree/bindings/leds/leds-pca9532.txt
deleted file mode 100644
index f769c52e3643..000000000000
--- a/Documentation/devicetree/bindings/leds/leds-pca9532.txt
+++ /dev/null
@@ -1,49 +0,0 @@
-*NXP - pca9532 PWM LED Driver
-
-The PCA9532 family is SMBus I/O expander optimized for dimming LEDs.
-The PWM support 256 steps.
-
-Required properties:
-	- compatible:
-		"nxp,pca9530"
-		"nxp,pca9531"
-		"nxp,pca9532"
-		"nxp,pca9533"
-	- reg -  I2C slave address
-
-Each led is represented as a sub-node of the nxp,pca9530.
-
-Optional sub-node properties:
-	- label: see Documentation/devicetree/bindings/leds/common.txt
-	- type: Output configuration, see dt-bindings/leds/leds-pca9532.h (default NONE)
-	- linux,default-trigger: see Documentation/devicetree/bindings/leds/common.txt
-	- default-state: see Documentation/devicetree/bindings/leds/common.txt
-	  This property is only valid for sub-nodes of type <PCA9532_TYPE_LED>.
-
-Example:
-  #include <dt-bindings/leds/leds-pca9532.h>
-
-  leds: pca9530@60 {
-    compatible = "nxp,pca9530";
-    reg = <0x60>;
-
-    red-power {
-      label = "pca:red:power";
-      type = <PCA9532_TYPE_LED>;
-    };
-    green-power {
-      label = "pca:green:power";
-      type = <PCA9532_TYPE_LED>;
-    };
-    kernel-booting {
-      type = <PCA9532_TYPE_LED>;
-      default-state = "on";
-    };
-    sys-stat {
-      type = <PCA9532_TYPE_LED>;
-      default-state = "keep"; // don't touch, was set by U-Boot
-    };
-  };
-
-For more product information please see the link below:
-http://nxp.com/documents/data_sheet/PCA9532.pdf
diff --git a/Documentation/devicetree/bindings/leds/leds-pca9532.yaml b/Documentation/devicetree/bindings/leds/leds-pca9532.yaml
new file mode 100644
index 000000000000..e3741b5046b7
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/leds-pca9532.yaml
@@ -0,0 +1,86 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/leds-pca9532.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP - pca9532 PWM LED Driver
+
+maintainers:
+  - Jacek Anaszewski <jacek.anaszewski@gmail.com>
+  - Pavel Machek <pavel@ucw.cz>
+
+description: |
+  The PCA9532 family is SMBus I/O expander optimized for dimming LEDs.
+  The PWM support 256 steps.
+
+  For more product information please see the link below:
+    https://www.nxp.com/docs/en/data-sheet/PCA9532.pdf
+
+properties:
+  compatible:
+    enum:
+      - nxp,pca9530
+      - nxp,pca9531
+      - nxp,pca9532
+      - nxp,pca9533
+
+  reg:
+    maxItems: 1
+    description: I2C slave address
+
+patternProperties:
+  "^led-[0-9a-z]+$":
+    type: object
+    $ref: common.yaml#
+    properties:
+      type:
+        description: |
+          Output configuration, see dt-bindings/leds/leds-pca9532.h
+          Default is 0, PCA9532_TYPE_NONE.
+        $ref: /schemas/types.yaml#/definitions/uint32
+        minimum: 0
+        maximum: 4
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/leds/leds-pca9532.h>
+
+    i2c {
+        led-controller@62 {
+                compatible = "nxp,pca9533";
+                reg = <0x62>;
+
+                led-1 {
+                        label = "user1";
+                        type = <PCA9532_TYPE_LED>;
+                        color = <LED_COLOR_ID_RED>;
+                };
+
+                led-2 {
+                        label = "user2";
+                        type = <PCA9532_TYPE_LED>;
+                        color = <LED_COLOR_ID_GREEN>;
+                };
+
+                led-3 {
+                        label = "user3";
+                        type = <PCA9532_TYPE_LED>;
+                        color = <LED_COLOR_ID_BLUE>;
+                };
+
+                led-4 {
+                        label = "user4";
+                        type = <PCA9532_TYPE_LED>;
+                        color = <LED_COLOR_ID_RED>;
+                };
+        };
+    };
+
+...
-- 
2.34.1

