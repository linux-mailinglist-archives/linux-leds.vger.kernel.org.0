Return-Path: <linux-leds+bounces-8239-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uKFuKFv9DWoo5QUAu9opvQ
	(envelope-from <linux-leds+bounces-8239-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 20 May 2026 20:28:43 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AA1B596458
	for <lists+linux-leds@lfdr.de>; Wed, 20 May 2026 20:28:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6DD18312D62D
	for <lists+linux-leds@lfdr.de>; Wed, 20 May 2026 18:23:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CCD93FBEBD;
	Wed, 20 May 2026 18:23:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="akt16iCY"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30FC13F660B
	for <linux-leds@vger.kernel.org>; Wed, 20 May 2026 18:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779301400; cv=none; b=GtpH7jT+ceqEi7x9yHGynWpP/IlE/RIlpE2ZSIbhnrH23yj/rwRmhqqH7zgQxxZPGV8feBrt7WUZ8KfIGGqBdznAf01fwDbXadewNcZQrCYSp8uwoBoCHkK9OADOTNnH65MtNsxJnebjTJ5Sc4wI+OucOVodRdyL/W+jB339b2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779301400; c=relaxed/simple;
	bh=DrNGeBlRxTjZoXBtwt3WHPiWKByZ7OZ+6oYAQENqEx8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bmUysX0k1w9gK9seXps/XunyV5UmWD+s5/1zrnjb+n4gJ4CFfEsXJ5h19noIjQ5OverKykkyRa9BX7tv4ms/UmDil+pzIY3gOjCihRUISS14QXFs7GzXhRQA4yVJitpcQMOAODAzmXj5G5ljPDz0W1wkEsWb53wjGhsW5h7shm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=akt16iCY; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-44a5174670eso3065308f8f.1
        for <linux-leds@vger.kernel.org>; Wed, 20 May 2026 11:23:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779301397; x=1779906197; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KFT7mMG9k0k/BXen8CQg8hnB8vdYe60xOPZB+uYBrVs=;
        b=akt16iCYWyGuFuq/BySn+yBAP22U+VauCP1VfFjlxMpEu0M2DrcMBMHrTJ9padWPYD
         BiBtSU0CWO+TPWZ9cpQNi6LhC6EljQflx2K8LEl+lsb/iwLG7y49IGopsXLElVo83Wsc
         H9iMB1H2w68rIl444/CBLzCxoEVIXN4v9qfoTHrKG8622u16TJ07FF1LOEAWyJw4RPN6
         r1XI/8HeaxlPKUV5K/03OEmk8qdrg51CKoX8UPZY9OpN0Ym7O5kaytnAzbxhTVhZGZmH
         ZwvUb4z6B1A46gCpoZ8D4ljd/zsPNJqWVp9bcvEoMJICk55tzBXaYwW4K16g4468CzDp
         E/kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779301397; x=1779906197;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KFT7mMG9k0k/BXen8CQg8hnB8vdYe60xOPZB+uYBrVs=;
        b=cbVPlvTcpUqbZ/fwE6WLYoZIzm1Sq9KUvJY0k7tqbN9ZJOCgd07uKFzmTvAQmcbOLm
         DkGDEx6KYTwJi+eWm+fBjTWxtOT/zHquy7h2Z5YIVYMLYTUpFwBaMAz3A5lglpfnWjlN
         bNJGAfNwTaBeZH2+0sbPSjxmX+f7GQL1oarsjBPECzauchLjWaK1rRwKz/C0NZgcZAYV
         ogft7W+0SwNbZZoU2psGQbIjtFkJvkpsa8owsdvmBe150Tj+RHSaLma+GHb/YMFW9Qoi
         j77+Dms0E5D5QY/wX4kL9iKrZL5ArdUL0MlyBXybD7Hj3adqbA1w85UlOes/pCqSDN/m
         h1gg==
X-Forwarded-Encrypted: i=1; AFNElJ8qVpP/9wH/ZDiX68R0/epoubOQFE82agsO3i+u5gst+ImLiEEXfw0Vll020BhnVFeKZCdgT+DLz0k8@vger.kernel.org
X-Gm-Message-State: AOJu0YwSHUH4rHeCPq4UZbdhioYXKDs+gDWR96McADaUnUIwhwITTsyO
	umYq7n0Jrs4HYmuRTOU/LFW+UcuXOwrsXX5FQIqBlU8m8I/uYddPNcVP
X-Gm-Gg: Acq92OHf0RAfBnv9gBAYRMQUKDYQxCe4IfT8F0NA4XtdKWn0t7OWly2Khz5n6stwkkE
	tkcq0YC6eBgF2HuqUMXcpAGp9cUdTNDaa18Pwg2CTvVOC9OQRl55Dr5CSVsWj5uYEgPHuHbberP
	wkjNA6mJPfBfeCIxRRbFIvAgeuN1ftJ7lvnOs2MsMHhH9W659jjh+yQwANlZLfkAfhBBS/Ynj6u
	8yKZ5cvzlBSy+eFdhH0MbBb5d5ssDUe01WMz00ZYcP4NcLSTJD7PvRppYocKGn1veGGjEBE0rix
	EQFIj0ZebflGTpSAhTwdf37ikWCvK+DM6xGrk/tSJMggKkrDNtr27po55ecx2bk536JPtonGNgK
	zo7gFafftNuxiuSqScDPTbbRJPzvo53Brr8eLpo9RjxFcI3UnTgiJt7SbP1fzpfnDbkfQngjuYZ
	bFUr1EwkMd7O6S
X-Received: by 2002:a05:6000:24c9:b0:43c:ffee:ee94 with SMTP id ffacd0b85a97d-45e5c5a0198mr43839740f8f.11.1779301396553;
        Wed, 20 May 2026 11:23:16 -0700 (PDT)
Received: from xeon ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9ec3b18fsm51297739f8f.11.2026.05.20.11.23.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 11:23:16 -0700 (PDT)
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
Subject: [PATCH v6 1/6] dt-bindings: leds: leds-cpcap: convert to DT schema
Date: Wed, 20 May 2026 21:21:19 +0300
Message-ID: <20260520182124.117863-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260520182124.117863-1-clamor95@gmail.com>
References: <20260520182124.117863-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_FROM(0.00)[bounces-8239-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-leds@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,devicetree.org:url]
X-Rspamd-Queue-Id: 3AA1B596458
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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


