Return-Path: <linux-leds+bounces-8731-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9RCyGVrkPGqVtwgAu9opvQ
	(envelope-from <linux-leds+bounces-8731-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 25 Jun 2026 10:18:34 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BDAF6C3A46
	for <lists+linux-leds@lfdr.de>; Thu, 25 Jun 2026 10:18:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=JlD21WPN;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8731-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-8731-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id DF0F23017CD7
	for <lists+linux-leds@lfdr.de>; Thu, 25 Jun 2026 08:18:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8707A376BE2;
	Thu, 25 Jun 2026 08:18:26 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7E8C37C92F
	for <linux-leds@vger.kernel.org>; Thu, 25 Jun 2026 08:18:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782375506; cv=none; b=OemXcRWbkCQBeowluDppGb2PiSHtMmvAMap+Xry2fFLwuTB1rZsAEyfwkv4Iz4uSxsSCgNgKOHEtzbLkk1FwwPQ8gSqfwCMn5OcDkhyDKig3WFjGiWjKVS78CLNhIvGVZekQgNjJeCAJgYTT/BkFplIvmBAeqqO4iqkIvk696YI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782375506; c=relaxed/simple;
	bh=DrNGeBlRxTjZoXBtwt3WHPiWKByZ7OZ+6oYAQENqEx8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Njm4VOZo0IsHUejyAiw63Cwf83TxV0QhYp2NXnfGqTXT7XiKKUvadS12ikuM0i6dn/svxawuJz7OOZAma3GsjXz85mKXkexujf1UyC8XSH2cbQmlU14YrXznoGFpaPnOS5x2e1jxVTFRgVtolqRL8vEstiOrYNf1WksShtYqdWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JlD21WPN; arc=none smtp.client-ip=209.85.167.52
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5aa68d7d757so2565178e87.0
        for <linux-leds@vger.kernel.org>; Thu, 25 Jun 2026 01:18:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782375503; x=1782980303; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KFT7mMG9k0k/BXen8CQg8hnB8vdYe60xOPZB+uYBrVs=;
        b=JlD21WPNP1Ay8RyI+NL74dU3x+qHS5m5q8XRzWrZdGNynQLiWmdB1AwrPnIu0w/7jl
         bAI7cDQS/hKbRvcWhclL9rGGlxASL/tw4PqFUIZg+AXjW5pW9M0CYQ7tjKbE2WFo2D21
         hgooOyzsEWu2NU9Pw2LeXrsPytS61Vt5C4z5jr1eq0F6m7NXvhHSXoiiL9owVrefIO4d
         aqdSSNva50OF9CKiYNbZuRH2ftKGICC7N+mnb9zJD6D2A+ErT9VL98neRFfW6tB4DUza
         4Hv5Jjrbdgm1E+pv6GAGFOMX1styUN3rbFjkF++JVmv7dssDiSxTuqma/rWp5CsG6qkP
         ZFbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782375503; x=1782980303;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KFT7mMG9k0k/BXen8CQg8hnB8vdYe60xOPZB+uYBrVs=;
        b=dtMAEhOf2sjKwi2qokNLqZpFRleYU54O5CRtkx6ddDPVI62WLii/E5iSxHwWEgUAFN
         qEOu2YEE9q/9hq7PTco8qzUyk+l2QkxXPw4PdUcQgt2W0263d20Xui4rYjR75+1FqWbm
         60rnIb9nriWWE29kqlUpyDUY0Q0e+btPBj4vy9voyCqIzD0ElSYidlLjn+hohtUi3sMc
         BpUq8Owv9T/eMorcOZFO/MxS9DQeLkXRBTHJIpY1OvBnyMGG6uGHJQRRIU9sr6mZPfmm
         lzQPA99/o+dJpfodklks1J64RWUJ6rQKf0eRGgsbF6xjlv7XYm7yDfi1Oy4uUsg1U7/6
         CXvQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp8W0R++FBmpeGmX0J8jOVqRg3knBx6zb2ozWocK0pmADpRd5mQ9QfEzyZXZO9jNETqVfMTIKJB6642@vger.kernel.org
X-Gm-Message-State: AOJu0YyWLOJ0fmd8XzEX69gWSdOMZ8AtYLA6wwnrLxCTnMqHnSiarlue
	0tuGkwYX5nzlkyDvbensWptpIwKpvpcMFMwS9Yg+sVSVkxIZBXIOiR0b+IqYPtTK
X-Gm-Gg: AfdE7ckghvDdFx69TV6EgYEcdGBKhAYWlDrj94Htea6iVaX2pdcPl0yyMKUHNnYkU0d
	h7gGLPXu6qRjWsX+vdYc5FzUhSAj+H6XVKDGXvJD40elSaJNRkxQUBc21ybuGcYlwHULEkWWqPw
	Uw9sjd4XrOHzM6lpiASh3mYXiVzH0wgJ8akMXnX0DGOg32ROJsqyg5nUfxccPJ9eguX8FT4Mogn
	V0cQ4Gl0cV05/SqDKlbdCcfqeLmChqVfU09okIlrqqFfB99ZymsU9RrTgVWonX+otFXtfH2gyY7
	szDlzfV4PWD/h1Y7qYFG7E9r04wEr7UQc3zv1gajIhWjO6xlo60nBHdYukge/B2MPAEnOk+UptO
	Y092liGSgVMnkBR+WIDE3N3NUga0xC9rBv6lZYkPAcllzHiD/Kp7OYWfCVkYnGMp+MjPWDD/cW5
	RcJw5SOqp8Rx2D8v3Z7uQn7Nw9HxULK5uJYQ==
X-Received: by 2002:ac2:43c7:0:b0:5a3:f25f:cc30 with SMTP id 2adb3069b0e04-5aea1f4cc39mr319980e87.32.1782375503093;
        Thu, 25 Jun 2026 01:18:23 -0700 (PDT)
Received: from xeon ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad6957a268sm2464601e87.38.2026.06.25.01.18.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 01:18:22 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org
Subject: [PATCH v6 1/6 RESEND] dt-bindings: leds: leds-cpcap: convert to DT schema
Date: Thu, 25 Jun 2026 11:18:07 +0300
Message-ID: <20260625081812.33474-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260625081812.33474-1-clamor95@gmail.com>
References: <20260625081812.33474-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-8731-lists,linux-leds=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dmitry.torokhov@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:lee@kernel.org,m:pavel@kernel.org,m:clamor95@gmail.com,m:linux-input@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-leds@vger.kernel.org,m:dmitrytorokhov@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	FORGED_SENDER(0.00)[clamor95@gmail.com,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,devicetree.org:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6BDAF6C3A46

Convert LEDs devicetree bindings for the Motorola CPCAP MFD from TXT to
YAML format. This patch does not change any functionality; the bindings
remain the same.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
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
index 000000000000..c8e7b88a05cc
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/motorola,cpcap-leds.yaml
@@ -0,0 +1,42 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/motorola,cpcap-leds.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Motorola CPCAP PMIC LEDs
+
+maintainers:
+  - Svyatoslav Ryhel <clamor95@gmail.com>
+
+description:
+  This module is part of the Motorola CPCAP MFD device. For more details
+  see Documentation/devicetree/bindings/mfd/motorola,cpcap.yaml. LEDs are
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


