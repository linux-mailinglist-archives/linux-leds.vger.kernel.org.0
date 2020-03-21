Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D4C3E18E4FA
	for <lists+linux-leds@lfdr.de>; Sat, 21 Mar 2020 23:00:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727296AbgCUWAo (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 21 Mar 2020 18:00:44 -0400
Received: from v6.sk ([167.172.42.174]:54104 "EHLO v6.sk"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727244AbgCUWAn (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Sat, 21 Mar 2020 18:00:43 -0400
Received: from localhost (v6.sk [IPv6:::1])
        by v6.sk (Postfix) with ESMTP id E77C560EEC;
        Sat, 21 Mar 2020 22:00:40 +0000 (UTC)
From:   Lubomir Rintel <lkundrak@v3.sk>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        Lubomir Rintel <lkundrak@v3.sk>
Subject: [PATCH v2] leds: ariel: Add driver for status LEDs on Dell Wyse 3020
Date:   Sat, 21 Mar 2020 23:00:32 +0100
Message-Id: <20200321220032.20752-1-lkundrak@v3.sk>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

This adds support for controlling the LEDs attached to the Embedded
Controller on a Dell Wyse 3020 "Ariel" board.

Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>

---
The associated MFD driver is here:
https://lore.kernel.org/lkml/20200309203818.31266-5-lkundrak@v3.sk/

Changes since v1:
- Reduce code duplication with a loop
- Drop "ariel:" prefix from led names
- Do not print a message after a successful probe

---
 drivers/leds/Kconfig      |  11 +++
 drivers/leds/Makefile     |   1 +
 drivers/leds/leds-ariel.c | 156 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 168 insertions(+)
 create mode 100644 drivers/leds/leds-ariel.c

diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index d82f1dea37111..66424ee54cc01 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -83,6 +83,17 @@ config LEDS_APU
 	  To compile this driver as a module, choose M here: the
 	  module will be called leds-apu.
 
+config LEDS_ARIEL
+	tristate "Dell Wyse 3020 status LED support"
+	depends on LEDS_CLASS
+	depends on (MACH_MMP3_DT && MFD_ENE_KB3930) || COMPILE_TEST
+	help
+	  This driver adds support for controlling the front panel status
+	  LEDs on Dell Wyse 3020 (Ariel) board via the KB3930 Embedded
+	  Controller.
+
+	  Say Y to if your machine is a Dell Wyse 3020 thin client.
+
 config LEDS_AS3645A
 	tristate "AS3645A and LM3555 LED flash controllers support"
 	depends on I2C && LEDS_CLASS_FLASH
diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
index d7e1107753fb1..bf3b22038d113 100644
--- a/drivers/leds/Makefile
+++ b/drivers/leds/Makefile
@@ -10,6 +10,7 @@ obj-$(CONFIG_LEDS_TRIGGERS)		+= led-triggers.o
 obj-$(CONFIG_LEDS_88PM860X)		+= leds-88pm860x.o
 obj-$(CONFIG_LEDS_AAT1290)		+= leds-aat1290.o
 obj-$(CONFIG_LEDS_APU)			+= leds-apu.o
+obj-$(CONFIG_LEDS_ARIEL)		+= leds-ariel.o
 obj-$(CONFIG_LEDS_AS3645A)		+= leds-as3645a.o
 obj-$(CONFIG_LEDS_AN30259A)		+= leds-an30259a.o
 obj-$(CONFIG_LEDS_BCM6328)		+= leds-bcm6328.o
diff --git a/drivers/leds/leds-ariel.c b/drivers/leds/leds-ariel.c
new file mode 100644
index 0000000000000..dbff025c5f97f
--- /dev/null
+++ b/drivers/leds/leds-ariel.c
@@ -0,0 +1,156 @@
+// SPDX-License-Identifier: BSD-2-Clause OR GPL-2.0-or-later
+/*
+ * Dell Wyse 3020 a.k.a. "Ariel" Embedded Controller LED Driver
+ *
+ * Copyright (C) 2020 Lubomir Rintel
+ */
+
+#include <linux/module.h>
+#include <linux/leds.h>
+#include <linux/regmap.h>
+#include <linux/of_platform.h>
+
+enum ec_index {
+	EC_BLUE_LED	= 0x01,
+	EC_AMBER_LED	= 0x02,
+	EC_GREEN_LED	= 0x03,
+};
+
+enum {
+	EC_LED_OFF	= 0x00,
+	EC_LED_STILL	= 0x01,
+	EC_LED_FADE	= 0x02,
+	EC_LED_BLINK	= 0x03,
+};
+
+struct ariel_led {
+	struct regmap *ec_ram;
+	enum ec_index ec_index;
+	struct led_classdev led_cdev;
+};
+
+#define led_cdev_to_ariel_led(c) container_of(c, struct ariel_led, led_cdev)
+
+static enum led_brightness ariel_led_get(struct led_classdev *led_cdev)
+{
+	struct ariel_led *led = led_cdev_to_ariel_led(led_cdev);
+	unsigned int led_status = 0;
+
+	if (regmap_read(led->ec_ram, led->ec_index, &led_status))
+		return LED_OFF;
+
+	if (led_status == EC_LED_STILL)
+		return LED_FULL;
+	else
+		return LED_OFF;
+}
+
+static void ariel_led_set(struct led_classdev *led_cdev,
+			  enum led_brightness brightness)
+{
+	struct ariel_led *led = led_cdev_to_ariel_led(led_cdev);
+
+	if (brightness == LED_OFF)
+		regmap_write(led->ec_ram, led->ec_index, EC_LED_OFF);
+	else
+		regmap_write(led->ec_ram, led->ec_index, EC_LED_STILL);
+}
+
+static int ariel_blink_set(struct led_classdev *led_cdev,
+			   unsigned long *delay_on, unsigned long *delay_off)
+{
+	struct ariel_led *led = led_cdev_to_ariel_led(led_cdev);
+
+	if (*delay_on == 0 && *delay_off == 0)
+		return -EINVAL;
+
+	if (*delay_on == 0) {
+		regmap_write(led->ec_ram, led->ec_index, EC_LED_OFF);
+	} else if (*delay_off == 0) {
+		regmap_write(led->ec_ram, led->ec_index, EC_LED_STILL);
+	} else {
+		*delay_on = 500;
+		*delay_off = 500;
+		regmap_write(led->ec_ram, led->ec_index, EC_LED_BLINK);
+	}
+
+	return 0;
+}
+
+#define NLEDS 3
+
+static int ariel_led_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct ariel_led *leds;
+	struct regmap *ec_ram;
+	int ret;
+	int i;
+
+	leds = devm_kcalloc(dev, NLEDS, sizeof(*leds), GFP_KERNEL);
+	if (!leds)
+		return -ENOMEM;
+
+	ec_ram = dev_get_regmap(dev->parent, "ec_ram");
+	if (!ec_ram)
+		return -ENODEV;
+
+	for (i = 0; i < NLEDS; i++) {
+		leds[0].ec_ram = ec_ram;
+		leds[0].ec_index = EC_BLUE_LED;
+		leds[0].led_cdev.name = "blue:power",
+		leds[0].led_cdev.brightness_get = ariel_led_get;
+		leds[0].led_cdev.brightness_set = ariel_led_set;
+		leds[0].led_cdev.blink_set = ariel_blink_set;
+		leds[0].led_cdev.default_trigger = "default-on";
+
+		ret = devm_led_classdev_register(dev, &leds[0].led_cdev);
+		if (ret)
+			return ret;
+	}
+
+	leds[0].ec_ram = ec_ram;
+	leds[0].ec_index = EC_BLUE_LED;
+	leds[0].led_cdev.name = "blue:power",
+	leds[0].led_cdev.brightness_get = ariel_led_get;
+	leds[0].led_cdev.brightness_set = ariel_led_set;
+	leds[0].led_cdev.blink_set = ariel_blink_set;
+	leds[0].led_cdev.default_trigger = "default-on";
+
+	ret = devm_led_classdev_register(dev, &leds[0].led_cdev);
+	if (ret)
+		return ret;
+
+	leds[1].ec_ram = ec_ram;
+	leds[1].ec_index = EC_AMBER_LED;
+	leds[1].led_cdev.name = "amber:status",
+	leds[1].led_cdev.brightness_get = ariel_led_get;
+	leds[1].led_cdev.brightness_set = ariel_led_set;
+	leds[1].led_cdev.blink_set = ariel_blink_set;
+
+	ret = devm_led_classdev_register(dev, &leds[1].led_cdev);
+	if (ret)
+		return ret;
+
+	leds[2].ec_ram = ec_ram;
+	leds[2].ec_index = EC_GREEN_LED;
+	leds[2].led_cdev.name = "green:status",
+	leds[2].led_cdev.brightness_get = ariel_led_get;
+	leds[2].led_cdev.brightness_set = ariel_led_set;
+	leds[2].led_cdev.blink_set = ariel_blink_set;
+	leds[2].led_cdev.default_trigger = "default-on";
+
+	return devm_led_classdev_register(dev, &leds[2].led_cdev);
+}
+
+static struct platform_driver ariel_led_driver = {
+	.probe = ariel_led_probe,
+	.driver = {
+		.name = "dell-wyse-ariel-led",
+	},
+};
+module_platform_driver(ariel_led_driver);
+
+MODULE_AUTHOR("Lubomir Rintel <lkundrak@v3.sk>");
+MODULE_DESCRIPTION("Dell Wyse 3020 Status LEDs Driver");
+MODULE_LICENSE("Dual BSD/GPL");
-- 
2.26.0.rc2

