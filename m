Return-Path: <linux-leds+bounces-4760-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CBC97AD15A6
	for <lists+linux-leds@lfdr.de>; Mon,  9 Jun 2025 01:19:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EA5EA1889DD3
	for <lists+linux-leds@lfdr.de>; Sun,  8 Jun 2025 23:19:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1328266F05;
	Sun,  8 Jun 2025 23:19:22 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 974E0266F0D;
	Sun,  8 Jun 2025 23:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749424762; cv=none; b=KggAJW2k805LgA4WirTg/8ieNOJ0vmJMlAzORA+jVMUe8eZpga4QNKIk0SxJyizvuraQm6SLbGkQRcX/pnNqcoH0K5eBZJJ2aURjjbEGyKVghG1shH3/gKEmF2e3Ca7uI8uVuK+cfjyHBBqQjWPtMG9LdpAGALE3gwU3fUU1ZUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749424762; c=relaxed/simple;
	bh=Rt/auWb+MRNh+gBuvFYZR8wNIkhvDQU3bxysvTBeneI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hV8SjpMc8vJN0NSgNbOUOaCKPEj2dT+Gl4QEArUPz+jqasv6xpg2QeaoI4HxQocqyF+LhYSCmHvb5QzCHjAEAzB7kUewcV2RWT5H9a4B19SiEvNe+nayUiQBGJXbgYUo2/vOFlPK4dFWdMbkwhWesGOkzoaHDntpMHTQeIZ64r4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=timmermann.space; spf=pass smtp.mailfrom=timmermann.space; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=timmermann.space
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=timmermann.space
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4bFrbm1ppqz9slm;
	Mon,  9 Jun 2025 01:19:16 +0200 (CEST)
From: Lukas Timmermann <linux@timmermann.space>
To: lee@kernel.org,
	pavel@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@timmermann.space,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v5 1/2] dt-bindings: leds: Add new as3668 support
Date: Mon,  9 Jun 2025 01:18:53 +0200
Message-ID: <20250608231854.75668-2-linux@timmermann.space>
In-Reply-To: <20250608231854.75668-1-linux@timmermann.space>
References: <20250608231854.75668-1-linux@timmermann.space>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The bindings are incomplete, as the GPIO/Audio Input pin
is still undocumented. The hardware used for testing this patch series
does not allow modification, so the mentioned pin has been omitted.

Signed-off-by: Lukas Timmermann <linux@timmermann.space>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/leds/ams,as3668.yaml  | 74 +++++++++++++++++++
 MAINTAINERS                                   |  6 ++
 2 files changed, 80 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/ams,as3668.yaml

diff --git a/Documentation/devicetree/bindings/leds/ams,as3668.yaml b/Documentation/devicetree/bindings/leds/ams,as3668.yaml
new file mode 100644
index 000000000000..d1d73782da55
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/ams,as3668.yaml
@@ -0,0 +1,74 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/ams,as3668.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Osram 4-channel i2c LED driver
+
+maintainers:
+  - Lukas Timmermann <linux@timmermann.space>
+
+description:
+  This IC can drive up to four separate LEDs.
+  Having four channels suggests it could be used with a single RGBW LED.
+
+properties:
+  compatible:
+    const: ams,as3668
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
+patternProperties:
+  "^led@[0-3]$":
+    type: object
+    $ref: common.yaml#
+    unevaluatedProperties: false
+
+    properties:
+      reg:
+        maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - "#address-cells"
+  - "#size-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/leds/common.h>
+
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      led-controller@42 {
+        compatible = "ams,as3668";
+        reg = <0x42>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        led@0 {
+          reg = <0x0>;
+          function = LED_FUNCTION_STATUS;
+          color = <LED_COLOR_ID_RED>;
+        };
+
+        led@1 {
+          reg = <0x1>;
+          function = LED_FUNCTION_STATUS;
+          color = <LED_COLOR_ID_GREEN>;
+        };
+      };
+    };
+
diff --git a/MAINTAINERS b/MAINTAINERS
index c59316109e3f..091206c54c63 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3506,6 +3506,12 @@ L:	linux-leds@vger.kernel.org
 S:	Maintained
 F:	drivers/leds/flash/leds-as3645a.c
 
+AS3668 LED DRIVER
+M:	Lukas Timmermann <linux@timmermann.space>
+L:	linux-leds@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/leds/ams,as3668.yaml
+
 ASAHI KASEI AK7375 LENS VOICE COIL DRIVER
 M:	Tianshu Qiu <tian.shu.qiu@intel.com>
 L:	linux-media@vger.kernel.org
-- 
2.49.0


