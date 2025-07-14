Return-Path: <linux-leds+bounces-5060-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 535E3B04664
	for <lists+linux-leds@lfdr.de>; Mon, 14 Jul 2025 19:24:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 79DA94A13B4
	for <lists+linux-leds@lfdr.de>; Mon, 14 Jul 2025 17:24:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63251266568;
	Mon, 14 Jul 2025 17:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I/IQi8Gu"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6BC5258CEC;
	Mon, 14 Jul 2025 17:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752513861; cv=none; b=F7ebt0vDejjBMxDjgA0r7MGovDUT+vBFX6eK99tk69hWZKSnLEfFcdFlyDjnhhTG96Z9NX3wPKicU0U0bf8hZIKhhJ7WZ7rcDalPQI96NjGTeOfQGlby5x6x6eB0LPmC9p9Q7lIawIKnJN6C8ZTjAPn2Pjp7ke5XIgA5yUEKkII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752513861; c=relaxed/simple;
	bh=3aAUHT/QDMvttFMV/vGtaDB1Wn/oaRH08OeB1OMHdB4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OGyhyqAUBmHk2PT6zszL8nEMU36PrXqVwqyZf6GfiQNLfBahaVxa2PSRWlLTfVnhvFPTiunmRLQw4QYP8jJgh8bxzfLLS2pQ95X+9UGHkE3JAnj8TOhaFl+GyAHEHVAowoiC1Ec3Z9y+kw/JbT+Yk5nVQc7oucWoqn9vKw2ARvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I/IQi8Gu; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-747fba9f962so3756639b3a.0;
        Mon, 14 Jul 2025 10:24:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752513859; x=1753118659; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RoPbcmEYRh3xsdFjHY6C+5hbY4N/8mXNBbENBnq7Tm4=;
        b=I/IQi8GutCGAROa1DzWAgN30HFpPgyrr3tdTKZT1dZvQ5sl2mz+O5fFIKcmv9+/jSX
         eiNcVQOE3WUPxoUnswtVLAG448AtjTFn6WRTGXP/lH+GOo491eUAmhQ5UR5xLcFxcUfm
         5UqqC9/kw9uD1+ThbEnG1f65Nl5biQJpSwHQrHqseKs9ZYJtLVcm0IRuTk1+Exy7aB6I
         WfYKslTwsENlIbeVudJykTxzFaT8TDfkkNAesDwDl22kS1RUC9FYupQexFNxi3PDfC3H
         Xb2JkKgVPLrxmwczWcyTimHX9e10HQ97Dcm2/3Keix2jvCxjEa98lCaWAUO6D77TC+0k
         +YFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752513859; x=1753118659;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RoPbcmEYRh3xsdFjHY6C+5hbY4N/8mXNBbENBnq7Tm4=;
        b=DlRfmR2pklggfr8IaV6uLYatPYxgjuE7cR/heodObwct0ak0nrC+n3k5Y2/AbHXZop
         Nn1kbWeIsOORTvpUrz/ANdQFJ+uTCu0Jg7fr9MseZEOVROjaEyVM94tXV319UjGtWbFF
         lWZWv/y0I0zRzp0JYHNFjgHH46HTR7Mo6I5QS1InVnT2q4jOI8KmPjPAsPy6KwrtOZzu
         siiCoGiYxHDbNeEScOBiiDtU4MrtaS/gjQ9uSeyUWEjB72Jwq0vsAjjQ0K3o4ZNvw0Bq
         KpFjLhaJMrmdUFcCB2tjXa5GhNkjPUyNS5hWNOrPFewCTiRpOGlR95KKYJbvx26miC9x
         bqng==
