Return-Path: <linux-leds+bounces-4469-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D912FA884B2
	for <lists+linux-leds@lfdr.de>; Mon, 14 Apr 2025 16:25:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D0D06190127D
	for <lists+linux-leds@lfdr.de>; Mon, 14 Apr 2025 14:17:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 215EA2949F6;
	Mon, 14 Apr 2025 13:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=helmholz.de header.i=@helmholz.de header.b="Rre46JcW"
X-Original-To: linux-leds@vger.kernel.org
Received: from www253.your-server.de (www253.your-server.de [188.40.28.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F3BD292905;
	Mon, 14 Apr 2025 13:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.28.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744638923; cv=none; b=rkXxZXSNBr/seNOPjdpJd4XjV2QZvWbyzmGOdJapEZiTHy/K3KiwJIifAL43bqDR10hCt42uzF5a6ShwDWZLw9SE1aLCDCyskoy45I+9ceolvnfwVfBAOfKYMYHm6N1xq+ziHFfIPvgIpv15YuJn+O4Z5yW1A3m5GT4J2XJ/lJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744638923; c=relaxed/simple;
	bh=OhYbKWskgwU5GL+q9ayJnGNWoDA6TCf7bKrlPJjvSVs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 In-Reply-To:References; b=VtlNxFU/HPgJALvklZbnuRfdQuTr0RBjNKEHMHdltMgG1AiCOUdLnt3MY1E8qDIt+8JOvucqWxpfQdZBQj7TeVesldMTLm6NiZMXDgTOYR/eeBdtB1BvVRHsIeoIt1ITmLICY2uHMFgngs7fwW8mTYBNdEavpfInt1crI2st+iY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=helmholz.de; spf=fail smtp.mailfrom=helmholz.de; dkim=pass (2048-bit key) header.d=helmholz.de header.i=@helmholz.de header.b=Rre46JcW; arc=none smtp.client-ip=188.40.28.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=helmholz.de
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=helmholz.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=helmholz.de
	; s=default2501; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=fLSCaLitPoH2xFEGe6i/k9eqnrxA4VzeMKwLwrkSMyA=; b=Rre46JcWH2gNfOTF9FK5hg/0u1
	In14U8EFJ6FOwLyV+VqQQsrlwp4RG78jxZLBRfi6TJN/yvssFVaE3YJGeHAAXHN4k739Xd3EI23of
	PhHIIvgJ6VgQi+qsNZbbkz2kdUhlmaWsLDXU5LasutHeX2kR2tOt2P/8CQCqHdR71im3isdk8UUE1
	oLs5pAVO7uQZFxtD6RtDlkK/v7dVnypLndypmg1BUwaEEyFSklc63kuIlXyjElEQUh3g09EuZldgI
	pIFQOg9kHB+wzfRamU9ZSSQXezu/tn10rLKjy5rBnSAWC3VmjtkRI7sKETr/rwF0XJyq0VfU0YNrq
	OWwBjxzg==;
Received: from sslproxy08.your-server.de ([78.47.166.52])
	by www253.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <ante.knezic@helmholz.de>)
	id 1u4JsU-0008nb-0w;
	Mon, 14 Apr 2025 15:29:34 +0200
Received: from [217.6.86.34] (helo=linuxdev.helmholz.local)
	by sslproxy08.your-server.de with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA
	(Exim 4.96)
	(envelope-from <ante.knezic@helmholz.de>)
	id 1u4JsT-000Eer-2l;
	Mon, 14 Apr 2025 15:29:33 +0200
From: Ante Knezic <ante.knezic@helmholz.de>
To: linux-leds@vger.kernel.org
Cc: lee@kernel.org,
	pavel@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	corbet@lwn.net,
	knezic@helmholz.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH 2/3] dt-bindings: leds: add binding for WL-ICLED
Date: Mon, 14 Apr 2025 15:28:50 +0200
Message-Id: <35c7f697070b3939727f1115d3a279e280f72cd6.1744636666.git.knezic@helmholz.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1744636666.git.knezic@helmholz.com>
References: <cover.1744636666.git.knezic@helmholz.com>
In-Reply-To: <cover.1744636666.git.knezic@helmholz.com>
References: <cover.1744636666.git.knezic@helmholz.com>
X-Authenticated-Sender: knezic@helmholz.com
X-Virus-Scanned: Clear (ClamAV 1.0.7/27608/Mon Apr 14 10:34:28 2025)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

From: Ante Knezic <knezic@helmholz.com>

WL-ICLED is a RGB LED with integrated IC from Wurth Elektronik.
Individual color brightness can be controlled via SPI protocol.

Signed-off-by: Ante Knezic <knezic@helmholz.com>
---
 .../bindings/leds/leds-wl-icled.yaml          | 88 +++++++++++++++++++
 1 file changed, 88 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-wl-icled.yaml

diff --git a/Documentation/devicetree/bindings/leds/leds-wl-icled.yaml b/Documentation/devicetree/bindings/leds/leds-wl-icled.yaml
new file mode 100644
index 000000000000..bf79c7a1719b
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/leds-wl-icled.yaml
@@ -0,0 +1,88 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/leds-wl-icled.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: LED driver for WL-ICLEDs from Wurth Elektronik.
+
+maintainers:
+  - Ante Knezic <ante.knezic@helmholz.de>
+
+description: |
+  The WL-ICLEDs are RGB LEDs with integrated controller that can be
+  daisy-chained to arbitrary number of LEDs. Communication with LEDs is
+  via SPI interface and can be single or two wire, depending on the model.
+  For more product information please see the link below:
+  https://www.we-online.com/en/components/products/WL-ICLED
+
+properties:
+  compatible:
+    enum:
+      - we,1315x246
+      - we,1315x002
+      - we,131x000
+      - we,131161x
+      - we,131212x
+
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 0
+
+patternProperties:
+  '^led@[0-9a-f]$':
+    type: object
+    $ref: leds-class-multicolor.yaml#
+    unevaluatedProperties: false
+
+    properties:
+      reg:
+        maxItems: 1
+        description:
+          This property denotes the LED position in the daisy chain
+          series. It is a zero based LED identifier.
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
+    #include <dt-bindings/leds/common.h>
+
+    spi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        icled@1 {
+            compatible = "we,131x000";
+            #address-cells = <1>;
+            #size-cells = <0>;
+            reg = <1>;
+            cs-gpios = <&gpio 1 GPIO_ACTIVE_HIGH>;
+
+            led@0 {
+                reg = <0>;
+                color = <LED_COLOR_ID_RGB>;
+                function = "error";
+            };
+
+            led@1 {
+                reg = <1>;
+                color = <LED_COLOR_ID_RGB>;
+                function = "warning";
+            };
+
+            led@2 {
+                reg = <2>;
+                color = <LED_COLOR_ID_RGB>;
+                function = "running";
+            };
+        };
+    };
+...
-- 
2.48.1


