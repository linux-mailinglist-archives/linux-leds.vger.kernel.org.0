Return-Path: <linux-leds+bounces-6031-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C2842C3FF9D
	for <lists+linux-leds@lfdr.de>; Fri, 07 Nov 2025 13:50:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 499321899612
	for <lists+linux-leds@lfdr.de>; Fri,  7 Nov 2025 12:50:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74EA3286D7B;
	Fri,  7 Nov 2025 12:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Eg95syD9"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E753273D68;
	Fri,  7 Nov 2025 12:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762519813; cv=none; b=SINBGOvLjeqmkfDTxI3pk+QtBECcBo6HW+8vH6GZYrMcLA4CMqTCGZbTHmgoqQj2gwrZhy4hlRi3Hxv7kgQ148xhc/OSx/Tzb7W9aPtZtAh2tpsBlUGBJmYSNd/2H0rvfFX3mVo+DV2fVkkzNkdQ5Ns7pRKJliT3ncbR4OIfd1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762519813; c=relaxed/simple;
	bh=SVdBXpEF1KNfNwK2nhAtCcMZuHOGWV/gg0lw0qdmO5w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sL6ZQlL+v+N+qftfEVw78UzH2MTAdwv5sGuZ6bQPZdhL/FRqAqahBcVsgW8bis2kqPpTFDfpVvQcwIDOHP/tiEp82hgSzMKT8e6T0QtfnGJP65G2s8nUxAQL+eFewxr62/PklWNKTplbQWEd1iV8VAF6EfCdxOOu5HSnS05jB+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Eg95syD9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id BB738C4CEF5;
	Fri,  7 Nov 2025 12:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762519812;
	bh=SVdBXpEF1KNfNwK2nhAtCcMZuHOGWV/gg0lw0qdmO5w=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Eg95syD9Q/SFbFp+kLe6dcEEpHa4jLufF6QqATOeZKNMi60kd6cbqiMRp1jchlupB
	 pDkox7m6YRMsxq32ulsFNWEI+Vf/8UcBcWXff7Mwk38IqRgQkpxp3f774+u6XVMFk9
	 jzNZqVDl8S0mokx4ncixAQ1vpnwIVhtPptc599C+kVj7wfalPe9WD+00HaMdky/c8I
	 d+DiF/nGA/Oe7WBBWiixnatKfsEfJfQEM6A87jyrVg/d+JR5mBijemLnSZxLjdi9NM
	 Ko6TAjIogXatL+gU1KXJgIIsYbX8WssSewO5dOD+dbOuFLBA8k4w/8VtROr3XzUmC7
	 k3Ye8i3zw/pgA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B093ECCF9F8;
	Fri,  7 Nov 2025 12:50:12 +0000 (UTC)
From: Maud Spierings via B4 Relay <devnull+maudspierings.gocontroll.com@kernel.org>
Date: Fri, 07 Nov 2025 13:49:58 +0100
Subject: [PATCH v5 1/4] dt-bindings: backlight: Add max25014 support
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251107-max25014-v5-1-9a6aa57306bf@gocontroll.com>
References: <20251107-max25014-v5-0-9a6aa57306bf@gocontroll.com>
In-Reply-To: <20251107-max25014-v5-0-9a6aa57306bf@gocontroll.com>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>, 
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-fbdev@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Maud Spierings <maudspierings@gocontroll.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762519811; l=3908;
 i=maudspierings@gocontroll.com; s=20250214; h=from:subject:message-id;
 bh=yqlsOQ0bzyoHsj2qRJ75h0XSLGQMppxTYnCL1bHyCEQ=;
 b=DGuC6yQ694ydtHMszFGsmGH7tMYmvr96j6gDz3AJutZi3aJIs23c6A2ZujhuirBLtMI/J5AQJ
 /l8hpmQFRkWAy0n0XF5YTFgKzIgZIyxfDDG3I79rP8HK/ssm+EFNgji
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

In the current implementation the control registers for channel 1,
control all channels. So only one led subnode with led-sources is
supported right now. If at some point the driver functionality is
expanded the bindings can be easily extended with it.
---
 .../bindings/leds/backlight/maxim,max25014.yaml    | 107 +++++++++++++++++++++
 MAINTAINERS                                        |   5 +
 2 files changed, 112 insertions(+)

diff --git a/Documentation/devicetree/bindings/leds/backlight/maxim,max25014.yaml b/Documentation/devicetree/bindings/leds/backlight/maxim,max25014.yaml
new file mode 100644
index 000000000000..e83723224b07
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/backlight/maxim,max25014.yaml
@@ -0,0 +1,107 @@
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
+properties:
+  compatible:
+    enum:
+      - maxim,max25014
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
+      Value of the ISET field in the ISET register. This controls the current
+      scale of the outputs, a higher number means more current.
+
+  led@0:
+    type: object
+    description: Properties for a string of connected LEDs.
+    $ref: common.yaml#
+
+    properties:
+      reg:
+        const: 0
+
+      led-sources:
+        allOf:
+          - minItems: 1
+            maxItems: 4
+            items:
+              minimum: 0
+              maximum: 3
+            default: [0, 1, 2, 3]
+
+      default-brightness:
+        minimum: 0
+        maximum: 100
+        default: 50
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
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        backlight@6f {
+            compatible = "maxim,max25014";
+            reg = <0x6f>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+            enable-gpios = <&gpio1 4 GPIO_ACTIVE_HIGH>;
+            interrupt-parent = <&gpio1>;
+            interrupts = <2 IRQ_TYPE_EDGE_FALLING>;
+            power-supply = <&reg_backlight>;
+            pwms = <&pwm1>;
+            maxim,iset = <7>;
+
+            led@0 {
+                reg = <0>;
+                led-sources = <0 1 2 3>;
+                default-brightness = <50>;
+            };
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 58c7e3f678d8..606ce086f758 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15261,6 +15261,11 @@ F:	Documentation/userspace-api/media/drivers/max2175.rst
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
2.51.2



