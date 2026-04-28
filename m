Return-Path: <linux-leds+bounces-7888-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IAzOHqrU8GkSZQEAu9opvQ
	(envelope-from <linux-leds+bounces-7888-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Tue, 28 Apr 2026 17:39:22 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D31B54880FF
	for <lists+linux-leds@lfdr.de>; Tue, 28 Apr 2026 17:39:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EB94630DE935
	for <lists+linux-leds@lfdr.de>; Tue, 28 Apr 2026 15:36:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 100373A0B01;
	Tue, 28 Apr 2026 15:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lKQxq5RZ"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3055C3A6F16
	for <linux-leds@vger.kernel.org>; Tue, 28 Apr 2026 15:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777390599; cv=none; b=YpR0vJ0O0q4rCbg/73sW3/jD2IywYepCOisq7kHROtpZPNTkjPieJNEQF9m15PPD08uy6zoPutErvipFqSUQSYF6KMDNWjyrgzHNAnsYnfPeKHNB7bjAudIsFCs5AgqzvkHzgrzAKzEH6pmr5KSDh71TKwEjmPE/eUuzMm9kYlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777390599; c=relaxed/simple;
	bh=sJYSHWc09xFtiXGLxIY3eCmrqPgEujr443cRCV1hpP4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WvfSod/Z8qSS/56Xp5O03CFOmGLhEd2CyihfG5UOvCS2ol65WarRbg+V2W0//lQDMYdErmCNNiZ6K+A/z1sDHnjLBrZ3VFmJNuXfmq3bd0S95zCdrlyvadnsTtWj9AmA2WQ1q5nNvlk71J1Yr2g5U4GK5DMdBP4EGew4OkT7EMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lKQxq5RZ; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-488e1a8ac40so142782735e9.2
        for <linux-leds@vger.kernel.org>; Tue, 28 Apr 2026 08:36:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777390597; x=1777995397; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eV+WP61ShKOblE3anHz+BLN4XFN+aFPa0yNq3Cy5s6A=;
        b=lKQxq5RZnkQ4Hi3yGJe+jF39DGat91RyckNI+sUpdg7kG8ih0pSRMGlSN6wE/xPoJB
         XZQBA35MHWCkYVlGgs8Jg6vYIOVkWRzzR5Bp5Zbd4Cu6Wa70pWNPEhGDQ8HnWfJcgvbo
         0NvxOqbvbORZTRL7hQIHKjAobwwiv8X6Vbs0JxXIn2U1yKbGz9nZtLxb1Hh6GkLyhzX6
         wSLnFMt67jwc2nOAFKE3uYH1c3KIJLKMsZxBFh2KQ9rG0Tt23HZbus9So7q3ZEckLDlu
         6PkAaBgqDaibVHLW6/vXUxAifQLuLDiuTPXpNrHA0cMhqa6ZZCG4xK2Nrh2/2u87L2kl
         BFGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777390597; x=1777995397;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eV+WP61ShKOblE3anHz+BLN4XFN+aFPa0yNq3Cy5s6A=;
        b=tPAyyieEdVO5zPUJ7FQLX7mFmm/y6ugXQtAUMNMrq+8dfozGEYUmIEDcyGTxW0zKou
         XgtGWKWPIehOq72Ka3UQLcG10zsAhJrMn2CBSByLPvqDuoCrG+CaQtlziKSwJD32zW44
         WnhVZRABGYH5YtzIvStknW2pRaw2ifrqbHO/L1LuJ4I0tdYnQ1svZTjkboiMJBGvIGBh
         UV1tHTBBVEelyn5l/YWqx5ghXwvaRjk4nZjo50c91scvOfzX7gouSMNQ82wJXc2bqozn
         Gb0MYXmUSLa7tqHVg0cP1NNnOcK+RJAov+oeggzy1NMwnx0WWMWJwOzQUoZSyzOM9v/x
         DE2Q==
X-Forwarded-Encrypted: i=1; AFNElJ+vyHlm8LTayLbbDQRmATQdbpSb7+tN016+t3+255Q9TqMEEuHWIIdmBaQPnPtERTyV+znzX3kZ7SAg@vger.kernel.org
X-Gm-Message-State: AOJu0YwXK8ZEHMTM6nrW+I6oPbP+ds8mUx8pTnRflP5Y+mvckaMdSYDc
	2A7BG0E1/JesaOlldSs8WCXs8xsfqt44sTrgUNWcMnWfsrsFKjDDbklo
X-Gm-Gg: AeBDies8Gz+Gl3RaU/y8elU4aj6Ov7LoXlpuP6iuqRf8wQRwOhgV8eh+ySenqcvHzW/
	Z6HYFPqdS5I6GSmCogu0L9osMxv1nt4peIVSkb/GnjnSivpgDqaNulzCWZuowyfX6p1TngNVt8C
	nXxM9iwGO7uZ7FDivOnLNp0BeqTQjRfSHyTjcs+bS3DBi/JrUezsDhXqb0fU9ADrHVTNuYG88gD
	MeuQ68TQyMoK4E+tH01JkOYklTYID8iI23lHSarHtA2Y2nBveIckasi3tl78Dsymnl3CpRv+yyR
	H2tyKmhlB6hS7R3hxd4i3OZZoWL/HQGXi54J1QT68KpbsIU7b1BP37uO4eA09Kdv1zf/fjj/+XP
	4OvVppJI0EBf/1Tyb4tiERf+X/5eHy6GgXzgXV/gfPW1GGJGawQhR9XHMIlXed4sVSlV8lgKycD
	QtGuwWaDE5V6Im7ziGUuLl2M4=
X-Received: by 2002:a05:600c:4745:b0:488:9bf8:7f17 with SMTP id 5b1f17b1804b1-48a77b054d8mr51874665e9.14.1777390596486;
        Tue, 28 Apr 2026 08:36:36 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a7b56c2d0sm1358875e9.11.2026.04.28.08.36.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 08:36:35 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	David Lechner <dlechner@baylibre.com>,
	Tony Lindgren <tony@atomide.com>
Cc: linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org
Subject: [PATCH v4 2/6 RESEND] dt-bindings: input: cpcap-pwrbutton: convert to DT schema
Date: Tue, 28 Apr 2026 18:36:07 +0300
Message-ID: <20260428153611.142816-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260428153611.142816-1-clamor95@gmail.com>
References: <20260428153611.142816-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: D31B54880FF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-7888-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,baylibre.com,atomide.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,devicetree.org:url]

