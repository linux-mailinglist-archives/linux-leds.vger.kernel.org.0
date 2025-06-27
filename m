Return-Path: <linux-leds+bounces-4900-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9661CAEB484
	for <lists+linux-leds@lfdr.de>; Fri, 27 Jun 2025 12:26:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 76B844A140F
	for <lists+linux-leds@lfdr.de>; Fri, 27 Jun 2025 10:24:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DC60298994;
	Fri, 27 Jun 2025 10:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20230601.gappssmtp.com header.i=@thegoodpenguin-co-uk.20230601.gappssmtp.com header.b="xkpy/Cha"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 912DF2BF001
	for <linux-leds@vger.kernel.org>; Fri, 27 Jun 2025 10:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751019648; cv=none; b=Q0c3lKMsasnki7wj22wRWmF+cZNn2pa+qzRvxSuUW8rSubSbL/BL4a3rflWXTY771qTc6RHjsA8p4dbc5PJ+giZqoFapSVzyZfM0g8d1i3jEUZVbfOCwkbwe906beXqS8DsR+8S0RmmRPpyH4SeKvghd5bCbddWb9qB9orfRQ9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751019648; c=relaxed/simple;
	bh=zhuGDkkhJS7I8pqhd1IcnO9NCLxsLpxBsArw1hys9IE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uH0BzCcixE2alRxCcnG7cC7dHiggf3hjhsLdh4vJlQjY3LDsIwg/EAWtBvUE3IrIxVekTtnFP/HoaoWy1lumFaFcEJMK+nMhZ2YzqCfrmWkW8+PPKVKkf+SDMYB/m+zmuYXmM8P5GovjMxPcJ3BGeWYkQMnMWokhBfPt/DI9/iE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk; spf=pass smtp.mailfrom=thegoodpenguin.co.uk; dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20230601.gappssmtp.com header.i=@thegoodpenguin-co-uk.20230601.gappssmtp.com header.b=xkpy/Cha; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3a52874d593so1594174f8f.0
        for <linux-leds@vger.kernel.org>; Fri, 27 Jun 2025 03:20:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20230601.gappssmtp.com; s=20230601; t=1751019644; x=1751624444; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SlCbMuzexlv10E5zuaL1lN5uwOtPNIH7IK7UYUCTH4s=;
        b=xkpy/ChabsZyR6/hwcni+tp6jpCN/9E+qJLWYVeKDqD+rdwk1oPDd7d+zp1cRpisYu
         LqZEdunGPivRLplPnxxwi/seGOKbeCNYwpvstNomjr1yLwFAXCNw67ln5Y5agqtW/S7Y
         3g4ehIcEVYZRyFQ1Dqi/wLKQOsJlXXOKeXurTpL5lOOQNuLBP4OpDCMrAhJc4tPfzsAn
         qpoyhbqyViUdJYFAugkuli2xSSkbSh2ySZ/NIncvlW3BDU5gcvDiB1eUyvv83ed0LjYb
         fFJU3+ES+hI0lFRpb/41bQsldYom2zT3DPNDnXAJYrFaNd7jyj07hwPkO9fulVGN8+Zu
         LGoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751019644; x=1751624444;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SlCbMuzexlv10E5zuaL1lN5uwOtPNIH7IK7UYUCTH4s=;
        b=KnJZBrr/kyiu3WkNY6Cs2RJfKXkkLaHFCNT096FezyV9qiyN4k412porWI9ItPFWnS
         Qz5en5wIwDW4tpe33Gvc0aSUcSB/SJrtt+/zLdtI7Zh5rCFKiHHBnawwyifeO50OWG9s
         cAcBAXD9ow8n7gOgeOoUaqmvVF3a/W2YGf/ikuwcxhB3zRxt1yHGqhBNNNxNI8r/LIUV
         /TjoueNzso3NcuORIZlIlh/sa5/+TQCsDrFqas+BrWTm0BPGzFYqdE+0eKFLDOFyZplm
         EFUYCu/H/oZr0dgHZLkamQczsdxgIMZERavrLNrnbug4VFCJnqpFa+exBeDAP5lHnEBy
         Edqg==
