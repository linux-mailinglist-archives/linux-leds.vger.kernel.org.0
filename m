Return-Path: <linux-leds+bounces-3528-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4598E9E8DC3
	for <lists+linux-leds@lfdr.de>; Mon,  9 Dec 2024 09:47:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1FF3718859D6
	for <lists+linux-leds@lfdr.de>; Mon,  9 Dec 2024 08:47:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC8332156EA;
	Mon,  9 Dec 2024 08:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siemens.com header.i=alexander.sverdlin@siemens.com header.b="P7Z4/3rR"
X-Original-To: linux-leds@vger.kernel.org
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AB8720E01F
	for <linux-leds@vger.kernel.org>; Mon,  9 Dec 2024 08:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.136.64.228
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733734065; cv=none; b=loDMnDW1HyFEkEH0g3TaWKJJlpBxm+ZSm1Ewjq2IEvTrwFnF9/6il0GYkigqxAm8PV+/0BBkWDMCgH7WubFvTgvZq8Tz7cN7yuY100lncrxxpkGBY6g+oDlgxMDoV7pA3zjaeQmFfk63P9a349kijIqKE8TZuByyoQLa6ZSoH0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733734065; c=relaxed/simple;
	bh=ugwqjcKeCVWNGQe4Gl/BYMJ5xwvEBse3RWlDtdPGzLU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K8N04b5clhiVax8LWpZ9WmYhEhCQCxRWPWLaMcaawGNPhiCA1Gh80uSlTEqGS+i3Pv9dqyQGxQqBP0bwFzlPQeD2uJzjxFuf8CslETevFxU2S+39nGt/CacMopIoq9ZX2+vd4aa56DxDOhmLWx42YEmJHXAWMP6a6KrV1zKa8dg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com; dkim=pass (2048-bit key) header.d=siemens.com header.i=alexander.sverdlin@siemens.com header.b=P7Z4/3rR; arc=none smtp.client-ip=185.136.64.228
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 202412090847341f3cbdd0590837320e
        for <linux-leds@vger.kernel.org>;
        Mon, 09 Dec 2024 09:47:34 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=alexander.sverdlin@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=IV5HDvN7i9fDDayKfll220r1rVUhhyycIe3U6lE/ZFc=;
 b=P7Z4/3rRZ6TD6DJtKt5+pKVTQfCVGCp9COe8OsNtVV/Eyh0BEW2OUf0pacaAoai/gHxw6W
 GxTKQs1yk7IuMJSVig+yp7uWNugmyAYgLGAz6ghviUMf8wAWhh6pX/MJyLwH6Rfy8qM9J+0q
 87nFbEsPNGKhFlu65MI1AhFnaaENKRcBM9KuG+cBzT2PZPWvmeSC4/TXEmFGI7DWyS4qt+zq
 fmXVMysFO1ECddQ3hODRIyGTIKE7Fh0qt4u4w8aXQdvMp3qiIpQ1rOqQel483NnFGVdzdzTr
 /Ye+6KOH28/vVXx1UsV8EuUKb+Kv54pUstLT+N1SR7XPMmIk97yvCgkw==;
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
Subject: [PATCH v3 1/2] dt-bindings: backlight: add TI LP8864/LP8866 LED-backlight drivers
Date: Mon,  9 Dec 2024 09:45:53 +0100
Message-ID: <20241209084602.1199936-2-alexander.sverdlin@siemens.com>
In-Reply-To: <20241209084602.1199936-1-alexander.sverdlin@siemens.com>
References: <20241209084602.1199936-1-alexander.sverdlin@siemens.com>
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

Signed-off-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
---
Changelog:
v3: no changes
v2: ti,8860 has been decoupled from this series and converted to YAML separately

 .../bindings/leds/backlight/ti,lp8864.yaml    | 80 +++++++++++++++++++
 1 file changed, 80 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/backlight/ti,lp8864.yaml

diff --git a/Documentation/devicetree/bindings/leds/backlight/ti,lp8864.yaml b/Documentation/devicetree/bindings/leds/backlight/ti,lp8864.yaml
new file mode 100644
index 0000000000000..d44232d462bde
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


