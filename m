Return-Path: <linux-leds+bounces-3412-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C785D9D13BB
	for <lists+linux-leds@lfdr.de>; Mon, 18 Nov 2024 15:56:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 88FD32834F3
	for <lists+linux-leds@lfdr.de>; Mon, 18 Nov 2024 14:55:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7721B1AA1C2;
	Mon, 18 Nov 2024 14:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=remote-tech-co-uk.20230601.gappssmtp.com header.i=@remote-tech-co-uk.20230601.gappssmtp.com header.b="fGvIvmss"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 862C01B6D09
	for <linux-leds@vger.kernel.org>; Mon, 18 Nov 2024 14:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731941707; cv=none; b=IkZJQCtW3uOcm96JjjUQ6adUrxQkfVTFdVD9n5HYewkxkaWgnATQLaH7rXs/NgGhEPll/9BTvd3qp0FVjgOb1m+mq/qW48MHW/oROhWehUH3BPU3+YR5AF5dBbPT5/GVSUxyX9AT6rUyJrgLafemwRfEV4AqhP+ikt1zio8T6Ho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731941707; c=relaxed/simple;
	bh=dv2/+Rc9yxwcZ2ND2dAyftrng/AjLfmMhWY48feSw7c=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SZa9RqGZBvE0rjEgEIvFc32lBFrpsIN43V/JZM03Esn2QVpOLQ8cp+Psp0ksT6iVImfGL/DKNugBCqLcZLP7WeTcb8WfisVCMdVCZe5AAoGZdJitkQM/U5dtSZ1T5okn8oGlr86iwkqdolyeYa+u1NiUoisF1O76r4IhwXJjC+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=remote-tech.co.uk; spf=pass smtp.mailfrom=remote-tech.co.uk; dkim=pass (2048-bit key) header.d=remote-tech-co-uk.20230601.gappssmtp.com header.i=@remote-tech-co-uk.20230601.gappssmtp.com header.b=fGvIvmss; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=remote-tech.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=remote-tech.co.uk
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5cfa90e04c2so2734482a12.1
        for <linux-leds@vger.kernel.org>; Mon, 18 Nov 2024 06:55:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=remote-tech-co-uk.20230601.gappssmtp.com; s=20230601; t=1731941703; x=1732546503; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HDksoDp0rwZZvhM7tfWOTul1zfu84mkjAf3xJn2pMg8=;
        b=fGvIvmssmzboydxCuDt04lVh1xlmklOQlJivFCKjbCUNRR15kwabjQ6iYceWlKardT
         Rm+IUDsMADTPg9Pe22xTWb4vyTfohkSFUBDRUDq3e7pXpi/aeUktgKwMxVyqjCIKJGhk
         5P5wb7PRsXt99rQ4uhExXiM/GwGFMnuhq6wt7pKhGHJ5x5QRnJUBp1XzF+oeEMEqiVNg
         5tyixfTH1D4Vs3NSyP0w7gy6sR7f2/xY1cghLypkRxmNPe253tqXoJqecdyL4HmS48Kx
         m0JNUUKFMf7FnL+Yajk/OuUMm82CPAbxaG+NNAtclYf0UV2rpPs4/2QXjHziDIzWEbTD
         S0Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731941703; x=1732546503;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HDksoDp0rwZZvhM7tfWOTul1zfu84mkjAf3xJn2pMg8=;
        b=A3M1iOCOYO+KrYXZPY1ldJoMzJ1gCt2iNoEJVXFkQXTrCKbLZf67UrGevoso8BRJfR
         qQ/hhfxsmMkqKipiDdMYDnHW+dLaybxR0r2O/0XHdy0hpoOjkh4bbo11Zzke/TzBvp6J
         UtRxLOgJgtkCwV6uug73mNMZ7TN4hbOB3KdyaRinZdqs5ZjWF4iQRHDUMShhMWeGhVnW
         4+p5oyTVgnmDyT6bzJ2wEKgLC7TJ1Dxkce2mup8R9GXHS8MGo9CiH7LWBGvwSVCZSlFB
         5JQBUQxHMy2KcOQ/bsZMVKdV0KgmnE8218ePboiWOo8cBtoFyqVwCUWG2mxsfkBEiwYs
         NBlw==
X-Forwarded-Encrypted: i=1; AJvYcCW9Xiu32HBsyjxgCnmRMok2ZRTH0g+AFTMp/KGV2kxtYxYouL7WtlCzTSc0Sk1si+MW1OU+xtl6dcDm@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1fwTaoVZIx3ZwEhNmxPkZRf5k9pj60L/BF3lJDaOeUGOkxsv7
	wMYg9ZjBKGLlRhMc7JmamZ0DKwT/GN1u2igTNaEEh8zo5CuNuodQ3gHh9n3ebe1hCWP0cW8XAPE
	kP9Y138PaUZe8mfnkkdig8vCHYnh+OASehLUG6W/8ZaITGuem4FWqtLtj0Xen5hpJM6+58kMqce
	zfTgDoFphBkfcWuLez3NQcyr/xzQknenvjvkVesA==
