Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF62647FDFD
	for <lists+linux-leds@lfdr.de>; Mon, 27 Dec 2021 15:59:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237337AbhL0O7i (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 27 Dec 2021 09:59:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237301AbhL0O7e (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 27 Dec 2021 09:59:34 -0500
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECF37C06173E;
        Mon, 27 Dec 2021 06:59:33 -0800 (PST)
Received: by mail-lj1-x235.google.com with SMTP id k27so26086503ljc.4;
        Mon, 27 Dec 2021 06:59:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+3DXEWk4wOpAYLyU9WMP+VkKdIosdnnMUhPwi01K2VY=;
        b=bqkBYAKXy6m77qhEMjRVQq3wCakbbxuGp0RRc1zrUBNJcABFIxaH6j4RBsQvBu65Wa
         wHsbqAJweZ4ArWdXGfBss02bB8j5qpMYmWRUtKFCozzNbdzHQ11peD8efuqRMjHoWoFD
         MbL2vC17fPrkQkhkcuXMCd+sNMzh6BQuacjeZjtwzSZ9hAXklm4VdGzPiAVCq5ulkTax
         Lqc3CMe9mvgs/PCsXddMsIz2kS9YP4IRCiTO6IqjXpV+8dD1DbfExcmOGM42qHn948zH
         YoG0gqp9zZsg+WATNIMFgLyqkuttZHtL1B0ycc56iQtGVKRo4L9eRsKKMEJ+UquFfC0J
         e/Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+3DXEWk4wOpAYLyU9WMP+VkKdIosdnnMUhPwi01K2VY=;
        b=PMVJwlY1Ev64sJb6X/Z8Lki3pyL6NT7njQogNi050iQTTAMlML6AACbYUmy0mXjMXa
         K4OINmrJqzkPBfP8psxZ6Cik886bWNfh406N1ifbwQae+kW41fPkgR1AYxxWnhZT76oV
         tTFpJF39NV4PXk/2Fw5awxpnDyR/2ljnYl9Nq8QDXUZZeijqylZW4x8ijQ5yn8mqgiON
         dfqI3l5twcL7hKWDw8yela7tmbokVRDjmE/bnxReoQJ7JbNhAMvGvGjVu8N805SgwlnO
         Bp9esuhCjFGfkSZHpFQbVb/VLB/4RbHW+Qqjgwk31sB2ejCRs5dkW2vca1YBABRMamQp
         hkSQ==
X-Gm-Message-State: AOAM5321XZ5PIN4sNOJTkrddr3Mx2dN9Q3sHaPbNLuXrcyxWriZBGl0x
        2fs5DmoX0OvdFr9cNMqyHps=
X-Google-Smtp-Source: ABdhPJxq/U6lcPnHVuRrA24LO1C8QZDZBDnLqKexmMzO4Xxm/ngPcfpaVk9cAd9As3D+V3G6slKjTA==
X-Received: by 2002:a2e:8954:: with SMTP id b20mr12795823ljk.404.1640617171507;
        Mon, 27 Dec 2021 06:59:31 -0800 (PST)
Received: from localhost.lan (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.gmail.com with ESMTPSA id o3sm1667766lfo.255.2021.12.27.06.59.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Dec 2021 06:59:31 -0800 (PST)
From:   =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To:     Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>
Cc:     linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        Florian Fainelli <f.fainelli@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        bcm-kernel-feedback-list@broadcom.com,
        =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH V3 1/2] dt-bindings: leds: add Broadcom's BCM63138 controller
Date:   Mon, 27 Dec 2021 15:59:04 +0100
Message-Id: <20211227145905.2905-1-zajec5@gmail.com>
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
Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
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

