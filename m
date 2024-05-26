Return-Path: <linux-leds+bounces-1693-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 940958CF3FF
	for <lists+linux-leds@lfdr.de>; Sun, 26 May 2024 13:10:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AB6301C20752
	for <lists+linux-leds@lfdr.de>; Sun, 26 May 2024 11:10:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6344BBA2E;
	Sun, 26 May 2024 11:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=paroga.com header.i=@paroga.com header.b="N8TXraIw";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=paroga.com header.i=@paroga.com header.b="N8TXraIw"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx101.easyname.com (mx101.easyname.com [217.74.15.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F12468C1F;
	Sun, 26 May 2024 11:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.74.15.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716721838; cv=none; b=LoVyBcNnR+brLyWFSG05BQNZYLpYd5ViLY76N6KLo89xdqGVpaNtR3eaEMVgU0caeVtLJqaJM5OciLsaa0Mkx+F3Zl5LG/HjgBx8l/cdkRxHarRE5tMEM/2AbV04714eVgJXSOjNNPXVU67mfuAL7Upz+nGvVV62Ct+nvjTBlRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716721838; c=relaxed/simple;
	bh=HY1XGPRrGqBxDcvdxT1bi7hAHQ+KaBmx83f1g1P+lH0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SbwWmoNXi7MQZbIu4BGz/oLBZBVeHaLIou3wVvAv+Teaw0Kip1uSFN2iISK9zMGNThseyrYR0cdQx/gkWM9BKXJHYh2Wv6yfE3iHmBlAYRnmdwfx0af1R1qqxxzhaOfO33t3TZqB+/yUkf29O097jh09zgjWmK5RVKdAFkN0QX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=paroga.com; spf=pass smtp.mailfrom=paroga.com; dkim=pass (2048-bit key) header.d=paroga.com header.i=@paroga.com header.b=N8TXraIw; dkim=pass (2048-bit key) header.d=paroga.com header.i=@paroga.com header.b=N8TXraIw; arc=none smtp.client-ip=217.74.15.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=paroga.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paroga.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=paroga.com;
	 s=easyname; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=TXVzlDmNhLCq95/mMjyunngNK+mLMLLWMLMstZdKwDc=; b=N8TXraIwOC2y+kydJ70DzvW0uS
	AZTB3Gi5ydGCdlnLyXdSwQmiY/uguhznTruMwtdSiF1h/CyvGHWJjDFDkdIgONPLPcx5l+7rrvTma
	5G6qr2Lzo5rAu4f6i38Kz/WushONNwzk5h4xWebTwLLONb97e1rJNL1HV0PcVACqxzJ/zJlc4kzlw
	lcknmQhsZrKFiivjc7wx1TNGh035FpF9E0g5CrqtispiMkelO4radvvPbePzY4aP/WzCnC4OSdVak
	6DuNoeDfgy/qxqF8Fej8MPzEjCNSUcypwfCSSwHIeEKgcvR8GuUkQ6JMV0UNpolo3l4cREaGEDvh3
	VAhCKJew==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=paroga.com;
	 s=easyname; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=TXVzlDmNhLCq95/mMjyunngNK+mLMLLWMLMstZdKwDc=; b=N8TXraIwOC2y+kydJ70DzvW0uS
	AZTB3Gi5ydGCdlnLyXdSwQmiY/uguhznTruMwtdSiF1h/CyvGHWJjDFDkdIgONPLPcx5l+7rrvTma
	5G6qr2Lzo5rAu4f6i38Kz/WushONNwzk5h4xWebTwLLONb97e1rJNL1HV0PcVACqxzJ/zJlc4kzlw
	lcknmQhsZrKFiivjc7wx1TNGh035FpF9E0g5CrqtispiMkelO4radvvPbePzY4aP/WzCnC4OSdVak
	6DuNoeDfgy/qxqF8Fej8MPzEjCNSUcypwfCSSwHIeEKgcvR8GuUkQ6JMV0UNpolo3l4cREaGEDvh3
	VAhCKJew==;
Received: from 84-115-225-171.cable.dynamic.surfer.at ([84.115.225.171] helo=localhost.localdomain)
	by mx.easyname.com with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <paroga@paroga.com>)
	id 1sBBTv-00073L-Ts; Sun, 26 May 2024 10:52:08 +0000
From: Patrick Gansterer <paroga@paroga.com>
To: dri-devel@lists.freedesktop.org,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-fbdev@vger.kernel.org
Cc: Patrick Gansterer <paroga@paroga.com>,
	Lee Jones <lee@kernel.org>,
	Daniel Thompson <daniel.thompson@linaro.org>,
	Jingoo Han <jingoohan1@gmail.com>,
	Pavel Machek <pavel@ucw.cz>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Helge Deller <deller@gmx.de>,
	Sam Ravnborg <sam@ravnborg.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v6 1/2] dt-bindings: backlight: Add Texas Instruments LM3509
