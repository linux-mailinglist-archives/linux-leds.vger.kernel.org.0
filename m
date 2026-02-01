Return-Path: <linux-leds+bounces-6806-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4K2rG8Auf2kglQIAu9opvQ
	(envelope-from <linux-leds+bounces-6806-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Sun, 01 Feb 2026 11:45:20 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C687C5812
	for <lists+linux-leds@lfdr.de>; Sun, 01 Feb 2026 11:45:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 93633302DF68
	for <lists+linux-leds@lfdr.de>; Sun,  1 Feb 2026 10:44:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61AB2329378;
	Sun,  1 Feb 2026 10:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HcJhkolq"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECF563254BD
	for <linux-leds@vger.kernel.org>; Sun,  1 Feb 2026 10:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769942658; cv=none; b=dkhwIFpgy/ONtxWD9xTaSPtaB2QMdkDh+2DwOt5rN3nGt9/0Iwek+2EhYqj0vrOHZ3yjOveB90fC8N3mGn/+I1B7tW5nzA/BTKVjCx7dgAropHEe3AODDy+fDzoAyGu1CUnOPc0yCExX1kiDQQdiLF4jnF0RWV5ZBDP+kDiHAsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769942658; c=relaxed/simple;
	bh=0N+pk2TI+JtovuI3l2xhTK/qQ/ayuu1+Gg+HuId26qk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DxrtdGuL1nmzYo16uICobpQke/khqFjzCg3kUgermfn+CBPwdJlTuMUhotfz9CeUUH5/E5btJW8oDRiuqXu4FE+uhrOHVEytR59KJkr0OnoRMANEfDkIarxjFHa0wAeOR2egZUtRYUNEjFzZvYlLVmn91MXRhk/oVFZdJnurPW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HcJhkolq; arc=none smtp.client-ip=209.85.128.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f65.google.com with SMTP id 5b1f17b1804b1-47ee2715254so18663355e9.3
        for <linux-leds@vger.kernel.org>; Sun, 01 Feb 2026 02:44:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769942654; x=1770547454; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tIkuCcLFcESeg4evD7K33beEJL3vgA15kSHNr6N6YkQ=;
        b=HcJhkolqx7Nr4774jKrYtvbesalaQ38nWA1bXtBl3+Kwtzvdk0i+0715eFIoH2NrMf
         q6KsdfSU2o/vvgae2N2ysr58FEMvi8nVSWew+S8mckqnkYzh0Ri8KHOqQbdiu4Mxp5XJ
         TTf3vwZJLCQYZxp10xADD6amI731nKONjpm5fnaXDSznJjDf2MVwheHo0Q8hljYuLwG4
         H985BCeSVru6DArpR9Icfi5c2UnToqJfkWku/j5jDcPUZYr6W8nh+ICxCTXVU82Ujh6b
         KO6AwhhmWcLAe1Aw5sW4cWRFmIZDIKyVtkkNdOl1v/FfmHNBh6gvkJXLXBmhEvEbYtab
         wMCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769942654; x=1770547454;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tIkuCcLFcESeg4evD7K33beEJL3vgA15kSHNr6N6YkQ=;
        b=ALBPctj9Y/SMFlyIyoF2witgPBIelHsxDjOaq/jXmzfMo2p/eAeE1e/iQGhvI670q4
         oZS5UZhyFtqOXgnHrSGJSqWHBK5qhVXI9Sh1rKLdXNp/yKfYE+Yor8Wj/Umy4TWrNc6M
         Izvp5ueNWG2H3+DssK0ot6eUZ8RbiJqvS9XFQDGHi/QHjzKShyjy1rspAhwRzryuHvNu
         NEt6lMJ3k8dN/jvd2xToY5TjBfEw6bw/9MaUfpp9XUL1jO7ih0Ycls780aJA1MoOyj35
         9stysjxJ+SI6ARKEKhjMaxiCRd+a+cwLHKZp0Z1VZeoz5tU+vhyQGBwkS2mzM9L3MW7C
         85MQ==
X-Forwarded-Encrypted: i=1; AJvYcCVo9he6K7oRkckUYMYWCGfRKDF7AH4oPtwxnfs9btz4z9CS0KTbt3dmxU/qY8phzwAyOKllXLrSLld/@vger.kernel.org
X-Gm-Message-State: AOJu0YyA0pBgZt6ZR6xnNmSSwikJ3mq6UFaTrSaGxaMs9QFyAsERMXj7
	8b8lJvz4bRvAvfu6GsNAkX6n8DPCt2pVYXTVdnD14/QZef74sbNd8jmi
X-Gm-Gg: AZuq6aKoMGys38CPtWsIgJfRivfP/W9ulkLNgVog/GwGaEEeCPKFjjZP/+b6nfGhs9E
	EQCeiQYNKcQ+8fCE4NHoUNMjUK2U3rzq7eYKMxmLat8LvqnJ4r+CaplP5VBjAukG3N5nflKBrt0
	hJvgmlEKAGT5BefuRvZT3ofOOhFSm5NH/HixXfhNPZXjcJJ9CauAdD+GZqxCW6lvxb0MPSUslPI
	xmb5uVLu53pQr21lQUktPw+UYa057aG61wViOZ4H53trV2tk3E4NAiNpxg03WNDL9MK09+dz0E9
	TX3R2Fa/M8Olh6piLf0VpcX0ckcZ8YkgorHr1tNe6HDgsHa0pFs2BNdc2fFssfIo8HE3wN2q20m
	yaw8nWoTJQY14Lb1yWodeF3WkGp4ZD1c51GZF82M89FbvcPGSFtXBQBWwXTbRma48noE1HalAlU
	NI
X-Received: by 2002:a05:600c:3b1d:b0:477:9cdb:e32e with SMTP id 5b1f17b1804b1-482db46014dmr106028315e9.9.1769942654259;
        Sun, 01 Feb 2026 02:44:14 -0800 (PST)
Received: from xeon ([188.163.112.49])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4806ce56490sm308947455e9.12.2026.02.01.02.44.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Feb 2026 02:44:13 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Pavel Machek <pavel@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sebastian Reichel <sre@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	=?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
	Ion Agorria <ion@agorria.com>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-leds@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: [PATCH v1 3/9] dt-bindings: mfd: document ASUS Transformer EC
Date: Sun,  1 Feb 2026 12:43:37 +0200
Message-ID: <20260201104343.79231-4-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260201104343.79231-1-clamor95@gmail.com>
References: <20260201104343.79231-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,arndb.de,linuxfoundation.org,rere.qmqm.pl,agorria.com];
	TAGGED_FROM(0.00)[bounces-6806-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	DBL_PROHIBIT(0.00)[0.0.0.19:email];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,devicetree.org:url]
