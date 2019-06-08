Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CCE6B39D04
	for <lists+linux-leds@lfdr.de>; Sat,  8 Jun 2019 13:00:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727020AbfFHLAi (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 8 Jun 2019 07:00:38 -0400
Received: from smtp.220.in.ua ([89.184.67.205]:49486 "EHLO smtp.220.in.ua"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726999AbfFHLAi (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Sat, 8 Jun 2019 07:00:38 -0400
Received: from oleh-pc.lan (unknown [95.67.115.55])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by smtp.220.in.ua (Postfix) with ESMTPSA id 4A3231A20425;
        Sat,  8 Jun 2019 14:00:35 +0300 (EEST)
From:   Oleh Kravchenko <oleg@kaa.org.ua>
To:     linux-leds@vger.kernel.org
Cc:     Oleh Kravchenko <oleg@kaa.org.ua>
Subject: [PATCH v3 2/2] leds: add LED driver for EL15203000 board
Date:   Sat,  8 Jun 2019 14:00:28 +0300
Message-Id: <20190608110028.8304-2-oleg@kaa.org.ua>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

This patch adds a LED class driver for the RGB LEDs found on
the Crane Merchandising System EL15203000 LEDs board
(aka RED LEDs board).

Signed-off-by: Oleh Kravchenko <oleg@kaa.org.ua>
---
 drivers/leds/Kconfig           |  13 ++
 drivers/leds/Makefile          |   1 +
 drivers/leds/leds-el15203000.c | 233 +++++++++++++++++++++++++++++++++
 3 files changed, 247 insertions(+)
 create mode 100644 drivers/leds/leds-el15203000.c

diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index 71be87bdb926..3f92c895c326 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -128,6 +128,19 @@ config LEDS_CR0014114
 	  To compile this driver as a module, choose M here: the module
 	  will be called leds-cr0014114.
 
+config LEDS_EL15203000
+	tristate "LED Support for Crane EL15203000"
+	depends on LEDS_CLASS
+	depends on SPI
+	depends on OF
+	help
+	  This option enables support for EL15203000 LED Board (aka RED LED board)
+	  which is widely used in coffee vending machines produced by
+	  Crane Merchandising Systems.
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called leds-el15203000.
+
 config LEDS_LM3530
 	tristate "LCD Backlight driver for LM3530"
 	depends on LEDS_CLASS
diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
index 1e9702ebffee..1f193ffc2feb 100644
--- a/drivers/leds/Makefile
+++ b/drivers/leds/Makefile
@@ -85,6 +85,7 @@ obj-$(CONFIG_LEDS_LM3601X)		+= leds-lm3601x.o
 # LED SPI Drivers
 obj-$(CONFIG_LEDS_CR0014114)		+= leds-cr0014114.o
 obj-$(CONFIG_LEDS_DAC124S085)		+= leds-dac124s085.o
+obj-$(CONFIG_LEDS_EL15203000)		+= leds-el15203000.o
 
 # LED Userspace Drivers
 obj-$(CONFIG_LEDS_USER)			+= uleds.o
diff --git a/drivers/leds/leds-el15203000.c b/drivers/leds/leds-el15203000.c
new file mode 100644
index 000000000000..c77e0b3cde91
--- /dev/null
+++ b/drivers/leds/leds-el15203000.c
@@ -0,0 +1,233 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright (c) 2019 Crane Merchandising Systems. All rights reserved.
+// Copyright (C) 2019 Oleh Kravchenko <oleg@kaa.org.ua>
+
+#include <linux/delay.h>
+#include <linux/leds.h>
+#include <linux/limits.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include <linux/spi/spi.h>
+#include <uapi/linux/uleds.h>
+
+/*
+ * EL15203000 SPI protocol descrtiption:
+ * +-----+------------+
+ * | LED | BRIGHTNESS |
+ * +-----+------------+
+ * |  1  |      1     |
+ * +-----+------------+
+ *
+ * LED		ID, known values is 0x50 (Pipe), 0x53 (Screen Frame) and
+ * 		0x56 (Vending Area);
+ * BRIGHTNESS	Can be 0x30 (OFF), 0x31 (ON).
+ * 		0x32 (Effect) can be used for 0x50 (leaking) and
+ * 		for 0x53 (blinking).
+ *
+ * LEDs MCU board expects 20 msec delay per byte.
+ */
+
+/* EL15203000 default settings */
+#define EL_MAX_BRIGHTNESS	2
+#define EL_FW_DELAY_USEC	20000
+
+struct el15203000_led {
+	char			name[LED_MAX_NAME_SIZE];
+	struct el15203000	*priv;
+	struct led_classdev	ldev;
+	u8			reg;
+};
+
+struct el15203000 {
+	size_t			count;
+	struct device		*dev;
+	struct mutex		lock;
+	struct spi_device	*spi;
+	unsigned long		delay;
+	struct el15203000_led	leds[];
+};
+
+static int el15203000_set_sync(struct led_classdev *ldev,
+			      enum led_brightness brightness)
+{
+	int			ret;
+	u8			cmd[2];
+	size_t			i;
+	unsigned long		udelay, now;
+	struct el15203000_led	*led = container_of(ldev,
+						    struct el15203000_led,
+						    ldev);
+
+	mutex_lock(&led->priv->lock);
+
+	dev_dbg(led->priv->dev, "Set brightness of %s to %d",
+		led->name, brightness);
+
+	/* to avoid SPI mistiming with firmware we should wait some time */
+	now = jiffies;
+	if (time_after(led->priv->delay, now)) {
+		udelay = jiffies_to_usecs(led->priv->delay - now);
+
+		dev_dbg(led->priv->dev, "Wait %luus to synch", udelay);
+		usleep_range(udelay, udelay + 1);
+	}
+
+	cmd[0] = led->reg;
+	cmd[1] = 0x30 + (u8)brightness;
+
+	for (i = 0; i < ARRAY_SIZE(cmd); i++) {
+		if (i)
+			usleep_range(EL_FW_DELAY_USEC,
+				     EL_FW_DELAY_USEC + 1);
+
+		ret = spi_write(led->priv->spi, &cmd[i], sizeof(cmd[i]));
+		if (ret) {
+			dev_err(led->priv->dev,
+				"spi_write() error %d\n", ret);
+			break;
+		}
+	}
+
+	led->priv->delay = jiffies + usecs_to_jiffies(EL_FW_DELAY_USEC);
+
+	mutex_unlock(&led->priv->lock);
+
+	return ret;
+}
+
+static int el15203000_probe_dt(struct el15203000 *priv)
+{
+	size_t			i = 0;
+	struct el15203000_led	*led;
+	struct fwnode_handle	*child;
+	int			ret;
+	const char		*str;
+	u32			reg;
+
+	device_for_each_child_node(priv->dev, child) {
+		led = &priv->leds[i];
+
+		ret = fwnode_property_read_u32(child, "reg", &reg);
+		if (ret) {
+			dev_err(priv->dev, "LED without ID number");
+			fwnode_handle_put(child);
+
+			return ret;
+		}
+
+		if (reg > U8_MAX) {
+			dev_err(priv->dev, "LED value %d is invalid", reg);
+			fwnode_handle_put(child);
+
+			return -EINVAL;
+		}
+
+		led->reg = reg;
+
+		ret = fwnode_property_read_string(child, "label", &str);
+		if (ret)
+			snprintf(led->name, sizeof(led->name),
+				 "el15203000::");
+		else
+			snprintf(led->name, sizeof(led->name),
+				 "el15203000:%s", str);
+
+		fwnode_property_read_string(child, "linux,default-trigger",
+					    &led->ldev.default_trigger);
+
+		led->priv			  = priv;
+		led->ldev.name			  = led->name;
+		led->ldev.brightness_set_blocking = el15203000_set_sync;
+
+		ret = fwnode_property_read_u32(child, "max-brightness",
+					       &led->ldev.max_brightness);
+
+		if (!ret && led->ldev.max_brightness > EL_MAX_BRIGHTNESS) {
+			dev_err(priv->dev, "invalid max brightness %d",
+				led->ldev.max_brightness);
+			fwnode_handle_put(child);
+
+			return -EINVAL;
+		} else
+			led->ldev.max_brightness = LED_ON;
+
+		ret = devm_led_classdev_register(priv->dev, &led->ldev);
+		if (ret) {
+			dev_err(priv->dev,
+				"failed to register LED device %s, err %d",
+				led->name, ret);
+			fwnode_handle_put(child);
+			return ret;
+		}
+
+		i++;
+	}
+
+	return ret;
+}
+
+static int el15203000_probe(struct spi_device *spi)
+{
+	struct el15203000	*priv;
+	size_t			count;
+	int			ret;
+
+	count = device_get_child_node_count(&spi->dev);
+	if (!count) {
+		dev_err(&spi->dev, "LEDs are not defined in device tree!");
+		return -ENODEV;
+	}
+
+	priv = devm_kzalloc(&spi->dev, struct_size(priv, leds, count),
+			    GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	mutex_init(&priv->lock);
+	priv->count	= count;
+	priv->dev	= &spi->dev;
+	priv->spi	= spi;
+	priv->delay	= jiffies -
+			  usecs_to_jiffies(EL_FW_DELAY_USEC);
+
+	ret = el15203000_probe_dt(priv);
+	if (ret)
+		return ret;
+
+	spi_set_drvdata(spi, priv);
+	dev_dbg(priv->dev, "%zd LEDs registered", priv->count);
+
+	return 0;
+}
+
+static int el15203000_remove(struct spi_device *spi)
+{
+	struct el15203000 *priv = spi_get_drvdata(spi);
+
+	mutex_destroy(&priv->lock);
+
+	return 0;
+}
+
+static const struct of_device_id el15203000_dt_ids[] = {
+	{ .compatible = "crane,el15203000", },
+	{},
+};
+
+MODULE_DEVICE_TABLE(of, el15203000_dt_ids);
+
+static struct spi_driver el15203000_driver = {
+	.probe		= el15203000_probe,
+	.remove		= el15203000_remove,
+	.driver = {
+		.name		= KBUILD_MODNAME,
+		.of_match_table	= el15203000_dt_ids,
+	},
+};
+
+module_spi_driver(el15203000_driver);
+
+MODULE_AUTHOR("Oleh Kravchenko <oleg@kaa.org.ua>");
+MODULE_DESCRIPTION("el15203000 LED driver");
+MODULE_LICENSE("GPL v2");
+MODULE_ALIAS("spi:el15203000");
-- 
2.21.0

