Return-Path: <linux-leds+bounces-5099-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CBFFB0C1EB
	for <lists+linux-leds@lfdr.de>; Mon, 21 Jul 2025 12:57:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 90D4E1884C92
	for <lists+linux-leds@lfdr.de>; Mon, 21 Jul 2025 10:57:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82D4D29A9F5;
	Mon, 21 Jul 2025 10:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20230601.gappssmtp.com header.i=@thegoodpenguin-co-uk.20230601.gappssmtp.com header.b="kyaC81xy"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09CFA295DAA
	for <linux-leds@vger.kernel.org>; Mon, 21 Jul 2025 10:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753095342; cv=none; b=blcjcpLULEzXtX3KO/Qf1FSNC+LaUzwTHXI/FBAuEZWYBaAW1I6nW45lH8QTf2vajqjOgOy7tJSbbQyoSKA5VBh7Sn+ifKb5BJ4VoEh+jr/pKwGSFJYkSygVSbt++RPbndhZO4TrxdCfpngzESsGzNrHjTsgMz3LJbxW9WgTqSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753095342; c=relaxed/simple;
	bh=TgVl7dC61Y5U2p2yEkCTbEecDupg6FgH1sAthqZOW3M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HC6YvioVYMYK0qYtWXK2/HJZ8Hhgcv9PV/K3lIZ+nlmc/rA0S7QaQu4sfC1wZyu2dTmncBZ9a4P/QJj3bNtRguYCi6wmb7giyvjlEYRS2DJAdjh5dFO7C/MNA4tHTw8bEir8060HY9I28vEaio5xf040ONHjkht14qgUh702o4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk; spf=pass smtp.mailfrom=thegoodpenguin.co.uk; dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20230601.gappssmtp.com header.i=@thegoodpenguin-co-uk.20230601.gappssmtp.com header.b=kyaC81xy; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3b5e6bfb427so2347769f8f.2
        for <linux-leds@vger.kernel.org>; Mon, 21 Jul 2025 03:55:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20230601.gappssmtp.com; s=20230601; t=1753095338; x=1753700138; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ycVAZqI5LQT7lZNaWUVfxbEM5bSOrJDX9KRmJH4SN/w=;
        b=kyaC81xyaX7uTSlw84EjThpdQAKi+LAur32X1/ugS+/sLQD4uDmgPipdTN043BtpBk
         hO5jLvSxwL0vAwQHB62IWWB+aM3lkz48PTjcSvz1ERjF/+LzEoTivElSshgIo3f/KMf0
         zMeKumImBW5kDubJ6p8Jhy/I8tW5bd2NBS/8lC4as+CM9caciSfo42+RKBsj0CaNTFoZ
         fIxXpjXGZ/UsEYFdEVNNU9o9D0aZcjmXZupapbP5mfoybxL3DFgUkdOw8EM184kuG2sD
         6ZiwcsezKrJfgEU7AUc72hFuTv2+3wE8uaWxgEZj0L+oqUbeMy3NT7aMYVIzXqa8Yd/j
         SFoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753095338; x=1753700138;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ycVAZqI5LQT7lZNaWUVfxbEM5bSOrJDX9KRmJH4SN/w=;
        b=uaxTdamlh0qb/HlQKxIQQpA3Lx8IIxZ2ElFfmYVJYuFVcdTBYuCyTOhafwAObAhIsv
         V3fJPjqRJLEB2t2zians86/DBu9/ksKLNJjs+QU7rJpEWtw7PgQlKJ4VSSTPxO+DBTNf
         OxVtH299gO0iWVvE8CuLcAy8WJIzdbmJs/IHO9QDcQ1by6Pn83VFnrgUyUGm5zI7IiY9
         X//sCqGq+1temWn/jigYLQWuHnJDY1BdGadhlA1ozQpNG8ED+aQVEIOF/SYS9hzh7aMQ
         1W94ALrtTzl8mLO0TqEH5GLDnSPOwzDVr/lhUWQxCPf0g3PExRCciaLGZw6qusHSZdZk
         oVLA==
