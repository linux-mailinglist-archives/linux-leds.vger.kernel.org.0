Return-Path: <linux-leds+bounces-6872-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2IxlDaYlhmlSKAQAu9opvQ
	(envelope-from <linux-leds+bounces-6872-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 06 Feb 2026 18:32:22 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A5C2101119
	for <lists+linux-leds@lfdr.de>; Fri, 06 Feb 2026 18:32:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3ACC5301F208
	for <lists+linux-leds@lfdr.de>; Fri,  6 Feb 2026 17:30:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FF64428476;
	Fri,  6 Feb 2026 17:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S/jkF7v0"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02ED3428467
	for <linux-leds@vger.kernel.org>; Fri,  6 Feb 2026 17:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770398967; cv=none; b=pMOPr030ZccK/xrQSLzKvcvRpRgtSb+w9f8o9oQHdiSCrwBimNbBEswcQeGVtrr8TlkBYOxappjxZQqB1gPX2oatvnthXzjE4UTO6ut4Z1Va5KOIV2jYBO+hnEwfDWqpxqka7+ToOi8tLWWvMk6u9fbPEAS4vfYRPBcjXMqffVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770398967; c=relaxed/simple;
	bh=N4sfHKpleqMrWkE0BhhX+wodEn0xk4GfgnLKvXeA0GE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dlzkeAfbDf/JKVh6UF2Yb3d/4Rjjtnzq0EtIMnjTAWZy6PhszcHPlkgaHtKVsklTcea26ZD4XgDXKWxYWmuUVmzN6PSgUp4HqO4I/ltuJssamrMuKI6WJqTgXUArjZESkAl064MuL/i+/AtIl5/Uo+OwZKUwvOtmAb7wE2a4qRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S/jkF7v0; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-4327790c4e9so1488598f8f.2
        for <linux-leds@vger.kernel.org>; Fri, 06 Feb 2026 09:29:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770398965; x=1771003765; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=38QOshg4B3/jkxvuLV9no2rb1uvRJQraCFfp6So5X0E=;
        b=S/jkF7v0GbCn6RLVuE/7WjPJLirr51CYwPHqb3ND+yMGndKzcmW0CJvHHd8WLjqNxn
         cse7gBYYXPRm1kGUf/emz9eL127UgXG7UE0r+eM5Des6PcRtDVhWZ5z4imlS35IO51bY
         eJXu0awcHZMSv3YbwyxxHjfpRIZYgyQLemLHj/ol6uJoVJF8LFy54zT7DCjd0/f8lr7A
         WK99muoGi/4GLge5wqZRaiQ00aKOTz8Vn2gWs6q81GmztoRxQJr+x6Ks/qdb6RO52VOs
         eg1qD/BXypUjgykHpiF3DeLuaISjcO5i3ZJ2rriiBBdUNjcdp1Hzys/xUrakGDAlewr8
         T9Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770398965; x=1771003765;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=38QOshg4B3/jkxvuLV9no2rb1uvRJQraCFfp6So5X0E=;
        b=rYKh76MT1D0MRgW5urowdAMBbpuFRjPrS/sLLsxDLLqkyR7QFSpi67gQoi/x0JfurC
         f8jeq9bIgxgNXYV4nCDpubMckxGWYZ7kx6xMwvHK5KxM5Vj1K7pZlsE77x08SSC5pOHz
         T2FsB0HPsAKwpVV7GlINI/YTDCIzITpkSPKzfxDsVhrjcaMP+c3BBGpHegLXj4/vviKy
         fZkWrAeq6C2HDzJP5zxT9rifM6aiFmXIkdZ0/LZfYIXp+v6NIGrqzQb/2NxB2gs8qw2E
         1naS+lHkpy70O+2AI4OO0yhQuMTGFjfe8fXFdZq5F3A2E0Mob7qek7luqajmc0xUfj9/
         Lb/A==
X-Forwarded-Encrypted: i=1; AJvYcCVylwzia8QZx+su9ejXpuyTQGL8Si//V1rgpQG3QBJcKdnlbJ2C6hYCt2GUwarUVhnAiTiWZRLel/mn@vger.kernel.org
X-Gm-Message-State: AOJu0YwA+ZQUd+RgYP6c2tBI4PRwhRnYuNwPFi4t5tCsdPibwFy/20PU
	nlTLcIaPD+fwjwrSpEdMbppj+xptmNlJ39P60QgsrKtWDTCZAzb11F/0
X-Gm-Gg: AZuq6aIECLCJlQ6JTKE5Vqw9MNEbZFXExPv1iSOMVvsMuNtTcsWaUXK5BuvdkM4Ghgc
	cXlK1E+wK3x2CjbHQ14vOkCvgXtR/f77akSyi4hvl9kOwjckBW5o34DZ3xL08Az2/3Y974gv3Bf
	hZml7yIgnlAyKrXjIYJyheUDL6bfvkKNuLF00gOUbEO09cJsPqHmyQxOjbZHR4q8Ok4oYqkNy42
	PmxepOe1S063RMl4nUNd81cKJpjZt213hB3QFON8GEAupOgaLKs7fh95eobTNIr6jlfDo3GVUsq
	6Z0yWilyk6UHNuHqC+o14gZUyu4qZ65c+JTEMase5fhzc4vVmIQy50ArnzKxmjj8nO/pTRKtmnL
	ba68Q3K39Q44rxZ0513TSUGuBa+MMjAsnXTS+ALSpPJbn04qgDJOa5c6+FS3pFRq0ieXYo7QZPR
	xy
X-Received: by 2002:adf:e3ca:0:b0:436:307c:b756 with SMTP id ffacd0b85a97d-436307cb85dmr1101460f8f.47.1770398965306;
        Fri, 06 Feb 2026 09:29:25 -0800 (PST)
Received: from xeon ([188.163.112.49])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43629734268sm6846033f8f.24.2026.02.06.09.29.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 09:29:24 -0800 (PST)
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
Subject: [PATCH v2 11/11] mfd: motorola-cpcap: add support for Mot CPCAP composition
Date: Fri,  6 Feb 2026 19:28:45 +0200
Message-ID: <20260206172845.145407-12-clamor95@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-6872-lists,linux-leds=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.990];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4A5C2101119
X-Rspamd-Action: no action

