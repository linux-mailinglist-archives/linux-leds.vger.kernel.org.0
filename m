Return-Path: <linux-leds+bounces-6457-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B6C6CD3B73
	for <lists+linux-leds@lfdr.de>; Sun, 21 Dec 2025 05:20:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1CE61300FE0F
	for <lists+linux-leds@lfdr.de>; Sun, 21 Dec 2025 04:20:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E98F21E097;
	Sun, 21 Dec 2025 04:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JabZMid0"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2697F19C540
	for <linux-leds@vger.kernel.org>; Sun, 21 Dec 2025 04:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766290829; cv=none; b=l2cvYWnPnP7WM9P/ItvE55jBoW4hhcgReA3NEYSck6y0lZ0NG6AB8fM4yu3gN/XxaN3z6kgMSc69r7McGou0DHieWKh7mrzpACHnBKz5uFGeh2ICtL17pxQUzBmWESqGcaGMReDHfcsgiCfr6qOoEuDNOraD7tHnDf0KrXTw2gs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766290829; c=relaxed/simple;
	bh=kxvIpbUgvslFpHuyxurwqgQcXHL029H34uofMySvB2E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=iuZTQ1O9URosHerMbq9PUfaSIC2+gGeAmpL8Y6gb2PRQSjctVvKEZPfa5Z/MzGd6ATpA0xKCdxLrHj6u7yBYD5Cqo6Z0I2imFYGNeatBpECS4Hkj5OlH297df0aVRnRGL7nJo8BePcWXH7oog3JccgG6t+qdt+ycbeTXtPU09gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JabZMid0; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2a0d5c365ceso37475865ad.3
        for <linux-leds@vger.kernel.org>; Sat, 20 Dec 2025 20:20:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766290827; x=1766895627; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e3unxyl0KTpbTfaWEmAlF0bEaP21z5y6mnXhjxR3yaQ=;
        b=JabZMid0iNDhd2sLQ1toCSHe+9YHtfwaEKIADQyrhG7qR+iom9+ApxMEDhF7Sl69qf
         YRClinjP+JIfNEIZEMUn1W2xXrqBjsB7+jU8vYwWdw1AS1s0mndw45eLLAVAr0j5BiVB
         BafQ49mhw+MuSp/Bo7CAD50k+EDqrDaODTXBrV2b1rCntSfGCQDf5doywZ0055uBt2Sw
         Jt7MKxeS2PNG/qAicewWVM0QS7jf8QVjKK7F87UT4qH0L6AJErEInTePCxY9JTh2ABV+
         Tvl1u+h2X9kU9RdpiDzg61HGHBznqeUEhluHjRclvK3v1qqWVEV+vnOfUV377oXQ4yOf
         Mbjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766290827; x=1766895627;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=e3unxyl0KTpbTfaWEmAlF0bEaP21z5y6mnXhjxR3yaQ=;
        b=qmRjORyAQ9rROdrjLZjQDjGY04rifvxULry7iZwBnIKm4AL42Yw/2+p2+gsofHXdAB
         1b06QR9kx79w6TJ/w2JnOJrZE0jcQHVjH6gr67Fkj95gcZFjd4S/laCnjv4O0nxj/BSo
         pUhCMjHMO+51+BdWr5hX/6Qux1pj26PuSnB66jQcqhKcoyTKh1ax9t9mQDtBy2J2ypmM
         Z7H/EEiQK5IzIx+Htj6Z47u4zS7qy42TgYJD86J0XWiFmTBPBfVqDGvvQmPJmO6/Ashb
         Mv7q4R8LeUOxonLwbyNG/nYhBztm1vIKdjNH14s+j1Q5xgYVzDGHH1VD8xWQHEFPFfs2
         cHOA==
X-Forwarded-Encrypted: i=1; AJvYcCWp5ukANqZOFXIOY/zTPD7gBidWvKEwMUQTAH2uC/5w5Lwxjs+p7EhWSoR14dSKSAXcH3NcfnaUD/5R@vger.kernel.org
X-Gm-Message-State: AOJu0YwzgJvaLni5jU/KSkO+WeeXTC4Ih5tdGMNUyjHSh+hfZjHSrutw
	Tha2ovE9pcdFeiM6oTGaCWDS4OdFIn4P96GZBQ4C5ksETYC1GJ3PVIZ/
