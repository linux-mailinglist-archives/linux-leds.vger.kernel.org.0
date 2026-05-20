Return-Path: <linux-leds+bounces-8221-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UGb0Duu9DWrH2wUAu9opvQ
	(envelope-from <linux-leds+bounces-8221-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 20 May 2026 15:58:03 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id CBEC558F2D5
	for <lists+linux-leds@lfdr.de>; Wed, 20 May 2026 15:58:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 18D483040B98
	for <lists+linux-leds@lfdr.de>; Wed, 20 May 2026 13:57:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDDD73DD50E;
	Wed, 20 May 2026 13:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bOoNNlmW"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 227AC3E1D1D
	for <linux-leds@vger.kernel.org>; Wed, 20 May 2026 13:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779285441; cv=none; b=U/gREC9WZjnfsJF8qYIQfH3SbbTjStG2jl3hjKw0y91Acx68FOmnsJLSQ+Y3+pjLNG/vktEofm30oLcF/mK5Ht6rrRzS1m1KM7LcdhVXaneGpXQ90GStGRSA0Sof3zIS05HmlSb4OY4d9qKoZZXOvuABMFaEmPLbkADAWcl4hck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779285441; c=relaxed/simple;
	bh=BjdykeHS9BqEJZE1gE6CCOK/sLg66E2Y5BAmWKBD3Ho=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sU7Teakq5XUCfq+PNPzt/5QDk9gjaSEtTtiWlpXM9VVAGAqGdfjPHETUO3TeMaCtUKNCKo/Yigp6bNTSROLCOkmmc9YuZ8Kl4oY5bhdzYe7dP7XnWUgZENkcJKIOfwJJIqs+a87A45GwSmR1RwH32xbLSD8cQFj8kLO/cz2E9ro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bOoNNlmW; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-366375c4076so1839362a91.3
        for <linux-leds@vger.kernel.org>; Wed, 20 May 2026 06:57:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779285439; x=1779890239; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oAr9Tuamz6G4RMhF+mEaQvtccn86uYkrnM5/9wq0C+4=;
        b=bOoNNlmWt3pzy80/FlyyC22VYbFo2i51ocCe7x7zCmEC7NA0JrkKBzihfKw3xN0nz4
         nSfleDKr1bkrPWlKY5kB67mbAm6Oc7IlCf+js6f41MzwOU42zD8z7/j4s8XNWaRZaRQQ
         /SFlYEbubGRCGqyNJ0WOO1FQi4WmbYEqT18Zocv6dQFW4hECsFNUbcRowpMGiMGR9mQY
         yHdudmTwNCaDz6WvILASZ3895RdcZLi2t+Taeej6e9Q28GChCIEuhto5ppO6R/87Ogh2
         SdnHbK2UNhfl1dtcgP13n9pbWtEUNmB0fXxlcsU8FidgCpy4UPlFuWGHZ3jbwJS6Mui8
         ADzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779285439; x=1779890239;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oAr9Tuamz6G4RMhF+mEaQvtccn86uYkrnM5/9wq0C+4=;
        b=ctr12A2U2iEsJWr3xB6XuOCuZxCv7rsR8p8AHqjNnumcPmumk3eJ9rou9D2IKzpaJx
         pcJQL7SRvTZ/RCGcwKvWl9jBgUfsD01fpCTVXA52mEko+VwPvU3jDGXp3ibZqcI+iZZI
         APvnPn/wA90XIeTlqYJCz68EvH0qul8sZ5SnvWkQ8qF+9niwp5WZ3AO7IwqmppCBVjnq
         GjplytD4IQBadM7iEp+1fY7DdqjZRXPrYR8fnmQG3fSo5ndCQbYcTXerXn6hfe2HzdED
         q9qAAISnQ+jWNjXgBpYIVii4PVameAcqoOAi4GuiwS8irmOYV2LO1wCjgn/Il61Egn9U
         UB3g==
X-Forwarded-Encrypted: i=1; AFNElJ9k68/w2DadFoRp81cy1vkkwFla9kdY4Ey8llfM0M+EeLTpz+7q8SOXRITumRPIodBUatpU+enqStE2@vger.kernel.org
X-Gm-Message-State: AOJu0Ywmow+HIx2TYQ0XleCSzvm6SWjUR20zlTHSg2jUFt/64Wh7RLa7
	YXrD2nhHJNuRHYLLDmq5ARfIWrSr/JsxKdSyWOlZEKZNodkZmN7lWcDr
X-Gm-Gg: Acq92OF2th0c3vaAC2XvOOzG9PcVNToQnHx/NRKgOBwr3+tY/3TCciK5+3EzeaTnBqG
	Jj4d78VZPzDEiu2lkbTH//Ypf/adnFgPQf2pPqm37YCZmWOwXtuNZbAi1WxDT1JxJp929k+YQFj
	eBS0CVvXNxi86og3pGjsJKqIAufK81tAYIDrJ0EYPWBxIOVFNc/Bz70ttkakIjDzkllaRppFlJG
	7jdyX/ppXd2iAnyRzTWlSK0b30S1asRDv35dmLeQoowRVv9CY+dlVvFvuA9kPLLQRBK0gMPVQ7z
	WE1CUgKts8xmxF8NlWT4bF7l2vHkfINPEKZzPYI93VGEnYSxRExmLnKOrM/euqLdMRcW9KM0Xj8
	sU7VJCzULwhbRamXrSpd3fFu0VGCVCHt6z5++FGu/5Ce/zd2bBwmyWOPWsAQbAdGmM6qkK8fnwk
	0LUYDIBS095MCW18JLXPCFaDAFiOC47M5zrOIYvsk=
X-Received: by 2002:a17:90b:38cf:b0:35f:b647:d98a with SMTP id 98e67ed59e1d1-369519c6bcfmr22869963a91.5.1779285439101;
        Wed, 20 May 2026 06:57:19 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a52:5b11:a58f:5208:2fa7:bba5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-369572e1007sm7480867a91.6.2026.05.20.06.57.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 06:57:18 -0700 (PDT)
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
Subject: [PATCH v7 1/6] dt-bindings: leds: issi,is31fl32xx: convert the binding to yaml
Date: Wed, 20 May 2026 21:56:54 +0800
Message-ID: <20260520135659.1430008-2-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260520135659.1430008-1-jerrysteve1101@gmail.com>
References: <20260520135659.1430008-1-jerrysteve1101@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
	TAGGED_FROM(0.00)[bounces-8221-lists,linux-leds=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Queue-Id: CBEC558F2D5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Convert leds-is31fl32xx to DT schema format.

Co-developed-by: Lucca Fachinetti <luccafachinetti@gmail.com>
Signed-off-by: Lucca Fachinetti <luccafachinetti@gmail.com>
Co-developed-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
---
 .../bindings/leds/issi,is31fl32xx.yaml        | 151 ++++++++++++++++++
 .../bindings/leds/leds-is31fl32xx.txt         |  53 ------
 2 files changed, 151 insertions(+), 53 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/leds/issi,is31fl32xx.yaml
 delete mode 100644 Documentation/devicetree/bindings/leds/leds-is31fl32xx.txt

diff --git a/Documentation/devicetree/bindings/leds/issi,is31fl32xx.yaml b/Documentation/devicetree/bindings/leds/issi,is31fl32xx.yaml
new file mode 100644
index 000000000000..81f1e30e493d
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/issi,is31fl32xx.yaml
@@ -0,0 +1,151 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/issi,is31fl32xx.yaml#
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
2.54.0


