Return-Path: <linux-leds+bounces-5185-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6157DB17AEF
	for <lists+linux-leds@lfdr.de>; Fri,  1 Aug 2025 03:46:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 16DFD4E853C
	for <lists+linux-leds@lfdr.de>; Fri,  1 Aug 2025 01:46:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCDD87262A;
	Fri,  1 Aug 2025 01:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NwtMR9JO"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 307EC134CB;
	Fri,  1 Aug 2025 01:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754012754; cv=none; b=UTNp0H5MfiD36NYEgvaKV75sSXeWG5zTLkvSWj7Sc5HNIJ6laJLqa8/8BjOzMop5BuzwjG5eEdsNauOSygstxxT0UONLAUFZMBv3YhemBKp0UncJT5lWHlYNikd/SOddKtSO00KxMV/QMaX3aBPrRRQAxBPaL/2/1ndV3uTi60c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754012754; c=relaxed/simple;
	bh=qpUFeImvIX2HIQysyDBYMMGyvp34QErh5XN92cx40w4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=pzEBTNk4lbvt+qSomLdzhnf1m3MV+vvT6eviKrAQMbg5qo0pR/ebyKh5FnDI+B9LPwEElyNdXN3bGco8ybOlmoEMNHA5a4a5+ja7o+EPKYlZZO7EIfh5NI7LY302HRRkKIC4KGA99lZ7M/1yhIr1jphbMdU2jUyXW4oAU4Sjwo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NwtMR9JO; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-76b36e6b9ddso1349698b3a.1;
        Thu, 31 Jul 2025 18:45:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754012752; x=1754617552; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MulAQ/sNL6KVZcEs9zWwgkJgydQMoWTgBxU/Pdntzt4=;
        b=NwtMR9JO2Pax//L1Hul3cSFxYia8VT+4HXb9OQt0WE5P8jJjKDKqyggoIrFm71uTfi
         W+wZ+UwtKPPgqRpcU2W3piNorBYv3kz8aHO+APahoCkwj+FHGLxOoGxWZCxzXjiiF+qh
         wuvoXnMNyUz40/Iz1ev6b4RTURfO/Gw3Gqmfm1oXl3xYYI+1WFidwd+nVzEF6hBlI4X7
         vfdPIGMgsnJhrou1rpoesqSGjJ2CZWN+CtglGS8tyz/dn3UlJj3jrE9F32yfQj67Ums7
         JuvhHejZuWBHDOKfCNhRIICyS2I5noGEYMjB/dSN1AJ5K+mVI9FJp+oO4wQDMXLoOyiS
         5FAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754012752; x=1754617552;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MulAQ/sNL6KVZcEs9zWwgkJgydQMoWTgBxU/Pdntzt4=;
        b=eBo61gdTrBsHFSkc80HylfKSa2XIpYHiQqWBvp8uBEWositfLI2GMSUAJLalMepn3E
         sXJadRiI8kE1nkXT+aeYAvpht8Q2tfpElJjzx381Gxt/rr/Zym0GEqgqO0IVgJ1vW9OE
         1noSxDtxXxp98+FBWipYP2MXEkK2pLOueh6zaQj/OXNa9490iz3V3RCwsAdXYxfLoeGz
         1jC9o/MAeFhN+XVeysl2DXnawG5JYCRIKMFJdPUSMYamyzTeR6N8KVeBNabRhEwC5EfN
         g2NDFXZZIg4u1WNGo4P/6jxiMrwENiA+cdfwBvYYPTXkwmjfHTkavYw+4+M6ZfZg9p2S
         T5Ug==
X-Forwarded-Encrypted: i=1; AJvYcCWBQfzlabesdiqdzswa2fnRn6YEjvokCIr7/PWBURGYW0bWmJZXHIQKctoc9ksa2AuKjpmLK5xp0KI68g==@vger.kernel.org, AJvYcCWBjYqeEDk8FwOPypyKwDf3gkxmdMv06UjmifK204if+cWsxu9piNeuoxvG9yvMJH00b3MefRaK/0oL@vger.kernel.org, AJvYcCWRnWgP3qI7CLpZ/xunp3R0SNsVjSz6WWNjdq2sma6YegXbY4KH03B8KNeQm3fB2rZhQZnLIG+yiLb7077k@vger.kernel.org, AJvYcCXyE4pQmPGyEf1bdkZ5Evdi6e/AOJOFgwIqgzd1J9ptB2109FpYRSeVKzDGeebRNx2wsj9iAD6o5XJc@vger.kernel.org
X-Gm-Message-State: AOJu0Yxm5oSg9DbGUAHjijSEXyzzguc0mQnEjnuxQ3GLkfyq1bbRLIao
	FfXp274jh9TTVDeXTsQ+xScsiXnFMZwSXoI3tJ2QWhO/7ywVCPgTh2H4
X-Gm-Gg: ASbGncsprWcEKqqAcKjuUhYkkMd+SaOMQpn3qpp0Its5t7WOphA4roWhWyG/8Y4LF+1
	Vcbo8VOaE7Vc+rZ77V2DybY93gYmSu+fp5VKr/63eu8n2veVDPo7s4gDriiD+JcG/4uzAuHln9+
	XJ99Wc+zye+Qh3gO/OKePawuUEZUZJjgZEJGYOjwjjP9pxqU2+JiCUH99GNnBqMS+nEQxcRi1u7
	rXJVHb2odtkN3rlYZOYJBA72rpI7K6YTMIf1A/pI/LiedTjMAyzVfhzGB5tA0e324KXsKZG4Fsq
	FSxsCiI6DDSQDpQ5QVb5+8UhzLvuwq0TUXdaLPr6rmLAwNfSQQkfhjMLiA2A3Bm/fbilSYsPoBs
	2siyWiTE7j1VUIb5Y7JI1i88VGFW1EqEV2uuQcAtb02eWetU=
X-Google-Smtp-Source: AGHT+IFFZgBaiJeyHSUX6XCkmBcK74MKVG3DUB/7vxcF4yn6v1osJ/hSJ2BDc6vv9jEGh75fsGdVfg==
X-Received: by 2002:a05:6a20:734b:b0:238:3f54:78f2 with SMTP id adf61e73a8af0-23dc0ed68c2mr15466121637.44.1754012752395;
        Thu, 31 Jul 2025 18:45:52 -0700 (PDT)
Received: from localhost.localdomain ([171.254.200.32])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b422b7b9377sm2514011a12.16.2025.07.31.18.45.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Jul 2025 18:45:51 -0700 (PDT)
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
Subject: [PATCH v13 1/4] dt-bindings: leds: add TI/National Semiconductor LP5812 LED Driver
Date: Fri,  1 Aug 2025 08:45:08 +0700
Message-Id: <20250801014511.139862-2-trannamatk@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250801014511.139862-1-trannamatk@gmail.com>
References: <20250801014511.139862-1-trannamatk@gmail.com>
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


