Return-Path: <linux-leds+bounces-7749-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wD8mOVrd4WmtzAAAu9opvQ
	(envelope-from <linux-leds+bounces-7749-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 17 Apr 2026 09:12:26 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 84DBB417C30
	for <lists+linux-leds@lfdr.de>; Fri, 17 Apr 2026 09:12:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 81EEF3040B06
	for <lists+linux-leds@lfdr.de>; Fri, 17 Apr 2026 07:12:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61C8E358372;
	Fri, 17 Apr 2026 07:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nx59QLGq"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3994B346784
	for <linux-leds@vger.kernel.org>; Fri, 17 Apr 2026 07:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776409901; cv=none; b=n9mwOXam3AZZlw6z4zjF6usH5dntxF1NxLH4Sdn8yqeucrTiJ5K5kOSDVJrCp9OJWpB1Nrzq/4LbM0qRYLt1Ja7WPzDqgArBFRblq7VwsZ9j75gyh9YB9FMRTfeCk2QNKmBtYUr0gg4/H6ip1pbqs3CtLoagSwsd+/mzHZZYGgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776409901; c=relaxed/simple;
	bh=w1dOcGnTI59GCQNhwQP6xzsT4wAulf/UcemmHchCPqw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jsYv0tlR7T49MNBLBQ2HuhoS4E6kmeKxBpiYavkHIumavVn22ADE9xsY6XkFkR7VXNHjKKpepSG+lvBO+vmcq1M2XVSkxkROXAOT9agJEEUZR4MMoXlKYHgSeaQt4OmHE/fONjXZRe8iCQgKLREZTB4l9SGovcs0EEi8+pn5Fuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nx59QLGq; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-38a01c80c34so2997371fa.0
        for <linux-leds@vger.kernel.org>; Fri, 17 Apr 2026 00:11:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776409897; x=1777014697; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=53/v+YSG+6GYj3ywOiaHOLUwr98tdqBSh9I2cLizLtg=;
        b=nx59QLGqRdFNthD1mnE3RNMKRvroHkt6LzXdRtQ66iep7MPMt9QRL/kLcjsoPUMEkb
         p0liOyiv6YBsNq2WbZ5AOflM+SjfsqUGmi04rGPTA1JjXir8a7IQgkHeSMQfpdAnvmTi
         3n1ODV3xNeraRTCDokN3JJ39Yrnn63PptsZlLYkRKrbIHIg4ij3VN3Zx4V4o+Cr3mHNH
         9KtojXD7hqu5HE3gtPABGu7j6r6K+oLuKPSqKCTVISJ4kQOmYh+Fu3DvQ4fh6Qz57znE
         qy1tJHku+njHmyrMo2u6bI7+seJUWnciaDHOuQMt831ElD8DdsLSL32V2jAqQiuep4ra
         Ek+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776409897; x=1777014697;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=53/v+YSG+6GYj3ywOiaHOLUwr98tdqBSh9I2cLizLtg=;
        b=rFhfo1RE/EbwcJ7GGmuKrLiKqnvAlYHX1yxBaJHTyYOmtAMNwJOD62OFkDIV973e6H
         aeGeDwudZqR+0Z0wlOKYVK9vX/9fTAxXfDdemcKiFFQoSTOq0L8vVoIQUD4OUuDOjon7
         Zbr/f2p03ekTaloESi34jvF5tZRDRSGBO9cYPoqmzZB/1llyN9wAn9IeD4V+srAS2jz3
         XZS4kRpblXcviGsmmI/k1RsvmhpJn9x/TF0xannCutpbHZ62uv7INO1Ff171q81rJz39
         kBiNN+LIpYpOnLE7RpDursQ6weQjqesv05NWP4GO9iFXsEVvHkSnsgIDOQawT6GqjnKT
         GvwA==
X-Forwarded-Encrypted: i=1; AFNElJ9EhYCMH7M7WF8Hqe7TNqcpPLF6hylWHs7BH+fku6DuinlB8N3bZ/Q3KN+xCc+BM4otPi5bNFA8iwzs@vger.kernel.org
X-Gm-Message-State: AOJu0YwE0vUpTzw2sU6mtiSfq//6hlEm9Gw0zRPs+hmop8Da3CeGUKbm
	7UF4tqImwG12kQ3J9EWXZgc2eUhJNtnrbTuJLsyBFIhX9DfGgXcujiGZ
X-Gm-Gg: AeBDievOD5rFCu3O4EfhlmgueqIwFpCLR3rjGkYJyOZ0JqMNgD2i3aqMPmX9fqAVNkP
	Ip6rHvlyBqlWX8X7xP8QZHFS+APwY+6hnNNpk8KHZnE0z1uWg3Jx76nVcAYY+A098ovR14FyB0v
	WClcmaTkzS6xTzgw6uGrlp+nIVz/9yl7X80dJbqbQxa0dVkYn2VKgPeJ+JxVkd/nJT/b7WQQbRz
	h9TSMAemLwX6zTktgMcMAo/0f+VuR5JdukJctI4/lGkgmYdaRaEOpI4uODHNp+mh5br4kvCAQiR
	z1nDp4X/rQ1EW8GSAJzqgviRXa3Xu8QdylAKb3ClPpwDrqOgOLKYQPxCVNfOvzzMio6YUCfGz7H
	gdvSbQkKGQY1Q0MX6+6kGpQV8mnUVfvrKSsbaWDEOSaj6kVlQmjeGX6LpHFJeSs6bVqFOJVdA2A
	W+9sYaZTbbX7v08GB4KloGlYbg5/sbsblLMg==
X-Received: by 2002:a05:6512:1242:b0:5a4:640:9f07 with SMTP id 2adb3069b0e04-5a4172e7b8bmr511770e87.31.1776409897215;
        Fri, 17 Apr 2026 00:11:37 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4185bc240sm162772e87.23.2026.04.17.00.11.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 00:11:36 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	David Lechner <dlechner@baylibre.com>,
	Tony Lindgren <tony@atomide.com>
Cc: linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org
Subject: [PATCH v4 6/6] mfd: motorola-cpcap: add support for Mot CPCAP composition
Date: Fri, 17 Apr 2026 10:11:06 +0300
Message-ID: <20260417071106.21984-7-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260417071106.21984-1-clamor95@gmail.com>
References: <20260417071106.21984-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-7749-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,baylibre.com,atomide.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	NEURAL_HAM(-0.00)[-0.990];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 84DBB417C30
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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


