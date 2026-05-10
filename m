Return-Path: <linux-leds+bounces-8067-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MJEBBmJnAGq1IgEAu9opvQ
	(envelope-from <linux-leds+bounces-8067-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Sun, 10 May 2026 13:09:22 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 84325503BB3
	for <lists+linux-leds@lfdr.de>; Sun, 10 May 2026 13:09:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B3C623016525
	for <lists+linux-leds@lfdr.de>; Sun, 10 May 2026 11:08:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CB9636683B;
	Sun, 10 May 2026 11:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DWBsWxYM"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 748C337E30F
	for <linux-leds@vger.kernel.org>; Sun, 10 May 2026 11:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778411316; cv=none; b=EvMt2XcxE1D8qvK9D8QJKy1rryJLUWF7cNQLOjA69vDrrcueSmiDKdM1nO+OYWzgNcVTK0lTtjFP8jdjXKvqzWuFKH+ZklQQTNmEpTl52WlAh+jouZPWzQ9S1peoX4Nk+zbpo4ONT/bBC6GD39JyXiRe1RftL4KPhEha1oQJcxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778411316; c=relaxed/simple;
	bh=sJYSHWc09xFtiXGLxIY3eCmrqPgEujr443cRCV1hpP4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Mg5JMt87bmpVumrumsQK1/+xp/MJExCGNYCd/qOZRpEOo1IxCdHVWdsQD2I1+PeD1anmd+79s3d+qf70d9k4cD0foGr6Pce7thPDnoQqLQuIJok+pMOiNY7mXIEp6DTLJTbM+T8xWcabNrLhin4CT43AnjGpYfYGMB3jJFnHBLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DWBsWxYM; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-bcc9fdc959cso123768066b.2
        for <linux-leds@vger.kernel.org>; Sun, 10 May 2026 04:08:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778411313; x=1779016113; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eV+WP61ShKOblE3anHz+BLN4XFN+aFPa0yNq3Cy5s6A=;
        b=DWBsWxYMGAhcf2Jk9YXOqN6RrcAylX4Mkla1Z+g+GcjEkPeL1aVmZxomntrkdNaex/
         dZrzMLD/LH74AnOBlxcg3/DEj77+KhKTBD5mCgQT4pFWjh0karoI7ckTssOr5TnVOpfO
         dxg2/v8MI4vpNdB4bjzViFl1t/elptghzMbGTUjTQpEqzGeP4FmGBxaNCXoQpgLbnrJd
         BsFAf8zPQtA7lbfC0Coc0Nb7yNE4EKZTxDZJkOFW6/L8YkmEy8Ki5WiD2dw4khI8MQa9
         c39l2PbZ6vPSEc6PYHOEkFyBj5UjLDYXHGQZPNlvQgzihzFUA1Vz2svV6OndKe6E+sSL
         TReQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778411313; x=1779016113;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eV+WP61ShKOblE3anHz+BLN4XFN+aFPa0yNq3Cy5s6A=;
        b=hZ64tnY+OrCOVk/gcW/Khe6vV5oNsHJ/JNAxApEBUU8NoNjCbIu0WULx/VR1DhTTAu
         OqI+I5/XHSSoCl83XN8gSV3vwIcV9GJrk69zXi2cZpyZdz9sZ2GipQF7W87KODSkdWtZ
         DtiA0R85sRENYfbFzPWblEmjgvPcbwI4hRhkLKWyb0NIWOCRl1Z81FIo9Ys982Gfb8+V
         p3VvmolFVSoTIn7cU3eJ7IHGVNsRQoqTqaRlokoRz06z/HNOAfKShp3KubHn8E8eyqN4
         2j4yVcyOyvmiLtxAs9fP9dabf3F8OC+uoG9T6CkwCRS+zlpOMm5c7DsbsBb0tu1XrLLj
         dNpQ==
X-Forwarded-Encrypted: i=1; AFNElJ/ox9oP0UpX+hDdKw0GdY/vzqOH6gzrwXpgTsV9pt8fT6hqsfHeTF9pmtVZqTWfTzbxNOOPoGpLOz0s@vger.kernel.org
X-Gm-Message-State: AOJu0YxmWBlZEOZz4Oov4Mn17nB5KMNOmzOtKxNoDZ0PN1E9+uh6Kky3
	kRVgr1LliSJlDLQDhLVAXyTmeGKlmEGjc+OW6lVq0mrhPVaGSaimYg8Q
X-Gm-Gg: Acq92OGMY/NAr+stU2fDtEqs7bD/bPZLx05oDA7AtFSMqjNjI/rSRI7VhU2jrLJ852O
	SkXMAcOT4SFprEtdDy9F4YILRKVjRVel8kyz1d2McIUGWIKGfLYFE4yGn2omODbJCdslsjsXLss
	OzbCt4KkZj3nstfa7P9eQ+GOw2kdwt+s0NiDf9FSvyL6k9QiGYwrwVdBLB68ssCrJBhu7jrysQ9
	gqBSbcnH97vTGemfZ6erKcmkT7Qdx0qK6khTIQdjbIC7XIYbhsER2YMawM5OS/wA5T3Lv+DV+K7
	ytHA0997KJt5L5SNRFWsDsyKnssIaA1VjsAsosD10iQhYO+t/u9FLK7T51k0mty+I6ZfnETWA2z
	zfhQyXh8MgMEMFQvQ9gV18t54dG5VMfivl8NH+xnZoFttQnwaH6XC5E7bEr8Ulu9HwpEAuSh04e
	ytQtLA3RcYTrTl
X-Received: by 2002:a17:907:9714:b0:bc6:bb79:e50c with SMTP id a640c23a62f3a-bcc3f654801mr253345966b.29.1778411312270;
        Sun, 10 May 2026 04:08:32 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bce7a3fcb57sm68146866b.60.2026.05.10.04.08.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 04:08:31 -0700 (PDT)
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
Subject: [PATCH v5 2/6] dt-bindings: input: cpcap-pwrbutton: convert to DT schema
Date: Sun, 10 May 2026 14:08:00 +0300
Message-ID: <20260510110804.33045-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260510110804.33045-1-clamor95@gmail.com>
References: <20260510110804.33045-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 84325503BB3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-8067-lists,linux-leds=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.968];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,devicetree.org:url]
X-Rspamd-Action: no action

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


