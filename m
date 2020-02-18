Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6A930162381
	for <lists+linux-leds@lfdr.de>; Tue, 18 Feb 2020 10:38:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726477AbgBRJiQ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 18 Feb 2020 04:38:16 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:50264 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726464AbgBRJiQ (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 18 Feb 2020 04:38:16 -0500
Received: by mail-wm1-f66.google.com with SMTP id a5so2042752wmb.0
        for <linux-leds@vger.kernel.org>; Tue, 18 Feb 2020 01:38:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=J2jDv5mPh/wztrBD8JuFO2GNdjToyge8eA3je39oTQ8=;
        b=ymSPOrGMZ3vdNGmDuLGiBMiysXcmYf4BcafFPQRUzvESlgSdtpg39G1BdEM8Y91lw0
         RPB+CF/afwEFAsrMK4ucV6iab9rsRUKdSLiHJg9RqIHRJ2HHoofvFnRzqleX2/0pUJSI
         j2SzKiIKLiY2Wba8M6Fp6/1mwAGZFKhiXzmHVzxGf/0IEpY7h4p32Lb9+OSW78Z5L73t
         PlytIgLEmyI4Zsvub4DmYvYFD2ihCZoOJmyeEvij86gBrbJQNltB/P63w1n6/GPE0HKI
         bRudZgxS4Vgtkkmdw/+n3gj7bi+ctbKamTFpqcimjOhKUIusnR9LQ8yI9LFmYvHrhqaY
         EGRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=J2jDv5mPh/wztrBD8JuFO2GNdjToyge8eA3je39oTQ8=;
        b=jkOitKz9qPzLr9eJAgmfHt22rsjKu6cBIJm+bmH9jJMlkkMy0mgG4OcQB/LHsRsNqq
         BHtd06vGSQlLudvGyqbP0Rj0GBxQkwhSI1BH9ozzH4PHJHLj/4Wlu/ypR2jK8HVd5XDI
         8t+i4CwbIpy0ELXsZGfsFAKIQVUtKjHVNRFaRC8RY7hirCS/mfbRiviBvlZ9LJe68EcP
         bJphccm44/AOzTO2l7aHv0DI8X/r/hSPM0gBwWYvY+wajoTV3oWN2Cujq5VyW3sOWAQ5
         ZBCu7gMKPtKpRN7QtUXwna+MDLeONEtEIe+Qn2V/oCVH86AtkmCRtPWLiHB7voMZEtdO
         XIrw==
X-Gm-Message-State: APjAAAUyANY6kPTdOvjFp5/bpXBtrM1en8iJckI9XrTtpEV/xCIvusx4
        zOqA4iVjHbLP8N+ivpXwDqyeiQ==
X-Google-Smtp-Source: APXvYqzuB/q1Y/Sf9IbKg9NIhdbJ7IS2SSai2skYXkVH6anZrUPimthAstfQ4dtnhLJqwqZYk1EnHA==
X-Received: by 2002:a05:600c:2254:: with SMTP id a20mr1660589wmm.188.1582018692690;
        Tue, 18 Feb 2020 01:38:12 -0800 (PST)
Received: from nbelin-ThinkPad-T470p.baylibre.local (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id f127sm2740626wma.4.2020.02.18.01.38.11
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Tue, 18 Feb 2020 01:38:12 -0800 (PST)
From:   Nicolas Belin <nbelin@baylibre.com>
To:     linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        jacek.anaszewski@gmail.com, pavel@ucw.cz, dmurphy@ti.com
Cc:     Nicolas Belin <nbelin@baylibre.com>
Subject: [PATCH 2/3] dt-bindings: leds: Shiji Lighting APA102C LED driver
Date:   Tue, 18 Feb 2020 10:37:36 +0100
Message-Id: <1582018657-5720-3-git-send-email-nbelin@baylibre.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1582018657-5720-1-git-send-email-nbelin@baylibre.com>
References: <1582018657-5720-1-git-send-email-nbelin@baylibre.com>
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Document Shiji Lighting APA102C LED driver device tree bindings.

Signed-off-by: Nicolas Belin <nbelin@baylibre.com>
---
 .../devicetree/bindings/leds/leds-apa102c.yaml     | 91 ++++++++++++++++++++++
 1 file changed, 91 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-apa102c.yaml

diff --git a/Documentation/devicetree/bindings/leds/leds-apa102c.yaml b/Documentation/devicetree/bindings/leds/leds-apa102c.yaml
new file mode 100644
index 000000000000..24bc2fc19fcb
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/leds-apa102c.yaml
@@ -0,0 +1,91 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/leds-apa102c.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: LED driver for Shiji Lighting - APA102C
+
+maintainers:
+  - Nicolas Belin <nbelin@baylibre.com>
+
+description:
+  Each LED is represented as a sub-node of the leds-apa102c device.  Each LED
+  is a three color RGB LED with 32 levels brightness adjustment that can be
+  cascaded so that multiple LEDs can be set with a single command.
+
+properties:
+  compatible:
+    const: shiji,apa102c
+
+  reg:
+    maxItems: 1
+
+  spi-max-frequency:
+    maximum: 1000000
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - spi-max-frequency
+  - '#address-cells'
+  - '#size-cells'
+
+patternProperties:
+  "^led@[0-9]+$":
+    type: object
+    description: |
+      Properties for an array of connected LEDs.
+
+    properties:
+      reg:
+        description: |
+          This property corresponds to the led index. It has to be between 0
+          and the number of managed leds minus 1
+        maxItems: 1
+
+      label:
+        description: |
+          This property corresponds to the name of the led. If not set,
+          the led index will be used to create the led name instead
+        maxItems: 1
+
+      linux,default-trigger: true
+
+    required:
+      - reg
+
+examples:
+  - |
+    spi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        led-controller@0 {
+            compatible = "shiji,apa102c";
+            reg = <0>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+            spi-max-frequency = <1000000>;
+            led@0 {
+                reg = <0>;
+                label = "led1";
+            };
+
+            led@1 {
+                reg = <1>;
+                label = "led2";
+            };
+
+            led@2 {
+                reg = <2>;
+                label = "led3";
+            };
+        };
+    };
-- 
2.7.4

