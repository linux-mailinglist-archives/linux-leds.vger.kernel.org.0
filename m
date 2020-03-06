Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6552E17BF4E
	for <lists+linux-leds@lfdr.de>; Fri,  6 Mar 2020 14:41:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727075AbgCFNk6 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 6 Mar 2020 08:40:58 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:40385 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726887AbgCFNk5 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 6 Mar 2020 08:40:57 -0500
Received: by mail-wr1-f66.google.com with SMTP id p2so1598330wrw.7
        for <linux-leds@vger.kernel.org>; Fri, 06 Mar 2020 05:40:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=mnN6G9zY/y6OfUIGRMlaJpifAN4Ydyk3U4NgamuqPTs=;
        b=wRALZZlgeLJMW/t2mq3QfgFuJiJwzuckGf1+aLVNV0luD6kM1OnJ/p/wmx9FSUS2sb
         7TTwJJAb2CD+wYxWn6wRouZ9EjuqwvFVVytec5cynkwqS5HuToVAGl3XdD1EdAbAGfUe
         6E60wa4mXQGQjS1SX6SQgI7vESPfJKa/r5O8RQAsJp7DSgrDz/kfQHYUYJ7IYWTprV4h
         Gy8HYqr4yav0z5ty1vWXUZlBxM4maNDRggHmfRktSh31nH8t2iWOmuZmQxFbooxCRz77
         6sMoa8tdDL5dOqt04h4NdDHN2emd1JcoZPAJKYfX8bP9c6t4mzD9pGMwILVbAADf/BkR
         ctTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=mnN6G9zY/y6OfUIGRMlaJpifAN4Ydyk3U4NgamuqPTs=;
        b=fjDBrAGofAL9DxSOIHeXbFNNgx9kjN4Ao7Z116h8T8Fskc71Yn3kl1cRB7qM1BgUCf
         JVNKHwegvFXc8KgRe5YFDxK2PrRABcAMf2gfRJv1AIJ8dB2yRpePbDHeXouq39uWAa9G
         lLVK+i+xgnIPP+e0oci4eHvjMMFLw2HeoUFDmPhtV7nvcQnJReDbJzDtfwF0lVFvZ6YH
         7Ij0WslLvYBQqXwqA06M4pJwE76JqfcbbWsgjRoKMbRT0/br/5Qh8wTrRf8M0Gcsky1A
         qXOOhuo7hgeVVcg7PL9d4RwhAvuelC/mro8De333l5WY5sdLp36S35DRtZiBUTHFShFW
         oYdw==
X-Gm-Message-State: ANhLgQ0b6qlrIDWaHmf1nQMlaAPuSKtC72Z+opY/LTlBUjVZ86kumha+
        5zlxbQfEjiuXsskLz1T/6GIOdA==
X-Google-Smtp-Source: ADFU+vubX3ZdVVxAKqeiTBOeSYo/FWSLQG7mS3muEVTs/UR3Nkiy3YiTTefcGGH+SygDOW3AnCBwKA==
X-Received: by 2002:a5d:5043:: with SMTP id h3mr4092965wrt.274.1583502054793;
        Fri, 06 Mar 2020 05:40:54 -0800 (PST)
Received: from localhost.localdomain (89-82-119-43.abo.bbox.fr. [89.82.119.43])
        by smtp.gmail.com with ESMTPSA id g7sm47178086wrm.72.2020.03.06.05.40.53
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Fri, 06 Mar 2020 05:40:54 -0800 (PST)
From:   Nicolas Belin <nbelin@baylibre.com>
To:     linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        jacek.anaszewski@gmail.com, pavel@ucw.cz, dmurphy@ti.com,
        devicetree@vger.kernel.org
Cc:     baylibre-upstreaming@groups.io, Nicolas Belin <nbelin@baylibre.com>
Subject: [PATCH v3 3/3] drivers: leds: add support for apa102c leds
Date:   Fri,  6 Mar 2020 14:40:10 +0100
Message-Id: <1583502010-16210-4-git-send-email-nbelin@baylibre.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1583502010-16210-1-git-send-email-nbelin@baylibre.com>
References: <1583502010-16210-1-git-send-email-nbelin@baylibre.com>
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Initilial commit in order to support the apa102c RGB leds. The
RGB and global brightness management is done by creating 4 leds
from the Led Framework per apa102c led.

