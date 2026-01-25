Return-Path: <linux-leds+bounces-6733-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kBCeKl0edmn2LwEAu9opvQ
	(envelope-from <linux-leds+bounces-6733-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Sun, 25 Jan 2026 14:45:01 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id A2F8B80CE0
	for <lists+linux-leds@lfdr.de>; Sun, 25 Jan 2026 14:45:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id AFAAD300681F
	for <lists+linux-leds@lfdr.de>; Sun, 25 Jan 2026 13:43:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69134326937;
	Sun, 25 Jan 2026 13:43:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PGliBi65"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A01303242A5
	for <linux-leds@vger.kernel.org>; Sun, 25 Jan 2026 13:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769348607; cv=none; b=C+PqYDJJ43YFO9ZspDXCdo8OgUJlZXJqF68KSsg45I0BsfalX0OK75puvQb+wWtua0t4FAXwo2W15pyuVTi7HT5Vlykx1Pp8ziLLRImq0uaszN6cr/xugDgRVexQpWb/PiCtvXFn29mju5N4CKmYI+ahzKSNrgE5M0pyBYr55ls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769348607; c=relaxed/simple;
	bh=UpT9w/j7zvETDPr3pit94FmYLQ42Xbc6IpVqIuRWkm8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZcTHexylCLLbS6I2SQgY5hTrLolbWUSwx0+2+TYRQ6WDO7oF3lFAYBzVpKTax0pMTbLxnPTqev9dOYzcvXsiTEivdtE9RmA1XlLcQ59yHuWsRbrFXOTDxmBwaOUBtGyxQKN/G2OH7vl3tSWDfOWcadcfMrYZ2FcTv0lOg3DDgBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PGliBi65; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-435a11957f6so3055610f8f.0
        for <linux-leds@vger.kernel.org>; Sun, 25 Jan 2026 05:43:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769348604; x=1769953404; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ee1LhLt59IQBOhKFGdg8xp5N7suKg45Yt/yHFoSdDPo=;
        b=PGliBi65kNX3NrDkikj9jo1gtjw1tZ49ragVXBs7VKYRH/yU0fsvsavM7itKgul1Zd
         Y9NoK0GQI78Ny4rm/FKNRZrLQ0lSlWTjszm08rf3oJ3hKOxscedMuq0/2ED8afHpBuuV
         jPvpl1N62K0NvrH1sYcNccDAn4KGcqOebMvZqVHo4McPwF6l3coYVddMsxi114dq7Ozj
         nRKP28J9dlq39Qzmn7UIeRc5ieVAoS6SLmKheXO4/evnDuTHztSssZFK2vu2E8Jmo8xA
         mhtVuNQWEiBlMXvMCAPdFrbsqk+6zoOnLcES/akk/MRu2c1C9oRv/ae/UwyJoPPX3qJ1
         TBZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769348604; x=1769953404;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ee1LhLt59IQBOhKFGdg8xp5N7suKg45Yt/yHFoSdDPo=;
        b=ldgw8/3IV6TpXTkA9TR4oCrcNYeD56OLsRAVDwzg3m5S6TkGuuqUcjpuGsv4XjLYbS
         YP2tUaYGp2vBxpcWk454IeY6cJCIaQCeTTUMIrfCO+RpK4pgGTE6j7qFuPfjze4Nyt6+
         KS822WYstHRgY1XZltzSZiVnVlbky1RKNZ48nzoOw4bF6twynAC2cIItJyoswTy/i2y9
         Rc4pBXUQdw/46HyZLW60cxoJELgiI+RXAX1qeqR06avWon9ASxwxT4a541uvKNizu6cU
         CGLVm5404+CU6Yrp5GgFvGLfWJENcrETvE5JcjStOKKUQgsaDmRgvwjTSC0SGnPMSjKN
         vFZA==
X-Forwarded-Encrypted: i=1; AJvYcCUd7DQrsH/67xaDddP+kDifMOaWNFM4y8+waH2KZ7lNYcCJhyVzixahWDFQEnmW7aMMAhnyjPeHkOc2@vger.kernel.org
X-Gm-Message-State: AOJu0YxLtX6KnWyqJgAhw8h2/0T0Zald33HYsCrpRQBbX+YRJx501dwU
	oyTNBhfr/L+n6rkfbyzrXfWSjgMLZkFlV9bzkkbnQmwYEq8vo2OYnt3I
X-Gm-Gg: AZuq6aKspZJu5ouz9Vxai1kE74RjGDGBEAkdqH3iwrFUoA02oQk9aA1WZLqbN3HsA/b
	buc3riKk2snLo3mpNZiaRezQKneklGh329KGq6Tk6YJOcfJj4cInE5UDbn1jz6bR2Il1z9d9Q3E
	MY50z12lsV3y7zXdGovfhZb4H0TC/0a4P18N5DajKFRqnYLpIRvQ0m3fWax7pOXq30ojO6aJiBb
	5TI52IZ3uYEjI5Y2ZnpP5Dj4hgYp2vHH3SxckgG6U5ZyMe4Hyj5f1Fz9yB5RhebBoUYKgtocHtb
	dJnTYOiXCGLQVDOYWW2OOmS4uRXzKNBXDx+ydPmFNZ4iSY65rgJPLiKssj5il6jCDrHj/cpx5PM
	mybfaFiZSmmsiXDzbTfB5DF0+FxbnpnDCq9YafCV3rl/ZGT6f7F5gSCg2ea9/wQW74WxknEyMQv
	UKF1nCv5qwrGk=
X-Received: by 2002:a5d:5849:0:b0:435:b020:30ab with SMTP id ffacd0b85a97d-435ca0fbbfemr3062531f8f.15.1769348603864;
        Sun, 25 Jan 2026 05:43:23 -0800 (PST)
Received: from xeon ([188.163.112.49])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435b1c246ecsm22459688f8f.10.2026.01.25.05.43.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jan 2026 05:43:23 -0800 (PST)
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
Subject: [PATCH v1 10/10] mfd: motorola-cpcap: add support for Mot CPCAP composition
Date: Sun, 25 Jan 2026 15:43:02 +0200
Message-ID: <20260125134302.45958-11-clamor95@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-6733-lists,linux-leds=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A2F8B80CE0
X-Rspamd-Action: no action

Add a MFD subdevice composition used in Tegra20 based Mot board
(Motorola Atrix 4G and Droid X2).

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/mfd/motorola-cpcap.c | 45 ++++++++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/drivers/mfd/motorola-cpcap.c b/drivers/mfd/motorola-cpcap.c
index ebe525153c33..c475eef30f22 100644
--- a/drivers/mfd/motorola-cpcap.c
+++ b/drivers/mfd/motorola-cpcap.c
@@ -206,6 +206,7 @@ static const struct spi_device_id cpcap_spi_ids[] = {
 	{ .name = "cpcap", },
 	{ .name = "6556002", },
 	{ .name = "mapphone-cpcap", },
+	{ .name = "mot-cpcap", },
 	{},
 };
 MODULE_DEVICE_TABLE(spi, cpcap_spi_ids);
@@ -343,6 +344,49 @@ static const struct cpcap_chip_data cpcap_mapphone_data = {
 	.num_devices = ARRAY_SIZE(cpcap_mapphone_mfd_devices),
 };
 
+/*
+ * Mot has usb-phy and charger similar to one in mapphone, but
+ * since Mot is based on Tegra20 it is incompatible with existing
+ * implementation.
+ */
+static const struct mfd_cell cpcap_mot_mfd_devices[] = {
+	{
+		.name          = "cpcap_adc",
+		.of_compatible = "motorola,mot-cpcap-adc",
+	}, {
+		.name          = "cpcap_battery",
+		.of_compatible = "motorola,cpcap-battery",
+	}, {
+		.name          = "cpcap-regulator",
+		.of_compatible = "motorola,mot-cpcap-regulator",
+	}, {
+		.name          = "cpcap-rtc",
+		.of_compatible = "motorola,cpcap-rtc",
+	}, {
+		.name          = "cpcap-pwrbutton",
+		.of_compatible = "motorola,cpcap-pwrbutton",
+	}, {
+		.name          = "cpcap-led",
+		.id            = 0,
+		.of_compatible = "motorola,cpcap-led-red",
+	}, {
+		.name          = "cpcap-led",
+		.id            = 1,
+		.of_compatible = "motorola,cpcap-led-green",
+	}, {
+		.name          = "cpcap-led",
+		.id            = 2,
+		.of_compatible = "motorola,cpcap-led-blue",
+	}, {
+		.name          = "cpcap-codec",
+	},
+};
+
+static const struct cpcap_chip_data cpcap_mot_data = {
+	.mfd_devices = cpcap_mot_mfd_devices,
+	.num_devices = ARRAY_SIZE(cpcap_mot_mfd_devices),
+};
+
 static int cpcap_probe(struct spi_device *spi)
 {
 	struct cpcap_ddata *cpcap;
@@ -398,6 +442,7 @@ static const struct of_device_id cpcap_of_match[] = {
 	{ .compatible = "motorola,cpcap", .data = &cpcap_default_data },
 	{ .compatible = "st,6556002", .data = &cpcap_default_data },
 	{ .compatible = "motorola,mapphone-cpcap", .data = &cpcap_mapphone_data	},
+	{ .compatible = "motorola,mot-cpcap", .data = &cpcap_mot_data },
 	{ /* sentinel */ },
 };
 MODULE_DEVICE_TABLE(of, cpcap_of_match);
-- 
2.51.0


