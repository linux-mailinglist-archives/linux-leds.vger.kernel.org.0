Return-Path: <linux-leds+bounces-7878-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eBaYJLCn8GlAWgEAu9opvQ
	(envelope-from <linux-leds+bounces-7878-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Tue, 28 Apr 2026 14:27:28 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E14F5484D21
	for <lists+linux-leds@lfdr.de>; Tue, 28 Apr 2026 14:27:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B15FB3092940
	for <lists+linux-leds@lfdr.de>; Tue, 28 Apr 2026 11:39:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2913B3B38A7;
	Tue, 28 Apr 2026 11:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QAWiuHLD"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D30B137F733
	for <linux-leds@vger.kernel.org>; Tue, 28 Apr 2026 11:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777376386; cv=none; b=uC2IzY3v2pS2HG5CUEPCoBFUENAjUzwAfkiiT0BcH5Rxi+O5jOqqwOr7E4KVcTw3goXRHOdBOP7r8gemPihQR+RGIOwGqnD72d4S9hJhidX0sWprr9tfF3ebuwtovg/crTC+4c53+G92b9xYl3WQBQUcmSDmzOP0N109Av3oxAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777376386; c=relaxed/simple;
	bh=6Ox/1lZRBtvaCEzjGqWKJlNoXRziKdYDiJOJBsJZJxE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lMATpY7um7rCGTLwcaSqdD9q5ed0g5SxryTAPJiP3fx9mJQCgWY3JXNzN1zbO7NynBj1uT83tcAzYg76oUsvuDLC2zftYFboHJBz0LGO7edZocFvjbDZRAtW066L2ZNJr2v4bKtgvfqFYxFGkcNLPTZhtse+F1GTHDXW/fdX94I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QAWiuHLD; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4896c22fcbaso84619185e9.0
        for <linux-leds@vger.kernel.org>; Tue, 28 Apr 2026 04:39:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777376382; x=1777981182; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MKbUTvcePe+bc+QWEqhr7xtWGXq9HDSMNZMknnD7nyk=;
        b=QAWiuHLD82rTdJGXC2jYo2mbtrfqx3eQK27QENKAM0X01s/T57hXq89ehvsWOxkOBO
         f4qaYupINUvAPAJeUdppKTF2GM12PDfVKD9pDlS+zlzmRRgbOE5zwV45NDZecrTtDXe2
         yH9rKN9cRN3W+w+jLoTKc3EhPSilBuGYWeMFRz5eU/Hn7DwrhOPoeI4CkpnkzMU7TPzZ
         eSsulDSRuPmRRwmY3m4s0LR2NQMB2ns8LFDm7BlpXik5SKGNEcBzZg9d0OG8ZgnKdOzh
         LUdQrF2K8dSJJvjaFy+W+Jm+VLHDB4XY7N4P7m0pteUzc+p13qXai/1vnxfKYYfqAF6l
         HQfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777376382; x=1777981182;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MKbUTvcePe+bc+QWEqhr7xtWGXq9HDSMNZMknnD7nyk=;
        b=paaGU7b5pjXpKKJ0yyTZ8xaRzRP+33SgN4its1EM+zO+ymNxVASqgo6pbGaci9+/6m
         DT32QXM6vCOLmJlO7pOaNQqDvjXxZd0baL4AjPoB6qzO4UPSL5tlqS8Fe6796GXcbmHT
         3bEpfRgp4WVvqtRpr2rxHMTcwh/1ebMwyFxvFCPEwLPjww/qQl8neQdur7cmYRdCkUEX
         ePSa7D39BUdSA0PG5eNhUz10P8sMsBce9jqARX4khu39NvamL0847ciakMp+rbAmTU4R
         CwVmkOAxM+CiBB+Y3T8SmkW8r47FZNh+cfKolBrOFYWxxpHlxlTRdifiJGPUiKW1/w68
         2/nw==
X-Gm-Message-State: AOJu0YwqxW+Q56mWHehCXX0wJvCbwHLaqLEfuUvcmd6lNZUoRmN7bSiX
	ZTyIe1tL2DXx2KSGVeg3qG5iWjQ06sp8L+VCFWc/ORVGUEDjLAAvHZdK
X-Gm-Gg: AeBDiev8CKxRammc5XWppGYbVbq/e4n0kBEs6FycEd1E4VR3RRQIfrhU+GgrOT/jdke
	PacnR0Xit4qtG3MLq+Cx0+FpF6yksxgHOT46geCyhQsgZ+dGHvNkO/gVem2Q/4ngOOyB7IJLhGR
	oya/tnx8xIHFT2VxX0DqipS8GjCAd7595yOfSIAheBA2Mx2abgRzo5ADDlGeXGakLZDnaHLaxkS
	oJWBzXvshp5YDUeawZ7mu+7MndZXbD2CdGOiUVOv0vkjYl2fcZD1W5z/LnqUuVaO+xaQ/6erVOi
	xgjT/5duGjjM+zFyrdp5FAbKID2H9j/jyc7Eqt9ByZdz9Mu4vyMrs/JBZhgX/gKbyuVXEWODKWv
	1lacUsbKkmRoNxSwJcMBVBXbKm7QvSv0IFvg7wfBsUHf8SSbt7exn3Rg1ewyT6Sh+UEJSfSzwPH
	qnXCeT6Zcs9q//yagVMAz+y9I=
X-Received: by 2002:a05:600c:8b54:b0:48a:5339:ef0e with SMTP id 5b1f17b1804b1-48a77ae5405mr46236345e9.3.1777376382166;
        Tue, 28 Apr 2026 04:39:42 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a77aeb223sm43541125e9.3.2026.04.28.04.39.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 04:39:41 -0700 (PDT)
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
Subject: [PATCH v4 1/5] dt-bindings: leds: Document TI LM3560 Synchronous Boost Flash Driver
Date: Tue, 28 Apr 2026 14:39:18 +0300
Message-ID: <20260428113923.112920-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260428113923.112920-1-clamor95@gmail.com>
References: <20260428113923.112920-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: E14F5484D21
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [5.84 / 15.00];
	SEM_URIBL(3.50)[0.0.0.0:email];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	MAILLIST(-0.15)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7878-lists,linux-leds=lfdr.de];
	R_DKIM_ALLOW(0.00)[gmail.com:s=20251104];
	GREYLIST(0.00)[pass,body];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[kernel.org,linux.intel.com,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DMARC_POLICY_ALLOW(0.00)[gmail.com,none];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	DBL_PROHIBIT(0.00)[0.0.0.1:email];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_SPAM(0.00)[0.713];
	R_SPF_ALLOW(0.00)[+ip6:2600:3c0a:e001:db::/64:c];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,0.0.0.53:email,0.0.0.0:email]

