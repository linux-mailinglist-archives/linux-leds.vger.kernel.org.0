Return-Path: <linux-leds+bounces-6868-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6JYSLWwlhmlSKAQAu9opvQ
	(envelope-from <linux-leds+bounces-6868-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 06 Feb 2026 18:31:24 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E48D1010CF
	for <lists+linux-leds@lfdr.de>; Fri, 06 Feb 2026 18:31:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 48CA63020EC6
	for <lists+linux-leds@lfdr.de>; Fri,  6 Feb 2026 17:29:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37FF342668A;
	Fri,  6 Feb 2026 17:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Riy2l0yL"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D13F6425CFE
	for <linux-leds@vger.kernel.org>; Fri,  6 Feb 2026 17:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770398961; cv=none; b=Lvzsjr8jX2E40IcISV0jYAAxfgtuCWGN4H940XdBqmFKkvVyMvzN5rbzJwDqj+IAGUZGXPfnpXisbs/Yy0IRKhGAQi9DrUnwMr4Ug7J6cNJtaVVa422suWMO6HorWrgNr/WGB+dA5aZn1CJcXOiJOJYBBOlarcATENEU/NF1IuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770398961; c=relaxed/simple;
	bh=+xCYYkFGQ4JgB4ICZr6PyE2V+kBr+3lOCPplqVBjWes=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OgA89MlELskVqzCeu7f99KAr6b7Jd6WFyBfQf/9RpsRaN73SH3yhBZXJcGSzJAuMyOKzpbwuLAxfx58989/7Yo4kBS7a0y1xt6Ad+YoefY0I40cwVRaO7wAsEFG+bFDYKYaH+MzLriHDgKaXEx6JHA8Fd/emePd4DDUPkH3AzvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Riy2l0yL; arc=none smtp.client-ip=209.85.221.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f65.google.com with SMTP id ffacd0b85a97d-4362e77d7fbso506753f8f.2
        for <linux-leds@vger.kernel.org>; Fri, 06 Feb 2026 09:29:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770398959; x=1771003759; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MLyVcjdxnN/By9KBCrGjy5x8Jg9Sn7LCgXxWdazKspA=;
        b=Riy2l0yLjmRwP1ulNGS9BVzMh/hEKtZqCbooYDKNdtnbQ0VQ8bRBTwHK8CxnJztbsv
         Lz/FJ+5gnMO9shXOrrKes9P2eIhryTUzzZ7NzJ24Se2FXx/PBSf9UM2M+6nJM1E5hrP7
         BOiXfz8edzIXP/HcRJr94XLm6TwjXLYOHezwKCd+njpvWA7z3DSsvDdmwpKZAcKUhn9L
         a2QbnJ9jvpvWV+YP7d4DxAIypNovWMP/qJvwnqNJ3N0yVhEoBRlZ+A+BVZTJz1U0uFdJ
         V9MUcmcERsmMnpY0jWr4XSQTUYRVdHJGsFh1JeE/hIhKGJp397+U6jDkoMSeGTJEodZS
         l/nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770398959; x=1771003759;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MLyVcjdxnN/By9KBCrGjy5x8Jg9Sn7LCgXxWdazKspA=;
        b=vw4ofpfe1Zdz17eMl8dW7rusBS5W8LzsqaFZgg/racjeWKjn0JxCcDQI+DPkj2+ERG
         eV7PzgWrheHXLGo2E7/0D0GDWjhyyY0NmSzsVhduaLm30QjoAELOAU04GJgZQue22nNN
         rJYe4DMtbKCmoAm8x5H/hidnoifsL6PRnZhwV4zvzxsled6VzJl2lgECMe0TZtmPX4jF
         L9idgP2iU3JwvKqGqZfhTmxzeSdb07TfTgUQmatA3OFSlFZ6LLQ+OSRnGUWOUy4MnvLB
         tAp1BOeXWqOXiemWc0MXaJje77UpD44hGiOrtPDvtJ9Zbs96Jx8POMRjAcTYZhygz7sX
         waVg==
X-Forwarded-Encrypted: i=1; AJvYcCX/pwxJk4rxUZMdNqJ/lH10Kw5SnPKB+eHZs3cLrCiooIR3ny25KooTx2wAuW/IM2gqjnOImmvoD4ro@vger.kernel.org
X-Gm-Message-State: AOJu0YzWFK6LqIEeMI59mpG66TRF/JgzR2yi6Ul0OYcb5ddK64hILAXc
	jndj9/z0f6nlNnxZonUEGP9xaD/0j5lio/IY7shTGcWAePLZ8XCHa4fW
X-Gm-Gg: AZuq6aIjLE+LrzRbzUy4zbCwgXb1WCeqDQhUvuOnZwdKHaFhZBSUjyqe/OZOLWvQ5AZ
	+w9ga7tyh9ExHoxsrACw1d3EwuAkvRmKgs35BY6+wCxulQjSP0gLkpgxeJ4GqNZQCk/Nila/7KW
	GoJ1BbuBZfNzk3AFz9lETH/rFShvTb4LNoGuY13+pDJMICFIuwPV7xc0LVHYlqXzYwIQINWwu8X
	fV83XzHpQDFlR1Bk57BX6LpeNEUK/HLbM9SOsomITi87/ulU0EfovYsQeyEPun9sKyLG0BgtVuB
	gn3iqmRy2V62xsPmSz5IoHdtfYMpTM9SFvlz9tDTADEnfszWvE06wVH9GD1aUmUDTjbLDCBUl7V
	DtyWMc3qkJs8mdAcZj/dcz3B/Xnbzo6+jjNbML//Qp2VhcvxRoJv0IitY+nRStrh5b1s2HhWDyD
	ug
X-Received: by 2002:a05:6000:2485:b0:435:9ee1:f91a with SMTP id ffacd0b85a97d-4362938b450mr5960628f8f.53.1770398959002;
        Fri, 06 Feb 2026 09:29:19 -0800 (PST)
Received: from xeon ([188.163.112.49])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43629734268sm6846033f8f.24.2026.02.06.09.29.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 09:29:18 -0800 (PST)
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
Subject: [PATCH v2 07/11] dt-bindings: input: cpcap-pwrbutton: convert to DT schema
Date: Fri,  6 Feb 2026 19:28:41 +0200
Message-ID: <20260206172845.145407-8-clamor95@gmail.com>
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
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6868-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,baylibre.com,analog.com,gmail.com,atomide.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.994];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 2E48D1010CF
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
index 000000000000..77a3e5a47d1a
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
+    items:
+      - description: CPCAP's ON interrupt
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


