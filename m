Return-Path: <linux-leds+bounces-7743-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id INUaLC7d4WmtzAAAu9opvQ
	(envelope-from <linux-leds+bounces-7743-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 17 Apr 2026 09:11:42 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id D6B57417BDC
	for <lists+linux-leds@lfdr.de>; Fri, 17 Apr 2026 09:11:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5DB35301577A
	for <lists+linux-leds@lfdr.de>; Fri, 17 Apr 2026 07:11:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F644340A5A;
	Fri, 17 Apr 2026 07:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="La4oMK6r"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9C3A327BFB
	for <linux-leds@vger.kernel.org>; Fri, 17 Apr 2026 07:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776409895; cv=none; b=OXcqpuCsCDHgv/ge+SqIV7eEzIMz9CUJ6DWF8a2PwoE/al+FvCZ2O1snOZqFl3cRTT6x4AqQeCuGJv1dJ7SibifNGLMj/vjG6kwcUkBnDj4fWvDp7Yvuo94fXwo3Bfim4wnpPYVp4GzorTRyAUXd24z5fvq3DDUBv7upuXVRd7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776409895; c=relaxed/simple;
	bh=DrNGeBlRxTjZoXBtwt3WHPiWKByZ7OZ+6oYAQENqEx8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bpCiMzmKO2sYqf33NhrlLPSQUrRr9n2uIFWOLp4jttyWYWBfvBPWU85Bl+yuAUZ+pIW6fo6lC1ept2sSRA0Z8/Vq8cy7dsTd5Ls9318IVS4fEoJbPx7itz0eyq8ds8W/XHIdBSJjNsZNSpzSRZ9xgaGrV7kHFoi7u0mRD0oQNoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=La4oMK6r; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5a3af1b7549so429464e87.1
        for <linux-leds@vger.kernel.org>; Fri, 17 Apr 2026 00:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776409892; x=1777014692; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KFT7mMG9k0k/BXen8CQg8hnB8vdYe60xOPZB+uYBrVs=;
        b=La4oMK6r0bH9F3SRmHbdD+x7Gwy/4imtA632ohRbqRTyGsIBzmRKxbqfGKtQ9Qd7rS
         5MPpFRHiERg+hwVIkpIFAfQ5F2bMj7JcCmeDvWN/4NZXmWgqnHhpRkiH8UpzUHJEvWyC
         oE9Lw02G84VdlqgQ0G/vfeBoyuNpRKVURbd8dcYGNRlsmX4amyDb/zPAH7f2MLxIXyoW
         nw0cEPCk+RUnC42CRYV6q01HXOU3WaphXk5TsOq1XNqjLjT75S6UzM7UXufOx3pteQwJ
         4JJGa4/rliSULJw8IJPrCulKGH1lUUIUFWTulI9JQ1X0ypZsNu9UXpkBnnmJcAYtiRPo
         IUQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776409892; x=1777014692;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KFT7mMG9k0k/BXen8CQg8hnB8vdYe60xOPZB+uYBrVs=;
        b=qU9VNZLMWwoQOI95D4IOAVKocCKnSOh3ft8QuY/QRrGln79fC0CCE4eV1Pm9hRkAxS
         YsMk26PCDmescl06x8GgswbkmEpM0ouqFS7N0xRwMS+VR2Q54sipVy/xTqWqCigYaiUM
         ERIc9J4oABdkdLjgcAqkQBCAj7c7UiG2ZiPEZYc56HGQ3QrsTyuhY89wzvbgpPLHx2iF
         xCWivBQtD07/y9uE9ZDldoFXjfYk5wZ5kIzLXkOEj9Nlrn5ZsBhSVWqrK5BDTosADOaO
         GLtEBvp5eIFo00YoX8agzTepER//zShEV7vFw00mD1HF2TpI6d8lB0qC5AcU61atbucj
         seIw==
X-Forwarded-Encrypted: i=1; AFNElJ8tS5j/M1XTYZF13Og5bq5KCJ17T5P4GNoVQ86Jmzgt6+3AJjVVFldxEWTOsgQRIqwcftjnjVs20y8f@vger.kernel.org
X-Gm-Message-State: AOJu0YwoJKmgxpABbxJsxCNK0t59Wx8jQetVjj/VT6KL28NGLov62pXz
	vU4yhrtE86E3Lu2nBWfO1m7Z5uxZt3/SIKBs3KqE8U8WaZ8unlfk3MZf
X-Gm-Gg: AeBDiesPdoAcSQxjO4PH+vNJnf67tsh4MU9y3yIa96fnkl+avURUw/9Ov1UpB7nDyjg
	T/mDrxXYTaK1eSkpX4ZsqmQ1C8FhMNIutfTus7TOfkDqxowETV9aOr1l07zBhoKzm2sj9V7qxfE
	n3ElZ9zSCBBsb3y97gLwMUXMAJAoMoHejDwXxRhWQEWz4CiExdljdrdaPqU6tPFDNTAXsxbOBES
	OOZufwZLHLyMC0UaI1SEa5g/wrAERMXHG1t21GMsRqAxKKNY7l+PfzRO44JjIoetDs7G/JhnqKA
	HsH5pWrQ1Em9swbid2hRPtLHrGdTbCyVKKP1gwAWGdz9ofsGDSzcb0u0X4cZGgw8y7vN2rBmXi6
	oJt/Bg2qXLDqACWt58A+vJfYg+m96typPKMVNxXqkLX00DSPETnwEzD6MSLHRu0M5tlrqCmoQTH
	t+xWJMcBqN/0VJn11HNXLeIH4=
X-Received: by 2002:a05:6512:6d2:b0:5a2:abc3:eaa8 with SMTP id 2adb3069b0e04-5a4172f60a8mr474614e87.41.1776409891908;
        Fri, 17 Apr 2026 00:11:31 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4185bc240sm162772e87.23.2026.04.17.00.11.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 00:11:31 -0700 (PDT)
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
Subject: [PATCH v4 1/6] dt-bindings: leds: leds-cpcap: convert to DT schema
Date: Fri, 17 Apr 2026 10:11:01 +0300
Message-ID: <20260417071106.21984-2-clamor95@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-7743-lists,linux-leds=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.984];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D6B57417BDC
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


