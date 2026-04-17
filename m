Return-Path: <linux-leds+bounces-7748-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sJ/7MaHe4WnEzQAAu9opvQ
	(envelope-from <linux-leds+bounces-7748-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 17 Apr 2026 09:17:53 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 53F2E417D2F
	for <lists+linux-leds@lfdr.de>; Fri, 17 Apr 2026 09:17:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1254A31D8DC8
	for <lists+linux-leds@lfdr.de>; Fri, 17 Apr 2026 07:11:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E3EE346E66;
	Fri, 17 Apr 2026 07:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p67Y96Jp"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29E98344D8C
	for <linux-leds@vger.kernel.org>; Fri, 17 Apr 2026 07:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776409900; cv=none; b=QAZsVm24JqFNm2j00YumwKLB2veCNgK3Xidn+J0yiAqHPN46dr0OLleuzcSw+IcYnSiaCSai+uhH+kMyEsXeSK1nQra/A00Q9bpQglC1wU2o50FO4oKKZUhXWS/MUzmwRGUIB482vSrmIIy2spdAqREcPNzTPlM/lsQ4Crnu9q8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776409900; c=relaxed/simple;
	bh=Fi8+HlKnN1h+N9DJycInvz7TYXjUPCLz5vbSQaQ2Gmo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RMucKwo3NSRgtQypBKLu4TlDS6Vitt/38Ou5Ri9Z4FAbJamAdU2eo7BW7sbG/9IhOLyIi8fvhiYaTtJEFtIg3YtIBKxxaUN8Dy+W6duE/xkAVyZm2MPbaq3pMOclDZKIj8I006O01n8Clod6h6rT5Df+iQ3XiW26UdYj2X8DnzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p67Y96Jp; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5a0ff30b240so465222e87.0
        for <linux-leds@vger.kernel.org>; Fri, 17 Apr 2026 00:11:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776409896; x=1777014696; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PX7h5kXQ2ZfXYWkWgx4GofzlTaZv8NlPbhuLaaOQgic=;
        b=p67Y96Jphzf5W62bzpTZtxrWzGfeFl+IhjPJj5Tn5mYIdvJT5TwLloseTaPptgKtJu
         G3iDi9+I1NDns5dUdwWqfC1hI7slF7J6G69y5pl9UnKp0dUdbbzXK6Frh7+fuazmGkjp
         Jzpd++k3La4VV/XaoqAi6l2mqv59njJ9+s7oP7/S777Bdzm54YZQ+W4+eFgWpAAioPUV
         zLKhk98PgfYoUNKlOvfBpGLJAxceRcwkBavtFxmHgubKs3t0hi1BliXn/a0W/6KgsaXf
         ZTEWeGYrAnMn2agHiLRPuqfQRLqDO2qs1vEBy1AiO8pSI8527aaLwr37jSsjFqykqot4
         bIEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776409896; x=1777014696;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PX7h5kXQ2ZfXYWkWgx4GofzlTaZv8NlPbhuLaaOQgic=;
        b=Q1bBa82ekxw/g42yObVbQBughLqtzUuSipoPwzu8VSQP1DIcNBYd7z0ncHzL56IgoD
         ZSLznaSeS2CA+t23fQLJ3HsSzmRSjpmLRgSMQaBvwu3/XqmyfjgndRpobSzZyYff2Fqf
         71PLdjmGGu/RswIQ6im7P5/UGnVkvWQcHwD2p00T9a/KOGQLVD5qIqCGMmLVtOtGd/o1
         Ge+sApaPAwQvHTR/JLm6/LvORze/TtqLsSGmdC43ZDeBwFkn6b7cm8WemX3EMD64zvEq
         zqYrWcjyNrkj1X4LTeKo5RiVH0i3yKUWl8mh1QoLBl1Tci8SxUx3wYQ9cR3eIHdA9a8f
         ajDA==
X-Forwarded-Encrypted: i=1; AFNElJ+gmoXq3qI+D4/Ll4/OkCMocOcdk1SAt61FJ0we3i1+djRXq+gn0tVNEQqenvtUEtItqMqW0vfzU0I8@vger.kernel.org
X-Gm-Message-State: AOJu0YxrTaW/Wf/MTTj5KwVbxunOGyFcf6SvWwDJeED5do8NXUo3rcBQ
	LNf/+eKHxvU+ZxGAXJWIGB6ihDhAGGF8vMSBeynkRpegrNOcVAAarfW/
X-Gm-Gg: AeBDiet7xSLacfda2BevQ8PwvfnJflW1ij/Q2uJDpTmDIV9W5ndMcwayzfaUWrPdAT3
	T1D2FY7NOQRXdi43inBrucVKgUVrbmN9ycBM06DyJbPb2LFixmMyxed6vvqttC+cUPwL0BO9+Hi
	UL+v8fSogXnwiwde1a8xywN7qnoqILXOeWNw0S/iwtel8Sl4Egl4vg/MhIrr2wnsTSn/tT+BJPx
	8MMn1z4bhp6+8HfL3eTtQEsbN3tMzOoTjSt5eACGHZ24blPEdQ+EkVzQS0f/0U9oZp0JU1VxewS
	FjdUl5WAiN+98WPiIkXchqPLm8YyAGPC472ue7suqlRvhaBc3h3AxQD3K0e2RLJiKn/gIb5zAFw
	KXnvA97BMyS2R2CZ6CzWmTmSE+puDrEV2W3F/IOHv5yOJZ7G8oDT2XsQ115n3YuyikDGrH4pJKJ
	DjTBCzgC+0BhvZGUG3NmXPM+FKzxSAVVpGxQ==
X-Received: by 2002:a05:6512:3b12:b0:5a3:f3a4:1aff with SMTP id 2adb3069b0e04-5a4172e87afmr393310e87.38.1776409896176;
        Fri, 17 Apr 2026 00:11:36 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4185bc240sm162772e87.23.2026.04.17.00.11.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 00:11:35 -0700 (PDT)
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
Subject: [PATCH v4 5/6] mfd: motorola-cpcap: diverge configuration per-board
Date: Fri, 17 Apr 2026 10:11:05 +0300
Message-ID: <20260417071106.21984-6-clamor95@gmail.com>
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
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7748-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,baylibre.com,atomide.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.991];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 53F2E417D2F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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