Add a MFD subdevice composition used in Tegra20 based Mot board
(Motorola Atrix 4G and Droid X2).

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/mfd/motorola-cpcap.c | 50 ++++++++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/drivers/mfd/motorola-cpcap.c b/drivers/mfd/motorola-cpcap.c
index bea11868e823..d64c83614f12 100644
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
@@ -343,6 +344,54 @@ static const struct cpcap_chip_data cpcap_mapphone_data = {
 	.num_devices = ARRAY_SIZE(cpcap_mapphone_mfd_devices),
 };
 
+/*
+ * The Mot board features a USB-PHY and charger similar to the ones in
+ * Mapphone; however, because Mot is based on Tegra20, it is incompatible
+ * with the existing implementation, which is tightly interconnected with
+ * the OMAP USB PHY.
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
+		.name          = "cpcap-led",
+		.id            = 3,
+		.of_compatible = "motorola,cpcap-led-adl",
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
@@ -398,6 +447,7 @@ static const struct of_device_id cpcap_of_match[] = {
 	{ .compatible = "motorola,cpcap", .data = &cpcap_default_data },
 	{ .compatible = "st,6556002", .data = &cpcap_default_data },
 	{ .compatible = "motorola,mapphone-cpcap", .data = &cpcap_mapphone_data	},
+	{ .compatible = "motorola,mot-cpcap", .data = &cpcap_mot_data },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, cpcap_of_match);
-- 
2.51.0


