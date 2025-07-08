Return-Path: <linux-leds+bounces-5011-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B091AFCE6C
	for <lists+linux-leds@lfdr.de>; Tue,  8 Jul 2025 17:00:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2004A427806
	for <lists+linux-leds@lfdr.de>; Tue,  8 Jul 2025 15:00:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 388562E11A5;
	Tue,  8 Jul 2025 15:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20230601.gappssmtp.com header.i=@thegoodpenguin-co-uk.20230601.gappssmtp.com header.b="x5l4pxoe"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A3362E0913
	for <linux-leds@vger.kernel.org>; Tue,  8 Jul 2025 15:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751986822; cv=none; b=AZUtiYGd+OMCuBJQxv90pmIbvuJjiXQdxuNgAHphZXf/Epfh/5VDCGc72x80NTF5kl2Ysqv1r/LdjuTvDkJ4MCeo10RPNntyWV+NfVS1TXU9AxaD/m+mhOCG3JGGUIHyv8OgqsZerB7Mn3reJ7FSRM7lt2TE3/wImR+7f2waCas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751986822; c=relaxed/simple;
	bh=FPX/eEaqpH8qU+rS++BnIeYPCic7RV1bMRw88k4MzoI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QhKesOcX2iUK6vfMef8ESC3B+ff/rTSC0r6Qzhnwm48WIMM8zUMzZAUt2iqFtfbjlvrlQj0isRR2zV2vBqQJQD7fPkaA8jzq9LDXmmc4SR5plGk/A9nGB0HaDwMg2W03mTiqP1mq1zDW3fK7WBuekcaMvLoo/ablYJz9GYl+TcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk; spf=pass smtp.mailfrom=thegoodpenguin.co.uk; dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20230601.gappssmtp.com header.i=@thegoodpenguin-co-uk.20230601.gappssmtp.com header.b=x5l4pxoe; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3a4ef2c2ef3so4058398f8f.2
        for <linux-leds@vger.kernel.org>; Tue, 08 Jul 2025 08:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20230601.gappssmtp.com; s=20230601; t=1751986818; x=1752591618; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6iLn5+MYVtlS/SQKUYev+IhP8KQ71T7JyvSaQ5g8tl4=;
        b=x5l4pxoeKZQ6P3lWdxiXT6QiqgUe+lf6YkvyV3ktCprO96ZFm3BDpqGRZSAGlTDyo8
         tC77PmqTLz+wZzXPlSNu4I/7o+2S18a8XXIR0+/1RbKnfdzc1uWMWSD3A7ag3kjZP/GY
         Cv+ieqQrQ9qFQbhJpA1pkKs2QXTsiRA9KcyswBSpO7w7xtQVmIJt79h9y2Axz9LYxrXi
         G9i/zqVg9yzHmJchbp1PPO+fTE6uk4qzmSlBgzd/8uUXRoUmw4rrvfF7fOqQIC0KvmN3
         axv5MH9fRn2aGcf77iO1hZrXmlx1X4UF7sU31EnRipdHapvXiBzO2Vv5Gga30bnSRD6C
         aWwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751986818; x=1752591618;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6iLn5+MYVtlS/SQKUYev+IhP8KQ71T7JyvSaQ5g8tl4=;
        b=mZqVS0UWEQtmCaxXrtcCNTskrypVfU2AldpFyoDjjqBFO1bRdyf58t0b9bV03TFJ0k
         wS6dHOjiR1+WDnFlKRljr7ggEb8GfWJReKt1SuTnErJR83sCGC2pJTNche8Yt65z9eqf
         srxCwzJa8WCjYEcG3zfGapwJQ8Mf6ioc2v2FK44/EqfISw2DqgaRPsavV7tBAbvBObEz
         UZ48nr0Eum4myDENh4qJaTosm1TE8udlCp6P3owl43GxvUqhU84uY0fNZhlS2Ha6Jzjo
         qZ2BHRksXR5Hc/BqB3rTL+clElDJ+wv+OvXJoISNg2Y/M9dT1bfbaUlcMP7buCebX3i1
         ry9Q==
X-Gm-Message-State: AOJu0Yxiz05CtPwR1BnbpdiAKMxS0YQjBs0mI1T+t+W+PxBt+hxeCjV1
	1aXuu0NtLSIYIc+gQTP6Ro22MWvmoSHzMQ5FPqbvR1vR5GTWAaDwsiUMN9G8aHDLLmk=
