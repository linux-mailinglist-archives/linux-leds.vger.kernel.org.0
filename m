Return-Path: <linux-leds+bounces-6871-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sN1LHM8lhmlSKAQAu9opvQ
	(envelope-from <linux-leds+bounces-6871-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 06 Feb 2026 18:33:03 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DC501101182
	for <lists+linux-leds@lfdr.de>; Fri, 06 Feb 2026 18:33:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 97879306ABDC
	for <lists+linux-leds@lfdr.de>; Fri,  6 Feb 2026 17:30:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCFEB426EB5;
	Fri,  6 Feb 2026 17:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X7zx6xc9"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C154426D38
	for <linux-leds@vger.kernel.org>; Fri,  6 Feb 2026 17:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770398965; cv=none; b=hy26oorGq+bggTHvS2kTWxAI6t8HESNYJ2J3+70pudf18VDZ85AszUm/wbGkiOpCLBHEWThcCz3+3VyDt2KDWZe1DV08VwzE833PypJJx7O8eaE98owP9bCEPGoqob21CruBdbeHK+Q7LX1yAqZz394naL+MJbX8Wb+pD8qLvNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770398965; c=relaxed/simple;
	bh=8nK7uVl6v+pSmrvFya7GHw/59U+WVNcg+DflWmg+eco=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PEN+aNhBdMQx4vqsJ9CIVIyM6Y/L4NLIv7mjV2oi/vjFA9bPEkTWPpqxCmOH3Xx7bRkRFpCijKtidhfoPzUnTDp6TkFz2DQ/U976SQIrZRw6ZUFcnYC1b8QmtZ/bo0gEXbcbqr4kNwzMxdZXDjHmumJdGZghfY7QKWFPuqZW2k4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X7zx6xc9; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-43615d9c507so1688672f8f.1
        for <linux-leds@vger.kernel.org>; Fri, 06 Feb 2026 09:29:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770398964; x=1771003764; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5ScHHa9sLB0EQxzl6BiuNkW2/FL+7zrYJQ/WJF4R+IU=;
        b=X7zx6xc9O7rzlZ9m0CQEKBgUYeuXWvRK3C5HgLT/s7eiSp8NUm/mJ4CQ1IgVMQ6VuR
         15yF41RjNRwdRyPvm0Z0fsjQrD3ypRnpSA2UTBWdWmxUw4nueWmcuC7TXBPUsLy9Ix5n
         dRO6oQTMcFLJ1ILlRZ8p//izANEovb/0RzPnm3CvNmPYLnztS8+UivYdeYMVHjKatN/r
         NscAg1/ciyUd4bR/Zd/bQVIWlKbHeAhispSpsT3j5QljZuoItgdWoQZR4HlTZTK6RLzr
         GNj05LcmYCjVek3Iy7pD4YWZ4hJ3ZqEb2XTxSwsWDxWNGxHkzn7xx+G6cpthn571whC6
         5prQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770398964; x=1771003764;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5ScHHa9sLB0EQxzl6BiuNkW2/FL+7zrYJQ/WJF4R+IU=;
        b=SR1bMazY5j1LzZJghgMkzfCoIC/JEfnGd06u8xfce057BjdrkF1ho2yt3M9wQJmona
         2T6MceWKLE2KLJdYWeIPAo+NkAORk+vlwZz4+qGpt/2cv6ObYqs3JVgLTV+cRud6rUVb
         LSzMsEfed2HMPxX2xubfnp7yHjLPY9DFNFt9g7hc/8w0zu1SzOULeBxsblfuWkJ8tafY
         Eo3EN6ScK5Ck9uoGwV8xEEslC/i0M2KQxHMbVYrBpex5FjPFe5cRiW8Mk6i7sG5/a4tE
         CaG7VtIZYLvF/Ar/dVhbN1kHEMMHSsiynqcqh6h0d+seAtWNmGE5Iecl8QN6nv6wLeq+
         vVGQ==
X-Forwarded-Encrypted: i=1; AJvYcCUHXklsq7UUFUqSsgg4TKNsILj1MnR8pXKSU9jX1PZRH4q60+/CHmBFRZteffnJMoM2ESA9PCmoH85s@vger.kernel.org
X-Gm-Message-State: AOJu0YwWO8uorkpAuKFT/YUh11SePFep+vhMLuwc9vDUH88GvHf2XGsz
	Zck8jTyKfWciLFrC7GeHBs417L6WwxvUsFXCytT/objb1kkcRLkCM51C
X-Gm-Gg: AZuq6aLp/aH8Vv+yR4DMmhADLvF+eWK3vLw6tFjulfHWVN7Tkb7m9mUurLZ+X9bJ5D1
	fGnYnLzRBEZ+++3o+t42mrUN0ljlIuf+6xx0rFxxFnLikEHI+khKbF7oLklURIxQmvhV0CT2vDe
	423c9RCjxM75rNFwo+pmDln+05wrnJEtaZWkAhBuK8uHO5P63J+jnN7Ps1pOdJlUYkW+jjBLGE7
	WQ/RX2VcZWPsPRhM7WtlEXnY+ntZj6oHshuHvm7KVSXg/TxLV1bzTT0vxdOYIJlNnDWk63C3VJt
	NLWSo08Hp5HdrAPlHoeDddSbMI/pS/NbYQq9F/f9j6m1/paBShUAn/u3Tx7N0JV77VMr0CXoyjr
	80Q9+PjjuptvSlwi/Kv/lMpxuTM3i/SgAPCAE84fh5potEBVATlgG7YUpExV+8B5eCMjNGvdRjC
	hG
X-Received: by 2002:a05:6000:18a6:b0:435:e47b:e746 with SMTP id ffacd0b85a97d-43629378231mr5523391f8f.36.1770398963681;
        Fri, 06 Feb 2026 09:29:23 -0800 (PST)
Received: from xeon ([188.163.112.49])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43629734268sm6846033f8f.24.2026.02.06.09.29.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 09:29:23 -0800 (PST)
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
Subject: [PATCH v2 10/11] mfd: motorola-cpcap: diverge configuration per-board
Date: Fri,  6 Feb 2026 19:28:44 +0200
Message-ID: <20260206172845.145407-11-clamor95@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-6871-lists,linux-leds=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.989];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: DC501101182
X-Rspamd-Action: no action