X-Gm-Gg: AY/fxX6UX6MgQ2XfY3IHGGi0QpD+5hGAhC8O/ISjsnPEUmXLxmXUyRsYk3nQLo/QbYi
	86Cs6s5tS8Vaa5zX/THG0M+yok9FUCkr5s8dahXxeP6Et1lfvHKw4VjgN0/Xe/ppKYCW8OXJoc/
	FYUwN/PJ50fVVcPQ9eQdIbS03f0QnH3HY7Val34rP/fKJtJtMYdMothre8tJmNOTnBbRND0bb8L
	F6p30eetnum+AvbC0KCf1a94ynFiwLGsxunU8LrPQnV0tK0aPpXKuww3s6X2wsfW6fv44WkHKmp
	bIh9wDd0yImq4pp42V7y47wGNeDkSO9W8LvdwWr70NjiVztvHueVw4QLDaiWDaAZr0oaTZPg6hg
	sJfRYOxsKsoxcn5bIr0DGNC9863HYoC2dgXgCZd9tCF9vmWQNRXlb/OHOuBNubiIldhuHVvY2St
	ixS7wDU7sVZ51nSeFj3P6ECbc8cNWSMcVqgA==
X-Google-Smtp-Source: AGHT+IFztACcGCaNDp2RZ/Gb4OUoZiBRSASJSq9iKgv66pH4oWOR55ktnOK9hdLDA4b3P7FCZyfNkA==
X-Received: by 2002:a17:902:e552:b0:2a0:8360:3a74 with SMTP id d9443c01a7336-2a2f2835cfdmr55972695ad.51.1766290827400;
        Sat, 20 Dec 2025 20:20:27 -0800 (PST)
Received: from localhost.localdomain ([14.255.43.222])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d4cb90sm62319245ad.51.2025.12.20.20.20.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Dec 2025 20:20:26 -0800 (PST)
From: Nam Tran <trannamatk@gmail.com>
To: lee@kernel.org
Cc: pavel@kernel.org,
	gregkh@linuxfoundation.org,
	rdunlap@infradead.org,
	christophe.jaillet@wanadoo.fr,
	krzk+dt@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	corbet@lwn.net,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Nam Tran <trannamatk@gmail.com>
Subject: [PATCH v20 1/3] dt-bindings: leds: add TI/National Semiconductor LP5812 LED Driver
Date: Sun, 21 Dec 2025 11:19:48 +0700
Message-Id: <20251221041950.4631-2-trannamatk@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251221041950.4631-1-trannamatk@gmail.com>
References: <20251221041950.4631-1-trannamatk@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The LP5812 is a 4x3 RGB LED driver with an autonomous animation
engine and time-cross-multiplexing (TCM) support for up to 12 LEDs
or 4 RGB LEDs. It supports both analog (256 levels) and PWM (8-bit)
dimming, including exponential PWM for smooth brightness control.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Nam Tran <trannamatk@gmail.com>
---
 .../devicetree/bindings/leds/ti,lp5812.yaml   | 246 ++++++++++++++++++
 MAINTAINERS                                   |   6 +
 2 files changed, 252 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/ti,lp5812.yaml

