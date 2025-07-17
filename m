Return-Path: <linux-leds+bounces-5085-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3604BB0901A
	for <lists+linux-leds@lfdr.de>; Thu, 17 Jul 2025 17:02:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3F8F4586BFF
	for <lists+linux-leds@lfdr.de>; Thu, 17 Jul 2025 15:02:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CE8E2F8C2F;
	Thu, 17 Jul 2025 15:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20230601.gappssmtp.com header.i=@thegoodpenguin-co-uk.20230601.gappssmtp.com header.b="ocUzcCeb"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B77B298CA3
	for <linux-leds@vger.kernel.org>; Thu, 17 Jul 2025 15:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752764540; cv=none; b=bnoCEFlLfl3smFrDTYY50lUv/elHVa7yxd+auX+bSuJYBw8F1VkCHmuLUvYEddLNAy8+qvRMA48am4c6DPtsToPsWk/W/2KnCJ/bR/n4VZkDSKJJ0bql6mFC66HOhHevvXRQIpP415IfTZGw9tyIeBlXZbDeZsSn97DEFB20FoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752764540; c=relaxed/simple;
	bh=l8T7LiZXCrAeiVyOamQJQX6BS6kU3eX76OqQrth9bBA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KTz40VqQ+szKamWPkXcTHhzbuVlzfLLnmmdyQXbxdpjk/cVFmLNaY4JF5N2B5ZZpahh5wMpPAnX/J/l8tEyrOaP7iWSvCQDjk1lfB70RbTp2AfVWoFuFzNZiJQDti6M7RhPRLWWc+6NHM9P1HN/6nPVfiGL/egg5sHoh9OW/1jk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk; spf=pass smtp.mailfrom=thegoodpenguin.co.uk; dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20230601.gappssmtp.com header.i=@thegoodpenguin-co-uk.20230601.gappssmtp.com header.b=ocUzcCeb; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-455ecacfc32so4644845e9.3
        for <linux-leds@vger.kernel.org>; Thu, 17 Jul 2025 08:02:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20230601.gappssmtp.com; s=20230601; t=1752764536; x=1753369336; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sIyY2v/AOk/xVFcHhov1aG8CGPhp2IEuZMlBjYe1Qx8=;
        b=ocUzcCebby7ziNbT9uH0ckHHv26IUguAY29HxXTB9q1dWyVZTd24dEgd+1eIHukNJk
         SOQBScpFSOnpavPhBsTVRD1+63TXAT3HR/oOeF5yOGRWLQr516T8gQRSJRGnrervpGjD
         FZNewa6hrpliVmFyq+imsXUyKnmCaJeGD8xolv5HL3+KiAbQEusSuJRW7NS157VT2Ugz
         zisL8/n+/bDYdXv2A3el9HgjTsd3vUB6cwE6JjWXDcJ2rzr8JuQvW7Q9mBfkLYYNzsc/
         IHgeKNZUhpZuGBavTEXMsb4tUF/8nQToqYG0ClfEAmeakEDLgj7l+MdgS8bqjBwVaO0M
         wtdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752764536; x=1753369336;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sIyY2v/AOk/xVFcHhov1aG8CGPhp2IEuZMlBjYe1Qx8=;
        b=N7km59qXUJvr98k+WdCW8JLA7dCh8BZCbhn1ZUvxi1F+HkT1WgrwrCMcxJrw+8nOVF
         qSxw4UT3SS/FPYc5+y2zNYbwEA+FBas+A5lgk5SAePIWcapykbZudUAJgSPTu87Wp0D4
         6ESdzdFzkgxviRjQMKH9Y8PLabr6SB7x2R0w/BRPnDxD+aNWXww2aHxJjmynfWGD7ygK
         3w9Edjf5un4C+uZMtzSgCZ6H4z5iachmX3vCR6DwMsejOteWCUEZ9s8gHvh/6hdSnA1o
         ud6kIa8GMZQih8S1O4naJ/e82GyXOIYcRSWX5ZqbiVMy0nOWHbHAFjlRUyHH8SOScbAm
         5wWQ==
X-Gm-Message-State: AOJu0YxxNLh2zOvUtKxTStz6zdPCxKDt/XeixCRPdQZBHNNFNJdAivFi
	VUIvKsxrw6g3xdSYIYDVsVZO59KnoHtNcbrqMjxo7P7dMVxrcYtlPIM+0/wfgxWflRg=
