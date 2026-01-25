Return-Path: <linux-leds+bounces-6731-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MGlZMEgedmkoMAEAu9opvQ
	(envelope-from <linux-leds+bounces-6731-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Sun, 25 Jan 2026 14:44:40 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8305080CCA
	for <lists+linux-leds@lfdr.de>; Sun, 25 Jan 2026 14:44:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D16C03019152
	for <lists+linux-leds@lfdr.de>; Sun, 25 Jan 2026 13:43:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D2F33254BC;
	Sun, 25 Jan 2026 13:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qh0FJUmg"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 454BD324B09
	for <linux-leds@vger.kernel.org>; Sun, 25 Jan 2026 13:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769348601; cv=none; b=OWHdVcknNAvJvhpfkz1DTW6fVn/EH0G62KpZivKQ3sCuypirdJ8auPiH8uPFwG/P+wDiTP3kduavEC9pSJ+hL86t5Z/xpUCKo3IuVth+ujFtKh3ba30gK2p07MFKFYN9wcFmWXfrSIe2r0ElO2h2ZmHWINq9XSlVhmh1vgeOEU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769348601; c=relaxed/simple;
	bh=TtbHp+Kk6wUwswvK+4rO/i/ox+3QmSKSyODoCuFnZ/Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uovibs17bw0a85Lf3O6qmxbjn08L2Sx7i7sd+cZU00myDJQ9zIHWEWSRNrELxd0kLlmB8AVOTllEAX0xLkDJ42lu/f9DmvHQOST/aM5QUVu87L7rJHyEIYmpBN3UdIs+8LaTs+qTdIseUzcJ/oukE9q5cdX3se+PWrTfIaitOiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qh0FJUmg; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-4327790c4e9so2348236f8f.2
        for <linux-leds@vger.kernel.org>; Sun, 25 Jan 2026 05:43:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769348598; x=1769953398; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3KLM9Lln2ain+djx3Mr18eCyDfPocMjE7ubO1KrNHRg=;
        b=Qh0FJUmglEgpfra3T58ldRh1nZEdspecD2ob10GcHuy9Ub7TknwEOjSTbJVMxI03Hz
         dy6wTVRH36kJLJ54XvdvcbU1H1J+PFmCVEGUmXH4t7WxwppmjzyvA6eGkYVrFxcrF0/t
         c1PhWHm2vR2/j3KFTN4V66QIM7wEjJHjjiiqWfma7CAkR9jAcU8bMgAEahOvi3vqmWvC
         Ild/nI+ADWVWbuevYmCLkaRLTvPnrPLioKSthI9O/iwpWC3N78fSRnGxd/Q9eSIDN6X4
         MLPwB2DNHBfNecohoycyb265znFzAn5BX75RS2QQCgfldXR/maqeAu22MvL/r3jE8teN
         jBsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769348598; x=1769953398;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3KLM9Lln2ain+djx3Mr18eCyDfPocMjE7ubO1KrNHRg=;
        b=M4CmZ3N76GCHoSkaoZAbxvaAKQw52+bQs6bM/8LYqVDs/DGaQWdR+ynsQj8fMJ1OyC
         bfjzCJ7dyZ1lHCe9Ey0zdFLqsOzJJKwU+78Ev7A9QMU2HJCUvLvhLCqXL1v5DBBMLcFS
         3H+K9y71cDVJeYNR3TZgFOMliS28T70O3gNoUUO/XLJGhI+gChxtrVzwe/7oP3F2DgrO
         HPBCOX8spOFG0mL6sDkkRiK5pTRt8/Q7pG3MGtHbnAQSRV3mX2xw3QXC5jY3P4NaaX/s
         AIHQOaWVN7J1rmb3ceHHPaoXKnWvozO4M8bUbJRxa0rKIeizM7O9B91H/hB7QcwgYKln
         xtlg==
X-Forwarded-Encrypted: i=1; AJvYcCX1a3JK0WZSAtv6it/UCM3RmBAh6mGnp+uai0xf11PVhjexfZWxe6a3tNvyM/p9VW6BeVjWNQqotl0M@vger.kernel.org
X-Gm-Message-State: AOJu0YzHPaaFjbvm9FPI01pCFUz+BCW5v/D3FJH3cxhUzFgwlmykkrPo
	6Q1VFGEqlXGKYYv8aEeKhO/UhIT3vnJ816fGuwkUO3SbRPdo6P0s+aPd
X-Gm-Gg: AZuq6aI1/C6PeIu+3F2uG5GPeBKusQIGNz6BXM9dse0OZ4KGukkgrthgavYGZJn0hb5
	C68BUB40oO/VuU8Zu+nUlL5zeKr3IpkZEVnSvlSw4H5kasQ5eZJiJIC4swU8KoBTg8K02e8MCqz
	VK6SSGGDHxtXns8bDWmlqXtCHOlxOXS2to4un3dSTBfPBavzK2DI9MeR0CRFfahbunKiy5EA3BV
	jDgDcV6U2BUhAKfAoRWq4SMsfj1GNPjqOOKiQAL9QyUErAo204a97X84wMRSFbHZDLWU3y7P8WV
	CB0pPjqNizNDYAXHU3pJ7vruUgt6i8Tg84F+xFMpPDgRyWXNK+JFgitVVygz1X6jwtmyevRkYGY
	PaggqdiBNFojN6b+Uz1/h7T35QzEvaAm9WP6eFgB8Wfq7nZcz1RScEBZckX24/G08mGu2ts8cjw
	4z
X-Received: by 2002:a5d:5f92:0:b0:431:488:b9b4 with SMTP id ffacd0b85a97d-435ca0f9ca6mr2049590f8f.17.1769348597520;
        Sun, 25 Jan 2026 05:43:17 -0800 (PST)
Received: from xeon ([188.163.112.49])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435b1c246ecsm22459688f8f.10.2026.01.25.05.43.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jan 2026 05:43:17 -0800 (PST)
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
Subject: [PATCH v1 05/10] dt-bindings: leds: leds-cpcap: convert to schema
Date: Sun, 25 Jan 2026 15:42:57 +0200
Message-ID: <20260125134302.45958-6-clamor95@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-6731-lists,linux-leds=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,devicetree.org:url]
X-Rspamd-Queue-Id: 8305080CCA
X-Rspamd-Action: no action