X-Gm-Message-State: AOJu0YzwSSgWvaXgj2YB70T9HvdlrNmzGtdo9oLBrdo9SpWVWzJZeGCY
	YLrasx4JjhAU//rl9zea3DX3VpiLdup5Z4F85PBigFX+jmX/y2lSaj0P/nM+zOpum/E=
X-Gm-Gg: ASbGncugNIJb89g3rC6a5T5HLPdD2hndh5vMJ96LtMridynFmKhNnvSEWA0d8Ti3Qj7
	uNcE4DJUTkERVG4ihPCTpw/rOtx2NTAkLKZTBn27KZJs3pk/U1HfezfD1hSuizqqrCiwwEoUDx3
	okoRREtcMhohmhzGNXfCW4OVXLP5d5zBJLoYL+3geQhkv6sGHqGJAOhheU75ybENA+4Oa//jRUQ
	AdJzVtUMF7e6pqO5Dh8nZL3uhWAssT5YENHW2WET4SJv0092wiCd+PT5FmdZorFG0m4rW/Agw0D
	itNywZUi4fdbmnX4lKKG5K6pKKeCgfOocdktKcMOc72oo32tJ6dxkMdoErX89nnsD4tBGEPZpWp
	UxpKA9mFt+79C1a54v8onPOzjE8u4SyzEc8NGHic=
X-Google-Smtp-Source: AGHT+IGXFGxm09yXGJIDAEqcCGjJ+mK7CFUuEYNuvaZxgHdBDa9im85smor/oqTDcwhviffIrdYGCQ==
X-Received: by 2002:a05:6000:250f:b0:3a4:f63b:4bfc with SMTP id ffacd0b85a97d-3b61b217f24mr9347151f8f.34.1753095338305;
        Mon, 21 Jul 2025 03:55:38 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:23c7:1d1a:9c01:f373:f0d1:903c:a9bc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4566dd6b8bfsm18141065e9.35.2025.07.21.03.55.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jul 2025 03:55:37 -0700 (PDT)
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Date: Mon, 21 Jul 2025 11:55:34 +0100
Subject: [PATCH v5 1/3] dt-bindings: leds: is31fl32xx: convert the binding
 to yaml
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250721-leds-is31fl3236a-v5-1-264e841f4da9@thegoodpenguin.co.uk>
References: <20250721-leds-is31fl3236a-v5-0-264e841f4da9@thegoodpenguin.co.uk>
In-Reply-To: <20250721-leds-is31fl3236a-v5-0-264e841f4da9@thegoodpenguin.co.uk>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Pavel Machek <pavel@ucw.cz>, devicetree@vger.kernel.org, 
 Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>, 
 Lucca Fachinetti <luccafachinetti@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753095336; l=4843;
 i=pzalewski@thegoodpenguin.co.uk; s=20250625; h=from:subject:message-id;
 bh=buHhN/I38dEbtoGSlq09UPwG7zAjjuIi+fxQTSyF5bc=;
 b=tML5IaLH+t/W0XPrhx2Lftyl320m4OjdebpA+wa+Luh3VDW0C0NUZkyeFhmVz/9bwpMXROthT
 nRwSz4T1VLeCWJihgw9Ulw8S/EEcfKPnyDzSUrQy1/197R2hr8vF2O7
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
 .../devicetree/bindings/leds/issi,is31fl3236.yaml  | 96 ++++++++++++++++++++++
 .../devicetree/bindings/leds/leds-is31fl32xx.txt   | 52 ------------
 2 files changed, 96 insertions(+), 52 deletions(-)

diff --git a/Documentation/devicetree/bindings/leds/issi,is31fl3236.yaml b/Documentation/devicetree/bindings/leds/issi,is31fl3236.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..d8164876611f5e629215fe2715ebff1745f93a26
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/issi,is31fl3236.yaml
@@ -0,0 +1,96 @@
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
+    https://www.lumissil.com/assets/pdf/core/IS31FL3235_DS.pdf
+    https://www.lumissil.com/assets/pdf/core/IS31FL3218_DS.pdf
+    https://www.lumissil.com/assets/pdf/core/IS31FL3216_DS.pdf
+
+properties:
+  compatible:
+    enum:
+      - issi,is31fl3236
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
+  "^led@[1-9a-f][0-9a-f]*$":
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