Convert power button devicetree bindings for the Motorola CPCAP MFD from
TXT to YAML format. This patch does not change any functionality; the
bindings remain the same.

Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/input/cpcap-pwrbutton.txt        | 20 ------------
 .../input/motorola,cpcap-pwrbutton.yaml       | 32 +++++++++++++++++++
 2 files changed, 32 insertions(+), 20 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/input/cpcap-pwrbutton.txt
 create mode 100644 Documentation/devicetree/bindings/input/motorola,cpcap-pwrbutton.yaml

diff --git a/Documentation/devicetree/bindings/input/cpcap-pwrbutton.txt b/Documentation/devicetree/bindings/input/cpcap-pwrbutton.txt
deleted file mode 100644
index 0dd0076daf71..000000000000
--- a/Documentation/devicetree/bindings/input/cpcap-pwrbutton.txt
+++ /dev/null
@@ -1,20 +0,0 @@
-Motorola CPCAP on key
-
-This module is part of the CPCAP. For more details about the whole
-chip see Documentation/devicetree/bindings/mfd/motorola-cpcap.txt.
-
-This module provides a simple power button event via an Interrupt.
-
-Required properties:
-- compatible: should be one of the following
-   - "motorola,cpcap-pwrbutton"
-- interrupts: irq specifier for CPCAP's ON IRQ
-
-Example:
-
-&cpcap {
-	cpcap_pwrbutton: pwrbutton {
-		compatible = "motorola,cpcap-pwrbutton";
-		interrupts = <23 IRQ_TYPE_NONE>;
-	};
-};
diff --git a/Documentation/devicetree/bindings/input/motorola,cpcap-pwrbutton.yaml b/Documentation/devicetree/bindings/input/motorola,cpcap-pwrbutton.yaml
new file mode 100644
index 000000000000..77a3e5a47d1a
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/motorola,cpcap-pwrbutton.yaml
@@ -0,0 +1,32 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/motorola,cpcap-pwrbutton.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Motorola CPCAP PMIC power key
+
+maintainers:
+  - Svyatoslav Ryhel <clamor95@gmail.com>
+
+description:
+  This module is part of the Motorola CPCAP MFD device. For more details
+  see Documentation/devicetree/bindings/mfd/motorola,cpcap.yaml. The
+  power key is represented as a sub-node of the PMIC node on the device
+  tree.
+
+properties:
+  compatible:
+    const: motorola,cpcap-pwrbutton
+
+  interrupts:
+    items:
+      - description: CPCAP's ON interrupt
+
+required:
+  - compatible
+  - interrupts
+
+additionalProperties: false
+
+...
-- 
2.51.0


