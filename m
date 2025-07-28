Return-Path: <linux-leds+bounces-5148-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B2DAB13532
	for <lists+linux-leds@lfdr.de>; Mon, 28 Jul 2025 08:59:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7D99F1899070
	for <lists+linux-leds@lfdr.de>; Mon, 28 Jul 2025 06:59:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CC5E222575;
	Mon, 28 Jul 2025 06:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PzOV4Npy"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F14882222C3;
	Mon, 28 Jul 2025 06:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753685938; cv=none; b=QWQvZaBZ634dJTXpxnEl2FX9wf7Z+0SvW3HfiPXgMAqmnetFpXmJ8nSA4poTb4SYpE4s8uv/NCiD9ZPwA1BXZ9ma92SyPeYke6HLjbTS3RrSriMPiJMS7wzufIk6Q7I/NiFdR4qTSfD9cTOjiQdZkWh9R/eJYDkAqEkU9O2Yf7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753685938; c=relaxed/simple;
	bh=3aAUHT/QDMvttFMV/vGtaDB1Wn/oaRH08OeB1OMHdB4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qIia/h4zTdR3Oqnp4NLsC5sKf6UEsQms7wMImlDUGXWO++Y5u+bUmujRCNC3975pZBXasZSqKhnUqYETPaXs+rDBTRPAB+hofkdSUHytdR9rC1SXshDDJ8g8Rsh8zTuwsfE6BrjX4KoJ8xIcTP7uQ+PTgARc6qqrZPdxfktRUK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PzOV4Npy; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-31efc10bb03so409201a91.0;
        Sun, 27 Jul 2025 23:58:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753685936; x=1754290736; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RoPbcmEYRh3xsdFjHY6C+5hbY4N/8mXNBbENBnq7Tm4=;
        b=PzOV4NpynPEZYU0GuYOOqZwmmSGs0ISrzBcp6xwCsxTKmJFn+BYkbcjJygAg4Vu0Wo
         g2r0+BkrGY1S8VsnNypmL1tlaGs4Cb2/JbQyH3YiWpoerDlKsL++mh929wmBB3QRykH4
         TOjubRkvdFLJpT1uNUrZhRL8NqesHPO1BQNmEr6CdLbBRkEL8a197EkzpmnJrTgX+4vT
         c4tMdBqIKrivXIhEe7ixEGDMZfhlUklqv7TPAnBNYwDj0hPxtUijcZgvDo+1Qr7vqJhr
         V8ey6hYEMIl4LucryVnPZ4ROXV9/nwkxWg/DFcyvWW3Gan2JXpUTH0CaX11+QCQt31UT
         aIYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753685936; x=1754290736;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RoPbcmEYRh3xsdFjHY6C+5hbY4N/8mXNBbENBnq7Tm4=;
        b=mZYo9OuaAHteXsrJ3kIwceJkgAjEKJbSNigtFC8L5bG5CM6rYHu6RT0BjL8zzbnzco
         fvckOtjwsxMKm5ENGqUvgVyz0ayugMc3u1KHvCRrYIrhjOESrRPV702tVrXouKJuDigU
         X3l3/sTkPqFnUDXY27UYP+0t9rSTL9ENni7TNmIqW4E6h8YVhjNWJZliGo5M4i1Nzs0X
         BgJYsLuC717jTMPHEUb5SSML2nl5BKrxc7BzMDcievuIWNVLU4fYYN0ZPQmbBnZmSJmk
         sx34RB9S6GXuPMI2nIOofu74k8aLH2wvqqOgm8DCWcT4jEVGHbv9TfcUuqUpwj2X+kf0
         vZ+g==
X-Forwarded-Encrypted: i=1; AJvYcCUrfz5UxQMVvkPyyqM67/BeC0hV6lmGe3Sn8UUYp1Tlv7BVKEp0iEDcD5e8kGQ0yyNrKywAbPrIN+2a@vger.kernel.org, AJvYcCUuqm6IKiFeuhBKr7rN28Qwfq3bVHCv1H8mLSUOOjpkT7KNrvbgVaiy9ZsgoVVm2RD/xHK3GQwS6wBwcrr7@vger.kernel.org, AJvYcCVupWvW0fHww1Jwt2WdIhE3AsZJtkrL/EaHNSoIrav/IaDmCUeCEVBLRJWyHs5FLt/mhVNyUT3z9jUT@vger.kernel.org, AJvYcCXYNoW+mBYYqTaMxdLVM+jyD3wgm/OyjBqG8xXxz9TTJOwvNaqr61T1jLsO3u3es03EhZZ9zAJfxXWMYA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7J0Xe9Sfjvlhq+tRBNRAdWMZg9RDGCSjmbptBD94/kBMcZ9Pk
	f7W5QlxEYT4qvy5RA4s4znthD8VzNvtURfmj31WKrDnLnU+GAR6G/MYS
X-Gm-Gg: ASbGncs6itaejqLZ1V9xoIJtZnNKK6j2lj/Ym52Q9e3gfuv/3UzEOojkIpMcMSRcd3z
	FZIr93iyh5UfLbPCH4KVSL1vXW69is9a9NPjPcm6i4IzwEDaMOydcy0ycTLvEnMKanpVZyNQhtz
	PmQ9H4aZy3SGQ2RIaSYOKQ1EyvIFAlvupJJunVghPlgxoB/0+FNXbEkjRiPqO5c03darYVHFXvU
	VhqZ5l5R8ENsEPqZpF9JDtuY/liVcPll2Zj6g4uyr7EMlaUaS4UEJMeqOv+2SbF2vcKRBFW3qBd
	3YkP7d0D470ZmV4Qza7k83vs2s2laa0GIhI8lYW5F5APIgEVKfNlptWtBwHs+htdP9y0BanRfNi
	wJJJgO83KaYm8GMzIHA4F8F+EocRntThCENDToMer7bbWz758
X-Google-Smtp-Source: AGHT+IHdXjC7vdoxGQ9h3vQP3SG/rTfod7nmEytF5UaDnksszjvJtLhI0+SjyobxsEMDUrxYRr9/cg==
X-Received: by 2002:a17:90b:2407:b0:31f:867:d6b4 with SMTP id 98e67ed59e1d1-31f0867d754mr593681a91.10.1753685935892;
        Sun, 27 Jul 2025 23:58:55 -0700 (PDT)
Received: from localhost.localdomain ([171.254.200.159])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31eff8b20d7sm1050375a91.38.2025.07.27.23.58.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Jul 2025 23:58:55 -0700 (PDT)
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
Subject: [PATCH v12 1/4] dt-bindings: leds: add TI/National Semiconductor LP5812 LED Driver
Date: Mon, 28 Jul 2025 13:58:11 +0700
Message-Id: <20250728065814.120769-2-trannamatk@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250728065814.120769-1-trannamatk@gmail.com>
References: <20250728065814.120769-1-trannamatk@gmail.com>
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


