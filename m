Return-Path: <linux-leds+bounces-5635-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C9265BB3707
	for <lists+linux-leds@lfdr.de>; Thu, 02 Oct 2025 11:20:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2B2FC3B083E
	for <lists+linux-leds@lfdr.de>; Thu,  2 Oct 2025 09:20:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3F212F2903;
	Thu,  2 Oct 2025 09:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20230601.gappssmtp.com header.i=@thegoodpenguin-co-uk.20230601.gappssmtp.com header.b="HL3zqh1G"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43C76301004
	for <linux-leds@vger.kernel.org>; Thu,  2 Oct 2025 09:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759396826; cv=none; b=Pw2zBMXp579scwhMqs4w9JU1ebk4PC6uD37SdapTx66aYYeYjdj4lTopdPuBhiQvV/Wx/coFWaOG2lwUEKKITZ8HixkWNTA0WDxXVcrk+bZK1LQTuq3NdUrM4EsFkSJ+KpgEz7PeqFCqGaIs573CzANOTzzp88fiBpVVq3Yba0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759396826; c=relaxed/simple;
	bh=p/CzlvHEnIHNvjR2z9r9G+Y/GwV0LJ8ph30ZwmlnMSY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IzZk9ND+YPdX25toUGzZYLGO1hR4QHHmuoysIJBDdIQ2oic2O8+zsqMbAlJ7G6MSRHVxKgDB2Omu1koMBtxCrN6IJoHjyrrXcUKEue0t5rdBZJ0IEG0pIDPq6cwD21o49/JE/cHjn7tPqiDVr0k06K17ZRQJerfa0IRU3oXzjn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk; spf=pass smtp.mailfrom=thegoodpenguin.co.uk; dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20230601.gappssmtp.com header.i=@thegoodpenguin-co-uk.20230601.gappssmtp.com header.b=HL3zqh1G; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-46e42fa08e4so6591855e9.3
        for <linux-leds@vger.kernel.org>; Thu, 02 Oct 2025 02:20:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20230601.gappssmtp.com; s=20230601; t=1759396822; x=1760001622; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6Zhldjp2yNaFyJXBTXpmr+HFpUJDsMOIwtutBNnd19s=;
        b=HL3zqh1Gp6PYLlMx7UegozuhMXecrDuAvYeABpkMpPw822uQyq69UCdbV/MYsa0fE1
         QUST/COOTTCj5LJEzwtz7S/wG1aNunJgjqwAVYyolDsvCVLsZn7Rjvw8I9lcydFrakW3
         +oRDcGWN3DdoKPVBPHQQccoqpFH52Mz3hT/Bt4BeVOhUg9Ktl12cyxCFEyJRuOYyddiB
         nZq2Amc5ApzVhHXAmmNl9+49T+Gt+YQ438RgV/eXQrEZNhVBGDHDkXYawY9qZNexGMu5
         dp8gr+4Ow2jdPYDzjmJAy/3gwOgvJARAfcfcl31XT04z352FQLhJ61IU1vYqqs3gqWvM
         e9nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759396822; x=1760001622;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6Zhldjp2yNaFyJXBTXpmr+HFpUJDsMOIwtutBNnd19s=;
        b=U5GGxOM5KhztD9lVnSjfjNYCTWD7jMxNYIr0EfoI7aqJTQ2tWwq6XcDQz+1fyy2ZdG
         Q/cxNoTY45ahcmba1zUb1TMQRii27HxlKj5hTcj4VTy/zi5C9VRwZUl4vWual9esBerc
         myegGHafnQgUCzjCjpkvPS4tyXJ1a6ZmDa/BXQNgCeuJqscmpqvWDbI9zelpojSS/fJs
         Q5tpb9h7Q5IDjDlxS1+eU5jVpiTrhMo4Kh0qN4S9tyrg0H+WEW3NaxLVG6ofES2hm87z
         xkE+G2DRUas2JfsEXvKtxowbNDB3zfRiXWsfUbmMOrHjUpc0dkjixduKvIN37sVvgwpq
         2m+Q==
