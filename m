Return-Path: <linux-leds+bounces-5634-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BF7BABB36FE
	for <lists+linux-leds@lfdr.de>; Thu, 02 Oct 2025 11:20:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A08CB3B14F3
	for <lists+linux-leds@lfdr.de>; Thu,  2 Oct 2025 09:20:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CC2D301495;
	Thu,  2 Oct 2025 09:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20230601.gappssmtp.com header.i=@thegoodpenguin-co-uk.20230601.gappssmtp.com header.b="lC5Qa7jW"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E2E03009E2
	for <linux-leds@vger.kernel.org>; Thu,  2 Oct 2025 09:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759396826; cv=none; b=B664kK2LZJ1QhVvDzZjkujgAT7UWZjRif4/WxhWTRpOV+n3nCjUIVnGGrQU71KbvNRAevbPCNwj65iICQE2PgrN0W/rV3NKt2Ravcs5T3A7lE2DkV+APoJZEXWQZCjNJb22WumDmw+KpyrP07FRuEXx/wob/PcwgtDY8rS88xf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759396826; c=relaxed/simple;
	bh=zdYza0w0NbYnhttHNMWIrEPUCu8Dh2V70JULL8fdAHA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=E3L1I0QVWdNx1aH8YSk0MkPB1JIQIuDPAcd54IRZIKbsFKHfY73RPk68+Ewfy3JM9R+YZgzXjvKxa6eShvlDDjZLfRvrLKKp4tfhkTn8GbABVOk8Iz1wx7yFjSPk1ayKFFODSHPb4rjGHBVXUhudj4R2LJCcWN3ecSlJKOao9AY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk; spf=pass smtp.mailfrom=thegoodpenguin.co.uk; dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20230601.gappssmtp.com header.i=@thegoodpenguin-co-uk.20230601.gappssmtp.com header.b=lC5Qa7jW; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-46e33b260b9so7734725e9.2
        for <linux-leds@vger.kernel.org>; Thu, 02 Oct 2025 02:20:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20230601.gappssmtp.com; s=20230601; t=1759396822; x=1760001622; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AYvj10bBcQwgR3ChOZCI93prvPHDIHBC9fD1r5qEQLU=;
        b=lC5Qa7jWlILg6ffqzL/pHiGgSiucduAbGMUzsfRN25/FcKt5tmgwtUYe+rTNJBAkI8
         3OFDsthBadnST5/u/rrrs3wouSiZsjrUOwIMN/feQOh/lXpstmmnSr+ZEbpQIf7cACm2
         lkDjMXDqNh4yUCYQ+Y5pxJ4BDFA4lrFHJpVwNBTwacoxlBDgRU91V9e8M9Mbnrwq7Tmk
         YO+ipXj4Cv/zs3AsCZuAogd/3+9GqK5J3cf4QETI0+OUsLYjqwNgHygBVYPovBnhR2ap
         SAAf2KISan2vJ7W6O8bM9xhDJquqz4wyAH9GwUr1whOzfePBRGdOEsin/+0rzryPir61
         loLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759396822; x=1760001622;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AYvj10bBcQwgR3ChOZCI93prvPHDIHBC9fD1r5qEQLU=;
        b=i3dzF+xOxw3DN0CUKnCbVbgoLgmJZMPIi7IGTORcMr6Pv5hWJOKTtG10NtKO7PB+ug
         8CeMAmTzuAGuzuuX6xKGuzau7sLojsvJ7wqdiGkP+ZNkeFI1OdCGL6eN9QLIVhfjV4Id
         Y4s3AhOuJuq3jpN22jkP6m0xkEqIEKf3sD7Ij7HdIfL+587YPjqy1UwzTeMYupO0xap6
         bAJK/xv1f3Vy91GPyjKVlMZOE8VwVkuj1+OLfU1tnZmpNkmF+Yj5r7wgJYea/diWjUIM
         qpzMy71TkRcWO1e/uOJTjv5IBpVaaEtyo8OA7n1/kC9Tv4amp9Cm6Wnd5McDHMr6GlTa
         K0Yg==
X-Gm-Message-State: AOJu0Yx1lUVe2XLVYWMfevlC8EDloYT9IcXSTPYDdGVqtXpBf/VfNHZ7
	Ni1a4QIH77u2Gi0DN1UzCzRo+1h6E60/UywmgW5CQixnqMzmaB+3D7wpPSGvHAuKJe8OYKkvQ1T
	BCbKe+ds=
