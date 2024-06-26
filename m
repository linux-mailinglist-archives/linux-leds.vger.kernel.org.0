Return-Path: <linux-leds+bounces-2131-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 339B791867D
	for <lists+linux-leds@lfdr.de>; Wed, 26 Jun 2024 18:01:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4E6A91C22C5B
	for <lists+linux-leds@lfdr.de>; Wed, 26 Jun 2024 16:01:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B245318FC62;
	Wed, 26 Jun 2024 16:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GbEdqi2Y"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37ECD18F2C5;
	Wed, 26 Jun 2024 16:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719417638; cv=none; b=BQeuug30Ro8koUN27r2OmY9+coosUGalXTUtMT87Uowj1vhU+Ny+L8D4q+IimTa8sNFu/WSqsJMJ3RRgo+ccq6PV2ulWmheqh9xRK05D20Z/aXK5E67u2Q5h0kuNnYuwv087uGOOq5EArjvyhXIuHmGo0PehZkGbCTGcqmpQ3Es=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719417638; c=relaxed/simple;
	bh=SmjtxShMC/MeN5LxSHq9p2LUeSSangClxELNKdgN2XE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UJJD6uh9EqSYLB5y3x3U2UKk4GiuDfzlEE6Rs14y8i5HD6S8VDm++EBbBSzvUSx/l1g8c8MGod3GKqk0O4EyJlEdm5yKH0ZDHumqTCOQu4W81WS79NY7Ua+o7rOIj5WjP+k2j7jOgzuDcHwh6cLvmCaoY12QSgP/G2/hpYy5q7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GbEdqi2Y; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-367339bd00aso266125f8f.3;
        Wed, 26 Jun 2024 09:00:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719417634; x=1720022434; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mEf3r1d9MB8qpJNjhf4z5Bor9q+rkqR86BR+W9NrFv0=;
        b=GbEdqi2YKm7x9TB23erd+6FKJU8uOyt8uzcltFuxAkNhFlPjxw07NWcYn1JvYcYnH2
         sDY+UIHbMbTN8127Xj+d75UXyhfc60jaw7QrMpHivkCJIGqG25uFfLGWvhGe7gDKpRjj
         X3z3hal4QxIcVBpHM5KpRgEWV6SptSdpu9YRG4877WBCz8RhfLq/6LNo/zElaarZxwuP
         30Rz5XBdT0OwWgeosPM4JlI7OakflQxyMO1E/pQ5m8s95eELrs/CFI75pJr10HMtCI8B
         qo2PNr3fcx0HT67UCsdty/VhUX/LKcYS7OigbZBnRNN8M/NLZjKK29ND+ghs58Pp1zRQ
         TiNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719417634; x=1720022434;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mEf3r1d9MB8qpJNjhf4z5Bor9q+rkqR86BR+W9NrFv0=;
        b=dztGOAlyJWvIJmXOEPDLzf+GTWx63B3lq3Pq59DIQYffRnJpYkRPV9jkP29XxqllBF
         eT6dK6+UVfuNDb2xGaRrImTwR0Wy+42HSt0VOCYaRH9Fbc663HYe43838sxSix3AQUFE
         3aBlCQEUPnzSKTSKzaKYiMl790J95rL0OwXvEwE5y+5yE3WNDQiDI2mAhuPFpFHt2v13
         ME4RHhvowbpGDNQ/hNnaCIuhi+71CXHPIRHxDUZ096q4AkDvzOzYsA/1gsDmViop4hi7
         CxuK2G7FLV3n6/VMOwFykznFNGsVXC1AnNRYL9CTe4+7vuPtiBIKnTcIwDOn/CGxG7IN
         jL0A==
X-Forwarded-Encrypted: i=1; AJvYcCV8si3aCXvDGJy8la2Bvd6C0sMoF5mgjhRE1/4hshxP9TwMoJMxl9MlwU87f37z0+JcpuvhP8jtYxd2Pb9Y0ijV4yfiYAtolHNBmt+GycN8E6WJ5+I0GwzT3xwrEno58RfvU5TwOdU0QSzePdi0cS7eIVFAEHuyszRhLPTFyRVLi84eE1U=
X-Gm-Message-State: AOJu0YyPzgXZp3NofNQBFPxg6LpVc+zHFknvs7LUFrSGSdaCfvBBs526
	jmEKj2TzPu1ylkdaU4WifufTFZQWaguJp6kMoILAtUlps4Rnan2q
