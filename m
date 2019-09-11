Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7EF02B0338
	for <lists+linux-leds@lfdr.de>; Wed, 11 Sep 2019 20:01:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729753AbfIKSBZ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 11 Sep 2019 14:01:25 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:36758 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729794AbfIKSBY (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 11 Sep 2019 14:01:24 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8BI1JHT040469;
        Wed, 11 Sep 2019 13:01:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1568224879;
        bh=coD1uOdxeWd8XAcB+R0bOihiQUQwg0Kf1020vJsHpZg=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=t/vtKpftOUya76eG8Tur4ApoLK6nFIe9b8k+kx8k+oAG/+K1ltw70M02/KgVGMIdU
         c1tm7itEAgffKREwNVvEPZBScHhsMMfvUzLC7A/yfZSEJ/Pf+buSElqJLD/jJJa16u
         MaAadTjK6FuSvTPCM9jV0PvjRFeWdPS/xJEntp2w=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8BI1Jvf043774
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 11 Sep 2019 13:01:19 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 11
 Sep 2019 13:01:18 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 11 Sep 2019 13:01:18 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8BI1IjE011148;
        Wed, 11 Sep 2019 13:01:18 -0500
From:   Dan Murphy <dmurphy@ti.com>
To:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>
CC:     <robh+dt@kernel.org>, <linux-leds@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Dan Murphy <dmurphy@ti.com>
Subject: [PATCH v5 9/9] leds: Update the lp55xx to use the multi color framework
Date:   Wed, 11 Sep 2019 13:01:15 -0500
Message-ID: <20190911180115.21035-10-dmurphy@ti.com>
X-Mailer: git-send-email 2.22.0.214.g8dca754b1e
In-Reply-To: <20190911180115.21035-1-dmurphy@ti.com>
References: <20190911180115.21035-1-dmurphy@ti.com>
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
 modules.builtin.modinfo                   | Bin 0 -> 43550 bytes
 5 files changed, 137 insertions(+), 22 deletions(-)
 create mode 100644 modules.builtin.modinfo

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
index 44ced02b49f9..8408d625f8da 100644
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
+		led_mc_set_cluster_brightness(&led->mc_cdev,
+					      brightness, adj_value);
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
diff --git a/modules.builtin.modinfo b/modules.builtin.modinfo
new file mode 100644
index 0000000000000000000000000000000000000000..e528d8f57796621b6cfef52ad0da44551a482481
GIT binary patch
literal 43550
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

literal 0
HcmV?d00001

-- 
2.22.0.214.g8dca754b1e

