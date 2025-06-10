Return-Path: <linux-leds+bounces-4775-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C656AD410F
	for <lists+linux-leds@lfdr.de>; Tue, 10 Jun 2025 19:44:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 18F24189CF25
	for <lists+linux-leds@lfdr.de>; Tue, 10 Jun 2025 17:44:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF269246765;
	Tue, 10 Jun 2025 17:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dMGFb3Rx"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1607224635E;
	Tue, 10 Jun 2025 17:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749577416; cv=none; b=nUhg5rzrjmvWHg5NBinUNYXXYR5zkWeDdV0RSDVbv1/aMjkIpdlfmMMg31xNoDhk2Pt+PF1IbkAuChHOd3GfJDpyJGd0GNkmw9QP71+nmZXVbKUHxvQf2j6gk29VzhlI4DkPYEJTmzXhdShuBg+7K5n1MVP5mN8HZwkXxW/Gd28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749577416; c=relaxed/simple;
	bh=+FnsJCAw+Y00BGXJGVpMWl0ZhKyXNY4Zs++Tt7Qin5Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=U+fh2T9tMExG8f2sIPolsqoRUGYXWsZpfaJ1e029u0sA762zTTG13rk4QM+ByXzIuDVS1dum9hMGkUI5WlKXwk6J2wBaR8vYHskoXRSGpRvgdC56Exi2LHgsryxIzO78LHEGtRauKf0nupJbPv59Ni4QZr2pA8pjyYq/O30eDX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dMGFb3Rx; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-313154270bbso5986864a91.2;
        Tue, 10 Jun 2025 10:43:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749577414; x=1750182214; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tOqalSSBpbsjNRDBOvwExLKuJwEg3BfW7bOGhTq3Dnc=;
        b=dMGFb3RxDa4SU9tHqfTQoWRbQfk+X8YDVJoe3j2dXLjYW8odM/1yccTAB7puOsA+ip
         +T0HJV/IUt8s8abmINBW8QemWbbxXxm/3VKt5H07vWPUwkkbRBlj9HfZ1QDak0jlFgA7
         170XNklk75ya/857Coye68c7MDFwiCaUVtIK96aNszl48ZsnZdwArwFfF9po1WJSof4D
         tG31LWjD7gCI79pnoC/ltTBXLLUObxGagFOg9eoe3MwN8NqOrBUwTSthY8BwP8nw22XS
         88z/Do5y3HsB7F8lirrUhw6Qtxhu/krtdETO7NY1uET/4RbDu7AXrDOAA4+q+HnWpw/o
         0wQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749577414; x=1750182214;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tOqalSSBpbsjNRDBOvwExLKuJwEg3BfW7bOGhTq3Dnc=;
        b=PusiwfA3Mw5lY+Oj3zDerZEjA+sH1wY+o7Yz8W42UI6Vcp40/aF1tMSqT6J5gt1XgN
         GoO9Q3SEpmOny9Kw7cNJ7RisPXYH+R5JyvCm3IvJN4sv6ATlLugIAZvgM80fOmvr2ClS
         iXDDePzmiw0WbRedc/qJZGf28IxReVHN+lFJNkRweYV/a3YM/TF4z69qDg9qQrz1XGli
         B5dRVOuSknXDUtz6m7b1bB4Tzqh7Z7G/2Z+twt1bLYH3X4hn9GpNQXT4gOT+OVryLhgs
         GSELh5glcRGfPwSIfd7ChZ9W6foMpMxLYMzEotlJVP+hsyjX8zgHWUvXur56aav5yKK8
         a4eg==
X-Forwarded-Encrypted: i=1; AJvYcCVb+fqvqVXZMMpcWBANZr5ZtAss6gQu/RCRupg9XJcoJl3tu9OmU1sZBA8jsd/dBmEXwrj/SHu1UiJAJdBS@vger.kernel.org, AJvYcCVxAoDwGkveHa9clEc3DoMxBtdm+2OAQ2Jk+k4+gD4J9FsIfGIMVfcsi/+lUKFo1D7xChmBk6W0MgB2@vger.kernel.org, AJvYcCWgB0w3LKphk9lHDNQF2ZlhJKXTgwwuDChzHFWLC7mROBW7lPyJvyT9txHCrLaR71QAw9zs+gWmjwbb@vger.kernel.org, AJvYcCXIvw34Rztj0a/SgKP3mBKznEEelhopzTd0W0+PNsrnPtOeIPLYKpZLq3AnGN1UJ7jPMjZgluNyhKRnzA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxbvo0Fi6AdVi+TJzGeSZlHyrv/4WwXXe+nMgR13M53ySb7Oq11
	5wjbK+o63lHWDJquwMchLq2xF5v5J7ikQJrdL/SJew6NjxBoFPPoSkpL