Signed-off-by: Nicolas Belin <nbelin@baylibre.com>
---
 drivers/leds/Kconfig        |  11 ++
 drivers/leds/Makefile       |   1 +
 drivers/leds/leds-apa102c.c | 306 ++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 318 insertions(+)
 create mode 100644 drivers/leds/leds-apa102c.c

diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index d82f1dea3711..28fa6c4f65cc 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -69,6 +69,17 @@ config LEDS_AN30259A
 	  To compile this driver as a module, choose M here: the module
 	  will be called leds-an30259a.
 
+config LEDS_APA102C
+	tristate "LED Support for Shiji APA102C"
+	depends on SPI
+	depends on LEDS_CLASS
+	help
+	  This option enables support for the APA102C RGB LEDs
+	  from Shiji Lighting.
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called leds-apa102c.
+
 config LEDS_APU
 	tristate "Front panel LED support for PC Engines APU/APU2/APU3 boards"
 	depends on LEDS_CLASS
diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
index d7e1107753fb..28dfe82900c5 100644
--- a/drivers/leds/Makefile
+++ b/drivers/leds/Makefile
@@ -88,6 +88,7 @@ obj-$(CONFIG_LEDS_LM36274)		+= leds-lm36274.o
 obj-$(CONFIG_LEDS_TPS6105X)		+= leds-tps6105x.o
 
 # LED SPI Drivers
+obj-$(CONFIG_LEDS_APA102C)		+= leds-apa102c.o
 obj-$(CONFIG_LEDS_CR0014114)		+= leds-cr0014114.o
 obj-$(CONFIG_LEDS_DAC124S085)		+= leds-dac124s085.o
 obj-$(CONFIG_LEDS_EL15203000)		+= leds-el15203000.o
