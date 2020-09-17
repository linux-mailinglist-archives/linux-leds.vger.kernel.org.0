Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E1EF26E8C2
	for <lists+linux-leds@lfdr.de>; Fri, 18 Sep 2020 00:36:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726245AbgIQWfo (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 17 Sep 2020 18:35:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726281AbgIQWeL (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 17 Sep 2020 18:34:11 -0400
Received: from mail.nic.cz (lists.nic.cz [IPv6:2001:1488:800:400::400])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C74DC06178C;
        Thu, 17 Sep 2020 15:33:58 -0700 (PDT)
Received: from dellmb.labs.office.nic.cz (unknown [IPv6:2001:1488:fffe:6:cac7:3539:7f1f:463])
        by mail.nic.cz (Postfix) with ESMTP id E52CD140AAC;
        Fri, 18 Sep 2020 00:33:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
        t=1600382036; bh=YzzeSB18clOx4S4ahtsBM9chfe84NAJQ9GOou5snf+Q=;
        h=From:To:Date;
        b=AUEnbwjzNRllvFEe2HQknPjZZ0YJPH/+wd/t/21sbK6bp+Api8BfQhH2BI53UzAz/
         EXdWbHyQsl4IYKzNwqcGGzUx32oklzAV522CQoMmhGmuBe7YeWn/v65YPCU4M2dK81
         h++3XWOMlnbLh/sRgcm8hQmvcH6gzTShDE5MtRVk=
From:   =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>
To:     linux-leds@vger.kernel.org
Cc:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        =?UTF-8?q?Ond=C5=99ej=20Jirman?= <megous@megous.com>,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org,
        =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>
Subject: [PATCH leds v2 15/50] leds: lm3697: cosmetic change: use helper variable, reverse christmas tree
Date:   Fri, 18 Sep 2020 00:33:03 +0200
Message-Id: <20200917223338.14164-16-marek.behun@nic.cz>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200917223338.14164-1-marek.behun@nic.cz>
References: <20200917223338.14164-1-marek.behun@nic.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.nic.cz
X-Spam-Status: No, score=0.00
X-Spamd-Bar: /
X-Virus-Scanned: clamav-milter 0.102.2 at mail
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Use helper variable dev instead of always writing &client->dev, or
&priv->client->dev, or even &led->priv->client->dev.

With one more line moved reverse christmas tree is also achieved.

Signed-off-by: Marek Behún <marek.behun@nic.cz>
Cc: Dan Murphy <dmurphy@ti.com>
---
 drivers/leds/leds-lm3697.c | 75 ++++++++++++++++++--------------------
 1 file changed, 36 insertions(+), 39 deletions(-)

diff --git a/drivers/leds/leds-lm3697.c b/drivers/leds/leds-lm3697.c
index 479776ac36c35..0c5c29730c407 100644
--- a/drivers/leds/leds-lm3697.c
+++ b/drivers/leds/leds-lm3697.c
@@ -115,6 +115,7 @@ static int lm3697_brightness_set(struct led_classdev *led_cdev,
 	struct lm3697_led *led = container_of(led_cdev, struct lm3697_led,
 					      led_dev);
 	int ctrl_en_val = (1 << led->control_bank);
+	struct device *dev = led->priv->dev;
 	int ret;
 
 	mutex_lock(&led->priv->lock);
@@ -123,7 +124,7 @@ static int lm3697_brightness_set(struct led_classdev *led_cdev,
 		ret = regmap_update_bits(led->priv->regmap, LM3697_CTRL_ENABLE,
 					 ctrl_en_val, ~ctrl_en_val);
 		if (ret) {
-			dev_err(&led->priv->client->dev, "Cannot write ctrl register\n");
+			dev_err(dev, "Cannot write ctrl register\n");
 			goto brightness_out;
 		}
 
@@ -131,8 +132,7 @@ static int lm3697_brightness_set(struct led_classdev *led_cdev,
 	} else {
 		ret = ti_lmu_common_set_brightness(&led->lmu_data, brt_val);
 		if (ret) {
-			dev_err(&led->priv->client->dev,
-				"Cannot write brightness\n");
+			dev_err(dev, "Cannot write brightness\n");
 			goto brightness_out;
 		}
 
@@ -141,8 +141,7 @@ static int lm3697_brightness_set(struct led_classdev *led_cdev,
 						 LM3697_CTRL_ENABLE,
 						 ctrl_en_val, ctrl_en_val);
 			if (ret) {
-				dev_err(&led->priv->client->dev,
-					"Cannot enable the device\n");
+				dev_err(dev, "Cannot enable the device\n");
 				goto brightness_out;
 			}
 
@@ -157,6 +156,7 @@ static int lm3697_brightness_set(struct led_classdev *led_cdev,
 
 static int lm3697_init(struct lm3697 *priv)
 {
+	struct device *dev = priv->dev;
 	struct lm3697_led *led;
 	int i, ret;
 
@@ -165,26 +165,26 @@ static int lm3697_init(struct lm3697 *priv)
 	} else {
 		ret = regmap_write(priv->regmap, LM3697_RESET, LM3697_SW_RESET);
 		if (ret) {
-			dev_err(&priv->client->dev, "Cannot reset the device\n");
+			dev_err(dev, "Cannot reset the device\n");
 			goto out;
 		}
 	}
 
 	ret = regmap_write(priv->regmap, LM3697_CTRL_ENABLE, 0x0);
 	if (ret) {
-		dev_err(&priv->client->dev, "Cannot write ctrl enable\n");
+		dev_err(dev, "Cannot write ctrl enable\n");
 		goto out;
 	}
 
 	ret = regmap_write(priv->regmap, LM3697_OUTPUT_CONFIG, priv->bank_cfg);
 	if (ret)
-		dev_err(&priv->client->dev, "Cannot write OUTPUT config\n");
+		dev_err(dev, "Cannot write OUTPUT config\n");
 
 	for (i = 0; i < LM3697_MAX_CONTROL_BANKS; i++) {
 		led = &priv->leds[i];
 		ret = ti_lmu_common_set_ramp(&led->lmu_data);
 		if (ret)
-			dev_err(&priv->client->dev, "Setting the ramp rate failed\n");
+			dev_err(dev, "Setting the ramp rate failed\n");
 	}
 out:
 	return ret;
@@ -193,37 +193,37 @@ static int lm3697_init(struct lm3697 *priv)
 static int lm3697_probe_dt(struct lm3697 *priv)
 {
 	struct fwnode_handle *child = NULL;
+	struct device *dev = priv->dev;
 	struct lm3697_led *led;
+	int ret = -EINVAL;
 	int control_bank;
 	size_t i = 0;
-	int ret = -EINVAL;
 	int j;
 
-	priv->enable_gpio = devm_gpiod_get_optional(&priv->client->dev,
-						   "enable", GPIOD_OUT_LOW);
+	priv->enable_gpio = devm_gpiod_get_optional(dev, "enable",
+						    GPIOD_OUT_LOW);
 	if (IS_ERR(priv->enable_gpio)) {
 		ret = PTR_ERR(priv->enable_gpio);
-		dev_err(&priv->client->dev, "Failed to get enable gpio: %d\n",
-			ret);
+		dev_err(dev, "Failed to get enable gpio: %d\n", ret);
 		return ret;
 	}
 
-	priv->regulator = devm_regulator_get(&priv->client->dev, "vled");
+	priv->regulator = devm_regulator_get(dev, "vled");
 	if (IS_ERR(priv->regulator))
 		priv->regulator = NULL;
 
-	device_for_each_child_node(priv->dev, child) {
+	device_for_each_child_node(dev, child) {
 		struct led_init_data init_data = {};
 
 		ret = fwnode_property_read_u32(child, "reg", &control_bank);
 		if (ret) {
-			dev_err(&priv->client->dev, "reg property missing\n");
+			dev_err(dev, "reg property missing\n");
 			fwnode_handle_put(child);
 			goto child_out;
 		}
 
 		if (control_bank > LM3697_CONTROL_B) {
-			dev_err(&priv->client->dev, "reg property is invalid\n");
+			dev_err(dev, "reg property is invalid\n");
 			ret = -EINVAL;
 			fwnode_handle_put(child);
 			goto child_out;
@@ -231,10 +231,10 @@ static int lm3697_probe_dt(struct lm3697 *priv)
 
 		led = &priv->leds[i];
 
-		ret = ti_lmu_common_get_brt_res(&priv->client->dev,
-						child, &led->lmu_data);
+		ret = ti_lmu_common_get_brt_res(dev, child, &led->lmu_data);
 		if (ret)
-			dev_warn(&priv->client->dev, "brightness resolution property missing\n");
+			dev_warn(dev,
+				 "brightness resolution property missing\n");
 
 		led->control_bank = control_bank;
 		led->lmu_data.regmap = priv->regmap;
@@ -247,7 +247,7 @@ static int lm3697_probe_dt(struct lm3697 *priv)
 
 		led->num_leds = fwnode_property_count_u32(child, "led-sources");
 		if (led->num_leds > LM3697_MAX_LED_STRINGS) {
-			dev_err(&priv->client->dev, "Too many LED strings defined\n");
+			dev_err(dev, "Too many LED strings defined\n");
 			continue;
 		}
 
@@ -255,7 +255,7 @@ static int lm3697_probe_dt(struct lm3697 *priv)
 						    led->hvled_strings,
 						    led->num_leds);
 		if (ret) {
-			dev_err(&priv->client->dev, "led-sources property missing\n");
+			dev_err(dev, "led-sources property missing\n");
 			fwnode_handle_put(child);
 			goto child_out;
 		}
@@ -264,10 +264,9 @@ static int lm3697_probe_dt(struct lm3697 *priv)
 			priv->bank_cfg |=
 				(led->control_bank << led->hvled_strings[j]);
 
-		ret = ti_lmu_common_get_ramp_params(&priv->client->dev,
-						    child, &led->lmu_data);
+		ret = ti_lmu_common_get_ramp_params(dev, child, &led->lmu_data);
 		if (ret)
-			dev_warn(&priv->client->dev, "runtime-ramp properties missing\n");
+			dev_warn(dev, "runtime-ramp properties missing\n");
 
 		fwnode_property_read_string(child, "linux,default-trigger",
 					    &led->led_dev.default_trigger);
@@ -281,11 +280,10 @@ static int lm3697_probe_dt(struct lm3697 *priv)
 		led->led_dev.max_brightness = led->lmu_data.max_brightness;
 		led->led_dev.brightness_set_blocking = lm3697_brightness_set;
 
-		ret = devm_led_classdev_register_ext(priv->dev, &led->led_dev,
+		ret = devm_led_classdev_register_ext(dev, &led->led_dev,
 						     &init_data);
 		if (ret) {
-			dev_err(&priv->client->dev, "led register err: %d\n",
-				ret);
+			dev_err(dev, "led register err: %d\n", ret);
 			fwnode_handle_put(child);
 			goto child_out;
 		}
@@ -300,18 +298,18 @@ static int lm3697_probe_dt(struct lm3697 *priv)
 static int lm3697_probe(struct i2c_client *client,
 			const struct i2c_device_id *id)
 {
+	struct device *dev = &client->dev;
 	struct lm3697 *led;
 	int count;
 	int ret;
 
-	count = device_get_child_node_count(&client->dev);
+	count = device_get_child_node_count(dev);
 	if (!count) {
-		dev_err(&client->dev, "LEDs are not defined in device tree!");
+		dev_err(dev, "LEDs are not defined in device tree!");
 		return -ENODEV;
 	}
 
-	led = devm_kzalloc(&client->dev, struct_size(led, leds, count),
-			   GFP_KERNEL);
+	led = devm_kzalloc(dev, struct_size(led, leds, count), GFP_KERNEL);
 	if (!led)
 		return -ENOMEM;
 
@@ -319,12 +317,11 @@ static int lm3697_probe(struct i2c_client *client,
 	i2c_set_clientdata(client, led);
 
 	led->client = client;
-	led->dev = &client->dev;
+	led->dev = dev;
 	led->regmap = devm_regmap_init_i2c(client, &lm3697_regmap_config);
 	if (IS_ERR(led->regmap)) {
 		ret = PTR_ERR(led->regmap);
-		dev_err(&client->dev, "Failed to allocate register map: %d\n",
-			ret);
+		dev_err(dev, "Failed to allocate register map: %d\n", ret);
 		return ret;
 	}
 
@@ -338,12 +335,13 @@ static int lm3697_probe(struct i2c_client *client,
 static int lm3697_remove(struct i2c_client *client)
 {
 	struct lm3697 *led = i2c_get_clientdata(client);
+	struct device *dev = &led->client->dev;
 	int ret;
 
 	ret = regmap_update_bits(led->regmap, LM3697_CTRL_ENABLE,
 				 LM3697_CTRL_A_B_EN, 0);
 	if (ret) {
-		dev_err(&led->client->dev, "Failed to disable the device\n");
+		dev_err(dev, "Failed to disable the device\n");
 		return ret;
 	}
 
@@ -353,8 +351,7 @@ static int lm3697_remove(struct i2c_client *client)
 	if (led->regulator) {
 		ret = regulator_disable(led->regulator);
 		if (ret)
-			dev_err(&led->client->dev,
-				"Failed to disable regulator\n");
+			dev_err(dev, "Failed to disable regulator\n");
 	}
 
 	mutex_destroy(&led->lock);
-- 
2.26.2