X-Google-Smtp-Source: AGHT+IH79zRItxEh9Matb2AOVzF29qo3zE27Zn0zUtIjAwOvitbKpjz/jAOSEvj5vmFevvhiOjxCXg==
X-Received: by 2002:adf:f003:0:b0:365:b695:ef76 with SMTP id ffacd0b85a97d-366e94d148amr6725834f8f.36.1719417634378;
        Wed, 26 Jun 2024 09:00:34 -0700 (PDT)
Received: from localhost.localdomain (93-34-90-105.ip49.fastwebnet.it. [93.34.90.105])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-366389b88easm16180589f8f.39.2024.06.26.09.00.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 09:00:34 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jacek Anaszewski <jacek.anaszewski@gmail.com>,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH v8 04/20] leds: leds-lp55xx: Generalize probe/remove functions
Date: Wed, 26 Jun 2024 18:00:09 +0200
Message-ID: <20240626160027.19703-5-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240626160027.19703-1-ansuelsmth@gmail.com>
References: <20240626160027.19703-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Now that stop_all_engine is generalized, probe and remove function are
the same across every lp55xx based LED driver and can be generalized.

To permit to use a common probe, make use of the OF match_data and i2c
driver_data value to store the device_config struct specific for the
LED.

Also drop the now unused exported symbol in lp55xx-common and make them
static.

Update any lp55xx based LED driver to use the new generic probe/remove.

Suggested-by: Lee Jones <lee@kernel.org>
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/leds/leds-lp5521.c        |  81 +----------------
 drivers/leds/leds-lp5523.c        |  85 ++----------------
 drivers/leds/leds-lp5562.c        |  80 +----------------
 drivers/leds/leds-lp55xx-common.c | 141 ++++++++++++++++++++++--------
 drivers/leds/leds-lp55xx-common.h |  21 +----
 drivers/leds/leds-lp8501.c        |  81 +----------------
 6 files changed, 127 insertions(+), 362 deletions(-)

diff --git a/drivers/leds/leds-lp5521.c b/drivers/leds/leds-lp5521.c
index 8b006de400fd..5015f385cc17 100644
--- a/drivers/leds/leds-lp5521.c
+++ b/drivers/leds/leds-lp5521.c
@@ -514,87 +514,14 @@ static struct lp55xx_device_config lp5521_cfg = {
 	.dev_attr_group     = &lp5521_group,
 };
 
-static int lp5521_probe(struct i2c_client *client)
-{
-	const struct i2c_device_id *id = i2c_client_get_device_id(client);
-	int ret;
-	struct lp55xx_chip *chip;
-	struct lp55xx_led *led;
-	struct lp55xx_platform_data *pdata = dev_get_platdata(&client->dev);
-	struct device_node *np = dev_of_node(&client->dev);
-
-	chip = devm_kzalloc(&client->dev, sizeof(*chip), GFP_KERNEL);
-	if (!chip)
-		return -ENOMEM;
-
-	chip->cfg = &lp5521_cfg;
-
-	if (!pdata) {
-		if (np) {
-			pdata = lp55xx_of_populate_pdata(&client->dev, np,
-							 chip);
-			if (IS_ERR(pdata))
-				return PTR_ERR(pdata);
-		} else {
-			dev_err(&client->dev, "no platform data\n");
-			return -EINVAL;
-		}
-	}
-
-	led = devm_kcalloc(&client->dev,
-			pdata->num_channels, sizeof(*led), GFP_KERNEL);
-	if (!led)
-		return -ENOMEM;
-
-	chip->cl = client;
-	chip->pdata = pdata;
-
-	mutex_init(&chip->lock);
-
-	i2c_set_clientdata(client, led);
-
-	ret = lp55xx_init_device(chip);
-	if (ret)
-		goto err_init;
-
-	dev_info(&client->dev, "%s programmable led chip found\n", id->name);
-
-	ret = lp55xx_register_leds(led, chip);
-	if (ret)
-		goto err_out;
-
-	ret = lp55xx_register_sysfs(chip);
-	if (ret) {
-		dev_err(&client->dev, "registering sysfs failed\n");
-		goto err_out;
-	}
-
-	return 0;
-
-err_out:
-	lp55xx_deinit_device(chip);
-err_init:
-	return ret;
-}
-
-static void lp5521_remove(struct i2c_client *client)
-{
-	struct lp55xx_led *led = i2c_get_clientdata(client);
-	struct lp55xx_chip *chip = led->chip;
-
-	lp55xx_stop_all_engine(chip);
-	lp55xx_unregister_sysfs(chip);
-	lp55xx_deinit_device(chip);
-}
-
 static const struct i2c_device_id lp5521_id[] = {
-	{ "lp5521" }, /* Three channel chip */
+	{ "lp5521", .driver_data = (kernel_ulong_t)&lp5521_cfg, }, /* Three channel chip */
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, lp5521_id);
 
 static const struct of_device_id of_lp5521_leds_match[] = {
-	{ .compatible = "national,lp5521", },
+	{ .compatible = "national,lp5521", .data = &lp5521_cfg, },
 	{},
 };
 