MFD have rigid subdevice structure which does not allow flexible dynamic
subdevice linking. Address this by diverging CPCAP subdevice composition
to take into account board specific configuration.

Create a common default subdevice composition, rename existing subdevice
composition into cpcap_mapphone_mfd_devices since it targets mainly
Mapphone board.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/mfd/motorola-cpcap.c | 89 +++++++++++++++++++++++++++++++-----
 1 file changed, 78 insertions(+), 11 deletions(-)

diff --git a/drivers/mfd/motorola-cpcap.c b/drivers/mfd/motorola-cpcap.c
index d8243b956f87..bea11868e823 100644
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
@@ -195,16 +202,10 @@ static int cpcap_init_irq(struct cpcap_ddata *cpcap)
 	return 0;
 }
 
-static const struct of_device_id cpcap_of_match[] = {
-	{ .compatible = "motorola,cpcap", },
-	{ .compatible = "st,6556002", },
-	{},
-};
-MODULE_DEVICE_TABLE(of, cpcap_of_match);
-
 static const struct spi_device_id cpcap_spi_ids[] = {
 	{ .name = "cpcap", },
 	{ .name = "6556002", },
+	{ .name = "mapphone-cpcap", },
 	{},
 };
 MODULE_DEVICE_TABLE(spi, cpcap_spi_ids);
@@ -241,7 +242,56 @@ static int cpcap_resume(struct device *dev)
 
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
@@ -285,7 +335,12 @@ static const struct mfd_cell cpcap_mfd_devices[] = {
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
@@ -297,6 +352,10 @@ static int cpcap_probe(struct spi_device *spi)
 	if (!cpcap)
 		return -ENOMEM;
 
+	cpcap->cdata = device_get_match_data(&spi->dev);
+	if (!cpcap->cdata)
+		return -ENODEV;
+
 	cpcap->spi = spi;
 	spi_set_drvdata(spi, cpcap);
 
@@ -331,10 +390,18 @@ static int cpcap_probe(struct spi_device *spi)
 	spi->dev.coherent_dma_mask = 0;
 	spi->dev.dma_mask = &spi->dev.coherent_dma_mask;
 
-	return devm_mfd_add_devices(&spi->dev, 0, cpcap_mfd_devices,
-				    ARRAY_SIZE(cpcap_mfd_devices), NULL, 0, NULL);
+	return devm_mfd_add_devices(&spi->dev, 0, cpcap->cdata->mfd_devices,
+				    cpcap->cdata->num_devices, NULL, 0, NULL);
 }
 
+static const struct of_device_id cpcap_of_match[] = {
+	{ .compatible = "motorola,cpcap", .data = &cpcap_default_data },
+	{ .compatible = "st,6556002", .data = &cpcap_default_data },
+	{ .compatible = "motorola,mapphone-cpcap", .data = &cpcap_mapphone_data	},
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, cpcap_of_match);
+
 static struct spi_driver cpcap_driver = {
 	.driver = {
 		.name = "cpcap-core",
-- 
2.51.0


