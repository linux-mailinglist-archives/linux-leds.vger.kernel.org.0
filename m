Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BDBFE61CEB
	for <lists+linux-leds@lfdr.de>; Mon,  8 Jul 2019 12:27:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730089AbfGHK1U (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 8 Jul 2019 06:27:20 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:56740 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730085AbfGHK1U (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 8 Jul 2019 06:27:20 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x68ARCKE001167;
        Mon, 8 Jul 2019 05:27:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1562581632;
        bh=rsEOI56jQUV/QiIXLNiFABw3GYyB7YCOM03aYJBNebY=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=IwE43AKX9lENFZKxTVI+asaWNv6oN5tvkv2zblXfDyurPb5Tzh3BpD8bm72fZGhTA
         b7TCwgR/y86wDVYE5di5om/pudSqGB+SaA+JteRViAeFwpCWlW2Z70SBVy26MJmpo4
         osKDYo9MlhIMMDpeEOJ+g5zEt0nn1hNjHfjvKCbQ=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x68ARCXK067712
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 8 Jul 2019 05:27:12 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 8 Jul
 2019 05:27:12 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 8 Jul 2019 05:27:12 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x68ARBBD074756;
        Mon, 8 Jul 2019 05:27:11 -0500
From:   Jean-Jacques Hiblot <jjhiblot@ti.com>
To:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>, <robh+dt@kernel.org>,
        <mark.rutland@arm.com>, <lee.jones@linaro.org>,
        <daniel.thompson@linaro.org>, <jingoohan1@gmail.com>
CC:     <dmurphy@ti.com>, <linux-leds@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <tomi.valkeinen@ti.com>, Jean-Jacques Hiblot <jjhiblot@ti.com>
Subject: [PATCH v2 4/4] backlight: add led-backlight driver
Date:   Mon, 8 Jul 2019 12:27:00 +0200
Message-ID: <20190708102700.23138-5-jjhiblot@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190708102700.23138-1-jjhiblot@ti.com>
References: <20190708102700.23138-1-jjhiblot@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

From: Tomi Valkeinen <tomi.valkeinen@ti.com>

This patch adds a led-backlight driver (led_bl), which is similar to
pwm_bl except the driver uses a LED class driver to adjust the
brightness in the HW. Multiple LEDs can be used for a single backlight.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
Signed-off-by: Jean-Jacques Hiblot <jjhiblot@ti.com>
---
 drivers/video/backlight/Kconfig  |   7 +
 drivers/video/backlight/Makefile |   1 +
 drivers/video/backlight/led_bl.c | 235 +++++++++++++++++++++++++++++++
 3 files changed, 243 insertions(+)
 create mode 100644 drivers/video/backlight/led_bl.c

diff --git a/drivers/video/backlight/Kconfig b/drivers/video/backlight/Kconfig
index 8b081d61773e..585a1787618c 100644
--- a/drivers/video/backlight/Kconfig
+++ b/drivers/video/backlight/Kconfig
@@ -458,6 +458,13 @@ config BACKLIGHT_RAVE_SP
 	help
 	  Support for backlight control on RAVE SP device.
 
+config BACKLIGHT_LED
+	tristate "Generic LED based Backlight Driver"
+	depends on LEDS_CLASS && OF
+	help
+	  If you have a LCD backlight adjustable by LED class driver, say Y
+	  to enable this driver.
+
 endif # BACKLIGHT_CLASS_DEVICE
 
 endmenu
diff --git a/drivers/video/backlight/Makefile b/drivers/video/backlight/Makefile
index 63c507c07437..2a67642966a5 100644
--- a/drivers/video/backlight/Makefile
+++ b/drivers/video/backlight/Makefile
@@ -57,3 +57,4 @@ obj-$(CONFIG_BACKLIGHT_TPS65217)	+= tps65217_bl.o
 obj-$(CONFIG_BACKLIGHT_WM831X)		+= wm831x_bl.o
 obj-$(CONFIG_BACKLIGHT_ARCXCNN) 	+= arcxcnn_bl.o
 obj-$(CONFIG_BACKLIGHT_RAVE_SP)		+= rave-sp-backlight.o
+obj-$(CONFIG_BACKLIGHT_LED)		+= led_bl.o
diff --git a/drivers/video/backlight/led_bl.c b/drivers/video/backlight/led_bl.c
new file mode 100644
index 000000000000..7644277cfdbb
--- /dev/null
+++ b/drivers/video/backlight/led_bl.c
@@ -0,0 +1,235 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2015-2019 Texas Instruments Incorporated -  http://www.ti.com/
+ * Author: Tomi Valkeinen <tomi.valkeinen@ti.com>
+ *
+ * Based on pwm_bl.c
+ */
+
+#include <linux/backlight.h>
+#include <linux/gpio/consumer.h>
+#include <linux/leds.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+
+#define BKL_FULL_BRIGHTNESS 255
+
+struct led_bl_data {
+	struct device		*dev;
+	struct backlight_device	*bl_dev;
+	struct led_classdev	**leds;
+	bool			enabled;
+	int			nb_leds;
+	unsigned int		*levels;
+	unsigned int		default_brightness;
+	unsigned int		max_brightness;
+};
+
+static int to_led_brightness(struct led_classdev *led, int value)
+{
+	return (value * led->max_brightness) / BKL_FULL_BRIGHTNESS;
+}
+
+static void led_bl_set_brightness(struct led_bl_data *priv, int level)
+{
+	int i;
+	int bkl_brightness;
+
+	if (priv->levels)
+		bkl_brightness = priv->levels[level];
+	else
+		bkl_brightness = level;
+
+	for (i = 0; i < priv->nb_leds; i++) {
+		int led_brightness;
+		struct led_classdev *led = priv->leds[i];
+
+		led_brightness = to_led_brightness(led, bkl_brightness);
+		led_set_brightness(led, led_brightness);
+	}
+
+	priv->enabled = true;
+}
+
+static void led_bl_power_off(struct led_bl_data *priv)
+{
+	int i;
+
+	if (!priv->enabled)
+		return;
+
+	for (i = 0; i < priv->nb_leds; i++)
+		led_set_brightness(priv->leds[i], LED_OFF);
+
+	priv->enabled = false;
+}
+
+static int led_bl_update_status(struct backlight_device *bl)
+{
+	struct led_bl_data *priv = bl_get_data(bl);
+	int brightness = bl->props.brightness;
+
+	if (bl->props.power != FB_BLANK_UNBLANK ||
+	    bl->props.fb_blank != FB_BLANK_UNBLANK ||
+	    bl->props.state & BL_CORE_FBBLANK)
+		brightness = 0;
+
+	if (brightness > 0)
+		led_bl_set_brightness(priv, brightness);
+	else
+		led_bl_power_off(priv);
+
+	return 0;
+}
+
+static const struct backlight_ops led_bl_ops = {
+	.update_status	= led_bl_update_status,
+};
+
+static int led_bl_parse_dt(struct device *dev,
+			   struct led_bl_data *priv)
+{
+	struct device_node *node = dev->of_node;
+	int num_levels;
+	u32 *levels = NULL;
+	u32 value;
+	int ret;
+	bool use_default_levels = false;
+
+	if (!node)
+		return -ENODEV;
+
+	num_levels = of_property_count_u32_elems(node, "brightness-levels");
+	if (num_levels < 0) {
+		dev_warn(dev, "can't get brightness-levels. using default levels\n");
+		use_default_levels = true;
+		num_levels = BKL_FULL_BRIGHTNESS + 1;
+	}
+
+	if (!use_default_levels) {
+		levels = devm_kzalloc(dev, sizeof(u32) * num_levels,
+				      GFP_KERNEL);
+		if (!levels)
+			return -ENOMEM;
+
+		ret = of_property_read_u32_array(node, "brightness-levels",
+						levels,
+						num_levels);
+		if (ret < 0)
+			return ret;
+	}
+
+	ret = of_property_read_u32(node, "default-brightness-level", &value);
+	if (ret < 0)
+		value = num_levels / 2;
+
+	if (value >= num_levels) {
+		dev_warn(dev, "invalid default-brightness-level. using default\n");
+		value = num_levels / 2;
+	}
+
+	ret = of_count_phandle_with_args(node, "leds", NULL);
+	if (ret < 0) {
+		dev_err(dev, "unable to get led count\n");
+		return -EINVAL;
+	}
+
+	priv->nb_leds = ret;
+	if (priv->nb_leds < 1) {
+		dev_err(dev, "At least one LED must be specified!\n");
+		return -EINVAL;
+	}
+
+	priv->levels = levels;
+	priv->max_brightness = num_levels - 1;
+	priv->default_brightness = value;
+
+	return 0;
+}
+
+static int led_bl_probe(struct platform_device *pdev)
+{
+	struct backlight_properties props;
+	struct led_bl_data *priv;
+	int ret;
+	int i;
+
+	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	platform_set_drvdata(pdev, priv);
+
+	priv->dev = &pdev->dev;
+
+	ret = led_bl_parse_dt(&pdev->dev, priv);
+	if (ret < 0) {
+		dev_err(&pdev->dev, "failed to parse DT data\n");
+		return ret;
+	}
+	priv->leds = devm_kzalloc(&pdev->dev,
+				  sizeof(struct led_classdev *) * priv->nb_leds,
+				  GFP_KERNEL);
+	if (!priv->leds)
+		return -ENOMEM;
+
+	for (i = 0; i < priv->nb_leds; i++) {
+		priv->leds[i] = devm_led_get(&pdev->dev, i);
+		if (IS_ERR(priv->leds[i]))
+			return PTR_ERR(priv->leds[i]);
+	}
+
+	memset(&props, 0, sizeof(struct backlight_properties));
+	props.type = BACKLIGHT_RAW;
+	props.max_brightness = priv->max_brightness;
+	priv->bl_dev = backlight_device_register(dev_name(&pdev->dev),
+			&pdev->dev, priv, &led_bl_ops, &props);
+	if (IS_ERR(priv->bl_dev)) {
+		dev_err(&pdev->dev, "failed to register backlight\n");
+		ret = PTR_ERR(priv->bl_dev);
+		goto err;
+	}
+
+	priv->bl_dev->props.brightness = priv->default_brightness;
+	backlight_update_status(priv->bl_dev);
+
+	return 0;
+
+err:
+	return ret;
+}
+
+static int led_bl_remove(struct platform_device *pdev)
+{
+	struct led_bl_data *priv = platform_get_drvdata(pdev);
+	struct backlight_device *bl = priv->bl_dev;
+
+	backlight_device_unregister(bl);
+
+	led_bl_power_off(priv);
+
+	return 0;
+}
+
+static const struct of_device_id led_bl_of_match[] = {
+	{ .compatible = "led-backlight" },
+	{ }
+};
+
+MODULE_DEVICE_TABLE(of, led_bl_of_match);
+
+static struct platform_driver led_bl_driver = {
+	.driver		= {
+		.name		= "led-backlight",
+		.of_match_table	= of_match_ptr(led_bl_of_match),
+	},
+	.probe		= led_bl_probe,
+	.remove		= led_bl_remove,
+};
+
+module_platform_driver(led_bl_driver);
+
+MODULE_DESCRIPTION("LED based Backlight Driver");
+MODULE_LICENSE("GPL");
+MODULE_ALIAS("platform:led-backlight");
-- 
2.17.1

