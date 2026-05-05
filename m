Return-Path: <linux-leds+bounces-8000-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eLiCOJUE+ml1HAMAu9opvQ
	(envelope-from <linux-leds+bounces-8000-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Tue, 05 May 2026 16:54:13 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E4124CFC6A
	for <lists+linux-leds@lfdr.de>; Tue, 05 May 2026 16:54:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 725743012227
	for <lists+linux-leds@lfdr.de>; Tue,  5 May 2026 14:54:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3ADA3282F13;
	Tue,  5 May 2026 14:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W4ky92cg"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C174238F65D
	for <linux-leds@vger.kernel.org>; Tue,  5 May 2026 14:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777992851; cv=none; b=ipxK4Y4H9EXOGVcR8fJESCwq/coL/AunK9nPTjWQ8QsgeE8nilVX/uyNFveg6OexFaUvvNMZvfpAg9VI8lEw4hhJWGwh0aEGPMO+6g/O129gcfFU6XnrOv0XGYEsn9GVkoZ3TN1d74osBlsyPp71CWxQGwJnXnUtQntsu+48z2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777992851; c=relaxed/simple;
	bh=naaaBMARr1xhh3oHzvjOIJ8WvTYfmmL+aUoB+HUe6SY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lerfvJ7PniyvSvUkQgQCR/UOdpLeehYsXDEGqIU7S0nemJG4q1ZAMk1x3V95VXg4zh+YFA7yun2gIJgRUQUdY1GlHkviMqi16l7Fq3GoFHBiM3THNMImKMlQic8doTstmbXZsZGnK0WWsH9p3ZouhP7pywud9oeZuPyo7fBi274=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W4ky92cg; arc=none smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-2bdd40d3c61so6784251eec.1
        for <linux-leds@vger.kernel.org>; Tue, 05 May 2026 07:54:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777992848; x=1778597648; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yS2i4W3Iab7ck7sMJR72EpBwPoerYuIemmfxcFlxotw=;
        b=W4ky92cgF5wf7BTGp9WHPj7qwM8GUk66dqpBk4ymuFc1joKP862Fi1AKAVM0sNLPn0
         4iKlcgjKkIl6ZyxyYLsDFJTn/bweN8SLetz64ux3ne4WxDaAIRTxJBfTkiGRmob1iK7j
         7liAkRnNvq54a2G3dxOGXrRl/Urro5lexLZ7d7F6g1PUMXF+HW9eTIQt6qBHXcVnVeZS
         +X3swxPP049u7sK6OTp8yLb3YvEbkRH6uhV6hMqPwGG2XMlAlsen+wLB+gQfOkkpCDbE
         iFw7JmDuvW4xKmj75mU1cuu4S2kC0rkU9pM8OfSvHb59JsWcQpDvb/YY+UTou9Y7lv+S
         o8zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777992848; x=1778597648;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yS2i4W3Iab7ck7sMJR72EpBwPoerYuIemmfxcFlxotw=;
        b=K+4xAbiowKlhxmn+E8rRUrg8pdCfs5AukOCRC3Aijsi8NvELM6tIs1crT1cG30Gd5W
         yeZ5A0Q2xU5CDuVQOsUJPxLpkM3XBt1AnVlwc8iq/+ZCPVE/dNMVtnfKn6bmqUpgBk94
         41Wio2esHqfPwNpVOr5v9genX4TLUv+eoFCt7Z3lfXeQXWO9B/dpqEQhzmtMMOWHNF4H
         1/sZe9zK3gHkVLm/cLko8M2z/t8Oh8dkTm2H/rA0Nzgp+0MkYAl4Cw0/OaEY8nelBbLF
         RnBzosxBlGMSNj/k80HAaK6y+Ka7+X350NYACQE+5/iB9unwZE7HKTHb/o8DKyaS0vY/
         uOgw==
X-Forwarded-Encrypted: i=1; AFNElJ8N1rHJfGzZo5ZqThFSSZ+m/evWrOoq0HKsEfJQkext34k0mAEH6DhOoCWW3WC2DAruldf6tS3sU+Te@vger.kernel.org
X-Gm-Message-State: AOJu0YwRu3kET6Ss5WWhdKzFVURBablkbs6SZNXK7ufy0KLL+P4SY8Fw
	fidIoh1a8BcrZZGL1HU/vrnvf/7mArEMXqursZySA6jUKVyzaIiD8zjz
X-Gm-Gg: AeBDieve1AqEAF5GeEnkmDz9opj1vwTHyBlEUn4KxXyX5+QzYMe4e7XV9hUB3DaJ8Pe
	o9jO2529G1R+IVjkrlRC23yGH/IBiCFyxpRqfWeqplJjWAwbpcyr8KlG2h+ijf9m2SVZDHd1z0z
	xWvZFauiSm8719mZiPRkl3R/nXDmRaHy6XwGAL/gvdfQwU+DTF6ei6g3gxBOXwrryfufSfrHZrg
	WYhnVrJqtVnt6c+eSkQ4atLJ+JU0fCA/JNa2tAl+vqbmwYmD5RHOtBOshOIh82FCqbeOLRxsjbb
	XDm8WN+vfGPSmJJO49Uy7lXg6ilJZ+XkYyigvLo/4FiThiHdF45iNbl9rF1tOw70ivDOFD3ofJS
	JxJyNGjlcqR8E33PIK1+BIJUhSDDIS81hbDrCe+S+oPxgCBBCy5QRHQVwhFq0VQQkwRrJ0hQxcu
	0Y7nUIiliGeW/qUOzV6SojvTwH6QfDlPY=
X-Received: by 2002:a05:7300:b54b:b0:2ed:6f94:9d96 with SMTP id 5a478bee46e88-2f4097d361fmr1523773eec.19.1777992847643;
        Tue, 05 May 2026 07:54:07 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a59:55d1::1002])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f3bf67cf8dsm5793545eec.6.2026.05.05.07.54.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 07:54:07 -0700 (PDT)