X-Gm-Message-State: AOJu0Yx3GIRhgttaGjAqUv7xWRv9a7nKYIIEZDwukRa+D+DeH3zmHJHz
	GBBO6sep1bUA9lHdJX7OnWUOSerrcd5LYgtJnaneT/O0uihg3GKsiAa7toUfyH4HxaI=
X-Gm-Gg: ASbGncv1yho5/bWcr7T/Fej7LVT7TzzcgRpjCNoNSGTChMIeNebE30Rvr+F7R+l3bJl
	u/RFH/4nUh58DEC2ZEypKhNVVQQgos6IX9y4ktMt/mUlKNOTtuZcB1EKRLqFyxPrn8zfm0o74Bh
	3zunYC/y9dtrUjN4k6U13B/1R3XwgNVhIRqxbUv92mi9x5CzoUebLAi3jAI7MpXNHB28+lwN0uE
	M2+8SDLmrIbe4SEY1FP3GmmUPrZbsrqsToGNMXviWOF7q8cDBu8DRanOYjXWC9nx9OX8fNJJ141
	++YZ2768Wp580woJGrwFmKdGvzqovwOfnPgkD9aPOpH8GrOWsnKx5LjL/ZCaOOsa/iKY4GjITq0
	P1iE=
X-Google-Smtp-Source: AGHT+IHad6lA4a76jkzQzgcDir8P2oxGoibcmqO0xkXRw8HFUVJ8tR6hDzxp1ls+/RojmaB8/xq1Rg==
X-Received: by 2002:a05:6000:2082:b0:3a5:2875:f985 with SMTP id ffacd0b85a97d-3a90066afb5mr2808811f8f.59.1751019643890;
        Fri, 27 Jun 2025 03:20:43 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:23c7:1d1a:9c01:1a4a:198c:c191:f3d7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a88c7e7524sm2331700f8f.12.2025.06.27.03.20.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 03:20:43 -0700 (PDT)
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Date: Fri, 27 Jun 2025 11:20:36 +0100
Subject: [PATCH v2 2/3] dt-bindings: leds: is31fl32xx: convert the binding
 to yaml
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250627-leds-is31fl3236a-v2-2-f6ef7495ce65@thegoodpenguin.co.uk>
References: <20250627-leds-is31fl3236a-v2-0-f6ef7495ce65@thegoodpenguin.co.uk>
In-Reply-To: <20250627-leds-is31fl3236a-v2-0-f6ef7495ce65@thegoodpenguin.co.uk>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Pavel Machek <pavel@ucw.cz>, devicetree@vger.kernel.org, 
 Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>, 
 Lucca Fachinetti <luccafachinetti@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751019641; l=4978;
 i=pzalewski@thegoodpenguin.co.uk; s=20250625; h=from:subject:message-id;
 bh=Y6HqHEdvYmDTfde8WCMrHIoL7OYunCUZmqOz72jZEQg=;
 b=Lw6Z+9WTPTahGM8jLLuckyw+9mV6swF+niWSYrARAE+0fRjRLzmHfxPpnRj/nH7b2ZvbcP066
 +2sC7LDpNcoD/JO+9P4RgapkEvzx58zeyl/9qQtfU/3LPHQf/qcYXtp
X-Developer-Key: i=pzalewski@thegoodpenguin.co.uk; a=ed25519;
 pk=hHrwBom/yjrVTqpEvKpVXLYfxr6nqBNP16RkQopIRrI=

From: Lucca Fachinetti <luccafachinetti@gmail.com>

Keep the old maintainers field as is.
Add datasheets for reference, NB that I was not able to find an
up-to-date, funtional direct URL for si-en products datasheet
so they were skipped.

Co-developed-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Signed-off-by: Lucca Fachinetti <luccafachinetti@gmail.com>
---
 .../devicetree/bindings/leds/leds-is31fl3236.yaml  | 101 +++++++++++++++++++++
 .../devicetree/bindings/leds/leds-is31fl32xx.txt   |  52 -----------
 2 files changed, 101 insertions(+), 52 deletions(-)

