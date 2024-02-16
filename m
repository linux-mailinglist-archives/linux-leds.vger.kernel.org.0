Return-Path: <linux-leds+bounces-847-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A31185821D
	for <lists+linux-leds@lfdr.de>; Fri, 16 Feb 2024 17:06:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 59BFA1C2130A
	for <lists+linux-leds@lfdr.de>; Fri, 16 Feb 2024 16:06:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4097A12F5AE;
	Fri, 16 Feb 2024 16:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cd2Krt2F"
X-Original-To: linux-leds@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DD6512BEBB
	for <linux-leds@vger.kernel.org>; Fri, 16 Feb 2024 16:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708099572; cv=none; b=u131IghBSoza8HLIYQ+9zBmwoVRR+TBEh9gud87SEYjgQQOFhuy9HbvsL6hKOpzz2lJEEAxI78AxQWjYtHa/Mk9pdPsqNaCbLhRyzrZd+LbPbjk4ROMPEbdWMix6Gobt1MmPm6ARzOZCIwEHGUO9KDCtktJtBtEpRKPwE5DFwN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708099572; c=relaxed/simple;
	bh=yqKclV0NPqSLvxU0ArKUQB4rOtlkbw1Rme/pB/VKCho=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Wlpl/kx4aqpjB49XdHmD+0h0lSuTJHceQOvLGIofu04U1DWp7QbGVS70Lm6mXT+tnxez5EnINvs3PEtrmhhyNMIDRQJwwBSekIHOALdkPQ2Ye/D1cbeTWY0Wymnut9mzjzdWsp6YhdbavySu8rOS7XTirDoruYjurFCB+m1V0o8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cd2Krt2F; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1708099569;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gaj7roeARNSrWhk/9zy9SUlSFnO3r0EEzHAmXFwT4F4=;
	b=cd2Krt2FW7pKVvgOsN0aQbQeK93T858ER3gelAqpAv2TP6bZZcVDOX1+/Tc8rCrBSKIJj3
	1msCLXGPsuePBsoiUofZDd4CgH18BojN/hlJa1VeOHn4j4+/p4VTMlBbRavfoG/76G+4+y
	5njzBeGHjG8tlk1JVOEYRuGDH8AOWik=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-198-VJkNpuCeMSOF8Vwa0EzvOQ-1; Fri, 16 Feb 2024 11:06:06 -0500
X-MC-Unique: VJkNpuCeMSOF8Vwa0EzvOQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F0AA285A58B;
	Fri, 16 Feb 2024 16:06:05 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.39.192.108])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E4F90492BE5;
	Fri, 16 Feb 2024 16:06:01 +0000 (UTC)
From: Kate Hsuan <hpa@redhat.com>
To: Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee@kernel.org>,
	linux-leds@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	=?UTF-8?q?Andr=C3=A9=20Apitzsch?= <git@apitzsch.eu>
Cc: Kate Hsuan <hpa@redhat.com>
Subject: [PATCH v2 3/3] leds: rgb: leds-ktd202x: Skip regulator settings for Xiaomi pad2
Date: Sat, 17 Feb 2024 00:05:26 +0800
Message-ID: <20240216160526.235594-4-hpa@redhat.com>
In-Reply-To: <20240216160526.235594-1-hpa@redhat.com>
References: <20240216160526.235594-1-hpa@redhat.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.10

The controller is already powered by BP25890RTWR on Xiaomi Pad2 so the
regulator settings can be ignored.

Signed-off-by: Kate Hsuan <hpa@redhat.com>
---
 drivers/leds/rgb/leds-ktd202x.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/leds/rgb/leds-ktd202x.c b/drivers/leds/rgb/leds-ktd202x.c
index 8eb79c342fb6..6fd0794988e9 100644
--- a/drivers/leds/rgb/leds-ktd202x.c
+++ b/drivers/leds/rgb/leds-ktd202x.c
@@ -14,7 +14,9 @@
 #include <linux/of.h>
 #include <linux/of_device.h>
 #include <linux/regmap.h>
+#ifndef CONFIG_ACPI
 #include <linux/regulator/consumer.h>
+#endif
 
 #define KTD2026_NUM_LEDS 3
 #define KTD2027_NUM_LEDS 4
@@ -105,18 +107,22 @@ struct ktd202x {
 
 static int ktd202x_chip_disable(struct ktd202x *chip)
 {
+#ifndef CONFIG_ACPI
 	int ret;
+#endif
 
 	if (!chip->enabled)
 		return 0;
 
 	regmap_write(chip->regmap, KTD202X_REG_RESET_CONTROL, KTD202X_ENABLE_CTRL_SLEEP);
 
+#ifndef CONFIG_ACPI
 	ret = regulator_bulk_disable(ARRAY_SIZE(chip->regulators), chip->regulators);
 	if (ret) {
 		dev_err(chip->dev, "Failed to disable regulators: %d\n", ret);
 		return ret;
 	}
+#endif
 
 	chip->enabled = false;
 	return 0;
@@ -129,11 +135,13 @@ static int ktd202x_chip_enable(struct ktd202x *chip)
 	if (chip->enabled)
 		return 0;
 
+#ifndef CONFIG_ACPI
 	ret = regulator_bulk_enable(ARRAY_SIZE(chip->regulators), chip->regulators);
 	if (ret) {
 		dev_err(chip->dev, "Failed to enable regulators: %d\n", ret);
 		return ret;
 	}
+#endif
 	chip->enabled = true;
 
 	ret = regmap_write(chip->regmap, KTD202X_REG_RESET_CONTROL, KTD202X_ENABLE_CTRL_WAKE);
@@ -560,6 +568,7 @@ static int ktd202x_probe(struct i2c_client *client)
 		return ret;
 	}
 
+#ifndef CONFIG_ACPI
 	chip->regulators[0].supply = "vin";
 	chip->regulators[1].supply = "vio";
 	ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(chip->regulators), chip->regulators);
@@ -573,10 +582,12 @@ static int ktd202x_probe(struct i2c_client *client)
 		dev_err_probe(dev, ret, "Failed to enable regulators.\n");
 		return ret;
 	}
+#endif
 
 	chip->num_leds = (int) (unsigned long)i2c_get_match_data(client);
 
 	ret = ktd202x_probe_dt(chip);
+#ifndef CONFIG_ACPI
 	if (ret < 0) {
 		regulator_bulk_disable(ARRAY_SIZE(chip->regulators), chip->regulators);
 		return ret;
@@ -587,6 +598,10 @@ static int ktd202x_probe(struct i2c_client *client)
 		dev_err_probe(dev, ret, "Failed to disable regulators.\n");
 		return ret;
 	}
+#else
+	if (ret < 0)
+		return ret;
+#endif
 
 	mutex_init(&chip->mutex);
 
-- 
2.43.1


