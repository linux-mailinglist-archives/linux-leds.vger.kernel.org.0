Return-Path: <linux-leds+bounces-1934-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A7A9909A63
	for <lists+linux-leds@lfdr.de>; Sun, 16 Jun 2024 01:13:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C1BA828270F
	for <lists+linux-leds@lfdr.de>; Sat, 15 Jun 2024 23:13:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C60373476;
	Sat, 15 Jun 2024 23:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IsfhcU08"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF1136FE07;
	Sat, 15 Jun 2024 23:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718493178; cv=none; b=DdE4CI1qdVzRHq741TU3LJuU4pje2jRLrfxHVrUi8gdCGssormBXdnKq0AMggclDaNHpflfk8DUT0tCtTM0wbDBY4AXOGO+7OKETeVvwy9XDwniaO5CboBsBNTlmZ9FEAdvzOU536dEjaiAEd2nTBu+/CQyOezi58ruTLk8AD8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718493178; c=relaxed/simple;
	bh=4iKREXqtG+bHi3JhzKVgQHf9qkMSJAXfYE9OEqhFzkQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qyYRrxv/mleqowORC/n6tIBJ1tF95CAW+2xn20441vvfJ4TzeFl3kx2PkReH4Z64u2fJNJAsPd9hRTiMx+EC/2R6D2vOpemc4C4mjONFaPa8VTQjJA4Z2j54SZE4wE9p1KniZFK7pZykKMf9J4Vhys1m3JVdBYlO6VBj4X4lSUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IsfhcU08; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-35f236a563cso2693871f8f.2;
        Sat, 15 Jun 2024 16:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718493174; x=1719097974; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RA4Nk0ePc9s+tFGRFpwDtzewJ/kSziGoBVfzNx9x38o=;
        b=IsfhcU08uFyrlbt9NdZaL1rPJ5p8DJAAfFI5emj+rJoBG5/cI2FZRSCNVagj5SW6Cy
         vvbRHgFVvmrweeA9iVlUzaWgAeKpTU2AOlqRd74nl4EuVpSFEkWd2O8za2dxtpo9zzDx
         XT1YPvBlurO2Hjv7Wbl7U1GNs5ghoVxtegzA45/icB+U0th4SKTDt8VU+TpY1WPe29So
         gXE/DMMZLAXJczJpr7DwFExQID1SaDlKxNDdxeOF/wjdi0QZ/uw6fdiNi6ds1cMX31zG
         AmMTvvLxeL44GvKnZ1q71rfU3izPct3jC+O/htuDMs9wks1bvh1n71muyngVRMoNZIei
         c2ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718493174; x=1719097974;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RA4Nk0ePc9s+tFGRFpwDtzewJ/kSziGoBVfzNx9x38o=;
        b=UHlJ+6BR2WmpzFZnBmKRVd69SIQ9ytOox+QoH7qjQMNwMiCobaPTT5/Nahr1PZZBRF
         F+aV7zzE8mJyUkRFY5CGoRfQ5wOHx+EtxptD+zW8VUje3ehMzbesF7XH85ccy/yzBPQW
         0poyF2Io+Qw1Fdik4fOqN9/81+3Rire3OyTK7o+ObHcKhm9xCj33RxA8XnGbpTpXPA+O
         NCZKExJRBZyhr8/1qmcGO0dsC6DqT/4Y7hiWzcaBYtFMB7PP9BHJe6mzsHB039gxakVY
         pQC9eenu0zJ/rdYthQ10PjKVHOvYBRS6cHzcjdMir5cvE5sJrp13pkXzsAIbfvY9Njtf
         U5hA==
X-Forwarded-Encrypted: i=1; AJvYcCX0RETlhSha+3nnok/xA0Z0AzS26BbhihT5eqprUzQd6bo6q3cSU/Cq+I3NMTFGy7BfAlW0SIRR54XPFTldMGovjvohA+EWyb5QDHBx5A3EWX6E6jand+SMvPQTiu4uarsEgFN7Fl2Wtsc7G2zkzcdzVZ9M5qoc9f9rqAU9QrChEWVHbds=
X-Gm-Message-State: AOJu0YzEFENkZMQ9HfhbV5mD0HG437nTKjXhOVwz4/7R9tp83cg2A48u
	h61GUV9xn0dry5WGF88id8gg/nThNpiGdKDExnE/MDIxgHiErAtS
