Return-Path: <linux-leds+bounces-8048-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WBj3Cx/h/Wn0jwAAu9opvQ
	(envelope-from <linux-leds+bounces-8048-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 08 May 2026 15:11:59 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id C53964F6D39
	for <lists+linux-leds@lfdr.de>; Fri, 08 May 2026 15:11:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 46DB8301642F
	for <lists+linux-leds@lfdr.de>; Fri,  8 May 2026 13:11:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEAAF3E1D15;
	Fri,  8 May 2026 13:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F2c1B55i"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AAAA3E1D11
	for <linux-leds@vger.kernel.org>; Fri,  8 May 2026 13:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778245917; cv=none; b=TvYQjMy/hi7Kd6h8Y+kXWjGXbUTvXZXJ2xwg5UXKmV/PTHMMddyQMFcUiI7uqhKr3a0ab+BctRbSYqN88L7x2i2hiRjfA8BhfXLw2bJMTqFjVRiOropZO3XKFB/tHBP4Sl7Rmh3ZOX5YevnBoVj7M8U5p/tfSW9jEcrccY0jwts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778245917; c=relaxed/simple;
	bh=OgCcMb4gplFU8la6RcwEtc9k9G+jCDy7i1x/OuMCftU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tBMCH3Wbnqxvc0BqLQP3TH+SApLnF5PC4pFIlJUdsjC+VZUTKYmEuVCoAXBuWh/zw4LJppkfLUhMvFBF9U5AEIIlnRZFjMQVM2SHZTk8+7l6BINDGvuKBWw0UpwCYEE3GG1ddQ5oT9Qwg5PLc7mJARZURheAnW9wfHw3wD00IyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F2c1B55i; arc=none smtp.client-ip=74.125.82.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-132830d8281so892795c88.1
        for <linux-leds@vger.kernel.org>; Fri, 08 May 2026 06:11:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778245915; x=1778850715; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UqP9B5E97q5AjLcp+nXB1X0SsMVGTRPGCzEJd9lRdaU=;
        b=F2c1B55iPPUvae9cEibPGqxyzosYRcGtX0A7ORAvR50TNTjoeo20jEqypiKtgkz56T
         /nffB2Mt2sT+6BZglHpeJIFmCcQ5wHSmWNvxiT3968AUsyamNVdBZie4JwKHcQOZArFT
         Wamd6RLfCq0zKlxVIl8Xas2Asi9mn1JoJMpepSSClJaYPfr4ZmXLsPwKmmh0QCVdXWiJ
         qQ1I6uEYRz05AWsmkLSP208ZE+btGUt/+DCp/g0YBqh83QziZ+LSz11xXcTBcesj4XOx
         j5Xh4F+A8HSesR0HgLNpOby4A/DXq5lvt7zLTSj6eih8pjoCArxXnEiXO9NpKxlBM9yr
         GmSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778245915; x=1778850715;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UqP9B5E97q5AjLcp+nXB1X0SsMVGTRPGCzEJd9lRdaU=;
        b=YNxkYldWUwDLOlGeFoms/SmEWDSMp6hSvSXN2kJbrpp2KNaZlbDsPUbYHCgBL2wLJE
         PDwE0nsPZKk3g3w0rJx8yf7Ud5k18ZU/jINAm17t1785GLWJvCKh+bhE5gVHbEZniSVX
         cJ5EL9pGZeIDWBbUKEo/L8CvPJhWnmcBpHcL91EDFAFy2PhGxWQ7X+hV++d5FSPonzh1
         rYOLORcnF19clBWu9ld628IaIknLJx/j5d1yBdr+cwxF6+jvFUPyPmZwOIclArzvvZ5d
         tj8XIbCrQ41xdku3Z0Evbd0l2pXgeHnPd7xbTH2MXAdBnVhFYQjyDtCH3yiV3N7c7zAk
         Z3Yg==
X-Forwarded-Encrypted: i=1; AFNElJ8rVpOt7IyZlJsiiKUMvx89iZwJEDcodEK3I0JOvOAp00ZhDEUWsT2/S8GvSCMdb0v77UG4t1iRAA3i@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+GuitDZnYRQyFkA4DyJ3JGkZgU9pv++K+1Hgo3h/uEGWaV/FO
	mS//6kluemS0157iN3mfbGmSJtVz0bBjNV2eYKVjN/E7795V0W+ufBEE
X-Gm-Gg: Acq92OETrqrq6uaYAiWOuyTtVHTkMAXn36dGou3jPAQ0Y5v8BDkv3oDbZil3JeGIoVg
	hJc8t8csmKyX3mESR9n3jnDcChInoefQrTI5w97DwwFEyr8jL50g+ZjWCTSX/WhBCugTJ/kaj+a
	Vo0oLd9lD3JnYwsqf18KtKw4lsB6KpWipKhRlaCJGPXBOgiqUi2iKOiAPQgePu/dNOUklNVd9nv
	OC4DzcP+QVzkhhYoO1sc9yOFC58YRcyYj+xMufvvdxBAr4fAS/ijjOOvaTTLbQCRorjy8Ysy58/
	gERL7Ypcjf4gY2VlDCg1QsKeWZFejmtxhNT1dSOb2Zmtj12Ku8+7y0ulLjIBa/dAkKZngxznKhV
	z2AQV5YG37Rg+MO8lQCTFoe8eR5n7vZy9+B4mWNLXhvR8to6XhmuVZjyxSuT/wQoZ4faQZkSWbi
	7Rq6DYuGCSnGn57YeHrUGwKzNLwMYinFM9QvwGY9g=
X-Received: by 2002:a05:7300:e7ab:b0:2ea:b7a9:580d with SMTP id 5a478bee46e88-2f85bf850a6mr1325407eec.9.1778245915059;
        Fri, 08 May 2026 06:11:55 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a53:11::1002])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f91004b6a2sm683666eec.0.2026.05.08.06.11.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 06:11:54 -0700 (PDT)
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
Subject: [PATCH v5 1/5] dt-bindings: leds: is31fl32xx: convert the binding to yaml
Date: Fri,  8 May 2026 21:11:35 +0800
Message-ID: <20260508131139.1523597-2-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260508131139.1523597-1-jerrysteve1101@gmail.com>
References: <20260508131139.1523597-1-jerrysteve1101@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: C53964F6D39
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
	TAGGED_FROM(0.00)[bounces-8048-lists,linux-leds=lfdr.de];
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
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Convert leds-is31fl32xx to DT schema format.

Co-developed-by: Lucca Fachinetti <luccafachinetti@gmail.com>
Signed-off-by: Lucca Fachinetti <luccafachinetti@gmail.com>
Co-developed-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
---
 .../bindings/leds/issl,is31fl32xx.yaml        | 151 ++++++++++++++++++
 .../bindings/leds/leds-is31fl32xx.txt         |  53 ------
 2 files changed, 151 insertions(+), 53 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/leds/issl,is31fl32xx.yaml
 delete mode 100644 Documentation/devicetree/bindings/leds/leds-is31fl32xx.txt

diff --git a/Documentation/devicetree/bindings/leds/issl,is31fl32xx.yaml b/Documentation/devicetree/bindings/leds/issl,is31fl32xx.yaml
new file mode 100644
index 000000000000..f4a6ef99b477
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/issl,is31fl32xx.yaml
@@ -0,0 +1,151 @@
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
+  "^led@([1-9a-f]|1[0-9a-f]|2[0-4])$":
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
+        "^led@":
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
+        "^led@":
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
+        "^led@":
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
+        "^led@":
+          properties:
+            reg:
+              maximum: 28
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