diff --git a/drivers/leds/leds-apa102c.c b/drivers/leds/leds-apa102c.c
new file mode 100644
index 000000000000..0043e7a6235b
--- /dev/null
+++ b/drivers/leds/leds-apa102c.c
@@ -0,0 +1,306 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/leds.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include <linux/spi/spi.h>
+#include <uapi/linux/uleds.h>
+#include "leds.h"
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
+#define GLOBAL_MAX_BRIGHTNESS	GENMASK(4, 0)
+#define RGB_MAX_BRIGHTNESS	GENMASK(7, 0)
+#define START_BYTE		0
+#define END_BYTE		GENMASK(7, 0)
+#define LED_FRAME_HEADER	GENMASK(7, 5)
+
+struct apa102c_led {
+	struct apa102c		*priv;
+	char			name[LED_MAX_NAME_SIZE];
+	int			color_id;
+	struct led_classdev	cdev;
+};
+
+struct apa102c_rgbled {
+	/* the 4 components of the apa102c rgb led:
+	 * global brightness, blue, green and red in that order
+	 */
+	struct apa102c_led	component[4];
+};
+
+struct apa102c {
+	size_t			led_count;
+	struct device		*dev;
+	struct mutex		lock;
+	struct spi_device	*spi;
+	u8			*spi_buf;
+	struct apa102c_rgbled	rgb_leds[];
+};
+
+static int apa102c_sync(struct apa102c *priv)
+{
+	int	ret;
+	size_t	i;
+	struct apa102c_rgbled *leds = priv->rgb_leds;
+	u8	*buf = priv->spi_buf;
+
+	/* creating the data that will be sent to all the leds at once */
+	for (i = 0; i < 4; i++)
+		*buf++ = START_BYTE;
+
+	/* looping on each RGB led component, getting the global brightness
+	 * then B, G and R values
+	 */
+	for (i = 0; i < priv->led_count; i++) {
+		*buf++ = LED_FRAME_HEADER |
+			 leds[i].component[0].cdev.brightness;
+		*buf++ = leds[i].component[1].cdev.brightness;
+		*buf++ = leds[i].component[2].cdev.brightness;
+		*buf++ = leds[i].component[3].cdev.brightness;
+	}
+
+	for (i = 0; i < 4; i++)
+		*buf++ = END_BYTE;
+
+	ret = spi_write(priv->spi, priv->spi_buf,
+			(priv->led_count + 2) * sizeof(u32));
+
+	return ret;
+}
+
+static int apa102c_brightness_set(struct led_classdev *cdev,
+			   enum led_brightness brightness)
+{
+	int			ret;
+	struct apa102c_led	*led = container_of(cdev,
+						    struct apa102c_led,
+						    cdev);
+
+	mutex_lock(&led->priv->lock);
+	/* updating the brightness then synching all the leds */
+	cdev->brightness = brightness;
+	ret = apa102c_sync(led->priv);
+	mutex_unlock(&led->priv->lock);
+
+	return ret;
+}
+
+static int apa102c_probe_dt(struct apa102c *priv)
+{
+	int			ret = 0;
+	u32			i;
+	struct apa102c_rgbled	*rgb_led;
+	struct apa102c_led	*led;
+	struct fwnode_handle	*child;
+	const char		*rgb_led_name;
+	const char		*led_component_name;
+
+	/* each node corresponds to an rgb led */
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
+		rgb_led = &priv->rgb_leds[i];
+		/* checking if this led config is already used by checking if
+		 * the priv member of the global_brightness led as already
+		 * been set
+		 */
+		if (rgb_led->component[0].priv) {
+			ret = -EINVAL;
+			dev_err(priv->dev, "using the same reg value twice\n");
+			goto child_out;
+		}
+
+		ret = fwnode_property_read_string(child, "label",
+						  &rgb_led_name);
+		if (ret) {
+			ret = -EINVAL;
+			dev_err(priv->dev, "missing rgb led name\n");
+			goto child_out;
+		}
+
+		/* setting a color_id value for each of the 4 components of the
+		 * apa102c RGB led. The first component is the global brightness
+		 * of the led and thus has no color. The order of the colors
+		 * after the global brightness is then blue, green and red
+		 * in that order. It corresponds to the order in which the
+		 * values are sent using spi
+		 */
+		rgb_led->component[0].color_id = -1; //no color
+		rgb_led->component[1].color_id = LED_COLOR_ID_BLUE;
+		rgb_led->component[2].color_id = LED_COLOR_ID_GREEN;
+		rgb_led->component[3].color_id = LED_COLOR_ID_RED;
+
+		/* now looping on each component and registering a corresponding
+		 * led
+		 */
+		for (i = 0; i < 4; i++) {
+			led = &rgb_led->component[i];
+			if (led->color_id == -1) {
+				/* the global brightness has no defined name
+				 * so setting it to "brightness". It also has
+				 * a different MAX_BRIGHTNESS value.
+				 * If a trigger is present, setting it on this
+				 * component
+				 */
+				led->cdev.max_brightness =
+					GLOBAL_MAX_BRIGHTNESS;
+				led_component_name = "brightness";
+				fwnode_property_read_string(child,
+					"linux,default-trigger",
+					&led->cdev.default_trigger);
+			} else {
+				/* using the color name defined by the framework
+				 * for the B, G and R components
+				 */
+				led->cdev.max_brightness = RGB_MAX_BRIGHTNESS;
+				led_component_name = led_colors[led->color_id];
+			}
+
+			/* the rest is common to all the components */
+			led->priv = priv;
+			led->cdev.brightness_set_blocking =
+				apa102c_brightness_set;
+			/* creating our own led name to differentiate the 4
+			 * components
+			 */
+			snprintf(led->name, sizeof(led->name),
+				 "%s_%s", rgb_led_name, led_component_name);
+			led->cdev.name = led->name;
+
+			ret = devm_led_classdev_register_ext(priv->dev,
+							     &led->cdev,
+							     NULL);
+			if (ret) {
+				dev_err(priv->dev, "led register err: %d\n",
+					ret);
+				goto child_out;
+			}
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
+			    struct_size(priv, rgb_leds, led_count),
+			    GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->spi_buf = devm_kzalloc(&spi->dev,
+				     (led_count + 2) * sizeof(u32),
+				      GFP_KERNEL);
+	if (!priv->spi_buf)
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

