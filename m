Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9D70F5BF63
	for <lists+linux-leds@lfdr.de>; Mon,  1 Jul 2019 17:16:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730214AbfGAPOm (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 1 Jul 2019 11:14:42 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:53868 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730208AbfGAPOm (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 1 Jul 2019 11:14:42 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x61FEVL0084346;
        Mon, 1 Jul 2019 10:14:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1561994071;
        bh=UPVLwiiF/QJ52gzM7BCswJcz/5sU+K2QOlt4pm8nu90=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=Ydn/br+g3vvC58ptwJVlrKLQ4WdkfTKLowky0DdRdtIdxq3kunMcv/qjzXS0qDyMZ
         Qj/iury9uxyy1MD0RqBq1qPwuwSMKnmv7W44z/2Om0M3rEu1H2vkKhq5GFUbNGmqcm
         fyh3Zv/ZQi3s8Cy1FuefFi/xiD1ptpwl1AnD8C/M=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x61FEUG1106616
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 1 Jul 2019 10:14:31 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 1 Jul
 2019 10:14:30 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 1 Jul 2019 10:14:30 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x61FETjF067739;
        Mon, 1 Jul 2019 10:14:30 -0500
From:   Jean-Jacques Hiblot <jjhiblot@ti.com>
To:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>, <robh+dt@kernel.org>,
        <mark.rutland@arm.com>, <lee.jones@linaro.org>,
        <daniel.thompson@linaro.org>, <jingoohan1@gmail.com>
CC:     <dmurphy@ti.com>, <linux-leds@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <tomi.valkeinen@ti.com>, Jean-Jacques Hiblot <jjhiblot@ti.com>
Subject: [PATCH 3/4] backlight: add led-backlight driver
Date:   Mon, 1 Jul 2019 17:14:22 +0200
Message-ID: <20190701151423.30768-4-jjhiblot@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190701151423.30768-1-jjhiblot@ti.com>
References: <20190701151423.30768-1-jjhiblot@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

From: Tomi Valkeinen <tomi.valkeinen@ti.com>

This patch adds a led-backlight driver (led_bl), which is mostly similar to
pwm_bl except the driver uses a LED class driver to adjust the brightness
in the HW.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
Signed-off-by: Jean-Jacques Hiblot <jjhiblot@ti.com>
---
 drivers/video/backlight/Kconfig  |   7 +
 drivers/video/backlight/Makefile |   1 +
 drivers/video/backlight/led_bl.c | 217 +++++++++++++++++++++++++++++++
 3 files changed, 225 insertions(+)
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
index 000000000000..e699924cc2bc
--- /dev/null
+++ b/drivers/video/backlight/led_bl.c
@@ -0,0 +1,217 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2015-2018 Texas Instruments Incorporated -  http://www.ti.com/
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
+#include <linux/regulator/consumer.h>
+#include <linux/slab.h>
+
+struct led_bl_data {
+	struct device		*dev;
+	struct backlight_device	*bl_dev;
+
+	unsigned int		*levels;
+	bool			enabled;
+	struct regulator	*power_supply;
+	struct gpio_desc	*enable_gpio;
+
+	struct led_classdev *led_cdev;
+
+	unsigned int max_brightness;
+	unsigned int default_brightness;
+};
+
+static void led_bl_set_brightness(struct led_bl_data *priv, int brightness)
+{
+	int err;
+
+	if (!priv->enabled) {
+		err = regulator_enable(priv->power_supply);
+		if (err < 0)
+			dev_err(priv->dev, "failed to enable power supply\n");
+
+		if (priv->enable_gpio)
+			gpiod_set_value_cansleep(priv->enable_gpio, 1);
+	}
+
+	led_set_brightness(priv->led_cdev, priv->levels[brightness]);
+
+	priv->enabled = true;
+}
+
+static void led_bl_power_off(struct led_bl_data *priv)
+{
+	if (!priv->enabled)
+		return;
+
+	led_set_brightness(priv->led_cdev, LED_OFF);
+
+	if (priv->enable_gpio)
+		gpiod_set_value_cansleep(priv->enable_gpio, 0);
+
+	regulator_disable(priv->power_supply);
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
+	u32 *levels;
+	u32 value;
+	int ret;
+
+	if (!node)
+		return -ENODEV;
+
+	num_levels = of_property_count_u32_elems(node, "brightness-levels");
+	if (num_levels < 0)
+		return num_levels;
+
+	levels = devm_kzalloc(dev, sizeof(u32) * num_levels, GFP_KERNEL);
+	if (!levels)
+		return -ENOMEM;
+
+	ret = of_property_read_u32_array(node, "brightness-levels",
+					 levels,
+					 num_levels);
+	if (ret < 0)
+		return ret;
+
+	ret = of_property_read_u32(node, "default-brightness-level", &value);
+	if (ret < 0)
+		return ret;
+
+	if (value >= num_levels) {
+		dev_err(dev, "invalid default-brightness-level\n");
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
+
+	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	platform_set_drvdata(pdev, priv);
+
+	priv->dev = &pdev->dev;
+	priv->led_cdev = to_led_classdev(pdev->dev.parent);
+
+	ret = led_bl_parse_dt(&pdev->dev, priv);
+	if (ret < 0) {
+		if (ret != -EPROBE_DEFER)
+			dev_err(&pdev->dev, "failed to parse DT data\n");
+		return ret;
+	}
+
+	priv->enable_gpio = devm_gpiod_get_optional(&pdev->dev, "enable",
+			    GPIOD_OUT_LOW);
+	if (IS_ERR(priv->enable_gpio)) {
+		ret = PTR_ERR(priv->enable_gpio);
+		goto err;
+	}
+
+	priv->power_supply = devm_regulator_get(&pdev->dev, "power");
+	if (IS_ERR(priv->power_supply)) {
+		ret = PTR_ERR(priv->power_supply);
+		goto err;
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
+
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

