Return-Path: <linux-leds+bounces-5129-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CDDECB11D44
	for <lists+linux-leds@lfdr.de>; Fri, 25 Jul 2025 13:10:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DDEE91CC7E4D
	for <lists+linux-leds@lfdr.de>; Fri, 25 Jul 2025 11:10:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FC832E7645;
	Fri, 25 Jul 2025 11:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BJE+taCm"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C8F42E6108;
	Fri, 25 Jul 2025 11:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753441767; cv=none; b=kD7zmBcMybWE+lyY2CqORafPncr0xzfm0KumwYgAI9Dryx95E/Ns/Re6bbtrN2/skSkACFi56Ccw9Qn6EcwkmYOwZ37Mrfyo0u3ZqaQodHUJ3gPF+u5GgnLyxlpo0WunE8K8QIcI1htBnHS4lsVtoJ9B3snvKN31EJhdvQ8WlAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753441767; c=relaxed/simple;
	bh=nSJWxPvm0d7ZIgzF4usQc615UKM7wu43CkTVriDIrQA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oWQkOFF8S02MrfTcGXvIYT3EQHrqatPUqKfZkKSS7VgZ5FP4/fDfex4lecaksy10Nbb6M82IBFNw1/QI1x3DUExAGZ2TzlsDOSiUCnPscg2nmoZK9YDMwS9w4nN3dZ+cVUFr+Xulapw/TsC1hmJGktA/3sYkFsf+Wy3acBiOmi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BJE+taCm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id EB0A0C4CEF5;
	Fri, 25 Jul 2025 11:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753441767;
	bh=nSJWxPvm0d7ZIgzF4usQc615UKM7wu43CkTVriDIrQA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=BJE+taCmBbzNHWjlNEmYwlJsBo5+jDow4WwIZa4PlyQyqhfOtiTHmHJjbK2XJqW6m
	 n/V+0KrUgotqPrPhHUNJ6cgm3fCQ1aMzqx2pbUML7N5BQWoh5vZkzbMvsl4Wo4bA8z
	 WUZW5RERAxMHRPYzc0hLYCNjvommmM40hhlwxNLDhNWbL1cGD1sV702S4Ws61XQl/X
	 QQHpfw1AtQzmcJE/XG0z1Z+m6oI6CMaEpKZQMorR+81SsPRAGKYuBUXUlwrnoxsmXD
	 zmHilQOiRpNmSR/FXs/V6+W7Bx335DNQ28x+FxxTAWxexQ/1tfUPGiI9py9gyeSM7Y
	 ePYV8s144M5yw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA6E5C83F26;
	Fri, 25 Jul 2025 11:09:26 +0000 (UTC)
From: Maud Spierings via B4 Relay <devnull+maudspierings.gocontroll.com@kernel.org>
Date: Fri, 25 Jul 2025 13:09:23 +0200
Subject: [PATCH 1/4] dt-bindings: backlight: Add max25014 bindings
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250725-max25014-v1-1-0e8cce92078e@gocontroll.com>
References: <20250725-max25014-v1-0-0e8cce92078e@gocontroll.com>
In-Reply-To: <20250725-max25014-v1-0-0e8cce92078e@gocontroll.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753441765; l=3209;
 i=maudspierings@gocontroll.com; s=20250214; h=from:subject:message-id;
 bh=rF9ThmeNbuWIand4A7K9APVhfKLn9LFOZN2rquJEp+k=;
 b=NBUSkuO8FqyRzfHY0KNnAzXgkytFnl2C4b0o0jbKBqzdVZIG0purz9BpolG1K58XiMSAvO4F1
 Eq7ZGjZvXgACerV4Gp9M2JEs21Jt66+BS+Jacdg3U5djqDQsac5PDRQ
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
 .../bindings/leds/backlight/maxim,max25014.yaml    | 78 ++++++++++++++++++++++
 MAINTAINERS                                        |  5 ++
 2 files changed, 83 insertions(+)

diff --git a/Documentation/devicetree/bindings/leds/backlight/maxim,max25014.yaml b/Documentation/devicetree/bindings/leds/backlight/maxim,max25014.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..63baf1cbcbb14ed93d7e45ba013080872060ce71
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/backlight/maxim,max25014.yaml
@@ -0,0 +1,78 @@
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
+      Value of the ISET register field (0-15). Default is 11.
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
+            bl-name = "max25014";
+            default-brightness = <50>;
+            enable-gpios = <&gpio1 4 GPIO_ACTIVE_HIGH>;
+            interrupt-parent = <&gpio1>;
+            interrupts = <2 IRQ_TYPE_EDGE_FALLING>;
+            pinctrl-names = "default";
+            pinctrl-0 = <&pinctrl_backlight>;
+            maxim,iset = <7>;
+            maxim,strings = <1 1 1 1>;
+        };
+    };
+
diff --git a/MAINTAINERS b/MAINTAINERS
index 5e18349a5556e4d793b63a6b3c600000b21b0418..9e9a45442b7bf60b00eaf3f8ebadf8f4fbaf3bef 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14907,6 +14907,11 @@ F:	Documentation/userspace-api/media/drivers/max2175.rst
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



