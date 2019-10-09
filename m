Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 941BAD0A41
	for <lists+linux-leds@lfdr.de>; Wed,  9 Oct 2019 10:52:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730339AbfJIIwP (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 9 Oct 2019 04:52:15 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:43750 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730406AbfJIIwP (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 9 Oct 2019 04:52:15 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x998q6Bm035255;
        Wed, 9 Oct 2019 03:52:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1570611126;
        bh=CJRCJuf3Ec4lXKJvRu7xvfp5Qc4WB9fgDUnDZNXBBis=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=J/yC1r1zlbV7N78XH+SIII9Hiszdkk1jm2UI0nmKW+fJBNRE+rJAfo+ru/SggPb91
         LERUse9hRmvUZwz6UcEVlC095S+SyvGQXLAD1pvnzCGBwIzQNYpz1LNemeq1vcnuY1
         s6+PaR4RVt23Uc9tVNqiINZu24FRQ/sR5lNQqBF8=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x998q6KF023623
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 9 Oct 2019 03:52:06 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 9 Oct
 2019 03:52:02 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 9 Oct 2019 03:52:02 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x998q4n1094650;
        Wed, 9 Oct 2019 03:52:05 -0500
From:   Jean-Jacques Hiblot <jjhiblot@ti.com>
To:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>, <sre@kernel.org>,
        <robh+dt@kernel.org>, <mark.rutland@arm.com>,
        <lee.jones@linaro.org>, <daniel.thompson@linaro.org>
CC:     <dmurphy@ti.com>, <linux-leds@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <tomi.valkeinen@ti.com>, Jean-Jacques Hiblot <jjhiblot@ti.com>
Subject: [PATCH v10 6/6] backlight: add led-backlight driver
Date:   Wed, 9 Oct 2019 10:51:27 +0200
Message-ID: <20191009085127.22843-7-jjhiblot@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191009085127.22843-1-jjhiblot@ti.com>
References: <20191009085127.22843-1-jjhiblot@ti.com>
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
Acked-by: Pavel Machek <pavel@ucw.cz>
Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/video/backlight/Kconfig  |   7 +
 drivers/video/backlight/Makefile |   1 +
 drivers/video/backlight/led_bl.c | 258 +++++++++++++++++++++++++++++++
 3 files changed, 266 insertions(+)
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
index 000000000000..718fa3e03eac
--- /dev/null
+++ b/drivers/video/backlight/led_bl.c
@@ -0,0 +1,258 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2015-2019 Texas Instruments Incorporated -  http://www.ti.com/
+ * Authors: Tomi Valkeinen <tomi.valkeinen@ti.com>
+ *          Jean-Jacques Hiblot <jjhiblot@ti.com>
+ */
+
+#include <linux/backlight.h>
+#include <linux/leds.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
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
+	for (i = 0; i < priv->nb_leds; i++)
+		led_set_brightness(priv->leds[i], bkl_brightness);
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
+static int led_bl_get_leds(struct device *dev,
+			   struct led_bl_data *priv)
+{
+	int i, nb_leds, ret;
+	struct device_node *node = dev->of_node;
+	struct led_classdev **leds;
+	unsigned int max_brightness;
+	unsigned int default_brightness;
+
+	ret = of_count_phandle_with_args(node, "leds", NULL);
+	if (ret < 0) {
+		dev_err(dev, "Unable to get led count\n");
+		return -EINVAL;
+	}
+
+	nb_leds = ret;
+	if (nb_leds < 1) {
+		dev_err(dev, "At least one LED must be specified!\n");
+		return -EINVAL;
+	}
+
+	leds = devm_kzalloc(dev, sizeof(struct led_classdev *) * nb_leds,
+			    GFP_KERNEL);
+	if (!leds)
+		return -ENOMEM;
+
+	for (i = 0; i < nb_leds; i++) {
+		leds[i] = devm_of_led_get(dev, i);
+		if (IS_ERR(leds[i]))
+			return PTR_ERR(leds[i]);
+	}
+
+	/* check that the LEDs all have the same brightness range */
+	max_brightness = leds[0]->max_brightness;
+	for (i = 1; i < nb_leds; i++) {
+		if (max_brightness != leds[i]->max_brightness) {
+			dev_err(dev, "LEDs must have identical ranges\n");
+			return -EINVAL;
+		}
+	}
+
+	/* get the default brightness from the first LED from the list */
+	default_brightness = leds[0]->brightness;
+
+	priv->nb_leds = nb_leds;
+	priv->leds = leds;
+	priv->max_brightness = max_brightness;
+	priv->default_brightness = default_brightness;
+
+	return 0;
+}
+
+static int led_bl_parse_levels(struct device *dev,
+			   struct led_bl_data *priv)
+{
+	struct device_node *node = dev->of_node;
+	int num_levels;
+	u32 value;
+	int ret;
+
+	if (!node)
+		return -ENODEV;
+
+	num_levels = of_property_count_u32_elems(node, "brightness-levels");
+	if (num_levels > 1) {
+		int i;
+		unsigned int db;
+		u32 *levels = NULL;
+
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
+
+		/*
+		 * Try to map actual LED brightness to backlight brightness
+		 * level
+		 */
+		db = priv->default_brightness;
+		for (i = 0 ; i < num_levels; i++) {
+			if ((i && db > levels[i-1]) && db <= levels[i])
+				break;
+		}
+		priv->default_brightness = i;
+		priv->max_brightness = num_levels - 1;
+		priv->levels = levels;
+	} else if (num_levels >= 0)
+		dev_warn(dev, "Not enough levels defined\n");
+
+	ret = of_property_read_u32(node, "default-brightness", &value);
+	if (!ret && value <= priv->max_brightness)
+		priv->default_brightness = value;
+	else if (!ret  && value > priv->max_brightness)
+		dev_warn(dev, "Invalid default brightness. Ignoring it\n");
+
+	return 0;
+}
+
+static void led_bl_cleanup(void *data)
+{
+	struct led_bl_data *priv = data;
+	int i;
+
+	led_bl_power_off(priv);
+	for (i = 0; i < priv->nb_leds; i++)
+		led_sysfs_enable(priv->leds[i]);
+}
+
+static int led_bl_probe(struct platform_device *pdev)
+{
+	struct backlight_properties props;
+	struct led_bl_data *priv;
+	int ret, i;
+
+	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	platform_set_drvdata(pdev, priv);
+
+	priv->dev = &pdev->dev;
+
+	ret = led_bl_get_leds(&pdev->dev, priv);
+	if (ret)
+		return ret;
+
+	ret = led_bl_parse_levels(&pdev->dev, priv);
+	if (ret < 0) {
+		dev_err(&pdev->dev, "Failed to parse DT data\n");
+		return ret;
+	}
+
+	ret = devm_add_action_or_reset(&pdev->dev, led_bl_cleanup, priv);
+	if (ret)
+		return ret;
+
+	for (i = 0; i < priv->nb_leds; i++)
+		led_sysfs_disable(priv->leds[i]);
+
+	memset(&props, 0, sizeof(struct backlight_properties));
+	props.type = BACKLIGHT_RAW;
+	props.max_brightness = priv->max_brightness;
+	props.brightness = priv->default_brightness;
+	props.power = (priv->default_brightness > 0) ? FB_BLANK_POWERDOWN :
+		      FB_BLANK_UNBLANK;
+	priv->bl_dev = devm_backlight_device_register(&pdev->dev,
+			dev_name(&pdev->dev), &pdev->dev, priv, &led_bl_ops,
+			&props);
+	if (IS_ERR(priv->bl_dev)) {
+		dev_err(&pdev->dev, "Failed to register backlight\n");
+		return PTR_ERR(priv->bl_dev);
+	}
+
+	backlight_update_status(priv->bl_dev);
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
+		.of_match_table	= led_bl_of_match,
+	},
+	.probe		= led_bl_probe,
+};
+
+module_platform_driver(led_bl_driver);
+
+MODULE_DESCRIPTION("LED based Backlight Driver");
+MODULE_LICENSE("GPL");
+MODULE_ALIAS("platform:led-backlight");
-- 
2.17.1

