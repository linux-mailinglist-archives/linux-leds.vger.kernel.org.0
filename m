Return-Path: <linux-leds+bounces-6995-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sMwVIkP2m2lI+QMAu9opvQ
	(envelope-from <linux-leds+bounces-6995-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 23 Feb 2026 07:40:03 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E8A3172383
	for <lists+linux-leds@lfdr.de>; Mon, 23 Feb 2026 07:40:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9C4C430312CF
	for <lists+linux-leds@lfdr.de>; Mon, 23 Feb 2026 06:39:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B54F634A783;
	Mon, 23 Feb 2026 06:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GBJOJ18f"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A4403491C7
	for <linux-leds@vger.kernel.org>; Mon, 23 Feb 2026 06:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771828755; cv=none; b=uWiZ/6NsmNFsqGaruQVuGzcgT1SFXogOpDIvzI0DQMZd2OsGRk2D4kP7rcjpEsRbPANjI0swp5AABQ7pOICyZyX0nTE2VXekv5s2IENR5FdYeWp5Zzx8JwGNJfkouDyUEWjVlRrnNyMv2J3GNop+nBVXd7eoRq7eEMyvJvw/3Fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771828755; c=relaxed/simple;
	bh=zo3qgbBbFWF30eK7I25eO1l+g4Zmu3OeutXGZXBp6hE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dgkupCpk4EF/Yj6K+l9cnQNxaw8SFKNLtKpaazw1/op9uldBQ3wTRfhorRWVXTViPTRHqOkAExzsyTSikka92z7pAcw3VeLVqMnqvPyAYQcHGbG2t74MZbDq9FbZUVKqmKyQhnRo+kxA/xbs/hZe+1goGXN+58at289gEzS+7Nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GBJOJ18f; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-59e6b736b84so3751759e87.1
        for <linux-leds@vger.kernel.org>; Sun, 22 Feb 2026 22:39:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771828752; x=1772433552; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0Jf5C8PE1lxuMTJXxYUiUAeT9CSKhU2v7EHDew7zpbQ=;
        b=GBJOJ18fKKAkPv7cNn8ZnxPOKzRj08N4uKxLvBypH4HNlZuL2ViiPSgHeDexJ+s7Lv
         hx48/d/dRVecvesisduNpmZidU022G0H60c294U+CQrpQkpsa5+F3F4micwZRTYQm8Gg
         3kvYRCPSGNMuLz3MHWy6XFzC8yxHZTbgtjvD7mhE7BaqWf3QkUyYniPtbepL2do6dyYO
         GKI0Pmoo2dEEx3u9krc70QItEf5Kbot0mphle8NV175PG7erTuiCkGl5wDN0Mep1Va2c
         8wVA9IwmoORYebigIHUmI513AAGZfbSjobheOlHyO3b2REwvLKYTiNHNzAtDDYXFRT0G
         lJLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771828752; x=1772433552;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0Jf5C8PE1lxuMTJXxYUiUAeT9CSKhU2v7EHDew7zpbQ=;
        b=PgTnak7AAE4nC4Yk94gNstF25Lm+OsoJwLs3RvdWTMmVEor4PLsYew8e8CwMBJ4y5e
         Obpxucneq9oo8N/MnOMdVBJipZ2wuZ/pcCtZl656YKmEix9/gg2PIVMg+O/Bq+RhEQVB
         xiYOYTDcuvwRkwrLAzq5/QrDswzmKX9Oz+WS2Hgn1IZwZzK78pECAQaOLFS7J3fjV0zI
         Y6gmIK1nThNcFgh6KswStM8lGPaQH6hvevVf22Iy+CF7bimiXbKFt5151+63x2CBeHOT
         tiDLTcFdfm/IiB7mDO2EyyDTVvZeSjkRfTD0DAAbjQ1HSDVaq/2cBxF0zpQ0mfkxlRYv
         2xXw==
X-Forwarded-Encrypted: i=1; AJvYcCWAqeIa45SBd/9hbGTjPCBFiwis96FC9q0wswA4zgATp5M1gdWHOsquK4A4LXMsVuWJ4TJzDq5jMemc@vger.kernel.org
X-Gm-Message-State: AOJu0YwyCzz/BLHkPO1lagcoNY/ohEAbMUV/YcnjqtITvQENhAVJz5xj
	ePqd3Tw075BfQUtBmodU3VQ0iidj6YtaZJXZTARMC5AO15lGzZ01G2ov
X-Gm-Gg: AZuq6aJ4GHTwJAzC6JDRSwUmEJvh/6PyCRtN64xJsfS3OnVY5XT7B6LZrTgCx5MhOk5
	XmOrqJ4PCI3IoZbT7VEMhPeU7ugLsZkGE7yQzlAexbv/Ydsc9a2TmcbnR+981WhHCodM2NZCv8T
	qisEKCezRruyVFRikCa+gK+oPeud00Y089kutq7Dfn2PTGCwMpGaB613llc4q8AwUmyf29b3wV6
	uEEX5a0PZw77nZgpBsUa2UAhR2VQdvTOseY8Ljf0TvCI8j3rPndJy+TIb4ydg6jqwvswPeP6vau
	pqCFv4MRDjGPK2KeftQ82fB5B3rVa6Jgeb8UNwt/NeKq7mQa321poupXE0qPsRpBoQ3YSbK2tye
	uMyZhJrVIMvpyDKHA2H90IfWhuAmu6FNsFbGlzFb5H+/dWFk9FeA3FCd91ozssoktEtOMTPZMKS
	NyKDFJzsUkRElQK59v45uC21E=
X-Received: by 2002:a05:6512:b8e:b0:59e:4eb2:2b81 with SMTP id 2adb3069b0e04-5a0ed883b90mr2170214e87.11.1771828752213;
        Sun, 22 Feb 2026 22:39:12 -0800 (PST)
Received: from xeon ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a0eeb13abbsm1369626e87.23.2026.02.22.22.39.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Feb 2026 22:39:11 -0800 (PST)
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
Subject: [PATCH v3 3/9] regulator: cpcap-regulator: add support for Mot regulators
Date: Mon, 23 Feb 2026 08:38:52 +0200
Message-ID: <20260223063858.12208-4-clamor95@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-6995-lists,linux-leds=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3E8A3172383
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


