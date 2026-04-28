Return-Path: <linux-leds+bounces-7887-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cOQJH6DU8GkpZgEAu9opvQ
	(envelope-from <linux-leds+bounces-7887-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Tue, 28 Apr 2026 17:39:12 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F8C44880EE
	for <lists+linux-leds@lfdr.de>; Tue, 28 Apr 2026 17:39:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2819D30D7F41
	for <lists+linux-leds@lfdr.de>; Tue, 28 Apr 2026 15:36:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 331E1396D09;
	Tue, 28 Apr 2026 15:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mDorovP1"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE9FA3914E9
	for <linux-leds@vger.kernel.org>; Tue, 28 Apr 2026 15:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777390599; cv=none; b=G29aVOAl1z1Y+L8ha5zxOKLCGLHAQ4Z3jsLPIk7lBrKGnTbIvDh/B1amjs8v3oDBpMy1vFcfhTojeEwr/3XgDumOTC8ft/Vj96U3b6myBiF4ztXGLYvd/iGZMfK5mS4MaEY3HI7j7V32kxZg8aSAa+bNsYrPgmIhGo1r8q9L1ao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777390599; c=relaxed/simple;
	bh=DrNGeBlRxTjZoXBtwt3WHPiWKByZ7OZ+6oYAQENqEx8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Fwq9WQyEORTFTymHQxO7Mn8DVFQOIJNFmfCSGPYVVVjAU6yuC+pTy9phqTetUPMSz/gfLxXfnEa1VAeKBW+0I1iooGXqukc4YhT+FiUh5QM1QZlDT7d8SrnphmDk/bItb8jEBuWxvdH/W8vmqae3HFIzWb3W1xbYO/zZ9re3VPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mDorovP1; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4852b81c73aso96482955e9.3
        for <linux-leds@vger.kernel.org>; Tue, 28 Apr 2026 08:36:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777390595; x=1777995395; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KFT7mMG9k0k/BXen8CQg8hnB8vdYe60xOPZB+uYBrVs=;
        b=mDorovP1vtG3qVNGAvuiZaUeQAB/SVLlSzcMis4/jv5E1v6ZmQEKzXd/38Kx+X4OYs
         A0qYPrp4+r7PrKFMDN4KxvC4cHUvrfUzCVUgENG9clBGm5ub5P4CQCiu0S7hTz2uN6HE
         FmY3DQDWGN+vuiW9PUQw02Ol3xY+488wudtXSHCDajTOkay7JXrbA2UbXHICQOKDLr0t
         ZTb5gVcKsIJVrRjTFrwn3pWt6YtTNhvqu1AJi0RR6NgDaazjr05zcyanvH7vWC1Y0u9s
         2u6ZxfpQ1HpsKjnQXM2+AttwLKgYXvOUPIj+GqYcAW31fVX9jWZb1ml8LpxiduwiA0Wk
         KuBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777390595; x=1777995395;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KFT7mMG9k0k/BXen8CQg8hnB8vdYe60xOPZB+uYBrVs=;
        b=Jgbl4T0KOr5jpoRj9E07OTinRjtnH9tA7HPwXD+2G0AclAEHxGM01JLbc5fkUGLU3a
         RMdPZo9MR2JPWj2PlL4ZEaFKt34dB8mt9h0gZw73jT9H66DjyFDnXyu3+IZm8WJoMxaJ
         QytYtCG6VKDflc/Mck9eIBgEiIc4OYKiYOdT679HTU+taNIj0C4+Ht/BGsnSAeQo2NA6
         8DdQSFedk1dfXK33AStBeaKiEwuyocKPHKpLkRetDVPMKBg6HIYD0gBad9zXldY16V+8
         dNvz2PzRiSomi9FF6OX54vCbTNDyQYKo80ibEGAhK3imYkrbvhel2RMxI5SSgWsbA0Cs
         Xs9A==
X-Forwarded-Encrypted: i=1; AFNElJ9rCbyIHF9xHENi+l/wtSKT585Va8IswDW2mu57OwVVCLb8U/A7BrUDOB9LPu4pycyDoZ31e5Thnb/1@vger.kernel.org
X-Gm-Message-State: AOJu0YyQ7xvJAyXonLpVDwUzntpuXBN1deSopBMdDWmbsRTw6pMCJvM/
	0OOsdb4Cm/Zi6Qlpi61tVRsvGtuJ+toS+OT3TGIInDsnSoySPj4beC9F
X-Gm-Gg: AeBDievETw7V/srlahglTQHubNb+RY4mD4GUEx+ZHdfB7fv1jwSUyGOAGLh2GNWRPq7
	uaMM75XqvE8Z60UMv5V9QiVrtvpibpyeSxkHzEdUGbouioIp/5+T7tMmOczpj/gRK/UQDaUECga
	lQ+x0HQNug59If4THtcUd2m6iKaw9Dd0I+O6k5QaquxBKbm9rHrb0kjKP1ZWMacGP6wk64kVdh3
	9Y+IcpOJIDvKxEnvdFJqSrHxnXXDFEbaK9HMplFWZoiJuhsXFPqboL3Oc8N4oGY6a4shRbLL4Df
	8nj8HjfCy+STwUPvBwEJtTkVQnVsuUH8pZ4RLjVC1RvUC6Zx/f6q+NH7bAWE9Y3tYpPxW/7yizS
	WyxeNRWcYRrnC2eSpOuVGmePOpl2qy0yUZAIH7ZlfijTqeUQUu9g0d3C1NJSJdHYVF5BDpJNAwV
	fvfaZwbvR+9j2DlzMDWflaFwM=
X-Received: by 2002:a05:600c:530f:b0:488:b241:2c5f with SMTP id 5b1f17b1804b1-48a77b298b3mr56286425e9.26.1777390594937;
        Tue, 28 Apr 2026 08:36:34 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a7b56c2d0sm1358875e9.11.2026.04.28.08.36.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 08:36:34 -0700 (PDT)
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
Subject: [PATCH v4 1/6 RESEND] dt-bindings: leds: leds-cpcap: convert to DT schema
Date: Tue, 28 Apr 2026 18:36:06 +0300
Message-ID: <20260428153611.142816-2-clamor95@gmail.com>
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
X-Rspamd-Queue-Id: 1F8C44880EE
X-Rspamd-Action: no action
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
	TAGGED_FROM(0.00)[bounces-7887-lists,linux-leds=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,devicetree.org:url]

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