@@ -605,8 +532,8 @@ static struct i2c_driver lp5521_driver = {
 		.name	= "lp5521",
 		.of_match_table = of_lp5521_leds_match,
 	},
-	.probe		= lp5521_probe,
-	.remove		= lp5521_remove,
+	.probe		= lp55xx_probe,
+	.remove		= lp55xx_remove,
 	.id_table	= lp5521_id,
 };
 
diff --git a/drivers/leds/leds-lp5523.c b/drivers/leds/leds-lp5523.c
index 79931555eddd..bd0209e2ee42 100644
--- a/drivers/leds/leds-lp5523.c
+++ b/drivers/leds/leds-lp5523.c
@@ -895,90 +895,17 @@ static struct lp55xx_device_config lp5523_cfg = {
 	.dev_attr_group     = &lp5523_group,
 };
 
-static int lp5523_probe(struct i2c_client *client)
-{
-	const struct i2c_device_id *id = i2c_client_get_device_id(client);
-	int ret;
-	struct lp55xx_chip *chip;
-	struct lp55xx_led *led;
-	struct lp55xx_platform_data *pdata = dev_get_platdata(&client->dev);
-	struct device_node *np = dev_of_node(&client->dev);
-
-	chip = devm_kzalloc(&client->dev, sizeof(*chip), GFP_KERNEL);
-	if (!chip)
-		return -ENOMEM;
-
-	chip->cfg = &lp5523_cfg;
-
-	if (!pdata) {
-		if (np) {
-			pdata = lp55xx_of_populate_pdata(&client->dev, np,
-							 chip);
-			if (IS_ERR(pdata))
-				return PTR_ERR(pdata);
-		} else {
-			dev_err(&client->dev, "no platform data\n");
-			return -EINVAL;
-		}
-	}
-
-	led = devm_kcalloc(&client->dev,
-			pdata->num_channels, sizeof(*led), GFP_KERNEL);
-	if (!led)
-		return -ENOMEM;
-
-	chip->cl = client;
-	chip->pdata = pdata;
-
-	mutex_init(&chip->lock);
-
-	i2c_set_clientdata(client, led);
-
-	ret = lp55xx_init_device(chip);
-	if (ret)
-		goto err_init;
-
-	dev_info(&client->dev, "%s Programmable led chip found\n", id->name);
-
-	ret = lp55xx_register_leds(led, chip);
-	if (ret)
-		goto err_out;
-
-	ret = lp55xx_register_sysfs(chip);
-	if (ret) {
-		dev_err(&client->dev, "registering sysfs failed\n");
-		goto err_out;
-	}
-
-	return 0;
-
-err_out:
-	lp55xx_deinit_device(chip);
-err_init:
-	return ret;
-}
-
-static void lp5523_remove(struct i2c_client *client)
-{
-	struct lp55xx_led *led = i2c_get_clientdata(client);
-	struct lp55xx_chip *chip = led->chip;
-
-	lp55xx_stop_all_engine(chip);
-	lp55xx_unregister_sysfs(chip);
-	lp55xx_deinit_device(chip);
-}
-
 static const struct i2c_device_id lp5523_id[] = {
-	{ "lp5523",  LP5523 },
-	{ "lp55231", LP55231 },
+	{ "lp5523",  .driver_data = (kernel_ulong_t)&lp5523_cfg, },
+	{ "lp55231", .driver_data = (kernel_ulong_t)&lp5523_cfg, },
 	{ }
 };
 
 MODULE_DEVICE_TABLE(i2c, lp5523_id);
 
 static const struct of_device_id of_lp5523_leds_match[] = {
-	{ .compatible = "national,lp5523", },
-	{ .compatible = "ti,lp55231", },
+	{ .compatible = "national,lp5523", .data = &lp5523_cfg, },
+	{ .compatible = "ti,lp55231", .data = &lp5523_cfg, },
 	{},
 };
 
