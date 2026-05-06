Return-Path: <linux-leds+bounces-8013-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oGGXKtDm+mnZTwMAu9opvQ
	(envelope-from <linux-leds+bounces-8013-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 06 May 2026 08:59:28 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 327184D6E44
	for <lists+linux-leds@lfdr.de>; Wed, 06 May 2026 08:59:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5B4E03076A1B
	for <lists+linux-leds@lfdr.de>; Wed,  6 May 2026 06:49:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 906AA36BCC3;
	Wed,  6 May 2026 06:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X/n5+3He"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87C0B368962
	for <linux-leds@vger.kernel.org>; Wed,  6 May 2026 06:49:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778050149; cv=none; b=Vyr1heOnR1ft3O1gcDbp9/kecrSKlR1pMSRqiBkJ0N7xx8HjNefq/pv1a9n+jlUlu1iFEJI483iJpPBHuaQhrjFe94y+Ewr0HbcM8prV8ZOhvIzHI0qX8WywuhshBWdyTJ5VdOA3Lpwcd5gWJfu6hi4cT3n3uFgpZbPf6FxxXFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778050149; c=relaxed/simple;
	bh=pHp6Q7knii2n+EhMdTYm6APHUxAVGaG6SjWBOs/Ltog=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k8+3oq6hl4O1+AWtbpAmrrqCCsxTvwv2yKsNlnFNDxoIXnQSuYTHJdG6qQHZJcp4gDHzPfVH/kiDEad2hZYYFd99hkTCVZ6MAYKFSccmU4sxFwVwbgaY1PHn0zgcEsflOjSv8UEwpNWCc3tN4vINSGQlpPhJIItZ2EwXudWe3Fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X/n5+3He; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-48334ee0aeaso42926445e9.1
        for <linux-leds@vger.kernel.org>; Tue, 05 May 2026 23:49:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778050146; x=1778654946; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RtWz4md+KpJ0I5o5giTzQAfd544HTKz5u0iahZieaR0=;
        b=X/n5+3HesL4FqjlKALUCRo5oHbnH9MRiVj/Pmv26H3kPXroqCKXuojOg+KsKTaq0YH
         D1HRDvzaAssIQE8pBuOYLHTSdHGYeyQSZoN6uxzNlbNuoqI9217TuyFu3E5ExYMtvDIJ
         JcT3SBDqbmnMt3CgCsmXsqA3UegUpb6Ef2ULCf/r4u+PCWJG9LL3iM63SXlrMSoGLYBV
         xqJEH4xszgHQxig/vpJBuSdex2/0HcwbSJHoriRTD5IHE6LgxsGNc9Y63lGrcECDDV4f
         w3l9ELdSVyc1NBWWMnjW8fki9hSqa80EY1PSMKOl3x6wR2TVANB7uhd4j8trxJEpTSXl
         KghQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778050146; x=1778654946;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RtWz4md+KpJ0I5o5giTzQAfd544HTKz5u0iahZieaR0=;
        b=DXyx62G0wZCazzNVRS1ngIZbw7DY3vlN5rixiHBr7blQQHWtUbhWbB9c/W+Zkec2UL
         tNVpsHRbi6JT7etj36wGQaiYsTaqmnKV1z9wyZm/krMHVfqW52q77UBTd6TwzELRzFVW
         VzLLVCdkN/jX/5+z/TEcHqfMYyo3+QJQ7sT8K80IMw/+F4ERHObET1irw5DRErbUma3Z
         aYpkkeIV8YAg2Zt2HVEO02CvYbwiLuAn2UEhv8rd/c2nlTpOqi7rklNKKy1AzGUnBfip
         jQz2idr5jjvR16C2eZvzSbQsyM3joy3yfAlVK0GXu4a4U4zFkzCC2Ojl4BjL8JYOXyt7
         61JQ==
X-Gm-Message-State: AOJu0YwIYRInox+YNpavBlFDeZCCfghF+fwdaho6cE95x/HAkE9WCha4
	Dlwzy+JUsEsPbyV2RHjl4w0eXRz0ClNum+jn0zMK1l4lpyeXC40HnqCy
X-Gm-Gg: AeBDietto5CKMxaAeJcumQ38YOUnpWT+6esS69PKe7UveWPR7WpqJbIIsDW2heargr5
	222nHm+1HV+l3frZeIve4ycOEqaiPFo+xusUMgzUS6SGFBONiOKm4KP1BAh1tz+yWZejJBaQtJ9
	wdSbJuOfrjP1jcnCoWyssuCKgGqeozJC23+mmqwEgwrlJaI4MZbAQ0osTeKH3o1QewFAtFs8b+f
	VNkjHBsLmn+Nn3IZbR+5UBzvo4RGFwMlyd/+78ZA6owluLNJL1/DaIZaEHloHx2KDmM8FjWoHpF
	yvLRflC9lLpVdrizmCdPpbQ2cXlbgP1yBrRMsiEbc1ZM1c47sps9MHCxUpSIK6FtY+KHUbwcWQQ
	Kf/0nrQuTuu/Id+vOy7RMXAw0i9RpLu4NToQSfxktSJL++SCISDfdryu6ZsKZ86UR0A5YduYtWL
	sa1Eg2jJFEav6vDGxcHfj3Lcw=
X-Received: by 2002:a05:600c:41cc:b0:489:1c1f:35e6 with SMTP id 5b1f17b1804b1-48e51e0bc24mr17870485e9.6.1778050145887;
        Tue, 05 May 2026 23:49:05 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e53891d62sm38398835e9.1.2026.05.05.23.49.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 23:49:05 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH v6 1/6] dt-bindings: leds: Document TI LM3560 Synchronous Boost Flash Driver
