Return-Path: <linux-leds+bounces-5666-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 23C00BC0C9C
	for <lists+linux-leds@lfdr.de>; Tue, 07 Oct 2025 10:58:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 12709189ACF2
	for <lists+linux-leds@lfdr.de>; Tue,  7 Oct 2025 08:58:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A705F21CA13;
	Tue,  7 Oct 2025 08:58:18 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1288A2D5922
	for <linux-leds@vger.kernel.org>; Tue,  7 Oct 2025 08:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759827498; cv=none; b=Tcfj3U3VSxSErsNV+m+PPllaOisSyJhbUzupgfLm4IJve6co/WWBUaBzS0gYe3TW8apMD45/vSti4UZ+NiaPJv90tBwm9c8S+gMMR03NWSO22qahJEYVEKZf/fm8IvBebyJ48p47AdQikYmQmBHEfPM1T8Zz41iSZC6lN15Pj6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759827498; c=relaxed/simple;
	bh=WzNtWnMhwE/PGLYBOSLTF4rafdirPP4kfNgRxJ4R2vY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nr/odLuSMfV3POj3gkAZMe+wMGcpYiG5C+sEKpGDUql2sOhkATWSux10kTRGsJ4AGTROwrEu4P3qGxZmr7fvejS5qX25I4Nujtmejy6zbVh6Caq+zWtq4Rm1+HkwgbwaZ/Atzu7xZ2zXLJIT6QQErsrzh2y4pqxipGNpjKe91XQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=ratatoskr.trumtrar.info)
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.trumtrar@pengutronix.de>)
	id 1v63WN-0007XY-8R; Tue, 07 Oct 2025 10:58:11 +0200
From: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Date: Tue, 07 Oct 2025 10:58:02 +0200
Subject: [PATCH v4 1/3] dt-bindings: leds: add lp5860 LED controller
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251007-v6-14-topic-ti-lp5860-v4-1-967758069b60@pengutronix.de>
References: <20251007-v6-14-topic-ti-lp5860-v4-0-967758069b60@pengutronix.de>
In-Reply-To: <20251007-v6-14-topic-ti-lp5860-v4-0-967758069b60@pengutronix.de>
To: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Steffen Trumtrar <kernel@pengutronix.de>, Pavel Machek <pavel@kernel.org>, 
 Mark Brown <broonie@kernel.org>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 kernel@pengutronix.de, Steffen Trumtrar <s.trumtrar@pengutronix.de>
X-Mailer: b4 0.14.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: s.trumtrar@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-leds@vger.kernel.org

The lp5860 is a LED matrix driver with 18 constant current sinks and 11
scan switches for 198 LED dots:
  * Supply range from 2.7 V to 5.5 V
  * 0.1mA - 50mA per current sink
  * 1MHz I2C and 12MHz SPI control interface
  * 8-bit analog dimming
  * 8/16-bit PWM dimming
  * individual ON and OFF control for each LED dot
  * globat 3-bit Maximum Current setting for all LED dots
  * individual LED dot open/short detection

Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/leds/leds-lp5860.yaml      | 111 +++++++++++++++++++++
 1 file changed, 111 insertions(+)

diff --git a/Documentation/devicetree/bindings/leds/leds-lp5860.yaml b/Documentation/devicetree/bindings/leds/leds-lp5860.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..1ccba48541595eb85c8accc7e6514b33482c5f4d
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/leds-lp5860.yaml
@@ -0,0 +1,111 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/leds-lp5860.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: LED driver for LP5860 RGB LED from Texas Instruments.
+
+maintainers:
+  - Steffen Trumtrar <kernel@pengutronix.de>
+
+description: |
+  The LP5860 is multi-channel, I2C and SPI RGB LED Driver that can group RGB LEDs
+  into a LED group or control them individually.
+
+  For more product information please see the link below:
+  https://www.ti.com/lit/ds/symlink/lp5860.pdf
+
+allOf:
+  - $ref: /schemas/spi/spi-peripheral-props.yaml#
+
+properties:
+  compatible:
+    enum:
+      - ti,lp5860
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
+patternProperties:
+  '^multi-led@[0-9a-f]+$':
+    type: object
+    $ref: leds-class-multicolor.yaml#
+    unevaluatedProperties: false
+
+    properties:
+      reg:
+        minimum: 0
+        maximum: 198
+        description:
+          This property denotes the LED module number that is used
+          for the child node.
+
+      '#address-cells':
+        const: 1
+
+      '#size-cells':
+        const: 0
+
+    patternProperties:
+      "^led@[0-9a-f]+$":
+        type: object
+        $ref: common.yaml#
+        unevaluatedProperties: false
+
+        properties:
+          reg:
+            maxItems: 1
+
+        required:
+          - reg
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/leds/common.h>
+
+    spi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        led-controller@0 {
+            compatible = "ti,lp5860";
+            reg = <0x0>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            multi-led@0 {
+                #address-cells = <1>;
+                #size-cells = <0>;
+                reg = <0x0>;
+                color = <LED_COLOR_ID_RGB>;
+
+                led@0 {
+                     reg = <0x0>;
+                     color = <LED_COLOR_ID_RED>;
+                };
+
+                led@1 {
+                     reg = <0x1>;
+                     color = <LED_COLOR_ID_GREEN>;
+                };
+
+                led@2 {
+                     reg = <0x2>;
+                     color = <LED_COLOR_ID_BLUE>;
+                };
+            };
+        };
+    };

-- 
2.49.0