X-Gm-Message-State: AOJu0Yzu5devgAd3dW2ChzrG4pxHR5Ca9VueMo2ao5Gp4WbYn3QyXTKG
	jmFmUGB6rHgniMze8YcZOMsM5n/RKy3zyQa05x+WZ67pkFy/AMEjB5yHE1WcbPy3Y/g=
X-Gm-Gg: ASbGncsfVkx7xL3qv6UI1X1CKBP9Jf1Afu8EieS1zpZnqHTOcdCJk+zeOt7nzLQngD9
	nFgyE3+B8RFXgsjWhRJ98Z+10QmRO8CzcjKQJ5EkV6h5AsGIqGxyJODuKBTD3FB8Djk42rU71Cg
	q/GAljKnAX87OYvM2PPiasx02KeaopwYHkXsXD9o02wOg+TVlOs0bmpYr41pp3puXX1gi0o71wm
	0KdmX4Weofz6iXYpNsD8OcEhOm+A2oo8nXJbdFpbZpuhQsjx2OizW8FFCepBttLHlbYc/I3GRK6
	BSyOr38jUtybwKcxoAvtblQBjSlz7hYrU8RNRx1KXliBhMregf0dt8ASOiChUdBk7O6PjVe73sR
	Ddq5HuVVxiKWuzZC8NqqJDWv0cLsOJx4Q1uNrNg6wtER+QoDvy/tQPTVhLd7vwxYoyE8gLLw=
X-Google-Smtp-Source: AGHT+IF7CiZPQ+vX93IBD2awk1WVujnNswss6fVkdYSSXuPXelTmsVOTvm4mBoHvvqmd1eud2oD5Tw==
X-Received: by 2002:a05:600c:c162:b0:46e:2562:e7b8 with SMTP id 5b1f17b1804b1-46e612be8b7mr41206015e9.21.1759396822249;
        Thu, 02 Oct 2025 02:20:22 -0700 (PDT)
Received: from [127.0.1.1] ([2a02:c7c:8a3e:8c00:3430:5fdd:d596:adae])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e6918bdebsm28958795e9.9.2025.10.02.02.20.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Oct 2025 02:20:22 -0700 (PDT)
From: Harrison Carter <hcarter@thegoodpenguin.co.uk>
Date: Thu, 02 Oct 2025 10:20:16 +0100
Subject: [PATCH 2/2] dt-bindings: leds: ti,lm3601x: Convert to DT Schema
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251002-ti-leds-to-dt-v1-2-1604ae333479@thegoodpenguin.co.uk>
References: <20251002-ti-leds-to-dt-v1-0-1604ae333479@thegoodpenguin.co.uk>
In-Reply-To: <20251002-ti-leds-to-dt-v1-0-1604ae333479@thegoodpenguin.co.uk>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Dan Murphy <dmurphy@ti.com>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Harrison Carter <hcarter@thegoodpenguin.co.uk>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759396820; l=4722;
 i=hcarter@thegoodpenguin.co.uk; s=20250904; h=from:subject:message-id;
 bh=p/CzlvHEnIHNvjR2z9r9G+Y/GwV0LJ8ph30ZwmlnMSY=;
 b=wsaWlczGN2Oo1pP32CuKIimm+jmjpTFON+MfTe4/22Mi2YdFJA/9D+PuBnZo1+rWMoeXSWIc6
 mNScIWa/KXcDrGp0ZjHXW394A4WaD8+hKJgP5s+gUDvuOmFezQcltLG
X-Developer-Key: i=hcarter@thegoodpenguin.co.uk; a=ed25519;
 pk=xn5ghTMMWQniDtZih4xwKCTAaBHDozflTmqNKtaKo6s=

Converts the ti,lm36010 and ti,lm36011 txt to dt schema

Signed-off-by: Harrison Carter <hcarter@thegoodpenguin.co.uk>
---
 .../devicetree/bindings/leds/leds-lm3601x.txt      |  51 -----------
 .../devicetree/bindings/leds/ti,lm3601x.yaml       | 100 +++++++++++++++++++++
 2 files changed, 100 insertions(+), 51 deletions(-)

