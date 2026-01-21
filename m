Return-Path: <linux-leds+bounces-6695-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iEb4MxZocWmaGgAAu9opvQ
	(envelope-from <linux-leds+bounces-6695-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 22 Jan 2026 00:58:14 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 044AC5FBF1
	for <lists+linux-leds@lfdr.de>; Thu, 22 Jan 2026 00:58:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 19F7B5C24CE
	for <lists+linux-leds@lfdr.de>; Wed, 21 Jan 2026 23:57:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B8D343DA3E;
	Wed, 21 Jan 2026 23:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P5PC/tAC"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0BD2329E6D;
	Wed, 21 Jan 2026 23:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769039872; cv=none; b=Z7vHYtrk1ZBr9LjU3O5Ou1yMOjmmoHJ6JSQbS293mCyOufJYZK2TEtsRX3DXnh7UuxgxEuN6KCopRdEFqIsKVjU+mHnmBZiLsmCYyzW6jZoLaT88h54Y7ijEOCKIGv8f4okmNWeeAplmTYAyVu0hJ1yRCCSkMm11NiiQaKWrw50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769039872; c=relaxed/simple;
	bh=Jkmog5Vs89bzspcV6JC3KYdg43ZNXQHAk5yI4qoY/Mc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LaM2gcJIq+mtD8QoarNMqrZwCydSropQjQ7717JuWRy5cCdBZtF2An+cR5hLNKHBrDr65fJHW43vfc+wMQSl2+2imKis1J6cKZSxwCwi6GSbnITwMwdoncsLl4ADiyDbdJRe1ER/Ay998d5hxhbQEo1kdNvkpymc4N02hDxxveM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P5PC/tAC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6397FC4CEF1;
	Wed, 21 Jan 2026 23:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769039872;
	bh=Jkmog5Vs89bzspcV6JC3KYdg43ZNXQHAk5yI4qoY/Mc=;
	h=From:To:Cc:Subject:Date:From;
	b=P5PC/tACCD6/Yhla0wW6D6iItZIVcoeErbNCbCU0ABNvUff0CLqfFFtNn0gAKZk1t
	 EXu/ZTmcVW2but6BJYVSMevHyuwziM9z/NKxNu1gH1sN/MxpVvK3z5p8Gb3WuXIUjz
	 9uK9gF+ejK2W7YrfhPMLQK2cWW8bRELxXdLVZptT0j/mpwi7zjBq644fV1U2Fg4SOy
	 iugaMtf6V13HyExnRhxvG7pMdNY8V4rF7XEjjfILjsPD6RsCobcy23KVELxi/6U3h0
	 z/XJL4kGvUyxrssNT4ksqI75e5Niru8Vm++rTWJeaEm6H/0jHgLMj73xBAVYr/jNCO
	 yy+BvNkfuMyvQ==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dan Murphy <dmurphy@ti.com>
Cc: linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: leds: Convert ti,lm3697 to DT schema
Date: Wed, 21 Jan 2026 17:57:45 -0600
Message-ID: <20260121235746.370607-1-robh@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6695-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-leds@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	RCPT_COUNT_SEVEN(0.00)[8];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	PRECEDENCE_BULK(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 044AC5FBF1
X-Rspamd-Action: no action

Convert the TI LM3697 LED driver binding to DT schema format. It's a
straight-forward conversion.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/leds/leds-lm3697.txt  |  73 ----------
 .../devicetree/bindings/leds/ti,lm3697.yaml   | 125 ++++++++++++++++++
 2 files changed, 125 insertions(+), 73 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/leds/leds-lm3697.txt
 create mode 100644 Documentation/devicetree/bindings/leds/ti,lm3697.yaml

diff --git a/Documentation/devicetree/bindings/leds/leds-lm3697.txt b/Documentation/devicetree/bindings/leds/leds-lm3697.txt
deleted file mode 100644
index 221b37b6049b..000000000000
--- a/Documentation/devicetree/bindings/leds/leds-lm3697.txt
+++ /dev/null
@@ -1,73 +0,0 @@
-* Texas Instruments - LM3697 Highly Efficient White LED Driver
-
-The LM3697 11-bit LED driver provides high-
-performance backlight dimming for 1, 2, or 3 series
-LED strings while delivering up to 90% efficiency.
-
-This device is suitable for display and keypad lighting
-
-Required properties:
-	- compatible:
-		"ti,lm3697"
-	- reg :  I2C slave address
-	- #address-cells : 1
-	- #size-cells : 0
-
-Optional properties:
-	- enable-gpios : GPIO pin to enable/disable the device
-	- vled-supply : LED supply
-
-Required child properties:
-	- reg : 0 - LED is Controlled by bank A
-		1 - LED is Controlled by bank B
-	- led-sources : Indicates which HVLED string is associated to which
-			control bank.  This is a zero based property so
-			HVLED1 = 0, HVLED2 = 1, HVLED3 = 2.
-			Additional information is contained
-			in Documentation/devicetree/bindings/leds/common.txt
-
-Optional child properties:
-	- ti,brightness-resolution - see Documentation/devicetree/bindings/mfd/ti-lmu.txt
-	- ramp-up-us: see Documentation/devicetree/bindings/mfd/ti-lmu.txt
-	- ramp-down-us: see Documentation/devicetree/bindings/mfd/ti-lmu.txt
-	- label : see Documentation/devicetree/bindings/leds/common.txt
-	- linux,default-trigger :
-	   see Documentation/devicetree/bindings/leds/common.txt
-
-Example:
-
-HVLED string 1 and 3 are controlled by control bank A and HVLED 2 string is
-controlled by control bank B.
-
-led-controller@36 {
-	compatible = "ti,lm3697";
-	#address-cells = <1>;
-	#size-cells = <0>;
-	reg = <0x36>;
-
-	enable-gpios = <&gpio1 28 GPIO_ACTIVE_HIGH>;
-	vled-supply = <&vbatt>;
-
-	led@0 {
-		reg = <0>;
-		led-sources = <0 2>;
-		ti,brightness-resolution = <2047>;
-		ramp-up-us = <5000>;
-		ramp-down-us = <1000>;
-		label = "white:first_backlight_cluster";
-		linux,default-trigger = "backlight";
-	};
-
-	led@1 {
-		reg = <1>;
-		led-sources = <1>;
-		ti,brightness-resolution = <255>;
-		ramp-up-us = <500>;
-		ramp-down-us = <1000>;
-		label = "white:second_backlight_cluster";
-		linux,default-trigger = "backlight";
-	};
-}
-
-For more product information please see the link below:
-https://www.ti.com/lit/ds/symlink/lm3697.pdf
diff --git a/Documentation/devicetree/bindings/leds/ti,lm3697.yaml b/Documentation/devicetree/bindings/leds/ti,lm3697.yaml
new file mode 100644
index 000000000000..a9f839470a84
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/ti,lm3697.yaml
@@ -0,0 +1,125 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/ti,lm3697.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: TI LM3697 Highly Efficient White LED Driver
+
+maintainers:
+  - Dan Murphy <dmurphy@ti.com>
+
+description: >
+  The LM3697 11-bit LED driver provides high-performance backlight dimming for
+  1, 2, or 3 series LED strings while delivering up to 90% efficiency.
+
+  This device is suitable for display and keypad lighting.
+
+properties:
+  compatible:
+    const: ti,lm3697
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
+  enable-gpios:
+    description: GPIO pin to enable or disable the device.
+    maxItems: 1
+
+  vled-supply:
+    description: LED supply for the device.
+
+patternProperties:
+  '^led@[01]$':
+    description: LED control bank nodes.
+    $ref: common.yaml#
+    unevaluatedProperties: false
+
+    properties:
+      reg:
+        description: Control bank selection (0 = bank A, 1 = bank B).
+        maximum: 1
+
+      led-sources:
+        description: >
+          HVLED strings associated with this control bank:
+
+            0 - HVLED1
+            1 - HVLED2
+            2 - HVLED3
+        minItems: 1
+        maxItems: 3
+        items:
+          maximum: 2
+
+      ti,brightness-resolution:
+        description: Brightness resolution for the LED string.
+        $ref: /schemas/types.yaml#/definitions/uint32
+        maximum: 2047
+
+      ramp-up-us:
+        description: Ramp-up time in microseconds.
+        minimum: 117
+        maximum: 2048
+
+      ramp-down-us:
+        description: Ramp-down time in microseconds.
+        minimum: 117
+        maximum: 2048
+
+    required:
+      - reg
+      - led-sources
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
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        led-controller@36 {
+            compatible = "ti,lm3697";
+            #address-cells = <1>;
+            #size-cells = <0>;
+            reg = <0x36>;
+
+            enable-gpios = <&gpio1 28 GPIO_ACTIVE_HIGH>;
+            vled-supply = <&vbatt>;
+
+            led@0 {
+                reg = <0>;
+                led-sources = <0 2>;
+                ti,brightness-resolution = <2047>;
+                ramp-up-us = <500>;
+                ramp-down-us = <1000>;
+                label = "white:first_backlight_cluster";
+                linux,default-trigger = "backlight";
+            };
+
+            led@1 {
+                reg = <1>;
+                led-sources = <1>;
+                ti,brightness-resolution = <255>;
+                ramp-up-us = <500>;
+                ramp-down-us = <1000>;
+                label = "white:second_backlight_cluster";
+                linux,default-trigger = "backlight";
+            };
+        };
+    };
-- 
2.51.0


