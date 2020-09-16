Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 98E6526CF68
	for <lists+linux-leds@lfdr.de>; Thu, 17 Sep 2020 01:17:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727028AbgIPXRA (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 16 Sep 2020 19:17:00 -0400
Received: from lists.nic.cz ([217.31.204.67]:53874 "EHLO mail.nic.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726764AbgIPXQ7 (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Wed, 16 Sep 2020 19:16:59 -0400
Received: from dellmb.labs.office.nic.cz (unknown [IPv6:2001:1488:fffe:6:cac7:3539:7f1f:463])
        by mail.nic.cz (Postfix) with ESMTP id 8382C140A46;
        Thu, 17 Sep 2020 01:16:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
        t=1600298213; bh=gFpKulJnh3+bCyFKyHCzqOwtUL//wPu/7KvlFipY1/c=;
        h=From:To:Date;
        b=WjhooCPMMiC/MPugWqvrtwMJccw7M+/Zj+8eywOkhBvZeP/XljB8ClzArsxR2pMqX
         /PSj6/kLrbhVAmMZ5RgAVp4X07IZ3lH20i3c0tZlzcSE5lM7fYpswQK29i4ZqZdnL2
         pzCX6BZh38P9z60vFDS8edO76RVufoFBnbgb/9m4=
From:   =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>
To:     linux-leds@vger.kernel.org
Cc:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        =?UTF-8?q?Ond=C5=99ej=20Jirman?= <megous@megous.com>,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org,
        =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>,
        "H . Nikolaus Schaller" <hns@goldelico.com>
Subject: [PATCH leds v1 08/10] leds: is31fl319x: use struct led_init_data when registering
Date:   Thu, 17 Sep 2020 01:16:48 +0200
Message-Id: <20200916231650.11484-9-marek.behun@nic.cz>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200916231650.11484-1-marek.behun@nic.cz>
References: <20200916231650.11484-1-marek.behun@nic.cz>
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

By using struct led_init_data when registering we do not need to parse
`label` DT property nor `linux,default-trigger` property.

This driver needed bigger refactor because it first parsed DT for all
LEDs and only after that started registering them.

Signed-off-by: Marek Behún <marek.behun@nic.cz>
Cc: H. Nikolaus Schaller <hns@goldelico.com>
---
 drivers/leds/leds-is31fl319x.c | 204 ++++++++++++++-------------------
 1 file changed, 89 insertions(+), 115 deletions(-)

diff --git a/drivers/leds/leds-is31fl319x.c b/drivers/leds/leds-is31fl319x.c
index 54ac50740d43d..3995f41687e16 100644
--- a/drivers/leds/leds-is31fl319x.c
+++ b/drivers/leds/leds-is31fl319x.c
@@ -63,7 +63,6 @@
 struct is31fl319x_chip {
 	const struct is31fl319x_chipdef *cdef;
 	struct i2c_client               *client;
-	struct gpio_desc		*shutdown_gpio;
 	struct regmap                   *regmap;
 	struct mutex                    lock;
 	u32                             audio_gain_db;
@@ -71,7 +70,6 @@ struct is31fl319x_chip {
 	struct is31fl319x_led {
 		struct is31fl319x_chip  *chip;
 		struct led_classdev     cdev;
-		u32                     max_microamp;
 		bool                    configured;
 	} leds[IS31FL319X_MAX_LEDS];
 };
@@ -171,117 +169,100 @@ static int is31fl319x_brightness_set(struct led_classdev *cdev,
 	return ret;
 }
 
-static int is31fl319x_parse_child_dt(const struct device *dev,
-				     const struct device_node *child,
-				     struct is31fl319x_led *led)
+static int is31fl319x_parse_max_current(struct device *dev, u32 *aggregated)
 {
-	struct led_classdev *cdev = &led->cdev;
+	struct device_node *np;
+	u32 max_microamp;
 	int ret;
 
-	if (of_property_read_string(child, "label", &cdev->name))
-		cdev->name = child->name;
-
-	ret = of_property_read_string(child, "linux,default-trigger",
-				      &cdev->default_trigger);
-	if (ret < 0 && ret != -EINVAL) /* is optional */
-		return ret;
+	*aggregated = IS31FL319X_CURRENT_MAX;
+
+	for_each_child_of_node(dev_of_node(dev), np) {
+		max_microamp = IS31FL319X_CURRENT_DEFAULT;
+		ret = of_property_read_u32(np, "led-max-microamp",
+					   &max_microamp);
+		if (!ret)
+			max_microamp = min(max_microamp,
+					   IS31FL319X_CURRENT_MAX);
+
+		if (max_microamp < IS31FL319X_CURRENT_MIN) {
+			dev_err(dev,
+				"Node %pOF led-max-microamp below supported value\n",
+				np);
+			of_node_put(np);
+			return -EINVAL;
+		}
 
-	led->max_microamp = IS31FL319X_CURRENT_DEFAULT;
-	ret = of_property_read_u32(child, "led-max-microamp",
-				   &led->max_microamp);
-	if (!ret) {
-		if (led->max_microamp < IS31FL319X_CURRENT_MIN)
-			return -EINVAL;	/* not supported */
-		led->max_microamp = min(led->max_microamp,
-					  IS31FL319X_CURRENT_MAX);
+		if (max_microamp < *aggregated)
+			*aggregated = max_microamp;
 	}
 
 	return 0;
 }
 
-static int is31fl319x_parse_dt(struct device *dev,
-			       struct is31fl319x_chip *is31)
+static int is31fl319x_led_register(struct device *dev,
+				   struct is31fl319x_chip *is31,
+				   struct device_node *np)
 {
-	struct device_node *np = dev->of_node, *child;
-	const struct of_device_id *of_dev_id;
-	int count;
+	struct led_init_data init_data = {};
+	struct is31fl319x_led *led;
+	u32 reg;
 	int ret;
 
-	if (!np)
-		return -ENODEV;
-
-	is31->shutdown_gpio = devm_gpiod_get_optional(dev,
-						"shutdown",
-						GPIOD_OUT_HIGH);
-	if (IS_ERR(is31->shutdown_gpio)) {
-		ret = PTR_ERR(is31->shutdown_gpio);
-		dev_err(dev, "Failed to get shutdown gpio: %d\n", ret);
+	ret = of_property_read_u32(np, "reg", &reg);
+	if (ret) {
+		dev_err(dev, "Cannot read reg property of %pOF\n", np);
 		return ret;
 	}
 
-	of_dev_id = of_match_device(of_is31fl319x_match, dev);
-	if (!of_dev_id) {
-		dev_err(dev, "Failed to match device with supported chips\n");
+	if (reg < 1 || reg > is31->cdef->num_leds) {
+		dev_err(dev, "Node %pOF has invalid reg property\n", np);
 		return -EINVAL;
 	}
 
-	is31->cdef = of_dev_id->data;
-
-	count = of_get_child_count(np);
+	led = &is31->leds[reg - 1];
 
-	dev_dbg(dev, "probe %s with %d leds defined in DT\n",
-		of_dev_id->compatible, count);
-
-	if (!count || count > is31->cdef->num_leds) {
-		dev_err(dev, "Number of leds defined must be between 1 and %u\n",
-			is31->cdef->num_leds);
-		return -ENODEV;
+	if (led->configured) {
+		dev_err(dev, "Node %pOF reg property already used\n", np);
+		return -EEXIST;
 	}
 
-	for_each_child_of_node(np, child) {
-		struct is31fl319x_led *led;
-		u32 reg;
+	led->configured = true;
+	led->chip = is31;
+	led->cdev.brightness_set_blocking = is31fl319x_brightness_set;
+	init_data.fwnode = of_fwnode_handle(np);
 
-		ret = of_property_read_u32(child, "reg", &reg);
-		if (ret) {
-			dev_err(dev, "Failed to read led 'reg' property\n");
-			goto put_child_node;
-		}
-
-		if (reg < 1 || reg > is31->cdef->num_leds) {
-			dev_err(dev, "invalid led reg %u\n", reg);
-			ret = -EINVAL;
-			goto put_child_node;
-		}
+	ret = devm_led_classdev_register_ext(dev, &led->cdev, &init_data);
+	if (ret)
+		dev_err(dev, "Failed to register LED for node %pOF\n", np);
 
-		led = &is31->leds[reg - 1];
-
-		if (led->configured) {
-			dev_err(dev, "led %u is already configured\n", reg);
-			ret = -EINVAL;
-			goto put_child_node;
-		}
+	return ret;
+}
 
-		ret = is31fl319x_parse_child_dt(dev, child, led);
-		if (ret) {
-			dev_err(dev, "led %u DT parsing failed\n", reg);
-			goto put_child_node;
-		}
+static int is31fl319x_parse_and_register(struct device *dev,
+					 struct is31fl319x_chip *is31)
+{
+	struct device_node *np = dev_of_node(dev), *child;
+	int ret, count;
 
-		led->configured = true;
+	count = of_get_child_count(np);
+	if (count < 1 || count > is31->cdef->num_leds) {
+		dev_err(dev, "Between 1 and %u LEDs have to be defined\n",
+			is31->cdef->num_leds);
+		return -ENODEV;
 	}
 
-	is31->audio_gain_db = 0;
-	ret = of_property_read_u32(np, "audio-gain-db", &is31->audio_gain_db);
-	if (!ret)
+	if (!of_property_read_u32(np, "audio-gain-db", &is31->audio_gain_db))
 		is31->audio_gain_db = min(is31->audio_gain_db,
 					  IS31FL319X_AUDIO_GAIN_DB_MAX);
 
-	return 0;
+	for_each_child_of_node(np, child) {
+		ret = is31fl319x_led_register(dev, is31, child);
+		if (ret)
+			return ret;
+	}
 
-put_child_node:
-	of_node_put(child);
-	return ret;
+	return 0;
 }
 
 static bool is31fl319x_readable_reg(struct device *dev, unsigned int reg)
@@ -345,30 +326,43 @@ static int is31fl319x_probe(struct i2c_client *client,
 {
 	struct is31fl319x_chip *is31;
 	struct device *dev = &client->dev;
+	struct gpio_desc *shutdown_gpio;
+	u32 aggregated_led_microamp;
 	int err;
-	int i = 0;
-	u32 aggregated_led_microamp = IS31FL319X_CURRENT_MAX;
 
 	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C))
 		return -EIO;
 
+	/*
+	 * Kernel conventions require per-LED led-max-microamp property.
+	 * But the chip does not allow to limit individual LEDs.
+	 * So we take minimum from all subnodes for safety of hardware.
+	 */
+	err = is31fl319x_parse_max_current(dev, &aggregated_led_microamp);
+	if (err)
+		return err;
+
 	is31 = devm_kzalloc(&client->dev, sizeof(*is31), GFP_KERNEL);
 	if (!is31)
 		return -ENOMEM;
 
-	mutex_init(&is31->lock);
-
-	err = is31fl319x_parse_dt(&client->dev, is31);
-	if (err)
-		goto free_mutex;
+	shutdown_gpio = gpiod_get_optional(dev, "shutdown", GPIOD_OUT_HIGH);
+	if (IS_ERR(shutdown_gpio)) {
+		dev_err(dev, "Failed to get shutdown gpio\n");
+		return PTR_ERR(shutdown_gpio);
+	}
 
-	if (is31->shutdown_gpio) {
-		gpiod_direction_output(is31->shutdown_gpio, 0);
+	if (shutdown_gpio) {
+		gpiod_direction_output(shutdown_gpio, 0);
 		mdelay(5);
-		gpiod_direction_output(is31->shutdown_gpio, 1);
+		gpiod_direction_output(shutdown_gpio, 1);
+		gpiod_put(shutdown_gpio);
 	}
 
+	mutex_init(&is31->lock);
+
 	is31->client = client;
+	is31->cdef = device_get_match_data(dev);
 	is31->regmap = devm_regmap_init_i2c(client, &regmap_config);
 	if (IS_ERR(is31->regmap)) {
 		dev_err(&client->dev, "failed to allocate register map\n");
@@ -387,33 +381,13 @@ static int is31fl319x_probe(struct i2c_client *client,
 		goto free_mutex;
 	}
 
-	/*
-	 * Kernel conventions require per-LED led-max-microamp property.
-	 * But the chip does not allow to limit individual LEDs.
-	 * So we take minimum from all subnodes for safety of hardware.
-	 */
-	for (i = 0; i < is31->cdef->num_leds; i++)
-		if (is31->leds[i].configured &&
-		    is31->leds[i].max_microamp < aggregated_led_microamp)
-			aggregated_led_microamp = is31->leds[i].max_microamp;
-
 	regmap_write(is31->regmap, IS31FL319X_CONFIG2,
 		     is31fl319x_microamp_to_cs(dev, aggregated_led_microamp) |
 		     is31fl319x_db_to_gain(is31->audio_gain_db));
 
-	for (i = 0; i < is31->cdef->num_leds; i++) {
-		struct is31fl319x_led *led = &is31->leds[i];
-
-		if (!led->configured)
-			continue;
-
-		led->chip = is31;
-		led->cdev.brightness_set_blocking = is31fl319x_brightness_set;
-
-		err = devm_led_classdev_register(&client->dev, &led->cdev);
-		if (err < 0)
-			goto free_mutex;
-	}
+	err = is31fl319x_parse_and_register(dev, is31);
+	if (err)
+		goto free_mutex;
 
 	return 0;
 
-- 
2.26.2

