Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8B752FC7A4
	for <lists+linux-leds@lfdr.de>; Thu, 14 Nov 2019 14:33:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727364AbfKNNce (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 14 Nov 2019 08:32:34 -0500
Received: from lelv0142.ext.ti.com ([198.47.23.249]:40608 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726980AbfKNNcc (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 14 Nov 2019 08:32:32 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id xAEDWTMl103834;
        Thu, 14 Nov 2019 07:32:29 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1573738349;
        bh=hFl4DnkfSs8f2U1B17uc82VcUSRpX1dxZkWWhMdp9Vg=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=JNnt8xdCKwNaQpfxBtZ42hFva6szZZaE1Ne9atVE6l3xQeJ27t7wzRu0Rafkxkexg
         hIf79aVgFcvYWll9teOmCYmTXmk6OocxM4T9o4HXUc+MAuweiVXUvGxFMdy3yINpMY
         cV/V1X3QrKeeuQBa0rjmhtu0SZEIPO2gfMe/gArU=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xAEDWT2U005691
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 14 Nov 2019 07:32:29 -0600
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 14
 Nov 2019 07:32:29 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 14 Nov 2019 07:32:29 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id xAEDWT5l036798;
        Thu, 14 Nov 2019 07:32:29 -0600
From:   Dan Murphy <dmurphy@ti.com>
To:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>
CC:     <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Dan Murphy <dmurphy@ti.com>
Subject: [PATCH v17 13/19] leds: lp55xx: Add multicolor framework support to lp55xx
Date:   Thu, 14 Nov 2019 07:30:17 -0600
Message-ID: <20191114133023.32185-14-dmurphy@ti.com>
X-Mailer: git-send-email 2.22.0.214.g8dca754b1e
In-Reply-To: <20191114133023.32185-1-dmurphy@ti.com>
References: <20191114133023.32185-1-dmurphy@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Add multicolor framework support for the lp55xx family.

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 drivers/leds/Kconfig                      |   1 +
 drivers/leds/leds-lp5521.c                |  14 +-
 drivers/leds/leds-lp5523.c                |  14 +-
 drivers/leds/leds-lp5562.c                |  13 +-
 drivers/leds/leds-lp55xx-common.c         | 200 +++++++++++++++++++---
 drivers/leds/leds-lp55xx-common.h         |  12 +-
 drivers/leds/leds-lp8501.c                |  14 +-
 include/linux/platform_data/leds-lp55xx.h |   8 +
 8 files changed, 228 insertions(+), 48 deletions(-)

diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index fb614a6b9afa..5706bf8d8bd1 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -377,6 +377,7 @@ config LEDS_LP50XX
 config LEDS_LP55XX_COMMON
 	tristate "Common Driver for TI/National LP5521/5523/55231/5562/8501"
 	depends on LEDS_LP5521 || LEDS_LP5523 || LEDS_LP5562 || LEDS_LP8501
+	depends on OF
 	select FW_LOADER
 	select FW_LOADER_USER_HELPER
 	help
diff --git a/drivers/leds/leds-lp5521.c b/drivers/leds/leds-lp5521.c
index 6d2163c0f625..6ff81d6be789 100644
--- a/drivers/leds/leds-lp5521.c
+++ b/drivers/leds/leds-lp5521.c
@@ -505,9 +505,16 @@ static int lp5521_probe(struct i2c_client *client,
 	struct lp55xx_platform_data *pdata = dev_get_platdata(&client->dev);
 	struct device_node *np = client->dev.of_node;
 
+	chip = devm_kzalloc(&client->dev, sizeof(*chip), GFP_KERNEL);
+	if (!chip)
+		return -ENOMEM;
+
+	chip->cfg = &lp5521_cfg;
+
 	if (!pdata) {
 		if (np) {
-			pdata = lp55xx_of_populate_pdata(&client->dev, np);
+			pdata = lp55xx_of_populate_pdata(&client->dev, np,
+							 chip);
 			if (IS_ERR(pdata))
 				return PTR_ERR(pdata);
 		} else {
@@ -516,10 +523,6 @@ static int lp5521_probe(struct i2c_client *client,
 		}
 	}
 
-	chip = devm_kzalloc(&client->dev, sizeof(*chip), GFP_KERNEL);
-	if (!chip)
-		return -ENOMEM;
-
 	led = devm_kcalloc(&client->dev,
 			pdata->num_channels, sizeof(*led), GFP_KERNEL);
 	if (!led)
@@ -527,7 +530,6 @@ static int lp5521_probe(struct i2c_client *client,
 
 	chip->cl = client;
 	chip->pdata = pdata;
-	chip->cfg = &lp5521_cfg;
 
 	mutex_init(&chip->lock);
 
diff --git a/drivers/leds/leds-lp5523.c b/drivers/leds/leds-lp5523.c
index 15e7051392f5..b076c16df9ab 100644
--- a/drivers/leds/leds-lp5523.c
+++ b/drivers/leds/leds-lp5523.c
@@ -872,9 +872,16 @@ static int lp5523_probe(struct i2c_client *client,
 	struct lp55xx_platform_data *pdata = dev_get_platdata(&client->dev);
 	struct device_node *np = client->dev.of_node;
 
+	chip = devm_kzalloc(&client->dev, sizeof(*chip), GFP_KERNEL);
+	if (!chip)
+		return -ENOMEM;
+
+	chip->cfg = &lp5523_cfg;
+
 	if (!pdata) {
 		if (np) {
-			pdata = lp55xx_of_populate_pdata(&client->dev, np);
+			pdata = lp55xx_of_populate_pdata(&client->dev, np,
+							 chip);
 			if (IS_ERR(pdata))
 				return PTR_ERR(pdata);
 		} else {
@@ -883,10 +890,6 @@ static int lp5523_probe(struct i2c_client *client,
 		}
 	}
 
-	chip = devm_kzalloc(&client->dev, sizeof(*chip), GFP_KERNEL);
-	if (!chip)
-		return -ENOMEM;
-
 	led = devm_kcalloc(&client->dev,
 			pdata->num_channels, sizeof(*led), GFP_KERNEL);
 	if (!led)
@@ -894,7 +897,6 @@ static int lp5523_probe(struct i2c_client *client,
 
 	chip->cl = client;
 	chip->pdata = pdata;
-	chip->cfg = &lp5523_cfg;
 
 	mutex_init(&chip->lock);
 
diff --git a/drivers/leds/leds-lp5562.c b/drivers/leds/leds-lp5562.c
index 1c94422408b0..7ecdd199d7ef 100644
--- a/drivers/leds/leds-lp5562.c
+++ b/drivers/leds/leds-lp5562.c
@@ -520,9 +520,16 @@ static int lp5562_probe(struct i2c_client *client,
 	struct lp55xx_platform_data *pdata = dev_get_platdata(&client->dev);
 	struct device_node *np = client->dev.of_node;
 
+	chip = devm_kzalloc(&client->dev, sizeof(*chip), GFP_KERNEL);
+	if (!chip)
+		return -ENOMEM;
+
+	chip->cfg = &lp5562_cfg;
+
 	if (!pdata) {
 		if (np) {
-			pdata = lp55xx_of_populate_pdata(&client->dev, np);
+			pdata = lp55xx_of_populate_pdata(&client->dev, np,
+							 chip);
 			if (IS_ERR(pdata))
 				return PTR_ERR(pdata);
 		} else {
@@ -531,9 +538,6 @@ static int lp5562_probe(struct i2c_client *client,
 		}
 	}
 
-	chip = devm_kzalloc(&client->dev, sizeof(*chip), GFP_KERNEL);
-	if (!chip)
-		return -ENOMEM;
 
 	led = devm_kcalloc(&client->dev,
 			pdata->num_channels, sizeof(*led), GFP_KERNEL);
@@ -542,7 +546,6 @@ static int lp5562_probe(struct i2c_client *client,
 
 	chip->cl = client;
 	chip->pdata = pdata;
-	chip->cfg = &lp5562_cfg;
 
 	mutex_init(&chip->lock);
 
diff --git a/drivers/leds/leds-lp55xx-common.c b/drivers/leds/leds-lp55xx-common.c
index 882ef39e4965..c2087a654ea8 100644
--- a/drivers/leds/leds-lp55xx-common.c
+++ b/drivers/leds/leds-lp55xx-common.c
@@ -131,14 +131,62 @@ static struct attribute *lp55xx_led_attrs[] = {
 };
 ATTRIBUTE_GROUPS(lp55xx_led);
 
+#if IS_ENABLED(CONFIG_LEDS_CLASS_MULTI_COLOR)
+static int lp55xx_map_channel(struct lp55xx_led *led, int color_id,
+			      enum led_brightness brightness)
+{
+	int i;
+
+	for (i = 0; i < led->mc_cdev.num_leds; i++) {
+		if (led->color_components[i].color_id == color_id) {
+			led->color_components[i].brightness = brightness;
+			return 0;
+		}
+	}
+
+	return -EINVAL;
+}
+#endif
+
+static int lp55xx_set_mc_brightness(struct lp55xx_led *led,
+				    struct lp55xx_device_config *cfg,
+				     enum led_brightness brightness)
+{
+	int ret = -EINVAL;
+#if IS_ENABLED(CONFIG_LEDS_CLASS_MULTI_COLOR)
+	struct led_mc_color_conversion color_components[LP55XX_MAX_GROUPED_CHAN];
+	int i;
+
+	if (!cfg->multicolor_brightness_fn)
+		return -EINVAL;
+
+	led_mc_calc_color_components(&led->mc_cdev, brightness,
+				     color_components);
+
+	for (i = 0; i < led->mc_cdev.num_leds; i++) {
+		ret = lp55xx_map_channel(led, color_components[i].color_id,
+					 color_components[i].brightness);
+		if (ret)
+			return ret;
+	}
+
+	ret = cfg->multicolor_brightness_fn(led);
+#endif
+	return ret;
+}
+
 static int lp55xx_set_brightness(struct led_classdev *cdev,
 			     enum led_brightness brightness)
 {
 	struct lp55xx_led *led = cdev_to_lp55xx_led(cdev);
 	struct lp55xx_device_config *cfg = led->chip->cfg;
 
-	led->brightness = (u8)brightness;
-	return cfg->brightness_fn(led);
+	if (led->mc_cdev.num_leds > 1) {
+		return lp55xx_set_mc_brightness(led, cfg, brightness);
+	} else {
+		led->brightness = (u8)brightness;
+		return cfg->brightness_fn(led);
+	}
 }
 
 static int lp55xx_init_led(struct lp55xx_led *led,
@@ -147,9 +195,9 @@ static int lp55xx_init_led(struct lp55xx_led *led,
 	struct lp55xx_platform_data *pdata = chip->pdata;
 	struct lp55xx_device_config *cfg = chip->cfg;
 	struct device *dev = &chip->cl->dev;
+	int max_channel = cfg->max_channel;
 	char name[32];
 	int ret;
-	int max_channel = cfg->max_channel;
 
 	if (chan >= max_channel) {
 		dev_err(dev, "invalid channel: %d / %d\n", chan, max_channel);
@@ -159,10 +207,34 @@ static int lp55xx_init_led(struct lp55xx_led *led,
 	if (pdata->led_config[chan].led_current == 0)
 		return 0;
 
+	if (pdata->led_config[chan].name) {
+		led->cdev.name = pdata->led_config[chan].name;
+	} else {
+		snprintf(name, sizeof(name), "%s:channel%d",
+			pdata->label ? : chip->cl->name, chan);
+		led->cdev.name = name;
+	}
+
+	if (pdata->led_config[chan].num_colors > 1) {
+		led->mc_cdev.led_cdev = &led->cdev;
+		led->cdev.brightness_set_blocking = lp55xx_set_brightness;
+		led->cdev.groups = lp55xx_led_groups;
+		led->mc_cdev.num_leds = pdata->led_config[chan].num_colors;
+		led->mc_cdev.available_colors =
+			pdata->led_config[chan].available_colors;
+		memcpy(led->color_components,
+		       pdata->led_config[chan].color_components,
+		       sizeof(led->color_components));
+	} else {
+
+		led->cdev.default_trigger =
+			pdata->led_config[chan].default_trigger;
+		led->cdev.brightness_set_blocking = lp55xx_set_brightness;
+	}	led->cdev.groups = lp55xx_led_groups;
+
 	led->led_current = pdata->led_config[chan].led_current;
 	led->max_current = pdata->led_config[chan].max_current;
 	led->chan_nr = pdata->led_config[chan].chan_nr;
-	led->cdev.default_trigger = pdata->led_config[chan].default_trigger;
 
 	if (led->chan_nr >= max_channel) {
 		dev_err(dev, "Use channel numbers between 0 and %d\n",
@@ -170,18 +242,13 @@ static int lp55xx_init_led(struct lp55xx_led *led,
 		return -EINVAL;
 	}
 
-	led->cdev.brightness_set_blocking = lp55xx_set_brightness;
-	led->cdev.groups = lp55xx_led_groups;
+#if IS_ENABLED(CONFIG_LEDS_CLASS_MULTI_COLOR)
+	if (pdata->led_config[chan].num_colors > 1)
+		ret = devm_led_classdev_multicolor_register(dev, &led->mc_cdev);
+	else
+#endif
+		ret = devm_led_classdev_register(dev, &led->cdev);
 
-	if (pdata->led_config[chan].name) {
-		led->cdev.name = pdata->led_config[chan].name;
-	} else {
-		snprintf(name, sizeof(name), "%s:channel%d",
-			pdata->label ? : chip->cl->name, chan);
-		led->cdev.name = name;
-	}
-
-	ret = devm_led_classdev_register(dev, &led->cdev);
 	if (ret) {
 		dev_err(dev, "led register err: %d\n", ret);
 		return ret;
@@ -525,14 +592,103 @@ void lp55xx_unregister_sysfs(struct lp55xx_chip *chip)
 }
 EXPORT_SYMBOL_GPL(lp55xx_unregister_sysfs);
 
+static int lp55xx_parse_common_child(struct device_node *np,
+				     struct lp55xx_led_config *cfg,
+				     int led_number, int *chan_nr)
+{
+	int ret;
+
+	of_property_read_string(np, "chan-name",
+				&cfg[led_number].name);
+	of_property_read_u8(np, "led-cur",
+			    &cfg[led_number].led_current);
+	of_property_read_u8(np, "max-cur",
+			    &cfg[led_number].max_current);
+
+	ret = of_property_read_u32(np, "reg", chan_nr);
+	if (ret)
+		return ret;
+
+	if (*chan_nr < 0 || *chan_nr > cfg->max_channel)
+		return -EINVAL;
+
+	return 0;
+}
+
+static int lp55xx_parse_mutli_led_child(struct device_node *child,
+					 struct lp55xx_led_config *cfg,
+					 int child_number, int color_number)
+{
+	int chan_nr, color_id, ret;
+
+	ret = lp55xx_parse_common_child(child, cfg, child_number, &chan_nr);
+	if (ret)
+		return ret;
+
+	ret = of_property_read_u32(child, "color", &color_id);
+	if (ret)
+	       return ret;
+
+	cfg[child_number].color_components[color_number].color_id = color_id;
+	cfg[child_number].color_components[color_number].output_num = chan_nr;
+	set_bit(color_id, &cfg[child_number].available_colors);
+
+	return 0;
+}
+
+static int lp55xx_parse_mutli_led(struct device_node *np,
+				  struct lp55xx_led_config *cfg,
+				  int child_number)
+{
+	struct device_node *child;
+	int num_colors = 0, ret;
+
+	for_each_child_of_node(np, child) {
+		ret = lp55xx_parse_mutli_led_child(child, cfg, child_number,
+						   num_colors);
+		if (ret)
+			return ret;
+		num_colors++;
+	}
+
+	return 0;
+}
+
+static int lp55xx_parse_logical_led(struct device_node *np,
+				   struct lp55xx_led_config *cfg,
+				   int child_number)
+{
+	int led_color, ret;
+
+	cfg[child_number].default_trigger =
+		of_get_property(np, "linux,default-trigger", NULL);
+
+	ret = of_property_read_u32(np, "color", &led_color);
+
+	if (ret) {
+		int chan_nr;
+		ret =  lp55xx_parse_common_child(np, cfg, child_number,
+						 &chan_nr);
+		if (ret < 0)
+		       return ret;
+		cfg[child_number].chan_nr = chan_nr;
+	} else if (led_color == LED_COLOR_ID_MULTI) {
+		return lp55xx_parse_mutli_led(np, cfg, child_number);
+	}
+
+	return ret;
+}
+
 struct lp55xx_platform_data *lp55xx_of_populate_pdata(struct device *dev,
-						      struct device_node *np)
+						      struct device_node *np,
+						      struct lp55xx_chip *chip)
 {
 	struct device_node *child;
 	struct lp55xx_platform_data *pdata;
 	struct lp55xx_led_config *cfg;
 	int num_channels;
 	int i = 0;
+	int ret;
 
 	pdata = devm_kzalloc(dev, sizeof(*pdata), GFP_KERNEL);
 	if (!pdata)
@@ -550,16 +706,12 @@ struct lp55xx_platform_data *lp55xx_of_populate_pdata(struct device *dev,
 
 	pdata->led_config = &cfg[0];
 	pdata->num_channels = num_channels;
+	cfg->max_channel = chip->cfg->max_channel;
 
 	for_each_child_of_node(np, child) {
-		cfg[i].chan_nr = i;
-
-		of_property_read_string(child, "chan-name", &cfg[i].name);
-		of_property_read_u8(child, "led-cur", &cfg[i].led_current);
-		of_property_read_u8(child, "max-cur", &cfg[i].max_current);
-		cfg[i].default_trigger =
-			of_get_property(child, "linux,default-trigger", NULL);
-
+		ret = lp55xx_parse_logical_led(child, cfg, i);
+		if (ret)
+			return ERR_PTR(-EINVAL);
 		i++;
 	}
 
diff --git a/drivers/leds/leds-lp55xx-common.h b/drivers/leds/leds-lp55xx-common.h
index b9b1041e8143..18476051d3d2 100644
--- a/drivers/leds/leds-lp55xx-common.h
+++ b/drivers/leds/leds-lp55xx-common.h
@@ -12,6 +12,8 @@
 #ifndef _LEDS_LP55XX_COMMON_H
 #define _LEDS_LP55XX_COMMON_H
 
+#include <linux/led-class-multicolor.h>
+
 enum lp55xx_engine_index {
 	LP55XX_ENGINE_INVALID,
 	LP55XX_ENGINE_1,
@@ -109,6 +111,9 @@ struct lp55xx_device_config {
 	/* access brightness register */
 	int (*brightness_fn)(struct lp55xx_led *led);
 
+	/* perform brightness value to multiple LEDs */
+	int (*multicolor_brightness_fn)(struct lp55xx_led *led);
+
 	/* current setting function */
 	void (*set_led_current) (struct lp55xx_led *led, u8 led_current);
 
@@ -159,6 +164,8 @@ struct lp55xx_chip {
  * struct lp55xx_led
  * @chan_nr         : Channel number
  * @cdev            : LED class device
+ * @mc_cdev	    : Multi color class device
+ * @color_components: Multi color LED map information
  * @led_current     : Current setting at each led channel
  * @max_current     : Maximun current at each led channel
  * @brightness      : Brightness value
@@ -167,6 +174,8 @@ struct lp55xx_chip {
 struct lp55xx_led {
 	int chan_nr;
 	struct led_classdev cdev;
+	struct led_classdev_mc mc_cdev;
+	struct led_mc_color_conversion color_components[LP55XX_MAX_GROUPED_CHAN];
 	u8 led_current;
 	u8 max_current;
 	u8 brightness;
@@ -196,6 +205,7 @@ extern void lp55xx_unregister_sysfs(struct lp55xx_chip *chip);
 
 /* common device tree population function */
 extern struct lp55xx_platform_data
-*lp55xx_of_populate_pdata(struct device *dev, struct device_node *np);
+*lp55xx_of_populate_pdata(struct device *dev, struct device_node *np,
+			  struct lp55xx_chip *chip);
 
 #endif /* _LEDS_LP55XX_COMMON_H */
diff --git a/drivers/leds/leds-lp8501.c b/drivers/leds/leds-lp8501.c
index a58019cdb8c3..ac2c31db4a65 100644
--- a/drivers/leds/leds-lp8501.c
+++ b/drivers/leds/leds-lp8501.c
@@ -308,9 +308,16 @@ static int lp8501_probe(struct i2c_client *client,
 	struct lp55xx_platform_data *pdata = dev_get_platdata(&client->dev);
 	struct device_node *np = client->dev.of_node;
 
+	chip = devm_kzalloc(&client->dev, sizeof(*chip), GFP_KERNEL);
+	if (!chip)
+		return -ENOMEM;
+
+	chip->cfg = &lp8501_cfg;
+
 	if (!pdata) {
 		if (np) {
-			pdata = lp55xx_of_populate_pdata(&client->dev, np);
+			pdata = lp55xx_of_populate_pdata(&client->dev, np,
+							 chip);
 			if (IS_ERR(pdata))
 				return PTR_ERR(pdata);
 		} else {
@@ -319,10 +326,6 @@ static int lp8501_probe(struct i2c_client *client,
 		}
 	}
 
-	chip = devm_kzalloc(&client->dev, sizeof(*chip), GFP_KERNEL);
-	if (!chip)
-		return -ENOMEM;
-
 	led = devm_kcalloc(&client->dev,
 			pdata->num_channels, sizeof(*led), GFP_KERNEL);
 	if (!led)
@@ -330,7 +333,6 @@ static int lp8501_probe(struct i2c_client *client,
 
 	chip->cl = client;
 	chip->pdata = pdata;
-	chip->cfg = &lp8501_cfg;
 
 	mutex_init(&chip->lock);
 
diff --git a/include/linux/platform_data/leds-lp55xx.h b/include/linux/platform_data/leds-lp55xx.h
index 96a787100fda..dca21b19a283 100644
--- a/include/linux/platform_data/leds-lp55xx.h
+++ b/include/linux/platform_data/leds-lp55xx.h
@@ -12,17 +12,25 @@
 #ifndef _LEDS_LP55XX_H
 #define _LEDS_LP55XX_H
 
+#include <linux/led-class-multicolor.h>
+
 /* Clock configuration */
 #define LP55XX_CLOCK_AUTO	0
 #define LP55XX_CLOCK_INT	1
 #define LP55XX_CLOCK_EXT	2
 
+#define LP55XX_MAX_GROUPED_CHAN	4
+
 struct lp55xx_led_config {
 	const char *name;
 	const char *default_trigger;
 	u8 chan_nr;
 	u8 led_current; /* mA x10, 0 if led is not connected */
 	u8 max_current;
+	int num_colors;
+	unsigned int max_channel;
+	unsigned long available_colors;
+	struct led_mc_color_conversion color_components[LP55XX_MAX_GROUPED_CHAN];
 };
 
 struct lp55xx_predef_pattern {
-- 
2.22.0.214.g8dca754b1e

