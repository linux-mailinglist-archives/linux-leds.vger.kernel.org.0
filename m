Return-Path: <linux-leds+bounces-8066-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SOhgBThnAGq1IgEAu9opvQ
	(envelope-from <linux-leds+bounces-8066-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Sun, 10 May 2026 13:08:40 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id ACC75503B56
	for <lists+linux-leds@lfdr.de>; Sun, 10 May 2026 13:08:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2C702300AECC
	for <lists+linux-leds@lfdr.de>; Sun, 10 May 2026 11:08:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1764F37EFE6;
	Sun, 10 May 2026 11:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i+7VMlDh"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB631374E46
	for <linux-leds@vger.kernel.org>; Sun, 10 May 2026 11:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778411315; cv=none; b=CUbtIgqdLOMz/NjoTc5FTPZb1RLbsKVkXEvM9okUByketgQPQVktlfHeL4UXx/8zLlQ70CHmfGYfuNF5IlkpxCjeGZYmuzYzWVf205aUVFeauDdJTAkzDtmaOuMXSDIX/8nSe1Qfye6BVhJWyfkH+3QYo1RwVMz6EiCK4VWi+8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778411315; c=relaxed/simple;
	bh=DrNGeBlRxTjZoXBtwt3WHPiWKByZ7OZ+6oYAQENqEx8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WIPunUxp7EVYTrv3aQMRxpQWLp0z+B/hUmo+UAOwV8pYXAw/iftsxHJXJtTOjcFSGWDhh4hzYW/q0JmIl3llSQSIrWExW8xOP2R6GCwvIeJxxjvWNxhs6vTGixzpULimk3u0N+xz7r6eyzudIBtyXMoAZDHcfPXIZda4vyu7x5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i+7VMlDh; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-67929ff6dbfso5139376a12.2
        for <linux-leds@vger.kernel.org>; Sun, 10 May 2026 04:08:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778411311; x=1779016111; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KFT7mMG9k0k/BXen8CQg8hnB8vdYe60xOPZB+uYBrVs=;
        b=i+7VMlDhEnQTy6TQpSATWj+W9wpDGc/zGemHEZV/wLPBZVyGo+M/4FGrj+0Jx3GxPh
         bJ8sN8IDtPs3d/OtGYQfhVUsF1bXJ7WCsBFXI4kviAYyA0GOZqGb39zjqCxQL5YI6bEo
         hJlBrjsa42xAJWaglmWB3eNMkBkoxeDEf0wG9HsmU43ieNrSiQ7FbblqZjNgfDEoB1Rw
         zE9Y9U5ez4fGb6V3Ln2yy52HYCJRCGmUARpepDJ9Ql1QBSVwSameLeh2jSnHST4a0ntl
         zTaiNpPbT1hB5S3v7Wt+rSFwu5bB7t8PgD9bkO4nrVErDT/MXRjvDo4RgBDNDO0Ekm62
         bo3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778411311; x=1779016111;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KFT7mMG9k0k/BXen8CQg8hnB8vdYe60xOPZB+uYBrVs=;
        b=F+klgA33fxVQrOasQu4Z+HSPGIUk0LFvXnK7rizSHB4/acjCHhMA5v7y6aWgTsGNX4
         jjcA0tgYq1FfBC7aEOEU9lM4OSXUguSpsI28nqYyXQ1UlJx3E1QBbU8wHQyYRTDq6CgF
         wx4qAIjRTYA02rVDTk1mNU9FU2hWRLSQy3WWUGYSR9MtX09C4Q9iVm+vHMrT7ILGClya
         V2c3noc6lgJT4VFPrmkg7k/jvmAAIw1dRbcB8J2ebEXWk7fFbPfdWbS9RI3MbrcdSgoV
         L1NeABCK4liZMifZkhsqijOTN7c0s+uuh8rbSoICDVo2oAffNHPvwzqgh7q7+86xNMvI
         Ke5w==
X-Forwarded-Encrypted: i=1; AFNElJ+L6yRqSsRNZTZ5G8XMNnu91UKvJrJLD4aUtyQqn/iTCOEzsXR/WDYxI/POl38o8jR+cRWqyZPa3VB0@vger.kernel.org
X-Gm-Message-State: AOJu0YwYnjaQ39+e8n2aSmhtyW0EYhy2aVSXqRNuf0Z0/N4PWbFCeHl2
	LO7cuKQKN0JksKdsIrdN2IsVmoMwj4pAXgAY+uM8sa85m06/CEv8NKmR
X-Gm-Gg: Acq92OEtBvWCR51ALjZbkZKG3AbHOkkou9jPzG3U+lAU+FPi+wKKnpUc63zRXws6zeQ
	aRrKcBBdFmKt0Qe3DAMc4n6HrZlvNrlmIulZT2KQ2bDgL8Uxlql4Qiy6aqWHdPKaOWBX6Nl9I28
	J3fQ5KxdgAaZnwQQu9q54zehk4UtAFNDyB1cXMGEaeHMXIfk6Gq5Qo6X2d9RYqxZzndmz4UyPDW
	yt8e37BEU61DF7H5UnMzNPM7cdJc7s+90NrQWtODsQsZvAqhQhVIvb9zfTRyVQ+WfI7wo4xoKJv
	wh+JsmG/ZIBMawSOHLCLul9EEIOp8DjR144jeNBHm2S9sC6QpAlyj6nFEz+9bBc/HdKzpOMkAyK
	gnfEBpe9Use5TDqvKil8nRjFsjQnNHWeRLd70NX6mKHMLITcC5RZIuL8Z4T7U6ZQGGXxOFpTyhv
	1EriNVAA0HFfxYTcneXnivr5c=
X-Received: by 2002:a17:906:fd84:b0:bb8:fdf7:e132 with SMTP id a640c23a62f3a-bc56b9305e6mr1075475666b.18.1778411311105;
        Sun, 10 May 2026 04:08:31 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bce7a3fcb57sm68146866b.60.2026.05.10.04.08.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 04:08:30 -0700 (PDT)
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
Subject: [PATCH v5 1/6] dt-bindings: leds: leds-cpcap: convert to DT schema
Date: Sun, 10 May 2026 14:07:59 +0300
Message-ID: <20260510110804.33045-2-clamor95@gmail.com>
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
X-Rspamd-Queue-Id: ACC75503B56
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-8066-lists,linux-leds=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.961];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

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


