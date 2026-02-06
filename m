Return-Path: <linux-leds+bounces-6864-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KBgzHv4khmlSKAQAu9opvQ
	(envelope-from <linux-leds+bounces-6864-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 06 Feb 2026 18:29:34 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D4F3101012
	for <lists+linux-leds@lfdr.de>; Fri, 06 Feb 2026 18:29:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 14F79301C958
	for <lists+linux-leds@lfdr.de>; Fri,  6 Feb 2026 17:29:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EE8F3EDABB;
	Fri,  6 Feb 2026 17:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d6Zuzn2H"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C21823D903C
	for <linux-leds@vger.kernel.org>; Fri,  6 Feb 2026 17:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770398954; cv=none; b=DaoWok5CQhDNyQ2YrmwkqP3bXiqQ+ejclbnTTzEGThMTn+gyCcverUJrhkurJxMpgfHm7bRCHq16e9BDP8b02+U0j3VhfFHmHdFxV52at6tsGCN96dn8sn7AIZkL1CJ2gzBKTqwQRBnFY564ttOO9YjWls5oENCNpIvC9KFv7Lw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770398954; c=relaxed/simple;
	bh=zo3qgbBbFWF30eK7I25eO1l+g4Zmu3OeutXGZXBp6hE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mNO+rtWSpEz0O5leMdjl/2WKmNWC2JynVUqvGzcZz0KYTPPPxKNTSbnZUJ8Z98tFCYH04yA0HEMB10gJrykkDdXqFPOCSJYd/OLoNJNsgvQIDP8srGmDtrj3H6O8uGTk26q9zdBV0bxxohwlwr0m1plAiyYi5byNG2C2xeUz7pQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d6Zuzn2H; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4806e0f6b69so18609945e9.3
        for <linux-leds@vger.kernel.org>; Fri, 06 Feb 2026 09:29:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770398952; x=1771003752; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0Jf5C8PE1lxuMTJXxYUiUAeT9CSKhU2v7EHDew7zpbQ=;
        b=d6Zuzn2HzAOiLY+ZKxPnarcco46nK/E8EUiZChtYskp3kbj+GrKObGUx7An95FvXJ4
         W/EU7qZCBPxAZS7q4KfAvqZXBZAx5t3J4iffX+lcVFaaV9/h4PWnLSv7R6zyMCQnBua4
         PoJ3jBi5PD9Qt9hmooiq2/sZKLqn49zc5j1+BpyRlk5E8/77d/IxfhPAyIRVYNwkbtGg
         6D3m56jgzLnw1pAmRS9tOnJP3VS5whOENlka4p4qxZLX4y6Iar4ohlQjzQmGwARPV41A
         tLEGWa2lQNfllyXGmb3/VzVEtKGu/gpVbswKF49ftJX9T+umDIygnFROPep0981pfxkK
         rFYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770398952; x=1771003752;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0Jf5C8PE1lxuMTJXxYUiUAeT9CSKhU2v7EHDew7zpbQ=;
        b=kY9ppeLoAneaqGR+UiV/vVJlfr57sUnO8ViiBFNsf60pkiZ1BweN9vHR3m8nqXz3o0
         /zmjx4w/wCJK2wQM1wgWb8m2JF/Ac6RHTFyrDycqHvu+CNOKbN1lGLOnnaxdJ40i4tI9
         mSWzsqxwTK6Je/bZY6fZ4k22QS/w0J8lV1n7sak+vHBVn7+JovNW8buTwQvxnvFgkJBx
         uLlxT6hhpOWgOdSEmuwePFX7lvxLq4FfLhURq2cd959UmwiYL1WEteZChpqoks+yRauG
         aY+Lij3MKohrLcZz8IFwZ608J++6xEXizdadHl5AAEVN7p60r0ic0pZN10xrzxRH4n6o
         cnxA==
X-Forwarded-Encrypted: i=1; AJvYcCX3zjqSL7nBWqd1blKxX8tmrWdblLYzRLsi5Elv8Zr99X0sA3fwG0KBsY5YKTWFFvFkiRRqunsxgoYv@vger.kernel.org
X-Gm-Message-State: AOJu0YyUIP6nFl6uD1QXgHhy9qBHJ3ARVe+JCIzsh4h7fRZtGyVpu5pY
	lDm5fafmsPbTLlDUDBrSwd67JUTwOWL2JW6ljUbN8ptWYkyFuKN3u8Tk
X-Gm-Gg: AZuq6aLiefB9Y27J2dvlTJMlDDy6eU70hKwDqETIRKFinQyqO69YGeT3eRloei1o0oH
	ZcSc3Uuj8UQbr2DnxCoju+7wuJ4BI6ZRlt1HkJQdWKD/vtzNHZOyOF7Nbw7pVq64bZaAf5fMLjh
	USdXilD+0n8tpUoiPwTanHr0wL7QMs0T0NzEicCCOxdfWM71LgJ6MGrH1nIRTVrRaDdY+LoBv9k
	uz4qYmop3xhiBcNkccjx69pbz7fF6W8MjCd6rFbJ7HF02HxE0b2XRjr2qWYEiA3Wq1Wpm639wYa
	cdrcBZyhSRislBTjaNcZ6Uew0uJXk3NRZerT0aEyBVs1YZj2bV3+45oTLMfjIAn5I0lp0wWhHOn
	JfLquQTPhfBNlt6Pk6g5R+H/UWaRlkJ3fCi73ZYruypTKHHR6yHKgLArofcdaV+dbbcI2AXVV5U
	ZO
X-Received: by 2002:a05:600c:5488:b0:480:1e8f:d15f with SMTP id 5b1f17b1804b1-483201d5fa2mr48469135e9.2.1770398952010;
        Fri, 06 Feb 2026 09:29:12 -0800 (PST)
Received: from xeon ([188.163.112.49])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43629734268sm6846033f8f.24.2026.02.06.09.29.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 09:29:11 -0800 (PST)
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
Subject: [PATCH v2 03/11] regulator: cpcap-regulator: add support for Mot regulators
Date: Fri,  6 Feb 2026 19:28:37 +0200
Message-ID: <20260206172845.145407-4-clamor95@gmail.com>
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
	TAGGED_FROM(0.00)[bounces-6864-lists,linux-leds=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.990];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 2D4F3101012
X-Rspamd-Action: no action

Add support for regulator set used in Motorola Mot board, used as a base
for Atrix 4G and Droid X2 smartphones.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/regulator/cpcap-regulator.c | 105 ++++++++++++++++++++++++++++
 1 file changed, 105 insertions(+)

diff --git a/drivers/regulator/cpcap-regulator.c b/drivers/regulator/cpcap-regulator.c
index 6958d154442b..63f5c90ddf50 100644
--- a/drivers/regulator/cpcap-regulator.c
+++ b/drivers/regulator/cpcap-regulator.c
@@ -261,6 +261,30 @@ static const struct regulator_ops cpcap_regulator_ops = {
 };
 
 static const unsigned int unknown_val_tbl[] = { 0, };
+static const unsigned int sw_mot_val_tbl[] =  { 600000, 612500, 625000,
+						637500, 650000, 662500,
+						675000, 687500, 700000,
+						712500, 725000, 737500,
+						750000, 762500, 775000,
+						787500, 800000, 812500,
+						825000, 837500, 850000,
+						862500, 875000, 887500,
+						900000, 912500, 925000,
+						937500, 950000, 962500,
+						975000, 987500, 1000000,
+						1012500, 1025000, 1037500,
+						1050000, 1062500, 1075000,
+						1087500, 1100000, 1112500,
+						1125000, 1137500, 1150000,
+						1162500, 1175000, 1187500,
+						1200000, 1212500, 1225000,
+						1237500, 1250000, 1262500,
+						1275000, 1287500, 1300000,
+						1312500, 1325000, 1337500,
+						1350000, 1362500, 1375000,
+						1387500, 1400000, 1412500,
+						1425000, 1437500, 1450000,
+						1462500, 1475000, };
 static const unsigned int sw2_sw4_val_tbl[] = { 612500, 625000, 637500,
 						650000, 662500, 675000,
 						687500, 700000, 712500,
@@ -284,6 +308,7 @@ static const unsigned int sw2_sw4_val_tbl[] = { 612500, 625000, 637500,
 						1362500, 1375000, 1387500,
 						1400000, 1412500, 1425000,
 						1437500, 1450000, 1462500, };
+static const unsigned int sw3_val_tbl[] = { 1350000, 1800000, 1850000, 1875000, };
 static const unsigned int sw5_val_tbl[] = { 0, 5050000, };
 static const unsigned int vcam_val_tbl[] = { 2600000, 2700000, 2800000,
 					     2900000, };
@@ -402,6 +427,82 @@ static const struct cpcap_regulator omap4_regulators[] = {
 	{ /* sentinel */ },
 };
 
+static const struct cpcap_regulator mot_regulators[] = {
+	CPCAP_REG(SW1, CPCAP_REG_S1C1, CPCAP_REG_ASSIGN2,
+		  CPCAP_BIT_SW1_SEL, sw_mot_val_tbl,
+		  0x6f00, 0x7f, 0x6800, 0, 0),
+	CPCAP_REG(SW2, CPCAP_REG_S2C1, CPCAP_REG_ASSIGN2,
+		  CPCAP_BIT_SW2_SEL, sw_mot_val_tbl,
+		  0x6f00, 0x7f, 0x4804, 0, 0),
+	CPCAP_REG(SW3, CPCAP_REG_S3C, CPCAP_REG_ASSIGN2,
+		  CPCAP_BIT_SW3_SEL, sw3_val_tbl,
+		  0x578, 0x3, 0x043c, 0, 0),
+	CPCAP_REG(SW4, CPCAP_REG_S4C1, CPCAP_REG_ASSIGN2,
+		  CPCAP_BIT_SW4_SEL, sw_mot_val_tbl,
+		  0x6f00, 0x7f, 0x4909, 0, 0),
+	CPCAP_REG(SW5, CPCAP_REG_S5C, CPCAP_REG_ASSIGN2,
+		  CPCAP_BIT_SW5_SEL, sw5_val_tbl,
+		  0x28, 0, 0x20, 0, 0),
+	CPCAP_REG(SW6, CPCAP_REG_S6C, CPCAP_REG_ASSIGN2,
+		  CPCAP_BIT_SW6_SEL, unknown_val_tbl,
+		  0, 0, 0, 0, 0),
+	CPCAP_REG(VCAM, CPCAP_REG_VCAMC, CPCAP_REG_ASSIGN2,
+		  CPCAP_BIT_VCAM_SEL, vcam_val_tbl,
+		  0x87, 0x30, 0x7, 0, 420),
+	CPCAP_REG(VCSI, CPCAP_REG_VCSIC, CPCAP_REG_ASSIGN3,
+		  CPCAP_BIT_VCSI_SEL, vcsi_val_tbl,
+		  0x47, 0x10, 0x7, 0, 350),
+	CPCAP_REG(VDAC, CPCAP_REG_VDACC, CPCAP_REG_ASSIGN3,
+		  CPCAP_BIT_VDAC_SEL, vdac_val_tbl,
+		  0x87, 0x30, 0x0, 0, 420),
+	CPCAP_REG(VDIG, CPCAP_REG_VDIGC, CPCAP_REG_ASSIGN2,
+		  CPCAP_BIT_VDIG_SEL, vdig_val_tbl,
+		  0x87, 0x30, 0x0, 0, 420),
+	CPCAP_REG(VFUSE, CPCAP_REG_VFUSEC, CPCAP_REG_ASSIGN3,
+		  CPCAP_BIT_VFUSE_SEL, vfuse_val_tbl,
+		  0xa0, 0xf, 0x0, 0, 420),
+	CPCAP_REG(VHVIO, CPCAP_REG_VHVIOC, CPCAP_REG_ASSIGN3,
+		  CPCAP_BIT_VHVIO_SEL, vhvio_val_tbl,
+		  0x17, 0, 0x2, 0, 0),
+	CPCAP_REG(VSDIO, CPCAP_REG_VSDIOC, CPCAP_REG_ASSIGN2,
+		  CPCAP_BIT_VSDIO_SEL, vsdio_val_tbl,
+		  0x87, 0x38, 0x2, 0, 420),
+	CPCAP_REG(VPLL, CPCAP_REG_VPLLC, CPCAP_REG_ASSIGN3,
+		  CPCAP_BIT_VPLL_SEL, vpll_val_tbl,
+		  0x47, 0x18, 0x1, 0, 420),
+	CPCAP_REG(VRF1, CPCAP_REG_VRF1C, CPCAP_REG_ASSIGN3,
+		  CPCAP_BIT_VRF1_SEL, vrf1_val_tbl,
+		  0xac, 0x2, 0, 0, 10),
+	CPCAP_REG(VRF2, CPCAP_REG_VRF2C, CPCAP_REG_ASSIGN3,
+		  CPCAP_BIT_VRF2_SEL, vrf2_val_tbl,
+		  0x23, 0x8, 0, 0, 10),
+	CPCAP_REG(VRFREF, CPCAP_REG_VRFREFC, CPCAP_REG_ASSIGN3,
+		  CPCAP_BIT_VRFREF_SEL, vrfref_val_tbl,
+		  0x23, 0x8, 0, 0, 420),
+	CPCAP_REG(VWLAN1, CPCAP_REG_VWLAN1C, CPCAP_REG_ASSIGN3,
+		  CPCAP_BIT_VWLAN1_SEL, vwlan1_val_tbl,
+		  0x47, 0x10, 0x5, 0, 420),
+	CPCAP_REG(VWLAN2, CPCAP_REG_VWLAN2C, CPCAP_REG_ASSIGN3,
+		  CPCAP_BIT_VWLAN2_SEL, vwlan2_val_tbl,
+		  0x20c, 0xc0, 0xd, 0, 420),
+	CPCAP_REG(VSIM, CPCAP_REG_VSIMC, CPCAP_REG_ASSIGN3,
+		  0xffff, vsim_val_tbl,
+		  0x23, 0x8, 0, 0, 420),
+	CPCAP_REG(VSIMCARD, CPCAP_REG_VSIMC, CPCAP_REG_ASSIGN3,
+		  0xffff, vsimcard_val_tbl,
+		  0x1e80, 0x8, 0x1e00, 0, 420),
+	CPCAP_REG(VVIB, CPCAP_REG_VVIBC, CPCAP_REG_ASSIGN3,
+		  CPCAP_BIT_VVIB_SEL, vvib_val_tbl,
+		  0x1, 0xc, 0x1, 0, 500),
+	CPCAP_REG(VUSB, CPCAP_REG_VUSBC, CPCAP_REG_ASSIGN3,
+		  CPCAP_BIT_VUSB_SEL, vusb_val_tbl,
+		  0x11c, 0x40, 0xc, 0, 0),
+	CPCAP_REG(VAUDIO, CPCAP_REG_VAUDIOC, CPCAP_REG_ASSIGN4,
+		  CPCAP_BIT_VAUDIO_SEL, vaudio_val_tbl,
+		  0x16, 0x1, 0x5, 0, 0),
+	{ /* sentinel */ }
+};
+
 static const struct cpcap_regulator xoom_regulators[] = {
 	CPCAP_REG(SW1, CPCAP_REG_S1C1, CPCAP_REG_ASSIGN2,
 		  CPCAP_BIT_SW1_SEL, unknown_val_tbl,
@@ -486,6 +587,10 @@ static const struct of_device_id cpcap_regulator_id_table[] = {
 		.compatible = "motorola,mapphone-cpcap-regulator",
 		.data = omap4_regulators,
 	},
+	{
+		.compatible = "motorola,mot-cpcap-regulator",
+		.data = mot_regulators,
+	},
 	{
 		.compatible = "motorola,xoom-cpcap-regulator",
 		.data = xoom_regulators,
-- 
2.51.0