X-Gm-Gg: ASbGncsPEJ5HKPJlSrbeYLvOoxQ2oHPSIsZ7TL/quIrPk2BMLaYbquq1+vxhfUnkTP1
	70SPC+MbGDTt55XpHOHJ5usrh26wHmNs8yv36YCB/BBO7I60yfJAK454MbOSAxAAGIFcIrEmkv5
	DrAXGiwrIL7qRSmhUmcL/GvvywVbYXsnOM19GhtrVmVTd3PBRB8oyTtKO9rluL46F/7Ld++vGm2
	8jMrUnIiKjhKFT90vkTGL+9Fk8r0ZuW2fto1vRifgHtXtYzK6XVbJzFD/ZevdWgL7GO3NSHDAKz
	tWS78QGF3sXCmPtvSDZl3xjnObf5cA/SqYoWu13hQfbj05MfVeQAFEz6kEfCh3HYDnnFFtAM
X-Google-Smtp-Source: AGHT+IHqKSXLEDIDvK1ewkGKwrTXtgongLwUTMsbD/SaHFNyxYGsWYrFBeu85E42gberp5i7LYNm4Q==
X-Received: by 2002:a17:90b:3d90:b0:310:cea4:e3b9 with SMTP id 98e67ed59e1d1-313af1e4772mr493331a91.34.1749577414252;
        Tue, 10 Jun 2025 10:43:34 -0700 (PDT)
Received: from DESKTOP-P76LG1N.lan ([42.113.163.91])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3134b044d91sm7470668a91.2.2025.06.10.10.43.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 10:43:33 -0700 (PDT)
From: Nam Tran <trannamatk@gmail.com>
To: lee@kernel.org
Cc: pavel@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	corbet@lwn.net,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Nam Tran <trannamatk@gmail.com>
Subject: [PATCH v9 1/4] dt-bindings: leds: add TI/National Semiconductor LP5812 LED Driver
Date: Wed, 11 Jun 2025 00:43:15 +0700
Message-Id: <20250610174319.183375-2-trannamatk@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250610174319.183375-1-trannamatk@gmail.com>
References: <20250610174319.183375-1-trannamatk@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The LP5812 is a 4×3 RGB LED driver with an autonomous animation
engine and time-cross-multiplexing (TCM) support for up to 12 LEDs
or 4 RGB LEDs. It supports both analog (256 levels) and PWM (8-bit)
dimming, including exponential PWM for smooth brightness control.

Signed-off-by: Nam Tran <trannamatk@gmail.com>
---
 .../devicetree/bindings/leds/ti,lp5812.yaml   | 264 ++++++++++++++++++
 MAINTAINERS                                   |   6 +
 2 files changed, 270 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/ti,lp5812.yaml