X-Gm-Gg: ASbGncsL/sJW7nUfU6qL9r6FWCvIACvxT5yt1eZTAn/GAcfYjw23nE4Ht+Bo6cCPH9w
	ds7TKoUnxRSAfJm4dZ85nAGh2UJ6dHgip5m5qKXkpsXThnJBv4afK2aqWyzC4ZbcPaCXCuV83bq
	xtbKLZMVrWMdmYLjuXpzXoNEDJ8GGCy6+R5xWQ7gOp2nBBZxs24N7DnByBIo2dA2mQgeiRAMLH6
	9yZRow4YddVndrVVEB5HglO2I2AakuGOFnHdzuyk9QGdLmqvQkVuL4pJ2m1v806blhMcD75E43H
	gCQIvxMLpShZr85Zxwr+rmzLfYL86XWA6ozg0h1oGRI0IaPXLBpwzsvcmdn6PHSBzcT53MIfO/I
	tH7uaeB2Qre2WXCp+DOiE8vaKvaZJzpeum/MRxtCy/TXE4j9l+ZJ3rMn5/AUY
X-Google-Smtp-Source: AGHT+IGDxgfxGLV3DDzH7kduQOh+SYIp6rjqG1ukGoP/Pjjnq2/QzbqJnZFIfjGRp/sVaEzEGMolTg==
X-Received: by 2002:a05:600c:468f:b0:46e:1abc:1811 with SMTP id 5b1f17b1804b1-46e612daf33mr47322265e9.27.1759396821662;
        Thu, 02 Oct 2025 02:20:21 -0700 (PDT)
Received: from [127.0.1.1] ([2a02:c7c:8a3e:8c00:3430:5fdd:d596:adae])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e6918bdebsm28958795e9.9.2025.10.02.02.20.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Oct 2025 02:20:21 -0700 (PDT)
From: Harrison Carter <hcarter@thegoodpenguin.co.uk>
Date: Thu, 02 Oct 2025 10:20:15 +0100
Subject: [PATCH 1/2] dt-bindings: leds: ti,lm3532: Convert to DT Schema
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251002-ti-leds-to-dt-v1-1-1604ae333479@thegoodpenguin.co.uk>
References: <20251002-ti-leds-to-dt-v1-0-1604ae333479@thegoodpenguin.co.uk>
In-Reply-To: <20251002-ti-leds-to-dt-v1-0-1604ae333479@thegoodpenguin.co.uk>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Dan Murphy <dmurphy@ti.com>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Harrison Carter <hcarter@thegoodpenguin.co.uk>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759396820; l=9817;
 i=hcarter@thegoodpenguin.co.uk; s=20250904; h=from:subject:message-id;
 bh=zdYza0w0NbYnhttHNMWIrEPUCu8Dh2V70JULL8fdAHA=;
 b=X6ngZTOOjHd+TCx5b0jPw307eXglfMo2dEYL3vFiVeqmtsl4cKbr23+FeXX3QLqm4UnKrjrpf
 E6AqRlVmhDADlKZbWZaJjpFvIdYmBLJP6rfftz0zl6GP6I6bBDSvB57
X-Developer-Key: i=hcarter@thegoodpenguin.co.uk; a=ed25519;
 pk=xn5ghTMMWQniDtZih4xwKCTAaBHDozflTmqNKtaKo6s=

Converts the ti,lm3532 to DT Schema format

Signed-off-by: Harrison Carter <hcarter@thegoodpenguin.co.uk>
---
 .../devicetree/bindings/leds/leds-lm3532.txt       | 105 -------------
 .../devicetree/bindings/leds/ti,lm3532.yaml        | 172 +++++++++++++++++++++
 2 files changed, 172 insertions(+), 105 deletions(-)

