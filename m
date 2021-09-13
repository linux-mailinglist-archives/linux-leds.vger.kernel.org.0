Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D55C3409CFA
	for <lists+linux-leds@lfdr.de>; Mon, 13 Sep 2021 21:28:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242691AbhIMT3h (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 13 Sep 2021 15:29:37 -0400
Received: from mail-ot1-f42.google.com ([209.85.210.42]:33602 "EHLO
        mail-ot1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242460AbhIMT3h (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 13 Sep 2021 15:29:37 -0400
Received: by mail-ot1-f42.google.com with SMTP id c42-20020a05683034aa00b0051f4b99c40cso14920011otu.0;
        Mon, 13 Sep 2021 12:28:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bo3Y3YQ371Z883tMU4VrZy4L5Q9VAxUq7LbWOjVoWos=;
        b=Vxk9k7iY6UFpiF5H1Shaq3aHPwyc6dvR0/5F8MAMHQWpqq9KvkoxPnlmwnCQTlbEsr
         vmgSxCYobQTbLzdLrzU4I9vHyWENMdrlTSEa/e/tXbtrHdXwE1CWhDQP6fUAOlEsU1iK
         LJGrWXFF6TPC8TTXNCjD4+zNbGclR9e0/y7qkQHaDJ0pD0ezRetzU+QNIrfbg+9qu8ve
         c3eXK+WZThUamTUdo2FZ5d21PZxF9Hfb0fZ+/wAXmGw9PxFxPOiLalfbgPI+4z54npJZ
         nmRrAt2Zkg65mxwhWQeFRGHYz/MWktj0eMZM4laqEhnBiKYatF2LU5gqcF8w2HPSAmti
         JvGA==
X-Gm-Message-State: AOAM5333AJ2l5RjA1xekSo6izySCYFgM0cMD0RnrCUT7wp4KSOE9DfwC
        1mV9WM6Dcqku91XR6sJhpw==
X-Google-Smtp-Source: ABdhPJy6jaYywW1V07gad8tmv5Sw6LtKfCn4pRXceEdBmalCy8UAA3XdyeV0WbWobplmHwvk1MAUew==
X-Received: by 2002:a9d:410:: with SMTP id 16mr11271688otc.83.1631561300488;
        Mon, 13 Sep 2021 12:28:20 -0700 (PDT)
Received: from xps15.herring.priv (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.googlemail.com with ESMTPSA id m24sm1907838oie.50.2021.09.13.12.28.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Sep 2021 12:28:19 -0700 (PDT)
From:   Rob Herring <robh@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>, Pavel Machek <pavel@ucw.cz>
Cc:     Liviu Dudau <liviu.dudau@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-leds@vger.kernel.org
Subject: [PATCH v2 1/8] dt-bindings: leds: Convert register-bit-led binding to DT schema
Date:   Mon, 13 Sep 2021 14:28:09 -0500
Message-Id: <20210913192816.1225025-2-robh@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210913192816.1225025-1-robh@kernel.org>
References: <20210913192816.1225025-1-robh@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Convert the register-bit-led binding to DT schema format.

As the example just repeats nearly identical nodes, trim it down to a
few nodes and use some documented values for 'linux,default-trigger'.

Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Pavel Machek <pavel@ucw.cz>
Cc: linux-leds@vger.kernel.org
Signed-off-by: Rob Herring <robh@kernel.org>

---
v2:
 - Drop undocumented linux,default-trigger values
---
 .../bindings/leds/register-bit-led.txt        | 94 -------------------
 .../bindings/leds/register-bit-led.yaml       | 78 +++++++++++++++
 2 files changed, 78 insertions(+), 94 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/leds/register-bit-led.txt
 create mode 100644 Documentation/devicetree/bindings/leds/register-bit-led.yaml

diff --git a/Documentation/devicetree/bindings/leds/register-bit-led.txt b/Documentation/devicetree/bindings/leds/register-bit-led.txt
deleted file mode 100644
index c7af6f70a97b..000000000000
--- a/Documentation/devicetree/bindings/leds/register-bit-led.txt
+++ /dev/null
@@ -1,94 +0,0 @@
-Device Tree Bindings for Register Bit LEDs
-
-Register bit leds are used with syscon multifunctional devices
-where single bits in a certain register can turn on/off a
-single LED. The register bit LEDs appear as children to the
-syscon device, with the proper compatible string. For the
-syscon bindings see:
-Documentation/devicetree/bindings/mfd/syscon.yaml
-
-Each LED is represented as a sub-node of the syscon device. Each
-node's name represents the name of the corresponding LED.
-
-LED sub-node properties:
-
-Required properties:
-- compatible : must be "register-bit-led"
-- offset : register offset to the register controlling this LED
-- mask : bit mask for the bit controlling this LED in the register
-  typically 0x01, 0x02, 0x04 ...
-
-Optional properties:
-- label : (optional)
-  see Documentation/devicetree/bindings/leds/common.txt
-- linux,default-trigger : (optional)
-  see Documentation/devicetree/bindings/leds/common.txt
-- default-state: (optional) The initial state of the LED
-  see Documentation/devicetree/bindings/leds/common.txt
-
-Example:
-
-syscon: syscon@10000000 {
-	compatible = "arm,realview-pb1176-syscon", "syscon";
-	reg = <0x10000000 0x1000>;
-
-	led@8.0 {
-		compatible = "register-bit-led";
-		offset = <0x08>;
-		mask = <0x01>;
-		label = "versatile:0";
-		linux,default-trigger = "heartbeat";
-		default-state = "on";
-	};
-	led@8.1 {
-		compatible = "register-bit-led";
-		offset = <0x08>;
-		mask = <0x02>;
-		label = "versatile:1";
-		linux,default-trigger = "mmc0";
-		default-state = "off";
-	};
-	led@8.2 {
-		compatible = "register-bit-led";
-		offset = <0x08>;
-		mask = <0x04>;
-		label = "versatile:2";
-		linux,default-trigger = "cpu0";
-		default-state = "off";
-	};
-	led@8.3 {
-		compatible = "register-bit-led";
-		offset = <0x08>;
-		mask = <0x08>;
-		label = "versatile:3";
-		default-state = "off";
-	};
-	led@8.4 {
-		compatible = "register-bit-led";
-		offset = <0x08>;
-		mask = <0x10>;
-		label = "versatile:4";
-		default-state = "off";
-	};
-	led@8.5 {
-		compatible = "register-bit-led";
-		offset = <0x08>;
-		mask = <0x20>;
-		label = "versatile:5";
-		default-state = "off";
-	};
-	led@8.6 {
-		compatible = "register-bit-led";
-		offset = <0x08>;
-		mask = <0x40>;
-		label = "versatile:6";
-		default-state = "off";
-	};
-	led@8.7 {
-		compatible = "register-bit-led";
-		offset = <0x08>;
-		mask = <0x80>;
-		label = "versatile:7";
-		default-state = "off";
-	};
-};
diff --git a/Documentation/devicetree/bindings/leds/register-bit-led.yaml b/Documentation/devicetree/bindings/leds/register-bit-led.yaml
new file mode 100644
index 000000000000..77ba0b824c15
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/register-bit-led.yaml
@@ -0,0 +1,78 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/register-bit-led.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Device Tree Bindings for Register Bit LEDs
+
+maintainers:
+  - Linus Walleij <linus.walleij@linaro.org>
+
+description: |+
+  Register bit leds are used with syscon multifunctional devices where single
+  bits in a certain register can turn on/off a single LED. The register bit LEDs
+  appear as children to the syscon device, with the proper compatible string.
+  For the syscon bindings see:
+  Documentation/devicetree/bindings/mfd/syscon.yaml
+
+allOf:
+  - $ref: /schemas/leds/common.yaml#
+
+properties:
+  compatible:
+    const: register-bit-led
+
+  mask:
+    description:
+      bit mask for the bit controlling this LED in the register
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum:
+      [ 0x1, 0x2, 0x4, 0x8, 0x10, 0x20, 0x40, 0x80, 0x100, 0x200, 0x400, 0x800,
+        0x1000, 0x2000, 0x4000, 0x8000, 0x10000, 0x20000, 0x40000, 0x80000,
+        0x100000, 0x200000, 0x400000, 0x800000, 0x1000000, 0x2000000, 0x4000000,
+        0x8000000, 0x10000000, 0x20000000, 0x40000000, 0x80000000 ]
+
+  offset:
+    description:
+      register offset to the register controlling this LED
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+required:
+  - compatible
+  - mask
+  - offset
+
+unevaluatedProperties: false
+
+examples:
+  - |
+
+    syscon@10000000 {
+        compatible = "arm,realview-pb1176-syscon", "syscon";
+        reg = <0x10000000 0x1000>;
+
+        led@8.0 {
+            compatible = "register-bit-led";
+            offset = <0x08>;
+            mask = <0x01>;
+            label = "versatile:0";
+            linux,default-trigger = "heartbeat";
+            default-state = "on";
+        };
+        led@8.1 {
+            compatible = "register-bit-led";
+            offset = <0x08>;
+            mask = <0x02>;
+            label = "versatile:1";
+            default-state = "off";
+        };
+        led@8.2 {
+            compatible = "register-bit-led";
+            offset = <0x08>;
+            mask = <0x04>;
+            label = "versatile:2";
+            default-state = "off";
+        };
+    };
+...
-- 
2.30.2