X-Forwarded-Encrypted: i=1; AJvYcCUeAbf2K68TyThvgdK5Ob1hd1tzKT/0aI+7qOrt9EOn67cMbkaUrqfpVuB+ZpbXKVejwLW4uL6bXMYx9Q==@vger.kernel.org, AJvYcCVPd662v+9CC5TtaZ7E/VtGEE9gjfeFtHxHXoNAK+3fKmMEK19KI7+uV0dXVVCYKr8KvPi9HvDnPAid@vger.kernel.org, AJvYcCWbJdXB05IK60r5EU5IgEB4umue6TSTyHzteojnnHmutnccXXQwNVtrFlr5x/PeJhndIhRezGWjCTUp@vger.kernel.org, AJvYcCXjG23wiC0j0VZHvVmXmzuVSlHDt6jtvsLy+f4HS/Ysv+/aW5+yf0MXjiQn3BsKPbQwigWJ153aVov9nO3G@vger.kernel.org
X-Gm-Message-State: AOJu0YwhvmUKqLM7l/tZ92evGv7q1lw3Mh4fCOZaoyKjrgXXesLFyaup
	uFqTh7Y5E7Xiu4fAVNWCC5hWNN+iJ9I1uy64Tg3cMHCKYWSJSPt8zpwD
X-Gm-Gg: ASbGncuwrOnhN+ULpSdJSyPNODVb23uBHahCDVuy98o2g8SsA3yN9VkZx6bpr2GE8VX
	Ew7KYI8f057UPZtwoNtLczwkM2NtfAYY9VUC6J+4uldHy8XmwL3MmXf2mFhbfeCx7xlp3m1e/Bo
	0qwlE2DdjrwQ/AYFv9wXZ0g6N/HgmGt5MVQ9UdeWd5cOvnArNMZU10jLGhvNz9GJHO0hbEgbf+x
	/EBGbvZkPWGW0AIKC28ph3eM8T2LIxmep0LPpTcE+ZMFsM4WCgsPDeWLm5KC9ikKF3j88D6Im7W
	/bSUPQAvLFbpKq/Z6uu5KZazswONW4DxYA0TouYoIaS4mU5plfmA9hfPPB0lFNFsDlEDWNm8wR+
	YhI5MesSkMaY/rPKYSmk6bzTrvB/kOVBAvg==
X-Google-Smtp-Source: AGHT+IEbrUQ9n5pK27xJK2F8mso64QY/ht2C3xxmyB8S0clyKnfowTmzAXOCRbgO7H4pAyhk4aWZtQ==
X-Received: by 2002:a05:6a20:9150:b0:220:1843:3b7b with SMTP id adf61e73a8af0-2366f68a3e5mr699429637.4.1752513858572;
        Mon, 14 Jul 2025 10:24:18 -0700 (PDT)
Received: from DESKTOP-P76LG1N.lan ([42.114.162.205])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74eb9e06537sm10495468b3a.43.2025.07.14.10.24.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jul 2025 10:24:18 -0700 (PDT)
From: Nam Tran <trannamatk@gmail.com>
To: lee@kernel.org
Cc: pavel@kernel.org,
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
	Nam Tran <trannamatk@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v11 1/4] dt-bindings: leds: add TI/National Semiconductor LP5812 LED Driver
Date: Tue, 15 Jul 2025 00:23:52 +0700
Message-Id: <20250714172355.84609-2-trannamatk@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250714172355.84609-1-trannamatk@gmail.com>
References: <20250714172355.84609-1-trannamatk@gmail.com>
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
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/leds/ti,lp5812.yaml   | 229 ++++++++++++++++++
 MAINTAINERS                                   |   6 +
 2 files changed, 235 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/ti,lp5812.yaml

diff --git a/Documentation/devicetree/bindings/leds/ti,lp5812.yaml b/Documentation/devicetree/bindings/leds/ti,lp5812.yaml
new file mode 100644
index 000000000000..848cd4f51901
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/ti,lp5812.yaml
@@ -0,0 +1,229 @@
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
index a92290fffa16..83a779dc9bcd 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -24561,6 +24561,12 @@ S:	Supported
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


