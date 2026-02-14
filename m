Return-Path: <linux-leds+bounces-6940-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MF04Iaq6kGm8cgEAu9opvQ
	(envelope-from <linux-leds+bounces-6940-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Sat, 14 Feb 2026 19:10:50 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D4FE413CB52
	for <lists+linux-leds@lfdr.de>; Sat, 14 Feb 2026 19:10:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 497733018D50
	for <lists+linux-leds@lfdr.de>; Sat, 14 Feb 2026 18:10:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1EDA30FC1D;
	Sat, 14 Feb 2026 18:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ODBjkYYD"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com [209.85.218.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3037301708
	for <linux-leds@vger.kernel.org>; Sat, 14 Feb 2026 18:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771092621; cv=none; b=fvvt8U8Ww28ZFwntTnxKIn1ACHy3oHcJ6Uhz8Z+B7vZe/+V9dI4glhzrK8lRA24czZc1yvwzOQZkiq/HI0HGKY9uXIciXRYHcjqR1G/IcI3gYLfpnHcOIZarhiSTpXZzlBmhawm7wAw6XbJdoSUeYwsMeqbBbps+YaTQ3vCkyw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771092621; c=relaxed/simple;
	bh=QZTJEwKYzV2sVRqc06XpTa0kqL6atv45Fiv22ciLWLc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EqrsXcs64QEKz+vUuwnyg0xD/L0kWxVQSf0zoeMU+wO4o71haJMdt/JdZo3T1UHNGbuWzJLywk7lzeBSS404Uo+RVMrEn1CObF9kyAhDsBbTLhlsyRY5rT35DMLXCuZEJOtynBv9NKwcmgKLfTgGDRWu8gsNfeylQfDgky7s224=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ODBjkYYD; arc=none smtp.client-ip=209.85.218.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f67.google.com with SMTP id a640c23a62f3a-b8fa449e618so243118366b.0
        for <linux-leds@vger.kernel.org>; Sat, 14 Feb 2026 10:10:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771092618; x=1771697418; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lWhSjDBNQ6gvdK4qfNH6bG1uloMhrN0yff4wPN7T5UQ=;
        b=ODBjkYYDEsgb4K3M/ZMvkTV37qtS4lO/SwQOY1Yqp3P2KEo4JxBtRoL3vlVx7ihLmZ
         ejQWJM3xnSeCNxtNTFj4BsxXbMw11quDSoAqKlmXYmoisOaCRoNdHMUvLTvJhVMClfnY
         Zy/o8BNzetho3EQlhNW3iqwIADDNX93B1nwMyFklZfLdzcDEQRzw0dXLfUzNFlK6cKKp
         TsjSxpCsIPl4IdMydx3J+bIVTEIl4YZfUygUVqMUihVfDvIzyXuEuD1phL/p51DTZKwk
         stFDeo5qMSFfrmt7lXlWpOigotIYRbsYmAuP2AyXvOIKqqOZ7lCG25BiHoQCSow1Pxqk
         +3Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771092618; x=1771697418;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lWhSjDBNQ6gvdK4qfNH6bG1uloMhrN0yff4wPN7T5UQ=;
        b=UXBohtCwfYnMjBdWcCFgXbWy54lrJYgbAirK+R7k1gXQq+BQbd2MiqoA05OLVtcAn1
         g/vsoCi7V4piCgYpu5e+P4DPq9z395UnzVPYH5dnLYq+gE3brHnq0sgUct5YyQ1l0FHs
         oBghmEK/e2q+YU0flLNlAnoHNGmrKKdEjPpNRCqzgCxbCPl+mkfR8XdrpjCkAiDtsYwR
         c7+TM9IMTmyvWUZrzqw3BW6oGLW43LW07tOfCNHT/392Vf1zB0/YvUkbz5G7AWisC/aF
         EQiEFNL1cBIyjfb9RmKO2b7u6pIhazjUOMibbok3GRjwXnSxShBreoWaFP/Ygac0j24V
         JfTg==
X-Forwarded-Encrypted: i=1; AJvYcCVeahwDi7Az4emWUsRuPuf/3oVNB4MvCG4pyxVWh8HnUF2b5S/3uF6BYx0CrhqZsDtuQW+LXhRMw8fe@vger.kernel.org
X-Gm-Message-State: AOJu0YyEp6Msj3oAfVufiP8QnGOxkqucrPTkH6OKbj4NNkz8OW5Cix4C
	CRK3NkgZTjfqPjtDRBlEI++a6w5AKwHb4ZOmFywgWzizgzb4ZyHeHA2D
X-Gm-Gg: AZuq6aJ1feIpnoE2Rvay55mQVow77F53OXZb3vHAf+45JMBUydpbnBZy0nNeWSzRq4m
	MiKDSxulpErsyNoPDlAXsuf8KBYafql6HlmByttamUfMuZX5mjy7OnoCljNni9LRPt8j+/gIzMT
	1XwLJOX0KcmCSZXzQb6jQUOS+szgPRqTkF78iiC2tydlwa/NLm04DN3WbxqO9icYZB0hUkN4p2W
	t6zTtUqDWuWqR0I4n+H+5wxJbU8uEqF8tLyZs8S3fta5C8oHQziBWNKgf70qryMZJtBcBHNASrm
	ba5bQhqvfLnTfno/jmB/7pV4JvDPtjqOgpIsZMHvHc9Kcfzmk6zjTOdakIr6xQY6y7W3EbIN4kS
	B69ALr5TQz27Vf77JW7IsIf7IfDJg6UJvUeTDjuHVG8g07KUd7j8vVUCw/ODvXvMiJidXH07bxJ
	IByabNbURL3xdr7ZPNKg5YDrk=
X-Received: by 2002:a17:907:3e8d:b0:b8f:b32e:e1b4 with SMTP id a640c23a62f3a-b8fb44a8219mr338323866b.42.1771092618132;
        Sat, 14 Feb 2026 10:10:18 -0800 (PST)
Received: from xeon ([188.163.112.48])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8fc735e506sm88122066b.11.2026.02.14.10.10.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Feb 2026 10:10:17 -0800 (PST)
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
Subject: [PATCH v3 1/7] dt-bindings: embedded-controller: document ASUS Transformer EC
Date: Sat, 14 Feb 2026 20:09:53 +0200
Message-ID: <20260214180959.30714-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260214180959.30714-1-clamor95@gmail.com>
References: <20260214180959.30714-1-clamor95@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6940-lists,linux-leds=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,agorria.com,rere.qmqm.pl];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	DBL_PROHIBIT(0.00)[0.0.0.19:email];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,devicetree.org:url]
X-Rspamd-Queue-Id: D4FE413CB52
X-Rspamd-Action: no action

