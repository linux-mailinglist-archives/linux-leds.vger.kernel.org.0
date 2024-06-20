Return-Path: <linux-leds+bounces-2080-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DACAE9114E5
	for <lists+linux-leds@lfdr.de>; Thu, 20 Jun 2024 23:42:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 90DC928205A
	for <lists+linux-leds@lfdr.de>; Thu, 20 Jun 2024 21:42:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B083C149C65;
	Thu, 20 Jun 2024 21:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k/G32jHb"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3622913F439;
	Thu, 20 Jun 2024 21:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718919702; cv=none; b=N/J+oTeb069Z82LoTHE8RgECpeZ2cAhHFzcJdcewQYWoAnUVseRPtNosuhrVoQMwlz/Jek03W/0emsC3Fu0qczvTkMxmzdnBXpvU3LZ1Izc/sPGZ97NY6rHsPDZyYDMVIu8GoNHCanwPPvVwjYptyMlHKXHRh2fmIPlMad23SVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718919702; c=relaxed/simple;
	bh=rXcU8iiU1Iw3qaeUh/u0Y0vxeXXw0aYyFmlBEnJt+vM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AQtkGu0niZzp7tcP/r5dbDV/5w56OuPYB/CYAHIO1TTQ+AOQmsvuG6SnSSHZeJ/TGyVVhhUZKmUnFJGQNoUZCaWSGWOnsFTZcRxiElSE/O4bzAfZXgl4vYbO1tdfRUdwmtM4Fc0V8xAnRcxJQOhEgdNU5c6qpLOki8TsyTw8jM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k/G32jHb; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4218008c613so13101635e9.2;
        Thu, 20 Jun 2024 14:41:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718919698; x=1719524498; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MKRnVk20sBZCF2C/tq3Dlx1M0E6+DdeiFmOrQ03dDyM=;
        b=k/G32jHb94LC0ZyWl9omwHJhRGh6GgulyaHCayJXEUiR/DN6kYGIc8Jdb5+TpQ67eu
         t+Gglm6dGyVVL14+rafqrVIfNZ0xNCMejEl5U/urYcleb5KokcbnW3mqmpJbHbcegn85
         aZKlgNRSZmXcWEt2n0nynUDYEZGSH75zjIOBwwaxE2g1TPaT5wLD/15R3mr9fSU0uVQT
         r5K6WhH3UtYub4xWydA5uTod4kiH7Vqsor91YIQVTcrVchaIccJWxWAR8CT4xZYp6bZP
         Ca6jEMkCnb6R+SNf5QwAS9P27elslRPO2g20y5kGDIonOuOspkWHdXy7R8iACTS5s9BS
         Uxgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718919698; x=1719524498;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MKRnVk20sBZCF2C/tq3Dlx1M0E6+DdeiFmOrQ03dDyM=;
        b=jYlxjjfSGF4WrWCrxVSeSmuWdxpmLEQm9fRuER659Ypl/9sVyoU95iRxerM8J2ujuQ
         LRqtmh4WxggQPAVtbdLYlmt2LLZqb/NGAhhL+pPtTUI27lB92qA4Qkq/4EvhvI9rQrFE
         r8AZ1NWAMX462cEzoWRfsEDnDBiS7Kr47KMG9UvfS6Tb/w9nYs5Cq0DLU5XaxSoHT6n3
         pN0udzvT2HLF86yQYNKCzKRYhckWAH5mE26wY/yYY+x7amH20mLjWKjAA7il0PkdpOhs
         9srR25fj25477KykvRramHnUmJHrUGBY1FjLRhEnRNebv2rapV0oCiR23f4BbV1ipCUF
         BG5g==
X-Forwarded-Encrypted: i=1; AJvYcCUl2d+AayuqBxeDXEWpH85Wh5mpj+GM9gFtTIzUu/HzhWA8Lmvrd3efieiRU4VD/fZxzQahgvZjdrTkKu7zL8UiW7MRS8DPCiVzukhwOvI8zfjhz7s2Gwqe76zAG/xXDzYDJmjeKCbVnTL15J+qGQVMGHIaqM5RYUbwsQm78WBzKqWQOpg=
X-Gm-Message-State: AOJu0Yz6PwKgbuhyJueUa7CtYQfq8gHOHuj1AXyO+L08OQGRI08Ynlkm
	phoPnHXlGg7dMiNJNlRoAjyswFDpGLUPHZMd1TEy0KrmyPBjwk/r
X-Google-Smtp-Source: AGHT+IGRDCu7BN49rTEA/ox+gphmnVYnzy+qnc0tesEguaD0LeYAnACtrGK3tCuncwrmjA98dGQzBg==
X-Received: by 2002:a05:600c:9a3:b0:424:7d6a:dd2e with SMTP id 5b1f17b1804b1-4247d6add73mr23834635e9.19.1718919698367;
        Thu, 20 Jun 2024 14:41:38 -0700 (PDT)
Received: from localhost.localdomain (93-34-90-105.ip49.fastwebnet.it. [93.34.90.105])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-366383f68acsm48866f8f.2.2024.06.20.14.41.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 14:41:37 -0700 (PDT)
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
Subject: [PATCH v7 04/20] leds: leds-lp55xx: Generalize probe/remove functions
Date: Thu, 20 Jun 2024 23:03:20 +0200
Message-ID: <20240620210401.22053-5-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240620210401.22053-1-ansuelsmth@gmail.com>
References: <20240620210401.22053-1-ansuelsmth@gmail.com>
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
2.45.1