@@ -989,8 +916,8 @@ static struct i2c_driver lp5523_driver = {
 		.name	= "lp5523x",
 		.of_match_table = of_lp5523_leds_match,
 	},
-	.probe		= lp5523_probe,
-	.remove		= lp5523_remove,
+	.probe		= lp55xx_probe,
+	.remove		= lp55xx_remove,
 	.id_table	= lp5523_id,
 };
 
diff --git a/drivers/leds/leds-lp5562.c b/drivers/leds/leds-lp5562.c
index 123abfc7b6c4..65a6a05c3848 100644
--- a/drivers/leds/leds-lp5562.c
+++ b/drivers/leds/leds-lp5562.c
@@ -508,86 +508,14 @@ static struct lp55xx_device_config lp5562_cfg = {
 	.dev_attr_group     = &lp5562_group,
 };
 
-static int lp5562_probe(struct i2c_client *client)
-{
-	int ret;
-	struct lp55xx_chip *chip;
-	struct lp55xx_led *led;
-	struct lp55xx_platform_data *pdata = dev_get_platdata(&client->dev);
-	struct device_node *np = dev_of_node(&client->dev);
-
-	chip = devm_kzalloc(&client->dev, sizeof(*chip), GFP_KERNEL);
-	if (!chip)
-		return -ENOMEM;
-
-	chip->cfg = &lp5562_cfg;
-
-	if (!pdata) {
-		if (np) {
-			pdata = lp55xx_of_populate_pdata(&client->dev, np,
-							 chip);
-			if (IS_ERR(pdata))
-				return PTR_ERR(pdata);
-		} else {
-			dev_err(&client->dev, "no platform data\n");
-			return -EINVAL;
-		}
-	}
-
-
-	led = devm_kcalloc(&client->dev,
-			pdata->num_channels, sizeof(*led), GFP_KERNEL);
-	if (!led)
-		return -ENOMEM;
-
-	chip->cl = client;
-	chip->pdata = pdata;
-
-	mutex_init(&chip->lock);
-
-	i2c_set_clientdata(client, led);
-
-	ret = lp55xx_init_device(chip);
-	if (ret)
-		goto err_init;
-
-	ret = lp55xx_register_leds(led, chip);
-	if (ret)
-		goto err_out;
-
-	ret = lp55xx_register_sysfs(chip);
-	if (ret) {
-		dev_err(&client->dev, "registering sysfs failed\n");
-		goto err_out;
-	}
-
-	return 0;
-
-err_out:
-	lp55xx_deinit_device(chip);
-err_init:
-	return ret;
-}
-
-static void lp5562_remove(struct i2c_client *client)
-{
-	struct lp55xx_led *led = i2c_get_clientdata(client);
-	struct lp55xx_chip *chip = led->chip;
-
-	lp55xx_stop_all_engine(chip);
-
-	lp55xx_unregister_sysfs(chip);
-	lp55xx_deinit_device(chip);
-}
-
 static const struct i2c_device_id lp5562_id[] = {
-	{ "lp5562" },
+	{ "lp5562", .driver_data = (kernel_ulong_t)&lp5562_cfg, },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, lp5562_id);
 
 static const struct of_device_id of_lp5562_leds_match[] = {
-	{ .compatible = "ti,lp5562", },
+	{ .compatible = "ti,lp5562", .data = &lp5562_cfg, },
 	{},
 };
 
@@ -598,8 +526,8 @@ static struct i2c_driver lp5562_driver = {
 		.name	= "lp5562",
 		.of_match_table = of_lp5562_leds_match,
 	},