X-Google-Smtp-Source: AGHT+IEw/8Rd958gcjQ3nia1tg5M9oS0PLVfT7Ts7ZiqMxu69u1ESP6k5StqjkwwG6LrEz5Pxdj+hg==
X-Received: by 2002:a17:907:1c29:b0:a9e:df65:3a81 with SMTP id a640c23a62f3a-aa483554f81mr886273566b.59.1731941702918;
        Mon, 18 Nov 2024 06:55:02 -0800 (PST)
Received: from localhost.localdomain ([178.27.36.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa20df1b642sm546125666b.40.2024.11.18.06.55.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Nov 2024 06:55:01 -0800 (PST)
From: Vicentiu Galanopulo <vicentiu.galanopulo@remote-tech.co.uk>
To: Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Vicentiu Galanopulo <vicentiu.galanopulo@remote-tech.co.uk>,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH v7 2/3] dt-bindings: leds: Add LED1202 LED Controller
Date: Mon, 18 Nov 2024 14:54:44 +0000
Message-Id: <20241118145449.7370-3-vicentiu.galanopulo@remote-tech.co.uk>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241118145449.7370-1-vicentiu.galanopulo@remote-tech.co.uk>
References: <20241118145449.7370-1-vicentiu.galanopulo@remote-tech.co.uk>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The LED1202 is a 12-channel low quiescent current LED driver with:
  * Supply range from 2.6 V to 5 V
  * 20 mA current capability per channel
  * 1.8 V compatible I2C control interface
  * 8-bit analog dimming individual control
  * 12-bit local PWM resolution
  * 8 programmable patterns

If the led node is present in the controller then the channel is
set to active.

Signed-off-by: Vicentiu Galanopulo <vicentiu.galanopulo@remote-tech.co.uk>
---
 .../devicetree/bindings/leds/st,led1202.yaml  | 132 ++++++++++++++++++
 1 file changed, 132 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/st,led1202.yaml

diff --git a/Documentation/devicetree/bindings/leds/st,led1202.yaml b/Documentation/devicetree/bindings/leds/st,led1202.yaml
new file mode 100644
index 000000000000..f1e5e4efaa3a
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/st,led1202.yaml
@@ -0,0 +1,132 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/st,led1202.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ST LED1202 LED controllers
+
+maintainers:
+  - Vicentiu Galanopulo <vicentiu.galanopulo@remote-tech.co.uk>
+
+description: |
+  The LED1202 is a 12-channel low quiescent current LED controller
+  programmable via I2C; The output current can be adjusted separately
+  for each channel by 8-bit analog and 12-bit digital dimming control.
+  Datasheet available at
+  https://www.st.com/en/power-management/led1202.html
+
+properties:
+  compatible:
+    const: st,led1202
+
+  reg:
+    maxItems: 1
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+patternProperties:
+  "^led@[0-9a-f]$":
+    type: object
+    $ref: common.yaml#
+    unevaluatedProperties: false
+
+    properties:
+      reg:
+        minimum: 0
+        maximum: 11
+
+    required:
+      - reg
+
+required:
+  - compatible
+  - reg
+  - "#address-cells"
+  - "#size-cells"
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
+        led-controller@58 {
+            compatible = "st,led1202";
+            reg = <0x58>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            led@0 {
+                reg = <0x0>;
+                function = LED_FUNCTION_STATUS;
+                color = <LED_COLOR_ID_RED>;
+                function-enumerator = <1>;
+            };
+
+            led@1 {
+                reg = <0x1>;
+                function = LED_FUNCTION_STATUS;
+                color = <LED_COLOR_ID_GREEN>;
+                function-enumerator = <2>;
+            };
+
+            led@2 {
+                reg = <0x2>;
+                function = LED_FUNCTION_STATUS;
+                color = <LED_COLOR_ID_BLUE>;
+                function-enumerator = <3>;
+            };
+
+            led@3 {
+                reg = <0x3>;
+                function = LED_FUNCTION_STATUS;
+                color = <LED_COLOR_ID_RED>;
+                function-enumerator = <4>;
+            };
+
+            led@4 {
+                reg = <0x4>;
+                function = LED_FUNCTION_STATUS;
+                color = <LED_COLOR_ID_GREEN>;
+                function-enumerator = <5>;
+            };
+
+            led@5 {
+                reg = <0x5>;
+                function = LED_FUNCTION_STATUS;
+                color = <LED_COLOR_ID_BLUE>;
+                function-enumerator = <6>;
+            };
+
+            led@6 {
+                reg = <0x6>;
+                function = LED_FUNCTION_STATUS;
+                color = <LED_COLOR_ID_RED>;
+                function-enumerator = <7>;
+            };
+
+            led@7 {
+                reg = <0x7>;
+                function = LED_FUNCTION_STATUS;
+                color = <LED_COLOR_ID_GREEN>;
+                function-enumerator = <8>;
+            };
+
+            led@8 {
+                reg = <0x8>;
+                function = LED_FUNCTION_STATUS;
+                color = <LED_COLOR_ID_BLUE>;
+                function-enumerator = <9>;
+            };
+        };
+    };
+...
-- 
2.39.3 (Apple Git-145)