X-Google-Smtp-Source: AGHT+IHNd91+H2Ebn/bBdrVIZeXAJM2vQ1A63Sur6LAO8fJ2YFBbJ+hE85P1jW7CSW1UPs9Oc59URg==
X-Received: by 2002:a5d:51c8:0:b0:35f:a0c:7cf2 with SMTP id ffacd0b85a97d-3607a77fa42mr4250435f8f.51.1718493173826;
        Sat, 15 Jun 2024 16:12:53 -0700 (PDT)
Received: from localhost.localdomain (93-34-90-105.ip49.fastwebnet.it. [93.34.90.105])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3607509355dsm8145532f8f.13.2024.06.15.16.12.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Jun 2024 16:12:53 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jacek Anaszewski <jacek.anaszewski@gmail.com>,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH v5 04/20] leds: leds-lp55xx: generalize probe/remove functions
Date: Sun, 16 Jun 2024 01:11:34 +0200
Message-ID: <20240615231152.28201-5-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240615231152.28201-1-ansuelsmth@gmail.com>
References: <20240615231152.28201-1-ansuelsmth@gmail.com>
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

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/leds/leds-lp5521.c        |  81 +-------------------
 drivers/leds/leds-lp5523.c        |  85 ++-------------------
 drivers/leds/leds-lp5562.c        |  80 +------------------
 drivers/leds/leds-lp55xx-common.c | 123 +++++++++++++++++++++++-------
 drivers/leds/leds-lp55xx-common.h |  21 +----
 drivers/leds/leds-lp8501.c        |  81 +-------------------
 6 files changed, 119 insertions(+), 352 deletions(-)

diff --git a/drivers/leds/leds-lp5521.c b/drivers/leds/leds-lp5521.c
index 15ef5ae58623..5015f385cc17 100644
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
-	{ "lp5521", 0 }, /* Three channel chip */
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
index 28469bd2c75b..65a6a05c3848 100644
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
-	{ "lp5562", 0 },
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
index 7d8fe67a38c7..a2ea449a1d5e 100644
--- a/drivers/leds/leds-lp55xx-common.c
+++ b/drivers/leds/leds-lp55xx-common.c
@@ -32,6 +32,8 @@
 /* External clock rate */
 #define LP55XX_CLK_32K			32768
 
