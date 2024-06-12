Return-Path: <linux-leds+bounces-1888-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 79B3D905D56
	for <lists+linux-leds@lfdr.de>; Wed, 12 Jun 2024 23:03:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 17C3F283F2D
	for <lists+linux-leds@lfdr.de>; Wed, 12 Jun 2024 21:03:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BDA28624A;
	Wed, 12 Jun 2024 21:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OgO91uSI"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16C23537E7;
	Wed, 12 Jun 2024 21:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718226169; cv=none; b=dIcMCTnEvFA0er7T4DRW/4o+dt/UAg1Tloq7PtJMHDZv2+PlFCQuhAPvKpinwwhPtFhJ9pcWXfpBow41r9kHguY1U34npN1jiPwInGKfepRzL+Ai2O+/S+RiWwa0wUHYCBm2m5dfhM26zGHo30NIyYsuhkzyiwJZfU6cxMCDuMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718226169; c=relaxed/simple;
	bh=q9GXhOh3W08vpuSX8OidiiDwOJ5B27G64mh/6LPDIq4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=au9RlMF7SHVXA1NNhHa8zks3t1Zf4IxeBev07JD+xKG8Zq/yczLGcrraGZdQsJKXGPdyU2NHxm73QjZlA+rkSc+xuY1qeLBLj4O7ZSvCV2A/ZKHIwjubbUc+2akrwlz5fHmgdxuvoOijgJYa/YjUNrRjodyQ7G6U3vmf6o8akUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OgO91uSI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 87A90C32789;
	Wed, 12 Jun 2024 21:02:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718226168;
	bh=q9GXhOh3W08vpuSX8OidiiDwOJ5B27G64mh/6LPDIq4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=OgO91uSILfNSwS9Xz8ImmdUpdUdym0bMSwd9P3jrueHjAtOv5at5VkJH5IxsKllRU
	 xJgxGZvdZUKLmwMX7mY/L+kTRksAcePidTJWSYxUvZfOxPGgNrEMWRshoQtkoWoN7r
	 +NrBPHPZzq5hw9hDyiA7cbyvXCFJv6HnJz5vfAqZ1OlDuUWE5r1j4k7ttweZsTbWXf
	 j2jorXfkrIhN4d6Vr8gu9PXvmWxM0coCf1NT9O9CN2e+b0FPI3XZoZR/dGfB2vooS/
	 WMxcPdU8+oM6BP1YXh0vmKeHNFrR1a59aIRIT3E2nGVeDEmakcfe4FmJ+njk2AV9HQ
	 cyAXjPkdi3CMA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D23AC27C77;
	Wed, 12 Jun 2024 21:02:48 +0000 (UTC)
From: =?utf-8?q?Andr=C3=A9_Apitzsch_via_B4_Relay?= <devnull+git.apitzsch.eu@kernel.org>
Date: Wed, 12 Jun 2024 23:01:32 +0200
Subject: [PATCH v3 1/3] dt-bindings: leds: Add Silergy SY7802 flash LED
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240612-sy7802-v3-1-1e9cc1c79b79@apitzsch.eu>
References: <20240612-sy7802-v3-0-1e9cc1c79b79@apitzsch.eu>
In-Reply-To: <20240612-sy7802-v3-0-1e9cc1c79b79@apitzsch.eu>
To: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>, 
 Trilok Soni <quic_tsoni@quicinc.com>, Kees Cook <kees@kernel.org>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1718226168; l=2858;
 i=git@apitzsch.eu; s=20240325; h=from:subject:message-id;
 bh=422MAQ8Zc9rOtjrkcDNrU+gTouN3Oof9bf0EyTO505k=;
 b=2DghYlRDo+LHle1IMbn73984mZZp6rpmq2/xoeeii85+4kQFkJV5FRZemSltMTxZCSqsKNHC+
 V6vRJshHvZKDC8EMptWf24V9UfltiefkFoX00bAXco41DcyvdG6+N1G
X-Developer-Key: i=git@apitzsch.eu; a=ed25519;
 pk=wxovcZRfvNYBMcTw4QFFtNEP4qv39gnBfnfyImXZxiU=
X-Endpoint-Received: by B4 Relay for git@apitzsch.eu/20240325 with
 auth_id=142
X-Original-From: =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
Reply-To: git@apitzsch.eu

From: André Apitzsch <git@apitzsch.eu>

Document Silergy SY7802 flash LED driver devicetree bindings.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: André Apitzsch <git@apitzsch.eu>
---
 .../devicetree/bindings/leds/silergy,sy7802.yaml   | 100 +++++++++++++++++++++
 1 file changed, 100 insertions(+)

diff --git a/Documentation/devicetree/bindings/leds/silergy,sy7802.yaml b/Documentation/devicetree/bindings/leds/silergy,sy7802.yaml
new file mode 100644
index 000000000000..46b8e5452b62
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/silergy,sy7802.yaml
@@ -0,0 +1,100 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/silergy,sy7802.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Silergy SY7802 1800mA Boost Charge Pump LED Driver
+
+maintainers:
+  - André Apitzsch <git@apitzsch.eu>
+
+description: |
+  The SY7802 is a current-regulated charge pump which can regulate two current
+  levels for Flash and Torch modes.
+
+  The SY7802 is a high-current synchronous boost converter with 2-channel
+  high side current sources. Each channel is able to deliver 900mA current.
+
+properties:
+  compatible:
+    enum:
+      - silergy,sy7802
+
+  reg:
+    maxItems: 1
+
+  enable-gpios:
+    maxItems: 1
+    description: A connection to the 'EN' pin.
+
+  flash-gpios:
+    maxItems: 1
+    description: A connection to the 'FLEN' pin.
+
+  vin-supply:
+    description: Regulator providing power to the 'VIN' pin.
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+patternProperties:
+  "^led@[0-1]$":
+    type: object
+    $ref: common.yaml#
+    unevaluatedProperties: false
+
+    properties:
+      reg:
+        description: Index of the LED.
+        minimum: 0
+        maximum: 1
+
+      led-sources:
+        minItems: 1
+        maxItems: 2
+        items:
+          minimum: 0
+          maximum: 1
+
+    required:
+      - reg
+      - led-sources
+
+required:
+  - compatible
+  - reg
+  - "#address-cells"
+  - "#size-cells"
+  - enable-gpios
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/leds/common.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        flash-led-controller@53 {
+            compatible = "silergy,sy7802";
+            reg = <0x53>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            enable-gpios = <&tlmm 16 GPIO_ACTIVE_HIGH>;
+
+            led@0 {
+                reg = <0>;
+                function = LED_FUNCTION_FLASH;
+                color = <LED_COLOR_ID_WHITE>;
+                led-sources = <0>, <1>;
+            };
+        };
+    };

-- 
2.45.2



