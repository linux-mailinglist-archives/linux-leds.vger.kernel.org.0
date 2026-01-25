Return-Path: <linux-leds+bounces-6737-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EIAEKoA5dmmTNgEAu9opvQ
	(envelope-from <linux-leds+bounces-6737-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Sun, 25 Jan 2026 16:40:48 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C933814C5
	for <lists+linux-leds@lfdr.de>; Sun, 25 Jan 2026 16:40:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9814C3006B3F
	for <lists+linux-leds@lfdr.de>; Sun, 25 Jan 2026 15:38:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E88B319843;
	Sun, 25 Jan 2026 15:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hUihGu7k"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A145F325492
	for <linux-leds@vger.kernel.org>; Sun, 25 Jan 2026 15:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769355514; cv=none; b=VJ3j2f5zfm/W0rgMSP1GRgh2Sskd5cH0OtgvckpI4O7DupbtHTtqnOO4TkpPT8SaAuT57DLZ2t5lLJ+EuQJJxEzwHLNRm+urq+bcfmqDjLl2Tl/ITaYj5dS2NScTqSeMiSuBmc0Zrv9t076fUfZ2NBMWXtN1KQRUOr0O35rszME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769355514; c=relaxed/simple;
	bh=l9NQa79di/jjOBPV+OqER4b7B0YtHihmaNsEeJfrOXo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JMPvDBO56gdybk6FsvuX0EzmL2lYvESx5HKlZrL9rBLeRhpoLQ9tz/iVaCK7Tkn6aEOvGeM0BiFyU2gFBhNst0tgsTam2cn3svg5j8J+sptzYrH20SBTLyMA3Z3fb3tXW8pYCHq7CrHWKTJs45t8K/30v4WSbZqz0YJIVg6QwSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hUihGu7k; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-47ee3da7447so29863415e9.0
        for <linux-leds@vger.kernel.org>; Sun, 25 Jan 2026 07:38:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769355511; x=1769960311; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IlJduHNY4/ATTPZTxaM+BbgtP/PXXrqKo+1qMJ4eq2o=;
        b=hUihGu7kDfyUQmYph3PN4NPQ37DWDGrnW7JEJ+X/QXgEmW0oHAadDUw9UTCU3mnDFs
         3jZ+LyDOgSs5qbojkocMAc+Z9tHR4UIF+wvA/AB05cgW12TTw0g1Hmy9hpLdK2WYOcR2
         9EME0IL4EMpkH8Z/6piXsLCQf8pWipUO9Uf4tl4Y33LV7xL1OgPza7JLNnt//gbG9NCQ
         BJya7OE+O/VkiYRl0bhS3n9sobvuqJ2K2IQD1m8DbjmqNLKPplfYLQbd4MhzT1k87hwT
         A8jUx4Q2I/ei5BdG4Ih3gW43La1otPsFU9TZ0yqzei/ZoZvo70QR3C+pTs0Vl7oj2Ohi
         PS1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769355511; x=1769960311;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IlJduHNY4/ATTPZTxaM+BbgtP/PXXrqKo+1qMJ4eq2o=;
        b=Y+A1d0whgshZOnB/TeenPNvXl9YpNZWxB5V4UEg9O/kwy5a2LZwxsaCIAYmdJ8dLrO
         rnpF6y9qOBMdThnY2k9z8/sfBkoGGQODQa8qA6tMrSY3Xw6LDFIN6tAZdnHIV4kdBVkm
         BNOKbB1rUK9VK/IaP/AI3+MWMhWo1vt2eoJMynIV2gqF7u6MObWZ0yDxi6bSS3V0uJJp
         Cf4jSbzD1WQX7xTXa4XejIbumKT3lhG3WwTTo2mqjarGqwONBDrCy4yUpqes7rFtSagL
         ALRXKhLLha0dAODlL/yA109OIJZkvonGURTNhj51d7nlE/vlN/aPsLAMlQyb5L0ZBuMi
         9NUg==
X-Forwarded-Encrypted: i=1; AJvYcCVpzxEHkDudJnTqno79yeScUcVI7iLftyB40ygNHuzvIvDxgDk3TpUkg8jJNLbQgDzzLUkcFnVdmJPv@vger.kernel.org
X-Gm-Message-State: AOJu0YzMUd8jUgoleSmUtVRAzVZKXxx/IKlDjHZEAx4RlODahZMml2LJ
	FneE2UwanHJlNm3BGGECDJzrXvWxfacFytIjDSpn0TUROtkCGaVQzN5z
X-Gm-Gg: AZuq6aJlD0Z4O/l3oDiPLxuFyfhENXf7LQm07Sa/fg7/l9hwUBDzMcd+SDecYMaKaAs
	QTvs6I2bojIXwFYnBFt0xDkdydsL/H7LUb14n7Mzq0J/X1guBeD2tirPbvI8jE1hhYd7T3rby/D
	0HjrdOOtLdRWPCqwTD6Tno9yXk02D7SriUxohoSQvR/eNUr4OowVFbWx7g9CWY+AnK/yChJMIRk
	QsISpynqVixH8De1/qMN5WsNeSCMtXcxpZcF2L1AlgGn4iN4VVmzFHFOfOLHx/gnAHNZpiXGe+I
	OqcIwNNiKaZ290UXak0VFa3KYOYCI6qWT/Ccyqpq+7Cj9+4IaCLLM7PBtZNXgUX4g2+/xhy25T2
	/aRQePpchHKYPZZqgXam0C+ya+8bBTaZuljL2LXQ3MPJH5y7Mys8ga9x5EE18lW9nOSTwmeKf+I
	XuTQmhFRtoVYo=
X-Received: by 2002:a05:600c:4f43:b0:477:a54a:acba with SMTP id 5b1f17b1804b1-4805cf5f2b9mr31969485e9.17.1769348592595;
        Sun, 25 Jan 2026 05:43:12 -0800 (PST)
Received: from xeon ([188.163.112.49])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435b1c246ecsm22459688f8f.10.2026.01.25.05.43.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jan 2026 05:43:12 -0800 (PST)
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
Subject: [PATCH v1 01/10] dt-bindings: regulator: cpcap-regulator: convert to schema
Date: Sun, 25 Jan 2026 15:42:53 +0200
Message-ID: <20260125134302.45958-2-clamor95@gmail.com>
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
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-6737-lists,linux-leds=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0C933814C5
X-Rspamd-Action: no action

Convert devicetree bindings for the Motorola CPCAP MFD regulator subnode
from TXT to YAML format. Main functionality preserved and added compatible
for CPCAP regulator set found in the Mot board.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../bindings/regulator/cpcap-regulator.txt    | 35 -------------
 .../regulator/motorola,cpcap-regulator.yaml   | 51 +++++++++++++++++++
 2 files changed, 51 insertions(+), 35 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/regulator/cpcap-regulator.txt
 create mode 100644 Documentation/devicetree/bindings/regulator/motorola,cpcap-regulator.yaml

diff --git a/Documentation/devicetree/bindings/regulator/cpcap-regulator.txt b/Documentation/devicetree/bindings/regulator/cpcap-regulator.txt
deleted file mode 100644
index 36f5e2f5cc0f..000000000000
--- a/Documentation/devicetree/bindings/regulator/cpcap-regulator.txt
+++ /dev/null
@@ -1,35 +0,0 @@
-Motorola CPCAP PMIC voltage regulators
-------------------------------------
-
-Requires node properties:
-- "compatible" value one of:
-    "motorola,cpcap-regulator"
-    "motorola,mapphone-cpcap-regulator"
-    "motorola,xoom-cpcap-regulator"
-
-Required regulator properties:
-- "regulator-name"
-- "regulator-enable-ramp-delay"
-- "regulator-min-microvolt"
-- "regulator-max-microvolt"
-
-Optional regulator properties:
-- "regulator-boot-on"
-
-See Documentation/devicetree/bindings/regulator/regulator.txt
-for more details about the regulator properties.
-
-Example:
-
-cpcap_regulator: regulator {
-	compatible = "motorola,cpcap-regulator";
-
-	cpcap_regulators: regulators {
-		sw5: SW5 {
-			regulator-min-microvolt = <5050000>;
-			regulator-max-microvolt = <5050000>;
-			regulator-enable-ramp-delay = <50000>;
-			regulator-boot-on;
-		};
-	};
-};
diff --git a/Documentation/devicetree/bindings/regulator/motorola,cpcap-regulator.yaml b/Documentation/devicetree/bindings/regulator/motorola,cpcap-regulator.yaml
new file mode 100644
index 000000000000..b73d32a86904
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/motorola,cpcap-regulator.yaml
@@ -0,0 +1,51 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/regulator/motorola,cpcap-regulator.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Motorola CPCAP PMIC regulators
+
+maintainers:
+  - Svyatoslav Ryhel <clamor95@gmail.com>
+
+description:
+  This module is part of the Motorola CPCAP MFD device. For more details
+  see Documentation/devicetree/bindings/mfd/motorola,cpcap.yaml. The
+  regulator controller is represented as a sub-node of the PMIC node
+  on the device tree.
+
+properties:
+  compatible:
+    enum:
+      - motorola,cpcap-regulator
+      - motorola,mapphone-cpcap-regulator
+      - motorola,mot-cpcap-regulator
+      - motorola,xoom-cpcap-regulator
+
+  regulators:
+    type: object
+
+    patternProperties:
+      "$[A-Z0-9]+^":
+        $ref: /schemas/regulator/regulator.yaml#
+        type: object
+        description:
+          Valid regulator names are SW1, SW2, SW3, SW4, SW5, VCAM, VCSI,
+          VDAC, VDIG, VFUSE, VHVIO, VSDIO, VPLL, VRF1, VRF2, VRFREF, VWLAN1,
+          VWLAN2, VSIM, VSIMCARD, VVIB, VUSB, VAUDIO
+
+        required:
+          - regulator-name
+          - regulator-enable-ramp-delay
+          - regulator-min-microvolt
+          - regulator-max-microvolt
+
+        unevaluatedProperties: false
+
+required:
+  - compatible
+
+additionalProperties: false
+
+...
-- 
2.51.0