X-Gm-Gg: ASbGncsZrLow/8IWQ75bhj3sSDsC+81UmY6ytBWw8R5mdWFebr2aDK9ejIXDrEw45Ek
	vZCunOpGWfYoMMPVlQRBD3LGA79OzmPkCTHT+4Ab8aeUWmodnf01IJs9Hr9SNcQHkJq7j8F9Xnv
	2RfqdIlxoES7lwQlagxfE8pjN93ITSk3XA6bbtg5pdoWgEG70d0Y2MoDJomZj6eBDVh4LIu1h4W
	FDZlQfgeYgaRweaP7rhFfGszQ4y1fjiWWMSwxk4/2YESjEDHUwj027QXr2f1xuOYehKlvczwQPn
	8h3EWAy14bVyotz702eeAWiH+OCiSHRuQ5uWvfLzOb8L8+yVaLXdWbG3GmJT3gEITgr0YlpDTF4
	Axho=
X-Google-Smtp-Source: AGHT+IHGHwAr6VX6pzCx7LcvtaJxrn+3EoDSphtgJI9D7LA33yGBsQx+/GKW3VhxbNoPCrElzetnWA==
X-Received: by 2002:a05:6000:2387:b0:3a4:ef36:1f4d with SMTP id ffacd0b85a97d-3b4970294a4mr12309752f8f.38.1751986818041;
        Tue, 08 Jul 2025 08:00:18 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:23c7:1d1a:9c01:f9da:8274:e1d1:97ce])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b47030b4f6sm13517433f8f.10.2025.07.08.08.00.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 08:00:17 -0700 (PDT)
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Date: Tue, 08 Jul 2025 15:59:46 +0100
Subject: [PATCH v3 2/3] dt-bindings: leds: is31fl32xx: convert the binding
 to yaml
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250708-leds-is31fl3236a-v3-2-d68979b042dd@thegoodpenguin.co.uk>
References: <20250708-leds-is31fl3236a-v3-0-d68979b042dd@thegoodpenguin.co.uk>
In-Reply-To: <20250708-leds-is31fl3236a-v3-0-d68979b042dd@thegoodpenguin.co.uk>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Pavel Machek <pavel@ucw.cz>, devicetree@vger.kernel.org, 
 Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>, 
 Lucca Fachinetti <luccafachinetti@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751986814; l=4963;
 i=pzalewski@thegoodpenguin.co.uk; s=20250625; h=from:subject:message-id;
 bh=KwfAgxG6jLEEMBb6hDqTzkqCmoS7oQVr2ZtJZV7d+lY=;
 b=5dtd6C/fj2EqbZesLvgxBYEWd1LV3YsWOHcyyaObHqjGJ73P864cmwEk1o/G6o0J/1vQKIj9g
 TZ1NROwa9bVCKxA1KURnF62XPq2AinTDjv1WJ03y/AwGN1TUccEOO2V
X-Developer-Key: i=pzalewski@thegoodpenguin.co.uk; a=ed25519;
 pk=hHrwBom/yjrVTqpEvKpVXLYfxr6nqBNP16RkQopIRrI=

From: Lucca Fachinetti <luccafachinetti@gmail.com>

Keep the old maintainers field as is.
Add datasheets for reference, NB that I was not able to find an
up-to-date, funtional direct URL for si-en products datasheet
so they were skipped.

Signed-off-by: Lucca Fachinetti <luccafachinetti@gmail.com>
Co-developed-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
---
 .../devicetree/bindings/leds/issi,is31fl3236.yaml  | 98 ++++++++++++++++++++++
 .../devicetree/bindings/leds/leds-is31fl32xx.txt   | 52 ------------
 2 files changed, 98 insertions(+), 52 deletions(-)

diff --git a/Documentation/devicetree/bindings/leds/issi,is31fl3236.yaml b/Documentation/devicetree/bindings/leds/issi,is31fl3236.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..d0f9add5af01ac06c4bb87b0cd0faec71d0ef37c
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/issi,is31fl3236.yaml
@@ -0,0 +1,98 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/issi,is31fl3236.yaml#
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
+  "^led@[1-9a-f]+$":
+    type: object
+    $ref: common.yaml#
+    unevaluatedProperties: false
+
+    properties:
+      reg:
+        description:
+          LED channel number (1..N)
+        minimum: 1
+        maximum: 36
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
+        led-controller@3c {
+            compatible = "issi,is31fl3236";
+            reg = <0x3c>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            led@1 {
+                reg = <0x1>;
+                label = "led1:red";
+            };
+            led@2 {
+                reg = <0x2>;
+                label = "led1:green";
+            };
+            led@3 {
+                reg = <0x3>;
+                label = "led1:blue";
+            };
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