Convert leds devicetree bindings for the Motorola CPCAP MFD from TXT to
YAML format. This patch does not change any functionality; the bindings
remain the same.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../devicetree/bindings/leds/leds-cpcap.txt   | 29 -------------
 .../bindings/leds/motorola,cpcap-leds.yaml    | 42 +++++++++++++++++++
 2 files changed, 42 insertions(+), 29 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/leds/leds-cpcap.txt
 create mode 100644 Documentation/devicetree/bindings/leds/motorola,cpcap-leds.yaml

diff --git a/Documentation/devicetree/bindings/leds/leds-cpcap.txt b/Documentation/devicetree/bindings/leds/leds-cpcap.txt
deleted file mode 100644
index ebf7cdc7f70c..000000000000
--- a/Documentation/devicetree/bindings/leds/leds-cpcap.txt
+++ /dev/null
@@ -1,29 +0,0 @@
-Motorola CPCAP PMIC LEDs
-------------------------
-
-This module is part of the CPCAP. For more details about the whole
-chip see Documentation/devicetree/bindings/mfd/motorola-cpcap.txt.
-
-Requires node properties:
-- compatible: should be one of
-   * "motorola,cpcap-led-mdl"		(Main Display Lighting)
-   * "motorola,cpcap-led-kl"		(Keyboard Lighting)
-   * "motorola,cpcap-led-adl"		(Aux Display Lighting)
-   * "motorola,cpcap-led-red"		(Red Triode)
-   * "motorola,cpcap-led-green"		(Green Triode)
-   * "motorola,cpcap-led-blue"		(Blue Triode)
-   * "motorola,cpcap-led-cf"		(Camera Flash)
-   * "motorola,cpcap-led-bt"		(Bluetooth)
-   * "motorola,cpcap-led-cp"		(Camera Privacy LED)
-- label: see Documentation/devicetree/bindings/leds/common.txt
-- vdd-supply: A phandle to the regulator powering the LED
-
-Example:
-
-&cpcap {
-	cpcap_led_red: red-led {
-		compatible = "motorola,cpcap-led-red";
-		label = "cpcap:red";
-		vdd-supply = <&sw5>;
-	};
-};
diff --git a/Documentation/devicetree/bindings/leds/motorola,cpcap-leds.yaml b/Documentation/devicetree/bindings/leds/motorola,cpcap-leds.yaml
new file mode 100644
index 000000000000..8dfc98a1ef99
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/motorola,cpcap-leds.yaml
@@ -0,0 +1,42 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/motorola,cpcap-leds.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Motorola CPCAP PMIC leds
+
+maintainers:
+  - Svyatoslav Ryhel <clamor95@gmail.com>
+
+description:
+  This module is part of the Motorola CPCAP MFD device. For more details
+  see Documentation/devicetree/bindings/mfd/motorola,cpcap.yaml. Leds are
+  represented as sub-nodes of the PMIC node on the device tree.
+
+allOf:
+  - $ref: /schemas/leds/common.yaml#
+
+properties:
+  compatible:
+    enum:
+      - motorola,cpcap-led-adl # Display Lighting
+      - motorola,cpcap-led-blue # Blue Triode
+      - motorola,cpcap-led-bt # Bluetooth
+      - motorola,cpcap-led-cf # Camera Flash
+      - motorola,cpcap-led-cp # Camera Privacy LED
+      - motorola,cpcap-led-green # Green Triode
+      - motorola,cpcap-led-kl # Keyboard Lighting
+      - motorola,cpcap-led-mdl # Main Display Lighting
+      - motorola,cpcap-led-red # Red Triode
+
+  vdd-supply: true
+
+required:
+  - compatible
+  - label
+  - vdd-supply
+
+unevaluatedProperties: false
+
+...
-- 
2.51.0


