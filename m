Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4C682B80E4
	for <lists+linux-leds@lfdr.de>; Thu, 19 Sep 2019 20:34:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403976AbfISSeX (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 19 Sep 2019 14:34:23 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:41364 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732844AbfISSeM (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 19 Sep 2019 14:34:12 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8JIY87a043192;
        Thu, 19 Sep 2019 13:34:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1568918048;
        bh=IbyEubXtjrupSE6ZpBqV74zi00sNHXI2hyLvkDXzAq0=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=tb8Ke9BmrSParTjaUHUIxCwXaxJ/cDnrwfjawffcW9OFC1QTnSURmb1I8j4BVK/MO
         227eOxeR45xeVF3iPcbLVvWLCDnPVBHWr/km4RmU7FYH8S1/0YNcJLsY9j3WWf7YgG
         zTrlG/bupOdBUxIraqOp4ylq11lq/wtm99YNSBiY=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8JIY8wM100336;
        Thu, 19 Sep 2019 13:34:08 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 19
 Sep 2019 13:34:04 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 19 Sep 2019 13:34:04 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8JIY83N030053;
        Thu, 19 Sep 2019 13:34:08 -0500
From:   Dan Murphy <dmurphy@ti.com>
To:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>
CC:     <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Dan Murphy <dmurphy@ti.com>
Subject: [PATCH v7 9/9] leds: Update the lp55xx to use the multi color framework
Date:   Thu, 19 Sep 2019 13:36:57 -0500
Message-ID: <20190919183657.1339-10-dmurphy@ti.com>
X-Mailer: git-send-email 2.22.0.214.g8dca754b1e
In-Reply-To: <20190919183657.1339-1-dmurphy@ti.com>
References: <20190919183657.1339-1-dmurphy@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Update the lp5523 to use the multi color framework.

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 drivers/leds/leds-lp5523.c                |  13 +++
 drivers/leds/leds-lp55xx-common.c         | 131 ++++++++++++++++++----
 drivers/leds/leds-lp55xx-common.h         |   9 ++
 include/linux/platform_data/leds-lp55xx.h |   6 +
 4 files changed, 137 insertions(+), 22 deletions(-)

diff --git a/drivers/leds/leds-lp5523.c b/drivers/leds/leds-lp5523.c
index d0b931a136b9..8b2cdb98fed6 100644
--- a/drivers/leds/leds-lp5523.c
+++ b/drivers/leds/leds-lp5523.c
@@ -791,6 +791,18 @@ static ssize_t store_master_fader_leds(struct device *dev,
 	return ret;
 }
 
+static int lp5523_led_intensity(struct lp55xx_led *led, int chan_num)
+{
+	struct lp55xx_chip *chip = led->chip;
+	int ret;
+
+	mutex_lock(&chip->lock);
+	ret = lp55xx_write(chip, LP5523_REG_LED_PWM_BASE + chan_num,
+		     led->brightness);
+	mutex_unlock(&chip->lock);
+	return ret;
+}
+
 static int lp5523_led_brightness(struct lp55xx_led *led)
 {
 	struct lp55xx_chip *chip = led->chip;
@@ -857,6 +869,7 @@ static struct lp55xx_device_config lp5523_cfg = {
 	.max_channel  = LP5523_MAX_LEDS,
 	.post_init_device   = lp5523_post_init_device,
 	.brightness_fn      = lp5523_led_brightness,
+	.color_intensity_fn = lp5523_led_intensity,
 	.set_led_current    = lp5523_set_led_current,
 	.firmware_cb        = lp5523_firmware_loaded,
 	.run_engine         = lp5523_run_engine,
diff --git a/drivers/leds/leds-lp55xx-common.c b/drivers/leds/leds-lp55xx-common.c
index 44ced02b49f9..a5efe2407832 100644
--- a/drivers/leds/leds-lp55xx-common.c
+++ b/drivers/leds/leds-lp55xx-common.c
@@ -136,9 +136,26 @@ static int lp55xx_set_brightness(struct led_classdev *cdev,
 {
 	struct lp55xx_led *led = cdev_to_lp55xx_led(cdev);
 	struct lp55xx_device_config *cfg = led->chip->cfg;
+	int adj_value[LED_COLOR_ID_MAX];
+	int ret;
+	int i;
+
+	if (led->mc_cdev.num_leds > 1) {
+		led_mc_calc_brightness(&led->mc_cdev,
+				       brightness, adj_value);
+		for (i = 0; i < led->mc_cdev.num_leds; i++) {
+			led->brightness = adj_value[i];
+			ret = cfg->color_intensity_fn(led,
+						      led->grouped_channels[i]);
+			if (ret)
+				break;
+		}
+	} else {
+		led->brightness = (u8)brightness;
+		ret = cfg->brightness_fn(led);
+	}
 
-	led->brightness = (u8)brightness;
-	return cfg->brightness_fn(led);
+	return ret;
 }
 
 static int lp55xx_init_led(struct lp55xx_led *led,
@@ -147,9 +164,9 @@ static int lp55xx_init_led(struct lp55xx_led *led,
 	struct lp55xx_platform_data *pdata = chip->pdata;
 	struct lp55xx_device_config *cfg = chip->cfg;
 	struct device *dev = &chip->cl->dev;
+	int max_channel = cfg->max_channel;
 	char name[32];
 	int ret;
-	int max_channel = cfg->max_channel;
 
 	if (chan >= max_channel) {
 		dev_err(dev, "invalid channel: %d / %d\n", chan, max_channel);
@@ -159,10 +176,35 @@ static int lp55xx_init_led(struct lp55xx_led *led,
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
+		led->mc_cdev.available_colors = pdata->led_config[chan].available_colors;
+		memcpy(led->channel_color,
+		       pdata->led_config[chan].channel_color,
+		       sizeof(led->channel_color));
+		memcpy(led->grouped_channels,
+		       pdata->led_config[chan].grouped_channels,
+		       sizeof(led->grouped_channels));
+	} else {
+
+		led->cdev.default_trigger = pdata->led_config[chan].default_trigger;
+		led->cdev.brightness_set_blocking = lp55xx_set_brightness;
+	}	led->cdev.groups = lp55xx_led_groups;
+
 	led->led_current = pdata->led_config[chan].led_current;
 	led->max_current = pdata->led_config[chan].max_current;
 	led->chan_nr = pdata->led_config[chan].chan_nr;
-	led->cdev.default_trigger = pdata->led_config[chan].default_trigger;
 
 	if (led->chan_nr >= max_channel) {
 		dev_err(dev, "Use channel numbers between 0 and %d\n",
@@ -170,18 +212,11 @@ static int lp55xx_init_led(struct lp55xx_led *led,
 		return -EINVAL;
 	}
 
-	led->cdev.brightness_set_blocking = lp55xx_set_brightness;
-	led->cdev.groups = lp55xx_led_groups;
+	if (pdata->led_config[chan].num_colors > 1)
+		ret = led_classdev_multicolor_register(dev, &led->mc_cdev);
+	else
+		ret = led_classdev_register(dev, &led->cdev);
 
-	if (pdata->led_config[chan].name) {
-		led->cdev.name = pdata->led_config[chan].name;
-	} else {
-		snprintf(name, sizeof(name), "%s:channel%d",
-			pdata->label ? : chip->cl->name, chan);
-		led->cdev.name = name;
-	}
-
-	ret = led_classdev_register(dev, &led->cdev);
 	if (ret) {
 		dev_err(dev, "led register err: %d\n", ret);
 		return ret;
@@ -466,7 +501,6 @@ int lp55xx_register_leds(struct lp55xx_led *led, struct lp55xx_chip *chip)
 		dev_err(&chip->cl->dev, "empty brightness configuration\n");
 		return -EINVAL;
 	}
-
 	for (i = 0; i < num_channels; i++) {
 
 		/* do not initialize channels that are not connected */
@@ -538,6 +572,38 @@ void lp55xx_unregister_sysfs(struct lp55xx_chip *chip)
 }
 EXPORT_SYMBOL_GPL(lp55xx_unregister_sysfs);
 
+static int lp5xx_parse_channel_child(struct device_node *np,
+				     struct lp55xx_led_config *cfg,
+				     int chan_num)
+{
+	struct device_node *child;
+	int num_colors = 0;
+	u32 color_id;
+	u32 led_number;
+	int ret;
+
+	cfg[chan_num].default_trigger =
+			of_get_property(np, "linux,default-trigger", NULL);
+
+	for_each_child_of_node(np, child) {
+		of_property_read_string(child, "chan-name",
+					&cfg[chan_num].name);
+		of_property_read_u8(child, "led-cur",
+				    &cfg[chan_num].led_current);
+		of_property_read_u8(child, "max-cur",
+				    &cfg[chan_num].max_current);
+		of_property_read_u32(child, "color", &color_id);
+		cfg[chan_num].channel_color[num_colors] = color_id;
+		set_bit(color_id, &cfg[chan_num].available_colors);
+		ret = of_property_read_u32(child, "reg", &led_number);
+		cfg[chan_num].grouped_channels[num_colors] = led_number;
+		num_colors++;
+	}
+	cfg[chan_num].num_colors = num_colors;
+
+	return 0;
+}
+
 struct lp55xx_platform_data *lp55xx_of_populate_pdata(struct device *dev,
 						      struct device_node *np)
 {
@@ -545,7 +611,10 @@ struct lp55xx_platform_data *lp55xx_of_populate_pdata(struct device *dev,
 	struct lp55xx_platform_data *pdata;
 	struct lp55xx_led_config *cfg;
 	int num_channels;
+	int channel_color;
+	u32 led_number;
 	int i = 0;
+	int ret;
 
 	pdata = devm_kzalloc(dev, sizeof(*pdata), GFP_KERNEL);
 	if (!pdata)
@@ -565,13 +634,31 @@ struct lp55xx_platform_data *lp55xx_of_populate_pdata(struct device *dev,
 	pdata->num_channels = num_channels;
 
 	for_each_child_of_node(np, child) {
-		cfg[i].chan_nr = i;
+		ret = of_property_read_u32(child, "color", &channel_color);
+		if (ret) {
+			dev_err(dev,"Missing color property setting white\n");
+			channel_color = LED_COLOR_ID_WHITE;
+		}
 
-		of_property_read_string(child, "chan-name", &cfg[i].name);
-		of_property_read_u8(child, "led-cur", &cfg[i].led_current);
-		of_property_read_u8(child, "max-cur", &cfg[i].max_current);
-		cfg[i].default_trigger =
-			of_get_property(child, "linux,default-trigger", NULL);
+		if (channel_color == LED_COLOR_ID_MULTI)
+			lp5xx_parse_channel_child(child, cfg, i);
+		else {
+			of_property_read_string(child, "chan-name",
+						&cfg[i].name);
+			of_property_read_u8(child, "led-cur",
+					    &cfg[i].led_current);
+			of_property_read_u8(child, "max-cur",
+					    &cfg[i].max_current);
+			cfg[i].default_trigger =
+				of_get_property(child, "linux,default-trigger",
+						NULL);
+			of_property_read_u32(child, "reg", &led_number);
+
+			if (led_number < 0 || led_number > 6)
+				return ERR_PTR(EINVAL);
+
+			cfg[i].chan_nr = led_number;
+		}
 
 		i++;
 	}
diff --git a/drivers/leds/leds-lp55xx-common.h b/drivers/leds/leds-lp55xx-common.h
index 783ed5103ce5..d9c114259dcb 100644
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
 
+	/* access specific brightness register */
+	int (*color_intensity_fn)(struct lp55xx_led *led, int chan_num);
+
 	/* current setting function */
 	void (*set_led_current) (struct lp55xx_led *led, u8 led_current);
 
@@ -159,6 +164,7 @@ struct lp55xx_chip {
  * struct lp55xx_led
  * @chan_nr         : Channel number
  * @cdev            : LED class device
+ * @mc_cdev	    : Multi color class device
  * @led_current     : Current setting at each led channel
  * @max_current     : Maximun current at each led channel
  * @brightness      : Brightness value
@@ -167,9 +173,12 @@ struct lp55xx_chip {
 struct lp55xx_led {
 	int chan_nr;
 	struct led_classdev cdev;
+	struct led_classdev_mc mc_cdev;
 	u8 led_current;
 	u8 max_current;
 	u8 brightness;
+	int channel_color[LED_COLOR_ID_MAX];
+	int grouped_channels[LED_COLOR_ID_MAX];
 	struct lp55xx_chip *chip;
 };
 
diff --git a/include/linux/platform_data/leds-lp55xx.h b/include/linux/platform_data/leds-lp55xx.h
index 96a787100fda..0ac29f537ab6 100644
--- a/include/linux/platform_data/leds-lp55xx.h
+++ b/include/linux/platform_data/leds-lp55xx.h
@@ -12,6 +12,8 @@
 #ifndef _LEDS_LP55XX_H
 #define _LEDS_LP55XX_H
 
+#include <linux/led-class-multicolor.h>
+
 /* Clock configuration */
 #define LP55XX_CLOCK_AUTO	0
 #define LP55XX_CLOCK_INT	1
@@ -23,6 +25,10 @@ struct lp55xx_led_config {
 	u8 chan_nr;
 	u8 led_current; /* mA x10, 0 if led is not connected */
 	u8 max_current;
+	int num_colors;
+	unsigned long available_colors;
+	u32 channel_color[LED_COLOR_ID_MAX];
+	int grouped_channels[LED_COLOR_ID_MAX];
 };
 
 struct lp55xx_predef_pattern {
-- 
2.22.0.214.g8dca754b1e

