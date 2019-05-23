Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 99E0D28AFD
	for <lists+linux-leds@lfdr.de>; Thu, 23 May 2019 21:58:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388162AbfEWTv2 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 23 May 2019 15:51:28 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:42804 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731850AbfEWTIn (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 23 May 2019 15:08:43 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x4NJ8dML034797;
        Thu, 23 May 2019 14:08:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1558638519;
        bh=GLtiVWFcme/Cn8dQa/wp+bSDn/qnr2+YqURpJOJAkAU=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=SdxS59dXBokFmf1dyLBouAGfNjB9lGBSKC2Kr5XS8AwDXbkFiSE4KHIr6kixhAUkr
         eqzAd7uo1fs2gg0Loi2pDJGu2YyoZytg7yeVR513edQWQfQLvxzSmf47OnPI6XPQva
         wDQUZ/MsJTUJsRh/uPx/5eT32X42dRY1lL7XLL9M=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x4NJ8ciP079051
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 23 May 2019 14:08:39 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 23
 May 2019 14:08:38 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 23 May 2019 14:08:38 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x4NJ8cUh027535;
        Thu, 23 May 2019 14:08:38 -0500
From:   Dan Murphy <dmurphy@ti.com>
To:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>, <robh+dt@kernel.org>
CC:     <devicetree@vger.kernel.org>, <linux-leds@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Dan Murphy <dmurphy@ti.com>
Subject: [PATCH v3 9/9] leds: Update the lp55xx to use the multi color framework
Date:   Thu, 23 May 2019 14:08:20 -0500
Message-ID: <20190523190820.29375-10-dmurphy@ti.com>
X-Mailer: git-send-email 2.21.0.5.gaeb582a983
In-Reply-To: <20190523190820.29375-1-dmurphy@ti.com>
References: <20190523190820.29375-1-dmurphy@ti.com>
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
 drivers/leds/leds-lp55xx-common.c         | 133 ++++++++++++++++++----
 drivers/leds/leds-lp55xx-common.h         |  10 ++
 include/linux/platform_data/leds-lp55xx.h |   5 +
 4 files changed, 142 insertions(+), 19 deletions(-)

diff --git a/drivers/leds/leds-lp5523.c b/drivers/leds/leds-lp5523.c
index fd64df5a57a5..dbcc4d100054 100644
--- a/drivers/leds/leds-lp5523.c
+++ b/drivers/leds/leds-lp5523.c
@@ -804,6 +804,18 @@ static ssize_t store_master_fader_leds(struct device *dev,
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
@@ -870,6 +882,7 @@ static struct lp55xx_device_config lp5523_cfg = {
 	.max_channel  = LP5523_MAX_LEDS,
 	.post_init_device   = lp5523_post_init_device,
 	.brightness_fn      = lp5523_led_brightness,
+	.intensity_fn       = lp5523_led_intensity,
 	.set_led_current    = lp5523_set_led_current,
 	.firmware_cb        = lp5523_firmware_loaded,
 	.run_engine         = lp5523_run_engine,
diff --git a/drivers/leds/leds-lp55xx-common.c b/drivers/leds/leds-lp55xx-common.c
index 723f2f17497a..b54fbb8f78c6 100644
--- a/drivers/leds/leds-lp55xx-common.c
+++ b/drivers/leds/leds-lp55xx-common.c
@@ -38,6 +38,11 @@ static struct lp55xx_led *dev_to_lp55xx_led(struct device *dev)
 	return cdev_to_lp55xx_led(dev_get_drvdata(dev));
 }
 
+static struct lp55xx_led *mcdev_to_lp55xx_led(struct led_classdev_mc *mc_dev)
+{
+	return container_of(mc_dev, struct lp55xx_led, mc_cdev);
+}
+
 static void lp55xx_reset_device(struct lp55xx_chip *chip)
 {
 	struct lp55xx_device_config *cfg = chip->cfg;
@@ -141,15 +146,36 @@ static int lp55xx_set_brightness(struct led_classdev *cdev,
 	struct lp55xx_device_config *cfg = led->chip->cfg;
 
 	led->brightness = (u8)brightness;
+
 	return cfg->brightness_fn(led);
 }
 
+static int lp55xx_set_color(struct led_classdev_mc *mcled_cdev,
+			    int color, int value)
+{
+	struct lp55xx_led *led = mcdev_to_lp55xx_led(mcled_cdev);
+	struct lp55xx_device_config *cfg = led->chip->cfg;
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(led->channel_color); i++)
+		if (led->channel_color[i] == color)
+			break;
+
+	led->brightness = (u8)value;
+	return cfg->intensity_fn(led, led->grouped_channels[i]);
+}
+
+static struct led_multicolor_ops lp55xx_mc_ops = {
+	.set_color_brightness = lp55xx_set_color,
+};
+
 static int lp55xx_init_led(struct lp55xx_led *led,
 			struct lp55xx_chip *chip, int chan)
 {
 	struct lp55xx_platform_data *pdata = chip->pdata;
 	struct lp55xx_device_config *cfg = chip->cfg;
 	struct device *dev = &chip->cl->dev;
+	struct led_classdev *led_cdev;
 	char name[32];
 	int ret;
 	int max_channel = cfg->max_channel;
@@ -162,10 +188,39 @@ static int lp55xx_init_led(struct lp55xx_led *led,
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
+		led_cdev = &led->mc_cdev.led_cdev;
+		led_cdev->brightness_set_blocking = lp55xx_set_brightness;
+		led_cdev->name = led->cdev.name;
+		led_cdev->groups = lp55xx_led_groups;
+		led->mc_cdev.ops = &lp55xx_mc_ops;
+		led->mc_cdev.num_leds = pdata->led_config[chan].num_colors;
+		memcpy(led->mc_cdev.available_colors,
+		       pdata->led_config[chan].channel_color,
+		       sizeof(led->mc_cdev.available_colors));
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
@@ -173,18 +228,11 @@ static int lp55xx_init_led(struct lp55xx_led *led,
 		return -EINVAL;
 	}
 
-	led->cdev.brightness_set_blocking = lp55xx_set_brightness;
-	led->cdev.groups = lp55xx_led_groups;
-
-	if (pdata->led_config[chan].name) {
-		led->cdev.name = pdata->led_config[chan].name;
-	} else {
-		snprintf(name, sizeof(name), "%s:channel%d",
-			pdata->label ? : chip->cl->name, chan);
-		led->cdev.name = name;
-	}
+	if (pdata->led_config[chan].num_colors > 1)
+		ret = led_classdev_multicolor_register(dev, &led->mc_cdev);
+	else
+		ret = led_classdev_register(dev, &led->cdev);
 
-	ret = led_classdev_register(dev, &led->cdev);
 	if (ret) {
 		dev_err(dev, "led register err: %d\n", ret);
 		return ret;
@@ -541,6 +589,38 @@ void lp55xx_unregister_sysfs(struct lp55xx_chip *chip)
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
+		ret = of_property_read_u32(child, "reg", &led_number);
+		cfg[chan_num].grouped_channels[num_colors] = led_number;
+		num_colors++;
+	}
+
+	cfg->num_colors = num_colors;
+
+	return 0;
+}
+
 struct lp55xx_platform_data *lp55xx_of_populate_pdata(struct device *dev,
 						      struct device_node *np)
 {
@@ -548,6 +628,8 @@ struct lp55xx_platform_data *lp55xx_of_populate_pdata(struct device *dev,
 	struct lp55xx_platform_data *pdata;
 	struct lp55xx_led_config *cfg;
 	int num_channels;
+	int num_chan_children;
+	u32 led_number;
 	int i = 0;
 
 	pdata = devm_kzalloc(dev, sizeof(*pdata), GFP_KERNEL);
@@ -568,13 +650,26 @@ struct lp55xx_platform_data *lp55xx_of_populate_pdata(struct device *dev,
 	pdata->num_channels = num_channels;
 
 	for_each_child_of_node(np, child) {
-		cfg[i].chan_nr = i;
-
-		of_property_read_string(child, "chan-name", &cfg[i].name);
-		of_property_read_u8(child, "led-cur", &cfg[i].led_current);
-		of_property_read_u8(child, "max-cur", &cfg[i].max_current);
-		cfg[i].default_trigger =
-			of_get_property(child, "linux,default-trigger", NULL);
+		num_chan_children = of_get_child_count(child);
+		if (num_chan_children != 0)
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
index abf1fb5da37d..cd28ec2c78a5 100644
--- a/drivers/leds/leds-lp55xx-common.h
+++ b/drivers/leds/leds-lp55xx-common.h
@@ -15,6 +15,8 @@
 #ifndef _LEDS_LP55XX_COMMON_H
 #define _LEDS_LP55XX_COMMON_H
 
+#include <linux/led-class-multicolor.h>
+
 enum lp55xx_engine_index {
 	LP55XX_ENGINE_INVALID,
 	LP55XX_ENGINE_1,
@@ -112,6 +114,9 @@ struct lp55xx_device_config {
 	/* access brightness register */
 	int (*brightness_fn)(struct lp55xx_led *led);
 
+	/* access brightness register */
+	int (*intensity_fn)(struct lp55xx_led *led, int chan_num);
+
 	/* current setting function */
 	void (*set_led_current) (struct lp55xx_led *led, u8 led_current);
 
@@ -162,6 +167,7 @@ struct lp55xx_chip {
  * struct lp55xx_led
  * @chan_nr         : Channel number
  * @cdev            : LED class device
+ * @mc_cdev	    : Multi color class device
  * @led_current     : Current setting at each led channel
  * @max_current     : Maximun current at each led channel
  * @brightness      : Brightness value
@@ -170,9 +176,13 @@ struct lp55xx_chip {
 struct lp55xx_led {
 	int chan_nr;
 	struct led_classdev cdev;
+	struct led_classdev_mc mc_cdev;
 	u8 led_current;
 	u8 max_current;
 	u8 brightness;
+	int num_colors;
+	int channel_color[10];
+	int grouped_channels[10];
 	struct lp55xx_chip *chip;
 };
 
diff --git a/include/linux/platform_data/leds-lp55xx.h b/include/linux/platform_data/leds-lp55xx.h
index 624ff9edad6f..bde6827f1aea 100644
--- a/include/linux/platform_data/leds-lp55xx.h
+++ b/include/linux/platform_data/leds-lp55xx.h
@@ -15,6 +15,8 @@
 #ifndef _LEDS_LP55XX_H
 #define _LEDS_LP55XX_H
 
+#include <linux/led-class-multicolor.h>
+
 /* Clock configuration */
 #define LP55XX_CLOCK_AUTO	0
 #define LP55XX_CLOCK_INT	1
@@ -26,6 +28,9 @@ struct lp55xx_led_config {
 	u8 chan_nr;
 	u8 led_current; /* mA x10, 0 if led is not connected */
 	u8 max_current;
+	int num_colors;
+	int channel_color[10];
+	int grouped_channels[10];
 };
 
 struct lp55xx_predef_pattern {
-- 
2.21.0.5.gaeb582a983

