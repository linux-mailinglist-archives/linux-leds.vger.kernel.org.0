Return-Path: <linux-leds+bounces-8244-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CNnsCSQDDmqs5QUAu9opvQ
	(envelope-from <linux-leds+bounces-8244-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 20 May 2026 20:53:24 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B83C5975AC
	for <lists+linux-leds@lfdr.de>; Wed, 20 May 2026 20:53:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 879BF3649E0A
	for <lists+linux-leds@lfdr.de>; Wed, 20 May 2026 18:24:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DFF93FF1B8;
	Wed, 20 May 2026 18:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jsaKqcYs"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 200163FE373
	for <linux-leds@vger.kernel.org>; Wed, 20 May 2026 18:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779301407; cv=none; b=Mp4U5I1+xLP3IoFVobgEX1quM5ghPIfgdwa1aZlnA2Sd7XKWBANufDzS19bjWwTvWCQxWdIny7SbVHZZ9gbCouVGVBwe6jIMAxR7+Z+96TwW8oo/FEMHAoyTuRkAl72fjmYlqoXVi9RTtPG6/MXbLDP5tzPZqjNI/4GchpNc+ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779301407; c=relaxed/simple;
	bh=OyZE0FTSId5Xw2BLHh/qgzyUvjlvhM+aMzq4+ikPxSI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=p28yABWHmmilR9wiouB9k5tGkLnzZGLTSo1hfQ0gjHhEab96vsaqlMLmW6wObW01kNZHJlwlwqQHeZ203Mkve4nKl0ppnJf134SFkwe2gRQgHrcPqg4bNehnO+OUBCYlWly2KMRPIZ7ybajLaLKcENcS83tpe4PKOLF2r5e7yzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jsaKqcYs; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-48909558b3aso54556085e9.0
        for <linux-leds@vger.kernel.org>; Wed, 20 May 2026 11:23:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779301403; x=1779906203; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vaU/m8RkZFKacQOirk2OKWVZO3CMn2gzTIkZTYwhda4=;
        b=jsaKqcYsz39jWnosGbzDD6+Pimi7MmfIseiAUAM7qhNK/iYBOfXDrbDSaNvazmSOVi
         Myhir/H2zsaA1UYQsqNmBXfEi2P1z0siThGMHxl5ILyTpYDzmFKbUIPPHJbg1danS4n9
         WUL5VSeO7d7HfEzlK7FSDOAHNrQfDEVfZL4UXN1hVdIMSA7+jl0/D1GKExMHaqGJq+xy
         SlfbaInZ764mIvSFA4E52H1Nh0E0dVIWu5M/4Vr8bBstoRKYsTIqUMNt6Sz+0sd3oa9i
         d5ogimLhY3tOQkuEv+XaYeVvIWJlYpT6A+DHoCqz6EoLzR17tGg3miMXbAKxL8UTGg+o
         CHQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779301403; x=1779906203;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vaU/m8RkZFKacQOirk2OKWVZO3CMn2gzTIkZTYwhda4=;
        b=VO0zxrDViZlQiXEIIM4b/oYXsm/8hgJplnJU0vzEYFfKoj+2QUOKgSdCzPt7I/lcun
         XDQWQIaHVwqyxaZ4JCqxL/SZUTA7gycWn1AUBlUSw3T7MY2YQI7ei3bR/ub4caigQ8Bp
         Az9s8QtG3Xc/ViDenGkP12oAjs71jAQM2qHJSMT/c4nLv9VNb071h7JPn+wlm2D+taK5
         FQVNXHLf/ljM38KSn+d0rh53HpJtL7NCViums/YWiFfJwYxdX9f9Jjxw8HSbS5orE9qz
         LP2hb2Ii26vOGAhgGUFBpi/E+A+MTlZx+FhyI8BmavMa8aLMyXXAX/NbKEiyR6EeirIW
         4oBA==
X-Forwarded-Encrypted: i=1; AFNElJ/XE88lrF5sD/R4SRtDNggB7J+H9GDJd53p7oJhQ7PueLRa3GhStIV90QcjikKFlT5SbL0p2IfQqzHf@vger.kernel.org
X-Gm-Message-State: AOJu0YwNDQJEl7e5XgfMrFRYC+wuvFTOsqcWMRStp37yGNg5ehRJTuB/
	GxdKwSVrolJVO0tAKrRrb+frbPihQiZ+qlbcLdbU1cUhh4WI3nlfneRb
X-Gm-Gg: Acq92OGF59G/GIoH8l41ca4bJP6hXmadXlljrPxpbilB16K4u0llEpvmoMf96Fus1eJ
	uwZkoT5yUoI6hGWoEfItgqU0B0upgICJizBrqe/Cpsai65F3DIfOvH+K4tZF5hqXaCPWpisGnx2
	Dvc41R1TUCjjCSNss7DQ9c6rrUSxKjFQgztGG0boMx5fqLuwKJpPZ9Y5C16WdYZGPLkVRbVg/FA
	+bU06weO817JVwWa3IfrtcNvOABbaIs259DlJYaID063r+qenQj36ta6PeOrm3tZLPqNIrcxz86
	cYCXu2nEmwTR2ZeknRB/D74o24E6qvNHRHqbGLmCT8NJRxTbcNfUdyFvd/L6QIm0Df6GJtBLkLh
	imKe2GtLP1Q6HaxiU5wi4I5t4DQ6kSpuT0gKellZ6AC/j9T+kgGWPAuh93JIg53+yyUV8fcirbR
	ZT0bSa3vn/1OSzF2g10s/W5rNi863rvI4uUg==
X-Received: by 2002:a05:600c:6383:b0:488:c014:34da with SMTP id 5b1f17b1804b1-48fe651690fmr390912175e9.26.1779301403428;
        Wed, 20 May 2026 11:23:23 -0700 (PDT)
Received: from xeon ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9ec3b18fsm51297739f8f.11.2026.05.20.11.23.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 11:23:23 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org
Subject: [PATCH v6 6/6] mfd: motorola-cpcap: add support for Mot CPCAP composition
Date: Wed, 20 May 2026 21:21:24 +0300
Message-ID: <20260520182124.117863-7-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260520182124.117863-1-clamor95@gmail.com>
References: <20260520182124.117863-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-8244-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 7B83C5975AC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add a MFD subdevice composition used in Tegra20 based Mot board
(Motorola Atrix 4G and Droid X2).

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/mfd/motorola-cpcap.c       | 20 +++++++++++++++++++-
 include/linux/mfd/motorola-cpcap.h |  1 +
 2 files changed, 20 insertions(+), 1 deletion(-)

diff --git a/drivers/mfd/motorola-cpcap.c b/drivers/mfd/motorola-cpcap.c
index 5b6ca6b81c23..f6198276d266 100644
--- a/drivers/mfd/motorola-cpcap.c
+++ b/drivers/mfd/motorola-cpcap.c
@@ -237,7 +237,6 @@ static const struct mfd_cell cpcap_common_devices[] = {
 	MFD_CELL_OF("cpcap-led", NULL, NULL, 0, 1, "motorola,cpcap-led-green"),
 	MFD_CELL_OF("cpcap-led", NULL, NULL, 0, 2, "motorola,cpcap-led-blue"),
 	MFD_CELL_OF("cpcap-led", NULL, NULL, 0, 3, "motorola,cpcap-led-adl"),
-	MFD_CELL_OF("cpcap-led", NULL, NULL, 0, 4, "motorola,cpcap-led-cp"),
 	MFD_CELL_NAME("cpcap-codec"),
 };
 
@@ -245,6 +244,7 @@ static const struct mfd_cell cpcap_default_devices[] = {
 	MFD_CELL_OF("cpcap_adc", NULL, NULL, 0, 0, "motorola,cpcap-adc"),
 	MFD_CELL_OF("cpcap-regulator", NULL, NULL, 0, 0, "motorola,cpcap-regulator"),
 	MFD_CELL_OF("cpcap-usb-phy", NULL, NULL, 0, 0, "motorola,cpcap-usb-phy"),
+	MFD_CELL_OF("cpcap-led", NULL, NULL, 0, 4, "motorola,cpcap-led-cp"),
 };
 
 static const struct mfd_cell cpcap_mapphone_devices[] = {
@@ -252,6 +252,18 @@ static const struct mfd_cell cpcap_mapphone_devices[] = {
 	MFD_CELL_OF("cpcap-charger", NULL, NULL, 0, 0, "motorola,mapphone-cpcap-charger"),
 	MFD_CELL_OF("cpcap-regulator", NULL, NULL, 0, 0, "motorola,mapphone-cpcap-regulator"),
 	MFD_CELL_OF("cpcap-usb-phy", NULL, NULL, 0, 0, "motorola,mapphone-cpcap-usb-phy"),
+	MFD_CELL_OF("cpcap-led", NULL, NULL, 0, 4, "motorola,cpcap-led-cp"),
+};
+
+/*
+ * The Mot board features a USB-PHY and charger similar to the ones in
+ * Mapphone; however, because Mot is based on Tegra20, it is incompatible
+ * with the existing implementation, which is tightly interconnected with
+ * the OMAP USB PHY.
+ */
+static const struct mfd_cell cpcap_mot_devices[] = {
+	MFD_CELL_OF("cpcap_adc", NULL, NULL, 0, 0, "motorola,mot-cpcap-adc"),
+	MFD_CELL_OF("cpcap-regulator", NULL, NULL, 0, 0, "motorola,mot-cpcap-regulator"),
 };
 
 static int cpcap_probe(struct spi_device *spi)
@@ -276,6 +288,10 @@ static int cpcap_probe(struct spi_device *spi)
 		cells = cpcap_mapphone_devices;
 		num_cells = ARRAY_SIZE(cpcap_mapphone_devices);
 		break;
+	case CPCAP_MOT:
+		cells = cpcap_mot_devices;
+		num_cells = ARRAY_SIZE(cpcap_mot_devices);
+		break;
 	default:
 		return dev_err_probe(&spi->dev, -ENODEV,
 				     "Unknown device %d\n", cpcap->variant);
@@ -327,6 +343,7 @@ static int cpcap_probe(struct spi_device *spi)
 static const struct of_device_id cpcap_of_match[] = {
 	{ .compatible = "motorola,cpcap", .data = (void *)CPCAP_DEFAULT },
 	{ .compatible = "motorola,mapphone-cpcap", .data = (void *)CPCAP_MAPPHONE },
+	{ .compatible = "motorola,mot-cpcap", .data = (void *)CPCAP_MOT },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, cpcap_of_match);
@@ -334,6 +351,7 @@ MODULE_DEVICE_TABLE(of, cpcap_of_match);
 static const struct spi_device_id cpcap_spi_ids[] = {
 	{ "cpcap", CPCAP_DEFAULT },
 	{ "mapphone-cpcap", CPCAP_MAPPHONE },
+	{ "mot-cpcap", CPCAP_MOT },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(spi, cpcap_spi_ids);
diff --git a/include/linux/mfd/motorola-cpcap.h b/include/linux/mfd/motorola-cpcap.h
index 1a85b06272c8..bb23363eeccd 100644
--- a/include/linux/mfd/motorola-cpcap.h
+++ b/include/linux/mfd/motorola-cpcap.h
@@ -28,6 +28,7 @@
 enum cpcap_variant {
 	CPCAP_DEFAULT = 1,
 	CPCAP_MAPPHONE,
+	CPCAP_MOT,
 	CPCAP_MAX
 };
 
-- 
2.51.0


