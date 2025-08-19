Return-Path: <linux-leds+bounces-5238-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id ED218B2BF9B
	for <lists+linux-leds@lfdr.de>; Tue, 19 Aug 2025 12:59:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CD4725A219D
	for <lists+linux-leds@lfdr.de>; Tue, 19 Aug 2025 10:59:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 919D9322DB1;
	Tue, 19 Aug 2025 10:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Jr80+iaQ"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DF7A1DE2BD;
	Tue, 19 Aug 2025 10:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755601144; cv=none; b=LZTWDED8OdfXzpCz6m2xHUGkWwGr0OWLYwPjzEThrX6nf942bCWF7c8VXyH4DjnYqlYhrkLTKgkTQTxx3axfsDm/nnpHSDgsNMD/IiuGlXoqNXzPNTurX1gjBouFFPoJ9WQoayjTmRYyXe1WrY14T4VOE/ZHCopT1snzOLZpQYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755601144; c=relaxed/simple;
	bh=5cE7D0ZYgBo+glHPgbGFnAyCNZnvr0Ca4+0xvORE+Fs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=O3aw9grQxCqQSkuMS6HLzSaDfl9DL5j2fRQJ1vHdZ72wk82h0hi7h/8vvGr/UdMpCoN4qy3NiBy9LBgXbOJwGPfYn3R1uuvWnpWaP2CtrePf/McrrXlSbDP4wQt/uNaFI38NmbT5X2LL7IVd7vXvC3uSpnyxcHH14popjDKA3Zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Jr80+iaQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0B534C116B1;
	Tue, 19 Aug 2025 10:59:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755601144;
	bh=5cE7D0ZYgBo+glHPgbGFnAyCNZnvr0Ca4+0xvORE+Fs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Jr80+iaQf8XQqVhcl6069NaignqKkFrQlrYkOctJCp/OMO2jxzILGELUCMpmJwnHF
	 03d9xxywQ+XTB26J+HALq02HljmzWh+x5hLuiZZyTAJ+NaGWZl5kaG9tubOfTszavU
	 0Q4SGzNR5RsDWym18dCaYfWQJLdy5J/ktS6akbFCNovjUGFJPpn0tejd5E9CyDACBh
	 /GWqjO/75+aVMEYWfp+ZcscA6yn8G6cZupZLWC2CcgN4AdxwtJSA9bDev5co2RiBjj
	 yT891EjOmmBOi+PdVsEO+7LYxmobmNE/jePAmSQzjwjlvfS/Lsfh1Ec53G1uW9AKMg
	 t9DIgShNmXRaQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE254CA0EED;
	Tue, 19 Aug 2025 10:59:03 +0000 (UTC)
From: Maud Spierings via B4 Relay <devnull+maudspierings.gocontroll.com@kernel.org>
Date: Tue, 19 Aug 2025 12:58:59 +0200
Subject: [PATCH v2 1/4] dt-bindings: backlight: Add max25014 bindings
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250819-max25014-v2-1-5fd7aeb141ea@gocontroll.com>
References: <20250819-max25014-v2-0-5fd7aeb141ea@gocontroll.com>
In-Reply-To: <20250819-max25014-v2-0-5fd7aeb141ea@gocontroll.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755601142; l=3235;
 i=maudspierings@gocontroll.com; s=20250214; h=from:subject:message-id;
 bh=gBLVxlhNulxZHWAMI/J7tGBDaD7A4GreotsmuLvErdM=;
 b=dRKO5J+x8LqnANMHECIzhMXV3SnGmTHTL5+VK1RZMQ1aWrBUfFjwgVf8WKkcIgEAMbZ6up8tW
 VUml2CDRY42CHloYsu4Wb6efkSMsRg5W1FeaW1dKrPQn4w5GDUsb7Eg
X-Developer-Key: i=maudspierings@gocontroll.com; a=ed25519;
 pk=7chUb8XpaTQDvWhzTdHC0YPMkTDloELEC7q94tOUyPg=
X-Endpoint-Received: by B4 Relay for maudspierings@gocontroll.com/20250214
 with auth_id=341
X-Original-From: Maud Spierings <maudspierings@gocontroll.com>
Reply-To: maudspierings@gocontroll.com

From: Maud Spierings <maudspierings@gocontroll.com>

The Maxim MAX25014 is a 4-channel automotive grade backlight driver IC
with intgrated boost controller.

Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
---
 .../bindings/leds/backlight/maxim,max25014.yaml    | 79 ++++++++++++++++++++++
 MAINTAINERS                                        |  5 ++
 2 files changed, 84 insertions(+)

diff --git a/Documentation/devicetree/bindings/leds/backlight/maxim,max25014.yaml b/Documentation/devicetree/bindings/leds/backlight/maxim,max25014.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..30b591152fa31d5e43243cac44c72028b05b5f8a
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/backlight/maxim,max25014.yaml
@@ -0,0 +1,79 @@
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
+    default: 11
+    description:
+      Value of the ISET register field (0-15).
+
+  maxim,strings:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    description:
+      A 4-bit bitfield that describes which led strings to turn on.
+    minItems: 4
+    maxItems: 4
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
+        backlight: backlight@6f {
+            reg = <0x6f>;
+            compatible = "maxim,max25014";
+            default-brightness = <50>;
+            enable-gpios = <&gpio1 4 GPIO_ACTIVE_HIGH>;
+            interrupt-parent = <&gpio1>;
+            interrupts = <2 IRQ_TYPE_EDGE_FALLING>;
+            pinctrl-names = "default";
+            pinctrl-0 = <&pinctrl_backlight>;
+            power-supply = <&reg_backlight>;
+            pwms = <&pwm1>;
+            maxim,iset = <7>;
+            maxim,strings = <1 1 1 1>;
+        };
+    };
+
diff --git a/MAINTAINERS b/MAINTAINERS
index e81d5f9fbd16cc384356804390d65652bbb9e3f6..11c73d2e37fac22aea852152746236c1472f41b8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14972,6 +14972,11 @@ F:	Documentation/userspace-api/media/drivers/max2175.rst
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
2.50.1