diff --git a/Documentation/devicetree/bindings/leds/leds-lm3532.txt b/Documentation/devicetree/bindings/leds/leds-lm3532.txt
deleted file mode 100644
index 097490a5ff91206ce8c8f0fe0a093a043f089416..0000000000000000000000000000000000000000
--- a/Documentation/devicetree/bindings/leds/leds-lm3532.txt
+++ /dev/null
@@ -1,105 +0,0 @@
-* Texas Instruments - lm3532 White LED driver with ambient light sensing
-capability.
-
-The LM3532 provides the 3 high-voltage, low-side current sinks. The device is
-programmable over an I2C-compatible interface and has independent
-current control for all three channels. The adaptive current regulation
-method allows for different LED currents in each current sink thus allowing
-for a wide variety of backlight and keypad applications.
-
-The main features of the LM3532 include dual ambient light sensor inputs
-each with 32 internal voltage setting resistors, 8-bit logarithmic and linear
-brightness control, dual external PWM brightness control inputs, and up to
-1000:1 dimming ratio with programmable fade in and fade out settings.
-
-Required properties:
-	- compatible : "ti,lm3532"
-	- reg : I2C slave address
-	- #address-cells : 1
-	- #size-cells : 0
-
-Optional properties:
-	- enable-gpios : gpio pin to enable (active high)/disable the device.
-	- ramp-up-us - The Run time ramp rates/step are from one current
-		       set-point to another after the device has reached its
-		       initial target set point from turn-on
-	- ramp-down-us - The Run time ramp rates/step are from one current
-			 set-point to another after the device has reached its
-			 initial target set point from turn-on
-	Range for ramp settings: 8us - 65536us
-
-Optional properties if ALS mode is used:
-	- ti,als-vmin - Minimum ALS voltage defined in Volts
-	- ti,als-vmax - Maximum ALS voltage defined in Volts
-	Per the data sheet the max ALS voltage is 2V and the min is 0V
-
-	- ti,als1-imp-sel - ALS1 impedance resistor selection in Ohms
-	- ti,als2-imp-sel - ALS2 impedance resistor selection in Ohms
-	Range for impedance select: 37000 Ohms - 1190 Ohms
-	Values above 37kohms will be set to the "High Impedance" setting
-
-	- ti,als-avrg-time-us - Determines the length of time the device needs to
-			  average the two ALS inputs.  This is only used if
-			  the input mode is LM3532_ALS_INPUT_AVRG.
-			     Range: 17920us - 2293760us
-	- ti,als-input-mode - Determines how the device uses the attached ALS
-			   devices.
-			   0x00 - ALS1 and ALS2 input average
-			   0x01 - ALS1 Input
-			   0x02 - ALS2 Input
-			   0x03 - Max of ALS1 and ALS2
-
-Required child properties:
-	- reg : Indicates control bank the LED string is controlled by
-	- led-sources : see Documentation/devicetree/bindings/leds/common.txt
-	- ti,led-mode : Defines if the LED strings are manually controlled or
-			if the LED strings are controlled by the ALS.
-			0x00 - LED strings are I2C controlled via full scale
-			       brightness control register
-			0x01 - LED strings are ALS controlled
-
-Optional LED child properties:
-	- label : see Documentation/devicetree/bindings/leds/common.txt
-	- linux,default-trigger :
-	   see Documentation/devicetree/bindings/leds/common.txt
-	- led-max-microamp : Defines the full scale current value for each control
-			  bank.  The range is from 5000uA-29800uA in increments
-			  of 800uA.
-
-Example:
-led-controller@38 {
-	compatible = "ti,lm3532";
-	#address-cells = <1>;
-	#size-cells = <0>;
-	reg = <0x38>;
-
-	enable-gpios = <&gpio6 12 GPIO_ACTIVE_HIGH>;
-	ramp-up-us = <1024>;
-	ramp-down-us = <65536>;
-
-	ti,als-vmin = <0>;
-	ti,als-vmax = <2000>;
-	ti,als1-imp-sel = <4110>;
-	ti,als2-imp-sel = <2180>;
-	ti,als-avrg-time-us = <17920>;
-	ti,als-input-mode = <0x00>;
-
-	led@0 {
-		reg = <0>;
-		led-sources = <2>;
-		ti,led-mode = <1>;
-		led-max-microamp = <21800>;
-		label = ":backlight";
-		linux,default-trigger = "backlight";
-	};
-
-	led@1 {
-		reg = <1>;
-		led-sources = <1>;
-		ti,led-mode = <0>;
-		label = ":kbd_backlight";
-	};
-};
-
-For more product information please see the links below:
-https://www.ti.com/product/LM3532
diff --git a/Documentation/devicetree/bindings/leds/ti,lm3532.yaml b/Documentation/devicetree/bindings/leds/ti,lm3532.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..425277e519bd6de9822822685e9f101d0b3ef40a
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/ti,lm3532.yaml
@@ -0,0 +1,172 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/ti,lm3532.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments - lm3532 White LED driver with
+  ambient light sensing capability.
+
+description: |
+  The LM3532 provides the 3 high-voltage,
+  low-side current sinks. The device is programmable over an
+  I2C-compatible interface and has independent current
+  control for all three channels. The adaptive current
+  regulation method allows for different LED currents in
+  each current sink thus allowing for a wide variety of
+  backlight and keypad applications.
+
+  The main features of the LM3532 include dual ambient light
+  sensor inputs each with 32 internal voltage setting
+  resistors, 8-bit logarithmic and linear brightness
+  control, dual external PWM brightness control inputs,
+  and up to 1000:1 dimming ratio with programmable fade in
+  and fade out settings.
+
+  For more product information please see the link below:
+  https://www.ti.com/product/LM3532
+
+maintainers:
+  - Dan Murphy <dmurphy@ti.com>
+
+properties:
+  compatible:
+    const: ti,lm3532
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
+    description: GPIO pin to enable (active high)/disable
+      the device.
+    maxItems: 1
+
+  ti,als-avrg-time-us:
+    description: Determines the length of time the device
+      needs to average the two ALS inputs.  This is only
+      used if the input mode is LM3532_ALS_INPUT_AVRG.
+    minimum: 17920
+    maximum: 2293760
+
+  ti,als-input-mode:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Determines how the device uses the attached
+      ALS devices.
+      0x00 - ALS1 and ALS2 input average
+      0x01 - ALS1 Input
+      0x02 - ALS2 Input
+      0x03 - Max of ALS1 and ALS2
+    minimum: 0
+    maximum: 3
+
+patternProperties:
+  "^ramp-(up|down)-us$":
+    description: The Run time ramp rates/step are from one
+      current set-point to another after the device has
+      reached its initial target set point from turn-on
+    minimum: 8
+    maximum: 65536
+
+  "^ti,als-v(min|max)$":
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Min/max ALS voltage in Volts.
+    minimum: 0
+    maximum: 2
+
+  "^ti,als(1|2)-imp-sel$":
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: ALS impedance resistor selection in Ohms.
+      Values above 37kohms will be set to the "High
+      Impedance" setting
+    minimum: 1190
+    maximum: 37000
+
+  "^led@[0,1]?([0-9]|[a-z])$":
+    $ref: common.yaml#
+    type: object
+    properties:
+      reg:
+        description: Indicates control bank the LED string
+          is controlled by
+
+      ti,led-mode:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description: Defines if the LED strings are manually
+            controlled or if the LED strings are controlled
+            by the ALS.
+            0x00 - LED strings are I2C controlled via full
+                  scale brightness control register
+            0x01 - LED strings are ALS controlled
+        minimum: 0
+        maximum: 1
+
+      led-max-microamp:
+        minimum: 5000
+        maximum: 29800
+        multipleOf: 800
+
+    required:
+      - reg
+      - led-sources
+      - ti,led-mode
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
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/leds/common.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        led-controller@38 {
+            compatible = "ti,lm3532";
+            #address-cells = <1>;
+            #size-cells = <0>;
+            reg = <0x38>;
+
+            enable-gpios = <&gpio6 12 GPIO_ACTIVE_HIGH>;
+            ramp-up-us = <1024>;
+            ramp-down-us = <65536>;
+
+            ti,als-vmin = <0>;
+            ti,als-vmax = <2>;
+            ti,als1-imp-sel = <4110>;
+            ti,als2-imp-sel = <2180>;
+            ti,als-avrg-time-us = <17920>;
+            ti,als-input-mode = <0x00>;
+
+            led@0 {
+                reg = <0>;
+                led-sources = <2>;
+                ti,led-mode = <1>;
+                led-max-microamp = <21600>;
+                label = ":backlight";
+                linux,default-trigger = "backlight";
+            };
+
+            led@1 {
+                reg = <1>;
+                led-sources = <1>;
+                ti,led-mode = <0>;
+                label = ":kbd_backlight";
+            };
+        };
+    };
+...

-- 
2.51.0


