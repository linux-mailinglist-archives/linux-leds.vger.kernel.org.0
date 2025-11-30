Return-Path: <linux-leds+bounces-6353-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 63774C951D6
	for <lists+linux-leds@lfdr.de>; Sun, 30 Nov 2025 16:40:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0021E3A29C8
	for <lists+linux-leds@lfdr.de>; Sun, 30 Nov 2025 15:40:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 894BF27F727;
	Sun, 30 Nov 2025 15:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WbAmPc6F"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D984283FDD
	for <linux-leds@vger.kernel.org>; Sun, 30 Nov 2025 15:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764517217; cv=none; b=g0M4n6JA9ze1CXiFfR/vT3EobErDT0lHYRwvx8yFdf4P0pZUcL31ofaYOVDCCqhmQAwNdxXJcEdQVIZykAqiNvAEt5pvDXwwcfJpIMbQ08gqDwSfWdtuB5rQPMh74B9IQ5j/WtnRfKYQ1J/XTSFbaeb//I/AFDXoV+F9lUtOZd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764517217; c=relaxed/simple;
	bh=zkn8kltLhz23EcttZ3N9WNmv4oYYrlz6KY+wvuCiKpM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NFpOSnNmT7mqVjiqhrw6spbQcp8+si16dB1ZBhnGGKe3n63dBMvhcIc1G9LM/pA7IfG4QmcgTSBvmasdCdeXQq9noJb0NvfgiAxXcOTn/oyF8k5ZXaA7gRsCcE9dGUo8rUC78YWzCIHsECVtqPn6aUEkTbV5PSnwaGLYzP6UbtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WbAmPc6F; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-29812589890so39697555ad.3
        for <linux-leds@vger.kernel.org>; Sun, 30 Nov 2025 07:40:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764517214; x=1765122014; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P6T+D/cptipZ1zMSMuOxtYB2gBcAx2I+UDBRGZjvt1w=;
        b=WbAmPc6F+waHectJNLeIHKWMRYIUTU8jz0Shmx96NKTHV8KgESClYRQpWjHfYBIbIa
         BNDlYlLmsQrorbSLLPAZpA5LLDVvlS/IFdeX979lgdv9zz9H6H8IwFVa8dV6bK9lXlBc
         tCN4HXle4sPJ30CH7FLBXRqx/lxbk/LCztqazq5O2AYLs608VroUfwST0HNpvumbQFWi
         76vPUA4+ZDpEDj4Cqjndej53RAKDq4+7k+HWagF0ic1wX9sUfV5H76CnbquhNUwuc6kn
         lMCy1rwOLZCqwKy/GcfDZo50gtLfdEax9b3SHXbJnl1wE/mcZ7lgeYemYwthiEzkQTjD
         eXig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764517214; x=1765122014;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=P6T+D/cptipZ1zMSMuOxtYB2gBcAx2I+UDBRGZjvt1w=;
        b=d53o5MBt/1BDLAL6/bNY6U3ezsYT30guhzswV1D7xSJlq8h8AWxMIT7K5DyCApqwU8
         A2tzFiCauvLXojHetUDis4g1/D6PzxKiLxOpmIpGbQkEtPpZVGRxgOfRnKP0c7Dv+lx1
         GpMec250CSvgeO8nVdzZydu3TswRETD8WreQZOUATEoTUL2mVt9ZM4RlNkCDQjmvmhuZ
         PdXpOOVu1t93bxewx5XCurDhm2ZMnqtNRQfdMijIfFkVCrbLV8M8MWJttCVT47O/kSrs
         EaGytas7+3fJlR94owUwxkom5l0D4AQbX6DCxb9w45Vno+pvIS8r8XhbK8grvlmyP+Ud
         tA9g==
X-Forwarded-Encrypted: i=1; AJvYcCUEu8heR88dODXhyUMChefF/3oCjqG6+xUjRz92O3KDESBBMeZnbzGeYqOC/A8um3qq6Q9ykK03vrly@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8+GLYqzaRxC9MJRFTm3Tpf8arS0pkgegwRHUxUU6WhHOih+ZY
	M4uNsnz6LYCJHzIZcQAZl2LbFLIgtlHtBoQMs1b4aLhBIMivSANcdINRcUM5Ag==
X-Gm-Gg: ASbGncs/gNJxJTOwWpZPzUZtdxQ3huIZX0iXuofz0Qigr0xDaxaO6pcHRGTOiY5FcVH
	SF1VMp/EwBWCigP1WA9JingaavmJ70rZQbqbzu4HXV1SR4eH5L2fxadZT9hGlDFvuGoGbe5rC01
	3Mw+uCfuWPjtq29Oj5SewbPWYLSoE3NBad4CvtAY0cElE7Jx+ZKqdr/Yiudd5HvxtkYvPiqKEtA
	SFuVSoze1cVVFLmrCXQf+RWARAanaJAGFQZ59yK0MX/6OxUknOHugK88Gy+yKYfOa3FbRNDRocy
	Z8NT4+1qIQt68ebAK43Qzt/uc4pU9duNWAVv4MuImZKTuxYcNeIe4p1p3HUPiZxGkwBa1RZ3u2p
	u9zwSvpeb/PcXnU4XNNboal6YW5pAizRK5kEXOZDakDL5q2p+BeaLyjESjAJeyN/KooqCnHUvDB
	RM7znXfL9fctGiVaUja020QQ==
X-Google-Smtp-Source: AGHT+IHOY1KfmkmH9Lc/h5ln083JWiO/Ogem/bMvB7ufGSvT42AL5nZXRP0qWF+b0kKkAxm1iYr11g==
X-Received: by 2002:a17:902:ebca:b0:295:20b8:e104 with SMTP id d9443c01a7336-29b6bfb2dbfmr355613115ad.58.1764517213656;
        Sun, 30 Nov 2025 07:40:13 -0800 (PST)
Received: from DESKTOP-P76LG1N.lan ([42.116.199.188])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-be5e7485b1esm8640097a12.20.2025.11.30.07.40.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Nov 2025 07:40:12 -0800 (PST)
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
Subject: [PATCH v19 1/3] dt-bindings: leds: add TI/National Semiconductor LP5812 LED Driver
Date: Sun, 30 Nov 2025 22:39:54 +0700
Message-Id: <20251130153956.241375-2-trannamatk@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251130153956.241375-1-trannamatk@gmail.com>
References: <20251130153956.241375-1-trannamatk@gmail.com>
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
index e8f06145fb54..5b78d65e7625 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25449,6 +25449,12 @@ S:	Supported
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


