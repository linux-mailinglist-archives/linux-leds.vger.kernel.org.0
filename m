Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 700581B6027
	for <lists+linux-leds@lfdr.de>; Thu, 23 Apr 2020 18:03:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729472AbgDWQCa (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 23 Apr 2020 12:02:30 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:46502 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729530AbgDWQC3 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 23 Apr 2020 12:02:29 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 03NG2Nr3107738;
        Thu, 23 Apr 2020 11:02:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1587657743;
        bh=Hmh5Cscf08xM36Wssgy2YWWR9QgZTNHHtXnnVauEbAs=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=obo46nth8jCjlmj+lSGNJmnAsqsYQqmtKQZJ1GtyQ5gZ59nq00uxS6eOc/AvCvOAZ
         3m2a2dsCMl5FEFKkYWM4ScH4m2630pONQI2rQpreNdu7BSakODYzKSs11J/ATBLEnO
         HvBKBm4ds+5ngdmKgAEinRgzAUmKowGSNDUdm+4Q=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 03NG2N0T050434;
        Thu, 23 Apr 2020 11:02:23 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 23
 Apr 2020 11:02:23 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 23 Apr 2020 11:02:23 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 03NG2Nxf062330;
        Thu, 23 Apr 2020 11:02:23 -0500
From:   Dan Murphy <dmurphy@ti.com>
To:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>
CC:     <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Dan Murphy <dmurphy@ti.com>
Subject: [PATCH v20 12/17] leds: lp55xx: Add multicolor framework support to lp55xx
Date:   Thu, 23 Apr 2020 10:55:19 -0500
Message-ID: <20200423155524.13971-13-dmurphy@ti.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200423155524.13971-1-dmurphy@ti.com>
References: <20200423155524.13971-1-dmurphy@ti.com>
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
 drivers/leds/leds-lp55xx-common.c         | 178 +++++++++++++++++++---
 drivers/leds/leds-lp55xx-common.h         |  11 +-
 drivers/leds/leds-lp8501.c                |  14 +-
 include/linux/platform_data/leds-lp55xx.h |   8 +
 8 files changed, 207 insertions(+), 46 deletions(-)

diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index 66253a2a01d3..d5226ebb28b2 100644
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
index 882ef39e4965..f32105f8bfca 100644
--- a/drivers/leds/leds-lp55xx-common.c
+++ b/drivers/leds/leds-lp55xx-common.c
@@ -35,6 +35,11 @@ static struct lp55xx_led *dev_to_lp55xx_led(struct device *dev)
 	return cdev_to_lp55xx_led(dev_get_drvdata(dev));
 }
 