Document TI LM3560 Synchronous Boost Flash Driver used for camera flash
LEDs.

The TI LM3559 documented in this schema requires a separate compatible, as
it utilizes a different programming model — specifically regarding the
handling of voltage ranges.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../devicetree/bindings/leds/ti,lm3560.yaml   | 133 ++++++++++++++++++
 1 file changed, 133 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/ti,lm3560.yaml

diff --git a/Documentation/devicetree/bindings/leds/ti,lm3560.yaml b/Documentation/devicetree/bindings/leds/ti,lm3560.yaml
new file mode 100644
index 000000000000..27bbc45bfc85
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/ti,lm3560.yaml
@@ -0,0 +1,133 @@
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
+allOf:
+  - $ref: /schemas/leds/common.yaml#
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
+      The LM3560 features 4 selectable current limits 1.6A, 2.3A, 3A, and 3.6A.
+      When the current limit is reached, the LM3560 stops switching for the
+      remainder of the switching cycle.
+    enum: [1600000, 2300000, 3000000, 3600000]
+    default: 1600000
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
+      flash-max-microamp:
+        minimum: 62500
+        maximum: 1000000
+
+      led-max-microamp:
+        minimum: 31250
+        maximum: 250000
+
+    required:
+      - reg
+      - flash-max-microamp
+      - led-max-microamp
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


