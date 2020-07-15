Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F26C220D1E
	for <lists+linux-leds@lfdr.de>; Wed, 15 Jul 2020 14:41:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730054AbgGOMki (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 15 Jul 2020 08:40:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728975AbgGOMki (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 15 Jul 2020 08:40:38 -0400
Received: from mail.nic.cz (lists.nic.cz [IPv6:2001:1488:800:400::400])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2938C061755
        for <linux-leds@vger.kernel.org>; Wed, 15 Jul 2020 05:40:37 -0700 (PDT)
Received: from dellmb.labs.office.nic.cz (unknown [IPv6:2001:1488:fffe:6:cac7:3539:7f1f:463])
        by mail.nic.cz (Postfix) with ESMTP id 6F5EC140A65;
        Wed, 15 Jul 2020 14:40:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
        t=1594816835; bh=gqjfbuZIbO0RJxCskr/rTCStm1ypaGzQ25vNjhNpZzw=;
        h=From:To:Date;
        b=eRzQGCMFs0USH3AqmPNEo8wTLJlf0jT7Gh8Pll5Rp8x9a+Qy5y5wZDjfYl+BYo1zu
         cQZ0HB16s52xlieAthzPZ/VbePdMsJH5ss2dX8bnxcwO3/Op6OgJNyw36aZv/jtqqh
         P0cPqFyff1WlxzIU2oQKeI821bNbXAxDW5csDGkc=
From:   =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>
To:     linux-leds@vger.kernel.org
Cc:     Pavel Machek <pavel@ucw.cz>, jacek.anaszewski@gmail.com,
        Dan Murphy <dmurphy@ti.com>,
        =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>
Subject: [PATCH v4 2/2] leds: initial support for Turris Omnia LEDs
Date:   Wed, 15 Jul 2020 14:40:34 +0200
Message-Id: <20200715124034.9804-3-marek.behun@nic.cz>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200715124034.9804-1-marek.behun@nic.cz>
References: <20200715124034.9804-1-marek.behun@nic.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.nic.cz
X-Spam-Status: No, score=0.00
X-Spamd-Bar: /
X-Virus-Scanned: clamav-milter 0.102.2 at mail
X-Virus-Status: Clean
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

This adds basic support for LEDs on the front side of CZ.NIC's Turris
Omnia router.

There are 12 RGB LEDs. The controller supports HW triggering mode for
the LEDs, but this driver does not support it yet, and sets all the LEDs
defined in device-tree into SW mode upon probe.

This driver uses the multi color LED framework.

Signed-off-by: Marek Behún <marek.behun@nic.cz>
---
 drivers/leds/Kconfig             |  11 ++
 drivers/leds/Makefile            |   1 +
 drivers/leds/leds-turris-omnia.c | 296 +++++++++++++++++++++++++++++++
 3 files changed, 308 insertions(+)
 create mode 100644 drivers/leds/leds-turris-omnia.c

diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index 68f63d1a7d48..ce365a22445d 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -176,6 +176,17 @@ config LEDS_EL15203000
 	  To compile this driver as a module, choose M here: the module
 	  will be called leds-el15203000.
 
+config LEDS_TURRIS_OMNIA
+	tristate "LED support for CZ.NIC's Turris Omnia"
+	depends on LEDS_CLASS_MULTI_COLOR
+	depends on I2C
+	depends on MACH_ARMADA_38X || COMPILE_TEST
+	depends on OF
+	help
+	  This option enables basic support for the LEDs found on the front
+	  side of CZ.NIC's Turris Omnia router. There are 12 RGB LEDs on the
+	  front panel.
+
 config LEDS_LM3530
 	tristate "LCD Backlight driver for LM3530"
 	depends on LEDS_CLASS
diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
index 68c05faec99e..0dcea0322fd3 100644
--- a/drivers/leds/Makefile
+++ b/drivers/leds/Makefile
@@ -88,6 +88,7 @@ obj-$(CONFIG_LEDS_TCA6507)		+= leds-tca6507.o
 obj-$(CONFIG_LEDS_TI_LMU_COMMON)	+= leds-ti-lmu-common.o
 obj-$(CONFIG_LEDS_TLC591XX)		+= leds-tlc591xx.o
 obj-$(CONFIG_LEDS_TPS6105X)		+= leds-tps6105x.o
+obj-$(CONFIG_LEDS_TURRIS_OMNIA)		+= leds-turris-omnia.o
 obj-$(CONFIG_LEDS_WM831X_STATUS)	+= leds-wm831x-status.o
 obj-$(CONFIG_LEDS_WM8350)		+= leds-wm8350.o
 obj-$(CONFIG_LEDS_WRAP)			+= leds-wrap.o
diff --git a/drivers/leds/leds-turris-omnia.c b/drivers/leds/leds-turris-omnia.c
new file mode 100644
index 000000000000..0aa79abf0ed4
--- /dev/null
+++ b/drivers/leds/leds-turris-omnia.c
@@ -0,0 +1,296 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * CZ.NIC's Turris Omnia LEDs driver
+ *
+ * 2020 by Marek Behun <marek.behun@nic.cz>
+ */
+
+#include <linux/i2c.h>
+#include <linux/led-class-multicolor.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/of.h>
+#include "leds.h"
+
+#define OMNIA_BOARD_LEDS		12
+
+#define CMD_LED_MODE			3
+#define CMD_LED_MODE_LED(l)		((l) & 0x0f)
+#define CMD_LED_MODE_USER		0x10
+
+#define CMD_LED_STATE			4
+#define CMD_LED_STATE_LED(l)		((l) & 0x0f)
+#define CMD_LED_STATE_ON		0x10
+
+#define CMD_LED_COLOR			5
+#define CMD_LED_SET_BRIGHTNESS		7
+#define CMD_LED_GET_BRIGHTNESS		8
+
+#define OMNIA_CMD			0
+
+#define OMNIA_CMD_LED_COLOR_LED		1
+#define OMNIA_CMD_LED_COLOR_R		2
+#define OMNIA_CMD_LED_COLOR_G		3
+#define OMNIA_CMD_LED_COLOR_B		4
+#define OMNIA_CMD_LED_COLOR_LEN		5
+
+struct omnia_led {
+	struct led_classdev_mc mc_cdev;
+	struct mc_subled subled_info[3];
+	int reg;
+};
+
+#define to_omnia_led(l)		container_of(l, struct omnia_led, mc_cdev)
+
+struct omnia_leds {
+	struct i2c_client *client;
+	struct mutex lock;
+	int nleds;
+	struct omnia_led leds[0];
+};
+
+static int omnia_led_brightness_set_blocking(struct led_classdev *cdev,
+					     enum led_brightness brightness)
+{
+	struct led_classdev_mc *mc_cdev = lcdev_to_mccdev(cdev);
+	struct omnia_leds *leds = dev_get_drvdata(cdev->dev->parent);
+	struct omnia_led *led = to_omnia_led(mc_cdev);
+	u8 buf[OMNIA_CMD_LED_COLOR_LEN], state;
+	int ret;
+
+	led_mc_calc_color_components(&led->mc_cdev, brightness);
+
+	mutex_lock(&leds->lock);
+
+	buf[OMNIA_CMD] = CMD_LED_COLOR;
+	buf[OMNIA_CMD_LED_COLOR_LED] = led->reg;
+	buf[OMNIA_CMD_LED_COLOR_R] = mc_cdev->subled_info[0].brightness;
+	buf[OMNIA_CMD_LED_COLOR_G] = mc_cdev->subled_info[1].brightness;
+	buf[OMNIA_CMD_LED_COLOR_B] = mc_cdev->subled_info[2].brightness;
+
+	state = CMD_LED_STATE_LED(led->reg);
+	if (buf[OMNIA_CMD_LED_COLOR_R] || buf[OMNIA_CMD_LED_COLOR_G] || buf[OMNIA_CMD_LED_COLOR_B])
+		state |= CMD_LED_STATE_ON;
+
+	ret = i2c_smbus_write_byte_data(leds->client, CMD_LED_STATE, state);
+	if (ret >= 0 && (state & CMD_LED_STATE_ON))
+		ret = i2c_master_send(leds->client, buf, 5);
+
+	mutex_unlock(&leds->lock);
+
+	return ret;
+}
+
+static int omnia_led_register(struct omnia_leds *leds, struct device_node *np)
+{
+	struct i2c_client *client = leds->client;
+	struct led_init_data init_data = {};
+	struct device *dev = &client->dev;
+	struct led_classdev *cdev;
+	struct omnia_led *led;
+	int ret, color;
+
+	led = &leds->leds[leds->nleds];
+
+	ret = of_property_read_u32(np, "reg", &led->reg);
+	if (ret || led->reg >= OMNIA_BOARD_LEDS) {
+		dev_warn(dev,
+			 "Node %pOF: must contain 'reg' property with values between 0 and %i\n",
+			 np, OMNIA_BOARD_LEDS - 1);
+		return 0;
+	}
+
+	ret = of_property_read_u32(np, "color", &color);
+	if (ret || color != LED_COLOR_ID_MULTI) {
+		dev_warn(dev,
+			 "Node %pOF: must contain 'color' property with value LED_COLOR_ID_MULTI\n",
+			 np);
+		return 0;
+	}
+
+	led->subled_info[0].color_index = LED_COLOR_ID_RED;
+	led->subled_info[0].channel = 0;
+	led->subled_info[1].color_index = LED_COLOR_ID_GREEN;
+	led->subled_info[1].channel = 1;
+	led->subled_info[2].color_index = LED_COLOR_ID_BLUE;
+	led->subled_info[2].channel = 2;
+
+	led->mc_cdev.subled_info = led->subled_info;
+	led->mc_cdev.num_colors = 3;
+
+	init_data.fwnode = &np->fwnode;
+
+	cdev = &led->mc_cdev.led_cdev;
+	cdev->max_brightness = 255;
+	cdev->brightness_set_blocking = omnia_led_brightness_set_blocking;
+
+	of_property_read_string(np, "linux,default-trigger", &cdev->default_trigger);
+
+	/* put the LED into software mode */
+	ret = i2c_smbus_write_byte_data(client, CMD_LED_MODE,
+					CMD_LED_MODE_LED(led->reg) |
+					CMD_LED_MODE_USER);
+	if (ret < 0) {
+		dev_err(dev, "Cannot set LED %pOF to software mode: %i\n", np, ret);
+		return ret;
+	}
+
+	/* disable the LED */
+	ret = i2c_smbus_write_byte_data(client, CMD_LED_STATE, CMD_LED_STATE_LED(led->reg));
+	if (ret < 0) {
+		dev_err(dev, "Cannot set LED %pOF brightness: %i\n", np, ret);
+		return ret;
+	}
+
+	ret = devm_led_classdev_multicolor_register_ext(dev, &led->mc_cdev, &init_data);
+	if (ret < 0) {
+		dev_err(dev, "Cannot register LED %pOF: %i\n", np, ret);
+		return ret;
+	}
+
+	++leds->nleds;
+
+	return 0;
+}
+
+/*
+ * On the front panel of the Turris Omnia router there is also a button which can be used to control
+ * the intensity of all the LEDs at once, so that if they are too bright, user can dim them.
+ * The microcontroller cycles between 8 levels of this global brightness (from 100% to 0%), but this
+ * setting can have any integer value between 0 and 100.
+ * It is usable to be able to change this value from software, so that it does not start at 100%
+ * after every power on and annoy the user.
+ * We expose this setting via a sysfs attribute file called "brightness". This file lives in the
+ * device directory of the LED controller, not an individual LED, so it should not confuse users.
+ */
+static ssize_t brightness_show(struct device *dev, struct device_attribute *a, char *buf)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	struct omnia_leds *leds = i2c_get_clientdata(client);
+	int ret;
+
+	mutex_lock(&leds->lock);
+	ret = i2c_smbus_read_byte_data(client, CMD_LED_GET_BRIGHTNESS);
+	mutex_unlock(&leds->lock);
+
+	if (ret < 0)
+		return ret;
+
+	return sprintf(buf, "%d\n", ret);
+}
+
+static ssize_t brightness_store(struct device *dev, struct device_attribute *a, const char *buf,
+				size_t count)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	struct omnia_leds *leds = i2c_get_clientdata(client);
+	unsigned int brightness;
+	int ret;
+
+	if (sscanf(buf, "%u", &brightness) != 1)
+		return -EINVAL;
+
+	if (brightness > 100)
+		return -EINVAL;
+
+	mutex_lock(&leds->lock);
+	ret = i2c_smbus_write_byte_data(client, CMD_LED_SET_BRIGHTNESS, (u8) brightness);
+	mutex_unlock(&leds->lock);
+
+	if (ret < 0)
+		return ret;
+
+	return count;
+}
+static DEVICE_ATTR_RW(brightness);
+
+static struct attribute *omnia_led_controller_attrs[] = {
+	&dev_attr_brightness.attr,
+	NULL,
+};
+ATTRIBUTE_GROUPS(omnia_led_controller);
+
+static int omnia_leds_probe(struct i2c_client *client,
+			    const struct i2c_device_id *id)
+{
+	struct device *dev = &client->dev;
+	struct device_node *np = dev->of_node, *child;
+	struct omnia_leds *leds;
+	int ret, count;
+
+	count = of_get_available_child_count(np);
+	if (!count) {
+		dev_err(dev, "LEDs are not defined in device tree!\n");
+		return -ENODEV;
+	} else if (count > OMNIA_BOARD_LEDS) {
+		dev_err(dev, "Too many LEDs defined in device tree!\n");
+		return -EINVAL;
+	}
+
+	leds = devm_kzalloc(dev, sizeof(*leds) + count * sizeof(leds->leds[0]),
+			    GFP_KERNEL);
+	if (!leds)
+		return -ENOMEM;
+
+	leds->client = client;
+	i2c_set_clientdata(client, leds);
+
+	mutex_init(&leds->lock);
+
+	for_each_available_child_of_node(np, child) {
+		ret = omnia_led_register(leds, child);
+		if (ret < 0)
+			return ret;
+	}
+
+	if (devm_device_add_groups(dev, omnia_led_controller_groups))
+		dev_warn(dev, "Could not add attribute group!\n");
+
+	return 0;
+}
+
+static int omnia_leds_remove(struct i2c_client *client)
+{
+	u8 buf[OMNIA_CMD_LED_COLOR_LEN];
+
+	/* put all LEDs into default (HW triggered) mode */
+	i2c_smbus_write_byte_data(client, CMD_LED_MODE,
+				  CMD_LED_MODE_LED(OMNIA_BOARD_LEDS));
+
+	/* set all LEDs color to [255, 255, 255] */
+	buf[OMNIA_CMD] = CMD_LED_COLOR;
+	buf[OMNIA_CMD_LED_COLOR_LED] = OMNIA_BOARD_LEDS;
+	buf[OMNIA_CMD_LED_COLOR_R] = 255;
+	buf[OMNIA_CMD_LED_COLOR_G] = 255;
+	buf[OMNIA_CMD_LED_COLOR_B] = 255;
+
+	i2c_master_send(client, buf, 5);
+
+	return 0;
+}
+
+static const struct of_device_id of_omnia_leds_match[] = {
+	{ .compatible = "cznic,turris-omnia-leds", },
+	{},
+};
+
+static const struct i2c_device_id omnia_id[] = {
+	{ "omnia", 0 },
+	{ }
+};
+
+static struct i2c_driver omnia_leds_driver = {
+	.probe		= omnia_leds_probe,
+	.remove		= omnia_leds_remove,
+	.id_table	= omnia_id,
+	.driver		= {
+		.name	= "leds-turris-omnia",
+		.of_match_table = of_omnia_leds_match,
+	},
+};
+
+module_i2c_driver(omnia_leds_driver);
+
+MODULE_AUTHOR("Marek Behun <marek.behun@nic.cz>");
+MODULE_DESCRIPTION("CZ.NIC's Turris Omnia LEDs");
+MODULE_LICENSE("GPL v2");
-- 
2.26.2