Date: Wed,  6 May 2026 09:48:42 +0300
Message-ID: <20260506064847.37795-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260506064847.37795-1-clamor95@gmail.com>
References: <20260506064847.37795-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 327184D6E44
X-Rspamd-Action: add header
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [6.34 / 15.00];
	SEM_URIBL(3.50)[0.0.0.0:email];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.15)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-8013-lists,linux-leds=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_FROM(0.00)[gmail.com];
	GREYLIST(0.00)[pass,body];
	RCVD_TLS_LAST(0.00)[];
	R_DKIM_ALLOW(0.00)[gmail.com:s=20251104];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,linux.intel.com,gmail.com];
	DMARC_POLICY_ALLOW(0.00)[gmail.com,none];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	DBL_PROHIBIT(0.00)[0.0.0.53:email];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_SPAM(0.00)[0.735];
	R_SPF_ALLOW(0.00)[+ip6:2600:3c04:e001:36c::/64:c];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,devicetree.org:url,0.0.0.0:email,0.0.0.1:email]
X-Spam: Yes

Document TI LM3559 and LM3560 Synchronous Boost Flash Driver used for
camera flash LEDs.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../devicetree/bindings/leds/ti,lm3560.yaml   | 163 ++++++++++++++++++
 1 file changed, 163 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/ti,lm3560.yaml

diff --git a/Documentation/devicetree/bindings/leds/ti,lm3560.yaml b/Documentation/devicetree/bindings/leds/ti,lm3560.yaml
new file mode 100644
index 000000000000..6cf8cf91ab2e
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/ti,lm3560.yaml
@@ -0,0 +1,163 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/ti,lm3560.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: TI LM3560 Synchronous Boost Flash Driver
+
+maintainers:
+  - Svyatoslav Ryhel <clamor95@gmail.com>
+
+description:
+  The LM3560 is a 2-MHz fixed frequency synchronous boost converter with two
+  1000-mA constant current drivers for high-current white LEDs. The dual high-
+  side current sources allow for grounded cathode LED operation and can be
+  tied together for providing flash currents at up to 2 A through a single LED.
+  An adaptive regulation method ensures the current for each LED remains in
+  regulation and maximizes efficiency.
+
+properties:
+  compatible:
+    enum:
+      - ti,lm3559
+      - ti,lm3560
+
+  reg:
+    maxItems: 1
+
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 0
+
+  enable-gpios:
+    description: GPIO connected to the HWEN pin.
+    maxItems: 1
+
+  vin-supply:
+    description: Supply connected to the IN line.
+
+  flash-max-timeout-us:
+    minimum: 32000
+    maximum: 1024000
+    default: 32000
+
+  ti,peak-current-microamp:
+    description:
+      The LM3560 features 4 selectable current limits 1.6A, 2.3A, 3A, and 3.6A
+      (in case of LM3559 - 1.4A, 2.1A, 2.7A, and 3.2A). When the current limit
+      is reached, the LM3559/LM3560 stops switching for the remainder of the
+      switching cycle.
+
+patternProperties:
+  '^led@[01]$':
+    type: object
+    $ref: /schemas/leds/common.yaml#
+    description: LED control bank nodes.
+    unevaluatedProperties: false
+
+    properties:
+      reg:
+        description: Control bank selection (0 = bank A, 1 = bank B).
+        maximum: 1
+
+    required:
+      - reg
+      - flash-max-microamp
+      - led-max-microamp
+
+allOf:
+  - $ref: /schemas/leds/common.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: ti,lm3559
+    then:
+      properties:
+        ti,peak-current-microamp:
+          enum: [1400000, 2100000, 2700000, 3200000]
+          default: 1400000
+      patternProperties:
+        '^led@[01]$':
+          properties:
+            flash-max-microamp:
+              minimum: 56250
+              maximum: 900000
+            led-max-microamp:
+              minimum: 28125
+              maximum: 225000
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: ti,lm3560
+    then:
+      properties:
+        ti,peak-current-microamp:
+          enum: [1600000, 2300000, 3000000, 3600000]
+          default: 1600000
+      patternProperties:
+        '^led@[01]$':
+          properties:
+            flash-max-microamp:
+              minimum: 62500
+              maximum: 1000000
+            led-max-microamp:
+              minimum: 31250
+              maximum: 250000
+
+required:
+  - compatible
+  - reg
+  - '#address-cells'
+  - '#size-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/leds/common.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        led-controller@53 {
+            compatible = "ti,lm3560";
+            reg = <0x53>;
+
+            enable-gpios = <&gpio 28 GPIO_ACTIVE_HIGH>;
+            vin-supply = <&vdd_3v3_sys>;
+
+            flash-max-timeout-us = <1024000>;
+            ti,peak-current-microamp = <1600000>;
+
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            led@0 {
+                reg = <0>;
+
+                function = LED_FUNCTION_FLASH;
+                color = <LED_COLOR_ID_WHITE>;
+
+                flash-max-microamp = <562500>;
+                led-max-microamp = <156250>;
+            };
+
+            led@1 {
+                reg = <1>;
+
+                function = LED_FUNCTION_FLASH;
+                color = <LED_COLOR_ID_YELLOW>;
+
+                flash-max-microamp = <562500>;
+                led-max-microamp = <156250>;
+            };
+        };
+    };
-- 
2.51.0


