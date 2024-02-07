Return-Path: <linux-leds+bounces-775-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CCF7B84C4D9
	for <lists+linux-leds@lfdr.de>; Wed,  7 Feb 2024 07:14:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4A46EB28955
	for <lists+linux-leds@lfdr.de>; Wed,  7 Feb 2024 06:13:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DBC81D6A4;
	Wed,  7 Feb 2024 06:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ipt2IsWl"
X-Original-To: linux-leds@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97C841CD1F
	for <linux-leds@vger.kernel.org>; Wed,  7 Feb 2024 06:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707286269; cv=none; b=FN1AfGVBoEsoD/dIrTuxvgyrxlhk0/pqKuRecvxPtBuO8M3O0Jzo7NaArBFB1xrE6IuaLAMHwGx8MvatW5pW2b0ERQW65QqgwSbotvN2M3Zyw7rDus+7FmQyWZ5M00VQlOd0uK1ioN0WyuXNSHtmuutc0w5Nmgm37Zu8ogPCJGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707286269; c=relaxed/simple;
	bh=or6yDI2eFVz9vc38jffh1makIY7z4hDb2Eh0WltVGus=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OUMycZpssrr+0qUz/t/sLqsBofuDse4i5yxfuZK9X9bJGwiQtMqcnKrYvnqr5f6SFm6aFK79s896FRNXa5cdiwpCvolZ0ojizH7DZrHC+OGmXdVN2wwGMKSK3K3TxX3HL6bty/R5iCcGePA0DxO9sstQnQTl5Tp9wMvxpwU1q3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ipt2IsWl; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1707286266;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ta7vsgnKpKK9jWD6gKvlb0rNeOg4qU6YrWRgVsGKuAI=;
	b=Ipt2IsWlRtSyEFLkOc7t40VJ1TdeWjcNlLp5/sHdHipOFABeuTc2j2m9HuM15e94G6DGcR
	osJLFn6Y3mj8y+7FY8AkkSOtPo1KINUH71MTeWfAp6I/Z5sEaeoFLBlbTvWrXoi5gNwjuP
	MZDyMhtaIFmM2SJ4jKpYgYI5m1XKcTs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-460-NBAtpEv1OkqhxhliDK-bFA-1; Wed, 07 Feb 2024 01:11:02 -0500
X-MC-Unique: NBAtpEv1OkqhxhliDK-bFA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3C968848C02;
	Wed,  7 Feb 2024 06:11:02 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.64.240.8])
	by smtp.corp.redhat.com (Postfix) with ESMTP id F39F51C066A9;
	Wed,  7 Feb 2024 06:10:59 +0000 (UTC)
From: Kate Hsuan <hpa@redhat.com>
To: Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee@kernel.org>,
	linux-leds@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	=?UTF-8?q?Andr=C3=A9=20Apitzsch?= <git@apitzsch.eu>
Cc: Kate Hsuan <hpa@redhat.com>
Subject: [PATCH 2/2] leds: rgb: leds-ktd202x: Get device properties through fwnode to support ACPI
Date: Wed,  7 Feb 2024 14:10:06 +0800
Message-ID: <20240207061006.407066-3-hpa@redhat.com>
In-Reply-To: <20240207061006.407066-1-hpa@redhat.com>
References: <20240207061006.407066-1-hpa@redhat.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.7

This LED controller also installed on a Xiaomi pad2 and it is an x86
platform. The original driver is based on the device tree and can't be
used for this ACPI based system. This patch migrated the driver to
use fwnode to access the properties. Moreover, the fwnode API
supports device tree so this work would affect the original
implementations.

Signed-off-by: Kate Hsuan <hpa@redhat.com>
---
 drivers/leds/rgb/Kconfig        |  1 -
 drivers/leds/rgb/leds-ktd202x.c | 68 ++++++++++++++++++++++-----------
 2 files changed, 45 insertions(+), 24 deletions(-)

diff --git a/drivers/leds/rgb/Kconfig b/drivers/leds/rgb/Kconfig
index a6a21f564673..f245dbd9a163 100644
--- a/drivers/leds/rgb/Kconfig
+++ b/drivers/leds/rgb/Kconfig
@@ -17,7 +17,6 @@ config LEDS_GROUP_MULTICOLOR
 config LEDS_KTD202X
 	tristate "LED support for KTD202x Chips"
 	depends on I2C
