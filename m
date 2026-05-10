Return-Path: <linux-leds+bounces-8070-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MJogC8BnAGq1IgEAu9opvQ
	(envelope-from <linux-leds+bounces-8070-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Sun, 10 May 2026 13:10:56 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BBC8E503BF6
	for <lists+linux-leds@lfdr.de>; Sun, 10 May 2026 13:10:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7F382302E324
	for <lists+linux-leds@lfdr.de>; Sun, 10 May 2026 11:08:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C75E37F8DA;
	Sun, 10 May 2026 11:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l+5b0IUQ"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D881137F01B
	for <linux-leds@vger.kernel.org>; Sun, 10 May 2026 11:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778411323; cv=none; b=VUBIGFomPOed510lMHSVkgn/yrPcq4mOiRyke/TQITZv9pMIxrX25uTLuXWED0DD5ymDpu/XUBkzFFevUETUwOYIE2YpVzVgeIZ0FQqzAQQxIP4FuDxgAw8vPqdauR8hxHF2HDs3rI2CNfrEQ7O5PkGkp5YF9sBtOzE6zXWddvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778411323; c=relaxed/simple;
	bh=h2fH+9JxaTA+3YN6pQmYivqu5WqGhmIv06d25+MV+iU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UGMZUbIpY5CpUJPgGYzqMeRVfMQGq9yUJegjVxGxPeBNUbJPxufYAypz0Idk4od1wibteCs5Ff3TblR3Abqy8s5mpesDf5lgevkZFyDWEjqdPlIRmzwjWPAnRVsa6VEb/Txdvj0CTTKD1POAi3jdkKFzs1G4DYILQqrt06JElKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l+5b0IUQ; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b9358dd7f79so537605766b.1
        for <linux-leds@vger.kernel.org>; Sun, 10 May 2026 04:08:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778411317; x=1779016117; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aVAaYCC/b8sB/+xZoh+WsYJWpP47TuMRhFWL9RvgVCE=;
        b=l+5b0IUQ+uPWSbm85NfhamKSBdYDgPKKrMJSXSjvBkvg3/PBxQU4txKX3jSUEX8KR9
         cZCX6tyBzg+n3h2FpVObCcHDo5usft4xiBBdxOBmKhPbGIFS7+Bp/TK3O0mpVwd1dktQ
         FvMXo16AYZhQhjeEjTX9xf63SxOiCD/P7/CmeWMQa7qhSsMT/YJejteXO+1R922qal7T
         isVIOMQTFYy6hTm/8sVRsvLYZEjJe3pWwsbp5vy6f+3APCkFp2gATDdIp6P2hmD/59TN
         qGExnsOgQsrzHfCs6CT1tWchh25Gl06AY+KskG8pEFhFK7znTwsYZCeIJxPIhg0bCBtI
         lkIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778411317; x=1779016117;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aVAaYCC/b8sB/+xZoh+WsYJWpP47TuMRhFWL9RvgVCE=;
        b=EwQ0d6OPElLvtU0lhG0NLJnW32sbYdZyoXZQ0980lilIfHh0sBX2m0XiMM1TAMWLoc
         0nNjiSey5Tr6Hf3fPa0lyZKwQZkGOUfJGNNleG1GwIRHVZyKMYfLeuH0R8Kc0KkdxDTm
         oWQJA+UVmxN7Hdmic3l62I9vFk/2vQLcFbFigb9KgT1BWWI+kaPg5yzP5JWq3UlxQb/f
         7yTxtAXqEvEDqSQ+FaWQw86rLL1oXhP4mNU/w8LwN74SNayaR14XW64atGPWc75mha2z
         dmLEJd5fnWuIJvPiY3Idz+/3W/gBtvgv1ZFxnV1mm9hnRB2Smjj/J/rupIUEJG2F6qcw
         PAGQ==
X-Forwarded-Encrypted: i=1; AFNElJ+pvG8wZtwygwu5cvk07pH2yYHZdInAXa2lZDTBHWQJJSfSaxNS85AVpnGgT6JUpH1MRCEClhsg/dSn@vger.kernel.org
X-Gm-Message-State: AOJu0YwuFoBHpXeCWIrEHIpjJyP23Mot2Uzq+nGhIEbFzbO1YUN2ktIS
	rqIEL7x8zQnMmI8WuJPs+gp1nQlrnFoUdzJk0m4k2utY+NofacP6fAV9
X-Gm-Gg: Acq92OFdB2JoTlNaM1CcngPtcdpXUrBCTmJKFYK8UnXa1Q/kfoCoIhb7C/5Xg4FdZAz
	eBeZNOcTUtPh75thQ+wx28LGk8mhevp7h1P+amAACfiXnhYo2DYQuQIHNsAc7W4K/L/vmFPWy3r
	I3EbrUM+h+ta42VeICW42DMdjy0AUxRYzcAImaV3DTn2+i/5ena1lcRKZTk/ArzYcSYJiFlVNyl
	v2+Rhd5xFo1gavLEdwHE/xYozCW39WTMhnjE6CrzPeSw/RStGPOw2ml/DB+m5p7udMOIFHD1Jgh
	nQhbor28wodWvmNkwCMTLTnJB9abVqUU3+6nTrU4PCOIvSA84fYSUcYK6d/HLon8OrEnaPI6qcc
	dvuCitHGQsCI7M5i9Tbd34C6M6vC8Lz05RQkxqb825GwWgP3v/aKfv8Q+L6p2NQVQGEefijDFyx
	k1xDA5MQ6+dcOF2Nuxkx/f9ZY=
X-Received: by 2002:a17:907:a07:b0:ba4:f501:cb8b with SMTP id a640c23a62f3a-bc56b83947fmr1184792166b.16.1778411316870;
        Sun, 10 May 2026 04:08:36 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bce7a3fcb57sm68146866b.60.2026.05.10.04.08.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 04:08:36 -0700 (PDT)
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
Subject: [PATCH v5 5/6] mfd: motorola-cpcap: diverge configuration per-board
Date: Sun, 10 May 2026 14:08:03 +0300
Message-ID: <20260510110804.33045-6-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260510110804.33045-1-clamor95@gmail.com>
References: <20260510110804.33045-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: BBC8E503BF6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-8070-lists,linux-leds=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.984];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
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
 drivers/mfd/motorola-cpcap.c       | 142 ++++++++++++++++-------------
 include/linux/mfd/motorola-cpcap.h |   6 ++
 2 files changed, 87 insertions(+), 61 deletions(-)

