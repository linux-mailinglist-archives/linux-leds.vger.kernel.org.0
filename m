Return-Path: <linux-leds+bounces-8529-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id l8HGIqWMJWqQJAIAu9opvQ
	(envelope-from <linux-leds+bounces-8529-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Sun, 07 Jun 2026 17:22:13 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D5CEC650D9D
	for <lists+linux-leds@lfdr.de>; Sun, 07 Jun 2026 17:22:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=MaRCew9x;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8529-lists+linux-leds=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-leds+bounces-8529-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 781173026303
	for <lists+linux-leds@lfdr.de>; Sun,  7 Jun 2026 15:20:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 347831EB5C2;
	Sun,  7 Jun 2026 15:20:25 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6FF92BEC27
	for <linux-leds@vger.kernel.org>; Sun,  7 Jun 2026 15:20:23 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780845625; cv=none; b=skHByM9/b4PnUgvTOD4N8RJk6AWzUQ2bFzjZP/OZu2/XHaz4wbIoOj6uA1lXHKgJ2lth656JP96AtcoTU7a4XfUDcRMFAmRSjcUpkhfeeCIxSycpzuZDq3HA5ow+37c4ND1wnkk5g0hPGW5dpJriMGyDFZAX8Obb3BFOWEe4czs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780845625; c=relaxed/simple;
	bh=pLPZ2qxy1mURLCfMx28oL72xNnXwdxw1jIyb7AYdfDo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CzCNlPHjvLwFX+ApnCosMCsDuioY59KcItDPLD5yzd38LXRX4JKqD74xvbk+AITF/PNjvoEJV9NTeZAwMoXjIXwJUs0L2Mn+9WDi7qnaeJ6zmQ4IxZUuyElH98UKob7lxwLZLTfbR2frngvEwXVaGg5LGDf895LaKAT995oDmOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MaRCew9x; arc=none smtp.client-ip=209.85.216.44
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-36dac5d5da0so1696752a91.2
        for <linux-leds@vger.kernel.org>; Sun, 07 Jun 2026 08:20:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780845623; x=1781450423; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1b+y0Qup+M/gjFnTORp7fBeyfCCPksUKAUMCQ266z2E=;
        b=MaRCew9x9QEwP2MF1sFigm2EpG3SNCiwiJRazVMdh4ORIje5o0CKvrx4VZQ4Z6pAs1
         Gwwq/TjEt9BMiPAsQEMyujRDi/sGDtKCs7t5OYykaaeGaQHH9UWEbK1e9Wfh7Dy21zVW
         AEUsHoMx3Fivn2duMFmHv2r1/DGZqAe73jkOi9iR4tS+Ou6RKrs1vfAkFMPF11o/LDw5
         kNRdTJFQ/BoZ3xPVnN+MyEdMQPpu7Zc5MDZjNRMik+CPPTJlB8vixNA7BmNxnz1xOfio
         qs7Fj6zmWU+OnMT5kkegCRUDjoERPsR4YQvI3O5SpsreyashVzlqtqdAMh0bngvCbLSf
         Otyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780845623; x=1781450423;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1b+y0Qup+M/gjFnTORp7fBeyfCCPksUKAUMCQ266z2E=;
        b=lrXFwS8jFkz9v5AIwA4ncF5bYzvOunQZ3nxzjz/BCRdCrWL0LfF8QmcrSPBhU8MwjC
         ZDqsALXiQ8IoHhe/Bywebo0p+3YD4TbVwQNyhhe0dDst3vZoouiVVW0w2PB5+ZRcXzXi
         pkMyPdJfwFTj+qeCvmvPn+NT1iHjQf6EiweZG2Q4BZcAwAbMyhVSawl/Yyg5B8bncYTY
         9mnalac9QD5ZDENpLrnxhS9yYrkfzGZNFK1GYdt1ahzZwt5ozkrQ9wlPvjl+DZtOBCn+
         Tc4/UvXUzyYu9CzsKiEYfKMBp2Y/a1N/+xb5o0gbxbjcKZrS52+Xa+MFA6lI4djHqsYD
         DKRg==
X-Forwarded-Encrypted: i=1; AFNElJ8z1naSHx0MHSY5fy0XO0LFxz5XBDXfOEY/q2wCthYdOR/7HqlyiP+RQftNE7FNnZI7kNVbiPyKvDz+@vger.kernel.org
X-Gm-Message-State: AOJu0Yzr30BOvmdxX+mzNN3fuO9LbFZXy5fDAAaQquX0aCvR/9OJ2Q63
	K0Fom0wYAUS+jARhNMmorNPUprhe/q7zw/qyH81UHvyPJaZKTfqJTbhR
X-Gm-Gg: Acq92OFR76qj00xl5fqacd6+wNs9tbmf7k6OuPZJaGp43Hl35yNUesKPpA019TtPNDL
	46b/naIlpFYRD8kT3oZyoYjHDpLcTfeS3C7GEL9bIuKw87/Zi5IgkZJmhUSUmZtrriHTJdUf2OI
	JkPgkMzc6CVy+QzXXICkdHgZ/hD5zATMhrbTOE10MebgFbgdfyxJM79hT1z/Eypa44qP+PgjhCT
	YHzJpPLsy9xgrRxEouU9gnMyvdzqaaq1XqKonIbrPw9M+/K+ChBJ8Z9r5F63n8/n/HOKY5QnK93
	gunREER3v6q2hJBWDFqkmSOEWMe6VR9+FNQooMb0G3Er6PUmEC+78VKoty99edBHCkRKhOA+dxF
	zJFsM9Z0pXRdrZLEA64LTzp6zUgRSEjTiHp8AKR/AebrkJs4gvzHrNuNpMY6m11Ny4tbxQDTqNe
	8ARtRgsQP2hhKDeYyXng3l2gh3dnqwvl22D1z7sGI4fCpCaSaMOQ==
X-Received: by 2002:a17:90a:d643:b0:36b:b4a1:2939 with SMTP id 98e67ed59e1d1-370efda7ab1mr14545460a91.15.1780845622994;
        Sun, 07 Jun 2026 08:20:22 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a54:e741:3a5a:3245:d3dc:4b5d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37135861581sm4130659a91.2.2026.06.07.08.20.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 08:20:22 -0700 (PDT)
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
	Jun Yan <jerrysteve1101@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v8 1/6] dt-bindings: leds: issi,is31fl32xx: convert the binding to yaml
Date: Sun,  7 Jun 2026 23:19:57 +0800
Message-ID: <20260607152002.446617-2-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260607152002.446617-1-jerrysteve1101@gmail.com>
References: <20260607152002.446617-1-jerrysteve1101@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-8529-lists,linux-leds=lfdr.de];
	FORGED_SENDER(0.00)[jerrysteve1101@gmail.com,linux-leds@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,thegoodpenguin.co.uk,zonque.org,oss.qualcomm.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-leds@vger.kernel.org,m:lee@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:luccafachinetti@gmail.com,m:pzalewski@thegoodpenguin.co.uk,m:daniel@zonque.org,m:jerrysteve1101@gmail.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jerrysteve1101@gmail.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ucw.cz:email,thegoodpenguin.co.uk:email,issi.com:url,si-en.com:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D5CEC650D9D

Convert leds-is31fl32xx to DT schema format.

Co-developed-by: Lucca Fachinetti <luccafachinetti@gmail.com>
Signed-off-by: Lucca Fachinetti <luccafachinetti@gmail.com>
Co-developed-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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


