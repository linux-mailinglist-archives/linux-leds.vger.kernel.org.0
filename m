Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0A8245B8FF
	for <lists+linux-leds@lfdr.de>; Wed, 24 Nov 2021 12:20:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241281AbhKXLXM (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 24 Nov 2021 06:23:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241062AbhKXLXJ (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 24 Nov 2021 06:23:09 -0500
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C40A0C061574;
        Wed, 24 Nov 2021 03:19:59 -0800 (PST)
Received: by mail-lj1-x234.google.com with SMTP id 207so4630639ljf.10;
        Wed, 24 Nov 2021 03:19:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IZsEpOVVfiGIRoNJT482zVDXMB2Izb1XOnZ3syryS50=;
        b=hhi9jLeUBLMgFy2tjcZO9NXe6AGglXyYOhpOgywPfPDDM0V6bGlINYJOYQHWQoMRMO
         23CyipaNgeFDeOKJ93B7BuTrvKwyA9/gjTherwYbUaWnbtZ348Nh8rGG1g97vUWF2KQM
         ffzAks9znHEi7RkMK5CZoFssvTAA0UkuTxzS/EIsUBRYumZfVmoHKJ8FQlvicUSB2ygI
         O54NG4n31rTXpcMWhbcoCX9wPvc4ogZcc/iTskRhz513Rs4I0BM4WEM2o8hTwq3Phy6H
         DZmtEeicBqMwOMaQjQ2o4+bV0AymsTpJi8w1g9kHxOascGdj+zm5JyMWta9KXRbkCeK2
         cgRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IZsEpOVVfiGIRoNJT482zVDXMB2Izb1XOnZ3syryS50=;
        b=7tdlQtumMGebQ6SlpFS+zuMyED8Wle5fjmmdsHyk6HMsGvq5HDCcHnSR8Xa0ZQ/V+T
         iWKnbaiG8NhI9YBreXABA4Rxykj3AvBggRvqZbqosUdVt/g57t6YJpXOY/o9x78OzRqa
         ElmxIN0QwOrX+CUZFv6eDMGlgdzheGVdZXv+Lrt71WzldebZoAxShxAkYhVH0ynPoh3L
         3W0ZmkvMZl5eGwBPLtdtgOMFcaHuvH7MeCohtc5A4Dc6x7kIzf+XpdHWzFSvXt0vID2F
         Kc0s3n/JNhoDye36o12x+Q3FJPhYxIkXRuApJWhjKPxGoGaRsshCYPWk1RG4UGcgBcSf
         hDLw==
X-Gm-Message-State: AOAM5329VDLEy1B3NqeJe5+tZNLfqAaD4Hc2wLNCWwA54lXEhvVg/+pm
        dF273Z4L1o4WuYEDsn554CE=
X-Google-Smtp-Source: ABdhPJwuzjxSIEvogfqLN5ftOQT8Fc55nvgdAlaEsRJ6wHjl/CBTrWPcP9mSY2pWWvUC59i1VDE/YQ==
X-Received: by 2002:a2e:7319:: with SMTP id o25mr14570678ljc.320.1637752798034;
        Wed, 24 Nov 2021 03:19:58 -0800 (PST)
Received: from localhost.lan (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.gmail.com with ESMTPSA id f15sm1578512lfq.236.2021.11.24.03.19.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Nov 2021 03:19:57 -0800 (PST)
From:   =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To:     Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>
Cc:     linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        Florian Fainelli <f.fainelli@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        bcm-kernel-feedback-list@broadcom.com,
        =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH V2 1/2] dt-bindings: leds: add Broadcom's BCM63138 controller
Date:   Wed, 24 Nov 2021 12:19:51 +0100
Message-Id: <20211124111952.22419-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

From: Rafał Miłecki <rafal@milecki.pl>

Broadcom used 2 LEDs hardware blocks for their BCM63xx SoCs:
1. Older one (BCM6318, BCM6328, BCM6362, BCM63268, BCM6838)
2. Newer one (BCM6848, BCM6858, BCM63138, BCM63148, BCM63381, BCM68360)

The newer one was also later also used on BCM4908 SoC.

Old block is already documented in the leds-bcm6328.yaml. This binding
documents the new one which uses different registers & programming. It's
first used in BCM63138 thus the binding name.

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
V2: Rename to bcm63138 & make "brcm,bcm63138-leds" the main compatible
---
 .../bindings/leds/leds-bcm63138.yaml          | 95 +++++++++++++++++++
 1 file changed, 95 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-bcm63138.yaml

diff --git a/Documentation/devicetree/bindings/leds/leds-bcm63138.yaml b/Documentation/devicetree/bindings/leds/leds-bcm63138.yaml
new file mode 100644
index 000000000000..99cd4ba9b0ca
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/leds-bcm63138.yaml
@@ -0,0 +1,95 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/leds-bcm63138.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Broadcom's BCM63138 LEDs controller
+
+maintainers:
+  - Rafał Miłecki <rafal@milecki.pl>
+
+description: |
+  This LEDs controller was first used on BCM63138 and later reused on BCM4908,
+  BCM6848, BCM6858, BCM63138, BCM63148, BCM63381 and BCM68360 SoCs.
+
+  It supports up to 32 LEDs that can be connected parallelly or serially. It
+  also includes limited support for hardware blinking.
+
+  Binding serially connected LEDs isn't documented yet.
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - brcm,bcm4908-leds
+              - brcm,bcm6848-leds
+              - brcm,bcm6858-leds
+              - brcm,bcm63148-leds
+              - brcm,bcm63381-leds
+              - brcm,bcm68360-leds
+          - const: brcm,bcm63138-leds
+      - const: brcm,bcm63138-leds
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
+  "^led@[a-f0-9]+$":
+    type: object
+
+    $ref: common.yaml#
+
+    properties:
+      reg:
+        maxItems: 1
+        description: LED pin number
+
+      active-low:
+        type: boolean
+        description: Makes LED active low.
+
+    required:
+      - reg
+
+    unevaluatedProperties: false
+
+required:
+  - reg
+  - "#address-cells"
+  - "#size-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/leds/common.h>
+
+    leds@ff800800 {
+        compatible = "brcm,bcm4908-leds", "brcm,bcm63138-leds";
+        reg = <0xff800800 0xdc>;
+
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        led@0 {
+            reg = <0x0>;
+            function = LED_FUNCTION_POWER;
+            color = <LED_COLOR_ID_GREEN>;
+            default-state = "on";
+        };
+
+        led@3 {
+            reg = <0x3>;
+            function = LED_FUNCTION_STATUS;
+            color = <LED_COLOR_ID_GREEN>;
+            active-low;
+        };
+    };
-- 
2.31.1

