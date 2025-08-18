Return-Path: <linux-leds+bounces-5229-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 138CEB2962B
	for <lists+linux-leds@lfdr.de>; Mon, 18 Aug 2025 03:28:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D37364E7A01
	for <lists+linux-leds@lfdr.de>; Mon, 18 Aug 2025 01:28:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85855238D5A;
	Mon, 18 Aug 2025 01:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cxZuFNrp"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1EC723815D;
	Mon, 18 Aug 2025 01:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755480430; cv=none; b=Lc27r7T3sOfLc19N8LDlU6MpXEBeNR/yAGuXPaOTOaHDhGfcT5aAik2La3F5YskH7dwplkFMsReYEAcRBw+AwCZMTjMgQN3M2DAJhzDpoA31bF14GpSTydESikXxS9561vfA6MM7dn1ABdGYrvaVT4u5wDv7l/Dv+sfQ7bGyoi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755480430; c=relaxed/simple;
	bh=qpUFeImvIX2HIQysyDBYMMGyvp34QErh5XN92cx40w4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nCQT9an75PEI3XSaoRMl0yo09+oTb33Knn1Okb8SBQ5/Vr0/UE2yjhUUyAH3ht+AlLauhZZ3JNvYCQTSJP5n3b0H7Rp4tOaUgCeoZgqChjdSSMyVqFmF7151hVGGSxRzI6ElnAiRseGtfE4FVX2QmdTVLvLgh8xfyR7QzUG2JKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cxZuFNrp; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-b4716f46a2eso2535720a12.0;
        Sun, 17 Aug 2025 18:27:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755480428; x=1756085228; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MulAQ/sNL6KVZcEs9zWwgkJgydQMoWTgBxU/Pdntzt4=;
        b=cxZuFNrpPgqQWztS2NDs2zpOKTvmVA/Wy6KHkIfjuPx/v0XdN1RHf3SMr021OI6DFl
         VhbuJxJ4OGNTmdaoEoDGj7Cldmr1C81hC+aswusQAeBUkOMISujLf0QGsm4ndcI90ky7
         JxeJEjOEfPnRqLzyK9UnLc7S4bCwvysCDmv2j9Tgbo3NH9rvda9VwcpGH8CuLSoWwnVt
         scT+6QEYNPqCO2q9sV/GZ8iPRObw7cG8tFRaiiWfmh3HIzFZ72w9sfsvk7pKi7fqiUfQ
         cEOo+tKNVs5wH9MfppYKqfOK15aKGoQGFOxTVMLvaKAZ1h/+Skouz6TejVZGVl3Sa/Al
         j4cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755480428; x=1756085228;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MulAQ/sNL6KVZcEs9zWwgkJgydQMoWTgBxU/Pdntzt4=;
        b=oz3E3EHffwNs7U60P4DvWLz5r5Fp3GbJrggY+G6C9SLiu1s5+YltPY9ns93WSEXhtC
         kHTC7S9+v3yS0XOUywxTGFWflPd2eoY/0r3x63c1ujcerDREfiAz404R0x4AzvLYPErc
         OfW/phf52qcfi+9qTdvwGDgj2sVl1tfNsAGBIzPArpczhUz/mX3YirKtTKWnd+fPX70N
         QkwftIdAgZ4WqR+BAn1AkDaHHlBvT64gQjIFEnJi/NdQtVETvtUhC5CsU/qjFOZSNUI4
         hWzXp0yy0YnQWKlsF5rWxImlWa5OSlCEx7QIONMhV4+OC1LvcziEjrI5KKpGT+eBVs/h
         e45w==
X-Forwarded-Encrypted: i=1; AJvYcCV/ju9CZSqXX/l0cmn4BfQzTxPsICfxuxM8BD6nyhVTr2WcYf/8zMNiO2mIgQQQjtGO9RSFOi+m/oJphORF@vger.kernel.org, AJvYcCV8IHzj5SRxDf0q7ctJwVYEAxpe0hnrOQLeNL3XJCoHMzbM+fgd4RBeWxnjmFEmJEKGodaLnnyICoi2@vger.kernel.org, AJvYcCVyR9YQFiFRZBWwijjsGtmkg5G5HRBDJSuFuSutdOjoHcEu4Gq+TzRXQGNZVOGSFWomXuhrCnpH/tufvw==@vger.kernel.org, AJvYcCX1LG//DOQwfU05+NyxHBsSZRBbPXSfVIjClG7Daziags0pwLgPe8eJriaoHBzgtpaK9vVCFJ2zk9DY@vger.kernel.org
X-Gm-Message-State: AOJu0Yyj2TZV2sQv9uRpU6HZI/OYzPgTTGfKmcNQqXWOYm/4ajeyB3Jb
	tEnGzsmc0N4HTqoQfYYnW0l1vMtsVjHm2y5LGcz0pv31CqYlNUvK6tQ7
X-Gm-Gg: ASbGnctDngU2RzEJC/Tns39JdE8kBOCt4yQzHdqVjhOzM/uO9GMGkrxz3sB7KjylMPX
	Ur/6t56lTmFi/DGWQtjsKNuPyGVv4BhVWDKkZhwpY2wYpvMeeuunUI6rrgm5fxIdPKur6jy1wB5
	NQE0utuJQcKZzcuhHEqVhQN50SJtfe0P76tnx7se6IIei5hzC2HAq+sGrGcnodIoMryvxWa6LY7
	6d2vjPBQT2jScYS57gjoGPDvB6uV2CR2Az++tTAFuQn+kPYalIiBRh6LeLlD5Q04yaOzFvKQpWP
	cOiA4ffop71DDOLO67ubMxfPDc3vV/mRVTxIpZJrxwVuXXwzq+xNX/atIi+N7LEakpv3zlEzcdf
	5DfdaXocIKFlsEkrpfrwvv4MQj80T39ny3TEzCt53E5pgvVUTEyeJjEM=
X-Google-Smtp-Source: AGHT+IHJNhstq0+kDFpFkYyuXuibPJguxk2kmg/ej40076uS98u5gXYePTG665jOOxjne+lfXGF+Yg==
X-Received: by 2002:a17:903:22c4:b0:23f:b112:2eaa with SMTP id d9443c01a7336-2446d8fe30fmr145196185ad.41.1755480427914;
        Sun, 17 Aug 2025 18:27:07 -0700 (PDT)
Received: from DESKTOP-P76LG1N.lan ([42.116.199.205])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b472d5d7070sm6709620a12.15.2025.08.17.18.27.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Aug 2025 18:27:07 -0700 (PDT)
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
Subject: [PATCH v13 RESEND 1/4] dt-bindings: leds: add TI/National Semiconductor LP5812 LED Driver
Date: Mon, 18 Aug 2025 08:26:51 +0700
Message-Id: <20250818012654.143058-2-trannamatk@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250818012654.143058-1-trannamatk@gmail.com>
References: <20250818012654.143058-1-trannamatk@gmail.com>
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
index 4f03e230f3c5..99512777b890 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -24823,6 +24823,12 @@ S:	Supported
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


