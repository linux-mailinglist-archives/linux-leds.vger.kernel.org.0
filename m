Return-Path: <linux-leds+bounces-6613-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 87A67D0F012
	for <lists+linux-leds@lfdr.de>; Sun, 11 Jan 2026 14:55:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DBE9E3002B89
	for <lists+linux-leds@lfdr.de>; Sun, 11 Jan 2026 13:55:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B26C33C19C;
	Sun, 11 Jan 2026 13:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UA26ASya"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C488833AD81
	for <linux-leds@vger.kernel.org>; Sun, 11 Jan 2026 13:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768139758; cv=none; b=EbmwU/6kBPLs55z2Bu5g+6tVdf3tkqoUmx3NWkpxKYcTRCPS/8XmhWmSMvJidBJ9a1X8HwAU9X/pUirHT60cFkRnlUlkrOL26tii5DdeYINl03RtI+6cGqNpcdskAwZAcShdCpWxMpiUJGkr9iSxxuwebYlkDCwUTVHXyQhd94U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768139758; c=relaxed/simple;
	bh=Y8pp+445RIVWu7vBRaGE4pPYbhVVC0J0Gt7BRVRtFYc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Ool/b9xgwcxJ03tXAD0WMHCXfeX9fcSQJrNcrOJYEClh2H0216E26MJXR5RUu9litdTlvnYLBJh4R0wFLxrCIzcivEPrq45Vam+IKzEfs+6N02bXkY943adDs9KRbnV8JknORxaODtV4+yC7nAZER45Cdre2E+t/hsL3udH6nPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UA26ASya; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-34f0bc64a27so2763835a91.1
        for <linux-leds@vger.kernel.org>; Sun, 11 Jan 2026 05:55:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768139756; x=1768744556; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yTJzynibUu6Eyr0xyfqs0kTjjIEhzOxoeblxQjXiJgI=;
        b=UA26ASya+tWnf3YtnW8Hi56TsRzQaKSJ6cpPTTgz/0OLlMnLVFaTPLHLUwNT1uFVJ1
         QXw7mtyrqzq+DHuofsYtsDnYZ7IlWtOso0xcG26lG6LOb7gJLGlwjs55ruoa6muTGloh
         ukOgLf7+1LPsM5N+0nXHvh+BUSPae77QWgde9/RBx9Re3TG0cm6xcy2B5Vfr/7tg9FUS
         sGaC1zmkpvaIX7xnkxaGxQyDbjGN7gXy0QLcoVXRvMC0OzLaozGUHhBLlvbLzAN62APf
         hU04p5mqvTrgNMY05t5/QSbH+nlbHNfKqb91eIREj7qoBKP/EzqvrKQ26SYuAmxDMRBb
         /p8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768139756; x=1768744556;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yTJzynibUu6Eyr0xyfqs0kTjjIEhzOxoeblxQjXiJgI=;
        b=MSatKa2Dq9uix5i+5+noo0Xs8rSdhZmkeWNo+RnHYW+e5xYMI+QAfcrrmNa0SqnCqw
         +lVaLes8pqVjPugGo7rTrefAg5AjpBRQh5hJq3PSwkuJ5TjRvYd1pwpo3tVlPKfDrqnz
         pKIoWb2ahvY/PVNxiT8kgSB94epbL6QiaFCB/3+vdYGBSlh60DlxZts91qbBHt+EsCy6
         2vSWoKzsQnNZsT1cHZuGf4r5fPGjvzaeblvXQJRo4ZHf/FB2J7lD/zDheTBE3I3RhkbO
         hTuBX+nsJ3UzQSRWqIXvkw8q/45ohyWMSsX38YWTNZglDU6qwsR1IbQK2Ge8xl8CJop0
         Miug==
X-Forwarded-Encrypted: i=1; AJvYcCVtIotidGMfB1VMjkjAnR7bVicT6g03ANl6GOO2cok08dpJwwKLMB/BbkROVUS/BOYEIlI0s1ymzMjv@vger.kernel.org
X-Gm-Message-State: AOJu0YwJ4ilw8Nm0m5Z7v5XSzRHlNriJY4weTs32qAcjIp4m96Vf27gc
	FJZImP44rpGF0DiQsydUS594o8mxq4tZyTmQS6OI2aOYtjh5jMSAXeGn
X-Gm-Gg: AY/fxX5oG7HOUEHE1awSQoffAAt/AnGL2QKZZWcE/H9zeoD9FWxfJkQ7eEsivIEQpvh
	WYsFw7vC8Dkczn7OEq+Mmt9pIDg0sGzxlbrc1t+aK5MH0ZOT6up7aTEVc7qvCX9rmOs0VPItb4B
	ZeBLC1gq6Cv89ARbnJMeNU1AvxwHzieeLSTuisoKJsMWDuHzLRAFKk1h/pgamlUH+ZJXncM4nyc
	mqNaaKT7eDYE2UfRWDxlJp6qLZ1GdwRT0gN13olAEut/nHtMysNovd04qtBCUCdI4KsHKJxBzxH
	YFVvGD2jCM+kuv6FHaA6VG3cTR6Fo5KV9YUXOvhvhyHPstbNNRkylofMcH5X+QKBSI0JGUXN134
	eqdjnI/fXeCMBhYQiBwOqO1mH4J7uAHVqvNWERNHWmEpUZwkxyjUc14Jzit9cTbMWN2O0FxBoaj
	X5+hKsiy0a0LdRanM7lwtP0FpA3Lbrtrxz9Ow=
X-Google-Smtp-Source: AGHT+IH0VKHU22ZlAYnONfG6Ge/Tu/VCfrqHbBaAQcN6RvX6mx0DtXBeZ6R8jt3Q7fpFNVbkt56wkQ==
X-Received: by 2002:a17:90b:3bcf:b0:340:54a1:d6fe with SMTP id 98e67ed59e1d1-34f68b67f8bmr13623819a91.15.1768139756032;
        Sun, 11 Jan 2026 05:55:56 -0800 (PST)
Received: from localhost.localdomain ([113.164.155.57])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34f6b88d984sm5742345a91.3.2026.01.11.05.55.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jan 2026 05:55:55 -0800 (PST)
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
Subject: [PATCH v21 1/3] dt-bindings: leds: add TI/National Semiconductor LP5812 LED Driver
Date: Sun, 11 Jan 2026 20:55:17 +0700
Message-Id: <20260111135519.28112-2-trannamatk@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260111135519.28112-1-trannamatk@gmail.com>
References: <20260111135519.28112-1-trannamatk@gmail.com>
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
index ecae8a5e33cc..5bed369cef1e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25931,6 +25931,12 @@ S:	Supported
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