From: Jun Yan <jerrysteve1101@gmail.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-leds@vger.kernel.org
Cc: lee@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	luccafachinetti@gmail.com,
	pzalewski@thegoodpenguin.co.uk,
	daniel@zonque.org,
	Jun Yan <jerrysteve1101@gmail.com>
Subject: [PATCH v4 1/5] dt-bindings: leds: is31fl32xx: convert the binding to yaml
Date: Tue,  5 May 2026 22:53:50 +0800
Message-ID: <20260505145354.1267095-2-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260505145354.1267095-1-jerrysteve1101@gmail.com>
References: <20260505145354.1267095-1-jerrysteve1101@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 7E4124CFC6A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,thegoodpenguin.co.uk,zonque.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8000-lists,linux-leds=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jerrysteve1101@gmail.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-0.993];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]

Convert leds-is31fl32xx to DT schema format.

Co-developed-by: Lucca Fachinetti <luccafachinetti@gmail.com>
Signed-off-by: Lucca Fachinetti <luccafachinetti@gmail.com>
Co-developed-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
---
 .../bindings/leds/issl,is31fl32xx.yaml        | 163 ++++++++++++++++++
 .../bindings/leds/leds-is31fl32xx.txt         |  53 ------
 2 files changed, 163 insertions(+), 53 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/leds/issl,is31fl32xx.yaml
 delete mode 100644 Documentation/devicetree/bindings/leds/leds-is31fl32xx.txt