diff --git a/Documentation/devicetree/bindings/leds/leds-lm3601x.txt b/Documentation/devicetree/bindings/leds/leds-lm3601x.txt
deleted file mode 100644
index 17e940025dc26213314f5cfd54aa8e5bb09f86b7..0000000000000000000000000000000000000000
--- a/Documentation/devicetree/bindings/leds/leds-lm3601x.txt
+++ /dev/null
@@ -1,51 +0,0 @@
-* Texas Instruments - lm3601x Single-LED Flash Driver
-
-The LM3601X are ultra-small LED flash drivers that
-provide a high level of adjustability.
-
-Required properties:
-	- compatible : Can be one of the following
-		"ti,lm36010"
-		"ti,lm36011"
-	- reg : I2C slave address
-	- #address-cells : 1
-	- #size-cells : 0
-
-Required child properties:
-	- reg : 0 - Indicates a IR mode
-		1 - Indicates a Torch (white LED) mode
-
-Required properties for flash LED child nodes:
-	See Documentation/devicetree/bindings/leds/common.txt
-	- flash-max-microamp : Range from 11mA - 1.5A
-	- flash-max-timeout-us : Range from 40ms - 1600ms
-	- led-max-microamp : Range from 2.4mA - 376mA
-
-Optional child properties:
-	- function : see Documentation/devicetree/bindings/leds/common.txt
-	- color : see Documentation/devicetree/bindings/leds/common.txt
-	- label : see Documentation/devicetree/bindings/leds/common.txt (deprecated)
-
-Example:
-
-#include <dt-bindings/leds/common.h>
-
-led-controller@64 {
-	compatible = "ti,lm36010";
-	#address-cells = <1>;
-	#size-cells = <0>;
-	reg = <0x64>;
-
-	led@0 {
-		reg = <1>;
-		function = LED_FUNCTION_TORCH;
-		color = <LED_COLOR_ID_WHITE>;
-		led-max-microamp = <376000>;
-		flash-max-microamp = <1500000>;
-		flash-max-timeout-us = <1600000>;
-	};
-}
-
-For more product information please see the links below:
-https://www.ti.com/product/LM36010
-https://www.ti.com/product/LM36011
diff --git a/Documentation/devicetree/bindings/leds/ti,lm3601x.yaml b/Documentation/devicetree/bindings/leds/ti,lm3601x.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..d7d8ee44d6fe37d13ee84888c5811df3e15a5d02
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/ti,lm3601x.yaml
@@ -0,0 +1,100 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/ti,lm3601x.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments - lm3601x Single-LED Flash Driver
+
+description: |
+  The LM3601X are ultra-small LED flash drivers
+  that provide a high level of adjustability.
+
+  For more product information please see the links below:
+  https://www.ti.com/product/LM36010
+  https://www.ti.com/product/LM36011
+
+maintainers:
+  - Dan Murphy <dmurphy@ti.com>
+
+properties:
+  compatible:
+    enum:
+      - "ti,lm36010"
+      - "ti,lm36011"
+
+  reg:
+    maxItems: 1
+
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 0
+
+patternProperties:
+  "^led@[0,1]?([0-9]|[a-z])$":
+    type: object
+    $ref: common.yaml#
+    properties:
+      reg:
+        description: |
+          0 - Indicates IR mode
+          1 - Indicates Torch (white LED) mode
+        minimum: 0
+        maximum: 1
+
+      flash-max-microamp:
+        minimum: 11
+        maximum: 1500000
+
+      flash-max-timeout-us:
+        minimum: 40
+        maximum: 1600000
+
+      led-max-microamp:
+        minimum: 24
+        maximum: 376000
+
+    required:
+      - reg
+      - flash-max-microamp
+      - flash-max-timeout-us
+      - led-max-microamp
+
+    unevaluatedProperties: true
+
+required:
+  - compatible
+  - reg
+  - '#address-cells'
+  - '#size-cells'
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
+        led-controller@64 {
+            compatible = "ti,lm36010";
+            #address-cells = <1>;
+            #size-cells = <0>;
+            reg = <0x64>;
+
+            led@1 {
+                reg = <1>;
+                function = LED_FUNCTION_TORCH;
+                color = <LED_COLOR_ID_WHITE>;
+                led-max-microamp = <376000>;
+                flash-max-microamp = <1500000>;
+                flash-max-timeout-us = <1600000>;
+            };
+        };
+    };
+...
+

-- 
2.51.0


