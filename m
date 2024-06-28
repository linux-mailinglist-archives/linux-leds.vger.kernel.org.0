Return-Path: <linux-leds+bounces-2171-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 49B9F91C959
	for <lists+linux-leds@lfdr.de>; Sat, 29 Jun 2024 00:56:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F3F252859EE
	for <lists+linux-leds@lfdr.de>; Fri, 28 Jun 2024 22:56:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76174824A1;
	Fri, 28 Jun 2024 22:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nipEa4aN"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E69478002A;
	Fri, 28 Jun 2024 22:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719615378; cv=none; b=RBwei/aVOedlYQpe0TI8eNTUFBr7Q+OEmEpTURMCmvGgGYOGDQALuxe77k11cVa3OrVLyZ6dkZpWGeuy7ZBviYUMGORJyKymNEPO3S3utE1ur4UBwJJSZIasvKwJ6634iIMVdDTMhLFjL3xAN8A7cs6brZSKoIa2Ua4AhHR45ww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719615378; c=relaxed/simple;
	bh=jqYFSUT/a2n7uSZLnvdv9HsDOXaAO27gYxryHNzeCEI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Fj26knmwE/kz3l4rEnLmFl5sEprsT2lKNmxFgHxjuZJMsF7qz/mfe2LTqkY455FT3PkU+EC1Sll9Q8RdV/cwdunp7lJ2vNQ7m/s2Vc0nPNySrTPGYIu7xaY2Ojwgvkw/BIZFWK7abbGgIeni9u5K7VNIuhzvm5rsJdXlIoQ97Bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nipEa4aN; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-7180308e90bso795686a12.1;
        Fri, 28 Jun 2024 15:56:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719615376; x=1720220176; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xUcQS852IggxOCmKXqE3YJJNYXGvn0FPbNBN8y1e0Sc=;
        b=nipEa4aN5/DRpNre/mZ2R3kmiAOak4l0cFdUZCyJPXH/8FWqZUlREizPRDky/YM4GT
         moL+8cnhvVEEN/MoWb0UceOvZ7S2erjY35Gr8L5tStFaA6FdBTIXNv5pwSGjkLLV8mKb
         sWYsed9upcfWBGGYHe/O+P527djykRFA6rVpVyq/LlLt1ltw+uPPuoV6AcXcglhVhceX
         MGT7Cci2zGsOIcKJ21pbAB5CW48PE6KDoLyKje6L9JfQI7QZK8uxfa03r77KAm/efmZy
         S64Lq+O0Qm/8+medi6OE4AAsOGbXgofJPQOWYXmCcCkP0QiuziIKpIgX18YWPY2RGjhk
         UY1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719615376; x=1720220176;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xUcQS852IggxOCmKXqE3YJJNYXGvn0FPbNBN8y1e0Sc=;
        b=vKLMkS81V2GQRBuvxlzWXSRzuNcHMfdvKG08tFUPvHuIFpDHpEzTSMSU2Ng4BmD4ES
         C0B8rKKU0LNDPyhGq5oX3/C7Wlj0IY50mg59bg2uaI2jo5uZs0379wHfdcVsH9XrF+AO
         NAhADk/9X5hte8nzavw0a/okpcCMPF5Wlor+qIOphAszB53ZPy1oJxSMqnvCnOzzGUR4
         0HjE2CI+WjO8EyLwFO64zJrp6y/Y2Ewbbg7Z7iNm9MwYQiyHeDBLXMUfNNVVB0IjhquL
         n3Kt8BvQeZrg1TO8pkiPyPuDVGxHj8Y0MWD0dHHQD/cN2fBu6X3ep7NYaGZ96xX0oPIr
         4VNA==
X-Forwarded-Encrypted: i=1; AJvYcCVDZ7Z1LQoxXG1txwEhBAxJgHQsYmZbmEHzKcKSvzmYBEGVq0AR97rrL1A4MpUtbc5AVp7WpnO1eXKwqXY2NtypSSxncSSBIAOgCy4SsvYlemCCBpdiuonJ/R6oXoamg/PqeZUUv1YJgg==
X-Gm-Message-State: AOJu0Yx5YaqqV8Wdrb2VO/X/2gcMIKgXGRkiQhYAsgQKw/iZn+thxmT8
	cJIiMu7OEtbpJ+d0ksgrYhQTT+9S3fxrCoN70qhJR8St7/iFe1cf
X-Google-Smtp-Source: AGHT+IEZnjxDA5OCNYz7pbDMXf6iKykKThrzOkcD/z8qiGIfTDi72Ed5E+eRlHQkwB0H36m+T2fExA==
X-Received: by 2002:a05:6a20:c123:b0:1bd:2994:b5bc with SMTP id adf61e73a8af0-1bd2994b984mr9724732637.58.1719615376114;
        Fri, 28 Jun 2024 15:56:16 -0700 (PDT)
Received: from localhost.localdomain ([177.194.39.94])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c91ce17a5fsm2176711a91.3.2024.06.28.15.56.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 15:56:15 -0700 (PDT)
From: Lucca fachinetti <luccafachinetti@gmail.com>
To: pavel@ucw.cz,
	dmurphy@ti.com,
	robh+dt@kernel.org,
	lee@kernel.org
Cc: linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	g.luiztrevisan@gmail.com,
	Lucca Fachinetti <luccafachinetti@gmail.com>
Subject: [PATCH 1/1] dt-bindings: leds: max77650: convert the binding document to yaml
Date: Fri, 28 Jun 2024 19:55:51 -0300
Message-Id: <20240628225551.107833-1-luccafachinetti@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lucca Fachinetti <luccafachinetti@gmail.com>

Convert the binding document for max77650 LED module to yaml.

Signed-off-by: Lucca Fachinetti <luccafachinetti@gmail.com>
---
 .../bindings/leds/leds-is31fl32xx.txt         | 52 --------------
 .../bindings/leds/leds-is31fl32xx.yaml        | 67 +++++++++++++++++++
 2 files changed, 67 insertions(+), 52 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/leds/leds-is31fl32xx.txt
 create mode 100644 Documentation/devicetree/bindings/leds/leds-is31fl32xx.yaml

diff --git a/Documentation/devicetree/bindings/leds/leds-is31fl32xx.txt b/Documentation/devicetree/bindings/leds/leds-is31fl32xx.txt
deleted file mode 100644
index 926c2117942c..000000000000
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
diff --git a/Documentation/devicetree/bindings/leds/leds-is31fl32xx.yaml b/Documentation/devicetree/bindings/leds/leds-is31fl32xx.yaml
new file mode 100644
index 000000000000..0f4c7c3440c6
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/leds-is31fl32xx.yaml
@@ -0,0 +1,67 @@
+ # SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/leds-is31fl32xx.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: LED driver for is31fl32xx and Si-En SN32xx.
+
+maintainers:
+  - Pavel Machek <pavel@ucw.cz>
+  - Lee Jones <lee@kernel.org>
+
+description: |
+  Binding for ISSI is31fl32xx and Si-En SN32xx LED Drivers
+
+  The is31fl32xx/SN32xx family of LED drivers are I2C devices with multiple
+  constant-current channels, each with independent 256-level PWM control.
+  Each LED is represented as a sub-node of the device.
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
+    description:
+      I2C slave address
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
+    description: |
+      Properties for a single subnode LED.
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
-- 
2.34.1


