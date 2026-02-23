Return-Path: <linux-leds+bounces-7000-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wKp+Fs32m2lI+QMAu9opvQ
	(envelope-from <linux-leds+bounces-7000-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 23 Feb 2026 07:42:21 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id ECF54172437
	for <lists+linux-leds@lfdr.de>; Mon, 23 Feb 2026 07:42:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1B8D03030ED4
	for <lists+linux-leds@lfdr.de>; Mon, 23 Feb 2026 06:40:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73FF034D3A9;
	Mon, 23 Feb 2026 06:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KuH13j1U"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F95534C145
	for <linux-leds@vger.kernel.org>; Mon, 23 Feb 2026 06:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771828762; cv=none; b=u1HnYyV2RMrRDJrfNyhYBaqSUqY0eT+5fcMHAON8BctQ0vP9SfM2WwbdZHuJBXuNmyAVW7ns9U/Mvtl1YKbJMtgChXwklNPxOOf5uA001PJ3XUGsBb25DCLuxsRRvSY8d4KzUjxOz0KaVYvT6clB5fxr27nkWHDQb+cXXX/XESE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771828762; c=relaxed/simple;
	bh=Fi8+HlKnN1h+N9DJycInvz7TYXjUPCLz5vbSQaQ2Gmo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ok1y2w7ziE9O/ofIxG4k2gMi+8CONO4b+ZsdVoEuny8f8Sfx7KVwWSe68Jg6xAGoBShlApmqah54EtcC0+DhzT8vKnN5xZhdL1pHchf8oVq+w9oDX2UYapGND7b9nUtyl6XZniDOllTPoprYBQVVz0Aq1AunB3LcgA1MNHnpLfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KuH13j1U; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-59e60925251so4031904e87.3
        for <linux-leds@vger.kernel.org>; Sun, 22 Feb 2026 22:39:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771828758; x=1772433558; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PX7h5kXQ2ZfXYWkWgx4GofzlTaZv8NlPbhuLaaOQgic=;
        b=KuH13j1UJ0fEkwfhSul9srxaRCLPjmczHZY52s+VItSfEUdIq8V5BFbwdwjE+ikUWg
         NSc2spnMM0zRHemac5RX7dpPnWICs9vp2t/hlYXHqUSxNz6K3SpWrvR+Vq+5ae2F6N2c
         xs27oknxzk1+Dl/kRcoFrwGCSge4DwYRg2BzU1EwBCoF7ENid9zwznsT4aQmC8CBxVYK
         zBdj9RLaj9qifV4rxTXB5C6ZBwGpVzMP2fTh2yC8FNZ0rCAf81elCBL+HMVaUUA4z+AJ
         4VNjs0yn1BlFHIBnly2RW6A8TVWM6k+jwDgzzYLj1v3A4qXJy7nyOzVbuvz6pdx74Dev
         c4wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771828758; x=1772433558;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PX7h5kXQ2ZfXYWkWgx4GofzlTaZv8NlPbhuLaaOQgic=;
        b=leqFwHimBkeNh3Hax3g0C2aJh6fsuNbaHBjilIAE0YXhow2VauQ45H0s/RY0+Tju+c
         E3Qott+KIDEohfc0CaBMUpawIX4Xi93OKiO0tmX+XZWlUND6GVrsxsp1+u4TORI+8Nel
         jdAL1esomoAsjHLx7rhS8b/bli5vfMV1tiF50NbQdErJcFdqEb8M9ANJWB1krcxsmOls
         anZS0jjxVqqQXF9VPVSZlw3gJMpBinKX2daXMW2zlvMBuiB9bMeNgJs32OG/kcXCB5CK
         aK4ze9gGxIIOLawihQ5m2UitEYjQpkiF3bLn2DVbQR2l4tyTa8dNhdk7gv62WUA4bmXw
         DJwA==
X-Forwarded-Encrypted: i=1; AJvYcCVuHxIyZT+zioQmEJmd19Bc4V/CC/Ksw4mAUOqrRCPeHRbkHccY5gTASHhkqQfvv80yCXJhMkoGTeT2@vger.kernel.org
X-Gm-Message-State: AOJu0YyayTOjeVpmCREiCRa6JInN5b7KwPkPmylhRD/L2hRSLYMKcMh1
	Re8yKqobwKb/uebmFcq1vYL5EY4jeWfPk7oVSUUj3dDLYvNTVtod320w
X-Gm-Gg: AZuq6aLrNfac+9n24Scvvz7b0VumKJQ/3wN3cNRdIbGrdpdejROFHoCXgXOQHHXafju
	YzdtGRxlarC5OblgPZs8P7Fu/9JEYeXyJOBIMTPEOTZw0FI4SqyP5kPOweiF6IWAxiCSFUMD0ij
	firxxYhCaQTqiWw4iOBL1CJz1qcz5FUeSBqR2X6LVZ4/ZPZeBaHDVbgbycmw1dH3efYiuRqdrvA
	wq9sKSuWevkXPW000WF1HNx0mwkY7KDtEaM86S4YhtVaPrEz37q4Ur3gv15i/Kk7M7joxkYBqqg
	/uC4fOgylk3J40GtExMUsZMh30YrAzESGSYxc/Q+xaeFM3Asi2NPcdi57qG5aA3IsdZ81G0hgiT
	G41/XjdsNSrkoRh4Y93pmc425LNbLr+JLZj8RBHPJLZrHDvhA/wrFJsBZiQJid/+LmzdeUVOZe8
	L4kIMkKLFZpGBs
X-Received: by 2002:ac2:51c6:0:b0:5a0:f5b0:3f0 with SMTP id 2adb3069b0e04-5a0f5b00a8emr196979e87.31.1771828757714;
        Sun, 22 Feb 2026 22:39:17 -0800 (PST)
Received: from xeon ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a0eeb13abbsm1369626e87.23.2026.02.22.22.39.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Feb 2026 22:39:17 -0800 (PST)
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
Subject: [PATCH v3 8/9] mfd: motorola-cpcap: diverge configuration per-board
Date: Mon, 23 Feb 2026 08:38:57 +0200
Message-ID: <20260223063858.12208-9-clamor95@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-7000-lists,linux-leds=lfdr.de];
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
X-Rspamd-Queue-Id: ECF54172437
X-Rspamd-Action: no action

