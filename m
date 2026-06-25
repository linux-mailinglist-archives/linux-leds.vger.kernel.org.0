Return-Path: <linux-leds+bounces-8734-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id X64nApjlPGoeuAgAu9opvQ
	(envelope-from <linux-leds+bounces-8734-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 25 Jun 2026 10:23:52 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A55E6C3BD0
	for <lists+linux-leds@lfdr.de>; Thu, 25 Jun 2026 10:23:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=V6rRndYC;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8734-lists+linux-leds=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-leds+bounces-8734-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5E72E311A97C
	for <lists+linux-leds@lfdr.de>; Thu, 25 Jun 2026 08:18:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 767C23815D3;
	Thu, 25 Jun 2026 08:18:33 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C5253803DA
	for <linux-leds@vger.kernel.org>; Thu, 25 Jun 2026 08:18:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782375513; cv=none; b=OqHUq9yb+GibqxzcS3F/CuQ7RNfLhc5RwlqeMWQ9YY4IuVV/w7JH6NiuuPSX9L4ocoKb/3c0g/+xYL15tUyST2NOzCcibHegpuVSAv3AzoxEsVw1POTB99zZNPFYctJThPvVMXpYe8VVGo2lSOjdrQWjMBnyZHg15MK1sFEA8PA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782375513; c=relaxed/simple;
	bh=OyZE0FTSId5Xw2BLHh/qgzyUvjlvhM+aMzq4+ikPxSI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HJaTgVHKptYgRPYheLbHWLbpXS3SSvNNZcAO93PhocE5J3n1Ha3PSyAQlBomx/kBl1puaKgiv3jfIepFb+0KKcdMnowfgU/jSRx7rbevbCXa6WJKttMRtB8Fpg5Vz9jSq6BGeXk8W/9Qga9c15scZ0O7s1kGsYl7YqXqjGVJqbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V6rRndYC; arc=none smtp.client-ip=209.85.167.52
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5ad53c8d4dfso809826e87.1
        for <linux-leds@vger.kernel.org>; Thu, 25 Jun 2026 01:18:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782375509; x=1782980309; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vaU/m8RkZFKacQOirk2OKWVZO3CMn2gzTIkZTYwhda4=;
        b=V6rRndYCXyW5mqpGV2zcIkMMiwML0ud0oGJ2yxIecM/2E5LAVya2VMz57fjTtJKDnp
         xCmI2l/Zb//TrG2ltyqdRw1wZQnKswFsrUw3eqUKLT4f0MAH7POD/K/5a7RVz3Wg4gV0
         UhtPpyU3s4LNYTAalIU2W8aUZPwKknWAreSQidDLzPlwHnwduopFDyDIz8CIVMA5iIgN
         A10AFWYvXORZU23wQY9hlspotSiB6AGCckDf76TwcUtbe+nK/w9XjpJXUEkfXI3s0kXY
         bG+5gM7Db+D6wTsUirJmfkWBxn1Y6q1kUH/ddenrNzRn8bRZmspQbQVeMUMOH9sYKkbE
         1q4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782375509; x=1782980309;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vaU/m8RkZFKacQOirk2OKWVZO3CMn2gzTIkZTYwhda4=;
        b=jIrWRsze56dYql+H+tWfgsKgOrH0gmx4UaNoNDwCfItjWd1jldqEjCMpaz2vNQ4WtD
         l6Vx1Lmzp2Q/RrBbsuSG82Yi5icQZKDv9Tephnek08rWPGL0KoyaIL0efhp8YrfxXz3J
         C3JSeWCPR1MP+b+kNXvYua9cip59fdjxQx97FwNz4a/BGWjr9b1150OQM8Lw1+tYemoL
         Gd9DZQyueawgVqfWRJBE5CJ3VVwIMCr18fFCafqaNTmRsXBxNNgkKDTJzbqiJTfochcg
         dE1LE9xZn3/HJIUgjYnGOa98L7rMS22U2jY0cBU/7WH3hAkJBZ9SzvvtAZ+9Vpxgsftq
         lqEw==
X-Forwarded-Encrypted: i=1; AHgh+Rr/aMCSG4V6NmbdrArdOP2Xq8N67p2gJfe0Vs/I9anHtlJNaW96K7o18y7IZHaLbBkFj7qegM/XK2Au@vger.kernel.org
X-Gm-Message-State: AOJu0Yzgadocst0NzE3y45Xfqs8t6Z9q2mwaAAyLni9Rs0qW61j3pG1+
	aqHmPs6ZCSm3vLojfflJ6vg9/CPGaPi1npVKzcw9IapmR089DzOvb+shICbx0FSo
X-Gm-Gg: AfdE7clWAuiRZuyE+z3H5BcaUCjv8WZ0UID9wNe8EbaRQ3T+TW8lpS4vnrL1mucL9Tb
	CfaXnUIW4S1ODYo4Ug0lsbvF7mT5l0rWEKULTVMIMpkw4nNmxnDonlKhxOCEN1qnxZfKUoasolc
	exmu41kPIlKa2zApG/TTjxQntR0fGqA1hj1fWWS/uPfrlCFK+Ilppbv8Q1NKTM6PXyitY6XpiXa
	fYLQj63YmKGk9us/9ZINlVBWLloCbs6YpB6y+SqRhxbxknHEHqerBA3Pi1+hkCyQgAG+J3BkiKN
	kce6UV2gYTEE2yMVAw8AKMDmtt+MOzH3fEWXVNg1W+Qa7zs+9YgEscO/I+fZ0J47bHQr7qHWAFN
	rGSpyhUfQm7ZCr/1bKkocN5flp66rEhGwp340PFIRLzp2s09s0uQiSgli4Ntqir8TNH0ZSvGD24
	7TdpiepgZ1g4R4Sy0Y6IT4+Zd0wxK77rlf3Q==
X-Received: by 2002:a05:6512:2c04:b0:5ad:5c4a:81f5 with SMTP id 2adb3069b0e04-5ad695973bamr2920421e87.10.1782375509296;
        Thu, 25 Jun 2026 01:18:29 -0700 (PDT)
Received: from xeon ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad6957a268sm2464601e87.38.2026.06.25.01.18.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 01:18:28 -0700 (PDT)
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
Subject: [PATCH v6 6/6 RESEND] mfd: motorola-cpcap: add support for Mot CPCAP composition
Date: Thu, 25 Jun 2026 11:18:12 +0300
Message-ID: <20260625081812.33474-7-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260625081812.33474-1-clamor95@gmail.com>
References: <20260625081812.33474-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-8734-lists,linux-leds=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dmitry.torokhov@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:lee@kernel.org,m:pavel@kernel.org,m:clamor95@gmail.com,m:linux-input@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-leds@vger.kernel.org,m:dmitrytorokhov@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	FORGED_SENDER(0.00)[clamor95@gmail.com,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9A55E6C3BD0

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


