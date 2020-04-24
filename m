Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 53F7C1B81DA
	for <lists+linux-leds@lfdr.de>; Sat, 25 Apr 2020 00:02:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726032AbgDXWCu (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 24 Apr 2020 18:02:50 -0400
Received: from v6.sk ([167.172.42.174]:59610 "EHLO v6.sk"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725874AbgDXWCt (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Fri, 24 Apr 2020 18:02:49 -0400
Received: from localhost (v6.sk [IPv6:::1])
        by v6.sk (Postfix) with ESMTP id 44208610A8;
        Fri, 24 Apr 2020 22:02:47 +0000 (UTC)
From:   Lubomir Rintel <lkundrak@v3.sk>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        Lubomir Rintel <lkundrak@v3.sk>
Subject: [PATCH v4] leds: ariel: Add driver for status LEDs on Dell Wyse 3020
Date:   Sat, 25 Apr 2020 00:02:40 +0200
Message-Id: <20200424220240.106055-1-lkundrak@v3.sk>
X-Mailer: git-send-email 2.26.0
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
Changes since v3:
- Actually use the loop iterator when registering the LEDs.
- Move dev_get_regmap() above devm_kcalloc()

Changes since v2:
- Hopefully sending out the correct patch this time...

Changes since v1:
- Reduce code duplication with a loop
- Drop "ariel:" prefix from led names
- Do not print a message after a successful probe

 drivers/leds/Kconfig      |  11 ++++
 drivers/leds/Makefile     |   1 +
 drivers/leds/leds-ariel.c | 133 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 145 insertions(+)
 create mode 100644 drivers/leds/leds-ariel.c

diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index c664d84e1667..a20149e9581f 100644
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
index 45235d5fb218..24127f2c4a16 100644
--- a/drivers/leds/Makefile
+++ b/drivers/leds/Makefile
@@ -12,6 +12,7 @@ obj-$(CONFIG_LEDS_AAT1290)		+= leds-aat1290.o
 obj-$(CONFIG_LEDS_ADP5520)		+= leds-adp5520.o
 obj-$(CONFIG_LEDS_AN30259A)		+= leds-an30259a.o
 obj-$(CONFIG_LEDS_APU)			+= leds-apu.o
+obj-$(CONFIG_LEDS_ARIEL)		+= leds-ariel.o
 obj-$(CONFIG_LEDS_AS3645A)		+= leds-as3645a.o
 obj-$(CONFIG_LEDS_ASIC3)		+= leds-asic3.o
 obj-$(CONFIG_LEDS_BCM6328)		+= leds-bcm6328.o
diff --git a/drivers/leds/leds-ariel.c b/drivers/leds/leds-ariel.c
new file mode 100644
index 000000000000..bb68ba23a7d4
--- /dev/null
+++ b/drivers/leds/leds-ariel.c
@@ -0,0 +1,133 @@
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
+	ec_ram = dev_get_regmap(dev->parent, "ec_ram");
+	if (!ec_ram)
+		return -ENODEV;
+
+	leds = devm_kcalloc(dev, NLEDS, sizeof(*leds), GFP_KERNEL);
+	if (!leds)
+		return -ENOMEM;
+
+	leds[0].ec_index = EC_BLUE_LED;
+	leds[0].led_cdev.name = "blue:power",
+	leds[0].led_cdev.default_trigger = "default-on";
+
+	leds[1].ec_index = EC_AMBER_LED;
+	leds[1].led_cdev.name = "amber:status",
+
+	leds[2].ec_index = EC_GREEN_LED;
+	leds[2].led_cdev.name = "green:status",
+	leds[2].led_cdev.default_trigger = "default-on";
+
+	for (i = 0; i < NLEDS; i++) {
+		leds[i].ec_ram = ec_ram;
+		leds[i].led_cdev.brightness_get = ariel_led_get;
+		leds[i].led_cdev.brightness_set = ariel_led_set;
+		leds[i].led_cdev.blink_set = ariel_blink_set;
+
+		ret = devm_led_classdev_register(dev, &leds[i].led_cdev);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
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
2.26.0

