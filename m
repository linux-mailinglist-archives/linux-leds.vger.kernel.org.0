Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 434BB86B9D
	for <lists+linux-leds@lfdr.de>; Thu,  8 Aug 2019 22:35:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390415AbfHHUfE (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 8 Aug 2019 16:35:04 -0400
Received: from smtp.220.in.ua ([89.184.67.205]:56839 "EHLO smtp.220.in.ua"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390399AbfHHUfE (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Thu, 8 Aug 2019 16:35:04 -0400
Received: from oleh-pc.lan (unknown [95.67.115.55])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by smtp.220.in.ua (Postfix) with ESMTPSA id 870DD1A210DF;
        Thu,  8 Aug 2019 23:35:00 +0300 (EEST)
From:   Oleh Kravchenko <oleg@kaa.org.ua>
To:     devicetree@vger.kernel.org, linux-leds@vger.kernel.org
Cc:     Oleh Kravchenko <oleg@kaa.org.ua>
Subject: [PATCH v4 2/2] leds: add LED driver for EL15203000 board
Date:   Thu,  8 Aug 2019 23:32:05 +0300
Message-Id: <20190808203204.8614-2-oleg@kaa.org.ua>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190808203204.8614-1-oleg@kaa.org.ua>
References: <20190808203204.8614-1-oleg@kaa.org.ua>
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
 .../testing/sysfs-class-led-driver-el15203000 |  22 +
 drivers/leds/Kconfig                          |  13 +
 drivers/leds/Makefile                         |   1 +
 drivers/leds/leds-el15203000.c                | 478 ++++++++++++++++++
 4 files changed, 514 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-class-led-driver-el15203000
 create mode 100644 drivers/leds/leds-el15203000.c

diff --git a/Documentation/ABI/testing/sysfs-class-led-driver-el15203000 b/Documentation/ABI/testing/sysfs-class-led-driver-el15203000
new file mode 100644
index 000000000000..91a483e493d9
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-class-led-driver-el15203000
@@ -0,0 +1,22 @@
+What:		/sys/class/leds/<led>/hw_pattern
+Date:		August 2019
+KernelVersion:	5.3
+Description:
+		Specify a hardware pattern for the EL15203000 LED.
+		The LEDs board supports only predefined patterns by firmware
+		for specific LEDs.
+
+		Breathing mode for Screen frame light tube:
+		"0 4000 1 4000"
+
+		Cascade mode for Pipe LED:
+		"1 800 2 800 4 800 8 800 16 800 1 800 2 800 4 800 8 800 16 800"
+
+		Inverted cascade mode for Pipe LED:
+		"30 800 29 800 27 800 23 800 15 800 30 800 29 800 27 800 23 800 15 800"
+
+		Bounce mode for Pipe LED:
+		"1 800 2 800 4 800 8 800 16 800 16 800 8 800 4 800 2 800 1 800"
+
+		Inverted bounce mode for Pipe LED:
+		"30 800 29 800 27 800 23 800 15 800 15 800 23 800 27 800 29 800 30 800"
diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index 760f73a49c9f..0cbdb9ba5213 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -129,6 +129,19 @@ config LEDS_CR0014114
 	  To compile this driver as a module, choose M here: the module
 	  will be called leds-cr0014114.
 
+config LEDS_EL15203000
+	tristate "LED Support for Crane EL15203000"
+	depends on LEDS_CLASS
+	depends on SPI
+	depends on OF
+	help
+	  This option enables support for EL15203000 LED Board
+	  (aka RED LED board) which is widely used in coffee vending
+	  machines produced by Crane Merchandising Systems.
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
index 000000000000..c62da5ec6630
--- /dev/null
+++ b/drivers/leds/leds-el15203000.c
@@ -0,0 +1,478 @@
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
+ * EL15203000 SPI protocol description:
+ * +-----+------------+
+ * | LED | BRIGHTNESS |
+ * +-----+------------+
+ * |  1  |      1     |
+ * +-----+------------+
+ * (*) LEDs MCU board expects 20 msec delay per byte.
+ *
+ * LEDs:
+ * +----------+--------------+-------------------------------------------+
+ * |    ID    |     NAME     |         DESCRIPTION                       |
+ * +----------+--------------+-------------------------------------------+
+ * | 'P' 0x50 |     Pipe     | Consists from 5 LEDs, controlled by board |
+ * +----------+--------------+-------------------------------------------+
+ * | 'S' 0x53 | Screen frame | Light tube around the screen              |
+ * +----------+--------------+-------------------------------------------+
+ * | 'V' 0x56 | Vending area | Highlights a cup of coffee                |
+ * +----------+--------------+-------------------------------------------+
+ *
+ * BRIGHTNESS:
+ * +----------+-----------------+--------------+--------------+
+ * |  VALUES  |       PIPE      | SCREEN FRAME | VENDING AREA |
+ * +----------+-----------------+--------------+--------------+
+ * | '0' 0x30 |                      Off                      |
+ * +----------+-----------------------------------------------+
+ * | '1' 0x31 |                      On                       |
+ * +----------+-----------------+--------------+--------------+
+ * | '2' 0x32 |     Cascade     |   Breathing  |
+ * +----------+-----------------+--------------+
+ * | '3' 0x33 | Inverse cascade |
+ * +----------+-----------------+
+ * | '4' 0x34 |     Bounce      |
+ * +----------+-----------------+
+ * | '5' 0x35 | Inverse bounce  |
+ * +----------+-----------------+
+ */
+
+/* EL15203000 default settings */
+#define EL_FW_DELAY_USEC	20000
+
+enum el15203000_brightness {
+	/* for all LEDs */
+	EL_OFF			= '0',
+	EL_ON			= '1',
+
+	/* for Screen LED */
+	EL_SCREEN_BREATHING	= '2',
+
+	/* for Pipe LED */
+	EL_PIPE_CASCADE		= '2',
+	EL_PIPE_INV_CASCADE	= '3',
+	EL_PIPE_BOUNCE		= '4',
+	EL_PIPE_INV_BOUNCE	= '5',
+};
+
+struct el15203000_led {
+	struct el15203000	*priv;
+	struct led_classdev	ldev;
+	char			name[LED_MAX_NAME_SIZE];
+	u8			reg;
+};
+
+struct el15203000 {
+	struct device		*dev;
+	struct mutex		lock;
+	struct spi_device	*spi;
+	unsigned long		delay;
+	size_t			count;
+	struct el15203000_led	leds[];
+};
+
+static int el15203000_cmd(struct el15203000_led *led, u8 brightness)
+{
+	int		ret;
+	u8		cmd[2];
+	size_t		i;
+	unsigned long	jdelay, udelay, now;
+
+	mutex_lock(&led->priv->lock);
+
+	dev_dbg(led->priv->dev, "Set brightness of %s to %d",
+		led->name, brightness);
+
+	/* to avoid SPI mistiming with firmware we should wait some time */
+	now = jiffies;
+	if (time_after(led->priv->delay, now)) {
+		jdelay = led->priv->delay - now;
+		udelay = jiffies_to_usecs(jdelay);
+
+		dev_dbg(led->priv->dev, "Wait %luus (%lu jiffies) to sync",
+			udelay, jdelay);
+
+		usleep_range(udelay, udelay + 1);
+	}
+
+	cmd[0] = led->reg;
+	cmd[1] = brightness;
+
+	for (i = 0; i < ARRAY_SIZE(cmd); i++) {
+		if (i)
+			usleep_range(EL_FW_DELAY_USEC,
+				     EL_FW_DELAY_USEC + 1);
+
+		ret = spi_write(led->priv->spi, &cmd[i], sizeof(cmd[i]));
+		if (ret) {
+			dev_err(led->priv->dev,
+				"spi_write() error %d", ret);
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
+static int el15203000_set_blocking(struct led_classdev *ldev,
+				   enum led_brightness brightness)
+{
+	struct el15203000_led	*led = container_of(ldev,
+						    struct el15203000_led,
+						    ldev);
+
+	return el15203000_cmd(led, brightness == LED_OFF ? EL_OFF : EL_ON);
+}
+
+static int led_pattern_cmp(const struct led_pattern *p1, u32 p1_len,
+			   const struct led_pattern *p2, u32 p2_len)
+{
+	u32 i;
+
+	if (p1_len != p2_len)
+		return -1;
+
+	for (i = 0; i < p1_len; i ++)
+		if (p1[i].delta_t != p2[i].delta_t ||
+		    p1[i].brightness != p2[i].brightness)
+			return -1;
+
+	return 0;
+}
+
+int el15203000_pattern_set_S(struct led_classdev *ldev,
+			     struct led_pattern *pattern,
+			     u32 len, int repeat)
+{
+	struct el15203000_led	*led = container_of(ldev,
+						    struct el15203000_led,
+						    ldev);
+	struct led_pattern	scr_pattern[] = {{
+		.delta_t	= 4000,
+		.brightness	= 0,
+	}, {
+		.delta_t	= 4000,
+		.brightness	= 1,
+	}};
+
+	if (repeat > 0)
+		return -EINVAL;
+
+	if (led_pattern_cmp(scr_pattern, ARRAY_SIZE(scr_pattern), pattern, len))
+		return -EINVAL;
+
+	dev_dbg(led->priv->dev, "Breathing mode for '%s'", led->name);
+
+	return el15203000_cmd(led, EL_SCREEN_BREATHING);
+}
+
+int el15203000_pattern_set_P(struct led_classdev *ldev,
+			   struct led_pattern *pattern,
+			   u32 len, int repeat)
+{
+	struct el15203000_led	*led = container_of(ldev,
+						    struct el15203000_led,
+						    ldev);
+
+	struct led_pattern cascade[] = {{
+		.delta_t	= 800,
+		.brightness	= 1,
+	}, {
+		.delta_t	= 800,
+		.brightness	= 2,
+	}, {
+		.delta_t	= 800,
+		.brightness	= 4,
+	}, {
+		.delta_t	= 800,
+		.brightness	= 8,
+	}, {
+		.delta_t	= 800,
+		.brightness	= 16,
+	}, {
+		.delta_t	= 800,
+		.brightness	= 1,
+	}, {
+		.delta_t	= 800,
+		.brightness	= 2,
+	}, {
+		.delta_t	= 800,
+		.brightness	= 4,
+	}, {
+		.delta_t	= 800,
+		.brightness	= 8,
+	}, {
+		.delta_t	= 800,
+		.brightness	= 16,
+	}};
+
+	struct led_pattern inv_cascade[] = {{
+		.delta_t	= 800,
+		.brightness	= 30,
+	}, {
+		.delta_t	= 800,
+		.brightness	= 29,
+	}, {
+		.delta_t	= 800,
+		.brightness	= 27,
+	}, {
+		.delta_t	= 800,
+		.brightness	= 23,
+	}, {
+		.delta_t	= 800,
+		.brightness	= 15,
+	}, {
+		.delta_t	= 800,
+		.brightness	= 30,
+	}, {
+		.delta_t	= 800,
+		.brightness	= 29,
+	}, {
+		.delta_t	= 800,
+		.brightness	= 27,
+	}, {
+		.delta_t	= 800,
+		.brightness	= 23,
+	}, {
+		.delta_t	= 800,
+		.brightness	= 15,
+	}};
+
+	struct led_pattern	bounce[] = {{
+		.delta_t	= 800,
+		.brightness	= 1,
+	}, {
+		.delta_t	= 800,
+		.brightness	= 2,
+	}, {
+		.delta_t	= 800,
+		.brightness	= 4,
+	}, {
+		.delta_t	= 800,
+		.brightness	= 8,
+	}, {
+		.delta_t	= 800,
+		.brightness	= 16,
+	}, {
+		.delta_t	= 800,
+		.brightness	= 16,
+	}, {
+		.delta_t	= 800,
+		.brightness	= 8,
+	}, {
+		.delta_t	= 800,
+		.brightness	= 4,
+	}, {
+		.delta_t	= 800,
+		.brightness	= 2,
+	}, {
+		.delta_t	= 800,
+		.brightness	= 1,
+	}};
+
+	struct led_pattern	inv_bounce[] = {{
+		.delta_t	= 800,
+		.brightness	= 30,
+	}, {
+		.delta_t	= 800,
+		.brightness	= 29,
+	}, {
+		.delta_t	= 800,
+		.brightness	= 27,
+	}, {
+		.delta_t	= 800,
+		.brightness	= 23,
+	}, {
+		.delta_t	= 800,
+		.brightness	= 15,
+	}, {
+		.delta_t	= 800,
+		.brightness	= 15,
+	}, {
+		.delta_t	= 800,
+		.brightness	= 23,
+	}, {
+		.delta_t	= 800,
+		.brightness	= 27,
+	}, {
+		.delta_t	= 800,
+		.brightness	= 29,
+	}, {
+		.delta_t	= 800,
+		.brightness	= 30,
+	}};
+
+	if (repeat > 0)
+		return -EINVAL;
+
+	if (!led_pattern_cmp(cascade, ARRAY_SIZE(cascade), pattern, len)) {
+		dev_dbg(led->priv->dev, "Cascade mode for '%s'", led->name);
+		return el15203000_cmd(led, EL_PIPE_CASCADE);
+	} else if (!led_pattern_cmp(inv_cascade, ARRAY_SIZE(inv_cascade), pattern, len)) {
+		dev_dbg(led->priv->dev, "Inverse cascade mode for '%s'", led->name);
+		return el15203000_cmd(led, EL_PIPE_INV_CASCADE);
+	} else if (!led_pattern_cmp(bounce, ARRAY_SIZE(bounce), pattern, len)) {
+		dev_dbg(led->priv->dev, "Bounce mode for '%s'", led->name);
+		return el15203000_cmd(led, EL_PIPE_BOUNCE);
+	} else if (!led_pattern_cmp(inv_bounce, ARRAY_SIZE(inv_bounce), pattern, len)) {
+		dev_dbg(led->priv->dev, "Inverse bounce mode for '%s'", led->name);
+		return el15203000_cmd(led, EL_PIPE_INV_BOUNCE);
+	}
+
+	return -EINVAL;
+}
+
+int el15203000_pattern_clear(struct led_classdev *ldev)
+{
+	struct el15203000_led	*led = container_of(ldev,
+						    struct el15203000_led,
+						    ldev);
+
+	return el15203000_cmd(led, EL_OFF);
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
+			str = ":";
+		snprintf(led->name, sizeof(led->name), "el15203000:%s", str);
+
+		fwnode_property_read_string(child, "linux,default-trigger",
+					    &led->ldev.default_trigger);
+
+		led->ldev.max_brightness	  = LED_ON;
+		led->priv			  = priv;
+		led->ldev.name			  = led->name;
+		led->ldev.brightness_set_blocking = el15203000_set_blocking;
+
+		if (reg == 'S') {
+			led->ldev.pattern_set	= el15203000_pattern_set_S;
+			led->ldev.pattern_clear	= el15203000_pattern_clear;
+		} else if (reg == 'P') {
+			led->ldev.pattern_set	= el15203000_pattern_set_P;
+			led->ldev.pattern_clear	= el15203000_pattern_clear;
+		}
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

