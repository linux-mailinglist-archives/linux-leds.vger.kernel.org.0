Return-Path: <linux-leds+bounces-5768-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A4DFBD584C
	for <lists+linux-leds@lfdr.de>; Mon, 13 Oct 2025 19:36:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 46A0218A580B
	for <lists+linux-leds@lfdr.de>; Mon, 13 Oct 2025 17:36:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5423525DAFF;
	Mon, 13 Oct 2025 17:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i8Pt2m+j"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 896003081CD
	for <linux-leds@vger.kernel.org>; Mon, 13 Oct 2025 17:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760376969; cv=none; b=L1NKzXRlr02uoANB0Rwhts5xlWKPRaYVv5E6IL6RjTuHrQ0t7PZ8FW2nGJCyGfJFPzyGTu7Qyagd6NPSbkwLFSW3VjPBGa+s/kYoNdnceSUlNwtRrp840sO4oc9qzuHplv8Oe9D/8PTC4PfizGwtARqoBaNLVep5kEE6lUp5A+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760376969; c=relaxed/simple;
	bh=lo7mAUqB3EMezneUxb5oCt+PWOGA81u/1DzHUg4ukfc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=QjDoKGEwjYrBjEBt4iEvcD+0zEC2wXYo9f1kF9EtN7O4kokZ+6lvOg+aO7wKzFApJmxsqT9mTkVeb15Uj9OQEy70kGgRwkEt/Pf6Bl5wcM4ty3tbVjnCHArUOVFzh2VM9RyE6M7v3Z20liLSSaXo1qMl9pWcclGpl1AvNXLJi+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i8Pt2m+j; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-78f3bfe3f69so3990038b3a.2
        for <linux-leds@vger.kernel.org>; Mon, 13 Oct 2025 10:36:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760376967; x=1760981767; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bYeaFtjHFhiyM2JZ1YDXKq+J4MgMl7+YBzxeolg0MsM=;
        b=i8Pt2m+js3aaLSez6Zi1TuJGAQtR/Mau4BCk3wHWiB5lj+BKWCO7HQS2Mujggi9gga
         5bN0cklZUHULob5Gl7mqIz5wrNKVndilTgrMcj4HgZ1+3pjI4IvZn7H+WdTGYMGKJKtR
         iSb/WIpSpJAdxM8DucKKJUMdgXhadNNxVPt6VgjQ4RQzFQFwX1xJ/DynaiMD3j77g9Jz
         goVp5632TZxfw+7cOH3HYijVgzzH1zVBRRa9EmFX4C+jAr+7QWmmLeDT1Q6S9TwhUQZy
         42Yek5nMGhNBXPc07Fkr2r/Q5IqUqS1Jvfj3gbos0e8Pfx8kJCcXlPcnCPPFiWhAhXv+
         hzqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760376967; x=1760981767;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bYeaFtjHFhiyM2JZ1YDXKq+J4MgMl7+YBzxeolg0MsM=;
        b=SBbukTu5Syx3vYiCyxkyhugk6pKIXhxihGoiABcFAXE2DX7xHvsZPtwbor+QiAKz5U
         jD4g0cGvbR3DKLJU+Oattx1u/COvu+CSzyv+hthULx5SsDGro3AuUH+qbkdYlW85bKYu
         Yum5qhRpUxN1FjkeoacEWwz88miosSjgq6s7qXc4qDLOgIydQvSoBzVbhWDMVD+fd7h6
         89KJCD3wLM84BKC4d+IGWjUILB2Lqu7RvrP4aQecPITHDsNwAmB6fj728mdAq4My8Gxy
         0TWBaMM/5iF7I4iwFmTOHA5PBmRW3r+Aa0woDLoRrkDgiSaD2zeUfolEeS1zaODrRRnW
         qFwg==
