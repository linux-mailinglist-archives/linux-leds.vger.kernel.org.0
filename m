Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E944405ED2
	for <lists+linux-leds@lfdr.de>; Thu,  9 Sep 2021 23:31:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347339AbhIIVch (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 9 Sep 2021 17:32:37 -0400
Received: from mail-ot1-f46.google.com ([209.85.210.46]:36574 "EHLO
        mail-ot1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346995AbhIIVcc (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 9 Sep 2021 17:32:32 -0400
Received: by mail-ot1-f46.google.com with SMTP id a20-20020a0568300b9400b0051b8ca82dfcso4398402otv.3;
        Thu, 09 Sep 2021 14:31:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XZ7pdNiqOgozs4sIa1Fm09lGvg3v6sjnT+5ukMfxlmQ=;
        b=CcBD0kyOADMz0Y7cyFUfzjQS7IAj+9cEdfbAq6Mbyk8r/Nc+L2BOxyaKskl288gC86
         T22VYzL42xXXomN8DFUI3B0uPB1ZNCYP+SDTOPK+DEhF3x424/efqN0+SV/VITrhlI1t
         BMvEL1JT3NDh/h7DVxuwMIQNFzkR8YbwgSVsH2etjXYJufnOf13+vmtLzFMIfkasP2tb
         caJWlCfJNH5IZ3H6+8Nr9+kQhzmmwAZ1u/6pKy7M6Lh7ANm77O8xU8Ui3Q07pj1RX+9j
         S5BD96bCsWDbIJLKBZZphBAguiLGvjO0P0gSCJtxtuM0zGkTrW2uDoWk2FrRbj2OsvDl
         Ma7w==
X-Gm-Message-State: AOAM533jicQ4KJ4XpRoOEbypvrxbvfHNUUTyxaqAgqw29T/28bEAnGqD
        qpckJPRVz9BliWs3hAfsqw==
X-Google-Smtp-Source: ABdhPJybD1D9OM/tLF2GBbZE8zvDhyBAWvzthH5DVTf3Vh/yMrKXoogcmmsb3MuL9HQzdf/EgoDHMQ==
X-Received: by 2002:a9d:724a:: with SMTP id a10mr1698337otk.323.1631223081797;
        Thu, 09 Sep 2021 14:31:21 -0700 (PDT)
Received: from xps15.herring.priv (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.googlemail.com with ESMTPSA id m24sm694929oie.50.2021.09.09.14.31.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Sep 2021 14:31:21 -0700 (PDT)
From:   Rob Herring <robh@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>, Pavel Machek <pavel@ucw.cz>
Cc:     Liviu Dudau <liviu.dudau@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-leds@vger.kernel.org
Subject: [PATCH 1/8] dt-bindings: leds: Convert register-bit-led binding to DT schema
Date:   Thu,  9 Sep 2021 16:31:11 -0500
Message-Id: <20210909213118.1087083-2-robh@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210909213118.1087083-1-robh@kernel.org>
References: <20210909213118.1087083-1-robh@kernel.org>
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
 .../bindings/leds/register-bit-led.txt        | 94 -------------------
 .../bindings/leds/register-bit-led.yaml       | 80 ++++++++++++++++
 2 files changed, 80 insertions(+), 94 deletions(-)
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
index 000000000000..4a5bb0aa5f27
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/register-bit-led.yaml
@@ -0,0 +1,80 @@
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
+            linux,default-trigger = "mmc0";
+            default-state = "off";
+        };
+        led@8.2 {
+            compatible = "register-bit-led";
+            offset = <0x08>;
+            mask = <0x04>;
+            label = "versatile:2";
+            linux,default-trigger = "cpu0";
+            default-state = "off";
+        };
+    };
+...
-- 
2.30.2

