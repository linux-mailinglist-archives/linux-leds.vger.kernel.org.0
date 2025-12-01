Return-Path: <linux-leds+bounces-6363-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EEE0C97217
	for <lists+linux-leds@lfdr.de>; Mon, 01 Dec 2025 12:53:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A1A313A221E
	for <lists+linux-leds@lfdr.de>; Mon,  1 Dec 2025 11:53:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B7BD2F5480;
	Mon,  1 Dec 2025 11:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VV52Depv"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 381AD2F3C32;
	Mon,  1 Dec 2025 11:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764590006; cv=none; b=avQBIt8p4JLcOCQkxnHGdw91YNM9bwLqB14b4F3ZpH0dRnt92J4chZOUoAg+5TLjdbP73DUoPMp9qi4op9MLh5gXClC1UaFjSUhJ3uCQR6UEi4qL720TAIH/gRSyJD6B8ekxw+50oe0g1NJrORc64EAMeNmZBGxFmCgkBUnWgcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764590006; c=relaxed/simple;
	bh=YPUna2K5y3XBk3hfGBC21PQOC8WuODhPHKmPPB9JiNM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EA0yrutLhvRechuazI0si4VJTsdU1MRAhWR/mJZmUhfxQZPx27cfk2ckTJ9qZ7fSAQ+5KNY99UElAr8ORHjdymC52fhvNumRY3CunXD2fh4arLwy3d6do/IgJyiMTDUiKP5C7aP6wKImcXkDvfvLCVdJ+G8HycKZtm+5gafVY6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VV52Depv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id B1880C19425;
	Mon,  1 Dec 2025 11:53:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764590005;
	bh=YPUna2K5y3XBk3hfGBC21PQOC8WuODhPHKmPPB9JiNM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=VV52DepvNDKMp7YRwiUvWQRV3CIf9IK4WehrPXdHmF5GTVYg70hpR2yBKYGCFfli1
	 BUajK0JEIS2q66XcY/jlrq6ybc4GatSjqgqhhXP2MKPPPwsEvZOimeRiOwdL0GZbhM
	 EMSXoUMb8aSx2w+g4pF8p7xa9iGsXDc0a7tdujZ6Rgq4havoo771N3r/CuwCBhUzl5
	 NcxoCFdgDZ43zV1iwnk/kl8QHlg+9pUX5+rgc+gfTCIaS1jEKdqO/4vOaJV0j+PfQo
	 vNwsrnCt+maVLY3wdOKgoGyNIsxUog+6NeRch3bV4xrxyz/Z/v0v5ld+sJKns0NSGy
	 KYTBvU9vV5Z7w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0CFBD116F1;
	Mon,  1 Dec 2025 11:53:25 +0000 (UTC)
From: Maud Spierings via B4 Relay <devnull+maudspierings.gocontroll.com@kernel.org>
Date: Mon, 01 Dec 2025 12:53:20 +0100
Subject: [PATCH v6 1/4] dt-bindings: backlight: Add max25014 support
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251201-max25014-v6-1-88e3ac8112ff@gocontroll.com>
References: <20251201-max25014-v6-0-88e3ac8112ff@gocontroll.com>
In-Reply-To: <20251201-max25014-v6-0-88e3ac8112ff@gocontroll.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764590004; l=3908;
 i=maudspierings@gocontroll.com; s=20250214; h=from:subject:message-id;
 bh=a+UeO1ZqC7HCzxLcOq85S1MAbT1Qb6Nfvd9i4R92cxI=;
 b=Gk7qOoIk3fI5K29GBjQWucYhm2bRUfidsJngM1amZPPziI4uDVYh+WcHPQ4PNkR2beT2M1jm4
 qknG++yTSXqDgJ8A+Ejw5q2kKjesbZVkP/dlidNXkiNhaxQS5qmDa8R
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
2.52.0



