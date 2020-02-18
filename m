Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 54C71162383
	for <lists+linux-leds@lfdr.de>; Tue, 18 Feb 2020 10:38:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726549AbgBRJiS (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 18 Feb 2020 04:38:18 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:44814 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726467AbgBRJiS (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 18 Feb 2020 04:38:18 -0500
Received: by mail-wr1-f67.google.com with SMTP id m16so22998642wrx.11
        for <linux-leds@vger.kernel.org>; Tue, 18 Feb 2020 01:38:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=35KL1LTfuQEMS0onvOWTZltID4f8WNAkTnSPUv+/6zs=;
        b=U056svNGf+RqEj24Py59u5Rdkz8+fhhpBILJwwvgXKZhiQoYV4cSw88WrkWxrO785y
         3KF3nDz8+2TLsuXi+aMBZUAjIJG3D0aW0oYLpCC+qzw+eJHHosDXl3n2WbEy0AMpwq4c
         Y79p3MSNyuAE31SX9JAyErZZ0tZLgJ8v2PTPYlt/XpkFJn8nsggZnGyvfT+7w74Cu0Gk
         BCPsjuGAujrsS+1BQKUH6SdG6TWKd8bd4X/hcRf0065u2gU/f+dt9W+rc33Q0sVmDLHJ
         PvW0C9dpaFDI0UfMZQoKUuoD5iBDrW03w3HJITa6NrIdHPFqOZtFvfBR/bnVVotca1U6
         XDCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=35KL1LTfuQEMS0onvOWTZltID4f8WNAkTnSPUv+/6zs=;
        b=ofCJXUzPJKgjQc21TAQ/qe8eWBf5b7UTyKsvUtt7jRQNawc+2Dste6UapZdcvixNLF
         V+Tl1zTWZwA30wowFmN+3DoqiXNEqt69nLU36m+G2mKjK26W4eYRHXpVmgpbJ3CLmM4Z
         RAlAqxDxhGiPZTMuG+4uhJZvv6xKTL+TYXOIraNlv+qx2Tdj69y2kSchkppstYGaD2UY
         P7oXKontahqiYOjstAuhUcxqhWQlaeXxebdm7VWZXvTTJM5TdQDNs6UW7RTldGwTvJuc
         tQBltS7qIn0mzJ92I88UpNLGnxmQR5GHhtf9DHJl7DRFYavldswC1bBjjXgHjiZAlUGd
         4mig==
X-Gm-Message-State: APjAAAW5rXQ2l0nIbI/7IWJU6IYImviq/NRjNPjMfwfEab/IT5DPvnGW
        QG1AR03S3MiyMp8V5Hzi3IMKjLVUDOY=
X-Google-Smtp-Source: APXvYqx0dmJD/k15QUdXoEA+m2DKkc+CVjshyx2ACLr0JUvOL6v8fU6UOK6iiTJWpWm9kl/CkHdqIw==
X-Received: by 2002:adf:ef4c:: with SMTP id c12mr28518172wrp.203.1582018693857;
        Tue, 18 Feb 2020 01:38:13 -0800 (PST)
Received: from nbelin-ThinkPad-T470p.baylibre.local (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id f127sm2740626wma.4.2020.02.18.01.38.12
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Tue, 18 Feb 2020 01:38:13 -0800 (PST)
From:   Nicolas Belin <nbelin@baylibre.com>
To:     linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        jacek.anaszewski@gmail.com, pavel@ucw.cz, dmurphy@ti.com
Cc:     Nicolas Belin <nbelin@baylibre.com>
Subject: [PATCH 3/3] drivers: leds: add support for apa102c leds
Date:   Tue, 18 Feb 2020 10:37:37 +0100
Message-Id: <1582018657-5720-4-git-send-email-nbelin@baylibre.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1582018657-5720-1-git-send-email-nbelin@baylibre.com>
References: <1582018657-5720-1-git-send-email-nbelin@baylibre.com>
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Initilial commit in order to support the apa102c RGB leds.

Signed-off-by: Nicolas Belin <nbelin@baylibre.com>
---
 drivers/leds/Kconfig        |  11 ++
 drivers/leds/Makefile       |   1 +
 drivers/leds/leds-apa102c.c | 268 ++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 280 insertions(+)
 create mode 100644 drivers/leds/leds-apa102c.c

diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index d82f1dea3711..4fafeaaf6ee8 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -69,6 +69,17 @@ config LEDS_AN30259A
 	  To compile this driver as a module, choose M here: the module
 	  will be called leds-an30259a.
 
+config LEDS_APA102C
+	tristate "LED Support for Shiji APA102C"
+	depends on LEDS_CLASS
+	depends on SPI
+	help
+	  This option enables support for the Shiji Lighthing APA102C RGB full color
+	  LEDs.
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called leds-apa102c.
+
 config LEDS_APU
 	tristate "Front panel LED support for PC Engines APU/APU2/APU3 boards"
 	depends on LEDS_CLASS
diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
index d7e1107753fb..ab17f90347cb 100644
--- a/drivers/leds/Makefile
+++ b/drivers/leds/Makefile
@@ -9,6 +9,7 @@ obj-$(CONFIG_LEDS_TRIGGERS)		+= led-triggers.o
 # LED Platform Drivers
 obj-$(CONFIG_LEDS_88PM860X)		+= leds-88pm860x.o
 obj-$(CONFIG_LEDS_AAT1290)		+= leds-aat1290.o
+obj-$(CONFIG_LEDS_APA102C)		+= leds-apa102c.o
 obj-$(CONFIG_LEDS_APU)			+= leds-apu.o
 obj-$(CONFIG_LEDS_AS3645A)		+= leds-as3645a.o
 obj-$(CONFIG_LEDS_AN30259A)		+= leds-an30259a.o
diff --git a/drivers/leds/leds-apa102c.c b/drivers/leds/leds-apa102c.c
new file mode 100644
index 000000000000..e7abe3f5b7c2
--- /dev/null
+++ b/drivers/leds/leds-apa102c.c
@@ -0,0 +1,268 @@
+// SPDX-License-Identifier: GPL-2.0
+
+/*
+ * Copyright (C) 2020 BayLibre, SAS
+ * Author: Nicolas Belin <nbelin@baylibre.com>
+ */
+
+#include <linux/leds.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include <linux/spi/spi.h>
+#include <uapi/linux/uleds.h>
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
+#define CR_MAX_BRIGHTNESS	GENMASK(7, 0)
+#define LM_MAX_BRIGHTNESS	GENMASK(4, 0)
+#define CH_NUM			4
+#define START_BYTE		0
+#define END_BYTE		GENMASK(7, 0)
+#define LED_FRAME_HEADER	GENMASK(7, 5)
+
+enum led_channels {
+	RED,
+	GREEN,
+	BLUE,
+	LUMA,
+};
+
+struct apa102c_led {
+	char			name[LED_MAX_NAME_SIZE];
+	struct apa102c		*priv;
+	struct led_classdev	ldev;
+	u8			brightness;
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
+static int apa102c_sync(struct apa102c *priv)
+{
+	int	ret;
+	size_t	i;
+	size_t	bytes = 0;
+
+	for (i = 0; i < 4; i++)
+		priv->buf[bytes++] = START_BYTE;
+
+	for (i = 0; i < priv->led_count; i++) {
+		priv->buf[bytes++] = LED_FRAME_HEADER |
+				     priv->leds[i * CH_NUM + LUMA].brightness;
+		priv->buf[bytes++] = priv->leds[i * CH_NUM + BLUE].brightness;
+		priv->buf[bytes++] = priv->leds[i * CH_NUM + GREEN].brightness;
+		priv->buf[bytes++] = priv->leds[i * CH_NUM + RED].brightness;
+	}
+
+	for (i = 0; i < 4; i++)
+		priv->buf[bytes++] = END_BYTE;
+
+	ret = spi_write(priv->spi, priv->buf, bytes);
+
+	return ret;
+}
+
+static int apa102c_set_sync(struct led_classdev *ldev,
+			   enum led_brightness brightness)
+{
+	int			ret;
+	struct apa102c_led	*led = container_of(ldev,
+						    struct apa102c_led,
+						    ldev);
+
+	dev_dbg(led->priv->dev, "Set brightness of %s to %d\n",
+		led->name, brightness);
+
+	mutex_lock(&led->priv->lock);
+	led->brightness = (u8)brightness;
+	ret = apa102c_sync(led->priv);
+	mutex_unlock(&led->priv->lock);
+
+	return ret;
+}
+
+static int apa102c_probe_dt(struct apa102c *priv)
+{
+	u32			i = 0;
+	int			j = 0;
+	struct apa102c_led	*led;
+	struct fwnode_handle	*child;
+	struct device_node	*np;
+	int			ret;
+	int			use_index;
+	const char		*str;
+	static const char	* const rgb_name[] = {"red",
+						      "green",
+						      "blue",
+						      "luma"};
+
+	device_for_each_child_node(priv->dev, child) {
+		np = to_of_node(child);
+
+		ret = fwnode_property_read_u32(child, "reg", &i);
+		if (ret)
+			return ret;
+
+		if (i >= priv->led_count)
+			return -EINVAL;
+
+		/* use the index to create the name if the label is not set */
+		use_index = fwnode_property_read_string(child, "label", &str);
+
+		/* for each physical LED, 4 LEDs are created representing
+		 * the 4 components: red, green, blue and global luma.
+		 */
+		for (j = 0; j < CH_NUM; j++) {
+			led = &priv->leds[i * CH_NUM + j];
+
+			if (use_index)
+				snprintf(led->name, sizeof(led->name),
+					 "apa102c:%s:%d", rgb_name[j], i);
+			else
+				snprintf(led->name, sizeof(led->name),
+					 "apa102c:%s:%s", rgb_name[j], str);
+
+			fwnode_property_read_string(child,
+						    "linux,default-trigger",
+						    &led->ldev.default_trigger);
+
+			led->priv			 = priv;
+			led->ldev.name			 = led->name;
+			if (j == LUMA) {
+				led->ldev.brightness	 = led->brightness
+							 = LM_MAX_BRIGHTNESS;
+				led->ldev.max_brightness = LM_MAX_BRIGHTNESS;
+			} else {
+				led->ldev.brightness	 = led->brightness
+							 = 0;
+				led->ldev.max_brightness = CR_MAX_BRIGHTNESS;
+			}
+
+			led->ldev.brightness_set_blocking = apa102c_set_sync;
+
+			ret = devm_led_classdev_register(priv->dev, &led->ldev);
+			if (ret) {
+				dev_err(priv->dev,
+					"failed to register LED %s, err %d",
+					led->name, ret);
+				fwnode_handle_put(child);
+				return ret;
+			}
+
+			led->ldev.dev->of_node = np;
+
+		}
+	}
+
+	return 0;
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
+			    struct_size(priv, leds, led_count * CH_NUM),
+			    GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->buf = devm_kzalloc(&spi->dev, led_count * CH_NUM + 8, GFP_KERNEL);
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