diff --git a/Documentation/devicetree/bindings/leds/ti,lp5812.yaml b/Documentation/devicetree/bindings/leds/ti,lp5812.yaml
new file mode 100644
index 000000000000..bbb4e293dac3
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/ti,lp5812.yaml
@@ -0,0 +1,264 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/ti,lp5812.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: TI LP5812 4×3 Matrix RGB LED Driver with Autonomous Control
+
+maintainers:
+  - Nam Tran <trannamatk@gmail.com>
+
+description: |
+  The LP5812 is a 4×3 matrix RGB LED driver with I2C interface
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
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 0
+
+patternProperties:
+  "^led@[0-3]$":
+    type: object
+    $ref: common.yaml#
+    unevaluatedProperties: false
+
+    properties:
+      led-cur:
+        $ref: /schemas/types.yaml#/definitions/uint8
+        description: |
+          LED current in 0.1 mA steps (e.g., 150 = 15.0 mA; 0 if not connected)
+        minimum: 0
+        maximum: 255
+
+      max-cur:
+        $ref: /schemas/types.yaml#/definitions/uint8
+        description: Maximum allowed current in 0.1 mA steps
+
+      reg:
+        minimum: 0
+        maximum: 3
+
+  '^multi-led@[4-7]$':
+    type: object
+    $ref: leds-class-multicolor.yaml#
+    unevaluatedProperties: false
+
+    properties:
+      reg:
+        minimum: 4
+        maximum: 7
+
+      '#address-cells':
+        const: 1
+
+      '#size-cells':
+        const: 0
+
+    patternProperties:
+      "^led@[4-9a-f]$":
+        type: object
+        $ref: common.yaml#
+        unevaluatedProperties: false
+
+        properties:
+          led-cur:
+            $ref: /schemas/types.yaml#/definitions/uint8
+            description: |
+              LED current in 0.1 mA steps (e.g., 150 = 15.0 mA; 0 if not connected)
+            minimum: 0
+            maximum: 255
+
+          max-cur:
+            $ref: /schemas/types.yaml#/definitions/uint8
+            description: Maximum allowed current in 0.1 mA steps
+
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
+              reg = <0x0>;
+              label = "LED0";
+              led-cur = /bits/ 8 <0x96>;
+              max-cur = /bits/ 8 <0xff>;
+            };
+
+            led@1 {
+              reg = <0x1>;
+              label = "LED1";
+              led-cur = /bits/ 8 <0x96>;
+              max-cur = /bits/ 8 <0xff>;
+            };
+
+            led@2 {
+              reg = <0x2>;
+              label = "LED2";
+              led-cur = /bits/ 8 <0x96>;
+              max-cur = /bits/ 8 <0xff>;
+            };
+
+            led@3 {
+              reg = <0x3>;
+              label = "LED3";
+              led-cur = /bits/ 8 <0x96>;
+              max-cur = /bits/ 8 <0xff>;
+            };
+
+            multi-led@4 {
+              #address-cells = <1>;
+              #size-cells = <0>;
+              reg = <0x4>;
+              color = <LED_COLOR_ID_RGB>;
+              label = "LED_A";
+
+              led@4 {
+                reg = <0x4>;
+                color = <LED_COLOR_ID_GREEN>;
+                led-cur = /bits/ 8 <0x96>;
+                max-cur = /bits/ 8 <0xff>;
+              };
+
+              led@5 {
+                reg = <0x5>;
+                color = <LED_COLOR_ID_RED>;
+                led-cur = /bits/ 8 <0x96>;
+                max-cur = /bits/ 8 <0xff>;
+              };
+
+              led@6 {
+                reg = <0x6>;
+                color = <LED_COLOR_ID_BLUE>;
+                led-cur = /bits/ 8 <0x96>;
+                max-cur = /bits/ 8 <0xff>;
+              };
+            };
+
+            multi-led@5 {
+              #address-cells = <1>;
+              #size-cells = <0>;
+              reg = <0x5>;
+              color = <LED_COLOR_ID_RGB>;
+              label = "LED_B";
+
+              led@7 {
+                reg = <0x7>;
+                color = <LED_COLOR_ID_GREEN>;
+                led-cur = /bits/ 8 <0x96>;
+                max-cur = /bits/ 8 <0xff>;
+              };
+
+              led@8 {
+                reg = <0x8>;
+                color = <LED_COLOR_ID_RED>;
+                led-cur = /bits/ 8 <0x96>;
+                max-cur = /bits/ 8 <0xff>;
+              };
+
+              led@9 {
+                reg = <0x9>;
+                color = <LED_COLOR_ID_BLUE>;
+                led-cur = /bits/ 8 <0x96>;
+                max-cur = /bits/ 8 <0xff>;
+              };
+            };
+
+            multi-led@6 {
+              #address-cells = <1>;
+              #size-cells = <0>;
+              reg = <0x6>;
+              color = <LED_COLOR_ID_RGB>;
+              label = "LED_C";
+
+              led@a {
+                reg = <0xa>;
+                color = <LED_COLOR_ID_GREEN>;
+                led-cur = /bits/ 8 <0x96>;
+                max-cur = /bits/ 8 <0xff>;
+              };
+
+              led@b {
+                reg = <0xb>;
+                color = <LED_COLOR_ID_RED>;
+                led-cur = /bits/ 8 <0x96>;
+                max-cur = /bits/ 8 <0xff>;
+              };
+
+              led@c {
+                reg = <0xc>;
+                color = <LED_COLOR_ID_BLUE>;
+                led-cur = /bits/ 8 <0x96>;
+                max-cur = /bits/ 8 <0xff>;
+              };
+            };
+
+            multi-led@7 {
+              #address-cells = <1>;
+              #size-cells = <0>;
+              reg = <0x7>;
+              color = <LED_COLOR_ID_RGB>;
+              label = "LED_D";
+
+              led@d {
+                reg = <0xd>;
+                color = <LED_COLOR_ID_GREEN>;
+                led-cur = /bits/ 8 <0x96>;
+                max-cur = /bits/ 8 <0xff>;
+              };
+
+              led@e {
+                reg = <0xe>;
+                color = <LED_COLOR_ID_RED>;
+                led-cur = /bits/ 8 <0x96>;
+                max-cur = /bits/ 8 <0xff>;
+              };
+
+              led@f {
+                reg = <0xf>;
+                color = <LED_COLOR_ID_BLUE>;
+                led-cur = /bits/ 8 <0x96>;
+                max-cur = /bits/ 8 <0xff>;
+              };
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