-	.probe		= lp5562_probe,
-	.remove		= lp5562_remove,
+	.probe		= lp55xx_probe,
+	.remove		= lp55xx_remove,
 	.id_table	= lp5562_id,
 };
 
diff --git a/drivers/leds/leds-lp55xx-common.c b/drivers/leds/leds-lp55xx-common.c
index 2cbc5b302fd4..2949ea56a170 100644
--- a/drivers/leds/leds-lp55xx-common.c
+++ b/drivers/leds/leds-lp55xx-common.c
@@ -49,7 +49,7 @@ static struct lp55xx_led *mcled_cdev_to_led(struct led_classdev_mc *mc_cdev)
 
 static void lp55xx_wait_opmode_done(struct lp55xx_chip *chip)
 {
-	struct lp55xx_device_config *cfg = chip->cfg;
+	const struct lp55xx_device_config *cfg = chip->cfg;
 	int __always_unused ret;
 	u8 val;
 
@@ -69,7 +69,7 @@ static void lp55xx_wait_opmode_done(struct lp55xx_chip *chip)
 
 void lp55xx_stop_all_engine(struct lp55xx_chip *chip)
 {
-	struct lp55xx_device_config *cfg = chip->cfg;
+	const struct lp55xx_device_config *cfg = chip->cfg;
 
 	lp55xx_write(chip, cfg->reg_op_mode.addr, LP55xx_MODE_DISABLE_ALL_ENG);
 	lp55xx_wait_opmode_done(chip);
@@ -78,7 +78,7 @@ EXPORT_SYMBOL_GPL(lp55xx_stop_all_engine);
 
 static void lp55xx_reset_device(struct lp55xx_chip *chip)
 {
-	struct lp55xx_device_config *cfg = chip->cfg;
+	const struct lp55xx_device_config *cfg = chip->cfg;
 	u8 addr = cfg->reset.addr;
 	u8 val  = cfg->reset.val;
 
@@ -88,7 +88,7 @@ static void lp55xx_reset_device(struct lp55xx_chip *chip)
 
 static int lp55xx_detect_device(struct lp55xx_chip *chip)
 {
-	struct lp55xx_device_config *cfg = chip->cfg;
+	const struct lp55xx_device_config *cfg = chip->cfg;
 	u8 addr = cfg->enable.addr;
 	u8 val  = cfg->enable.val;
 	int ret;
@@ -111,7 +111,7 @@ static int lp55xx_detect_device(struct lp55xx_chip *chip)
 
 static int lp55xx_post_init_device(struct lp55xx_chip *chip)
 {
-	struct lp55xx_device_config *cfg = chip->cfg;
+	const struct lp55xx_device_config *cfg = chip->cfg;
 
 	if (!cfg->post_init_device)
 		return 0;
@@ -176,7 +176,7 @@ static int lp55xx_set_mc_brightness(struct led_classdev *cdev,
 {
 	struct led_classdev_mc *mc_dev = lcdev_to_mccdev(cdev);
 	struct lp55xx_led *led = mcled_cdev_to_led(mc_dev);
-	struct lp55xx_device_config *cfg = led->chip->cfg;
+	const struct lp55xx_device_config *cfg = led->chip->cfg;
 
 	led_mc_calc_color_components(&led->mc_cdev, brightness);
 	return cfg->multicolor_brightness_fn(led);
@@ -187,7 +187,7 @@ static int lp55xx_set_brightness(struct led_classdev *cdev,
 			     enum led_brightness brightness)
 {
 	struct lp55xx_led *led = cdev_to_lp55xx_led(cdev);
-	struct lp55xx_device_config *cfg = led->chip->cfg;
+	const struct lp55xx_device_config *cfg = led->chip->cfg;
 
 	led->brightness = (u8)brightness;
 	return cfg->brightness_fn(led);
@@ -197,7 +197,7 @@ static int lp55xx_init_led(struct lp55xx_led *led,
 			struct lp55xx_chip *chip, int chan)
 {
 	struct lp55xx_platform_data *pdata = chip->pdata;
-	struct lp55xx_device_config *cfg = chip->cfg;
+	const struct lp55xx_device_config *cfg = chip->cfg;
 	struct device *dev = &chip->cl->dev;
 	int max_channel = cfg->max_channel;
 	struct mc_subled *mc_led_info;
@@ -459,10 +459,21 @@ bool lp55xx_is_extclk_used(struct lp55xx_chip *chip)
 }
 EXPORT_SYMBOL_GPL(lp55xx_is_extclk_used);
 
-int lp55xx_init_device(struct lp55xx_chip *chip)
+static void lp55xx_deinit_device(struct lp55xx_chip *chip)
+{
+	struct lp55xx_platform_data *pdata = chip->pdata;
+
+	if (chip->clk)
+		clk_disable_unprepare(chip->clk);
+
+	if (pdata->enable_gpiod)
+		gpiod_set_value(pdata->enable_gpiod, 0);
+}
+
+static int lp55xx_init_device(struct lp55xx_chip *chip)
 {
 	struct lp55xx_platform_data *pdata;
-	struct lp55xx_device_config *cfg;
+	const struct lp55xx_device_config *cfg;
 	struct device *dev = &chip->cl->dev;
 	int ret = 0;
 
@@ -512,24 +523,11 @@ int lp55xx_init_device(struct lp55xx_chip *chip)
 err:
 	return ret;
 }
-EXPORT_SYMBOL_GPL(lp55xx_init_device);
 
-void lp55xx_deinit_device(struct lp55xx_chip *chip)
+static int lp55xx_register_leds(struct lp55xx_led *led, struct lp55xx_chip *chip)
 {
 	struct lp55xx_platform_data *pdata = chip->pdata;
-
-	if (chip->clk)
-		clk_disable_unprepare(chip->clk);
-
-	if (pdata->enable_gpiod)
-		gpiod_set_value(pdata->enable_gpiod, 0);
-}
-EXPORT_SYMBOL_GPL(lp55xx_deinit_device);
-
-int lp55xx_register_leds(struct lp55xx_led *led, struct lp55xx_chip *chip)
-{
-	struct lp55xx_platform_data *pdata = chip->pdata;
-	struct lp55xx_device_config *cfg = chip->cfg;
+	const struct lp55xx_device_config *cfg = chip->cfg;
 	int num_channels = pdata->num_channels;
 	struct lp55xx_led *each;
 	u8 led_current;
@@ -566,12 +564,11 @@ int lp55xx_register_leds(struct lp55xx_led *led, struct lp55xx_chip *chip)
 err_init_led:
 	return ret;
 }
-EXPORT_SYMBOL_GPL(lp55xx_register_leds);
 
-int lp55xx_register_sysfs(struct lp55xx_chip *chip)
+static int lp55xx_register_sysfs(struct lp55xx_chip *chip)
 {
 	struct device *dev = &chip->cl->dev;
-	struct lp55xx_device_config *cfg = chip->cfg;
+	const struct lp55xx_device_config *cfg = chip->cfg;
 	int ret;
 
 	if (!cfg->run_engine || !cfg->firmware_cb)
@@ -585,19 +582,17 @@ int lp55xx_register_sysfs(struct lp55xx_chip *chip)
 	return cfg->dev_attr_group ?
 		sysfs_create_group(&dev->kobj, cfg->dev_attr_group) : 0;
 }
-EXPORT_SYMBOL_GPL(lp55xx_register_sysfs);
 
-void lp55xx_unregister_sysfs(struct lp55xx_chip *chip)
+static void lp55xx_unregister_sysfs(struct lp55xx_chip *chip)
 {
 	struct device *dev = &chip->cl->dev;
-	struct lp55xx_device_config *cfg = chip->cfg;
+	const struct lp55xx_device_config *cfg = chip->cfg;
 
 	if (cfg->dev_attr_group)
 		sysfs_remove_group(&dev->kobj, cfg->dev_attr_group);
 
 	sysfs_remove_group(&dev->kobj, &lp55xx_engine_attr_group);
 }
-EXPORT_SYMBOL_GPL(lp55xx_unregister_sysfs);
 
 static int lp55xx_parse_common_child(struct device_node *np,
 				     struct lp55xx_led_config *cfg,
@@ -690,9 +685,9 @@ static int lp55xx_parse_logical_led(struct device_node *np,
 	return ret;
 }
 
-struct lp55xx_platform_data *lp55xx_of_populate_pdata(struct device *dev,
-						      struct device_node *np,
-						      struct lp55xx_chip *chip)
+static struct lp55xx_platform_data *lp55xx_of_populate_pdata(struct device *dev,
+							     struct device_node *np,
+							     struct lp55xx_chip *chip)
 {
 	struct device_node *child;
 	struct lp55xx_platform_data *pdata;
@@ -749,7 +744,81 @@ struct lp55xx_platform_data *lp55xx_of_populate_pdata(struct device *dev,
 
 	return pdata;
 }
-EXPORT_SYMBOL_GPL(lp55xx_of_populate_pdata);
+
+int lp55xx_probe(struct i2c_client *client)
+{
+	const struct i2c_device_id *id = i2c_client_get_device_id(client);
+	int ret;
+	struct lp55xx_chip *chip;
+	struct lp55xx_led *led;
+	struct lp55xx_platform_data *pdata = dev_get_platdata(&client->dev);
+	struct device_node *np = dev_of_node(&client->dev);
+
+	chip = devm_kzalloc(&client->dev, sizeof(*chip), GFP_KERNEL);
+	if (!chip)
+		return -ENOMEM;
+
+	chip->cfg = i2c_get_match_data(client);
+
+	if (!pdata) {
+		if (np) {
+			pdata = lp55xx_of_populate_pdata(&client->dev, np,
+							 chip);
+			if (IS_ERR(pdata))
+				return PTR_ERR(pdata);
+		} else {
+			dev_err(&client->dev, "no platform data\n");
+			return -EINVAL;
+		}
+	}
+
+	led = devm_kcalloc(&client->dev,
+			   pdata->num_channels, sizeof(*led), GFP_KERNEL);
+	if (!led)
+		return -ENOMEM;
+
+	chip->cl = client;
+	chip->pdata = pdata;
+
+	mutex_init(&chip->lock);
+
+	i2c_set_clientdata(client, led);
+
+	ret = lp55xx_init_device(chip);
+	if (ret)
+		goto err_init;
+
+	dev_info(&client->dev, "%s Programmable led chip found\n", id->name);
+
+	ret = lp55xx_register_leds(led, chip);
+	if (ret)
+		goto err_out;
+
+	ret = lp55xx_register_sysfs(chip);
+	if (ret) {
+		dev_err(&client->dev, "registering sysfs failed\n");
+		goto err_out;
+	}
+
+	return 0;
+
+err_out:
+	lp55xx_deinit_device(chip);
+err_init:
+	return ret;
+}
+EXPORT_SYMBOL_GPL(lp55xx_probe);
+
+void lp55xx_remove(struct i2c_client *client)
+{
+	struct lp55xx_led *led = i2c_get_clientdata(client);
+	struct lp55xx_chip *chip = led->chip;
+
+	lp55xx_stop_all_engine(chip);
+	lp55xx_unregister_sysfs(chip);
+	lp55xx_deinit_device(chip);
+}
+EXPORT_SYMBOL_GPL(lp55xx_remove);
 
 MODULE_AUTHOR("Milo Kim <milo.kim@ti.com>");
 MODULE_DESCRIPTION("LP55xx Common Driver");
diff --git a/drivers/leds/leds-lp55xx-common.h b/drivers/leds/leds-lp55xx-common.h
index c7c8a77ddb1a..26a724acac16 100644
--- a/drivers/leds/leds-lp55xx-common.h
+++ b/drivers/leds/leds-lp55xx-common.h
@@ -164,7 +164,7 @@ struct lp55xx_chip {
 	struct lp55xx_platform_data *pdata;
 	struct mutex lock;	/* lock for user-space interface */
 	int num_leds;
-	struct lp55xx_device_config *cfg;
+	const struct lp55xx_device_config *cfg;
 	enum lp55xx_engine_index engine_idx;
 	struct lp55xx_engine engines[LP55XX_ENGINE_MAX];
 	const struct firmware *fw;
@@ -203,21 +203,8 @@ extern bool lp55xx_is_extclk_used(struct lp55xx_chip *chip);
 /* common chip functions */
 extern void lp55xx_stop_all_engine(struct lp55xx_chip *chip);
 
-/* common device init/deinit functions */
-extern int lp55xx_init_device(struct lp55xx_chip *chip);
-extern void lp55xx_deinit_device(struct lp55xx_chip *chip);
-
-/* common LED class device functions */
-extern int lp55xx_register_leds(struct lp55xx_led *led,
-				struct lp55xx_chip *chip);
-
-/* common device attributes functions */
-extern int lp55xx_register_sysfs(struct lp55xx_chip *chip);
-extern void lp55xx_unregister_sysfs(struct lp55xx_chip *chip);
-
-/* common device tree population function */
-extern struct lp55xx_platform_data
-*lp55xx_of_populate_pdata(struct device *dev, struct device_node *np,
-			  struct lp55xx_chip *chip);
+/* common probe/remove function */
+extern int lp55xx_probe(struct i2c_client *client);
+extern void lp55xx_remove(struct i2c_client *client);
 
 #endif /* _LEDS_LP55XX_COMMON_H */
diff --git a/drivers/leds/leds-lp8501.c b/drivers/leds/leds-lp8501.c
index 9eaad0c2148f..d3c718bb8275 100644
--- a/drivers/leds/leds-lp8501.c
+++ b/drivers/leds/leds-lp8501.c
@@ -305,87 +305,14 @@ static struct lp55xx_device_config lp8501_cfg = {
 	.run_engine         = lp8501_run_engine,
 };
 
-static int lp8501_probe(struct i2c_client *client)
-{
-	const struct i2c_device_id *id = i2c_client_get_device_id(client);
-	int ret;
-	struct lp55xx_chip *chip;
-	struct lp55xx_led *led;
-	struct lp55xx_platform_data *pdata = dev_get_platdata(&client->dev);
-	struct device_node *np = dev_of_node(&client->dev);
-
-	chip = devm_kzalloc(&client->dev, sizeof(*chip), GFP_KERNEL);
-	if (!chip)
-		return -ENOMEM;
-
-	chip->cfg = &lp8501_cfg;
-
-	if (!pdata) {
-		if (np) {
-			pdata = lp55xx_of_populate_pdata(&client->dev, np,
-							 chip);
-			if (IS_ERR(pdata))
-				return PTR_ERR(pdata);
-		} else {
-			dev_err(&client->dev, "no platform data\n");
-			return -EINVAL;
-		}
-	}
-
-	led = devm_kcalloc(&client->dev,
-			pdata->num_channels, sizeof(*led), GFP_KERNEL);
-	if (!led)
-		return -ENOMEM;
-
-	chip->cl = client;
-	chip->pdata = pdata;
-
-	mutex_init(&chip->lock);
-
-	i2c_set_clientdata(client, led);
-
-	ret = lp55xx_init_device(chip);
-	if (ret)
-		goto err_init;
-
-	dev_info(&client->dev, "%s Programmable led chip found\n", id->name);
-
-	ret = lp55xx_register_leds(led, chip);
-	if (ret)
-		goto err_out;
-
-	ret = lp55xx_register_sysfs(chip);
-	if (ret) {
-		dev_err(&client->dev, "registering sysfs failed\n");
-		goto err_out;
-	}
-
-	return 0;
-
-err_out:
-	lp55xx_deinit_device(chip);
-err_init:
-	return ret;
-}
-
-static void lp8501_remove(struct i2c_client *client)
-{
-	struct lp55xx_led *led = i2c_get_clientdata(client);
-	struct lp55xx_chip *chip = led->chip;
-
-	lp55xx_stop_all_engine(chip);
-	lp55xx_unregister_sysfs(chip);
-	lp55xx_deinit_device(chip);
-}
-
 static const struct i2c_device_id lp8501_id[] = {
-	{ "lp8501" },
+	{ "lp8501",  .driver_data = (kernel_ulong_t)&lp8501_cfg, },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, lp8501_id);
 
 static const struct of_device_id of_lp8501_leds_match[] = {
-	{ .compatible = "ti,lp8501", },
+	{ .compatible = "ti,lp8501", .data = &lp8501_cfg, },
 	{},
 };
 
@@ -396,8 +323,8 @@ static struct i2c_driver lp8501_driver = {
 		.name	= "lp8501",
 		.of_match_table = of_lp8501_leds_match,
 	},
-	.probe		= lp8501_probe,
-	.remove		= lp8501_remove,
+	.probe		= lp55xx_probe,
+	.remove		= lp55xx_remove,
 	.id_table	= lp8501_id,
 };
 
-- 
2.45.1