Document embedded controller used in ASUS Transformer device series.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../asus,transformer-ec.yaml                  | 98 +++++++++++++++++++
 1 file changed, 98 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/embedded-controller/asus,transformer-ec.yaml

diff --git a/Documentation/devicetree/bindings/embedded-controller/asus,transformer-ec.yaml b/Documentation/devicetree/bindings/embedded-controller/asus,transformer-ec.yaml
new file mode 100644
index 000000000000..670c4c2d339d
--- /dev/null
+++ b/Documentation/devicetree/bindings/embedded-controller/asus,transformer-ec.yaml
@@ -0,0 +1,98 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/embedded-controller/asus,transformer-ec.yaml#
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
+allOf:
+  - $ref: /schemas/power/supply/power-supply.yaml
+
+properties:
+  compatible:
+    oneOf:
+      - enum:
+          - asus,p1801-t-ec-pad
+          - asus,sl101-ec-dock
+          - asus,tf600t-ec-pad
+          - asus,tf701t-ec-pad
+
+      - items:
+          - enum:
+              - asus,tf101-ec-dock
+              - asus,tf101g-ec-dock
+              - asus,tf201-ec-dock
+              - asus,tf300t-ec-dock
+              - asus,tf300tg-ec-dock
+              - asus,tf300tl-ec-dock
+              - asus,tf700t-ec-dock
+          - const: asus,transformer-ec-dock
+
+      - items:
+          - enum:
+              - asus,tf201-ec-pad
+              - asus,tf300t-ec-pad
+              - asus,tf300tg-ec-pad
+              - asus,tf300tl-ec-pad
+              - asus,tf700t-ec-pad
+          - const: asus,transformer-ec-pad
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
+  - interrupts
+  - request-gpios
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
+        compatible = "asus,tf201-ec-dock", "asus,transformer-ec-dock";
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


