Return-Path: <linux-leds+bounces-5492-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E0405B52A91
	for <lists+linux-leds@lfdr.de>; Thu, 11 Sep 2025 09:53:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CEDD57A54D8
	for <lists+linux-leds@lfdr.de>; Thu, 11 Sep 2025 07:51:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C39229E0EE;
	Thu, 11 Sep 2025 07:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tvxbs4FZ"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69CC122F74A;
	Thu, 11 Sep 2025 07:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757577208; cv=none; b=hfiwzq4PZEeeMqbp50cfGtY9639D6GvJEloxR4tbRE8Zy6Y9Hz6lk3dkW/Nasf7fGqkcis8nAWwujo9z1Jxrq9BfiU/W+DLCvsVuMrmJT9CcL/0W7yPUE7rTD3//uMfh81yyLz9BaBqODa1whHK+ZtESzNxjCoQ+SaLXV/7ci1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757577208; c=relaxed/simple;
	bh=dMNYBL2O6f4/igyNj4rxu6fdmJ5X6xhc9PGg4Vp5DT0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UzyjhACSLly4F49XMe8CwPt6zFnXfDiaJbNzGMDD3Pm1pGoPAHDB/ilfng/1+OjLr0Ns0eQXAylv0V3prdWIyjF7pE6QgyE0bCWEaK6QiNTGslwAsBhwWrQcCLAv8mFi9MEXYVqnwIUB6Wg6kS6akgVRz4j84HWsufQbtyu4qFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tvxbs4FZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 370C9C4CEF7;
	Thu, 11 Sep 2025 07:53:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757577208;
	bh=dMNYBL2O6f4/igyNj4rxu6fdmJ5X6xhc9PGg4Vp5DT0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=tvxbs4FZsWYVO8hw/0sDZCBSQMU4p6YLR0SgXrYWFQe/1P+cZRu6q41Jj9OZtd5nv
	 ndgDO8ZiT3kXpaIKMj4ElajFXH+k+Nbf62hqdYo2gLVR1WrafmMR5XnrOKd7tB0Qka
	 UJD1L4VedcSiEym1tEuHgdHt6akwNkof3x7osr223lgcTer2MRbPV4L3Dg2VvMX+oz
	 nD40DDf6f5x0jFKrvLTf0UqoyDAbNITQHiJa9nlrNhVB7cP2cXRYf8tFGu6kB56lqR
	 AABrLo+T42dINbmHsLQVeGnWypPLe3HUjnXYEZS7Mt84TQYGQgt7nhJKH4o6G+h4um
	 /hvR+/J05iUFg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2563ACA1016;
	Thu, 11 Sep 2025 07:53:28 +0000 (UTC)
From: Maud Spierings via B4 Relay <devnull+maudspierings.gocontroll.com@kernel.org>
Date: Thu, 11 Sep 2025 09:53:18 +0200
Subject: [PATCH v3 1/4] dt-bindings: backlight: Add max25014 bindings
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250911-max25014-v3-1-d03f4eba375e@gocontroll.com>
References: <20250911-max25014-v3-0-d03f4eba375e@gocontroll.com>
In-Reply-To: <20250911-max25014-v3-0-d03f4eba375e@gocontroll.com>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>, 
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-fbdev@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Maud Spierings <maudspierings@gocontroll.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757577207; l=3271;
 i=maudspierings@gocontroll.com; s=20250214; h=from:subject:message-id;
 bh=5g4P1Wahkw5JoS3mX7/6i/sx/W0CFQwRY6rNR38SJig=;
 b=l0RYJ1FzMcXSI4IFv4c60sFbpautxCOLa2QrSLHkl3pIPbI7i+ExXyxrkfg7D58y9Us3zN3Oi
 s/XtYiRRe3vCbM3UmML90iyhGPMBMXsydB98oYmt1xcPAiWOUiRWjBj
X-Developer-Key: i=maudspierings@gocontroll.com; a=ed25519;
 pk=7chUb8XpaTQDvWhzTdHC0YPMkTDloELEC7q94tOUyPg=
X-Endpoint-Received: by B4 Relay for maudspierings@gocontroll.com/20250214
 with auth_id=341
X-Original-From: Maud Spierings <maudspierings@gocontroll.com>
Reply-To: maudspierings@gocontroll.com

From: Maud Spierings <maudspierings@gocontroll.com>

The Maxim MAX25014 is a 4-channel automotive grade backlight driver IC
with integrated boost controller.

Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
---
 .../bindings/leds/backlight/maxim,max25014.yaml    | 81 ++++++++++++++++++++++
 MAINTAINERS                                        |  5 ++
 2 files changed, 86 insertions(+)

diff --git a/Documentation/devicetree/bindings/leds/backlight/maxim,max25014.yaml b/Documentation/devicetree/bindings/leds/backlight/maxim,max25014.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..e113a2ad16aa74f982b9c2ea80578aed2d9424fe
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/backlight/maxim,max25014.yaml
@@ -0,0 +1,81 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/backlight/maxim,max25014.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Maxim max25014 backlight controller
+
+maintainers:
+  - Maud Spierings <maudspierings@gocontroll.com>
+
+allOf:
+  - $ref: common.yaml#
+
+properties:
+  compatible:
+    enum:
+      - maxim,max25014
+
+  reg:
+    maxItems: 1
+
+  enable-gpios:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  power-supply:
+    description: Regulator which controls the boost converter input rail.
+
+  pwms:
+    maxItems: 1
+
+  maxim,iset:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    maximum: 15
+    default: 11
+    description:
+      Value of the ISET register field. This controls the current scale of the
+      outputs, a higher number means more current.
+
+  maxim,strings:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    description:
+      A 4-bit bitfield that describes which led strings to turn on.
+    minItems: 4
+    maxItems: 4
+    items:
+      maximum: 1
+
+required:
+  - compatible
+  - reg
+  - maxim,strings
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        backlight@6f {
+            compatible = "maxim,max25014";
+            reg = <0x6f>;
+            default-brightness = <50>;
+            enable-gpios = <&gpio1 4 GPIO_ACTIVE_HIGH>;
+            interrupt-parent = <&gpio1>;
+            interrupts = <2 IRQ_TYPE_EDGE_FALLING>;
+            power-supply = <&reg_backlight>;
+            pwms = <&pwm1>;
+            maxim,iset = <7>;
+            maxim,strings = <1 1 1 1>;
+        };
+    };
+
diff --git a/MAINTAINERS b/MAINTAINERS
index 7b7396ed28a700a2aab318553ce8ba1788312bff..5a592eefbe7562734aada05ab9e3aea8cee010e7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15069,6 +15069,11 @@ F:	Documentation/userspace-api/media/drivers/max2175.rst
 F:	drivers/media/i2c/max2175*
 F:	include/uapi/linux/max2175.h
 
+MAX25014 BACKLIGHT DRIVER
+M:	Maud Spierings <maudspierings@gocontroll.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/leds/backlight/maxim,max25014.yaml
+
 MAX31335 RTC DRIVER
 M:	Antoniu Miclaus <antoniu.miclaus@analog.com>
 L:	linux-rtc@vger.kernel.org

-- 
2.51.0