Date: Sun, 26 May 2024 12:51:29 +0200
Message-ID: <20240526105136.721529-2-paroga@paroga.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240526105136.721529-1-paroga@paroga.com>
References: <20240526105136.721529-1-paroga@paroga.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Easy-Autoreply: EN

Add Device Tree bindings for Texas Instruments LM3509 - a
High Efficiency Boost for White LED's and/or OLED Displays

Signed-off-by: Patrick Gansterer <paroga@paroga.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
---
 .../bindings/leds/backlight/ti,lm3509.yaml    | 136 ++++++++++++++++++
 1 file changed, 136 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/backlight/ti,lm3509.yaml

diff --git a/Documentation/devicetree/bindings/leds/backlight/ti,lm3509.yaml b/Documentation/devicetree/bindings/leds/backlight/ti,lm3509.yaml
new file mode 100644
index 000000000000..482fae71dd53
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/backlight/ti,lm3509.yaml
@@ -0,0 +1,136 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/backlight/ti,lm3509.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: TI LM3509 High Efficiency Boost for White LED's and/or OLED Displays
+
+maintainers:
+  - Patrick Gansterer <paroga@paroga.com>
+
+description:
+  The LM3509 current mode boost converter offers two separate outputs.
+  https://www.ti.com/product/LM3509
+
+properties:
+  compatible:
+    const: ti,lm3509
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
+  reset-gpios:
+    maxItems: 1
+
+  ti,brightness-rate-of-change-us:
+    description: Brightness Rate of Change in microseconds.
+    enum: [51, 13000, 26000, 52000]
+
+  ti,oled-mode:
+    description: Enable OLED mode.
+    type: boolean
+
+patternProperties:
+  "^led@[01]$":
+    type: object
+    description: Properties for a string of connected LEDs.
+    $ref: common.yaml#
+
+    properties:
+      reg:
+        description:
+          The control register that is used to program the two current sinks.
+          The LM3509 has two registers (BMAIN and BSUB) and are represented
+          as 0 or 1 in this property. The two current sinks can be controlled
+          independently with both registers, or register BMAIN can be
+          configured to control both sinks with the led-sources property.
+        minimum: 0
+        maximum: 1
+
+      label: true
+
+      led-sources:
+        minItems: 1
+        maxItems: 2
+        items:
+          minimum: 0
+          maximum: 1
+
+      default-brightness:
+        minimum: 0
+        maximum: 31
+        default: 18
+
+      max-brightness:
+        minimum: 0
+        maximum: 31
+        default: 31
+
+    required:
+      - reg
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        backlight@36 {
+            compatible = "ti,lm3509";
+            reg = <0x36>;
+            reset-gpios = <&gpio2 5 GPIO_ACTIVE_LOW>;
+
+            ti,oled-mode;
+            ti,brightness-rate-of-change-us = <52000>;
+
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            led@0 {
+                reg = <0>;
+                led-sources = <0 1>;
+                label = "lcd-backlight";
+                default-brightness = <12>;
+                max-brightness = <31>;
+            };
+        };
+    };
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        backlight@36 {
+            compatible = "ti,lm3509";
+            reg = <0x36>;
+
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            led@0 {
+                reg = <0>;
+                default-brightness = <12>;
+            };
+
+            led@1 {
+                reg = <1>;
+                default-brightness = <15>;
+            };
+        };
+    };
-- 
2.45.1


