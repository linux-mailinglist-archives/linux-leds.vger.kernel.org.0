Return-Path: <linux-leds+bounces-6993-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UB2KOiT2m2lI+QMAu9opvQ
	(envelope-from <linux-leds+bounces-6993-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 23 Feb 2026 07:39:32 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C6C4172348
	for <lists+linux-leds@lfdr.de>; Mon, 23 Feb 2026 07:39:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9D06E3028359
	for <lists+linux-leds@lfdr.de>; Mon, 23 Feb 2026 06:39:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E90C34889A;
	Mon, 23 Feb 2026 06:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iUQAthXI"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B87A3446AF
	for <linux-leds@vger.kernel.org>; Mon, 23 Feb 2026 06:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771828754; cv=none; b=twGSljdSp9Qu4n6eZfQ7IgblMvjHwFGJ3ToOMuaDp2z23Blw8Mu/ORYFN46gAlglaO9Mz6nkD2EM2AoNiX9oCgH37W7kd9JCIwspHumIDQ8iCCOpxH3zRwv9i1ZILyk5SJNYG7j1MKuLWt5cYSEztZi+E+b5Z8n0g2WgjPw33yA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771828754; c=relaxed/simple;
	bh=q8Lq6+Cvt3B/SkkRYA6XHIWjWyV8PlukszbooxWFxR8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a5+c/n+f5FE7E872zEIDYdS1u+O4gw+8yAEBJYn2YLHyt3gVFMJQuEDskOMMCTWrMiIJxzxMYKveb5eXzctzHr4yAtOwtGHojFcQaJvY26p2gQqiYxfDZo+2P/j1XDJilQHtBoFo3IaEUKv6JR6QMuHdV4kLanQHUlfBpeLjiJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iUQAthXI; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-59e4989dacdso4135967e87.1
        for <linux-leds@vger.kernel.org>; Sun, 22 Feb 2026 22:39:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771828750; x=1772433550; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QBhVm8HFMDMXwYhsB0aG8oH//jaDuQqOFuWYFh+Nf9c=;
        b=iUQAthXI7eW3yNfemv5ufny2ApHP+iy+QlPJVPg1eUqsI2LPfFKjUDaK4582E+mr2t
         BhfuS7lBObeOd9GdLj3WJQ2ZiMPiu35nLckH6OiXM4W5bDNxpe1DpaZ/qxN2enWQAvUP
         uxn5z+ouJAyWi2b8Oty/2Mlt74sB19IygSfSzST3jOYoWKEP7+jLceKSpEKeFKQGgQqw
         3BvvsuFiWhAMqiQb5qeXug9ST/BClrW44NTh6DA59WzwRGyPTmAWJJx6Mb5rVZAM5VI5
         RiKKZv0zJ58e2uTpi11OyMPOf7VZat3orHqMwCDhNoUsuK+EV0CHvwPxpAu1ljsWbQDJ
         NBhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771828750; x=1772433550;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QBhVm8HFMDMXwYhsB0aG8oH//jaDuQqOFuWYFh+Nf9c=;
        b=X2sL9+xHpA+fj1U2aBJNli1f/5Kgz42/uldpojHlYQc3FeeSHPNuXrq/uyCWcAPc+R
         u3/2ZQKhmt1p7CEGOuQ6h25VsLA4B3b+KwjUHImBhskz4qJRWQdqSskZtwaiFS9p/yR1
         +13NegZvz5gWU0HJzNL7p5XZLmdfN9JIkn8ThHxNAJW5dGwY8zQMgqYq2GXkfV79NBFK
         5T/54fxiMe7vliASZGtpUfK9gQl36LTYRQIBJLhtT4ASxTUPgK+vgaggW+kMXi/ds/1c
         iE5HQvH8eeWiDr3vvwgk4vaEK3PNZ8oE5mcexsr3pNdzSKiBZUWbXtUf0Q1rzbNtawz0
         UY3g==
X-Forwarded-Encrypted: i=1; AJvYcCXNrzrE87MCfrgcwjp1VxtMFfhxKWLWz4DyggsN7WkvTZDnoWAyTAvqqMjkiX9UHk1ZXnvKC6c2dpS9@vger.kernel.org
X-Gm-Message-State: AOJu0Yw166TUwIKfynt3PJqadei4/LsG/TrxRj6hMHjIp7jclNZPPUwr
	a3+E9CYbRkb7B6vvWEP1Q6RvJQlGZxYNmhSg6szbnxzsP1/DiwqW5eq8
X-Gm-Gg: AZuq6aJ0/C/QuSorn1JYJBj4AGvTJcSTZTdlVDhQ0pdjdxLGdMxQMjnQDq/P7+AtIl/
	tE9XpjbCFyBsVfp7Wq7FgqFNKxQudgow+pmgtFNcfeDG7iP18ifDXeMGXzotJ/9EFc22KSrMbne
	1cO1qv2dIRWjFGcmDQSfyJN5hbbklGCB41GG9mqLYegzFwacO+60WZ8+ZFtIHY62XXPPDhuwJ42
	I0pxIcSAqgJcqZ3Hk37HbjNSDhTvdjTcrKVeeFs8Xz7Pvo0IGO5o34RTo5Hzsy7/FhZLCj/7zLe
	ez1WKvhui5033aD/j0gRysjmyAVNah6P/2cgeaB3khbTt9aHSbE9/Dy+OPguj+qkEya0wWe3Hbe
	YE84HjmZCYOe69ObPpKJorexreN7wbd8fSYTMQtaVPrKlymIShyDV/q0C3EKxnbaBKEls5Gpzmf
	YYLa4xl/8d1r9L
X-Received: by 2002:a05:6512:22c3:b0:5a0:f49a:353a with SMTP id 2adb3069b0e04-5a0f49a359amr282610e87.39.1771828750144;
        Sun, 22 Feb 2026 22:39:10 -0800 (PST)
Received: from xeon ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a0eeb13abbsm1369626e87.23.2026.02.22.22.39.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Feb 2026 22:39:09 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	David Lechner <dlechner@baylibre.com>,
	Tony Lindgren <tony@atomide.com>
Cc: linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org
Subject: [PATCH v3 1/9] dt-bindings: regulator: cpcap-regulator: convert to DT schema
Date: Mon, 23 Feb 2026 08:38:50 +0200
Message-ID: <20260223063858.12208-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260223063858.12208-1-clamor95@gmail.com>
References: <20260223063858.12208-1-clamor95@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-6993-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,baylibre.com,atomide.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 7C6C4172348
X-Rspamd-Action: no action

Convert devicetree bindings for the Motorola CPCAP MFD regulator subnode
from TXT to YAML format. Main functionality preserved.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../bindings/regulator/cpcap-regulator.txt    | 35 --------------
 .../regulator/motorola,cpcap-regulator.yaml   | 46 +++++++++++++++++++
 2 files changed, 46 insertions(+), 35 deletions(-)
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
index 000000000000..ed28d2653a55
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/motorola,cpcap-regulator.yaml
@@ -0,0 +1,46 @@
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
+      "^(SW[1-6]|V(CAM|CSI|DAC|DIG|FUSE|HVIO|SDIO|PLL|RF[12]|RFREF|WLAN[12]|SIM|SIMCARD|VIB|USB|AUDIO))$":
+        $ref: /schemas/regulator/regulator.yaml#
+        type: object
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


