Return-Path: <linux-leds+bounces-3495-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AAD7A9E76B7
	for <lists+linux-leds@lfdr.de>; Fri,  6 Dec 2024 18:08:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 86789166A39
	for <lists+linux-leds@lfdr.de>; Fri,  6 Dec 2024 17:08:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB9571F3D5E;
	Fri,  6 Dec 2024 17:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siemens.com header.i=alexander.sverdlin@siemens.com header.b="Uy/g40pK"
X-Original-To: linux-leds@vger.kernel.org
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F6201F3D49
	for <linux-leds@vger.kernel.org>; Fri,  6 Dec 2024 17:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.136.64.225
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733504932; cv=none; b=mqDoh4H+5O/dPDYZhN3pZqBTgiM9EWZbGeSIJD3yeMJcORQSDPgzNaz+8mGf3FITmCVubBoyP1N/bi0ql8uPYqGc4y+pULzAznZch8azu7X9twFtLTvZ5hkfKWFAmi+fYZb99CbAr2RLwWGQjIEu1vm4bPxH0WS1xKgPzzsLnwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733504932; c=relaxed/simple;
	bh=Ll2rzZbtm6JssXOsxLQuzDBP/THgk4I2PFSzsese9to=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M2g4tIJMjuM3PR+orJIl3BXe3vhSIJ5HvMD4K4Zf9+RBPh2UTreArlflq9P07QtPh3unCwHtnseQHc0pgAbleY15kEH/QVIPrpvOtSkaHa4/kfOTmooqKWYZlDZe2/1jB28Dn/Ia29CNdvSyFWL9xcd/ZyQK3eZa6tBjF/8uVbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com; dkim=pass (2048-bit key) header.d=siemens.com header.i=alexander.sverdlin@siemens.com header.b=Uy/g40pK; arc=none smtp.client-ip=185.136.64.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 2024120617084074d5587ee0f0b4fc3c
        for <linux-leds@vger.kernel.org>;
        Fri, 06 Dec 2024 18:08:40 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=alexander.sverdlin@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=nFgpbr9ICMll5siYBTjeBnhfrpbASPh3GUsaLse4SlY=;
 b=Uy/g40pKnJOGA0ubGEHMel5IVJlab1WTXv31IzQLQCOMke8TiYEpWc3j0aXad4lWBYIRUd
 hJCo+9VHQdpCX7Qy+K9i16CHp6eVVZNIM7ZZdjEPzkE4rubt13VnZEQAa3cB4CnF5VHg2/BM
 5OQGWGkLmWAMvX6wd7mRq8ISy8Yne85ZD7NodL0OEx8XQX8Vzq2xoBioQheEjLdJwGP7yvfg
 mD/6dXR7OS3OkkPFISMrYgN6vuzETjisUExFVCcicu//E8WXoVG+f4H7xhi3gt0uwA8p4Tpq
 rSU+yYCv17TELBo8s85YhGPxP5zfHDp8gUXr3/u42l3Yafp4skFhjuLg==;
From: "A. Sverdlin" <alexander.sverdlin@siemens.com>
To: Dan Murphy <dmurphy@ti.com>,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Alexander Sverdlin <alexander.sverdlin@siemens.com>,
	dri-devel@lists.freedesktop.org,
	Lee Jones <lee@kernel.org>,
	Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>,
	Pavel Machek <pavel@ucw.cz>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Davis <afd@ti.com>
Subject: [PATCH 1/2] dt-bindings: backlight: Convert LP8860 into YAML format adding LP886x
Date: Fri,  6 Dec 2024 18:07:12 +0100
Message-ID: <20241206170717.1090206-2-alexander.sverdlin@siemens.com>
In-Reply-To: <20241206170717.1090206-1-alexander.sverdlin@siemens.com>
References: <20241206170717.1090206-1-alexander.sverdlin@siemens.com>
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

Add Texas Instruments' LP8864/LP8866 bindings into LP8860 converting them
into YAML format simultaneously. While here, drop the index of the "led"
subnode, this one is neither used nor mandated by the drivers. All the
*-cells properties are therefore not required.

Move the file into backlight directory because all of the LP886x drivers
are special backlight products.

Signed-off-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
---
 .../bindings/leds/backlight/ti,lp8860.yaml    | 86 +++++++++++++++++++
 .../devicetree/bindings/leds/leds-lp8860.txt  | 50 -----------
 2 files changed, 86 insertions(+), 50 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/leds/backlight/ti,lp8860.yaml
 delete mode 100644 Documentation/devicetree/bindings/leds/leds-lp8860.txt

diff --git a/Documentation/devicetree/bindings/leds/backlight/ti,lp8860.yaml b/Documentation/devicetree/bindings/leds/backlight/ti,lp8860.yaml
new file mode 100644
index 0000000000000..3ece2f6fc3f02
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/backlight/ti,lp8860.yaml
@@ -0,0 +1,86 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/backlight/ti,lp8860.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments - LP886x 4/6-Channel LED Driver family
+
+maintainers:
+  - Andrew Davis <afd@ti.com>
+  - Alexander Sverdlin <alexander.sverdlin@siemens.com>
+
+description: |
+  The LP8860-Q1 is an high-efficiency LED driver with boost controller.
+  It has 4 high-precision current sinks that can be controlled by a PWM input
+  signal, a SPI/I2C master, or both.
+
+  LP8866-Q1, LP8866S-Q1, LP8864-Q1, LP8864S-Q1 are newer products offering
+  similar functionality with 4/6 channels.
+
+  For more product information please see the links below:
+    https://www.ti.com/product/lp8860-q1
+    https://www.ti.com/product/LP8864-Q1
+    https://www.ti.com/product/LP8864S-Q1
+    https://www.ti.com/product/LP8866-Q1
+    https://www.ti.com/product/LP8866S-Q1
+
+properties:
+  compatible:
+    enum:
+      - ti,lp8860
+      - ti,lp8864
+
+  reg:
+    maxItems: 1
+    description: I2C slave address
+
+  enable-gpios:
+    maxItems: 1
+    description: GPIO pin to enable (active high) / disable the device
+
+  vled-supply:
+    description: LED supply
+
+  led:
+    type: object
+    $ref: common.yaml#
+    properties:
+      function: true
+      color: true
+      label: true
+      linux,default-trigger: true
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - led
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
+            reg = <0x2d>;
+            enable-gpios = <&gpio1 28 GPIO_ACTIVE_HIGH>;
+            vled-supply = <&vbatt>;
+
+            led {
+                function = LED_FUNCTION_BACKLIGHT;
+                color = <LED_COLOR_ID_WHITE>;
+                linux,default-trigger = "backlight";
+            };
+        };
+    };
+
+...
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
-- 
2.47.1


