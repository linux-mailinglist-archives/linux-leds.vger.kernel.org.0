Return-Path: <linux-leds+bounces-1117-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D1D28711ED
	for <lists+linux-leds@lfdr.de>; Tue,  5 Mar 2024 01:45:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E15A21F23DC5
	for <lists+linux-leds@lfdr.de>; Tue,  5 Mar 2024 00:45:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 335085664;
	Tue,  5 Mar 2024 00:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="JFng331P"
X-Original-To: linux-leds@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71E403210;
	Tue,  5 Mar 2024 00:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709599503; cv=none; b=qZuI97yI0ihFSaZPDkRjq9XCo099M4gACOTvKStUC67uCXrbiujYdTiyKkNHGeVeicVt8ru+TNFW7nUDPMSF96QurH26VznZAlLzkUUu5ZNPBYUqtFs30hSrJgxgShvZ4/x2/jBSMMmR6djqx6JyBdKv0bevGXL1lG00iSLrymQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709599503; c=relaxed/simple;
	bh=lZ5vao9xYIdqGmSJRUUOL9tDIh8ugUuo7YBf+G+llQg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HDeW7/ez8WHfVGY+YKf3fUqEdR/lya9TSC0uI1d2/suru9SkBDWeCSydqSyqhVBCYIhcjqEDgCejlsZ6UInO6JrCy4pCHYqZn9AxljUPWpVWcfB3rk7XfEWAp/i4mOzKUvGIPZro0KaOksTuFR7hxF0IukNH6hm6lX2OGvJy8nU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=JFng331P; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (89-27-53-110.bb.dnainternet.fi [89.27.53.110])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5DB3E1225;
	Tue,  5 Mar 2024 01:44:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1709599483;
	bh=lZ5vao9xYIdqGmSJRUUOL9tDIh8ugUuo7YBf+G+llQg=;
	h=From:To:Cc:Subject:Date:From;
	b=JFng331PkXHW+kDyDOtxLrxh7ARnLybQeAy/TNP7I04+596ut6P9QmKHhtvsjCR8Y
	 yPXRIn2qszDWTUwS2dqY3z+UMjNzcGJqG7zl5q18ylbIF6oqCr7sADEcjEibnQdLqu
	 jzLDSYIpLld9pS/KXMAMTS4j74D/4IuaU/36PBUw=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: devicetree@vger.kernel.org,
	linux-leds@vger.kernel.org
Cc: Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Anders Darander <anders@chargestorm.se>,
	Matt Ranostay <mranostay@gmail.com>,
	Peter Meerwald <pmeerw@pmeerw.net>,
	Ricardo Ribalda <ribalda@kernel.org>
Subject: [PATCH] dt-bindings: leds: pca963x: Convert text bindings to YAML
Date: Tue,  5 Mar 2024 02:45:01 +0200
Message-ID: <20240305004501.849-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the pca963x DT bindings to YAML schema. The existing properties
are kept without modification, but the example is adapted to the latest
common bindings for LEDs.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
If someone wants to volunteer as a maintainer, by all means, please
replace me :-)
---
 .../devicetree/bindings/leds/nxp,pca963x.yaml | 140 ++++++++++++++++++
 .../devicetree/bindings/leds/pca963x.txt      |  52 -------
 2 files changed, 140 insertions(+), 52 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/leds/nxp,pca963x.yaml
 delete mode 100644 Documentation/devicetree/bindings/leds/pca963x.txt

