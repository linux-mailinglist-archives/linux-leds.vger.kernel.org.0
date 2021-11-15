Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 099A54500E7
	for <lists+linux-leds@lfdr.de>; Mon, 15 Nov 2021 10:11:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230047AbhKOJOM (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 15 Nov 2021 04:14:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229967AbhKOJOL (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 15 Nov 2021 04:14:11 -0500
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6146AC061746;
        Mon, 15 Nov 2021 01:11:14 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id bu18so41848475lfb.0;
        Mon, 15 Nov 2021 01:11:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZLANfQtwTYeX45EZLz3xzQlHuL+rRz6De4WFyM0zMMM=;
        b=j6bVYJFTVgb9Yg2hfV12q4hG7FT4TOPzdY8Dm4TYEyEtA6fHqe6qkuEpfsdLMw3cDm
         qkOlruI7htRcuwLFkNDL9OcuZ57mudvp+HdIEgkanyTYLC9EfHYHfvblp1HVoG88KQ1a
         1IFPFVCUWEMxAUbQwNhzfUAU5wibsu8p4PuNDIXrFiJ/csmQT99U6AhiuW9RxD5xvdc9
         R99gZC1IGd1QJIDRKdS4/Nhnv0oEg+XpvrfyrV33te+vp5d79ZJKYLaeOzX2dtdPfsWc
         R0x8GWavtRzwzP/clE+dEOmEOqHrnWiRs/GNrIPeLeirptZLD/34NL3iEoJEMkbe+H28
         SrsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZLANfQtwTYeX45EZLz3xzQlHuL+rRz6De4WFyM0zMMM=;
        b=5AyfCOKn36cMy39cbf1VuY75/nzKOYCE7DPVosJhWsJEnrQW2jOqDqymlvl3jymWMB
         7Npeb3cgVaFvE2vfyKXei01iW2CZxAuB4t9V52kbOmbcIFhGY03TE0tctB+jNbg8rfnQ
         qknwaG47C3QwNiYpDSCF0yQ4MChGJ+f1yjRXDTWqGiERGrSY3bHlRFx5OMHffT8IgQVs
         ljcEHSCa6oCVrPeqNpTps54iCQqg3bShXozatmAFXb0bOGnDbA+trY521wXiNdmcLW8w
         8VNmgiGZRwaqSVYNiSYTPl88pKN/oJptq9S1ctSiQkp3T8omvAd228RPgoW+eDOBPA57
         3ZLg==
X-Gm-Message-State: AOAM532vT153aeN6sXbI5jpGtcCleHtrTFlBXC2jAX6RS7iUCPOqPsuR
        +wEGB5Uhh+BvjmOCT5Y43tQ=
X-Google-Smtp-Source: ABdhPJwJ5pMOA75bQG7KNv8qz7jkCiWpkAlGcXzwa9qsLDwIKm94APJpcxPPIFV1LmHAugry8RRt/g==
X-Received: by 2002:a05:6512:519:: with SMTP id o25mr32840823lfb.422.1636967472733;
        Mon, 15 Nov 2021 01:11:12 -0800 (PST)
Received: from localhost.lan (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.gmail.com with ESMTPSA id 18sm503318ljd.73.2021.11.15.01.11.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Nov 2021 01:11:12 -0800 (PST)
From:   =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To:     Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>
Cc:     linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        Florian Fainelli <f.fainelli@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        bcm-kernel-feedback-list@broadcom.com,
        =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH 1/2] dt-bindings: leds: add Broadcom's BCM63xxx controller
Date:   Mon, 15 Nov 2021 10:11:06 +0100
Message-Id: <20211115091107.11737-1-zajec5@gmail.com>
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
most commonly used in BCM63138 thus the binding name 63xxx.

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
 .../bindings/leds/leds-bcm63xxx.yaml          | 94 +++++++++++++++++++
 1 file changed, 94 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-bcm63xxx.yaml

diff --git a/Documentation/devicetree/bindings/leds/leds-bcm63xxx.yaml b/Documentation/devicetree/bindings/leds/leds-bcm63xxx.yaml
new file mode 100644
index 000000000000..3910dd607f3f
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/leds-bcm63xxx.yaml
@@ -0,0 +1,94 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/leds-bcm63xxx.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Broadcom's BCM63xxx LEDs controller
+
+maintainers:
+  - Rafał Miłecki <rafal@milecki.pl>
+
+description: |
+  This LEDs controller is used on BCM4908, BCM6848, BCM6858, BCM63138, BCM63148,
+  BCM63381 and BCM68360.
+
+  It supports up to 32 LEDs that can be connected parallelly or serially. It
+  also includes limited support for hardware blinking.
+
+  Binding serially connected LEDs isn't documented yet.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - brcm,bcm4908-leds
+          - brcm,bcm6848-leds
+          - brcm,bcm6858-leds
+          - brcm,bcm63138-leds
+          - brcm,bcm63148-leds
+          - brcm,bcm63381-leds
+          - brcm,bcm68360-leds
+      - const: brcm,bcm63xxx-leds
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
+        compatible = "brcm,bcm4908-leds", "brcm,bcm63xxx-leds";
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

