Return-Path: <linux-leds+bounces-5415-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E5EDAB47C36
	for <lists+linux-leds@lfdr.de>; Sun,  7 Sep 2025 18:10:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 89931175EC3
	for <lists+linux-leds@lfdr.de>; Sun,  7 Sep 2025 16:10:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51263280CC1;
	Sun,  7 Sep 2025 16:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jd3MmFwT"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 905E9275105;
	Sun,  7 Sep 2025 16:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757261424; cv=none; b=heTAmj1Y92ZCQSh3lpH919WIsCHeXZH1wh2zHHUtn/T/apUgXjwYoKl/tZKnpfjetmhcVwBFYKU8FoPKqQsuuzbvI3uVKVKCe0rb+bVwTwzj91diIEj1vg1a8MzS/hUktjyA49BUBaSJS/+uRC//Q8OVLZon88hbUcJxMyW+sFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757261424; c=relaxed/simple;
	bh=n9Lpx9McNinIfA9ROPkSjRx5pQCxQW6nEiHNBiVHhSw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=s88wrlpk3Ru+a/H1rMMFaiXA9Nu+MHzcPQqno95whzee6Q13l21fjttgfQTl1Af5pXe6YqWn6VZ5PtDStvA4YTnmVXi0ysX14bOQ7zX9o27K0hR2fpYs/udiePi1tmPIx1Ax0cWKmqtI1Q5Po0E07AkiNYkTGjLuwbzLmMtDV/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jd3MmFwT; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-7722f2f2aa4so4659787b3a.1;
        Sun, 07 Sep 2025 09:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757261422; x=1757866222; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m9H6ojRY7FFUxfHSDhL/2oTeRM1p4iDONo99sgHmtgU=;
        b=Jd3MmFwTPCamsTlqPfqVHislH7Hmr9xCbHp/4wmOKVVpBiGSRqwtTAT6y9MswOzcCb
         f+75EK38PAEIuSyXJZMANa+jf10rDYRwawgIbB26tclIPx8ioEWr90lCLgKlbquq8CaZ
         5cs71Y6Iuthc931ikIJ62lhzGUgoC6dtnSDBqkEPeEZrO7djEdfJrvAICUq1SoL96stT
         EOxBPswK742d5La1nqXQSwi9HwJZam35KwlzqPgI9540mpmq82QVA6y54S2SI7vrzV+n
         tgGApeiEcxHCvQxk1h8TWclAnEgkQSz/zcVbIQA/AUrwuDHZ6ciM2ep6JtwYOIsBv7jb
         2SpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757261422; x=1757866222;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m9H6ojRY7FFUxfHSDhL/2oTeRM1p4iDONo99sgHmtgU=;
        b=a6u2c1nXNJNZ/ibddrtJQjOwdGNr+iqyeSxOkcZTsRXBln6xCKTeXZgfOiWtrGFak6
         t6yaMdssgK0+nbo+6r+i2z5MsB9XOF32eOKVzLHKdshUo7B8cAwlVnXBHPXJMNlyTTYA
         UBwmiyeHETGapT81z6pkmA3iQJCYrGf0tOEnp/dZlpFFrA4HlZFmGcm+0xhL6xqzLLqu
         sBAFV8cthZt8cRBJQZlICSu95sljdImRJHChURKiYVMs4xJsh1iARPwp5rqA1PUVMinz
         uQl9rCYVaHquKYI4zGdM4a6Jr9Cx/5WY9Bq32RyM131QLOwxB6IAAN13GKj3mvK7n6+L
         0wlA==
X-Forwarded-Encrypted: i=1; AJvYcCVEtKjzjN+Z35r/umjeUwyDvDo9uqX9d9cxOvlbKoUB/r3/wwmuRI9Sjz6N/Q0Qa1yRsjBQKj6ptBzA@vger.kernel.org, AJvYcCVQdFeYvA7sHR9iwW5z70V74Og4wqPIR+RKmzPHS7vBOidV04UcC6QLDQrEz1HehOyk+FfJLCzQKqQd@vger.kernel.org, AJvYcCWTiqSmlpPWD4tGIkV+crEpTxFm8A+7vVXko9VLYOUrFVVP2wLf1LT/vcIBXsX2X1QvDnHx/dFhtwpniA==@vger.kernel.org, AJvYcCWYd3Sl5e3ULyhE2+y4Oxt9AU6bVtDTi6ZqbhiJE4l1p49WRrOe1MT8DxtDnQrDbOMEdyivsT3/irfiu4zd@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+ueDlRcpIrT4P9KbmylrQ9E/9I5uF/0cFERX+vL7Vb/lk0ixP
	xMM5AtEpWlMp5IqWUSXrnauv6lqbPJ20L1ddaqiY+X+CenGErL0vusx39uDyTg==
X-Gm-Gg: ASbGncuz8Yeb7epkhTWVUVw9MxZeRChXS2vuxW+yYyqlNk9ebUAgFTbR/jXK/neAv75
	TxOxwlhgffI7Pd1WQ+gA/Vp/u6ESjdUY4yX0Otf9VJIWTRKu3q4iEmP/ziiVbVk9NE7Ju4cPj7Y
	3yYnFa5Tqj1cIYWj95VpdNon460Manxq6vfKdvd7kbE45c7BDop5Y7By/36W9Z7hinnKrJvnBKV
	lqda6MWIQOxtZGWG9bn7kSVrnyjOxeLOtuUrJUF2kRMllB1J7NRok4vcj1kXtmHxc2IZP6qz1xh
	cqApQ2rCCq/9YdiORVELNiqDAVQYHpJHaieCGRnUrAck3QgNhzZNyfa2PVBGuIIr5oo9hX/cLPL
	LuXFBgK4zN4tJLT2Rer3MHOLzpJp4eR91d4tzGkHmgseFLdU=
X-Google-Smtp-Source: AGHT+IF6ftGhL2CelqQaMYG3qdXHPqHCTBuAINdK8vPsGWI2iQGWgy5ubyuVUF9alBC51xemVDj81A==
X-Received: by 2002:a05:6a20:4327:b0:252:525c:2c35 with SMTP id adf61e73a8af0-2533fab6f85mr7058606637.16.1757261421844;
        Sun, 07 Sep 2025 09:10:21 -0700 (PDT)
Received: from localhost.localdomain ([113.177.224.50])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7723534c0a8sm25352541b3a.79.2025.09.07.09.10.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Sep 2025 09:10:21 -0700 (PDT)
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
Subject: [PATCH v14 1/4] dt-bindings: leds: add TI/National Semiconductor LP5812 LED Driver
Date: Sun,  7 Sep 2025 23:09:41 +0700
Message-Id: <20250907160944.149104-2-trannamatk@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250907160944.149104-1-trannamatk@gmail.com>
References: <20250907160944.149104-1-trannamatk@gmail.com>
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
index cd7ff55b5d32..e585a11b3fc9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -24993,6 +24993,12 @@ S:	Supported
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


