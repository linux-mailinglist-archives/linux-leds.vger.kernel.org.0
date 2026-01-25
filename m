Return-Path: <linux-leds+bounces-6736-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eAUbIf03dmmTNgEAu9opvQ
	(envelope-from <linux-leds+bounces-6736-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Sun, 25 Jan 2026 16:34:21 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 2973A813EF
	for <lists+linux-leds@lfdr.de>; Sun, 25 Jan 2026 16:34:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 921FB3001003
	for <lists+linux-leds@lfdr.de>; Sun, 25 Jan 2026 15:34:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C76419D065;
	Sun, 25 Jan 2026 15:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eaaUvFuB"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com [209.85.208.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1375C1DB375
	for <linux-leds@vger.kernel.org>; Sun, 25 Jan 2026 15:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769355259; cv=none; b=oA10hI8SD+SrD0vZeKER9xMaAkOalmxPvGpSzZV4KwzfHhEi/x9abFLdAgs5z243ZKZcMLXy6/EGSKBmxIXhviIENrdDFCxrm5BCzyF2BDTIN14iOMQcTeNk8R1OAlTejlCInvlJ1v/bCCAVRXnehcF5bMBl1inyvcc+djOM9KQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769355259; c=relaxed/simple;
	bh=E7A9c27yUqkUqACBSnmKRI2cuBoHgawSFZnfB30gBd0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=coWrQq8ZPKa0ehvt+fx/NixZu3MnNOyaHrNlK6ze4toE4Mz8inZGvM79Y1gjzleMT10r2NbAJ80jHGR6qEskSpw3Rc/KpTa1wB/bE/EJ4hu5QpZCyJa0MwZ44Epo0yxx3WdCsh6K9QWh1yoXKlkXQUkkrz2qh6QQcE+pou9xHjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eaaUvFuB; arc=none smtp.client-ip=209.85.208.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f67.google.com with SMTP id 4fb4d7f45d1cf-64d02c01865so6055101a12.1
        for <linux-leds@vger.kernel.org>; Sun, 25 Jan 2026 07:34:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769355256; x=1769960056; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=opwAzXZXGpL/t9kjdWql8KWUaKqEP4kujq0iT4W20S8=;
        b=eaaUvFuBqFNX/Qpz14m/OO1TB0UBbpgQLyB37FyXqBRqMLHDtGEthOrJqp7+/L5BRz
         SUW8kMAkl+IPmzSt8xFOwkcQszkrmYAcV8vlE1V2NyeYR93xlyuncnBJhBlEetqToVLz
         rNAeBeP83x4LrmPdpJbGd/nLvowx1GhgX3m4ubnGrTvW2Zi7pGdlxyfFYMRJiox+wfbj
         2olCkJF45Z812JMQm3JltY5eaOYKvs2gX8eQsfGQdPKgOi1xfuZnfmWq2ZiL1YvPTGNc
         w0bRAWmg0RuWSj2TfMW/QPtWTm+ERJ0K0Zumats7dsnG7U0DIuZ+dBtobpfB6z9uCX8C
         LUhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769355256; x=1769960056;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=opwAzXZXGpL/t9kjdWql8KWUaKqEP4kujq0iT4W20S8=;
        b=t5UW/ZZgy/xfIjv7L1jI0418iAiJdhKuB1e22YCvFHzt8u7ZrAFgiZRjRGK/+kZLbY
         /hmwY75B9P5AlOjAsC4/a/pDbu3qeHXajLUgBEImwNtGV+sz8GPRm+q7uNnc1fg/St0q
         AParFBvOVWPTLPChL1y7Y3SXiym8X3h+0dvEkoXr+K2vfVEQ4WYAksamjhxQDOTvtIVW
         aSjfZ14slp3DaDjVy4QLS4a3hlruVtIYxwmh6nwYiib0Zuue1ukne48gJduC02Wc5gbz
         fLVI97uG3fjah9oAvYJJ2cTi3sdmur8wtDWowq+Hppm2hjxhcCWyl1oSM3SXRw4iZvsY
         6h1A==
X-Forwarded-Encrypted: i=1; AJvYcCUYKO2l0F6oKcYe3FGbrFjHVNE6UEB5wTR19t+5Xv9AgEwyq/32F5ZwWPKF/8ORgWEbdPTZ6bjXlpWy@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4wbP7c9agnRN6J023c450w4JVwkNeWItUIsMSqOyDDICznbhT
	gER9VrBe+NzOddlI3VnpESIHTLR9d6q6LPopToyGbaeYyFOi/nFjDeF/1mkX+JsW
X-Gm-Gg: AZuq6aLVd72Qxx/GdfHEZ0eJoMkMyrNoCohPSXyIBMeMPH5peb8y5TvkoGzFG7/M2xo
	DcWL4n0NkP0R95xpIFBw+S9AAhC2IXGqO68aT+QNEjBGPMoT2WICAux+bBe0/A19lLFCcvdRhVl
	FQ2VONiq/83FPDCU0jPbx5KRDElQM/Wx3d/+D00UOMsFZhjSCArsA3yb+2hhJnsYai5ZFmyXjoT
	r7MRG9cPF3p7eKGq4M+X7ToDr7QwpNiKcJqFM+d13+oCNss3riVCID1u9W7iIMXM24ZUWWevLHs
	RAURy+ijyZzeRVQINV1j2Pvlrb4FKVG3twDdz0lFy0aI2h2YhsNr1VlBM7AvKT+dgMRSNeXCvmy
	XAV4A5eINcYNIhRcZo86pzluNfuNBVz3RonJBDyjB0M/Q9d4UecMO6/5NXfDT8CEF4Q1KDf+hfi
	Wu
X-Received: by 2002:a05:6000:2483:b0:435:bdc0:48e9 with SMTP id ffacd0b85a97d-435ca1ab666mr2383866f8f.55.1769348600123;
        Sun, 25 Jan 2026 05:43:20 -0800 (PST)
Received: from xeon ([188.163.112.49])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435b1c246ecsm22459688f8f.10.2026.01.25.05.43.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jan 2026 05:43:19 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Dixit Parmar <dixitparmar19@gmail.com>,
	Tony Lindgren <tony@atomide.com>
Cc: linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-leds@vger.kernel.org,
	linux-rtc@vger.kernel.org
Subject: [PATCH v1 07/10] dt-bindings: input: cpcap-pwrbutton: convert to schema
Date: Sun, 25 Jan 2026 15:42:59 +0200
Message-ID: <20260125134302.45958-8-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260125134302.45958-1-clamor95@gmail.com>
References: <20260125134302.45958-1-clamor95@gmail.com>
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
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-6736-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	FREEMAIL_TO(0.00)[kernel.org,baylibre.com,analog.com,gmail.com,bootlin.com,atomide.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,devicetree.org:url]
X-Rspamd-Queue-Id: 2973A813EF
X-Rspamd-Action: no action

Convert power button devicetree bindings for the Motorola CPCAP MFD from
TXT to YAML format. This patch does not change any functionality; the
bindings remain the same.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
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
index 000000000000..643f6b2b1f13
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
+    minItems: 1
+    description: CPCAP's ON interrupt
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