MFD have rigid subdevice structure which does not allow flexible dynamic
subdevice linking. Address this by diverging CPCAP subdevice composition
to take into account board specific configuration.

Create a common default subdevice composition, rename existing subdevice
composition into cpcap_mapphone_mfd_devices since it targets mainly
Mapphone board.

Removed st,6556002 as it is no longer applicable to all cases and
duplicates motorola,cpcap, which is used as the default composition.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/mfd/motorola-cpcap.c | 101 ++++++++++++++++++++++++++++-------
 1 file changed, 83 insertions(+), 18 deletions(-)

diff --git a/drivers/mfd/motorola-cpcap.c b/drivers/mfd/motorola-cpcap.c
index d8243b956f87..516d1e33affa 100644
--- a/drivers/mfd/motorola-cpcap.c
+++ b/drivers/mfd/motorola-cpcap.c
@@ -12,6 +12,7 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/mod_devicetable.h>
+#include <linux/property.h>
 #include <linux/regmap.h>
 #include <linux/sysfs.h>
 
@@ -24,10 +25,16 @@
 #define CPCAP_REGISTER_SIZE	4
 #define CPCAP_REGISTER_BITS	16
 
+struct cpcap_chip_data {
+	const struct mfd_cell *mfd_devices;
+	unsigned int num_devices;
+};
+
 struct cpcap_ddata {
 	struct spi_device *spi;
 	struct regmap_irq *irqs;
 	struct regmap_irq_chip_data *irqdata[CPCAP_NR_IRQ_CHIPS];
+	const struct cpcap_chip_data *cdata;
 	const struct regmap_config *regmap_conf;
 	struct regmap *regmap;
 };
@@ -195,20 +202,6 @@ static int cpcap_init_irq(struct cpcap_ddata *cpcap)
 	return 0;
 }
 
