Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7FE35D025C
	for <lists+linux-leds@lfdr.de>; Tue,  8 Oct 2019 22:48:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731173AbfJHUs1 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 8 Oct 2019 16:48:27 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:45054 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731138AbfJHUs0 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 8 Oct 2019 16:48:26 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x98KmMlS092704;
        Tue, 8 Oct 2019 15:48:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1570567702;
        bh=+q0t9yIqoXldgQgmx1v5usIYhNbt//7Lyrd4aFmtnyk=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=XGGpgL9TveEx/HptuRJL25GumD1iO7r17Sl9RuefuszO4XuGJJDuU7DZ3Kbfar5ra
         rRBhf4sPzwhRbLYk58p5ZvC2aeUIyUSowZfwkB+N+vd0QsaTYm04OGmQnW1zL0TcKa
         rDEj+b+E6Z9e5yA1IUjkqyg8PWZTbif2KbWCJDB0=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x98KmM5S042370
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 8 Oct 2019 15:48:22 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 8 Oct
 2019 15:48:18 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 8 Oct 2019 15:48:21 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x98KmLCc095754;
        Tue, 8 Oct 2019 15:48:21 -0500
From:   Dan Murphy <dmurphy@ti.com>
To:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>
CC:     <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Dan Murphy <dmurphy@ti.com>
Subject: [PATCH v11 12/16] leds: lp55xx: Add multicolor framework support to lp55xx
Date:   Tue, 8 Oct 2019 15:47:56 -0500
Message-ID: <20191008204800.19870-13-dmurphy@ti.com>
X-Mailer: git-send-email 2.22.0.214.g8dca754b1e
In-Reply-To: <20191008204800.19870-1-dmurphy@ti.com>
References: <20191008204800.19870-1-dmurphy@ti.com>
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
 drivers/leds/leds-lp55xx-common.c         | 176 +++++++++++++++++++---
 drivers/leds/leds-lp55xx-common.h         |  11 ++
 include/linux/platform_data/leds-lp55xx.h |   5 +
 4 files changed, 169 insertions(+), 24 deletions(-)

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
diff --git a/drivers/leds/leds-lp55xx-common.c b/drivers/leds/leds-lp55xx-common.c
index 44ced02b49f9..85629f836082 100644
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
+		if (!cfg->color_intensity_fn)
+			return -EINVAL;
+
+		led_mc_calc_brightness(&led->mc_cdev, brightness,
+				       color_component);
+
+		for (i = 0; i < led->mc_cdev.num_leds; i++) {
+			ret = lp55xx_map_channel(led,
+						color_component[i].color_id,
+						color_component[i].brightness);
+			if (ret)
+				return ret;
+		}
+
+		ret = cfg->color_intensity_fn(led);
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
@@ -466,7 +523,6 @@ int lp55xx_register_leds(struct lp55xx_led *led, struct lp55xx_chip *chip)
 		dev_err(&chip->cl->dev, "empty brightness configuration\n");
 		return -EINVAL;
 	}
-
 	for (i = 0; i < num_channels; i++) {
 
 		/* do not initialize channels that are not connected */
@@ -538,6 +594,82 @@ void lp55xx_unregister_sysfs(struct lp55xx_chip *chip)
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
@@ -546,6 +678,7 @@ struct lp55xx_platform_data *lp55xx_of_populate_pdata(struct device *dev,
 	struct lp55xx_led_config *cfg;
 	int num_channels;
 	int i = 0;
+	int ret;
 
 	pdata = devm_kzalloc(dev, sizeof(*pdata), GFP_KERNEL);
 	if (!pdata)
@@ -565,14 +698,9 @@ struct lp55xx_platform_data *lp55xx_of_populate_pdata(struct device *dev,
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
index 783ed5103ce5..55d420f704d1 100644
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
+	int (*color_intensity_fn)(struct lp55xx_led *led);
+
 	/* current setting function */
 	void (*set_led_current) (struct lp55xx_led *led, u8 led_current);
 
@@ -159,6 +166,8 @@ struct lp55xx_chip {
  * struct lp55xx_led
  * @chan_nr         : Channel number
  * @cdev            : LED class device
+ * @mc_cdev	    : Multi color class device
+ * @color_component : Multi color LED map information
  * @led_current     : Current setting at each led channel
  * @max_current     : Maximun current at each led channel
  * @brightness      : Brightness value
@@ -167,6 +176,8 @@ struct lp55xx_chip {
 struct lp55xx_led {
 	int chan_nr;
 	struct led_classdev cdev;
+	struct led_classdev_mc mc_cdev;
+	struct led_mc_color_conversion color_component[LP55XX_MAX_GROUPED_CHAN];
 	u8 led_current;
 	u8 max_current;
 	u8 brightness;
diff --git a/include/linux/platform_data/leds-lp55xx.h b/include/linux/platform_data/leds-lp55xx.h
index 96a787100fda..1e7a25ed9a87 100644
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
@@ -23,6 +25,9 @@ struct lp55xx_led_config {
 	u8 chan_nr;
 	u8 led_current; /* mA x10, 0 if led is not connected */
 	u8 max_current;
+	int num_colors;
+	unsigned long available_colors;
+	struct led_mc_color_conversion color_component[LED_COLOR_ID_MAX];
 };
 
 struct lp55xx_predef_pattern {
-- 
2.22.0.214.g8dca754b1e

