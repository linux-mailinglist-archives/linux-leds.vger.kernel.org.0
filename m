Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9B52C17BF4A
	for <lists+linux-leds@lfdr.de>; Fri,  6 Mar 2020 14:40:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727000AbgCFNkz (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 6 Mar 2020 08:40:55 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:54755 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726887AbgCFNky (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 6 Mar 2020 08:40:54 -0500
Received: by mail-wm1-f68.google.com with SMTP id i9so2453505wml.4
        for <linux-leds@vger.kernel.org>; Fri, 06 Mar 2020 05:40:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=TqwPKVWpDrYVmu/Cm/Bmq2S/VPK7PgKiVqGEdY3cJqk=;
        b=WPUQj8kZJMXrcKqH/Ng/QOr/NbXP/iPjfR0rEVKAN8Ci3+AHvBaOZzWdhaRASufX3p
         k2YKlWwfaTN9YnFshsEKsjAdx6xTe76vSuC1joaK1J9amqtbOtZCo6A4ygS44kMJozyp
         hN/PmyyGLKp9+NdaJj7yOoIGKwFdJXjwz+QUFvFeoZLD34NMimL5So4q96ciNcvf1YYC
         hbe02WKVfoKKOPOHKsXl4AKT0hh/tOsEaHI6xGWMtboZib7fSF+u+nfafTlH+6azZ81+
         HcGybrHlgyaplqnj0MvRdIY6qFlGlbf8gckVLlWmoZt1Xm7i8xcL/jUPCGQmnlcvjwj+
         4ePA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=TqwPKVWpDrYVmu/Cm/Bmq2S/VPK7PgKiVqGEdY3cJqk=;
        b=dL7c/VFknypddK7r6jF3udTB/TrLrQ6zNS26KUV3YybFcnvjhwcIkX5xtlpXUz14W/
         3/HDmjviLGxkRf0t59v7rY4Ni4njO1BKGiltjTBKai6M34KQJaiuJCkSuhdJ484onO+S
         Y+9S4SmQXMoa7KFYJXwc0MiQN1l2r3A1+5Dd9IOyWajYgmE1zOgliTfluxFnhyUduz2f
         PS/23Jk3X2OvpT6VRnKSceGuVc8BOjNVJT33hMImN/3s1JdfuWMHuh/wmGOS0kQoMui3
         a9z9Dl2TW79rQmB3MXzTtImGL49qZ3+y8TTT3qb6uI84Tpgh5b+2p/9BxMxKg4SjVSg+
         I1FQ==
X-Gm-Message-State: ANhLgQ1lNzyoolrV3a+iCi+Ct/vo8aH1jSfUkFo7/HTn/wASBI9hKIWo
        6BSb9Ozga8/M4KSaD0mLo1ZfRA==
X-Google-Smtp-Source: ADFU+vvxe2j0UhSXyb8tLoax6/Do2GBZydw/5eIHY4+nyFEx3t1nxI5f72UnPGv/mwksi7MziuPRew==
X-Received: by 2002:a1c:488b:: with SMTP id v133mr3967539wma.159.1583502052708;
        Fri, 06 Mar 2020 05:40:52 -0800 (PST)
Received: from localhost.localdomain (89-82-119-43.abo.bbox.fr. [89.82.119.43])
        by smtp.gmail.com with ESMTPSA id g7sm47178086wrm.72.2020.03.06.05.40.51
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Fri, 06 Mar 2020 05:40:52 -0800 (PST)
From:   Nicolas Belin <nbelin@baylibre.com>
To:     linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        jacek.anaszewski@gmail.com, pavel@ucw.cz, dmurphy@ti.com,
        devicetree@vger.kernel.org
Cc:     baylibre-upstreaming@groups.io, Nicolas Belin <nbelin@baylibre.com>
Subject: [PATCH v3 2/3] dt-bindings: leds: Shiji Lighting APA102C LED
Date:   Fri,  6 Mar 2020 14:40:09 +0100
Message-Id: <1583502010-16210-3-git-send-email-nbelin@baylibre.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1583502010-16210-1-git-send-email-nbelin@baylibre.com>
References: <1583502010-16210-1-git-send-email-nbelin@baylibre.com>
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Document Shiji Lighting APA102C LED driver device tree bindings.

Signed-off-by: Nicolas Belin <nbelin@baylibre.com>
---
 .../devicetree/bindings/leds/leds-apa102c.yaml     | 97 ++++++++++++++++++++++
 1 file changed, 97 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-apa102c.yaml

diff --git a/Documentation/devicetree/bindings/leds/leds-apa102c.yaml b/Documentation/devicetree/bindings/leds/leds-apa102c.yaml
new file mode 100644
index 000000000000..21457fc3762d
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/leds-apa102c.yaml
@@ -0,0 +1,97 @@
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
+  Each RGB LED is represented as a rgb-led sub-node of the leds-apa102c
+  device.  Each LED is a three color rgb LED with an additional 32 levels
+  brightness adjustment. They can be cascaded so that multiple LEDs can be set
+  with a single command.
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
+patternProperties:
+  "^rgb-led@[0-9]+$":
+    type: object
+    description: |
+      Array of connected RGB LEDs.
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
+          This property corresponds to the name of the RGB led.
+        maxItems: 1
+
+      linux,default-trigger: true
+
+      "#address-cells":
+        const: 1
+
+      "#size-cells":
+        const: 0
+
+    required:
+      - reg
+      - label
+      - '#address-cells'
+      - '#size-cells'
+
+required:
+  - compatible
+  - reg
+  - spi-max-frequency
+  - '#address-cells'
+  - '#size-cells'
+
+examples:
+  - |
+    spi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        led-controller@0 {
+            compatible = "shiji,apa102c";
+            reg = <0>;
+            spi-max-frequency = <1000000>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+            rgb-led@0 {
+                #address-cells = <1>;
+                #size-cells = <0>;
+                reg = <0>;
+                label = "rgb_led1";
+            };
+            rgb-led@1 {
+                #address-cells = <1>;
+                #size-cells = <0>;
+                reg = <1>;
+                label = "rgb_led2";
+            };
+        };
+    };
-- 
2.7.4

