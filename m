Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BB10A170141
	for <lists+linux-leds@lfdr.de>; Wed, 26 Feb 2020 15:33:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727755AbgBZOdl (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 26 Feb 2020 09:33:41 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:35452 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727627AbgBZOdl (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 26 Feb 2020 09:33:41 -0500
Received: by mail-wm1-f66.google.com with SMTP id m3so3388509wmi.0
        for <linux-leds@vger.kernel.org>; Wed, 26 Feb 2020 06:33:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=fP9zTwJIlxkrgRxfuE6Lj7cR6vrhl8QMH/2xQfCpNZQ=;
        b=UZfmU6njX76yq6eJ+M/HisXIdbDeaKA/3EyJ67N2nDBFtv3NCF6tymC5aVc16C/B3P
         5J8sv00ldtRPAVG2XKFmfC5MPQJQCYlB+Ka3vcV7yqH1nDMaWjg9kBJprpQIn6aBGhWe
         Kn1jxx3Qy1Evdl6nyF5iLP7Oh/aCkUihJNxX04qy7ujcmg/nzTO4higBdwRe7IwauIk7
         e578cL0sxcg9Y9of3JYZjfZfI8GrBrHVNIY5yZnxqQfMFIGt3ZECWvErT7mL9jOrJAXW
         Vf8USPHIeiv4bGhb9+5UTWPHUGGfg2CdFedtOKOaftNA7x6Uo8R2QZu8rqsiVgEjips5
         Ke8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=fP9zTwJIlxkrgRxfuE6Lj7cR6vrhl8QMH/2xQfCpNZQ=;
        b=HWPOC8LiWGZ6K7bX2A6yv9VgUiCDmCQPme0xGWihTKb9SgBSxPXOfpLj3MF3ZQfN70
         ZMyr2+aC8nKxMGRhCcJhdTulMqVSWXTno8Z1go3Y06A/B/NTO2iP9td8b3tbhRINgL+Z
         vbUrsqcDyL1wgG4Z2+ll1KrLNlR71AttqYA4e/MPdbBiarIEb5LlmZNShUobNBRIxWUx
         4f9C8POLSqiu8vH6fHwTz9+DLoFYMaByRE2e5h6NPW3eFOhnIsY1vHORYjx+XLseoEkI
         677mo9kNEh/Gmaqlnr3QrFRGzzJnnPdrTw7JzjDQmCrJ/TN/yowXHwYvrSdms70AnAyK
         RupA==
X-Gm-Message-State: APjAAAVsgBfI6s1+pelFLMTJnHSKEXd5hatRlZkkUFS3XyTjhvra5poe
        tvZDXwZ0emiOjN/gdiaVt/njdQ==
X-Google-Smtp-Source: APXvYqzi4kajIMJtNBRJVwsBu6oQCXtwB+WvsoWPZAn7FB+S+laRGi+homkRgU9l+XJHSH8C1MRXMQ==
X-Received: by 2002:a05:600c:414f:: with SMTP id h15mr2295644wmm.130.1582727617732;
        Wed, 26 Feb 2020 06:33:37 -0800 (PST)
Received: from nbelin-ThinkPad-T470p.baylibre.local (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id h10sm3204198wml.18.2020.02.26.06.33.36
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Wed, 26 Feb 2020 06:33:37 -0800 (PST)
From:   Nicolas Belin <nbelin@baylibre.com>
To:     linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        jacek.anaszewski@gmail.com, pavel@ucw.cz, dmurphy@ti.com,
        devicetree@vger.kernel.org
Cc:     baylibre-upstreaming@groups.io, Nicolas Belin <nbelin@baylibre.com>
Subject: [PATCH RFC v2 3/3] drivers: leds: add support for apa102c leds
Date:   Wed, 26 Feb 2020 15:33:12 +0100
Message-Id: <1582727592-4510-4-git-send-email-nbelin@baylibre.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1582727592-4510-1-git-send-email-nbelin@baylibre.com>
References: <1582727592-4510-1-git-send-email-nbelin@baylibre.com>
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Initilial commit in order to support the apa102c RGB leds. This
is based on the Multicolor Framework.

Reviewed-by: Corentin Labbe <clabbe@baylibre.com>
Signed-off-by: Nicolas Belin <nbelin@baylibre.com>
---
 drivers/leds/Kconfig        |   7 ++
 drivers/leds/Makefile       |   1 +
 drivers/leds/leds-apa102c.c | 291 ++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 299 insertions(+)
 create mode 100644 drivers/leds/leds-apa102c.c

diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index 5dc6535a88ef..71e29727c6ec 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -79,6 +79,13 @@ config LEDS_AN30259A
 	  To compile this driver as a module, choose M here: the module
 	  will be called leds-an30259a.
 
+config LEDS_APA102C
+	tristate "LED Support for Shiji APA102C"
+	depends on SPI
+	depends on LEDS_CLASS_MULTI_COLOR
+	help
+	  This option enables support for APA102C LEDs.
+
 config LEDS_APU
 	tristate "Front panel LED support for PC Engines APU/APU2/APU3 boards"
 	depends on LEDS_CLASS
diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
index b5305b7d43fb..8334cb6dc7e8 100644
--- a/drivers/leds/Makefile
+++ b/drivers/leds/Makefile
@@ -90,6 +90,7 @@ obj-$(CONFIG_LEDS_LM36274)		+= leds-lm36274.o
 obj-$(CONFIG_LEDS_TPS6105X)		+= leds-tps6105x.o
 
 # LED SPI Drivers
+obj-$(CONFIG_LEDS_APA102C)		+= leds-apa102c.o
 obj-$(CONFIG_LEDS_CR0014114)		+= leds-cr0014114.o
 obj-$(CONFIG_LEDS_DAC124S085)		+= leds-dac124s085.o
 obj-$(CONFIG_LEDS_EL15203000)		+= leds-el15203000.o
diff --git a/drivers/leds/leds-apa102c.c b/drivers/leds/leds-apa102c.c
new file mode 100644
index 000000000000..b46db0db7501
--- /dev/null
+++ b/drivers/leds/leds-apa102c.c
@@ -0,0 +1,291 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include <linux/spi/spi.h>
+#include <linux/led-class-multicolor.h>
+
+/*
+ * Copyright (C) 2020 BayLibre, SAS
+ * Author: Nicolas Belin <nbelin@baylibre.com>
+ */
+
+/*
+ *  APA102C SPI protocol description:
+ *  +------+----------------------------------------+------+
+ *  |START |               DATA FIELD:              | END  |
+ *  |FRAME |               N LED FRAMES             |FRAME |
+ *  +------+------+------+------+------+-----+------+------+
+ *  | 0*32 | LED1 | LED2 | LED3 | LED4 | --- | LEDN | 1*32 |
+ *  +------+------+------+------+------+-----+------+------+
+ *
+ *  +-----------------------------------+
+ *  |START FRAME 32bits                 |
+ *  +--------+--------+--------+--------+
+ *  |00000000|00000000|00000000|00000000|
+ *  +--------+--------+--------+--------+
+ *
+ *  +------------------------------------+
+ *  |LED  FRAME 32bits                   |
+ *  +---+-----+--------+--------+--------+
+ *  |111|LUMA |  BLUE  | GREEN  |  RED   |
+ *  +---+-----+--------+--------+--------+
+ *  |3b |5bits| 8bits  | 8bits  | 8bits  |
+ *  +---+-----+--------+--------+--------+
+ *  |MSB   LSB|MSB  LSB|MSB  LSB|MSB  LSB|
+ *  +---+-----+--------+--------+--------+
+ *
+ *  +-----------------------------------+
+ *  |END FRAME 32bits                   |
+ *  +--------+--------+--------+--------+
+ *  |11111111|11111111|11111111|11111111|
+ *  +--------+--------+--------+--------+
+ */
+
+/* apa102c default settings */
+#define MAX_BRIGHTNESS		GENMASK(4, 0)
+#define CH_NUM			4
+#define START_BYTE		0
+#define END_BYTE		GENMASK(7, 0)
+#define LED_FRAME_HEADER	GENMASK(7, 5)
+
+#define IS_RGB	(1<<LED_COLOR_ID_RED \
+		| 1<<LED_COLOR_ID_GREEN \
+		| 1<<LED_COLOR_ID_BLUE)
+
+#define APA_DEV_NAME		"apa102c"
+
+struct apa102c_led {
+	struct apa102c		*priv;
+	struct led_classdev	ldev;
+	struct led_classdev_mc	mc_cdev;
+};
+
+struct apa102c {
+	size_t			led_count;
+	struct device		*dev;
+	struct mutex		lock;
+	struct spi_device	*spi;
+	u8			*buf;
+	struct apa102c_led	leds[];
+};
+
+static void apa102c_set_rgb_bytes(u8 *bgr_buf, struct list_head *color_list)
+{
+	struct led_mc_color_entry *color_data;
+
+	/* Looking for the RGB values and putting them in the buffer in
+	 * BGR order
+	 */
+	list_for_each_entry(color_data, color_list, list) {
+		switch (color_data->led_color_id) {
+		case LED_COLOR_ID_RED:
+			bgr_buf[2] = color_data->intensity;
+			break;
+		case LED_COLOR_ID_GREEN:
+			bgr_buf[1] = color_data->intensity;
+			break;
+		case LED_COLOR_ID_BLUE:
+			bgr_buf[0] = color_data->intensity;
+			break;
+		}
+	}
+}
+
+static int apa102c_sync(struct apa102c *priv)
+{
+	int	ret;
+	size_t	i;
+	struct apa102c_led *leds = priv->leds;
+	u8	*buf = priv->buf;
+
+	/* creating the data that will be sent to all the leds at once */
+	for (i = 0; i < 4; i++)
+		*buf++ = START_BYTE;
+
+	/* looping on each multicolor led getting the luma and the RGB values */
+	for (i = 0; i < priv->led_count; i++) {
+		*buf++ = LED_FRAME_HEADER | leds[i].ldev.brightness;
+		apa102c_set_rgb_bytes(buf, &leds[i].mc_cdev.color_list);
+		buf += 3;
+	}
+
+	for (i = 0; i < 4; i++)
+		*buf++ = END_BYTE;
+
+	ret = spi_write(priv->spi, priv->buf, priv->led_count*4 + 8);
+
+	return ret;
+}
+
+static int apa102c_brightness_set(struct led_classdev *ldev,
+			   enum led_brightness brightness)
+{
+	int			ret;
+	struct apa102c_led	*led = container_of(ldev,
+						    struct apa102c_led,
+						    ldev);
+
+	mutex_lock(&led->priv->lock);
+	/* updating the brightness then synching all the leds */
+	ldev->brightness = brightness;
+	ret = apa102c_sync(led->priv);
+	mutex_unlock(&led->priv->lock);
+
+	return ret;
+}
+
+static int apa102c_probe_dt(struct apa102c *priv)
+{
+	int			ret = 0;
+	int			num_colors;
+	u32			color_id, i;
+	struct apa102c_led	*led;
+	struct fwnode_handle	*child, *grandchild;
+	struct led_init_data	init_data;
+
+	device_for_each_child_node(priv->dev, child) {
+
+		ret = fwnode_property_read_u32(child, "reg", &i);
+		if (ret) {
+			dev_err(priv->dev, "coudld not read reg %d\n", ret);
+			goto child_out;
+		}
+
+		if (i >= priv->led_count) {
+			ret = -EINVAL;
+			dev_err(priv->dev, "reg value too big\n");
+			goto child_out;
+		}
+
+		led = &priv->leds[i];
+		/* checking if this led config is already used */
+		if (led->mc_cdev.led_cdev) {
+			ret = -EINVAL;
+			dev_err(priv->dev, "using the same reg value twice\n");
+			goto child_out;
+		}
+
+		led->priv			= priv;
+		led->ldev.max_brightness	= MAX_BRIGHTNESS;
+		fwnode_property_read_string(child, "linux,default-trigger",
+					    &led->ldev.default_trigger);
+
+		init_data.fwnode = child;
+		init_data.devicename = APA_DEV_NAME;
+		init_data.default_label = ":";
+
+		num_colors = 0;
+		fwnode_for_each_child_node(child, grandchild) {
+			ret = fwnode_property_read_u32(grandchild, "color",
+						       &color_id);
+			if (ret) {
+				dev_err(priv->dev, "Cannot read color\n");
+				goto child_out;
+			}
+
+			set_bit(color_id, &led->mc_cdev.available_colors);
+			num_colors++;
+		}
+
+		if (num_colors != 3) {
+			ret = -EINVAL;
+			dev_err(priv->dev, "There should be 3 colors\n");
+			goto child_out;
+		}
+
+		if (led->mc_cdev.available_colors != IS_RGB) {
+			ret = -EINVAL;
+			dev_err(priv->dev, "The led is expected to be RGB\n");
+			goto child_out;
+		}
+
+		led->mc_cdev.num_leds = num_colors;
+		led->mc_cdev.led_cdev = &led->ldev;
+		led->ldev.brightness_set_blocking = apa102c_brightness_set;
+		ret = devm_led_classdev_multicolor_register_ext(priv->dev,
+								&led->mc_cdev,
+								&init_data);
+		if (ret) {
+			dev_err(priv->dev, "led register err: %d\n", ret);
+			fwnode_handle_put(child);
+			goto child_out;
+		}
+	}
+
+child_out:
+	return ret;
+}
+
+static int apa102c_probe(struct spi_device *spi)
+{
+	struct apa102c	*priv;
+	size_t		led_count;
+	int		ret;
+
+	led_count = device_get_child_node_count(&spi->dev);
+	if (!led_count) {
+		dev_err(&spi->dev, "No LEDs defined in device tree!");
+		return -ENODEV;
+	}
+
+	priv = devm_kzalloc(&spi->dev,
+			    struct_size(priv, leds, led_count),
+			    GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->buf = devm_kzalloc(&spi->dev, (led_count + 2) * 4, GFP_KERNEL);
+	if (!priv->buf)
+		return -ENOMEM;
+
+	mutex_init(&priv->lock);
+	priv->led_count	= led_count;
+	priv->dev	= &spi->dev;
+	priv->spi	= spi;
+
+	ret = apa102c_probe_dt(priv);
+	if (ret)
+		return ret;
+
+	/* Set the LEDs with default values at start */
+	apa102c_sync(priv);
+	if (ret)
+		return ret;
+
+	spi_set_drvdata(spi, priv);
+
+	return 0;
+}
+
+static int apa102c_remove(struct spi_device *spi)
+{
+	struct apa102c *priv = spi_get_drvdata(spi);
+
+	mutex_destroy(&priv->lock);
+
+	return 0;
+}
+
+static const struct of_device_id apa102c_dt_ids[] = {
+	{ .compatible = "shiji,apa102c", },
+	{},
+};
+
+MODULE_DEVICE_TABLE(of, apa102c_dt_ids);
+
+static struct spi_driver apa102c_driver = {
+	.probe		= apa102c_probe,
+	.remove		= apa102c_remove,
+	.driver = {
+		.name		= KBUILD_MODNAME,
+		.of_match_table	= apa102c_dt_ids,
+	},
+};
+
+module_spi_driver(apa102c_driver);
+
+MODULE_AUTHOR("Nicolas Belin <nbelin@baylibre.com>");
+MODULE_DESCRIPTION("apa102c LED driver");
+MODULE_LICENSE("GPL v2");
+MODULE_ALIAS("spi:apa102c");
-- 
2.7.4