-	depends on OF
 	select REGMAP_I2C
 	help
 	  This option enables support for the Kinetic KTD2026/KTD2027
diff --git a/drivers/leds/rgb/leds-ktd202x.c b/drivers/leds/rgb/leds-ktd202x.c
index 514965795a10..a1aef62e3db5 100644
--- a/drivers/leds/rgb/leds-ktd202x.c
+++ b/drivers/leds/rgb/leds-ktd202x.c
@@ -112,6 +112,8 @@ static int ktd202x_chip_disable(struct ktd202x *chip)
 
 	regmap_write(chip->regmap, KTD202X_REG_RESET_CONTROL, KTD202X_ENABLE_CTRL_SLEEP);
 
+	usleep_range(500, 600);
+
 	ret = regulator_bulk_disable(ARRAY_SIZE(chip->regulators), chip->regulators);
 	if (ret) {
 		dev_err(chip->dev, "Failed to disable regulators: %d\n", ret);
@@ -381,16 +383,18 @@ static int ktd202x_blink_mc_set(struct led_classdev *cdev,
 				 mc->num_colors);
 }
 
-static int ktd202x_setup_led_rgb(struct ktd202x *chip, struct device_node *np,
+static int ktd202x_setup_led_rgb(struct ktd202x *chip, struct fwnode_handle *np,
 				 struct ktd202x_led *led, struct led_init_data *init_data)
 {
 	struct led_classdev *cdev;
-	struct device_node *child;
+	struct fwnode_handle *child;
 	struct mc_subled *info;
-	int num_channels;
+	int num_channels = 0;
 	int i = 0;
 
-	num_channels = of_get_available_child_count(np);
+	fwnode_for_each_available_child_node(np, child) {
+		num_channels++;
+	}
 	if (!num_channels || num_channels > chip->num_leds)
 		return -EINVAL;
 
@@ -398,22 +402,22 @@ static int ktd202x_setup_led_rgb(struct ktd202x *chip, struct device_node *np,
 	if (!info)
 		return -ENOMEM;
 
-	for_each_available_child_of_node(np, child) {
+	fwnode_for_each_available_child_node(np, child) {
 		u32 mono_color;
 		u32 reg;
 		int ret;
 
-		ret = of_property_read_u32(child, "reg", &reg);
+		ret = fwnode_property_read_u32(child, "reg", &reg);
 		if (ret != 0 || reg >= chip->num_leds) {
 			dev_err(chip->dev, "invalid 'reg' of %pOFn\n", child);
-			of_node_put(child);
+			fwnode_handle_put(child);
 			return -EINVAL;
 		}
 
-		ret = of_property_read_u32(child, "color", &mono_color);
+		ret = fwnode_property_read_u32(child, "color", &mono_color);
 		if (ret < 0 && ret != -EINVAL) {
 			dev_err(chip->dev, "failed to parse 'color' of %pOF\n", child);
-			of_node_put(child);
+			fwnode_handle_put(child);
 			return ret;
 		}
 
@@ -433,14 +437,14 @@ static int ktd202x_setup_led_rgb(struct ktd202x *chip, struct device_node *np,
 	return devm_led_classdev_multicolor_register_ext(chip->dev, &led->mcdev, init_data);
 }
 
-static int ktd202x_setup_led_single(struct ktd202x *chip, struct device_node *np,
+static int ktd202x_setup_led_single(struct ktd202x *chip, struct fwnode_handle *np,
 				    struct ktd202x_led *led, struct led_init_data *init_data)
 {
 	struct led_classdev *cdev;
 	u32 reg;
 	int ret;
 
-	ret = of_property_read_u32(np, "reg", &reg);
+	ret = fwnode_property_read_u32(np, "reg", &reg);
 	if (ret != 0 || reg >= chip->num_leds) {
 		dev_err(chip->dev, "invalid 'reg' of %pOFn\n", np);
 		return -EINVAL;
@@ -454,7 +458,7 @@ static int ktd202x_setup_led_single(struct ktd202x *chip, struct device_node *np
 	return devm_led_classdev_register_ext(chip->dev, &led->cdev, init_data);
 }
 
-static int ktd202x_add_led(struct ktd202x *chip, struct device_node *np, unsigned int index)
+static int ktd202x_add_led(struct ktd202x *chip, struct fwnode_handle *np, unsigned int index)
 {
 	struct ktd202x_led *led = &chip->leds[index];
 	struct led_init_data init_data = {};
@@ -463,14 +467,14 @@ static int ktd202x_add_led(struct ktd202x *chip, struct device_node *np, unsigne
 	int ret;
 
 	/* Color property is optional in single color case */
-	ret = of_property_read_u32(np, "color", &color);
+	ret = fwnode_property_read_u32(np, "color", &color);
 	if (ret < 0 && ret != -EINVAL) {
 		dev_err(chip->dev, "failed to parse 'color' of %pOF\n", np);
 		return ret;
 	}
 
 	led->chip = chip;
-	init_data.fwnode = of_fwnode_handle(np);
+	init_data.fwnode = np;
 
 	if (color == LED_COLOR_ID_RGB) {
 		cdev = &led->mcdev.led_cdev;
@@ -492,26 +496,30 @@ static int ktd202x_add_led(struct ktd202x *chip, struct device_node *np, unsigne
 
 static int ktd202x_probe_dt(struct ktd202x *chip)
 {
-	struct device_node *np = dev_of_node(chip->dev), *child;
-	int count;
+	struct device *dev = chip->dev;
+	struct fwnode_handle *np, *child;
+	int count = 0;
 	int i = 0;
 
-	chip->num_leds = (int)(unsigned long)of_device_get_match_data(chip->dev);
+	count = device_get_child_node_count(dev);
 
-	count = of_get_available_child_count(np);
 	if (!count || count > chip->num_leds)
 		return -EINVAL;
 
+	np = dev_fwnode(chip->dev);
+	if (!np)
+		return -ENODEV;
+
 	regmap_write(chip->regmap, KTD202X_REG_RESET_CONTROL, KTD202X_RSTR_RESET);
 
 	/* Allow the device to execute the complete reset */
 	usleep_range(200, 300);
 
-	for_each_available_child_of_node(np, child) {
+	fwnode_for_each_available_child_node(np, child) {
 		int ret = ktd202x_add_led(chip, child, i);
 
 		if (ret) {
-			of_node_put(child);
+			fwnode_handle_put(child);
 			return ret;
 		}
 		i++;
@@ -533,7 +541,7 @@ static int ktd202x_probe(struct i2c_client *client)
 {
 	struct device *dev = &client->dev;
 	struct ktd202x *chip;
-	int count;
+	int count = 0;
 	int ret;
 
 	count = device_get_child_node_count(dev);
@@ -568,6 +576,8 @@ static int ktd202x_probe(struct i2c_client *client)
 		return ret;
 	}
 
+	chip->num_leds = (int) (unsigned long)i2c_get_match_data(client);
+
 	ret = ktd202x_probe_dt(chip);
 	if (ret < 0) {
 		regulator_bulk_disable(ARRAY_SIZE(chip->regulators), chip->regulators);
@@ -602,21 +612,33 @@ static void ktd202x_shutdown(struct i2c_client *client)
 	regmap_write(chip->regmap, KTD202X_REG_RESET_CONTROL, KTD202X_RSTR_RESET);
 }
 
+static const struct i2c_device_id ktd202x_id[] = {
+	{"ktd2026", KTD2026_NUM_LEDS},
+	{"ktd2027", KTD2027_NUM_LEDS},
+	{},
+};
+MODULE_DEVICE_TABLE(i2c, ktd202x_id);
+
+#ifndef CONFIG_ACPI
 static const struct of_device_id ktd202x_match_table[] = {
 	{ .compatible = "kinetic,ktd2026", .data = (void *)KTD2026_NUM_LEDS },
 	{ .compatible = "kinetic,ktd2027", .data = (void *)KTD2027_NUM_LEDS },
 	{},
 };
 MODULE_DEVICE_TABLE(of, ktd202x_match_table);
+#endif
 
 static struct i2c_driver ktd202x_driver = {
 	.driver = {
-		.name = "leds-ktd202x",
-		.of_match_table = ktd202x_match_table,
+		.name	= "leds-ktd202x",
+#ifndef CONFIG_ACPI
+		.of_match_table = ktd20xx_match_table,
+#endif
 	},
 	.probe = ktd202x_probe,
 	.remove = ktd202x_remove,
 	.shutdown = ktd202x_shutdown,
+	.id_table = ktd202x_id,
 };
 module_i2c_driver(ktd202x_driver);
 
-- 
2.43.0