+static struct lp55xx_led *mcled_cdev_to_led(struct led_classdev_mc *mc_cdev)
+{
+	return container_of(mc_cdev, struct lp55xx_led, mc_cdev);
+}
+
 static void lp55xx_reset_device(struct lp55xx_chip *chip)
 {
 	struct lp55xx_device_config *cfg = chip->cfg;
@@ -131,6 +136,18 @@ static struct attribute *lp55xx_led_attrs[] = {
 };
 ATTRIBUTE_GROUPS(lp55xx_led);
 
+static int lp55xx_set_mc_brightness(struct led_classdev *cdev,
+				    enum led_brightness brightness)
+{
+	struct led_classdev_mc *mc_dev = lcdev_to_mccdev(cdev);
+	struct lp55xx_led *led = mcled_cdev_to_led(mc_dev);
+	struct lp55xx_device_config *cfg = led->chip->cfg;
+
+	led_mc_calc_color_components(&led->mc_cdev, brightness);
+	return cfg->multicolor_brightness_fn(led);
+
+}
+
 static int lp55xx_set_brightness(struct led_classdev *cdev,
 			     enum led_brightness brightness)
 {
@@ -147,9 +164,12 @@ static int lp55xx_init_led(struct lp55xx_led *led,
 	struct lp55xx_platform_data *pdata = chip->pdata;
 	struct lp55xx_device_config *cfg = chip->cfg;
 	struct device *dev = &chip->cl->dev;
+	int max_channel = cfg->max_channel;
+	struct led_mc_subled *mc_led_info;
+	struct led_classdev *led_cdev;
 	char name[32];
+	int i, j = 0;
 	int ret;
-	int max_channel = cfg->max_channel;
 
 	if (chan >= max_channel) {
 		dev_err(dev, "invalid channel: %d / %d\n", chan, max_channel);
@@ -159,10 +179,44 @@ static int lp55xx_init_led(struct lp55xx_led *led,
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
+		mc_led_info = devm_kcalloc(dev,
+					   pdata->led_config[chan].num_colors,
+					   sizeof(*mc_led_info), GFP_KERNEL);
+		if (!mc_led_info)
+			return -ENOMEM;
+
+		led_cdev = &led->mc_cdev.led_cdev;
+		led_cdev->name = led->cdev.name;
+		led_cdev->brightness_set_blocking = lp55xx_set_mc_brightness;
+		led_cdev->groups = lp55xx_led_groups;
+		led->mc_cdev.num_colors = pdata->led_config[chan].num_colors;
+		for (i = 0; i < led->mc_cdev.num_colors; i++) {
+			mc_led_info[i].color_index =
+				pdata->led_config[chan].color_id[i];
+			mc_led_info[i].color_channel =
+					pdata->led_config[chan].output_num[i];
+			j++;
+		}
+
+		led->mc_cdev.multicolor_info = mc_led_info;
+	} else {
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
@@ -170,18 +224,11 @@ static int lp55xx_init_led(struct lp55xx_led *led,
 		return -EINVAL;
 	}
 
-	led->cdev.brightness_set_blocking = lp55xx_set_brightness;
-	led->cdev.groups = lp55xx_led_groups;
+	if (pdata->led_config[chan].num_colors > 1)
+		ret = devm_led_classdev_multicolor_register(dev, &led->mc_cdev);
+	else
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
@@ -525,14 +572,105 @@ void lp55xx_unregister_sysfs(struct lp55xx_chip *chip)
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
+static int lp55xx_parse_multi_led_child(struct device_node *child,
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
+		return ret;
+
+	cfg[child_number].color_id[color_number] = color_id;
+	cfg[child_number].output_num[color_number] = chan_nr;
+
+	return 0;
+}
+
+static int lp55xx_parse_multi_led(struct device_node *np,
+				  struct lp55xx_led_config *cfg,
+				  int child_number)
+{
+	struct device_node *child;
+	int num_colors = 0, ret;
+
+	for_each_child_of_node(np, child) {
+		ret = lp55xx_parse_multi_led_child(child, cfg, child_number,
+						   num_colors);
+		if (ret)
+			return ret;
+		num_colors++;
+	}
+
+	cfg[child_number].num_colors = num_colors;
+
+	return 0;
+}
+
+static int lp55xx_parse_logical_led(struct device_node *np,
+				   struct lp55xx_led_config *cfg,
+				   int child_number)
+{
+	int led_color, ret;
+	int chan_nr = 0;
+
+	cfg[child_number].default_trigger =
+		of_get_property(np, "linux,default-trigger", NULL);
+
+	ret = of_property_read_u32(np, "color", &led_color);
+	if (ret)
+		return ret;
+
+	if (led_color == LED_COLOR_ID_MULTI)
+		return lp55xx_parse_multi_led(np, cfg, child_number);
+
+	ret =  lp55xx_parse_common_child(np, cfg, child_number, &chan_nr);
+	if (ret < 0)
+		return ret;
+
+	cfg[child_number].chan_nr = chan_nr;
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
@@ -550,16 +688,12 @@ struct lp55xx_platform_data *lp55xx_of_populate_pdata(struct device *dev,
 
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
index b9b1041e8143..a9d7ba3f2fd1 100644
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
@@ -167,6 +174,7 @@ struct lp55xx_chip {
 struct lp55xx_led {
 	int chan_nr;
 	struct led_classdev cdev;
+	struct led_classdev_mc mc_cdev;
 	u8 led_current;
 	u8 max_current;
 	u8 brightness;
@@ -196,6 +204,7 @@ extern void lp55xx_unregister_sysfs(struct lp55xx_chip *chip);
 
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
index 96a787100fda..d85275aea38c 100644
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
+	int color_id[LED_COLOR_ID_MAX];
+	int output_num[LED_COLOR_ID_MAX];
 };
 
 struct lp55xx_predef_pattern {
-- 
2.25.1

