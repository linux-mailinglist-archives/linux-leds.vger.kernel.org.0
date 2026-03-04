Return-Path: <linux-leds+bounces-7086-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +NNcJ/mBqGlpvQAAu9opvQ
	(envelope-from <linux-leds+bounces-7086-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 04 Mar 2026 20:03:21 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5470D206CBB
	for <lists+linux-leds@lfdr.de>; Wed, 04 Mar 2026 20:03:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 91F1F30405E7
	for <lists+linux-leds@lfdr.de>; Wed,  4 Mar 2026 18:58:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4A263DA5C5;
	Wed,  4 Mar 2026 18:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BSoWYr20"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A05CC3D75B5
	for <linux-leds@vger.kernel.org>; Wed,  4 Mar 2026 18:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772650687; cv=none; b=Aq7ORTg62yPKB2b2qaVUshqz6C4BKh0+z9WNi1omiaEuIOiV9g0JZFTjtckW2aSXOEP5rVM2J/pyYzqePQzlOfbixi3SJ2FCWHfKxN2HIAwIA5GS0LE1zg/NHLqIZx6TF1FcwZ+lkT4L7QOxlTq4DkxHJpCUZhOCn7fqBWbLPJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772650687; c=relaxed/simple;
	bh=Um/z68zG3N61niZpCEIqJtffZwPNsXI2dku/W5e1n1w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KBpCD75fXcf+Hb9kYcYo+BnZt369YAMSlqZMiGB2ZP80yJlGyQT2Lv6eYYm5Z0rtENLLo/YfPpsC5BEgnmwHRtgHaSYxhMkXHRG10MXaz5aCpOzp+H0NbQhou/aj0D2/d1FPKdDpUo0ikinLXTmrIs2ScN4kFcR+S/C3I+DEdKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BSoWYr20; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-38a2cc31e20so19909691fa.1
        for <linux-leds@vger.kernel.org>; Wed, 04 Mar 2026 10:58:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772650684; x=1773255484; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+X0ubJBSyO/B3iU+P8TQmYBYVQdgv6gVa1x95cmnAWM=;
        b=BSoWYr20bcI3o3JCa9seNp57s083V2y+QhavjlJ3GtJNXMtupOBHmoSXXKFOxT35IB
         fpyDzpUq+Dw9a8juhD86IzkpVG+dVVD6AgCzBs0ClWxJqdzSpnLTcPetrZ+G/NonGKDH
         Y6DGANEVtgOL0NIKIWc14Qq1+3RtWW6IRHzRVHmpq8kv52G8YigIbgdTsqKDAKUxnuSR
         XCTROFJ4hxjEKxEKXavX0RnEZUPUhST7ROb5J9VHsOOY6vayoLe06U5teHkvp46m6yjV
         RywDnGo7q/9BnWOC7k5WiS+0rAMYjCRWXVZ6sHWHTezB1KMwqOifymCuJsVcTNkHxgF6
         s9vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772650684; x=1773255484;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+X0ubJBSyO/B3iU+P8TQmYBYVQdgv6gVa1x95cmnAWM=;
        b=HdaQSPXT3W8ADHbB6sMmdIXwZPAjHL4utgLwwNT6ITVcYa0n87xn++o8mHOVF8Bg0/
         hcxXwRYcNqijOqAPT+WH4n9aNyIGeBqo/BcZ1gNXBG0ND2gcmYPuj6aeTpT8m1/0fB1b
         0ZmXYiYf/klxffUARVPv5rMFdXFSOYGG8Dxmk8NAxd4mKxVWTIGufrF7XyIpArdrpPdq
         XFXA5ooF4gEddHClgBaTvFpgbrcMb6SeXiuQTcsBE91AIieA47L5lI3jU8Hvj3+ucnvk
         U39LUmjbT5rzcEzHQa8vYdvZzF6I3THyGmYw7q72vt84LJBvHh2JDtaNgKtzzvuNqSF3
         g8VQ==
X-Forwarded-Encrypted: i=1; AJvYcCX3F7OpOM472y5aplneFH7l51c3+/+xBPnDMmRiLFqhilMuxalC+RGfJksmTk7RXooX8y7PW7l0Y1h5@vger.kernel.org
X-Gm-Message-State: AOJu0YxiQDXLldzx8ViIFTDxY6+QfMXdbtqZf4qmyMVW7538zfVh3HLn
	m0NalVzc46gU0e6RKPqv2tw71bFipZZ6t8okWvrLZdCpDBs+fWlVI4iz
X-Gm-Gg: ATEYQzzYZZ5can/tU5ErgI0Vg6TzCqLvK1//BNf2TgnT907uwlTxI/H2EoK+Axh/VK6
	cNaVg5J+2ARwhqq+wKiYat5260RSiIkrvnQ0gIhQTRWZd0v91gt31Eohrmog3hAGGpGLIF02598
	uLDbCoYuav/H2aeXS2lcc/3Nxl3xPN3pl/JNDb5V185yoz1/iE5TMRJ1p1qmNQEGvkSnOIukh4N
	eOgo+TtXuTKmrwju6dnzN1m97d9zqzhjeR3WCmIcI6y0Hd7vuK0BRG7srJ6A5azbPCWOS5K8pV9
	opfg4muUTl97i48DNgDN3EtDR9rdbUymwcx2fOPnFJa2c/q/tOUALd3sbY7K1gLvVD/lkl4jTqv
	Y8fS5nY6OxP5PDxGjm34cNpemL+Rnx27B4fC2f0P/TVN6wcyeS/erPfNyPl2n2AxGHN+jzNMUCe
	BgP9dO3nc5WRfz
X-Received: by 2002:a2e:9e11:0:b0:386:1ce2:1192 with SMTP id 38308e7fff4ca-38a2c5b25cemr17005641fa.20.1772650683643;
        Wed, 04 Mar 2026 10:58:03 -0800 (PST)
Received: from xeon ([188.163.112.72])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a12a6ddd3bsm704985e87.0.2026.03.04.10.58.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 10:58:03 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Sebastian Reichel <sre@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Ion Agorria <ion@agorria.com>,
	=?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-leds@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: [PATCH v5 1/7] dt-bindings: embedded-controller: document ASUS Transformer EC
Date: Wed,  4 Mar 2026 20:57:45 +0200
Message-ID: <20260304185751.83494-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260304185751.83494-1-clamor95@gmail.com>
References: <20260304185751.83494-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 5470D206CBB
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-7086-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,agorria.com,rere.qmqm.pl];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	NEURAL_HAM(-0.00)[-0.998];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,0.0.0.19:email]
X-Rspamd-Action: no action