diff --git a/Documentation/devicetree/bindings/leds/issl,is31fl32xx.yaml b/Documentation/devicetree/bindings/leds/issl,is31fl32xx.yaml
new file mode 100644
index 000000000000..cb4741dee12e
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/issl,is31fl32xx.yaml
@@ -0,0 +1,163 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/issl,is31fl32xx.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: IS31FL32xx and Si-En SN32xx LED controller
+
+maintainers:
+  - Lucca Fachinetti <luccafachinetti@gmail.com>
+  - Pavel Machek <pavel@ucw.cz>
+  - Jun Yan <jerrysteve1101@gmail.com>
+
+description: |
+  The IS31FL32xx/SN32xx family of LED drivers are I2C devices with multiple
+  constant-current channels, each with independent 256-level PWM control.
+  Each LED is represented as a sub-node of the device.
+
+  For more product information please see the links below:
+    https://www.lumissil.com/assets/pdf/core/IS31FL3216_DS.pdf
+    https://www.lumissil.com/assets/pdf/core/IS31FL3218_DS.pdf
+    https://www.lumissil.com/assets/pdf/core/IS31FL3235_DS.pdf
+    https://www.lumissil.com/assets/pdf/core/IS31FL3236_DS.pdf
+    https://www.lumissil.com/assets/pdf/core/IS31FL3293_DS.pdf
+
+properties:
+  compatible:
+    enum:
+      - issi,is31fl3216
+      - issi,is31fl3218
+      - issi,is31fl3235
+      - issi,is31fl3236
+      - issi,is31fl3293
+      - si-en,sn3216
+      - si-en,sn3218
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
+  "^led@([1-9])+$":
+    type: object
+    $ref: common.yaml#
+    unevaluatedProperties: false
+
+    properties:
+      reg:
+        description:
+          LED channel number (1..N)
+        minimum: 1
+        maximum: 36
+
+    required:
+      - reg
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - issi,is31fl3293
+    then:
+      patternProperties:
+        "^led@([1-9])+$":
+          properties:
+            reg:
+              maximum: 3
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - issi,is31fl3216
+              - si-en,sn3216
+    then:
+      patternProperties:
+        "^led@([1-9])+$":
+          properties:
+            reg:
+              maximum: 16
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - issi,is31fl3218
+              - si-en,sn3218
+    then:
+      patternProperties:
+        "^led@([1-9])+$":
+          properties:
+            reg:
+              maximum: 18
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - issi,is31fl3235
+    then:
+      patternProperties:
+        "^led@([1-9])+$":
+          properties:
+            reg:
+              maximum: 28
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - issi,is31fl3236
+    then:
+      patternProperties:
+        "^led@([1-9])+$":
+          properties:
+            reg:
+              maximum: 36
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
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        led-controller@3c {
+            compatible = "issi,is31fl3236";
+            reg = <0x3c>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            led@1 {
+                reg = <1>;
+                color = <LED_COLOR_ID_RED>;
+                function = LED_FUNCTION_STATUS;
+            };
+
+            led@5 {
+                reg = <5>;
+                color = <LED_COLOR_ID_GREEN>;
+                function = LED_FUNCTION_POWER;
+                linux,default-trigger = "default-on";
+            };
+        };
+    };
+...
+
diff --git a/Documentation/devicetree/bindings/leds/leds-is31fl32xx.txt b/Documentation/devicetree/bindings/leds/leds-is31fl32xx.txt
deleted file mode 100644
index 7082ed186dd9..000000000000
--- a/Documentation/devicetree/bindings/leds/leds-is31fl32xx.txt
+++ /dev/null
@@ -1,53 +0,0 @@
-Binding for ISSI IS31FL32xx and Si-En SN32xx LED Drivers
-
-The IS31FL32xx/SN32xx family of LED drivers are I2C devices with multiple
-constant-current channels, each with independent 256-level PWM control.
-Each LED is represented as a sub-node of the device.
-
-Required properties:
-- compatible: one of
-	issi,is31fl3236
-	issi,is31fl3235
-	issi,is31fl3218
-	issi,is31fl3216
-	issi,is31fl3293
-	si-en,sn3218
-	si-en,sn3216
-- reg: I2C slave address
-- address-cells : must be 1
-- size-cells : must be 0
-
-LED sub-node properties:
-- reg : LED channel number (1..N)
-- label :  (optional)
-  see Documentation/devicetree/bindings/leds/common.txt
-- linux,default-trigger :  (optional)
-  see Documentation/devicetree/bindings/leds/common.txt
-
-
-Example:
-
-is31fl3236: led-controller@3c {
-	compatible = "issi,is31fl3236";
-	reg = <0x3c>;
-	#address-cells = <1>;
-	#size-cells = <0>;
-
-	led@1 {
-		reg = <1>;
-		label = "EB:blue:usr0";
-	};
-	led@2 {
-		reg = <2>;
-		label = "EB:blue:usr1";
-	};
-	...
-	led@36 {
-		reg = <36>;
-		label = "EB:blue:usr35";
-	};
-};
-
-For more product information please see the links below:
-http://www.issi.com/US/product-analog-fxled-driver.shtml
-http://www.si-en.com/product.asp?parentid=890
-- 
2.53.0


