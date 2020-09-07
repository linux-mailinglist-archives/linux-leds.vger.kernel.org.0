Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 85BBD25F838
	for <lists+linux-leds@lfdr.de>; Mon,  7 Sep 2020 12:29:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728637AbgIGK25 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 7 Sep 2020 06:28:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728723AbgIGK2X (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 7 Sep 2020 06:28:23 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2AE5C061574;
        Mon,  7 Sep 2020 03:28:22 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id b17so4153747pji.1;
        Mon, 07 Sep 2020 03:28:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=ITcGcXtzItjOscmK8N5fYW//0H9STvyX68vCXrrZF4w=;
        b=A1OBEVDY4me2Wvsvyy2MUi/A8XkKv6ZdMG8s6KSj7lXomVYrF0aPZnCWGOfomJgwn/
         ymT0CzWAuEP4wsFsOOm/VJ75BKHE0FJD5avQGluDjO0d6q/fxlhHKgvGJhRzIcF06X2a
         lpwHBzJbUmfDHK0XWbYIM8yQZu+8MtML6lz6L4buDz0iJkV8BASxBkVE0EQzm1c8ULT6
         88ZWckezYoRCBGPHL5a5RrS8KZGC6Q2wFuzD0J4vXfhdyAauqtvsCr1GZQPPSuFVL1gV
         akwocGz2xp3FUrfLCOqDziTMJrVZwYZYnOfey2tzzVS/atgebz5zcgb+UHwxx8c3CMee
         Ffsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=ITcGcXtzItjOscmK8N5fYW//0H9STvyX68vCXrrZF4w=;
        b=UeQlrc36hgCIR+sisFjNy0BYvY1PVTv/AuhZi+Wk2oz81c+tRlZ5f7ZCqL2lRNOh3t
         t0z1+39fYziZI3/DdZN3H1gAK3oTBKZh3OBiP5p2/ltnYyKoj08Op83C8t0jnKz07Ip8
         zeomU2AMi5LhYhp1doE/IvUXzLn/ltMRmnxh/MfVcPxKmfB4FdGKZCiNzWxPG3/m8de3
         NJuPIblCeeY96T9DKTrsY1tL1wGbFH8YDzW1V4NwPpUa2BqPQQf5KHycA8Uz6gSFI8Cq
         hllOX71q+UliMvFyfA/5mOHpQc0IZtYfnpML/4B+aARXa2BG4R+vYnGJ4ITntEISWg2q
         2hOg==
X-Gm-Message-State: AOAM532wreHw99stbZCxjuoAVwwWUgwfd0WtwjU4GXDdbe/Bhxos6ws7
        YWFeKf4YkPBUO3armOCGBAU=
X-Google-Smtp-Source: ABdhPJzh/5Ux08+E14zJum33L6vE0PTkNwSCLe9N4YM97WfgrNu5gy8gxWZNLimdh6e9D2KnG+RpYw==
X-Received: by 2002:a17:90a:f198:: with SMTP id bv24mr20983093pjb.117.1599474502574;
        Mon, 07 Sep 2020 03:28:22 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:568:81bf:545f:f984:753e:4bcc])
        by smtp.gmail.com with ESMTPSA id q193sm15009717pfq.127.2020.09.07.03.28.19
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 07 Sep 2020 03:28:22 -0700 (PDT)
From:   Gene Chen <gene.chen.richtek@gmail.com>
To:     jacek.anaszewski@gmail.com, pavel@ucw.cz, robh+dt@kernel.org,
        matthias.bgg@gmail.com
Cc:     dmurphy@ti.com, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        gene_chen@richtek.com, Wilma.Wu@mediatek.com,
        shufan_lee@richtek.com, cy_huang@richtek.com,
        benjamin.chao@mediatek.com
Subject: [PATCH v3 2/2] dt-bindings: leds: Add bindings for MT6360 LED
Date:   Mon,  7 Sep 2020 18:27:39 +0800
Message-Id: <1599474459-20853-3-git-send-email-gene.chen.richtek@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1599474459-20853-1-git-send-email-gene.chen.richtek@gmail.com>
References: <1599474459-20853-1-git-send-email-gene.chen.richtek@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

From: Gene Chen <gene_chen@richtek.com>

Add bindings document for LED support on MT6360 PMIC

Signed-off-by: Gene Chen <gene_chen@richtek.com>
---
 .../devicetree/bindings/leds/leds-mt6360.yaml      | 105 +++++++++++++++++++++
 1 file changed, 105 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-mt6360.yaml

diff --git a/Documentation/devicetree/bindings/leds/leds-mt6360.yaml b/Documentation/devicetree/bindings/leds/leds-mt6360.yaml
new file mode 100644
index 0000000..72914c6
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/leds-mt6360.yaml
@@ -0,0 +1,105 @@
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
+  The LED controller is represented as a sub-node of the PMIC node on
+  the device tree.
+  This device has six current sinks.
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
+    description: |
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