Document embedded controller used in ASUS Transformer device series.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../asus,tf201-ec-pad.yaml                    | 119 ++++++++++++++++++
 1 file changed, 119 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/embedded-controller/asus,tf201-ec-pad.yaml

diff --git a/Documentation/devicetree/bindings/embedded-controller/asus,tf201-ec-pad.yaml b/Documentation/devicetree/bindings/embedded-controller/asus,tf201-ec-pad.yaml
new file mode 100644
index 000000000000..60b6375864aa
--- /dev/null
+++ b/Documentation/devicetree/bindings/embedded-controller/asus,tf201-ec-pad.yaml
@@ -0,0 +1,119 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/embedded-controller/asus,tf201-ec-pad.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ASUS Transformer's Embedded Controller
+
+description:
+  Several Nuvoton based Embedded Controllers attached to an I2C bus,
+  running a custom ASUS firmware, specific to the ASUS Transformer
+  device series.
+
+maintainers:
+  - Svyatoslav Ryhel <clamor95@gmail.com>
+
+properties:
+  compatible:
+    description:
+      The 'pad' suffix is used for the controller within the tablet, while
+      the 'dock' suffix refers to the controller in the mobile dock keyboard.
+    oneOf:
+      - enum:
+          - asus,sl101-ec-dock
+          - asus,tf101-ec-dock
+          - asus,tf201-ec-pad
+          - asus,tf600t-ec-dock
+          - asus,tf600t-ec-pad
+
+      - items:
+          - enum:
+              - asus,tf101g-ec-dock
+              - asus,tf201-ec-dock
+              - asus,tf300t-ec-dock
+              - asus,tf300tg-ec-dock
+              - asus,tf300tl-ec-dock
+              - asus,tf700t-ec-dock
+          - const: asus,tf101-ec-dock
+
+      - items:
+          - enum:
+              - asus,tf300t-ec-pad
+              - asus,tf300tg-ec-pad
+              - asus,tf300tl-ec-pad
+              - asus,tf700t-ec-pad
+          - const: asus,tf201-ec-pad
+
+      - items:
+          - enum:
+              - asus,tf701t-ec-dock
+          - const: asus,tf600t-ec-dock
+
+      - items:
+          - enum:
+              - asus,p1801-t-ec-pad
+              - asus,tf701t-ec-pad
+          - const: asus,tf600t-ec-pad
+
+  reg:
+    description:
+      The ASUS Transformer EC has a main I2C address and an associated
+      DockRAM device, which provides power-related functions for the
+      embedded controller. Both addresses are required for operation.
+    minItems: 2
+
+  reg-names:
+    items:
+      - const: ec
+      - const: dockram
+
+  interrupts:
+    maxItems: 1
+
+  request-gpios:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - reg-names
+
+allOf:
+  - $ref: /schemas/power/supply/power-supply.yaml
+  - if:
+      properties:
+        compatible:
+          not:
+            contains:
+              const: asus,tf600t-ec-dock
+    then:
+      required:
+        - interrupts
+        - request-gpios
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      embedded-controller@19 {
+        compatible = "asus,tf201-ec-dock", "asus,tf101-ec-dock";
+        reg = <0x19>, <0x1b>;
+        reg-names = "ec", "dockram";
+
+        interrupt-parent = <&gpio>;
+        interrupts = <151 IRQ_TYPE_LEVEL_LOW>;
+
+        request-gpios = <&gpio 134 GPIO_ACTIVE_LOW>;
+
+        monitored-battery = <&dock_battery>;
+      };
+    };
+...
-- 
2.51.0