diff --git a/Documentation/devicetree/bindings/leds/leds-is31fl3236.yaml b/Documentation/devicetree/bindings/leds/leds-is31fl3236.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..f26340850647d1c642fb345b7cf90764200e13ee
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/leds-is31fl3236.yaml
@@ -0,0 +1,101 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/leds-is31fl3236.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: is31fl32xx and Si-En SN32xx IC LED driver
+
+maintainers:
+  - Pavel Machek <pavel@ucw.cz>
+  - Lee Jones <lee@kernel.org>
+
+description: |
+  The is31fl32xx/SN32xx family of LED drivers are I2C devices with multiple
+  constant-current channels, each with independent 256-level PWM control.
+  Each LED is represented as a sub-node of the device.
+
+  For more product information please see the links below:
+    https://www.lumissil.com/assets/pdf/core/IS31FL3236_DS.pdf
+    https://www.lumissil.com/assets/pdf/core/IS31FL3236A_DS.pdf
+    https://www.lumissil.com/assets/pdf/core/IS31FL3235_DS.pdf
+    https://www.lumissil.com/assets/pdf/core/IS31FL3218_DS.pdf
+    https://www.lumissil.com/assets/pdf/core/IS31FL3216_DS.pdf
+
+properties:
+  compatible:
+    enum:
+      - issi,is31fl3236
+      - issi,is31fl3236a
+      - issi,is31fl3235
+      - issi,is31fl3218
+      - issi,is31fl3216
+      - si-en,sn3218
+      - si-en,sn3216
+
+  reg:
+    maxItems: 1
+
+  '#address-cells':
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+patternProperties:
+  "^led@[1-9][0-9]*$":
+    type: object
+    $ref: common.yaml#
+    additionalProperties: false
+
+    properties:
+      reg:
+        minItems: 1
+        description:
+          LED channel number (1..N)
+
+      label: true
+
+      linux,default-trigger: true
+
+    required:
+      - reg
+
+required:
+  - compatible
+  - reg
+  - "#size-cells"
+  - "#address-cells"
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
+        s31fl3236: led-controller@3c {
+          compatible = "issi,is31fl3236";
+          reg = <0x3c>;
+          #address-cells = <1>;
+          #size-cells = <0>;
+
+          led@1 {
+            reg = <1>;
+            label = "EB:blue:usr0";
+          };
+          led@2 {
+            reg = <2>;
+            label = "EB:blue:usr1";
+          };
+          led@3 {
+            reg = <3>;
+            label = "EB:blue:usr35";
+          };
+        };
+    };
+...
+
diff --git a/Documentation/devicetree/bindings/leds/leds-is31fl32xx.txt b/Documentation/devicetree/bindings/leds/leds-is31fl32xx.txt
deleted file mode 100644
index 926c2117942c4dc200fcd68156864f544b11a326..0000000000000000000000000000000000000000
--- a/Documentation/devicetree/bindings/leds/leds-is31fl32xx.txt
+++ /dev/null
@@ -1,52 +0,0 @@
-Binding for ISSI IS31FL32xx and Si-En SN32xx LED Drivers
-
-The IS31FL32xx/SN32xx family of LED drivers are I2C devices with multiple
-constant-current channels, each with independent 256-level PWM control.
-Each LED is represented as a sub-node of the device.
-
-Required properties:
-- compatible: one of
-	issi,is31fl3236
-	issi,is31fl3235
-	issi,is31fl3218
-	issi,is31fl3216
-	si-en,sn3218
-	si-en,sn3216
-- reg: I2C slave address
-- address-cells : must be 1
-- size-cells : must be 0
-
-LED sub-node properties:
-- reg : LED channel number (1..N)
-- label :  (optional)
-  see Documentation/devicetree/bindings/leds/common.txt
-- linux,default-trigger :  (optional)
-  see Documentation/devicetree/bindings/leds/common.txt
-
-
-Example:
-
-is31fl3236: led-controller@3c {
-	compatible = "issi,is31fl3236";
-	reg = <0x3c>;
-	#address-cells = <1>;
-	#size-cells = <0>;
-
-	led@1 {
-		reg = <1>;
-		label = "EB:blue:usr0";
-	};
-	led@2 {
-		reg = <2>;
-		label = "EB:blue:usr1";
-	};
-	...
-	led@36 {
-		reg = <36>;
-		label = "EB:blue:usr35";
-	};
-};
-
-For more product information please see the links below:
-http://www.issi.com/US/product-analog-fxled-driver.shtml
-http://www.si-en.com/product.asp?parentid=890

-- 
2.48.1


