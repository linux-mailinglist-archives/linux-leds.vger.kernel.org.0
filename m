Return-Path: <linux-leds+bounces-4737-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D7D1AC9AD3
	for <lists+linux-leds@lfdr.de>; Sat, 31 May 2025 14:11:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6B41817824C
	for <lists+linux-leds@lfdr.de>; Sat, 31 May 2025 12:11:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D2F623A9BD;
	Sat, 31 May 2025 12:11:55 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67EF67260A;
	Sat, 31 May 2025 12:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748693515; cv=none; b=TcHFdaowweSePCyFRaBK4DpNguM8Va22V/5B3OC9x8a0odMFbcJ6cDuCw6i1v4PquIy+AJcOozVzoVDuCX6EhfeorlLVaW5HsZVe4si2FnA0qK+wOQTJ9PQaDTiq9C5pFBJw374V11JtY/K8zxc3Sd5tjurMMjaxQbPiE2DpNuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748693515; c=relaxed/simple;
	bh=FVicUJnc7YWRCxGtgjPXOJI/+lxgKLgQ1bMJFFVcxSw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZHvwMTfpLG3eDpSLLkGeCg8XyxmX257DOi/Bg7Pl9+OMUFG4KFojn5w43qHH/5Bs2B/rGSN8L2bbgLVrsWXxB5Ig/reZvsRCXvQmAMFy+aFgs/28Ia9hhjxIs1pbHziVICE1tZc1wMZoEgO/4L9k0dpgSLffumbn2McL4A55VjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=timmermann.space; spf=pass smtp.mailfrom=timmermann.space; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=timmermann.space
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=timmermann.space
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4b8f9B3tj7z9sbm;
	Sat, 31 May 2025 14:11:42 +0200 (CEST)
From: Lukas Timmermann <linux@timmermann.space>
To: lee@kernel.org,
	pavel@kernel.org
Cc: linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Timmermann <lukas@timmermann.space>
Subject: [PATCH v2 2/2] dt-bindings: leds: Add new as3668 support
Date: Sat, 31 May 2025 14:07:20 +0200
Message-ID: <20250531120715.302870-8-linux@timmermann.space>
In-Reply-To: <20250531120715.302870-4-linux@timmermann.space>
References: <20250531120715.302870-4-linux@timmermann.space>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4b8f9B3tj7z9sbm

From: Lukas Timmermann <lukas@timmermann.space>

Document Osram as3668 LED driver devicetree bindings.

---
 .../devicetree/bindings/leds/leds-as3668.yaml | 76 +++++++++++++++++++
 1 file changed, 76 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-as3668.yaml

diff --git a/Documentation/devicetree/bindings/leds/leds-as3668.yaml b/Documentation/devicetree/bindings/leds/leds-as3668.yaml
new file mode 100644
index 000000000000..aae6248f5712
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/leds-as3668.yaml
@@ -0,0 +1,76 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/leds-as3668.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Osram 4-channel i2c LED driver.
+
+maintainers:
+  - Lukas Timmermann <linux@timmermann.space>
+
+description: |
+  This IC can drive up to four separate LEDs.
+  Having four channels suggests it could be used with a single RGBW LED.
+
+properties:
+  compatible:
+    const: ams,as3668 
+
+  reg:
+    maxItems: 1
+    description:
+      I2C slave address
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
-- 
2.49.0


