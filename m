Return-Path: <linux-leds+bounces-8732-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Z3BVJoDlPGoVuAgAu9opvQ
	(envelope-from <linux-leds+bounces-8732-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 25 Jun 2026 10:23:28 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F208C6C3BBA
	for <lists+linux-leds@lfdr.de>; Thu, 25 Jun 2026 10:23:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=ciwaEA5c;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8732-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-8732-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4E99430BDC2C
	for <lists+linux-leds@lfdr.de>; Thu, 25 Jun 2026 08:18:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C995380FC4;
	Thu, 25 Jun 2026 08:18:31 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF0C73769E4
	for <linux-leds@vger.kernel.org>; Thu, 25 Jun 2026 08:18:29 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782375511; cv=none; b=igo5X5XQGHoK9qiOXA9TbSToyEpQeM13Htg3ScXk5vVgY+f2jb7PdCvyq+z7Ok+2fpvRWTPJ/Id+h81LDEnWvtOYECxZEoDnmCooPyK5LDmhvJc6eM7jmRNLwGPs9nCcbnoKN5fSCNYshJnhmhjVGD378+ws1AsmpUi0ZYNXcnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782375511; c=relaxed/simple;
	bh=RIfTQDHCQ2YqnNoaJ2ewpxoWS8B+PH190RGJwefZxN4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Lj2N7csqQryFrtNmL5N14Z++EaHcVEUU5dAygrrdnp2VGwYcRTZVuRAWFzuCnK0NsRFRtpXBiPXVPcmYz+LFzYCrUZ3y90Ig2LF82ZH5roTTzM+08ourg2no/NFbgT5W69k+6H+Xa41QNfqBi9AiVgRQ4wBUoOiVa9dNinHCwzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ciwaEA5c; arc=none smtp.client-ip=209.85.167.50
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5ad4c89ecd8so1948513e87.1
        for <linux-leds@vger.kernel.org>; Thu, 25 Jun 2026 01:18:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782375508; x=1782980308; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ODwRsMFDaNCx2SgXogkfXBT7irmxGG50JjasciSXEuM=;
        b=ciwaEA5c5sw43QjzYeQ87y6CG8XDJ7XAGUp7Aa8nRgSWTjonvgM5Osr7wNjuoKnsgn
         OO8Agb5nhdXkQD3WQrehzFFZOMQsgOLlkbNvfc2rGqmYfwqasgbGkk7bImrPWDhfgAid
         dnvCGS7FBuwJHtYnhXtVBnnai1lGcJahWuegCjZ5J8WFbfcqFydqXhdAVNdNFIsSPmL6
         U997Fb+T+BRHVn43wSlkDUQl79QPg3CTTEWfT+BKLVcx8K6CZuliwycsfRmchF+LHkV9
         hJW8KyyzFxYrLe1TeL1A1deHForlKu4ct8m+z5XoD1rFPXnxEGGaP0plTYgSV0gYLuNo
         o5sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782375508; x=1782980308;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ODwRsMFDaNCx2SgXogkfXBT7irmxGG50JjasciSXEuM=;
        b=J4+10p58vmhYrwrL76fdXw0fMEiYwquUwiIaFxoX8Z1nM5BF4IBvO6AJdQ0C3fEZd/
         9oHfYVzfrNCYxMkI+JDIFu+z8PK/SXszeXaICajFpRHrDLNSBCQhrcfv9ICcmrklpf+A
         c05jF8hySZs+WO7jHziZTfZXhVWOYlOpoc+rymer8DHtMQttOe1UP5OaQiye9J05+qJP
         kN3Stb+F14ME/7pwZ6DPomXo1RCbHW8iVSYDNKsjP/bGrpPEjajlz8IgdrxaUoAhgWjK
         +kAe9TepxP3GviVf9yxRsHu1HbYnFgGKb5wQ8WhnQ35JOkjwF7xpaPHjhcyDbDcMALcM
         yfkw==
X-Forwarded-Encrypted: i=1; AHgh+RqEJOkyhLlxt06lR5T3MBu6KTmynzvq4GcPcJMSYh3I+Y1Nyc5uZK8KzvW75fxdmfUxrNak1KwazhGT@vger.kernel.org
X-Gm-Message-State: AOJu0Yykic/tXdDmMumXRzDDG3YAmM3BW6O1mhOk216gJgSEnYWzKDe2
	8V3Npd0EG57YjTkSh/BjasIN/gUh78yDxlWLvx7PysS7RpvB7mH6mC04
X-Gm-Gg: AfdE7cl02d9OPisaRimO8p9qrZ5thWPW34KcL7sDmJZfmqyTb+AJ0erWIBuHrrH6hf/
	FUKy4qMn6JMfKlKY54Og7SllteL+a2cPiWoKW6m8Op83TdTkU2pOEhxjDj7NNcHm9aG3VoUNdmi
	etX1J+wqTB1sA66vbFc6MOMHJGrQ6pJ9CHYMSTCwYmBatTtPynKHWO4wTldiT36RbQFYf0MxrtG
	cWczARj/dyLItwsHBCD1I3GaWvTUbn9rqAk2GeCzhbX5cMesNGk19NShacLfTIiWtlf52iHQy55
	PaiMwrLEmujLXgVIewoUAe21fX9TNUAHLoaX6zPC3hoc62qyW7Nizv61PKgsaCSzmRlR0Ffkj1K
	55DwQwTtC8DSs490lXE3Ch9Sv2zLC9+d47cNzypqaGoDgJ47gFuDvfMYLUrFqD3uCgAvOAR4o+5
	aq8uV6FSyB+nrQsBk7WVEOUc6571C0Wzsm9A==
X-Received: by 2002:a05:6512:20da:b0:5ae:a021:6b37 with SMTP id 2adb3069b0e04-5aea1f648edmr287243e87.40.1782375508090;
        Thu, 25 Jun 2026 01:18:28 -0700 (PDT)
Received: from xeon ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad6957a268sm2464601e87.38.2026.06.25.01.18.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 01:18:27 -0700 (PDT)
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
Subject: [PATCH v6 5/6 RESEND] mfd: motorola-cpcap: diverge configuration per-board
Date: Thu, 25 Jun 2026 11:18:11 +0300
Message-ID: <20260625081812.33474-6-clamor95@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-8732-lists,linux-leds=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dmitry.torokhov@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:lee@kernel.org,m:pavel@kernel.org,m:clamor95@gmail.com,m:linux-input@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-leds@vger.kernel.org,m:dmitrytorokhov@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	FORGED_SENDER(0.00)[clamor95@gmail.com,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
X-Rspamd-Queue-Id: F208C6C3BBA

MFD have rigid subdevice structure which does not allow flexible dynamic
subdevice linking. Address this by diverging CPCAP subdevice composition
to take into account board specific configuration.

Create a common and default subdevice composition, rename edit existing
subdevice composition into cpcap_mapphone_devices since it targets mainly
Mapphone board.

Removed st,6556002 as it is no longer applicable to all cases and
duplicates motorola,cpcap, which is used as the default composition.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/mfd/motorola-cpcap.c       | 125 +++++++++++++++--------------
 include/linux/mfd/motorola-cpcap.h |   6 ++
 2 files changed, 70 insertions(+), 61 deletions(-)

diff --git a/drivers/mfd/motorola-cpcap.c b/drivers/mfd/motorola-cpcap.c
index d8243b956f87..5b6ca6b81c23 100644
--- a/drivers/mfd/motorola-cpcap.c
+++ b/drivers/mfd/motorola-cpcap.c
@@ -12,6 +12,7 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/mod_devicetable.h>
+#include <linux/property.h>
 #include <linux/regmap.h>
 #include <linux/sysfs.h>
 
@@ -30,6 +31,7 @@ struct cpcap_ddata {
 	struct regmap_irq_chip_data *irqdata[CPCAP_NR_IRQ_CHIPS];
 	const struct regmap_config *regmap_conf;
 	struct regmap *regmap;
+	enum cpcap_variant variant;
 };
 
 static int cpcap_sense_irq(struct regmap *regmap, int irq)
@@ -195,20 +197,6 @@ static int cpcap_init_irq(struct cpcap_ddata *cpcap)
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
@@ -241,62 +229,58 @@ static int cpcap_resume(struct device *dev)
 
 static DEFINE_SIMPLE_DEV_PM_OPS(cpcap_pm, cpcap_suspend, cpcap_resume);
 
-static const struct mfd_cell cpcap_mfd_devices[] = {
-	{
-		.name          = "cpcap_adc",
-		.of_compatible = "motorola,mapphone-cpcap-adc",
-	}, {
-		.name          = "cpcap_battery",
-		.of_compatible = "motorola,cpcap-battery",
-	}, {
-		.name          = "cpcap-charger",
-		.of_compatible = "motorola,mapphone-cpcap-charger",
-	}, {
-		.name          = "cpcap-regulator",
-		.of_compatible = "motorola,mapphone-cpcap-regulator",
-	}, {
-		.name          = "cpcap-rtc",
-		.of_compatible = "motorola,cpcap-rtc",
-	}, {
-		.name          = "cpcap-pwrbutton",
-		.of_compatible = "motorola,cpcap-pwrbutton",
-	}, {
-		.name          = "cpcap-usb-phy",
-		.of_compatible = "motorola,mapphone-cpcap-usb-phy",
-	}, {
-		.name          = "cpcap-led",
-		.id            = 0,
-		.of_compatible = "motorola,cpcap-led-red",
-	}, {
-		.name          = "cpcap-led",
-		.id            = 1,
-		.of_compatible = "motorola,cpcap-led-green",
-	}, {
-		.name          = "cpcap-led",
-		.id            = 2,
-		.of_compatible = "motorola,cpcap-led-blue",
-	}, {
-		.name          = "cpcap-led",
-		.id            = 3,
-		.of_compatible = "motorola,cpcap-led-adl",
-	}, {
-		.name          = "cpcap-led",
-		.id            = 4,
-		.of_compatible = "motorola,cpcap-led-cp",
-	}, {
-		.name          = "cpcap-codec",
-	}
+static const struct mfd_cell cpcap_common_devices[] = {
+	MFD_CELL_OF("cpcap_battery", NULL, NULL, 0, 0, "motorola,cpcap-battery"),
+	MFD_CELL_OF("cpcap-rtc", NULL, NULL, 0, 0, "motorola,cpcap-rtc"),
+	MFD_CELL_OF("cpcap-pwrbutton", NULL, NULL, 0, 0, "motorola,cpcap-pwrbutton"),
+	MFD_CELL_OF("cpcap-led", NULL, NULL, 0, 0, "motorola,cpcap-led-red"),
+	MFD_CELL_OF("cpcap-led", NULL, NULL, 0, 1, "motorola,cpcap-led-green"),
+	MFD_CELL_OF("cpcap-led", NULL, NULL, 0, 2, "motorola,cpcap-led-blue"),
+	MFD_CELL_OF("cpcap-led", NULL, NULL, 0, 3, "motorola,cpcap-led-adl"),
+	MFD_CELL_OF("cpcap-led", NULL, NULL, 0, 4, "motorola,cpcap-led-cp"),
+	MFD_CELL_NAME("cpcap-codec"),
+};
+
+static const struct mfd_cell cpcap_default_devices[] = {
+	MFD_CELL_OF("cpcap_adc", NULL, NULL, 0, 0, "motorola,cpcap-adc"),
+	MFD_CELL_OF("cpcap-regulator", NULL, NULL, 0, 0, "motorola,cpcap-regulator"),
+	MFD_CELL_OF("cpcap-usb-phy", NULL, NULL, 0, 0, "motorola,cpcap-usb-phy"),
+};
+
+static const struct mfd_cell cpcap_mapphone_devices[] = {
+	MFD_CELL_OF("cpcap_adc", NULL, NULL, 0, 0, "motorola,mapphone-cpcap-adc"),
+	MFD_CELL_OF("cpcap-charger", NULL, NULL, 0, 0, "motorola,mapphone-cpcap-charger"),
+	MFD_CELL_OF("cpcap-regulator", NULL, NULL, 0, 0, "motorola,mapphone-cpcap-regulator"),
+	MFD_CELL_OF("cpcap-usb-phy", NULL, NULL, 0, 0, "motorola,mapphone-cpcap-usb-phy"),
 };
 
 static int cpcap_probe(struct spi_device *spi)
 {
 	struct cpcap_ddata *cpcap;
+	const struct mfd_cell *cells;
+	unsigned int num_cells;
 	int ret;
 
 	cpcap = devm_kzalloc(&spi->dev, sizeof(*cpcap), GFP_KERNEL);
 	if (!cpcap)
 		return -ENOMEM;
 
+	cpcap->variant = (enum cpcap_variant)spi_get_device_match_data(spi);
+
+	switch (cpcap->variant) {
+	case CPCAP_DEFAULT:
+		cells = cpcap_default_devices;
+		num_cells = ARRAY_SIZE(cpcap_default_devices);
+		break;
+	case CPCAP_MAPPHONE:
+		cells = cpcap_mapphone_devices;
+		num_cells = ARRAY_SIZE(cpcap_mapphone_devices);
+		break;
+	default:
+		return dev_err_probe(&spi->dev, -ENODEV,
+				     "Unknown device %d\n", cpcap->variant);
+	}
+
 	cpcap->spi = spi;
 	spi_set_drvdata(spi, cpcap);
 
@@ -331,10 +315,29 @@ static int cpcap_probe(struct spi_device *spi)
 	spi->dev.coherent_dma_mask = 0;
 	spi->dev.dma_mask = &spi->dev.coherent_dma_mask;
 
-	return devm_mfd_add_devices(&spi->dev, 0, cpcap_mfd_devices,
-				    ARRAY_SIZE(cpcap_mfd_devices), NULL, 0, NULL);
+	ret = devm_mfd_add_devices(&spi->dev, 0, cpcap_common_devices,
+				   ARRAY_SIZE(cpcap_common_devices), NULL, 0, NULL);
+	if (ret)
+		return dev_err_probe(&spi->dev, ret,
+				     "Failed to add common child devices\n");
+
+	return devm_mfd_add_devices(&spi->dev, 0, cells, num_cells, NULL, 0, NULL);
 }
 
+static const struct of_device_id cpcap_of_match[] = {
+	{ .compatible = "motorola,cpcap", .data = (void *)CPCAP_DEFAULT },
+	{ .compatible = "motorola,mapphone-cpcap", .data = (void *)CPCAP_MAPPHONE },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, cpcap_of_match);
+
+static const struct spi_device_id cpcap_spi_ids[] = {
+	{ "cpcap", CPCAP_DEFAULT },
+	{ "mapphone-cpcap", CPCAP_MAPPHONE },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(spi, cpcap_spi_ids);
+
 static struct spi_driver cpcap_driver = {
 	.driver = {
 		.name = "cpcap-core",
diff --git a/include/linux/mfd/motorola-cpcap.h b/include/linux/mfd/motorola-cpcap.h
index 981e5777deb7..1a85b06272c8 100644
--- a/include/linux/mfd/motorola-cpcap.h
+++ b/include/linux/mfd/motorola-cpcap.h
@@ -25,6 +25,12 @@
 #define CPCAP_REVISION_2_0	0x10
 #define CPCAP_REVISION_2_1	0x11
 
+enum cpcap_variant {
+	CPCAP_DEFAULT = 1,
+	CPCAP_MAPPHONE,
+	CPCAP_MAX
+};
+
 /* CPCAP registers */
 #define CPCAP_REG_INT1		0x0000	/* Interrupt 1 */
 #define CPCAP_REG_INT2		0x0004	/* Interrupt 2 */
-- 
2.51.0


