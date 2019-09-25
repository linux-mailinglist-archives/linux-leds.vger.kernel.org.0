Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1CB61BE381
	for <lists+linux-leds@lfdr.de>; Wed, 25 Sep 2019 19:41:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2440145AbfIYRlX (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 25 Sep 2019 13:41:23 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:36232 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2443057AbfIYRlX (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 25 Sep 2019 13:41:23 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8PHfHwV037362;
        Wed, 25 Sep 2019 12:41:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1569433277;
        bh=aHsJPa6nLJ1doSiRxJ4VrusIRzoRPKjikt2gv7Z2juw=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=sBWEo76atRukGRRggbhSEGMvrBrA6tAV22eKsMSbiuReEzgMVzOifcwKgx7RFq2Ew
         m0j8pgbMDUSNJiCgnvBgti2tTAlPAmi4lcpQrEZlfjDDv0T4UCer8T1yarMmNGoBMA
         C7lO+2kgS2sKvaFdztBhci6hddVJna5MVgDnnQQ4=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8PHfHol000369
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 25 Sep 2019 12:41:17 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 25
 Sep 2019 12:41:10 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 25 Sep 2019 12:41:17 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8PHfHT8031197;
        Wed, 25 Sep 2019 12:41:17 -0500
From:   Dan Murphy <dmurphy@ti.com>
To:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>
CC:     <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Dan Murphy <dmurphy@ti.com>
Subject: [PATCH v9 13/15] leds: lp55xx: Update the lp55xx to use the multi color framework
Date:   Wed, 25 Sep 2019 12:46:14 -0500
Message-ID: <20190925174616.3714-14-dmurphy@ti.com>
X-Mailer: git-send-email 2.22.0.214.g8dca754b1e
In-Reply-To: <20190925174616.3714-1-dmurphy@ti.com>
References: <20190925174616.3714-1-dmurphy@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Update the lp5523 to allow the use of the multi color framework.

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 drivers/leds/Kconfig                      |   1 +
 drivers/leds/leds-lp5523.c                |  13 ++
 drivers/leds/leds-lp55xx-common.c         | 150 ++++++++++++++++++----
 drivers/leds/leds-lp55xx-common.h         |  11 ++
 include/linux/platform_data/leds-lp55xx.h |   6 +
 5 files changed, 157 insertions(+), 24 deletions(-)

diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index 84f60e35c5ee..dc3d9f2194cd 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -377,6 +377,7 @@ config LEDS_LP50XX
 config LEDS_LP55XX_COMMON
 	tristate "Common Driver for TI/National LP5521/5523/55231/5562/8501"
 	depends on LEDS_LP5521 || LEDS_LP5523 || LEDS_LP5562 || LEDS_LP8501
+	depends on LEDS_CLASS_MULTI_COLOR && OF
 	select FW_LOADER
 	select FW_LOADER_USER_HELPER
 	help
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
index 44ced02b49f9..0e4b3a9d3047 100644
--- a/drivers/leds/leds-lp55xx-common.c
+++ b/drivers/leds/leds-lp55xx-common.c
@@ -136,9 +136,26 @@ static int lp55xx_set_brightness(struct led_classdev *cdev,
 {
 	struct lp55xx_led *led = cdev_to_lp55xx_led(cdev);
 	struct lp55xx_device_config *cfg = led->chip->cfg;
+	int brightness_val[LP55XX_MAX_GROUPED_CHAN];
+	int ret;
+	int i;
+
+	if (led->mc_cdev.num_leds > 1) {
+		led_mc_calc_brightness(&led->mc_cdev,
+				       brightness, brightness_val);
+		for (i = 0; i < led->mc_cdev.num_leds; i++) {
+			led->brightness = brightness_val[i];
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
@@ -159,10 +176,37 @@ static int lp55xx_init_led(struct lp55xx_led *led,
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
+		memcpy(led->channel_color,
+		       pdata->led_config[chan].channel_color,
+		       sizeof(led->channel_color));
+		memcpy(led->grouped_channels,
+		       pdata->led_config[chan].grouped_channels,
+		       sizeof(led->grouped_channels));
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
@@ -170,18 +214,11 @@ static int lp55xx_init_led(struct lp55xx_led *led,
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
@@ -466,7 +503,6 @@ int lp55xx_register_leds(struct lp55xx_led *led, struct lp55xx_chip *chip)
 		dev_err(&chip->cl->dev, "empty brightness configuration\n");
 		return -EINVAL;
 	}
-
 	for (i = 0; i < num_channels; i++) {
 
 		/* do not initialize channels that are not connected */
@@ -538,6 +574,76 @@ void lp55xx_unregister_sysfs(struct lp55xx_chip *chip)
 }
 EXPORT_SYMBOL_GPL(lp55xx_unregister_sysfs);
 
+static int lp5xx_parse_common_child(struct device_node *np,
+				     struct lp55xx_led_config *cfg,
+				     int chan_num, bool is_multicolor)
+{
+	u32 led_number;
+	int ret;
+
+	of_property_read_string(np, "chan-name",
+				&cfg[chan_num].name);
+	of_property_read_u8(np, "led-cur",
+			    &cfg[chan_num].led_current);
+	of_property_read_u8(np, "max-cur",
+			    &cfg[chan_num].max_current);
+
+	ret = of_property_read_u32(np, "reg", &led_number);
+	if (ret)
+		return ret;
+
+	if (led_number < 0 || led_number > 6)
+		return -EINVAL;
+
+	if (is_multicolor)
+		cfg[chan_num].grouped_channels[cfg[chan_num].num_colors]
+				= led_number;
+	else
+		cfg[chan_num].chan_nr = led_number;
+
+	return 0;
+}
+
+static int lp5xx_parse_channel_child(struct device_node *np,
+				     struct lp55xx_led_config *cfg,
+				     int child_number)
+{
+	struct device_node *child;
+	int channel_color;
+	u32 color_id;
+	int ret;
+
+	cfg[child_number].default_trigger =
+			of_get_property(np, "linux,default-trigger", NULL);
+
+	ret = of_property_read_u32(np, "color", &channel_color);
+	if (ret)
+		channel_color = ret;
+
+
+	if (channel_color == LED_COLOR_ID_MULTI) {
+		for_each_child_of_node(np, child) {
+			ret = lp5xx_parse_common_child(child, cfg,
+						       child_number, true);
+			if (ret)
+				return ret;
+			ret = of_property_read_u32(child, "color", &color_id);
+			if (ret)
+				return ret;
+
+			cfg[child_number].channel_color[cfg[child_number].num_colors] =
+				color_id;
+			set_bit(color_id, &cfg[child_number].available_colors);
+
+			cfg[child_number].num_colors++;
+		}
+	} else {
+		return lp5xx_parse_common_child(np, cfg, child_number, false);
+	}
+
+	return 0;
+}
+
 struct lp55xx_platform_data *lp55xx_of_populate_pdata(struct device *dev,
 						      struct device_node *np)
 {
@@ -546,6 +652,7 @@ struct lp55xx_platform_data *lp55xx_of_populate_pdata(struct device *dev,
 	struct lp55xx_led_config *cfg;
 	int num_channels;
 	int i = 0;
+	int ret;
 
 	pdata = devm_kzalloc(dev, sizeof(*pdata), GFP_KERNEL);
 	if (!pdata)
@@ -565,14 +672,9 @@ struct lp55xx_platform_data *lp55xx_of_populate_pdata(struct device *dev,
 	pdata->num_channels = num_channels;
 
 	for_each_child_of_node(np, child) {
-		cfg[i].chan_nr = i;
-
-		of_property_read_string(child, "chan-name", &cfg[i].name);
-		of_property_read_u8(child, "led-cur", &cfg[i].led_current);
-		of_property_read_u8(child, "max-cur", &cfg[i].max_current);
-		cfg[i].default_trigger =
-			of_get_property(child, "linux,default-trigger", NULL);
-
+		ret = lp5xx_parse_channel_child(child, cfg, i);
+		if (ret)
+			return ERR_PTR(-EINVAL);
 		i++;
 	}
 
diff --git a/drivers/leds/leds-lp55xx-common.h b/drivers/leds/leds-lp55xx-common.h
index 783ed5103ce5..d93813a72ec1 100644
--- a/drivers/leds/leds-lp55xx-common.h
+++ b/drivers/leds/leds-lp55xx-common.h
@@ -12,6 +12,10 @@
 #ifndef _LEDS_LP55XX_COMMON_H
 #define _LEDS_LP55XX_COMMON_H
 
+#include <linux/led-class-multicolor.h>
+
+#define LP55XX_MAX_GROUPED_CHAN	4
+
 enum lp55xx_engine_index {
 	LP55XX_ENGINE_INVALID,
 	LP55XX_ENGINE_1,
@@ -109,6 +113,9 @@ struct lp55xx_device_config {
 	/* access brightness register */
 	int (*brightness_fn)(struct lp55xx_led *led);
 
+	/* access specific brightness register */
+	int (*color_intensity_fn)(struct lp55xx_led *led, int chan_num);
+
 	/* current setting function */
 	void (*set_led_current) (struct lp55xx_led *led, u8 led_current);
 
@@ -159,6 +166,7 @@ struct lp55xx_chip {
  * struct lp55xx_led
  * @chan_nr         : Channel number
  * @cdev            : LED class device
+ * @mc_cdev	    : Multi color class device
  * @led_current     : Current setting at each led channel
  * @max_current     : Maximun current at each led channel
  * @brightness      : Brightness value
@@ -167,9 +175,12 @@ struct lp55xx_chip {
 struct lp55xx_led {
 	int chan_nr;
 	struct led_classdev cdev;
+	struct led_classdev_mc mc_cdev;
 	u8 led_current;
 	u8 max_current;
 	u8 brightness;
+	int channel_color[LP55XX_MAX_GROUPED_CHAN];
+	int grouped_channels[LP55XX_MAX_GROUPED_CHAN];
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

