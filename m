Return-Path: <linux-leds+bounces-7745-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uJktOi/d4WmtzAAAu9opvQ
	(envelope-from <linux-leds+bounces-7745-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 17 Apr 2026 09:11:43 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id AE41E417BD4
	for <lists+linux-leds@lfdr.de>; Fri, 17 Apr 2026 09:11:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 830F5301FCC9
	for <lists+linux-leds@lfdr.de>; Fri, 17 Apr 2026 07:11:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF33633DEE1;
	Fri, 17 Apr 2026 07:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cQD6PgRx"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E471333C19E
	for <linux-leds@vger.kernel.org>; Fri, 17 Apr 2026 07:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776409896; cv=none; b=In1xYqIQcgrc3I8CI8urfuT2qdhEoptRplFkK3CCnp96D6ZQfedSyEuvx7Akrnzt7krIOagUBxRwx4YDG4cOQ1bOFBCgXImLdmSBMX1D/3c4+iPa7qQAa8TD+nozfCGjlnXsYBv7uSt40AFK+zmYpbinZ44SqvAS7RWIw8/njdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776409896; c=relaxed/simple;
	bh=sJYSHWc09xFtiXGLxIY3eCmrqPgEujr443cRCV1hpP4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iNBQlM6ew92yFRIY9Q+RzEBgj7dlJ7kv3Xi6xnK8fL8XWMepjE4Vz1upI36vIyu288+Q/G+GpMJ8DDmkaQAxuFkRQOCxTR+mPiTyYxiugG+ujELEdM4aU8tk19JnnGcr+y1kuUouW/W6UMcgZbxM61kQkhIQHrl6TFpKCwOy1X4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cQD6PgRx; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5a10d130b37so337895e87.0
        for <linux-leds@vger.kernel.org>; Fri, 17 Apr 2026 00:11:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776409893; x=1777014693; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eV+WP61ShKOblE3anHz+BLN4XFN+aFPa0yNq3Cy5s6A=;
        b=cQD6PgRxb+3veKbVFBchJmNr/o/P57m7zd4gALCcOQJd9NmdOSUf/SA1PCokVdPib2
         h3gZ3m2/MOiKiDiGD3kEer7/eE+c9KK6ktDMHDf8YBLP2H+AVy9OgL/d8cNC/qogClCd
         hIIVRf1B7waeys7CymJ5xXi8PKV6ovZie2xVeCD2Yj49Pn2J8+Eh1JJcY2D9qSiMlpC/
         0T6kIvoBzxR7aVE+2/UQRJKWCWRHrGE2SS2vaGkGazCro9AeMzqW/E18aFuEfbH7XQYT
         ePfsXm9/wDKhyjXFZRwIyItJ51jJZdexoiRFx7e5XnLFyMWU8bRMi3RgJMAKnMuthhv1
         +0Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776409893; x=1777014693;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eV+WP61ShKOblE3anHz+BLN4XFN+aFPa0yNq3Cy5s6A=;
        b=XAgaFL1zuHMoKahloXo9em0EsuOEcuSNqPC8aHKQE0BwwM2Jyf06XxwFY3oEviVslU
         BbRAFm+O945naIdzY7/VuQo7lyY3BPhwrMsg0aMeZXoSn8FyWj8oMQ/1OgKbtll/nZGp
         H2PncOgCaK71NPj64cGnqVoKpZqHyQFnQJk+vTg82H9VBYqsBX2wacioElR+kkPUehyf
         cbSxCrNPsuRfeIa8obCCyVJe6LHEeVdLUS+ZPJ6N7TkbnbT/mhb8JSrYI3ni+GIuuVJM
         LWwpKB3CcFOJhtH3PruxIEbp/CpZUPZpVKV2uLA9W1Giz34zOnI6EFDL76Y/6+RreY4F
         nFsg==
X-Forwarded-Encrypted: i=1; AFNElJ9n2nmqRBklrLaCRXcFJA5VJC4fFVVdbXHBxdiVRxafNiidutrBwUVsp/C2+8FOHl3ZUko0AI7ZvHpr@vger.kernel.org
X-Gm-Message-State: AOJu0YyDAJJYSqc1mkf88+h3Cr4j3NdUC9l/bZo/ilbKdenqnpjktkYk
	8ouhMO0nCROnoBI4lX61/3IEK+r6zsiyFX7GRZ6ea0925jfBItbAUehz
X-Gm-Gg: AeBDievKAisLvLs4/huNokcWgdiJmSDWT/JIfF5AzhLfgjAJMrwSxHFNQi3ibMYd8to
	oVZKYiXMpdoSmcYbLLRUBOvzs73rkX3+mF3GMKxQ+Fn2a6SVsWw6xvrQpD++gWQFZmqhf8vGK19
	wdExh3Vt3wPlO36Eb+4W0TFC7x3ItpTbfu+GFTEBMR9LHYY2g1HZ1c6d9iCAjKVyDdlFk8rWE4w
	go8p9++B/YM/QUjfh1Hyg8EZpqEqEJYGADV+AeGl7P5LO7toB/sJcxT0C0xEpd1M/sEi9SNslBF
	trktWBSMSTzVHmKeIyfJDjQQoEINHHvq5CqpTVM15V9K2Cy6D4A9QV4xPufCgaHwHObBDxsYHgX
	2SXiDL8wSQ45nq8dPOjIx5A9mmlXEkBJAAf3Cs1ixo0m0Nb6TjxUKvBKphlK46zytDDYV4YGDPl
	0VN/6ATg6hKk3PNGJ8ScJlw7E=
X-Received: by 2002:a05:6512:31d3:b0:5a4:156:aea3 with SMTP id 2adb3069b0e04-5a417174a77mr492829e87.7.1776409892978;
        Fri, 17 Apr 2026 00:11:32 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4185bc240sm162772e87.23.2026.04.17.00.11.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 00:11:32 -0700 (PDT)
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
Subject: [PATCH v4 2/6] dt-bindings: input: cpcap-pwrbutton: convert to DT schema
Date: Fri, 17 Apr 2026 10:11:02 +0300
Message-ID: <20260417071106.21984-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260417071106.21984-1-clamor95@gmail.com>
References: <20260417071106.21984-1-clamor95@gmail.com>
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
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-7745-lists,linux-leds=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.988];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: AE41E417BD4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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