-static const struct of_device_id cpcap_of_match[] = {
-	{ .compatible = "motorola,cpcap", },
-	{ .compatible = "st,6556002", },
-	{},
-};
-MODULE_DEVICE_TABLE(of, cpcap_of_match);
-
-static const struct spi_device_id cpcap_spi_ids[] = {
-	{ .name = "cpcap", },
-	{ .name = "6556002", },
-	{},
-};
-MODULE_DEVICE_TABLE(spi, cpcap_spi_ids);
-
 static const struct regmap_config cpcap_regmap_config = {
 	.reg_bits = 16,
 	.reg_stride = 4,
@@ -241,7 +234,56 @@ static int cpcap_resume(struct device *dev)
 
 static DEFINE_SIMPLE_DEV_PM_OPS(cpcap_pm, cpcap_suspend, cpcap_resume);
 
-static const struct mfd_cell cpcap_mfd_devices[] = {
+static const struct mfd_cell cpcap_default_mfd_devices[] = {
+	{
+		.name          = "cpcap_adc",
+		.of_compatible = "motorola,cpcap-adc",
+	}, {
+		.name          = "cpcap_battery",
+		.of_compatible = "motorola,cpcap-battery",
+	}, {
+		.name          = "cpcap-regulator",
+		.of_compatible = "motorola,cpcap-regulator",
+	}, {
+		.name          = "cpcap-rtc",
+		.of_compatible = "motorola,cpcap-rtc",
+	}, {
+		.name          = "cpcap-pwrbutton",
+		.of_compatible = "motorola,cpcap-pwrbutton",
+	}, {
+		.name          = "cpcap-usb-phy",
+		.of_compatible = "motorola,cpcap-usb-phy",
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
+		.name          = "cpcap-led",
+		.id            = 4,
+		.of_compatible = "motorola,cpcap-led-cp",
+	}, {
+		.name          = "cpcap-codec",
+	},
+};
+
+static const struct cpcap_chip_data cpcap_default_data = {
+	.mfd_devices = cpcap_default_mfd_devices,
+	.num_devices = ARRAY_SIZE(cpcap_default_mfd_devices),
+};
+
+static const struct mfd_cell cpcap_mapphone_mfd_devices[] = {
 	{
 		.name          = "cpcap_adc",
 		.of_compatible = "motorola,mapphone-cpcap-adc",
@@ -285,7 +327,12 @@ static const struct mfd_cell cpcap_mfd_devices[] = {
 		.of_compatible = "motorola,cpcap-led-cp",
 	}, {
 		.name          = "cpcap-codec",
-	}
+	},
+};
+
+static const struct cpcap_chip_data cpcap_mapphone_data = {
+	.mfd_devices = cpcap_mapphone_mfd_devices,
+	.num_devices = ARRAY_SIZE(cpcap_mapphone_mfd_devices),
 };
 
 static int cpcap_probe(struct spi_device *spi)
@@ -297,6 +344,10 @@ static int cpcap_probe(struct spi_device *spi)
 	if (!cpcap)
 		return -ENOMEM;
 
+	cpcap->cdata = device_get_match_data(&spi->dev);
+	if (!cpcap->cdata)
+		return -ENODEV;
+
 	cpcap->spi = spi;
 	spi_set_drvdata(spi, cpcap);
 
@@ -331,10 +382,24 @@ static int cpcap_probe(struct spi_device *spi)
 	spi->dev.coherent_dma_mask = 0;
 	spi->dev.dma_mask = &spi->dev.coherent_dma_mask;
 
-	return devm_mfd_add_devices(&spi->dev, 0, cpcap_mfd_devices,
-				    ARRAY_SIZE(cpcap_mfd_devices), NULL, 0, NULL);
+	return devm_mfd_add_devices(&spi->dev, 0, cpcap->cdata->mfd_devices,
+				    cpcap->cdata->num_devices, NULL, 0, NULL);
 }
 
+static const struct of_device_id cpcap_of_match[] = {
+	{ .compatible = "motorola,cpcap", .data = &cpcap_default_data },
+	{ .compatible = "motorola,mapphone-cpcap", .data = &cpcap_mapphone_data	},
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, cpcap_of_match);
+
+static const struct spi_device_id cpcap_spi_ids[] = {
+	{ .name = "cpcap", .driver_data = (kernel_ulong_t)&cpcap_default_data },
+	{ .name = "mapphone-cpcap", .driver_data = (kernel_ulong_t)&cpcap_mapphone_data },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(spi, cpcap_spi_ids);
+
 static struct spi_driver cpcap_driver = {
 	.driver = {
 		.name = "cpcap-core",
-- 
2.51.0