diff --git a/Documentation/devicetree/bindings/leds/ti,lp5812.yaml b/Documentation/devicetree/bindings/leds/ti,lp5812.yaml
new file mode 100644
index 000000000000..de34bff441c7
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/ti,lp5812.yaml
@@ -0,0 +1,246 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/ti,lp5812.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: TI LP5812 4x3 Matrix RGB LED Driver with Autonomous Control
+
+maintainers:
+  - Nam Tran <trannamatk@gmail.com>
+
+description: |
+  The LP5812 is a 4x3 matrix RGB LED driver with I2C interface
+  and autonomous animation engine control.
+  For more product information please see the link below:
+  https://www.ti.com/product/LP5812#tech-docs
+
+properties:
+  compatible:
+    const: ti,lp5812
+
+  reg:
+    maxItems: 1
+
+  ti,scan-mode:
+    description: |
+      Selects the LED scan mode of the LP5812. The device supports
+      three modes:
+        - Direct-drive mode (by default if 'ti,scan-mode' is omitted)
+        drives up to 4 LEDs directly by internal current sinks (LED0-LED3).
+        - TCM-drive mode ("tcm:<n>:<order...>") drives up to 12 LEDs
+        (4 RGB) using 1-4 scan multiplexing. The <n> specifies the number
+        of scans (1-4), and <order...> defines the scan order of the outputs.
+        - Mix-drive mode ("mix:<n>:<direct>:<order...>") combines
+        direct-drive and TCM-drive outputs. The <n> specifies the number
+        of scans, <direct> selects the direct-drive outputs, and <order...>
+        defines the scan order.
+    $ref: /schemas/types.yaml#/definitions/string
+    pattern: '^(tcm|mix):[1-4](:[0-3]){1,4}$'
+
+  vcc-supply:
+    description: Regulator providing power to the 'VCC' pin.
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+patternProperties:
+  "^led@[0-3]$":
+    type: object
+    $ref: common.yaml#
+    unevaluatedProperties: false
+
+    properties:
+      reg:
+        minimum: 0
+        maximum: 3
+
+    required:
+      - reg
+
+  "^multi-led@[4-7]$":
+    type: object
+    $ref: leds-class-multicolor.yaml#
+    unevaluatedProperties: false
+
+    properties:
+      reg:
+        minimum: 4
+        maximum: 7
+
+      "#address-cells":
+        const: 1
+
+      "#size-cells":
+        const: 0
+
+    patternProperties:
+      "^led@[4-9a-f]$":
+        type: object
+        $ref: common.yaml#
+        unevaluatedProperties: false
+
+        properties:
+          reg:
+            minimum: 4
+            maximum: 15
+
+        required:
+          - reg
+
+required:
+  - compatible
+  - reg
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
+        led-controller@1b {
+            #address-cells = <1>;
+            #size-cells = <0>;
+            compatible = "ti,lp5812";
+            reg = <0x1b>;
+            ti,scan-mode = "tcm:4:0:1:2:3";
+            vcc-supply = <&vdd_3v3_reg>;
+
+            led@0 {
+                reg = <0x0>;
+                label = "LED0";
+                led-max-microamp = <25500>;
+            };
+
+            led@1 {
+                reg = <0x1>;
+                label = "LED1";
+                led-max-microamp = <25500>;
+            };
+
+            led@2 {
+                reg = <0x2>;
+                label = "LED2";
+                led-max-microamp = <25500>;
+            };
+
+            led@3 {
+                reg = <0x3>;
+                label = "LED3";
+                led-max-microamp = <25500>;
+            };
+
+            multi-led@4 {
+                #address-cells = <1>;
+                #size-cells = <0>;
+                reg = <0x4>;
+                color = <LED_COLOR_ID_RGB>;
+                label = "LED_A";
+
+                led@4 {
+                    reg = <0x4>;
+                    color = <LED_COLOR_ID_GREEN>;
+                    led-max-microamp = <25500>;
+                };
+
+                led@5 {
+                    reg = <0x5>;
+                    color = <LED_COLOR_ID_RED>;
+                    led-max-microamp = <25500>;
+                };
+
+                led@6 {
+                    reg = <0x6>;
+                    color = <LED_COLOR_ID_BLUE>;
+                    led-max-microamp = <25500>;
+                };
+            };
+
+            multi-led@5 {
+                #address-cells = <1>;
+                #size-cells = <0>;
+                reg = <0x5>;
+                color = <LED_COLOR_ID_RGB>;
+                label = "LED_B";
+
+                led@7 {
+                    reg = <0x7>;
+                    color = <LED_COLOR_ID_GREEN>;
+                    led-max-microamp = <25500>;
+                };
+
+                led@8 {
+                    reg = <0x8>;
+                    color = <LED_COLOR_ID_RED>;
+                    led-max-microamp = <25500>;
+                };
+
+                led@9 {
+                    reg = <0x9>;
+                    color = <LED_COLOR_ID_BLUE>;
+                    led-max-microamp = <25500>;
+                };
+            };
+
+            multi-led@6 {
+                #address-cells = <1>;
+                #size-cells = <0>;
+                reg = <0x6>;
+                color = <LED_COLOR_ID_RGB>;
+                label = "LED_C";
+
+                led@a {
+                    reg = <0xa>;
+                    color = <LED_COLOR_ID_GREEN>;
+                    led-max-microamp = <25500>;
+                };
+
+                led@b {
+                    reg = <0xb>;
+                    color = <LED_COLOR_ID_RED>;
+                    led-max-microamp = <25500>;
+                };
+
+                led@c {
+                    reg = <0xc>;
+                    color = <LED_COLOR_ID_BLUE>;
+                    led-max-microamp = <25500>;
+                };
+            };
+
+            multi-led@7 {
+                #address-cells = <1>;
+                #size-cells = <0>;
+                reg = <0x7>;
+                color = <LED_COLOR_ID_RGB>;
+                label = "LED_D";
+
+                led@d {
+                    reg = <0xd>;
+                    color = <LED_COLOR_ID_GREEN>;
+                    led-max-microamp = <25500>;
+                };
+
+                led@e {
+                    reg = <0xe>;
+                    color = <LED_COLOR_ID_RED>;
+                    led-max-microamp = <25500>;
+                };
+
+                led@f {
+                    reg = <0xf>;
+                    color = <LED_COLOR_ID_BLUE>;
+                    led-max-microamp = <25500>;
+                };
+            };
+        };
+    };
+
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 5b11839cba9d..e9f5325e841a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25836,6 +25836,12 @@ S:	Supported
 F:	Documentation/devicetree/bindings/iio/dac/ti,dac7612.yaml
 F:	drivers/iio/dac/ti-dac7612.c
 
+TEXAS INSTRUMENTS' LP5812 RGB LED DRIVER
+M:	Nam Tran <trannamatk@gmail.com>
+L:	linux-leds@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/leds/ti,lp5812.yaml
+
 TEXAS INSTRUMENTS' LB8864 LED BACKLIGHT DRIVER
 M:	Alexander Sverdlin <alexander.sverdlin@siemens.com>
 L:	linux-leds@vger.kernel.org
-- 
2.25.1


