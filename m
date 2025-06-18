Return-Path: <linux-leds+bounces-4845-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 656C9ADF5E2
	for <lists+linux-leds@lfdr.de>; Wed, 18 Jun 2025 20:32:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9BF9B1897EEC
	for <lists+linux-leds@lfdr.de>; Wed, 18 Jun 2025 18:32:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 054942F5482;
	Wed, 18 Jun 2025 18:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dN3+Rix5"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 462942F546E;
	Wed, 18 Jun 2025 18:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750271541; cv=none; b=ck94qOIhbYTp9oEpR04QusEtbK60k1WQZoY08yGFz8N9wcB3jx7BKxDsHzs6tNALycb9Z92vBjefJUXzU8d9JhVSJvUohDI8g03KHr16zpmz0G5vzThKDV6Fz+LpZZe2lQ0X2lHHD7sudhwWwfDdI5MXJm+iql2Kq8p/9CDXm+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750271541; c=relaxed/simple;
	bh=rQ8rKPRPuhNzi+10f3RB1hk4xDUou7WqAHnmwgJS++s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=E5o0BZBopKNb8MMx2zXT9RhMZWqt+WJkOgjamusQvmEy4Zt9y9juiIg9jEpNTHhjGNn7GPYIsDeMj7EUL65Ws0uPfp5cb25KpddfeodetiTE9GEbkkrj3uGkkEqWXBQv7Mu1uvfl5OXH4czkknU95//jmKUneiRzjCC5a8Z09uY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dN3+Rix5; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-235f9ea8d08so80495ad.1;
        Wed, 18 Jun 2025 11:32:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750271539; x=1750876339; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vfuOuLlvFWpXGbmrHs0nb56FLv7lFfN7MxTtN2N8paI=;
        b=dN3+Rix53xpWyjfPzP6pBTgLGPgkXFPGRl5WuuXSUMViJEhujJnZpVyS4vb/YjrR33
         ksUasDjYd6tS8GAOmMgKS3W1l4DI97Rf7740c2A3WCFYth57d+dk/A8rq0XzLueoMuYh
         1h5ywTQeDSXLepNQKQW2dXeYaHGdMP/L/R2XjGE6kH5ztAm6oRfnLRN/tvTYfeKKsYkg
         Q4K3V7oEUSWH1pTQ48cC8Dg0ZczZTERtp8vTVucg4uzUV5oCiVU28IHS4R0MiupMb/iK
         Ax70WHbANeC+PHRq40UTTEnSUOk7Oua3dU00OSCjK4WC4IRml4PMqoZjCZ9xwwFvUpUt
         9LWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750271539; x=1750876339;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vfuOuLlvFWpXGbmrHs0nb56FLv7lFfN7MxTtN2N8paI=;
        b=V9ROq6GmfjMhl2Y4Mmn9/wXd7BI7UkPs7nIs4h1Inwel16DEEVMcwSXqPGtSLgz6gc
         fIUzQJE66874ZA3m6cvYfabODj1kGhOg2aGowB8OECs/G0E9KpSkdntcdkye4eT5DYpj
         lpciSqa1iRyxe4rhbo/r5bTno7apDN0LBNF6aHRDD/4EkYmYBbkNL7YkqUW474kTF34Z
         OEG1JjIEvH/ykMKl7YNo/iybca4uMt97mfX6Y6csEmfQKVZwNxaH17uLjlSnWpYh/Q78
         7Z1AKQTkIc4P5hUb2s9DZpMw+F8MbNU8rgCENWIi9rJAEFg7nlrRhRPj85K8XjUe+4/B
         lgAA==
X-Forwarded-Encrypted: i=1; AJvYcCUQLk3HNyRpJxxwabUJhv48nEB0cVVO0f0gBaODmSeGcX8UL07lcMfGDjdJLuqaMS1Lv6AOdNm+frSl@vger.kernel.org, AJvYcCVE81547Wtk10qw6UPRmRuyhFyjDzWCCopdl+2f2Fdx+Yp1ouX2+cSK1cSJsUqPXINxUDbB2tIQBMYVPw==@vger.kernel.org, AJvYcCVo35xGEUwIuf2lPjfD2Fj2gK1wokHBe+/bJgGosoekZWlrI8QElGXlesD56m6qKb/r47qAADkI7Ky1@vger.kernel.org, AJvYcCWQ8tW6YUmpv7ZSgZhFwu1G2S/7aWDMv/EbhVc+T3HuJzYVad1xIBlqSZfBsnqe0/Yl7IZW5zcnKTta26gx@vger.kernel.org
X-Gm-Message-State: AOJu0YzBTlym6lmtA7m3ikzgGDHeq3lCQ+GwD9XXHFfTxIpxxDbkTyJp
	OgK20IOtRclfkwwZqXX4YIk/nsph5c+u9ZevBp0iT01NIRoefFYYCdfv
X-Gm-Gg: ASbGncuy6ViKI1s1cnHtVT5xIe1sTr8oqiOcVXXr4sk/YGk3BIh4YC8aLmgWSTSf3xQ
	59O79vqD4AxkdQpBheurs/KrVM6d9uXHm1E20F4/FI+YiUIIvD7sFCRPvr6nok3dU3maTeg5eOk
	ZkMBQ46DbSb+huup74Gafv76yjRaXMBiCcVaucj69IsYPQlgMaIElrRN9xOO9UCcTeqUmKdAHUX
	7lA0+oFyF3ncqwZu9PG3WqCQMH/DMzeOk41r+8/pCeC4yhj0rRi82a9pQQspWTByl1d+8PkWvnV
	Dp4dZ0CYc0b/bhLYknYI87Djgrao2FnCsot4G1twnVVliSR91Eyh+6daXquXQXbGDaaLI7YgHLQ
	KG8AbZnA=
X-Google-Smtp-Source: AGHT+IFXaoihja+Dnl4eWPsU3l/PmPRnuo6G/0OsH2wJRe/k/breVcsuFKyD07chMflgd6rbDEwuvA==
X-Received: by 2002:a17:902:cf0e:b0:234:d7b2:2aa9 with SMTP id d9443c01a7336-2366b1221femr289050945ad.29.1750271539383;
        Wed, 18 Jun 2025 11:32:19 -0700 (PDT)
Received: from DESKTOP-P76LG1N.lan ([42.113.163.91])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2fe1639f97sm9606454a12.6.2025.06.18.11.32.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 11:32:18 -0700 (PDT)
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
	Nam Tran <trannamatk@gmail.com>
Subject: [PATCH v10 1/4] dt-bindings: leds: add TI/National Semiconductor LP5812 LED Driver
Date: Thu, 19 Jun 2025 01:32:02 +0700
Message-Id: <20250618183205.113344-2-trannamatk@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250618183205.113344-1-trannamatk@gmail.com>
References: <20250618183205.113344-1-trannamatk@gmail.com>
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


