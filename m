Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E498AD963A
	for <lists+linux-leds@lfdr.de>; Wed, 16 Oct 2019 18:01:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727903AbfJPQBS (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 16 Oct 2019 12:01:18 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:41864 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2393152AbfJPQAe (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 16 Oct 2019 12:00:34 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9GG0Wsq121876;
        Wed, 16 Oct 2019 11:00:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1571241632;
        bh=8BbI2lkHOPecjsmGV6ngoeBWZeqjeU+7lv9OXGTJiGs=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=P2ohqSxUrxSA1t+H1rtqI6gbnoA6BuJN4SpuyxutMPUHiaF1CabCEcSvQ9+ApOHTH
         suiKc+RNVoLqZFwkT5tx3QOLqTkAvXT/reaGfMES9g2YsTtchXGIK3H40ro0tKikdm
         s0tjhP7CNNzIXB6LjZrT5sF77etROyDhpa6FDoNc=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9GG0WoI094847
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 16 Oct 2019 11:00:32 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 16
 Oct 2019 11:00:24 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 16 Oct 2019 11:00:31 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9GG0Vwh043141;
        Wed, 16 Oct 2019 11:00:31 -0500
From:   Dan Murphy <dmurphy@ti.com>
To:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>
CC:     <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Dan Murphy <dmurphy@ti.com>
Subject: [PATCH v13 13/18] leds: lp55xx: Add multicolor framework support to lp55xx
Date:   Wed, 16 Oct 2019 10:59:49 -0500
Message-ID: <20191016155954.29044-14-dmurphy@ti.com>
X-Mailer: git-send-email 2.22.0.214.g8dca754b1e
In-Reply-To: <20191016155954.29044-1-dmurphy@ti.com>
References: <20191016155954.29044-1-dmurphy@ti.com>
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
 drivers/leds/Kconfig                      |   2 +
 drivers/leds/leds-lp55xx-common.c         | 175 +++++++++++++++++++---
 drivers/leds/leds-lp55xx-common.h         |   9 ++
 include/linux/platform_data/leds-lp55xx.h |   7 +
 4 files changed, 170 insertions(+), 23 deletions(-)

diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index fb614a6b9afa..a121a2855c06 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -377,8 +377,10 @@ config LEDS_LP50XX
 config LEDS_LP55XX_COMMON
 	tristate "Common Driver for TI/National LP5521/5523/55231/5562/8501"
 	depends on LEDS_LP5521 || LEDS_LP5523 || LEDS_LP5562 || LEDS_LP8501
+	depends on OF
 	select FW_LOADER
 	select FW_LOADER_USER_HELPER
+	select LEDS_CLASS_MULTI_COLOR
 	help
 	  This option supports common operations for LP5521/5523/55231/5562/8501
 	  devices.
diff --git a/drivers/leds/leds-lp55xx-common.c b/drivers/leds/leds-lp55xx-common.c
index 824d1d73dde1..026ebc2f8e18 100644
--- a/drivers/leds/leds-lp55xx-common.c
+++ b/drivers/leds/leds-lp55xx-common.c
@@ -131,14 +131,54 @@ static struct attribute *lp55xx_led_attrs[] = {
 };
 ATTRIBUTE_GROUPS(lp55xx_led);
 
+static int lp55xx_map_channel(struct lp55xx_led *led, int color_id,
+			      enum led_brightness brightness)
+{
+	int i;
+
+	for (i = 0; i < led->mc_cdev.num_leds; i++) {
+		if (led->color_component[i].color_id == color_id) {
+			led->color_component[i].brightness = brightness;
+			return 0;
+		}
+	}
+
+	return -EINVAL;
+}
+
 static int lp55xx_set_brightness(struct led_classdev *cdev,
 			     enum led_brightness brightness)
 {
+	struct led_mc_color_conversion color_component[LP55XX_MAX_GROUPED_CHAN];
 	struct lp55xx_led *led = cdev_to_lp55xx_led(cdev);
 	struct lp55xx_device_config *cfg = led->chip->cfg;
+	int ret;
+	int i;
 
-	led->brightness = (u8)brightness;
-	return cfg->brightness_fn(led);
+	if (led->mc_cdev.num_leds > 1) {
+		if (!cfg->multicolor_brightness_fn)
+			return -EINVAL;
+
+		led_mc_calc_color_components(&led->mc_cdev, brightness,
+					     color_component);
+
+		for (i = 0; i < led->mc_cdev.num_leds; i++) {
+			ret = lp55xx_map_channel(led,
+						color_component[i].color_id,
+						color_component[i].brightness);
+			if (ret)
+				return ret;
+		}
+
+		ret = cfg->multicolor_brightness_fn(led);
+		if (ret)
+			return ret;
+	} else {
+		led->brightness = (u8)brightness;
+		ret = cfg->brightness_fn(led);
+	}
+
+	return ret;
 }
 
 static int lp55xx_init_led(struct lp55xx_led *led,
@@ -147,9 +187,9 @@ static int lp55xx_init_led(struct lp55xx_led *led,
 	struct lp55xx_platform_data *pdata = chip->pdata;
 	struct lp55xx_device_config *cfg = chip->cfg;
 	struct device *dev = &chip->cl->dev;
+	int max_channel = cfg->max_channel;
 	char name[32];
 	int ret;
-	int max_channel = cfg->max_channel;
 
 	if (chan >= max_channel) {
 		dev_err(dev, "invalid channel: %d / %d\n", chan, max_channel);
@@ -159,10 +199,34 @@ static int lp55xx_init_led(struct lp55xx_led *led,
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
+		memcpy(led->color_component,
+		       pdata->led_config[chan].color_component,
+		       sizeof(led->color_component));
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
@@ -170,18 +234,11 @@ static int lp55xx_init_led(struct lp55xx_led *led,
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
@@ -538,6 +595,82 @@ void lp55xx_unregister_sysfs(struct lp55xx_chip *chip)
 }
 EXPORT_SYMBOL_GPL(lp55xx_unregister_sysfs);
 
+static int lp5xx_parse_common_child(struct device_node *np,
+				    struct lp55xx_led_config *cfg,
+				    int chan_num, bool is_multicolor,
+				    int color_num)
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
+		cfg[chan_num].color_component[color_num].output_num =
+								led_number;
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
+	int num_colors = 0;
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
+						       child_number, true,
+						       num_colors);
+			if (ret)
+				return ret;
+
+			ret = of_property_read_u32(child, "color", &color_id);
+			if (ret)
+				return ret;
+
+			cfg[child_number].color_component[num_colors].color_id =
+						color_id;
+			set_bit(color_id, &cfg[child_number].available_colors);
+			num_colors++;
+		}
+
+		cfg[child_number].num_colors = num_colors;
+	} else {
+		return lp5xx_parse_common_child(np, cfg, child_number, false,
+						num_colors);
+	}
+
+	return 0;
+}
+
 struct lp55xx_platform_data *lp55xx_of_populate_pdata(struct device *dev,
 						      struct device_node *np)
 {
@@ -546,6 +679,7 @@ struct lp55xx_platform_data *lp55xx_of_populate_pdata(struct device *dev,
 	struct lp55xx_led_config *cfg;
 	int num_channels;
 	int i = 0;
+	int ret;
 
 	pdata = devm_kzalloc(dev, sizeof(*pdata), GFP_KERNEL);
 	if (!pdata)
@@ -565,14 +699,9 @@ struct lp55xx_platform_data *lp55xx_of_populate_pdata(struct device *dev,
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
index 783ed5103ce5..bf68b8a78930 100644
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
+ * @color_component : Multi color LED map information
  * @led_current     : Current setting at each led channel
  * @max_current     : Maximun current at each led channel
  * @brightness      : Brightness value
@@ -167,6 +174,8 @@ struct lp55xx_chip {
 struct lp55xx_led {
 	int chan_nr;
 	struct led_classdev cdev;
+	struct led_classdev_mc mc_cdev;
+	struct led_mc_color_conversion color_component[LP55XX_MAX_GROUPED_CHAN];
 	u8 led_current;
 	u8 max_current;
 	u8 brightness;
diff --git a/include/linux/platform_data/leds-lp55xx.h b/include/linux/platform_data/leds-lp55xx.h
index 96a787100fda..0f9b88019c18 100644
--- a/include/linux/platform_data/leds-lp55xx.h
+++ b/include/linux/platform_data/leds-lp55xx.h
@@ -12,17 +12,24 @@
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
+	unsigned long available_colors;
+	struct led_mc_color_conversion color_component[LP55XX_MAX_GROUPED_CHAN];
 };
 
 struct lp55xx_predef_pattern {
-- 
2.22.0.214.g8dca754b1e