diff --git a/Documentation/devicetree/bindings/leds/nxp,pca963x.yaml b/Documentation/devicetree/bindings/leds/nxp,pca963x.yaml
new file mode 100644
index 000000000000..938d0e48fe51
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/nxp,pca963x.yaml
@@ -0,0 +1,140 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/nxp,pca963x.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP PCA963x LED controllers
+
+maintainers:
+  - Laurent Pinchart <laurent.pinchart@ideasonboard.com>
+
+description: |
+  The NXP PCA963x are I2C-controlled LED drivers optimized for
+  Red/Green/Blue/Amber (RGBA) color mixing applications. Each LED is
+  individually controllable and has its own PWM controller.
+
+  Datasheets are available at
+
+  - https://www.nxp.com/docs/en/data-sheet/PCA9632.pdf
+  - https://www.nxp.com/docs/en/data-sheet/PCA9633.pdf
+  - https://www.nxp.com/docs/en/data-sheet/PCA9634.pdf
+  - https://www.nxp.com/docs/en/data-sheet/PCA9635.pdf
+
+properties:
+  compatible:
+    enum:
+      - nxp,pca9632
+      - nxp,pca9633
+      - nxp,pca9634
+      - nxp,pca9635
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
+  nxp,hw-blink:
+    type: boolean
+    description:
+      Use hardware blinking instead of software blinking
+
+  nxp,inverted-out:
+    type: boolean
+    description:
+      Invert the polarity of the generated PWM.
+
+  nxp,period-scale:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      In some configurations, the chip blinks faster than expected. This
+      parameter provides a scaling ratio (fixed point, decimal divided by 1000)
+      to compensate, e.g. 1300=1.3x and 750=0.75x.
+
+  nxp,totem-pole:
+    type: boolean
+    description:
+      Use totem pole (push-pull) instead of open-drain (pca9632 defaults to
+      open-drain, newer chips to totem pole).
+
+patternProperties:
+  "^led@[0-9a-f]+$":
+    type: object
+    $ref: common.yaml#
+    unevaluatedProperties: false
+
+    properties:
+      reg:
+        minimum: 0
+
+    required:
+      - reg
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - nxp,pca9632
+              - nxp,pca9633
+    then:
+      patternProperties:
+        "^led@[0-9a-f]+$":
+          properties:
+            reg:
+              maximum: 3
+    else:
+      patternProperties:
+        "^led@[0-9a-f]+$":
+          properties:
+            reg:
+              maximum: 7
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/leds/common.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        led-controller@62 {
+            compatible = "nxp,pca9632";
+            reg = <0x62>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            led@0 {
+                    reg = <0>;
+                    color = <LED_COLOR_ID_RED>;
+                    function = LED_FUNCTION_STATUS;
+            };
+
+            led@1 {
+                    reg = <1>;
+                    color = <LED_COLOR_ID_GREEN>;
+                    function = LED_FUNCTION_STATUS;
+            };
+
+            led@2 {
+                    reg = <2>;
+                    color = <LED_COLOR_ID_BLUE>;
+                    function = LED_FUNCTION_STATUS;
+            };
+
+            led@3 {
+                    reg = <3>;
+                    color = <LED_COLOR_ID_WHITE>;
+                    function = LED_FUNCTION_STATUS;
+            };
+        };
+    };
+
+...
diff --git a/Documentation/devicetree/bindings/leds/pca963x.txt b/Documentation/devicetree/bindings/leds/pca963x.txt
deleted file mode 100644
index 4eee41482041..000000000000
--- a/Documentation/devicetree/bindings/leds/pca963x.txt
+++ /dev/null
@@ -1,52 +0,0 @@
-LEDs connected to pca9632, pca9633 or pca9634
-
-Required properties:
-- compatible : should be : "nxp,pca9632", "nxp,pca9633", "nxp,pca9634" or "nxp,pca9635"
-
-Optional properties:
-- nxp,totem-pole : use totem pole (push-pull) instead of open-drain (pca9632 defaults
-  to open-drain, newer chips to totem pole)
-- nxp,hw-blink : use hardware blinking instead of software blinking
-- nxp,period-scale : In some configurations, the chip blinks faster than expected.
-		     This parameter provides a scaling ratio (fixed point, decimal divided
-		     by 1000) to compensate, e.g. 1300=1.3x and 750=0.75x.
-- nxp,inverted-out: invert the polarity of the generated PWM
-
-Each led is represented as a sub-node of the nxp,pca963x device.
-
-LED sub-node properties:
-- label : (optional) see Documentation/devicetree/bindings/leds/common.txt
-- reg : number of LED line (could be from 0 to 3 in pca9632 or pca9633,
-		0 to 7 in pca9634, or 0 to 15 in pca9635)
-- linux,default-trigger : (optional)
-   see Documentation/devicetree/bindings/leds/common.txt
-
-Examples:
-
-pca9632: pca9632 {
-	compatible = "nxp,pca9632";
-	#address-cells = <1>;
-	#size-cells = <0>;
-	reg = <0x62>;
-
-	red@0 {
-		label = "red";
-		reg = <0>;
-		linux,default-trigger = "none";
-	};
-	green@1 {
-		label = "green";
-		reg = <1>;
-		linux,default-trigger = "none";
-	};
-	blue@2 {
-		label = "blue";
-		reg = <2>;
-		linux,default-trigger = "none";
-	};
-	unused@3 {
-		label = "unused";
-		reg = <3>;
-		linux,default-trigger = "none";
-	};
-};
-- 
Regards,

Laurent Pinchart


