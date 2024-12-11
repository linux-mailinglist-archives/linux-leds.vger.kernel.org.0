Return-Path: <linux-leds+bounces-3581-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CC869ED315
	for <lists+linux-leds@lfdr.de>; Wed, 11 Dec 2024 18:09:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B1A171650D7
	for <lists+linux-leds@lfdr.de>; Wed, 11 Dec 2024 17:09:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F97C1DAC90;
	Wed, 11 Dec 2024 17:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siemens.com header.i=alexander.sverdlin@siemens.com header.b="CJP0B6Tj"
X-Original-To: linux-leds@vger.kernel.org
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF22824634B
	for <linux-leds@vger.kernel.org>; Wed, 11 Dec 2024 17:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.136.65.227
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733936952; cv=none; b=HYfHr5ou788ZtaJgYQZlzAuByEnhmGBwOnhdcOL4ID8RT3WB6Aai/EcZQU874Z6HWx6kYWhpnJTJtMeeMsKBkeg41fpedjXZDXwNQXGzOuPBgp+3qAkegKQVMWF3knXFd+ePg/v+Tp3LDyZf/Z+JmIrBVOY2dEArUKcGCn9kW1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733936952; c=relaxed/simple;
	bh=GGhzZ9HAZ0QpfYxa4daf8/33QdImYTVf8ZhCj9ss+TY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kFYrYG7D7/4BOEfzIuVQs0y99/e0+y+94MrOFYlc6k470Of1p6LYbkmf97ioiXXbqLbDYcN+Huwev32hdUuXZW/jHdtBF5LdPB85Ivt9MVTpZkJGZLw7z3YuUMUPpQihFFZorIYGbYtF0gWW6+fPpwZwka/aROqjhZD+Ij1qgzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com; dkim=pass (2048-bit key) header.d=siemens.com header.i=alexander.sverdlin@siemens.com header.b=CJP0B6Tj; arc=none smtp.client-ip=185.136.65.227
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 20241211170900b7d9dd93b87c3e0088
        for <linux-leds@vger.kernel.org>;
        Wed, 11 Dec 2024 18:09:00 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=alexander.sverdlin@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=di5l4sBKfkp070ErqCt0OmkbAhg9MJHULf+VQGpR0d8=;
 b=CJP0B6TjyQpRWSBLaaS4R3QWUPIeCVARl/8rkFx5wegBXKT7ibBNFWI3nfrfJTlOKSXIs6
 AbX2E0/IdwBW9zDVO4JT6wyqom2VF+eftRkKroi16QjC20I8cbgLOwoS6h+frG6710mG/u3E
 wi2R0MqnL7BuISZInUoI8F9xYe3DB4o5EoHLVHz1hslJXu4+ugI/lViWdMRDO0UIppU9z6Bi
 XGWOEHU17sveCdmmsL2n/zcc5wO+t39FNwdVwvFIbA7KrrRF2hi6Q3sqUhEdWFS28aXoCj01
 UI4PWi7AI1F1Uy6cFBCcn+Qkwqjl8s0pktpgokQIwKPARBQkqXsnICjQ==;
From: "A. Sverdlin" <alexander.sverdlin@siemens.com>
To: Conor Dooley <conor+dt@kernel.org>,
	Andrew Davis <afd@ti.com>,
	devicetree@vger.kernel.org
Cc: Alexander Sverdlin <alexander.sverdlin@siemens.com>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-leds@vger.kernel.org
Subject: [PATCH v2] dt-bindings: leds: Convert LP8860 into YAML format
Date: Wed, 11 Dec 2024 18:07:29 +0100
Message-ID: <20241211170734.2345887-1-alexander.sverdlin@siemens.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-456497:519-21489:flowmailer

From: Alexander Sverdlin <alexander.sverdlin@siemens.com>

Convert Texas Instruments' LP8860 LED driver bindings into YAML format.

Acked-by: Andrew Davis <afd@ti.com>
Signed-off-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
---
Changelog:
v2: patternProperties: ^led@[0]$ -> ^led(@[0-3])?$

 .../devicetree/bindings/leds/leds-lp8860.txt  | 50 ----------
 .../devicetree/bindings/leds/ti,lp8860.yaml   | 95 +++++++++++++++++++
 2 files changed, 95 insertions(+), 50 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/leds/leds-lp8860.txt
 create mode 100644 Documentation/devicetree/bindings/leds/ti,lp8860.yaml

