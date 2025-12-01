Return-Path: <linux-leds+bounces-6370-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 46065C9984B
	for <lists+linux-leds@lfdr.de>; Tue, 02 Dec 2025 00:06:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 778CE34448F
	for <lists+linux-leds@lfdr.de>; Mon,  1 Dec 2025 23:06:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBEB628F50F;
	Mon,  1 Dec 2025 23:06:27 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 904D91E5B71;
	Mon,  1 Dec 2025 23:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764630387; cv=none; b=Kzs3hI3awjP+8xksu4i98siIVQ+76QnmIAfbXVeBKOMZ/p58C5v1Rka7lC9Jt/WexA62CZGkVoeKei1fC58ATYNNV4orf5jqpwXwwBLKtRWHcT+obqPNj0lPJlcaepLySEHxbGXdmicMvaRzB2bJm1Dhe4lULXH0BQTzlMOxDQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764630387; c=relaxed/simple;
	bh=PXskonqszq9ZCvvJ/HU7aqSGh/SWRcCqKx5uPz5G6Wc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Egvo4V1tJc2slFqJSGFVppgJwB3eEun2Hukm9LtEYSXSwhOLnB75xvFXGWZ3YG+Wx517YWP4yO+irMBkfwlugP3qpO5W1D2t6EkvfCi9ORA98HpoKHYpwX5Ukudn7FK6Jl9VLdj6ND8tua6NKGj4F5NawcQeGYn16PtStoXMg1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=timmermann.space; spf=pass smtp.mailfrom=timmermann.space; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=timmermann.space
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=timmermann.space
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4dKzzd3cS7z9twV;
	Tue,  2 Dec 2025 00:06:21 +0100 (CET)
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of linux@timmermann.space designates 2001:67c:2050:b231:465::102 as permitted sender) smtp.mailfrom=linux@timmermann.space
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
Subject: [PATCH v13 1/2] dt-bindings: leds: Add new as3668 support
Date: Tue,  2 Dec 2025 00:06:00 +0100
Message-ID: <20251201230601.285641-2-linux@timmermann.space>
In-Reply-To: <20251201230601.285641-1-linux@timmermann.space>
References: <20251201230601.285641-1-linux@timmermann.space>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4dKzzd3cS7z9twV

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
2.52.0


