Return-Path: <linux-leds+bounces-5679-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 35C83BC78FE
	for <lists+linux-leds@lfdr.de>; Thu, 09 Oct 2025 08:48:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DD8CA3E614E
	for <lists+linux-leds@lfdr.de>; Thu,  9 Oct 2025 06:48:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA03D2D0601;
	Thu,  9 Oct 2025 06:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u8Ip4fj3"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72ED51EA7D2;
	Thu,  9 Oct 2025 06:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759992508; cv=none; b=frtANBE2P7/mdcEPz2LJ6uuPsm0wU7BpBu6wGouJ+ywGgbUwBESTcUWJrwEZy09IsqFF7ZcYUrBjgELloG9YjD1nqXDmwmmwV0y05GVfY1TmBFY6bp8p11ISAb9xUTDIHT5C7m3Nz87K3gxiWhu0IoK0gM+TR87Xwwj749/SvtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759992508; c=relaxed/simple;
	bh=DDjKpr6gtv7Sbw5NKGi8tB6eysY8h2EsJ4D5k4IEpiQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gegED06JEKt+cyuJM5cC9Tqs2GmqM88d9xLAK/1rfw42y/NIsUdgiIsPVV+AMI2pSium3o1A6F/Yppg73OgQq8aIUpZJ76MjAdVR8obb4H3ThTFEEt6AQvf98V6qGwPlHYwbpUGxBnnrL9LE+urZAZEKJPnCQxX1yyHE+c7XlqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u8Ip4fj3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id EEE3AC4CEF9;
	Thu,  9 Oct 2025 06:48:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759992508;
	bh=DDjKpr6gtv7Sbw5NKGi8tB6eysY8h2EsJ4D5k4IEpiQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=u8Ip4fj3WcI8ZBqrCkDuUs4NN+BSaXF21LK1pxB+JtyNMi3Ju2h/LhBe3r+sHygaq
	 P+1+e/ZhR1yVQ1xLZeeOlmO5PJbZkCAUjJO5DmZJGJwTAhaToNrYElvOeFs3xsRVWN
	 foQp2zAyYFj+YRcjjws/gOf30wEt1qkjUHgsplU5gcvRmG3VzHF9LCNXJWpT2FKtkO
	 OifT7C4fQVNSiy/c4KRj7FcjvzR4XXK8aUFrYeWLPNUvDXEPGbEfayNdNUCwdUwkHd
	 40qPin308Se4CNTYnJbK1c3tkJu24o5SCgJsSQTt78igZ2QJdFPLMkG4w+uz/CmjUz
	 b67No4lduQVtA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC1C3CCA470;
	Thu,  9 Oct 2025 06:48:27 +0000 (UTC)
From: Maud Spierings via B4 Relay <devnull+maudspierings.gocontroll.com@kernel.org>
Date: Thu, 09 Oct 2025 08:48:25 +0200
Subject: [PATCH v4 1/4] dt-bindings: backlight: Add max25014 bindings
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251009-max25014-v4-1-6adb2a0aa35f@gocontroll.com>
References: <20251009-max25014-v4-0-6adb2a0aa35f@gocontroll.com>
In-Reply-To: <20251009-max25014-v4-0-6adb2a0aa35f@gocontroll.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759992506; l=3924;
 i=maudspierings@gocontroll.com; s=20250214; h=from:subject:message-id;
 bh=9GoY1YFZup8pyevGMqP0p2CbHPXkb49eiT7Kk0Aql2c=;
 b=UTjxhRktWaJOCpVH6gPGCMfTW3yTl1VRmKMfw3ZqGDel/DpQX0w9z2TUyP2RDcHVhlFV1p58m
 68O/GoD9kEgDWP6i3NF+m3joPvLgytuKbxJZjcaCTet5R9sS0BsNQtT
X-Developer-Key: i=maudspierings@gocontroll.com; a=ed25519;
 pk=7chUb8XpaTQDvWhzTdHC0YPMkTDloELEC7q94tOUyPg=
X-Endpoint-Received: by B4 Relay for maudspierings@gocontroll.com/20250214
 with auth_id=341
X-Original-From: Maud Spierings <maudspierings@gocontroll.com>
Reply-To: maudspierings@gocontroll.com

From: Maud Spierings <maudspierings@gocontroll.com>

The Maxim MAX25014 is a 4-channel automotive grade backlight driver IC
with integrated boost controller.

In the current implementation the control registers for channel 1,
control all channels. So only one led subnode with led-sources is
supported right now. If at some point the driver functionality is
expanded the bindings can be easily extended with it.

Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
---
 .../bindings/leds/backlight/maxim,max25014.yaml    | 109 +++++++++++++++++++++
 MAINTAINERS                                        |   5 +
 2 files changed, 114 insertions(+)

diff --git a/Documentation/devicetree/bindings/leds/backlight/maxim,max25014.yaml b/Documentation/devicetree/bindings/leds/backlight/maxim,max25014.yaml
new file mode 100644
index 0000000000000..496520e1374e5
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/backlight/maxim,max25014.yaml
@@ -0,0 +1,109 @@
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
+      Value of the ISET register field. This controls the current scale of the
+      outputs, a higher number means more current.
+
+patternProperties:
+  "^led@[01]$":
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
+            enable-gpios = <&gpio1 4 GPIO_ACTIVE_HIGH>;
+            interrupt-parent = <&gpio1>;
+            interrupts = <2 IRQ_TYPE_EDGE_FALLING>;
+            power-supply = <&reg_backlight>;
+            pwms = <&pwm1>;
+            maxim,iset = <7>;
+
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            led@0 {
+                reg = <0>;
+                led-sources = <0 1 2 3>;
+                default-brightness = <50>;
+            };
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 47fbc5e06808f..be5e2515900ce 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15171,6 +15171,11 @@ F:	Documentation/userspace-api/media/drivers/max2175.rst
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



