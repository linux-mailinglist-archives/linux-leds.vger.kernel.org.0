Return-Path: <linux-leds+bounces-6862-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6EDIGNUlhmlSKAQAu9opvQ
	(envelope-from <linux-leds+bounces-6862-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 06 Feb 2026 18:33:09 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D71E8101193
	for <lists+linux-leds@lfdr.de>; Fri, 06 Feb 2026 18:33:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CA107303DAEF
	for <lists+linux-leds@lfdr.de>; Fri,  6 Feb 2026 17:29:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11F243EFD0F;
	Fri,  6 Feb 2026 17:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FgPDQKSo"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5A9C3EDACB
	for <linux-leds@vger.kernel.org>; Fri,  6 Feb 2026 17:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770398951; cv=none; b=W2N0QC1bysswzNLN+QPRIwROGq32cKG6ELKcGq8s4JmCbZU8RMCRIyaM6bVcZGzaJqXeWMn2gwcterAVMtAbAWsGqpmSu06I03B5CBb3FFefE1s+TM8TW4hug8hOdL3xtyZKTCjkl35jEvg8i6cw7MTy4LSnB4r5TSPZXWAUbjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770398951; c=relaxed/simple;
	bh=go/e5AhcYE8/Tplv0QTwdsPe/+XcWA/g3Cpb4GxDoxU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Qsgnv8mFgkLntbXU01hD7YNy77eHgX82ZVAa/TiH62O39Dcv9QJ3Fl3sDHQjWh/m7pyZrHrYg2xzWf889pSs0n3+/PN0ugnMwV/EGVkCXZVUEm5ZkywUeHozut4e/P8j2WfqMUlaTUl1gw0/xhc6DdvGfYRDqdGrQS0RKDA86Bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FgPDQKSo; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-43622089851so1828166f8f.3
        for <linux-leds@vger.kernel.org>; Fri, 06 Feb 2026 09:29:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770398949; x=1771003749; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2tz2XBML6rb46dksX4n5A3OWDvNM/mO62BfufBhK37w=;
        b=FgPDQKSoeO7hVk0TCLY1PKX9esGMzueRdENXD8NlMkhpoAC9AK7SRwBD8d8rT9Yj8D
         lIrBm8Q1xCKE2BsBHSFOC064QRHVJu13cIymDL5lm3SEVsbWGgJ3IfjMp6a2kHG1duSx
         0u1RYMMlzsloWQtG2672rbxHEBzrJaqjs1BiNb7fEwpKSG8F/M02yY+o9QQRX+Foqeoo
         LIdXUEYdGwg0vOzDi7oiFtVecyl+ovePElK0EKsOLJar+JdLyHBH98w8TA+voz5bPRyn
         vcGTApga0kl835KlauHYo5MEzAZV6wGitJ9vagJdeYUeUEx6ZNjjWKa2DFARfK1PWpgn
         iNXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770398949; x=1771003749;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2tz2XBML6rb46dksX4n5A3OWDvNM/mO62BfufBhK37w=;
        b=Dzy3ZcCRQ1MXGbWa3YZ9b9F4Sugnwf42Ysfun1xIrGcZdl/l7i2AtTe6VsvJB7o6Qz
         pEblED0RqOOpY332UWF3n+rTcpRU1EbAnJcioKC5IgBi/OHLHQ9yartxfJsUtaXIPNPO
         1nTBiYQDYbK8qhkGtsQYjt0CLwabMLromyv5RJeefCyOtprh4HHhRf11q5yMNzakSPir
         PayUlu2R+NIH0bYTWDbOAdrI77oaOfy9ELd25AfJwqD9YsNvcrpomouUvdch/LyfWoq9
         waAQ9HGVXvwiAXjnVmK6xPib1RwKx6Ih/J4IVl7fWE5+lpOY8dDdOqqHUH2KYuL8HqUh
         SQ2A==
X-Forwarded-Encrypted: i=1; AJvYcCVhcinpnLbrI0soq6GtO2DxRYyK9n++q+GzCCckrXPFWXW0vGyh6kYNBqKG7paEdTfiR11SJy4exGp6@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0LbuQSgeeGSKJMi3ojQizIjxmIHbCKyjfLNH1HvCQP2/gQTYw
	mp6mexrQRirr7fTUaSIO/DqnIV8bDBep1eOdwC4FiaeHd7jNDrpeyEVn
X-Gm-Gg: AZuq6aL4p5X30JEHmmnpr9hxaTbIf/OjOSgoP43TVizx/G2nEHOI96W71yV7Yq8h8Kq
	yhs5Uh/+qAMxYA13RqaSSiUNFMCyeLRqQSvR4fx00/ffksWR+iOXRtE1vuCU+UonAg8G2u79zEc
	IBYvlRr1fJ88F3Ca9XivVUgu4KIcgCr1y9ktVyyJKFLlPjBiU58ByBgHXExx7hJfbxEQ6LPQuLi
	8uJ5TxPNW/7yO5xDgfD+QMfGUGw9B3ipbYXCUzZJjz45OPNewkwx1Ifey13OmtKRcKgOXylKJi+
	NS+mTTpzN5OM4jCV7oGs6cQE3WVfYvSB0ccVmA9wsLFi0+F5lh37Cl8lLA5XGErsreMTRdwodFQ
	if0ojkOQLjHymPOc871FiAg8tlh+Lpr+eeOqCWTLvU563OYc9+FFtnDrzIj76yYos+vFMynBCJX
	Su
X-Received: by 2002:a5d:5d87:0:b0:435:97ab:1288 with SMTP id ffacd0b85a97d-4362938ff35mr5394807f8f.58.1770398948881;
        Fri, 06 Feb 2026 09:29:08 -0800 (PST)
Received: from xeon ([188.163.112.49])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43629734268sm6846033f8f.24.2026.02.06.09.29.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 09:29:08 -0800 (PST)
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
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Dixit Parmar <dixitparmar19@gmail.com>,
	Tony Lindgren <tony@atomide.com>
Cc: linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-leds@vger.kernel.org
Subject: [PATCH v2 01/11] dt-bindings: regulator: cpcap-regulator: convert to DT schema
Date: Fri,  6 Feb 2026 19:28:35 +0200
Message-ID: <20260206172845.145407-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260206172845.145407-1-clamor95@gmail.com>
References: <20260206172845.145407-1-clamor95@gmail.com>
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
	TAGGED_FROM(0.00)[bounces-6862-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_TO(0.00)[kernel.org,baylibre.com,analog.com,gmail.com,atomide.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	NEURAL_HAM(-0.00)[-0.995];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D71E8101193
X-Rspamd-Action: no action

Convert devicetree bindings for the Motorola CPCAP MFD regulator subnode
from TXT to YAML format. Main functionality preserved.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../bindings/regulator/cpcap-regulator.txt    | 35 -------------
 .../regulator/motorola,cpcap-regulator.yaml   | 50 +++++++++++++++++++
 2 files changed, 50 insertions(+), 35 deletions(-)
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
index 000000000000..50bc57f06b51
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/motorola,cpcap-regulator.yaml
@@ -0,0 +1,50 @@
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