diff --git a/Documentation/devicetree/bindings/leds/leds-lp8860.txt b/Documentation/devicetree/bindings/leds/leds-lp8860.txt
deleted file mode 100644
index 8bb25749a3da3..0000000000000
--- a/Documentation/devicetree/bindings/leds/leds-lp8860.txt
+++ /dev/null
@@ -1,50 +0,0 @@
-* Texas Instruments - lp8860 4-Channel LED Driver
-
-The LP8860-Q1 is an high-efficiency LED
-driver with boost controller. It has 4 high-precision
-current sinks that can be controlled by a PWM input
-signal, a SPI/I2C master, or both.
-
-Required properties:
-	- compatible :
-		"ti,lp8860"
-	- reg : I2C slave address
-	- #address-cells : 1
-	- #size-cells : 0
-
-Optional properties:
-	- enable-gpios : gpio pin to enable (active high)/disable the device.
-	- vled-supply : LED supply
-
-Required child properties:
-	- reg : 0
-
-Optional child properties:
-	- function : see Documentation/devicetree/bindings/leds/common.txt
-	- color : see Documentation/devicetree/bindings/leds/common.txt
-	- label : see Documentation/devicetree/bindings/leds/common.txt (deprecated)
-	- linux,default-trigger :
-	   see Documentation/devicetree/bindings/leds/common.txt
-
-Example:
-
-#include <dt-bindings/leds/common.h>
-
-led-controller@2d {
-	compatible = "ti,lp8860";
-	#address-cells = <1>;
-	#size-cells = <0>;
-	reg = <0x2d>;
-	enable-gpios = <&gpio1 28 GPIO_ACTIVE_HIGH>;
-	vled-supply = <&vbatt>;
-
-	led@0 {
-		reg = <0>;
-		function = LED_FUNCTION_BACKLIGHT;
-		color = <LED_COLOR_ID_WHITE>;
-		linux,default-trigger = "backlight";
-	};
-}
-
-For more product information please see the link below:
-https://www.ti.com/product/lp8860-q1
diff --git a/Documentation/devicetree/bindings/leds/ti,lp8860.yaml b/Documentation/devicetree/bindings/leds/ti,lp8860.yaml
new file mode 100644
index 0000000000000..98eef21604b86
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/ti,lp8860.yaml
@@ -0,0 +1,95 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/ti,lp8860.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments - lp8860 4-Channel LED Driver
+
+maintainers:
+  - Andrew Davis <afd@ti.com>
+
+description: |
+  The LP8860-Q1 is an high-efficiency LED driver with boost controller.
+  It has 4 high-precision current sinks that can be controlled by a PWM input
+  signal, a SPI/I2C master, or both.
+
+  For more product information please see the link below:
+    https://www.ti.com/product/lp8860-q1
+
+properties:
+  compatible:
+    const: ti,lp8860
+
+  reg:
+    maxItems: 1
+    description: I2C slave address
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+  enable-gpios:
+    maxItems: 1
+    description: GPIO pin to enable (active high) / disable the device
+
+  vled-supply:
+    description: LED supply
+
+patternProperties:
+  "^led(@[0-3])?$":
+    type: object
+    $ref: common.yaml#
+    unevaluatedProperties: false
+
+    properties:
+      reg:
+        description:
+          Index of the LED.
+        const: 0
+
+      function: true
+      color: true
+      label: true
+      linux,default-trigger: true
+
+    required:
+      - reg
+
+required:
+  - compatible
+  - reg
+  - "#address-cells"
+  - "#size-cells"
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
+        led-controller@2d {
+            compatible = "ti,lp8860";
+            #address-cells = <1>;
+            #size-cells = <0>;
+            reg = <0x2d>;
+            enable-gpios = <&gpio1 28 GPIO_ACTIVE_HIGH>;
+            vled-supply = <&vbatt>;
+
+            led@0 {
+                reg = <0>;
+                function = LED_FUNCTION_BACKLIGHT;
+                color = <LED_COLOR_ID_WHITE>;
+                linux,default-trigger = "backlight";
+            };
+        };
+    };
+
+...
-- 
2.47.1