X-Gm-Gg: ASbGncsCewkFS6CKHbjjAL6JILkSmGmqJUyL4bFSpMevYVeFTV3n7wFQc5cwL3cllGP
	daUC+ALxjmQfiKla0M0du+WArsGf5YpkrYjSOiP6QXuUfQQ9OkIEufGgfskrBm8JnhCjOXjLegs
	hdtPX1ih5VxVeSTOtxrMIiVplOUULcq4pnasZCmLZe0fIxAhnm9FeDPuxJKK/gXNwh+A2/WQl58
	wWWwLNWz5p11CaOFDOJR9/cQlxkBO1GTgad1rfLSCgfO8NQq98EmNuij1pGF8HizViUoR5Mevkl
	YMcAmYc137vplzoSqHojgWBuk2bnZ35xv3Exl3UQQ5XwZK5wvkoKGMyrBbaOkOml+eh5aATKFyE
	4dTpxvBz2DTg2UaxrWYc1dS8G5eROq0yHLPUuWoPBZx1DO5Lhow==
X-Google-Smtp-Source: AGHT+IFJStBQ3U3tGpyPIqXrJRu8l50bpOjCA3xRcp5u6FVuPIYGr5UIgxYI+B0GqnveH4YWgrtTkg==
X-Received: by 2002:a05:600c:310d:b0:456:13b6:4b18 with SMTP id 5b1f17b1804b1-4562e2a59a6mr81581685e9.31.1752764535588;
        Thu, 17 Jul 2025 08:02:15 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:23c7:1d1a:9c01:ebc8:7ccb:ef04:4f83])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45634f5cb9bsm25321885e9.10.2025.07.17.08.02.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 08:02:15 -0700 (PDT)
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Date: Thu, 17 Jul 2025 16:02:07 +0100
Subject: [PATCH v4 1/3] dt-bindings: leds: is31fl32xx: convert the binding
 to yaml
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250717-leds-is31fl3236a-v4-1-72ef946bfbc8@thegoodpenguin.co.uk>
References: <20250717-leds-is31fl3236a-v4-0-72ef946bfbc8@thegoodpenguin.co.uk>
In-Reply-To: <20250717-leds-is31fl3236a-v4-0-72ef946bfbc8@thegoodpenguin.co.uk>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Pavel Machek <pavel@ucw.cz>, devicetree@vger.kernel.org, 
 Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>, 
 Lucca Fachinetti <luccafachinetti@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752764533; l=5304;
 i=pzalewski@thegoodpenguin.co.uk; s=20250625; h=from:subject:message-id;
 bh=UX2F40/C4SA2sHvb86cZ86o0cODe+WSgWRbRYCYZb2M=;
 b=gUiGCVmFIrzBJBdwrjzvhaQU7x8wZZ48ELFhVuEnNzdeyFRhHJc+R2GoUWukXShwtd2URT7uS
 jg1oRljGhAYDW8CTNagKEk7nIw3HIm1ZVdXyA/SKJPhr3TSzAKRTn1U
X-Developer-Key: i=pzalewski@thegoodpenguin.co.uk; a=ed25519;
 pk=hHrwBom/yjrVTqpEvKpVXLYfxr6nqBNP16RkQopIRrI=

From: Lucca Fachinetti <luccafachinetti@gmail.com>

Add datasheets for reference, NB that I was not able to find an
up-to-date, funtional direct URL for si-en products datasheet
so they were skipped.

Signed-off-by: Lucca Fachinetti <luccafachinetti@gmail.com>
Co-developed-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
---
 .../devicetree/bindings/leds/issi,is31fl3236.yaml  | 114 +++++++++++++++++++++
 .../devicetree/bindings/leds/leds-is31fl32xx.txt   |  52 ----------
 2 files changed, 114 insertions(+), 52 deletions(-)

diff --git a/Documentation/devicetree/bindings/leds/issi,is31fl3236.yaml b/Documentation/devicetree/bindings/leds/issi,is31fl3236.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..abcd4c448e94db1d1e339f7ee165c3e04a1d354d
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/issi,is31fl3236.yaml
@@ -0,0 +1,114 @@
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
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+patternProperties:
+  "^led@[1-9a-f][0-9a-f]$":
+    type: object
+    $ref: common.yaml#
+    unevaluatedProperties: false
+
+    properties:
+      reg:
+        description:
+          LED channel number (1..N)
+        minimum: 0x1
+        maximum: 0x24
+
+    required:
+      - reg
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - issi,is31fl3236
+              - issi,is31fl3235
+              - issi,is31fl3218
+              - issi,is31fl3216
+              - si-en,sn3218
+              - si-en,sn3216
+    then:
+      properties:
+        issi,22kHz-pwm: false
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


