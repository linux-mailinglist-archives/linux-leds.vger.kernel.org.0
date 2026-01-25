Return-Path: <linux-leds+bounces-6735-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SCELMYk0dmkQNgEAu9opvQ
	(envelope-from <linux-leds+bounces-6735-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Sun, 25 Jan 2026 16:19:37 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 1955E81263
	for <lists+linux-leds@lfdr.de>; Sun, 25 Jan 2026 16:19:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 81FCA3000FF9
	for <lists+linux-leds@lfdr.de>; Sun, 25 Jan 2026 15:19:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A69D19B5A3;
	Sun, 25 Jan 2026 15:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="je5DuxN0"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59401405F7
	for <linux-leds@vger.kernel.org>; Sun, 25 Jan 2026 15:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769354373; cv=none; b=Ajo+TWV4/7V/BviYZW9DnfM9TfU0AwMhsWFOnRdN1p/5TSKrRqizHmmyikB24SUrFhYQ+VjgYkNqC8PiPVgPQJ6Ck6acTeFi+Wv5+eYwibZEb4U+QITzAjvaaUe4+EhsfE8EzfiqAEQ2zpSjuvc2TMs+t3VxzjOmZUDk8qM5OrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769354373; c=relaxed/simple;
	bh=SNf2NU+hs+ZIS4XXchD9gc1LEk0khnpy5wXM0ouJBNM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Fj8RFZZpgypUdx+J4uIJjKAcc1qh28putw7Ok+5xs4UjZpMKMrJQbiL0jBYkA3b8E8fKihmiB37ptd0DwCHw+UTlmZSPSgRRHKBkgs8nTKIjIafGuQUZu0mLdZ/xNRgPmSE3QZWq9kAQoXgOVf/Kv5YKaTn5KJ25jCY5MmSTomk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=je5DuxN0; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-385baa8afaaso32311201fa.2
        for <linux-leds@vger.kernel.org>; Sun, 25 Jan 2026 07:19:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769354370; x=1769959170; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fXpwpGUeOVZ6gd5Z9uZtu+VcPr504HYG8KCye/qyxZo=;
        b=je5DuxN0Z1HLE3EuIWj+nM2HI1GiWcfBUDxjz0oQVjmY+Z8eF0KFeTV9I9YxFugUHN
         mB5Bddu+2ABT4iT+VEm1cMFDxzPMPiTDS48nQF9zaL7qRAKGa2xDs4yunlLZ2mjOpS1s
         0qmxvmTXn9ieYiYsO67JwD8yCF58NbFafIf8BBrmSaBJK8XRkrJA31z5em+3WJV9UgSh
         eNny/iP7xEk6TgXXgESJKSsbDL0FVLSXvtR0LMIAinFMeJ2ByQdgNE2vagt0m7U9ub3D
         nvlR8Z09tywSbz4RbGKfNhzfScrbAiipciJUELPaWblh3Ju4y7sx2Nkh7uopjqjipH/+
         4EQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769354370; x=1769959170;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fXpwpGUeOVZ6gd5Z9uZtu+VcPr504HYG8KCye/qyxZo=;
        b=o6+dY9+lzxi2BE2D8hy97A3MIzG/HfmQomjAS4lr6dWX6GV4rGGC8JMV10+zEU89TL
         VZdBD+POfC3ManWnQQqW3vgFBqgm2pZWQDJFBQpztj2pDvL6nWa3+8DIhMOEI+6qvP3Q
         K6a3XCcTqayikA2L5F/N1312nyzsIzcfW2qulybnMWh+YuKBWC5P5dSXJG6F63xsFjz9
         xskBHWrhVirBwJS8mTkgzaWILyiRnraPuCB0rshmWqSG3O/AkHSWrl+/62RaxjxpF/u2
         8X6NK6CYhtQgoiCcGnxI4f1XfmHOUr3XYRST2xfeoXL2J+k1jsX0E3zWjrx24+RlGAPF
         DapA==
X-Forwarded-Encrypted: i=1; AJvYcCXkO5S1ybmapa52aBMi8X1RO8d8DJ42kSep0kSsQVzqOX0hJ38fmd3tVpo2V8z3K0iHchxPpCuftCLt@vger.kernel.org
X-Gm-Message-State: AOJu0YyhJxxItcd6z8Lne3nG+hwaKQE7aNW/N98velr43uW9jsfZnX0G
	tBn8bK7FGPFzLDlPRNM478BJV3Bxd+H3zwpf0M2WFWUPBDtcYlZyGAdsqUYN0w==
X-Gm-Gg: AZuq6aLFR4kVLIUzv18bGMm3jSmB8WINql3rV7uiOoUuND0rO4UbTDn5uKtKNisxhEb
	84aUIvNWNniZtTbhj69F/3QncgLPzXOSBQ8wM/T+i1khknCKlNA/vRKarxwaCOprZ6spMjjmYdn
	YTvUMWo1TY979BDuqbP2ol8JcZxdz/zifHviByDgp3FYolx8NnTtvq1ZOGkQbCSyFTZDifaDnxw
	91++pSKF7BpB2NK4/bvfZ3FYph6FLw/Qz/hBSawBaf+5vZfrSz6y4Kg1ZWeKJT8k1+lw0HZYsLf
	1bhmhzPYHiKi44am8PC5q79OpV3dwlzGYG/UsqE7W+prHYhUwfqDE/jqfSGJss+/BGVNdGHk3P1
	KEBhmIeY08jalW5xmhUinatp5GsFCDnk171E1s5qGSLSsLlOOILLxNM/+m8mUZ8t7NeH+GfED84
	Ly
X-Received: by 2002:a05:6000:2403:b0:430:f97a:6f42 with SMTP id ffacd0b85a97d-435ca39c59bmr3398601f8f.54.1769348598831;
        Sun, 25 Jan 2026 05:43:18 -0800 (PST)
Received: from xeon ([188.163.112.49])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435b1c246ecsm22459688f8f.10.2026.01.25.05.43.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jan 2026 05:43:18 -0800 (PST)
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
Subject: [PATCH v1 06/10] dt-bindings: rtc: cpcap-rtc: convert to schema
Date: Sun, 25 Jan 2026 15:42:58 +0200
Message-ID: <20260125134302.45958-7-clamor95@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-6735-lists,linux-leds=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 1955E81263
X-Rspamd-Action: no action

Convert RTC devicetree bindings for the Motorola CPCAP MFD from TXT to
YAML format. This patch does not change any functionality; the bindings
remain the same.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../devicetree/bindings/rtc/cpcap-rtc.txt     | 18 -----------
 .../bindings/rtc/motorola,cpcap-rtc.yaml      | 32 +++++++++++++++++++
 2 files changed, 32 insertions(+), 18 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/rtc/cpcap-rtc.txt
 create mode 100644 Documentation/devicetree/bindings/rtc/motorola,cpcap-rtc.yaml

diff --git a/Documentation/devicetree/bindings/rtc/cpcap-rtc.txt b/Documentation/devicetree/bindings/rtc/cpcap-rtc.txt
deleted file mode 100644
index 45750ff3112d..000000000000
--- a/Documentation/devicetree/bindings/rtc/cpcap-rtc.txt
+++ /dev/null
@@ -1,18 +0,0 @@
-Motorola CPCAP PMIC RTC
------------------------
-
-This module is part of the CPCAP. For more details about the whole
-chip see Documentation/devicetree/bindings/mfd/motorola-cpcap.txt.
-
-Requires node properties:
-- compatible: should contain "motorola,cpcap-rtc"
-- interrupts: An interrupt specifier for alarm and 1 Hz irq
-
-Example:
-
-&cpcap {
-	cpcap_rtc: rtc {
-		compatible = "motorola,cpcap-rtc";
-		interrupts = <39 IRQ_TYPE_NONE>, <26 IRQ_TYPE_NONE>;
-	};
-};
diff --git a/Documentation/devicetree/bindings/rtc/motorola,cpcap-rtc.yaml b/Documentation/devicetree/bindings/rtc/motorola,cpcap-rtc.yaml
new file mode 100644
index 000000000000..bf2efd432a23
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/motorola,cpcap-rtc.yaml
@@ -0,0 +1,32 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/rtc/motorola,cpcap-rtc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Motorola CPCAP PMIC RTC
+
+maintainers:
+  - Svyatoslav Ryhel <clamor95@gmail.com>
+
+description:
+  This module is part of the Motorola CPCAP MFD device. For more details
+  see Documentation/devicetree/bindings/mfd/motorola,cpcap.yaml. The
+  RTC is represented as a sub-node of the PMIC node on the device tree.
+
+properties:
+  compatible:
+    const: motorola,cpcap-rtc
+
+  interrupts:
+    items:
+      - description: alarm interrupt
+      - description: 1 Hz interrupt
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