diff --git a/drivers/mfd/motorola-cpcap.c b/drivers/mfd/motorola-cpcap.c
index d8243b956f87..f5a7fdd89dd5 100644
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
@@ -241,62 +229,76 @@ static int cpcap_resume(struct device *dev)
 
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
+static const struct mfd_cell cpcap_default_mfd_devices[] = {
+	MFD_CELL_OF("cpcap_adc", NULL, NULL, 0, 0, "motorola,cpcap-adc"),
+	MFD_CELL_OF("cpcap_battery", NULL, NULL, 0, 0,
+		    "motorola,cpcap-battery"),
+	MFD_CELL_OF("cpcap-regulator", NULL, NULL, 0, 0,
+		    "motorola,cpcap-regulator"),
+	MFD_CELL_OF("cpcap-rtc", NULL, NULL, 0, 0, "motorola,cpcap-rtc"),
+	MFD_CELL_OF("cpcap-pwrbutton", NULL, NULL, 0, 0,
+		    "motorola,cpcap-pwrbutton"),
+	MFD_CELL_OF("cpcap-usb-phy", NULL, NULL, 0, 0,
+		    "motorola,cpcap-usb-phy"),
+	MFD_CELL_OF("cpcap-led", NULL, NULL, 0, 0, "motorola,cpcap-led-red"),
+	MFD_CELL_OF("cpcap-led", NULL, NULL, 0, 1, "motorola,cpcap-led-green"),
+	MFD_CELL_OF("cpcap-led", NULL, NULL, 0, 2, "motorola,cpcap-led-blue"),
+	MFD_CELL_OF("cpcap-led", NULL, NULL, 0, 3, "motorola,cpcap-led-adl"),
+	MFD_CELL_OF("cpcap-led", NULL, NULL, 0, 4, "motorola,cpcap-led-cp"),
+	MFD_CELL_NAME("cpcap-codec"),
+};
+
+static const struct mfd_cell cpcap_mapphone_mfd_devices[] = {
+	MFD_CELL_OF("cpcap_adc", NULL, NULL, 0, 0,
+		    "motorola,mapphone-cpcap-adc"),
+	MFD_CELL_OF("cpcap_battery", NULL, NULL, 0, 0,
+		    "motorola,cpcap-battery"),
+	MFD_CELL_OF("cpcap-charger", NULL, NULL, 0, 0,
+		    "motorola,mapphone-cpcap-charger"),
+	MFD_CELL_OF("cpcap-regulator", NULL, NULL, 0, 0,
+		    "motorola,mapphone-cpcap-regulator"),
+	MFD_CELL_OF("cpcap-rtc", NULL, NULL, 0, 0, "motorola,cpcap-rtc"),
+	MFD_CELL_OF("cpcap-pwrbutton", NULL, NULL, 0, 0,
+		    "motorola,cpcap-pwrbutton"),
+	MFD_CELL_OF("cpcap-usb-phy", NULL, NULL, 0, 0,
+		    "motorola,mapphone-cpcap-usb-phy"),
+	MFD_CELL_OF("cpcap-led", NULL, NULL, 0, 0, "motorola,cpcap-led-red"),
+	MFD_CELL_OF("cpcap-led", NULL, NULL, 0, 1, "motorola,cpcap-led-green"),
+	MFD_CELL_OF("cpcap-led", NULL, NULL, 0, 2, "motorola,cpcap-led-blue"),
+	MFD_CELL_OF("cpcap-led", NULL, NULL, 0, 3, "motorola,cpcap-led-adl"),
+	MFD_CELL_OF("cpcap-led", NULL, NULL, 0, 4, "motorola,cpcap-led-cp"),
+	MFD_CELL_NAME("cpcap-codec"),
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
+	if (!cpcap->variant)
+		return -ENODEV;
+
+	switch (cpcap->variant) {
+	case CPCAP_DEFAULT:
+		cells = cpcap_default_mfd_devices;
+		num_cells = ARRAY_SIZE(cpcap_default_mfd_devices);
+		break;
+	case CPCAP_MAPPHONE:
+		cells = cpcap_mapphone_mfd_devices;
+		num_cells = ARRAY_SIZE(cpcap_mapphone_mfd_devices);
+		break;
+	default:
+		return dev_err_probe(&spi->dev, -EINVAL,
+				     "Unknown device %d\n", cpcap->variant);
+	}
+
 	cpcap->spi = spi;
 	spi_set_drvdata(spi, cpcap);
 
@@ -331,10 +333,28 @@ static int cpcap_probe(struct spi_device *spi)
 	spi->dev.coherent_dma_mask = 0;
 	spi->dev.dma_mask = &spi->dev.coherent_dma_mask;
 
-	return devm_mfd_add_devices(&spi->dev, 0, cpcap_mfd_devices,
-				    ARRAY_SIZE(cpcap_mfd_devices), NULL, 0, NULL);
+	return devm_mfd_add_devices(&spi->dev, 0, cells, num_cells, NULL, 0, NULL);
 }
 
+static const struct of_device_id cpcap_of_match[] = {
+	{
+		.compatible = "motorola,cpcap",
+		.data = (void *)CPCAP_DEFAULT
+	}, {
+		.compatible = "motorola,mapphone-cpcap",
+		.data = (void *)CPCAP_MAPPHONE
+	},
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


