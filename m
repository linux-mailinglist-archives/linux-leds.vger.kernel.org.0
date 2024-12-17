Return-Path: <linux-leds+bounces-3627-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CF439F4CC0
	for <lists+linux-leds@lfdr.de>; Tue, 17 Dec 2024 14:47:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C3A50161F7B
	for <lists+linux-leds@lfdr.de>; Tue, 17 Dec 2024 13:47:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDEEA171092;
	Tue, 17 Dec 2024 13:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siemens.com header.i=alexander.sverdlin@siemens.com header.b="Ji0yjI65"
X-Original-To: linux-leds@vger.kernel.org
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 031F91E0490
	for <linux-leds@vger.kernel.org>; Tue, 17 Dec 2024 13:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.136.64.226
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734443251; cv=none; b=ZjpzSeLsdRJVDKyKlFbgl3K+dXnnLiyrBdb7OnCnwaFI8XqRPU5OH77j0iWPvI+S+mFZDyKry/oThP34pu0m1ZzLhe+opSCJinN9ZMm+so7J7hLwAfHljRMYQphkoOIeVSOdoEgDjK+D78sstvzNaD7kdrap1dX1LRUDfbVN3Ds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734443251; c=relaxed/simple;
	bh=RcxsmXaOrOS7TItdh9WnK2TBwZiROu2C3K20cI5a3fc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VTVNAvmNGDYfGNOVdXmy955U/oXX6gOQZ4v2y/5Hc59cIMAKCpjU5cmBiO3tZhH5rK5lKeOlcwi01szdpznpjCv85h/JY06hLdQTzqdE1vDkTkLe7djdnbPrr2NTx1nN6aeP1hxbXw0RoChDA4YMAj+Thnr83ExF8PwyXtsao9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com; dkim=pass (2048-bit key) header.d=siemens.com header.i=alexander.sverdlin@siemens.com header.b=Ji0yjI65; arc=none smtp.client-ip=185.136.64.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 20241217133716e5a409999e289f2f15
        for <linux-leds@vger.kernel.org>;
        Tue, 17 Dec 2024 14:37:16 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=alexander.sverdlin@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=G3qzCo7ndhglMWwp/i6GYx0G++1nRS2CveJaBKmYoKs=;
 b=Ji0yjI65iqrdRIYNRe07xbz9/flezOCmiLscATWJ6UR3B8lUpuGdI0GK2T8wd/V5jKF+AH
 sdPkPcrcfenTPMngybKD+Yh3yn3c6fb9DafQUutF2eCVqoDBCZxgk3n/NtUBcZfLRwSm16U6
 BHrrn8u+2Sk3on/DvsvcCoUaj7Wy/tb1l/920qD91uXiuez1f0eFXQgRkdCB0zDkySgCnciM
 ziR4WZPsNxBcBmttM3xHaQQvURKJcgYov57pK/Rv7Z7OVtVMP91m1U+SW6se5mcthJt5fWx2
 mkj8oQF/05WhdiSrJGww/0fe9aegfDWnq4QTVcV/vO7/TbgBI9IndoOA==;
From: "A. Sverdlin" <alexander.sverdlin@siemens.com>
To: linux-leds@vger.kernel.org,
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
Subject: [PATCH v4 1/2] dt-bindings: backlight: add TI LP8864/LP8866 LED-backlight drivers
Date: Tue, 17 Dec 2024 14:37:09 +0100
Message-ID: <20241217133713.326853-2-alexander.sverdlin@siemens.com>
In-Reply-To: <20241217133713.326853-1-alexander.sverdlin@siemens.com>
References: <20241217133713.326853-1-alexander.sverdlin@siemens.com>
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

Add bindings for Texas Instruments' LP8864/LP8866 LED-backlight drivers.
Note that multiple channels in these models are used for load-balancing and
brightness is controlled gobally, so from a user perspective it's only one
LED.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
---
v4: no changes
v3: no changes
v2: ti,8860 has been decoupled from this series and converted to YAML separately

 .../bindings/leds/backlight/ti,lp8864.yaml    | 80 +++++++++++++++++++
 1 file changed, 80 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/backlight/ti,lp8864.yaml

diff --git a/Documentation/devicetree/bindings/leds/backlight/ti,lp8864.yaml b/Documentation/devicetree/bindings/leds/backlight/ti,lp8864.yaml
new file mode 100644
index 000000000000..d44232d462bd
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/backlight/ti,lp8864.yaml
@@ -0,0 +1,80 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/backlight/ti,lp8864.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments - LP8864/LP8866 4/6-Channel LED Driver family
+
+maintainers:
+  - Andrew Davis <afd@ti.com>
+  - Alexander Sverdlin <alexander.sverdlin@siemens.com>
+
+description: |
+  LP8866-Q1, LP8866S-Q1, LP8864-Q1, LP8864S-Q1 are display LED-backlight drivers
+  with 4/6 channels. LED brightness can be controlled globally through the I2C
+  interface or PWM input.
+
+  For more product information please see the links below:
+    https://www.ti.com/product/LP8864-Q1
+    https://www.ti.com/product/LP8864S-Q1
+    https://www.ti.com/product/LP8866-Q1
+    https://www.ti.com/product/LP8866S-Q1
+
+properties:
+  compatible:
+    const: ti,lp8864
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
+        led-controller@3a {
+            compatible = "ti,lp8864";
+            reg = <0x3a>;
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
-- 
2.47.1