+static void lp55xx_deinit_device(struct lp55xx_chip *chip);
+
 static struct lp55xx_led *cdev_to_lp55xx_led(struct led_classdev *cdev)
 {
 	return container_of(cdev, struct lp55xx_led, cdev);
@@ -49,7 +51,7 @@ static struct lp55xx_led *mcled_cdev_to_led(struct led_classdev_mc *mc_cdev)
 
 static void lp55xx_wait_opmode_done(struct lp55xx_chip *chip)
 {
-	struct lp55xx_device_config *cfg = chip->cfg;
+	const struct lp55xx_device_config *cfg = chip->cfg;
 	int ret;
 	u8 val;
 
@@ -68,7 +70,7 @@ static void lp55xx_wait_opmode_done(struct lp55xx_chip *chip)
 
 void lp55xx_stop_all_engine(struct lp55xx_chip *chip)
 {
-	struct lp55xx_device_config *cfg = chip->cfg;
+	const struct lp55xx_device_config *cfg = chip->cfg;
 
 	lp55xx_write(chip, cfg->reg_op_mode.addr, LP55xx_MODE_DISABLE_ALL_ENG);
 	lp55xx_wait_opmode_done(chip);
@@ -77,7 +79,7 @@ EXPORT_SYMBOL_GPL(lp55xx_stop_all_engine);
 
 static void lp55xx_reset_device(struct lp55xx_chip *chip)
 {
-	struct lp55xx_device_config *cfg = chip->cfg;
+	const struct lp55xx_device_config *cfg = chip->cfg;
 	u8 addr = cfg->reset.addr;
 	u8 val  = cfg->reset.val;
 
@@ -87,7 +89,7 @@ static void lp55xx_reset_device(struct lp55xx_chip *chip)
 
 static int lp55xx_detect_device(struct lp55xx_chip *chip)
 {
-	struct lp55xx_device_config *cfg = chip->cfg;
+	const struct lp55xx_device_config *cfg = chip->cfg;
 	u8 addr = cfg->enable.addr;
 	u8 val  = cfg->enable.val;
 	int ret;
@@ -110,7 +112,7 @@ static int lp55xx_detect_device(struct lp55xx_chip *chip)
 
 static int lp55xx_post_init_device(struct lp55xx_chip *chip)
 {
-	struct lp55xx_device_config *cfg = chip->cfg;
+	const struct lp55xx_device_config *cfg = chip->cfg;
 
 	if (!cfg->post_init_device)
 		return 0;
@@ -175,7 +177,7 @@ static int lp55xx_set_mc_brightness(struct led_classdev *cdev,
 {
 	struct led_classdev_mc *mc_dev = lcdev_to_mccdev(cdev);
 	struct lp55xx_led *led = mcled_cdev_to_led(mc_dev);
-	struct lp55xx_device_config *cfg = led->chip->cfg;
+	const struct lp55xx_device_config *cfg = led->chip->cfg;
 
 	led_mc_calc_color_components(&led->mc_cdev, brightness);
 	return cfg->multicolor_brightness_fn(led);
@@ -186,7 +188,7 @@ static int lp55xx_set_brightness(struct led_classdev *cdev,
 			     enum led_brightness brightness)
 {
 	struct lp55xx_led *led = cdev_to_lp55xx_led(cdev);
-	struct lp55xx_device_config *cfg = led->chip->cfg;
+	const struct lp55xx_device_config *cfg = led->chip->cfg;
 
 	led->brightness = (u8)brightness;
 	return cfg->brightness_fn(led);
@@ -196,7 +198,7 @@ static int lp55xx_init_led(struct lp55xx_led *led,
 			struct lp55xx_chip *chip, int chan)
 {
 	struct lp55xx_platform_data *pdata = chip->pdata;
-	struct lp55xx_device_config *cfg = chip->cfg;
+	const struct lp55xx_device_config *cfg = chip->cfg;
 	struct device *dev = &chip->cl->dev;
 	int max_channel = cfg->max_channel;
 	struct mc_subled *mc_led_info;
@@ -458,10 +460,10 @@ bool lp55xx_is_extclk_used(struct lp55xx_chip *chip)
 }
 EXPORT_SYMBOL_GPL(lp55xx_is_extclk_used);
 
-int lp55xx_init_device(struct lp55xx_chip *chip)
+static int lp55xx_init_device(struct lp55xx_chip *chip)
 {
 	struct lp55xx_platform_data *pdata;
-	struct lp55xx_device_config *cfg;
+	const struct lp55xx_device_config *cfg;
 	struct device *dev = &chip->cl->dev;
 	int ret = 0;
 
@@ -511,9 +513,8 @@ int lp55xx_init_device(struct lp55xx_chip *chip)
 err:
 	return ret;
 }
-EXPORT_SYMBOL_GPL(lp55xx_init_device);
 
-void lp55xx_deinit_device(struct lp55xx_chip *chip)
+static void lp55xx_deinit_device(struct lp55xx_chip *chip)
 {
 	struct lp55xx_platform_data *pdata = chip->pdata;
 
@@ -523,12 +524,11 @@ void lp55xx_deinit_device(struct lp55xx_chip *chip)
 	if (pdata->enable_gpiod)
 		gpiod_set_value(pdata->enable_gpiod, 0);
 }
-EXPORT_SYMBOL_GPL(lp55xx_deinit_device);
 
-int lp55xx_register_leds(struct lp55xx_led *led, struct lp55xx_chip *chip)
+static int lp55xx_register_leds(struct lp55xx_led *led, struct lp55xx_chip *chip)
 {
 	struct lp55xx_platform_data *pdata = chip->pdata;
-	struct lp55xx_device_config *cfg = chip->cfg;
+	const struct lp55xx_device_config *cfg = chip->cfg;
 	int num_channels = pdata->num_channels;
 	struct lp55xx_led *each;
 	u8 led_current;
@@ -565,12 +565,11 @@ int lp55xx_register_leds(struct lp55xx_led *led, struct lp55xx_chip *chip)
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
@@ -584,19 +583,17 @@ int lp55xx_register_sysfs(struct lp55xx_chip *chip)
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
@@ -689,9 +686,9 @@ static int lp55xx_parse_logical_led(struct device_node *np,
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
@@ -748,7 +745,81 @@ struct lp55xx_platform_data *lp55xx_of_populate_pdata(struct device *dev,
 
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
index 57e184dda490..d3c718bb8275 100644
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
-	{ "lp8501",  0 },
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
2.43.0


