Return-Path: <linux-leds+bounces-6985-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mNMMGWT0m2nj+AMAu9opvQ
	(envelope-from <linux-leds+bounces-6985-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 23 Feb 2026 07:32:04 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D1460172224
	for <lists+linux-leds@lfdr.de>; Mon, 23 Feb 2026 07:32:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A773A3029C03
	for <lists+linux-leds@lfdr.de>; Mon, 23 Feb 2026 06:31:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A918F3491F5;
	Mon, 23 Feb 2026 06:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="exVVAmtN"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com [209.85.167.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 220D0345729
	for <linux-leds@vger.kernel.org>; Mon, 23 Feb 2026 06:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771828293; cv=none; b=syYNJYHRi+LLQKe3DTm4ml5tDFDrpzJasXI1IGW6aaIpURERZPc4uZxZsmkEJLGGG6AOVBtma3jfbaIIdmZ8tuzVlfui8afqgN8tyXzVt+0pkSN9UdwtIllQAwkc/dptK/eCGl8BgRXGMloCun5YirILD7qQVg7orhoK6p7T26g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771828293; c=relaxed/simple;
	bh=fvsNiW04qW3AIrTi8INmyEkzbGKGRZylVzn1kRv9504=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TbraISeeuS3ZayldtTxgXJBqtbTy2CVkeizEfUxGQY+rLfmBhx75RfARV41KialBibQ/dyPhjgQ1a8lnMRO+jbaUYwjQtEoZOhOaYiDfiyjtTPq1s4r12CYssm4XLZbso1KORBjRC0s7JZ5tiEkuQS1lTYb+qSoybQlyEXrzgyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=exVVAmtN; arc=none smtp.client-ip=209.85.167.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f66.google.com with SMTP id 2adb3069b0e04-59e5bfa4f33so3758001e87.1
        for <linux-leds@vger.kernel.org>; Sun, 22 Feb 2026 22:31:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771828289; x=1772433089; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=baZZ3I83Z7duoBmCyUC4MTXvnHqhUiDCw7gdIgcx7ZU=;
        b=exVVAmtN0qT61Z99T6Ogq1td5k9DMeVl3n24HmPpDe5lOXpofT2UNhmDTzmrg6mQA4
         SsX2Y9ld/dUxZbFoloLiDCh0kaChVRmLdMOyuew5wyr+EYpHfd7RhYmGCkojaaabys8h
         lf1FYGkzUjRjJ4Q7/wilO0toR7DKARkJGD5p6yyzTX64GIQeDuIGKQySFD1gebcnkljq
         LO0SGDv+gBmUJdCzpMFOq3wS7Y6TIqY+fCPQJLCKNZ04HINENuoz1f2X/MGZzAdPqbAh
         MmYMbC7hr+IpgpAOZMWyH6NPD21MMvNg+uUpx3saGtPCxSWqgOyIEMALZvmSBrAFehZf
         qy8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771828289; x=1772433089;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=baZZ3I83Z7duoBmCyUC4MTXvnHqhUiDCw7gdIgcx7ZU=;
        b=eqCjejFEhvhciN77gFqT5tdVZTrV3XseKQEEIsUpR0DfAN4Bl1g6VvFTcpu39kncrD
         ZqHf3ds749s4CtumCGGNIjv8g9I92huB4usMB1AbVsSjRfFGyDqn1LfRNl9/Wga/uBOG
         PH50vs17PegAZQ5MS7D/9n3GrukHULG2PleCr5z9mrWcTQURaFEO8HbZ8MZKUQIP93d2
         aWl/eh9g07mWBGzUdz2YAveTl2ElOohy++JmllBSvTnP/GAOiJ/wBFGZqqZPScq6RDqj
         8Sn5V+KlBf6lvwh3v4rjR7u8ylHOlAYJGg7lPZbKVCepEVRnQGm6zE8atqXV4WtnMm8/
         aVnQ==
X-Forwarded-Encrypted: i=1; AJvYcCVeSnpalqFCDmLfJAnp4DJW0lPWJmcePeVkAI96SoiKn/P2aI0445xmK/fWz+ZP/XD1q7/vOiGkfaCM@vger.kernel.org
X-Gm-Message-State: AOJu0YwcHr0dBeoXLobc3uAHhbYw5qHnw/Jwe7J6hI+Z+0udK2CBplO+
	15dSbo1HrirbVPB6WbfFAeJGhnYLYYXaJ2MU8s7CficvIg5P0pUmJ0Cy
X-Gm-Gg: AZuq6aJq5dR92EFJ1/YEtdojAU5BTRTZpFKyVuWNwcvGi2o0qI0vX/PlW08nyVVRKJi
	q6ctBg2JFo41HCLnLomtUfCXAfLwbZnSA71KhO0ePx5TcvERnpybtPStJnSj/sI00jaic4yL5O1
	E6CHZzNKFnBD9HqrvKcWUHmvSRuuHjP5ANKAtgVOk6JzNScP5HaRoH/A6kL5Wi6tkm+hfuHq6Mr
	UFqURktPjtxSnTERXQ/E92W/WLz6ft21BNhVEcIU7dCEb1nIsdIfYXlxCI7qsnWzB/QOUrXhfFj
	3q9SGnP28wpnRrakH9qh3rq7De3VL9/VklfFYh1C5c8Yuu33+gfsEsbpEnRd7HfiqQeGKcsOjuo
	dBauFQnzzWsTvxoQoN0ZpMDCmr0Fo7V8P4lLYQGlyg/s3Km7zTo0Rg6w6EqHDCufwBNFUPeaJ0f
	oWV4Sr8w4uYdDH
X-Received: by 2002:a05:6512:4007:b0:59b:6f3a:9c80 with SMTP id 2adb3069b0e04-5a0ed8a5136mr2397079e87.23.1771828289037;
        Sun, 22 Feb 2026 22:31:29 -0800 (PST)
Received: from xeon ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a0eeb14596sm1361320e87.26.2026.02.22.22.31.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Feb 2026 22:31:28 -0800 (PST)
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
Subject: [PATCH v4 1/7] dt-bindings: embedded-controller: document ASUS Transformer EC
Date: Mon, 23 Feb 2026 08:30:53 +0200
Message-ID: <20260223063059.11322-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260223063059.11322-1-clamor95@gmail.com>
References: <20260223063059.11322-1-clamor95@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-6985-lists,linux-leds=lfdr.de];
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
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,0.0.0.19:email]
X-Rspamd-Queue-Id: D1460172224
X-Rspamd-Action: no action

Document embedded controller used in ASUS Transformer device series.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../asus,tf201-ec-pad.yaml                    | 105 ++++++++++++++++++
 1 file changed, 105 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/embedded-controller/asus,tf201-ec-pad.yaml

diff --git a/Documentation/devicetree/bindings/embedded-controller/asus,tf201-ec-pad.yaml b/Documentation/devicetree/bindings/embedded-controller/asus,tf201-ec-pad.yaml
new file mode 100644
index 000000000000..6a61c88f9046
--- /dev/null
+++ b/Documentation/devicetree/bindings/embedded-controller/asus,tf201-ec-pad.yaml
@@ -0,0 +1,105 @@
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
+allOf:
+  - $ref: /schemas/power/supply/power-supply.yaml
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