X-Rspamd-Queue-Id: 2C687C5812
X-Rspamd-Action: no action

Document embedded controller used in ASUS Transformer device series.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../devicetree/bindings/mfd/asus,ec.yaml      | 153 ++++++++++++++++++
 1 file changed, 153 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/asus,ec.yaml

diff --git a/Documentation/devicetree/bindings/mfd/asus,ec.yaml b/Documentation/devicetree/bindings/mfd/asus,ec.yaml
new file mode 100644
index 000000000000..5c28deebce7b
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/asus,ec.yaml
@@ -0,0 +1,153 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/asus,ec.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ASUS Transformer's Embedded Controller
+
+description:
+  Several Nuvoton based Embedded Controller attached to an I2C bus,
+  running a custom ASUS firmware, specific to the Asus Transformer
+  device series.
+
+maintainers:
+  - Svyatoslav Ryhel <clamor95@gmail.com>
+
+properties:
+  compatible:
+    oneOf:
+      - enum:
+          - asus,ec-pad  # Pad part of Asus Transformer
+          - asus,ec-dock # Dock part of Asus Transformer
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  request-gpio:
+    maxItems: 1
+
+  asus,dockram:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: I2C device used to access power related functions.
+
+  battery:
+    type: object
+    $ref: /schemas/power/supply/power-supply.yaml
+    unevaluatedProperties: false
+
+    properties:
+      compatible:
+        const: asus,ec-battery
+
+    required:
+      - compatible
+
+  charger:
+    type: object
+    $ref: /schemas/power/supply/power-supply.yaml
+    additionalProperties: false
+
+    properties:
+      compatible:
+        const: asus,ec-charger
+
+      monitored-battery: true
+
+    required:
+      - compatible
+
+  keyboard-ext:
+    type: object
+    description: top row of multimedia keys
+    additionalProperties: false
+
+    properties:
+      compatible:
+        const: asus,ec-keys
+
+    required:
+      - compatible
+
+  led:
+    type: object
+    additionalProperties: false
+
+    properties:
+      compatible:
+        const: asus,ec-led
+
+    required:
+      - compatible
+
+  serio:
+    type: object
+    description: keyboard and touchpad
+    additionalProperties: false
+
+    properties:
+      compatible:
+        const: asus,ec-kbc
+
+    required:
+      - compatible
+
+  asus,clear-factory-mode:
+    type: boolean
+    description: clear Factory Mode bit in EC control register
+    additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - request-gpio
+  - asus,dockram
+
+additionalProperties: false
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
+        compatible = "asus,ec-dock";
+        reg = <0x19>;
+
+        interrupt-parent = <&gpio>;
+        interrupts = <151 IRQ_TYPE_LEVEL_LOW>;
+
+        request-gpio = <&gpio 134 GPIO_ACTIVE_LOW>;
+        asus,dockram = <&dockram_ec>;
+
+        battery {
+          compatible = "asus,ec-battery";
+          monitored-battery = <&dock_battery>;
+        };
+
+        charger {
+          compatible = "asus,ec-charger";
+          monitored-battery = <&dock_battery>;
+        };
+
+        keyboard-ext {
+          compatible = "asus,ec-keys";
+        };
+
+        led {
+          compatible = "asus,ec-led";
+        };
+
+        serio {
+          compatible = "asus,ec-kbc";
+        };
+      };
+    };
+...
-- 
2.51.0


