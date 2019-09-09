Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 71FABAD384
	for <lists+linux-leds@lfdr.de>; Mon,  9 Sep 2019 09:16:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732308AbfIIHQr (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 9 Sep 2019 03:16:47 -0400
Received: from smtp.220.in.ua ([89.184.67.205]:45546 "EHLO smtp.220.in.ua"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727546AbfIIHQq (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Mon, 9 Sep 2019 03:16:46 -0400
Received: from oleh-pc.lan (unknown [95.67.115.55])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by smtp.220.in.ua (Postfix) with ESMTPSA id 960011A244A4;
        Mon,  9 Sep 2019 10:16:43 +0300 (EEST)
From:   Oleh Kravchenko <oleg@kaa.org.ua>
To:     devicetree@vger.kernel.org, linux-leds@vger.kernel.org,
        jacek.anaszewski@gmail.com, pavel@ucw.cz
Cc:     Oleh Kravchenko <oleg@kaa.org.ua>
Subject: [PATCH v7 2/2] leds: add LED driver for EL15203000 board
Date:   Mon,  9 Sep 2019 10:16:32 +0300
Message-Id: <20190909071632.14392-3-oleg@kaa.org.ua>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190909071632.14392-1-oleg@kaa.org.ua>
References: <20190909071632.14392-1-oleg@kaa.org.ua>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

This patch adds a LED class driver for the LEDs found on
the Crane Merchandising System EL15203000 LEDs board
(aka RED LEDs board).

Signed-off-by: Oleh Kravchenko <oleg@kaa.org.ua>
---
 .../testing/sysfs-class-led-driver-el15203000 |  32 ++
 drivers/leds/Kconfig                          |  13 +
 drivers/leds/Makefile                         |   1 +
 drivers/leds/leds-el15203000.c                | 356 ++++++++++++++++++
 4 files changed, 402 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-class-led-driver-el15203000
 create mode 100644 drivers/leds/leds-el15203000.c

diff --git a/Documentation/ABI/testing/sysfs-class-led-driver-el15203000 b/Documentation/ABI/testing/sysfs-class-led-driver-el15203000
new file mode 100644
index 000000000000..5e9cbf49da59
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-class-led-driver-el15203000
@@ -0,0 +1,32 @@
+What:		/sys/class/leds/<led>/hw_pattern
+Date:		September 2019
+KernelVersion:	5.5
+Description:
+		Specify a hardware pattern for the EL15203000 LED.
+		The LEDs board supports only predefined patterns by firmware
+		for specific LEDs.
+
+		Breathing mode for Screen frame light tube:
+		"0 4000 1 4000"
+
+		Cascade mode for Pipe LED:
+		"1 800 2 800 4 800 8 800 16 800"
+
+		Inverted cascade mode for Pipe LED:
+		"30 800 29 800 27 800 23 800 15 800"
+
+		Bounce mode for Pipe LED:
+		"1 800 2 800 4 800 8 800 16 800 16 800 8 800 4 800 2 800 1 800"
+
+		Inverted bounce mode for Pipe LED:
+		"30 800 29 800 27 800 23 800 15 800 15 800 23 800 27 800 29 800 30 800"
+
+What:		/sys/class/leds/<led>/repeat
+Date:		September 2019
+KernelVersion:	5.5
+Description:
+		EL15203000 supports only indefinitely patterns,
+		so this file should always store -1.
+
+		For more info, please see:
+		Documentation/ABI/testing/sysfs-class-led-trigger-pattern
diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index 1988de1d64c0..6e7703fd03d0 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -132,6 +132,19 @@ config LEDS_CR0014114
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
index 41fb073a39c1..2da39e896ce8 100644
--- a/drivers/leds/Makefile
+++ b/drivers/leds/Makefile
@@ -89,6 +89,7 @@ obj-$(CONFIG_LEDS_LM36274)		+= leds-lm36274.o
 # LED SPI Drivers
 obj-$(CONFIG_LEDS_CR0014114)		+= leds-cr0014114.o
 obj-$(CONFIG_LEDS_DAC124S085)		+= leds-dac124s085.o
+obj-$(CONFIG_LEDS_EL15203000)		+= leds-el15203000.o
 
 # LED Userspace Drivers
 obj-$(CONFIG_LEDS_USER)			+= uleds.o
diff --git a/drivers/leds/leds-el15203000.c b/drivers/leds/leds-el15203000.c
new file mode 100644
index 000000000000..1d59a53f9ecc
--- /dev/null
+++ b/drivers/leds/leds-el15203000.c
@@ -0,0 +1,356 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright (c) 2019 Crane Merchandising Systems. All rights reserved.
+// Copyright (C) 2019 Oleh Kravchenko <oleg@kaa.org.ua>
+
+#include <linux/delay.h>
+#include <linux/leds.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include <linux/spi/spi.h>
+
+/*
+ * EL15203000 SPI protocol description:
+ * +-----+---------+
+ * | LED | COMMAND |
+ * +-----+---------+
+ * |  1  |    1    |
+ * +-----+---------+
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
+ * COMMAND:
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
+#define EL_FW_DELAY_USEC	20000ul
+#define EL_PATTERN_DELAY_MSEC	800u
+#define EL_PATTERN_LEN		10u
+#define EL_PATTERN_HALF_LEN	(EL_PATTERN_LEN / 2)
+
+enum el15203000_command {
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
+	u32			reg;
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
+
+	mutex_lock(&led->priv->lock);
+
+	dev_dbg(led->priv->dev, "Set brightness of 0x%02x(%c) to 0x%02x(%c)",
+		led->reg, led->reg, brightness, brightness);
+
+	/* to avoid SPI mistiming with firmware we should wait some time */
+	if (time_after(led->priv->delay, jiffies)) {
+		dev_dbg(led->priv->dev, "Wait %luus to sync",
+			EL_FW_DELAY_USEC);
+
+		usleep_range(EL_FW_DELAY_USEC,
+			     EL_FW_DELAY_USEC + 1);
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
+static int el15203000_pattern_set_S(struct led_classdev *ldev,
+				    struct led_pattern *pattern,
+				    u32 len, int repeat)
+{
+	struct el15203000_led	*led = container_of(ldev,
+						    struct el15203000_led,
+						    ldev);
+
+	if (repeat > 0 || len != 2 ||
+	    pattern[0].delta_t != 4000 || pattern[0].brightness != 0 ||
+	    pattern[1].delta_t != 4000 || pattern[1].brightness != 1)
+		return -EINVAL;
+
+	dev_dbg(led->priv->dev, "Breathing mode for 0x%02x(%c)",
+		led->reg, led->reg);
+
+	return el15203000_cmd(led, EL_SCREEN_BREATHING);
+}
+
+static bool is_cascade(const struct led_pattern *pattern, u32 len,
+		       bool inv, bool right)
+{
+	int val, t;
+	u32 i;
+
+	if (len != EL_PATTERN_HALF_LEN)
+		return false;
+
+	val = right ? BIT(4) : BIT(0);
+
+	for (i = 0; i < len; i++) {
+		t = inv ? ~val & GENMASK(4, 0) : val;
+
+		if (pattern[i].delta_t != EL_PATTERN_DELAY_MSEC ||
+		    pattern[i].brightness != t)
+			return false;
+
+		val = right ? val >> 1 : val << 1;
+	}
+
+	return true;
+}
+
+static bool is_bounce(const struct led_pattern *pattern, u32 len, bool inv)
+{
+	if (len != EL_PATTERN_LEN)
+		return false;
+
+	return is_cascade(pattern, EL_PATTERN_HALF_LEN, inv, false) &&
+	       is_cascade(pattern +  EL_PATTERN_HALF_LEN,
+			  EL_PATTERN_HALF_LEN, inv, true);
+}
+
+static int el15203000_pattern_set_P(struct led_classdev *ldev,
+				    struct led_pattern *pattern,
+				    u32 len, int repeat)
+{
+	struct el15203000_led	*led = container_of(ldev,
+						    struct el15203000_led,
+						    ldev);
+
+	if (repeat > 0)
+		return -EINVAL;
+
+	if (is_cascade(pattern, len, false, false)) {
+		dev_dbg(led->priv->dev, "Cascade mode for 0x%02x(%c)",
+			led->reg, led->reg);
+
+		return el15203000_cmd(led, EL_PIPE_CASCADE);
+	} else if (is_cascade(pattern, len, true, false)) {
+		dev_dbg(led->priv->dev, "Inverse cascade mode for 0x%02x(%c)",
+			led->reg, led->reg);
+
+		return el15203000_cmd(led, EL_PIPE_INV_CASCADE);
+	} else if (is_bounce(pattern, len, false)) {
+		dev_dbg(led->priv->dev, "Bounce mode for 0x%02x(%c)",
+			led->reg, led->reg);
+
+		return el15203000_cmd(led, EL_PIPE_BOUNCE);
+	} else if (is_bounce(pattern, len, true)) {
+		dev_dbg(led->priv->dev, "Inverse bounce mode for 0x%02x(%c)",
+			led->reg, led->reg);
+
+		return el15203000_cmd(led, EL_PIPE_INV_BOUNCE);
+	}
+
+	return -EINVAL;
+}
+
+static int el15203000_pattern_clear(struct led_classdev *ldev)
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
+	struct el15203000_led	*led = priv->leds;
+	struct fwnode_handle	*child;
+	int			ret;
+
+	device_for_each_child_node(priv->dev, child) {
+		struct led_init_data	init_data = {};
+
+		ret = fwnode_property_read_u32(child, "reg", &led->reg);
+		if (ret) {
+			dev_err(priv->dev, "LED without ID number");
+			fwnode_handle_put(child);
+
+			return ret;
+		}
+
+		if (led->reg > U8_MAX) {
+			dev_err(priv->dev, "LED value %d is invalid", led->reg);
+			fwnode_handle_put(child);
+
+			return -EINVAL;
+		}
+
+		fwnode_property_read_string(child, "linux,default-trigger",
+					    &led->ldev.default_trigger);
+
+		led->priv			  = priv;
+		led->ldev.max_brightness	  = LED_ON;
+		led->ldev.brightness_set_blocking = el15203000_set_blocking;
+
+		if (led->reg == 'S') {
+			led->ldev.pattern_set	= el15203000_pattern_set_S;
+			led->ldev.pattern_clear	= el15203000_pattern_clear;
+		} else if (led->reg == 'P') {
+			led->ldev.pattern_set	= el15203000_pattern_set_P;
+			led->ldev.pattern_clear	= el15203000_pattern_clear;
+		}
+
+		init_data.fwnode = child;
+		ret = devm_led_classdev_register_ext(priv->dev, &led->ldev,
+						     &init_data);
+		if (ret) {
+			dev_err(priv->dev,
+				"failed to register LED device %s, err %d",
+				led->ldev.name, ret);
+			fwnode_handle_put(child);
+
+			return ret;
+		}
+
+		led++;
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

