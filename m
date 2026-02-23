Return-Path: <linux-leds+bounces-7001-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2IcbFqb2m2lI+QMAu9opvQ
	(envelope-from <linux-leds+bounces-7001-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 23 Feb 2026 07:41:42 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CCCAB172427
	for <lists+linux-leds@lfdr.de>; Mon, 23 Feb 2026 07:41:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id EB8853030DD5
	for <lists+linux-leds@lfdr.de>; Mon, 23 Feb 2026 06:40:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EC2234D4E0;
	Mon, 23 Feb 2026 06:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f0ibKSP0"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 437B934CFCB
	for <linux-leds@vger.kernel.org>; Mon, 23 Feb 2026 06:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771828763; cv=none; b=T7n5jV2TU1+Skh/Gya+HU7xqx81SaJ8057slIuM6azLH4alWaQYATR0AWjCLEy0HE/eSdAKLnoDMxA3MieU92EWp89iI93KqQqn6/AFLwaBr1wF2DIwZGK1HVkX8vmV/rE4Huev3WBVfjsA1y4p0cXB3c4MsuTBr1L6k/MljF1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771828763; c=relaxed/simple;
	bh=w1dOcGnTI59GCQNhwQP6xzsT4wAulf/UcemmHchCPqw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dOxNcSsVp0zjiob3pNQTgnqnCVOeBdszwj6xxEyjefx1zeG3ZmbzGEZDJJD6nycPAuvkhJGHQFOoddjKv2oq9CDsuUO7HBMYeoITxQk4rzV73cjqvImAmd6vn9c1/wEEUknd4vGSbyo0ocIcHOp5gBOxQ8ybx6QjwTRJ05BOLpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f0ibKSP0; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-59e6491f1a2so4475635e87.0
        for <linux-leds@vger.kernel.org>; Sun, 22 Feb 2026 22:39:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771828759; x=1772433559; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=53/v+YSG+6GYj3ywOiaHOLUwr98tdqBSh9I2cLizLtg=;
        b=f0ibKSP0dwzXK+4RfhsT8IpnMocD9TxUq6oA+aGb1zhapqZ6janqOw6DQ9JSWCtAGn
         q5nVGDfpwa8FefRE+L1/yzP6L9WF9AEhibRLwQOsYjfA9ADLi4s9MxNk+4i+hRikZzsw
         AP02+DJTOjIDI6CrZkAptFidveeusuj3hkVK+XzKHg7BIYnemYZCEvN+EPHm8m7nVp9I
         UUONbwGQM9qiSbCxPwfUF1IQwylO2kX4Hc3KaNM7AVgTBVEAIybsTYkvmCOxLjCz96QM
         RiBhcmvW1swEvOrhKCInRzB0mo8L07RD2vmnjLHC83fs5HaAy7RWATQnknKy/8fpIP7v
         ef/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771828759; x=1772433559;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=53/v+YSG+6GYj3ywOiaHOLUwr98tdqBSh9I2cLizLtg=;
        b=XGfhJql2rXtZ0WyNVsQNmwRub5NoJjCgzw3ap/yfRtKKCfsDsWz/BqCWT2F8ezFO4o
         T3HShMmxEv1x1FnwuNzIybREVnIbrwKrwDWWOZGIRrgBC+x/ot+N7//u9PPcrnMySkjZ
         yIhMdl3RplOn7SlNtekuCHss6hqmru2mDzlzms7htC2eoGiRYOpX43TpVBY2/GSv4oN5
         210GgJuu7r7FV4ktyeCJRfsxDj88zYGib2H85f/bQtR4prOoEVMzm1oV9TxFB036Dz2M
         UiO8uI+W+TbQ2m0CeFoMVDBRoiH1VMZ7hV7AHQNC2ANVfBaGgM6Yi99nlXhmayIEMxep
         2+Gw==
X-Forwarded-Encrypted: i=1; AJvYcCVnSx5v4HNrNLpYC/2YZ3cC2XXGsdgUih1bhwKaAxiAG/w3Y8WkOcPk4h3MsQWUAgntBVtFCUAoHiUA@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0qI5iPlYbfksYjllF7p9pqv7IrnZeX+ewVJqL+4KWrYUUwjKl
	GuAa/MBmHuoZXcSEmJqppFvqKq3zW0Td0jG9JJ4eq8aFl5hBH9F/4aTj
X-Gm-Gg: AZuq6aLPSwvMBrw6pWh7L+1/oVup5jw7FQriiPcKNVVzGag2MbNh3EinvgDK4QDfbU1
	FdOWvCCSAbgaqZ0+fdj3BYK5pbv6CzIDuQiaWtFPRTFRwEkP1Fzuxq4bljxa++kjT/8ZOhS+GVy
	HLAWtvO9miF2tBh4GmJ1sIwb9X41dDsdQivnyL3PRoWHRMd1ceXjc0akLs4B3yl35MEzhUJF9WD
	I0XVTHd6xE5ldZI64+x00Px7+beVQrymQYInUBoFdaVlkYD0Vn6EnS1ova9sP2ZVRuZJMTvYG1q
	6JJ/ZEzVfRVIR5a2dQON30SaQhnCQiNbVRs+jM/XjNlDwTNbzx5+rVIue5FC8dXAsaqQYesL761
	LbRQ5sB1BUdTjeKBrj+CAARRVUSMVVd8QI39VgpA5RQgXViVKBefSDOCH3hOREpNOFZNjAE7dWm
	bJ6yNs5SX9u5Un
X-Received: by 2002:ac2:5bc3:0:b0:59f:6efc:2846 with SMTP id 2adb3069b0e04-59f8abe42admr3218285e87.7.1771828759209;
        Sun, 22 Feb 2026 22:39:19 -0800 (PST)
Received: from xeon ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a0eeb13abbsm1369626e87.23.2026.02.22.22.39.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Feb 2026 22:39:18 -0800 (PST)
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
Subject: [PATCH v3 9/9] mfd: motorola-cpcap: add support for Mot CPCAP composition
Date: Mon, 23 Feb 2026 08:38:58 +0200
Message-ID: <20260223063858.12208-10-clamor95@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-7001-lists,linux-leds=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: CCCAB172427
X-Rspamd-Action: no action

Add a MFD subdevice composition used in Tegra20 based Mot board
(Motorola Atrix 4G and Droid X2).

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/mfd/motorola-cpcap.c | 50 ++++++++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/drivers/mfd/motorola-cpcap.c b/drivers/mfd/motorola-cpcap.c
index 516d1e33affa..fdec92f5c6b0 100644
--- a/drivers/mfd/motorola-cpcap.c
+++ b/drivers/mfd/motorola-cpcap.c
@@ -335,6 +335,54 @@ static const struct cpcap_chip_data cpcap_mapphone_data = {
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
@@ -389,6 +437,7 @@ static int cpcap_probe(struct spi_device *spi)
 static const struct of_device_id cpcap_of_match[] = {
 	{ .compatible = "motorola,cpcap", .data = &cpcap_default_data },
 	{ .compatible = "motorola,mapphone-cpcap", .data = &cpcap_mapphone_data	},
+	{ .compatible = "motorola,mot-cpcap", .data = &cpcap_mot_data },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, cpcap_of_match);
@@ -396,6 +445,7 @@ MODULE_DEVICE_TABLE(of, cpcap_of_match);
 static const struct spi_device_id cpcap_spi_ids[] = {
 	{ .name = "cpcap", .driver_data = (kernel_ulong_t)&cpcap_default_data },
 	{ .name = "mapphone-cpcap", .driver_data = (kernel_ulong_t)&cpcap_mapphone_data },
+	{ .name = "mot-cpcap", .driver_data = (kernel_ulong_t)&cpcap_mot_data },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(spi, cpcap_spi_ids);
-- 
2.51.0


