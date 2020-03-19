Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2017718BF27
	for <lists+linux-leds@lfdr.de>; Thu, 19 Mar 2020 19:16:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727023AbgCSSQJ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 19 Mar 2020 14:16:09 -0400
Received: from lists.nic.cz ([217.31.204.67]:55094 "EHLO mail.nic.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726663AbgCSSQJ (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Thu, 19 Mar 2020 14:16:09 -0400
Received: from dellmb.labs.office.nic.cz (unknown [IPv6:2001:1488:fffe:6:cac7:3539:7f1f:463])
        by mail.nic.cz (Postfix) with ESMTP id 2B7261431D1;
        Thu, 19 Mar 2020 19:16:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
        t=1584641765; bh=pLcTEchpYBINZVNk8VC9h1NY9VbwmaykzF/ybfzc+Dc=;
        h=From:To:Date;
        b=gDgbFepZ6c0SObV6FguNPRWRl2nw8NGHVsRsQweYfLrzRLBSGZ6fnaPlhyFHDN4pC
         ZEEDCDclpVXW/Ax5mGlUpclC04aFoks+hiVYYH28D1GITkWPXZcxclgXKmMTTqA1M1
         iAzkCZGcIZRpCLMPJ2YhR/cPJnG49REIAX5sJtBc=
From:   =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>
To:     linux-leds@vger.kernel.org
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>,
        =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>
Subject: [PATCH RFC leds-next] leds: initial support for Turris Omnia LEDs
Date:   Thu, 19 Mar 2020 19:16:04 +0100
Message-Id: <20200319181604.2425-1-marek.behun@nic.cz>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.nic.cz
X-Spam-Status: No, score=0.00
X-Spamd-Bar: /
X-Virus-Scanned: clamav-milter 0.101.4 at mail
X-Virus-Status: Clean
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

This adds basic support for LEDs on the front side of CZ.NIC's Turris
Omnia router.

There are 12 RGB LEDs. The controller supports HW triggering mode for
the LEDs, but this driver does not support it yet, and sets all the LEDs
into SW mode upon probe.

The user can either group all three channels of one RGB LED into one LED
classdev, or expose each channel as an individual LED classdev. This is
done by utilizing the 'led-sources' and 'color' DT properties.

In the following example the first RGB LED is exposed as one LED
classdev with color WHITE, and the second RGB LED is exposed as three
classdevs, one per each channel:
	led@0 {
		reg = <0>;
		led-sources = <0 1 2>;
		color = <LED_COLOR_ID_WHITE>;
	};

	led@1,0 {
		reg = <1>;
		led-sources = <3>;
		color = <LED_COLOR_ID_RED>;
	};

	led@1,1 {
		reg = <1>;
		led-sources = <4>;
		color = <LED_COLOR_ID_GREEN>;
	};

	led@1,2 {
		reg = <1>;
		led-sources = <5>;
		color = <LED_COLOR_ID_BLUE>;
	};

I am not comfortable with the 'reg' property being same for multiple
nodes. Perhaps the 'reg' property shouldn't be used, since the
information needed by the driver can be deduced from the 'led-sources'.

Signed-off-by: Marek Behún <marek.behun@nic.cz>
---
 drivers/leds/Kconfig             |  14 ++
 drivers/leds/Makefile            |   1 +
 drivers/leds/leds-turris-omnia.c | 295 +++++++++++++++++++++++++++++++
 3 files changed, 310 insertions(+)
 create mode 100644 drivers/leds/leds-turris-omnia.c

diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index d82f1dea3711..c33159370bcb 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -145,6 +145,20 @@ config LEDS_EL15203000
 	  To compile this driver as a module, choose M here: the module
 	  will be called leds-el15203000.
 
+config LEDS_TURRIS_OMNIA
+	tristate "LED support for CZ.NIC's Turris Omnia"
+	depends on LEDS_CLASS
+	depends on I2C
+	depends on MACH_ARMADA_38X || COMPILE_TEST
+	depends on OF
+	help
+	  This option enables basic support for the LEDs found on the front
+	  side of CZ.NIC's Turris Omnia router. There are 12 RGB LEDs on the
+	  front panel.
+	  This driver does not currently support setting LED colors, only
+	  brightness. Also HW triggering is disabled when the controller is
+	  probed by this driver.
+
 config LEDS_LM3530
 	tristate "LCD Backlight driver for LM3530"
 	depends on LEDS_CLASS
diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
index d7e1107753fb..95feaf4bea81 100644
--- a/drivers/leds/Makefile
+++ b/drivers/leds/Makefile
@@ -86,6 +86,7 @@ obj-$(CONFIG_LEDS_TI_LMU_COMMON)	+= leds-ti-lmu-common.o
 obj-$(CONFIG_LEDS_LM3697)		+= leds-lm3697.o
 obj-$(CONFIG_LEDS_LM36274)		+= leds-lm36274.o
 obj-$(CONFIG_LEDS_TPS6105X)		+= leds-tps6105x.o
+obj-$(CONFIG_LEDS_TURRIS_OMNIA)		+= leds-turris-omnia.o
 
 # LED SPI Drivers
 obj-$(CONFIG_LEDS_CR0014114)		+= leds-cr0014114.o
diff --git a/drivers/leds/leds-turris-omnia.c b/drivers/leds/leds-turris-omnia.c
new file mode 100644
index 000000000000..7e8345b2ac4f
--- /dev/null
+++ b/drivers/leds/leds-turris-omnia.c
@@ -0,0 +1,295 @@
+// SPDX-License-Identifier: GPL-2.0
+//
+// CZ.NIC's Turris Omnia LEDs driver
+//
+// 2020 by Marek Behun <marek.behun@nic.cz>
+
+#include <linux/i2c.h>
+#include <linux/leds.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/of.h>
+#include <uapi/linux/uleds.h>
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
+	struct led_classdev cdev;
+	int reg, color;
+};
+
+#define to_omnia_led(l)	container_of(l, struct omnia_led, cdev)
+
+struct omnia_leds {
+	struct i2c_client *client;
+	struct mutex lock;
+	u8 cache[OMNIA_BOARD_LEDS][3];
+	int nleds;
+	struct omnia_led leds[0];
+};
+
+static int omnia_led_brightness_set_blocking(struct led_classdev *cdev,
+					     enum led_brightness brightness)
+{
+	static const u8 color2cmd[] = {
+		[LED_COLOR_ID_RED] = OMNIA_CMD_LED_COLOR_R,
+		[LED_COLOR_ID_GREEN] = OMNIA_CMD_LED_COLOR_G,
+		[LED_COLOR_ID_BLUE] = OMNIA_CMD_LED_COLOR_B,
+	};
+	struct omnia_leds *leds = dev_get_drvdata(cdev->dev->parent);
+	struct omnia_led *led = to_omnia_led(cdev);
+	u8 buf[OMNIA_CMD_LED_COLOR_LEN], state;
+	int ret;
+
+	mutex_lock(&leds->lock);
+
+	buf[OMNIA_CMD] = CMD_LED_COLOR;
+	buf[OMNIA_CMD_LED_COLOR_LED] = led->reg;
+
+	if (led->color == LED_COLOR_ID_WHITE) {
+		buf[OMNIA_CMD_LED_COLOR_R] = brightness;
+		buf[OMNIA_CMD_LED_COLOR_G] = brightness;
+		buf[OMNIA_CMD_LED_COLOR_B] = brightness;
+	} else {
+		buf[OMNIA_CMD_LED_COLOR_R] = leds->cache[led->reg][0];
+		buf[OMNIA_CMD_LED_COLOR_G] = leds->cache[led->reg][1];
+		buf[OMNIA_CMD_LED_COLOR_B] = leds->cache[led->reg][2];
+		buf[color2cmd[led->color]] = brightness;
+	}
+
+	state = CMD_LED_STATE_LED(led->reg);
+	if (buf[OMNIA_CMD_LED_COLOR_R] || buf[OMNIA_CMD_LED_COLOR_G] ||
+	    buf[OMNIA_CMD_LED_COLOR_B])
+		state |= CMD_LED_STATE_ON;
+
+	ret = i2c_smbus_write_byte_data(leds->client, CMD_LED_STATE, state);
+	if (ret >= 0 && (state & CMD_LED_STATE_ON))
+		ret = i2c_master_send(leds->client, buf, 5);
+
+	leds->cache[led->reg][0] = buf[OMNIA_CMD_LED_COLOR_R];
+	leds->cache[led->reg][1] = buf[OMNIA_CMD_LED_COLOR_G];
+	leds->cache[led->reg][2] = buf[OMNIA_CMD_LED_COLOR_B];
+
+	mutex_unlock(&leds->lock);
+
+	return ret;
+}
+
+static int omnia_led_register(struct omnia_leds *leds,
+			      struct fwnode_handle *node)
+{
+	struct i2c_client *client = leds->client;
+	struct led_init_data init_data = {};
+	struct device *dev = &client->dev;
+	struct omnia_led *led;
+	int ret, nsources, color;
+	u32 reg, led_sources[3];
+
+	led = &leds->leds[leds->nleds];
+
+	ret = fwnode_property_read_u32(node, "reg", &reg);
+	if (ret) {
+		dev_err(dev, "Node %pfw: 'reg' read failed!\n", node);
+		return ret;
+	}
+
+	if (reg >= OMNIA_BOARD_LEDS) {
+		dev_warn(dev, "Node %pfw: invalid 'reg' value %u\n", node, reg);
+		return 0;
+	}
+
+	nsources = fwnode_property_count_u32(node, "led-sources");
+	if (nsources != 1 && nsources != 3) {
+		dev_warn(dev, "Node %pfw: either 1 or 3 'led-sources' must be specified!\n",
+			 node);
+		return 0;
+	}
+
+	ret = fwnode_property_read_u32_array(node, "led-sources", led_sources,
+					     nsources);
+	if (ret) {
+		dev_err(dev, "Node %pfw: 'led-sources' read failed: %i\n",
+			node, ret);
+		return ret;
+	}
+
+	ret = fwnode_property_read_u32(node, "color", &led->color);
+	if (ret) {
+		dev_warn(dev, "Node %pfw: 'color' read failed!\n",
+			 node);
+		return 0;
+	}
+
+	if (nsources == 3) {
+		if (led_sources[0] != 3 * reg ||
+		    led_sources[1] != 3 * reg + 1 ||
+		    led_sources[2] != 3 * reg + 2) {
+			dev_warn(dev, "Node %pfw has invalid 'led-sources'!\n",
+				 node);
+			return 0;
+		}
+
+		color = LED_COLOR_ID_WHITE;
+	} else {
+		const int led_source_to_color[3] = {
+			LED_COLOR_ID_RED,
+			LED_COLOR_ID_GREEN,
+			LED_COLOR_ID_BLUE
+		};
+		color = led_source_to_color[led_sources[0] % 3];
+
+		if (led_sources[0] < 3 * reg || led_sources[0] > 3 * reg + 2) {
+			dev_warn(dev, "Node %pfw has invalid 'led-sources'!\n",
+				 node);
+			return 0;
+		}
+	}
+
+	if (led->color != color) {
+		dev_warn(dev, "Node %pfw: 'color' should be %s!\n", node,
+			 led_colors[color]);
+		return 0;
+	}
+
+	init_data.devicename = "omnia";
+	init_data.fwnode = node;
+	init_data.devname_mandatory = true;
+
+	led->reg = reg;
+	led->cdev.max_brightness = 255;
+	led->cdev.brightness_set_blocking = omnia_led_brightness_set_blocking;
+
+	fwnode_property_read_string(node, "linux,default-trigger",
+				    &led->cdev.default_trigger);
+
+	/* put the LED into software mode */
+	ret = i2c_smbus_write_byte_data(client, CMD_LED_MODE,
+					CMD_LED_MODE_LED(reg) |
+					CMD_LED_MODE_USER);
+	if (ret < 0) {
+		dev_err(dev, "Cannot set LED %pfw to software mode: %i\n", node,
+			ret);
+		return ret;
+	}
+
+	/* disable the LED */
+	ret = i2c_smbus_write_byte_data(client, CMD_LED_STATE,
+						CMD_LED_STATE_LED(reg));
+	if (ret < 0) {
+		dev_err(dev, "Cannot set LED %pfw brightness: %i\n", node, ret);
+		return ret;
+	}
+
+	ret = devm_led_classdev_register_ext(dev, &led->cdev, &init_data);
+	if (ret < 0) {
+		dev_err(dev, "Cannot register LED %pfw: %i\n", node, ret);
+		return ret;
+	}
+
+	++leds->nleds;
+
+	return 0;
+}
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
+	} else if (count > 3 * OMNIA_BOARD_LEDS) {
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
+		ret = omnia_led_register(leds, &child->fwnode);
+		if (ret < 0)
+			return ret;
+	}
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
2.24.1