X-Forwarded-Encrypted: i=1; AJvYcCXfUd+Wac1Yk/+XljsKeS+Vup+WGOefeZDi7nFn35eDnOu0rpZjjxcaxF4QJupyxKosaO0z9LuNj3Pg@vger.kernel.org
X-Gm-Message-State: AOJu0YxChfi7nOU/TawyvLIvyLof/JGbJ3Cv5B6tW2jCc6lNiFilwhq+
	lVSQ9Kv8Sh14ROoKmxQRWpYPDPr+j28ZubaCZYGtRgLA+f/vcwCBd2z0
X-Gm-Gg: ASbGnctmuo2cAK4nx/a/wh8Mgf1kQ+xMC3uUq5y2LeZ2/raDbOBNON79rXpd+DP2tJe
	KrkQLh4ymS4G2eC2wVlY74teEXMQzwKsBQBlNJt9CToXdApJb2IMJ1b3i6BSqjQE5VfiraLbEd9
	xzleiQYWvs0SYDpXtABpppQCXUNh0TEnPsSbtzj+henJG9HJaw6Ro5RsAwp0/KjZCfb6Oq6pJDC
	leHQoIq7bEDBbr9XF99mcrsMw7JrSE8k2nzalawdyAm8LwFJiMxQ5KZ6SJYh9HoBW4jB3XexD4Q
	FnZB+hIAmneGPgVge4tPyWx/9vwGpjSMSX0mRO9R7sgH5PhC5gpy6vM2UD6BjWWIJadFq8BHcG/
	7jhO+WNKLCgUV8lvv9LtWcCoN6Xj9sU+OY1Yv5dy+lnaYWW1BeHRpltOjhCMu0/ib2Z4lpT83Mg
	==
X-Google-Smtp-Source: AGHT+IE3eujAZOISjflFxdMwam8D2MOe599RLbEmQYKnIgM2jmAubEvEpNjX2Tw4hT+C5+eL4xsb3g==
X-Received: by 2002:a05:6a00:1492:b0:772:4319:e7ed with SMTP id d2e1a72fcca58-793881eb9c5mr26389026b3a.29.1760376966596;
        Mon, 13 Oct 2025 10:36:06 -0700 (PDT)
Received: from DESKTOP-P76LG1N.lan ([42.118.149.214])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992b060754sm12424546b3a.13.2025.10.13.10.36.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 10:36:06 -0700 (PDT)
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
Subject: [PATCH v16 1/3] dt-bindings: leds: add TI/National Semiconductor LP5812 LED Driver
Date: Tue, 14 Oct 2025 00:35:49 +0700
Message-Id: <20251013173551.108205-2-trannamatk@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251013173551.108205-1-trannamatk@gmail.com>
References: <20251013173551.108205-1-trannamatk@gmail.com>
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

Signed-off-by: Nam Tran <trannamatk@gmail.com>
---
 .../devicetree/bindings/leds/ti,lp5812.yaml   | 249 ++++++++++++++++++
 MAINTAINERS                                   |   6 +
 2 files changed, 255 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/ti,lp5812.yaml

diff --git a/Documentation/devicetree/bindings/leds/ti,lp5812.yaml b/Documentation/devicetree/bindings/leds/ti,lp5812.yaml
new file mode 100644
index 000000000000..5208ddb3bdac
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/ti,lp5812.yaml
@@ -0,0 +1,249 @@
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
+        - Direct-drive mode ("direct_mode") drives up to 4 LEDs directly
+        by internal current sinks (LED0-LED3).
+        - TCM-drive mode ("tcm:<n>:<order...>") drives up to 12 LEDs
+        (4 RGB) using 1-4 scan multiplexing. The <n> specifies the number
+        of scans (1-4), and <order...> defines the scan order of the outputs.
+        - Mix-drive mode ("mix:<n>:<direct>:<order...>") combines
+        direct-drive and TCM-drive outputs. The <n> specifies the number
+        of scans, <direct> selects the direct-drive outputs, and <order...>
+        defines the scan order.
+    $ref: /schemas/types.yaml#/definitions/string
+    oneOf:
+      - const: direct_mode
+      - pattern: '^(tcm|mix):[1-4](:[0-3]){1,4}$'
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
+  - ti,scan-mode
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
index 46126ce2f968..f94aa363e3a9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25413,6 +25413,12 @@ S:	Supported
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


