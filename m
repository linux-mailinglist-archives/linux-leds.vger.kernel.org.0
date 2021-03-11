Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 08F93337386
	for <lists+linux-leds@lfdr.de>; Thu, 11 Mar 2021 14:13:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233393AbhCKNNR (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 11 Mar 2021 08:13:17 -0500
Received: from smtp1.axis.com ([195.60.68.17]:15038 "EHLO smtp1.axis.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233014AbhCKNMq (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Thu, 11 Mar 2021 08:12:46 -0500
X-Greylist: delayed 430 seconds by postgrey-1.27 at vger.kernel.org; Thu, 11 Mar 2021 08:12:45 EST
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1615468366;
  x=1647004366;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=PKxcbrdtFXzVaXcDXMV5bGrOudDtSg/m6UMUlPopE4I=;
  b=JZTk9isx+RbsuR82+vEkmjWfYsBYbfbrYI7B/gw2t8OCDQ1zMAJ/El6j
   nCU+nuGESF3FJ+usQGRGVCHCJ3mZq+VtQ6XGMJvcaieyHZkuQ1ly9wubX
   Ar1LiD5FWw8TNTGCE8TZ5ufkfWHUOBqCiIxFmJ2GEYVpK4wI8iDhhMEz4
   iybGfLfOdg9Z8yakqASIbxZtA0ywTztNQ/Q+Y7Dk/Berq0z68DzbgHD3s
   Y4WDrFYiOMV6pA2LbGv/6rYcRj4expTujcRFgGCXvEWh0XlrgH2269ERd
   rAq0mLOy+cLUCFD4JOltc/Y51bSwSLiWz+jywEi6pQM6B5I2WTzAiVkjO
   w==;
From:   Hermes Zhang <chenhui.zhang@axis.com>
To:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>
CC:     <kernel@axis.com>, Hermes Zhang <chenhuiz@axis.com>,
        <linux-kernel@vger.kernel.org>, <linux-leds@vger.kernel.org>
Subject: [PATCH] leds: leds-dual-gpio: Add dual GPIO LEDs driver
Date:   Thu, 11 Mar 2021 21:04:08 +0800
Message-ID: <20210311130408.10820-1-chenhui.zhang@axis.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

From: Hermes Zhang <chenhuiz@axis.com>

Introduce a new Dual GPIO LED driver. These two GPIOs LED will act as
one LED as normal GPIO LED but give the possibility to change the
intensity in four levels: OFF, LOW, MIDDLE and HIGH.
---
 drivers/leds/Kconfig          |   9 +++
 drivers/leds/Makefile         |   1 +
 drivers/leds/leds-dual-gpio.c | 136 ++++++++++++++++++++++++++++++++++
 3 files changed, 146 insertions(+)
 create mode 100644 drivers/leds/leds-dual-gpio.c

diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index b6742b4231bf..bc374d3b40ef 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -370,6 +370,15 @@ config LEDS_GPIO
 	  defined as platform devices and/or OpenFirmware platform devices.
 	  The code to use these bindings can be selected below.
 
+config LEDS_DUAL_GPIO
+	tristate "LED Support for Dual GPIO connected LEDs"
+	depends on LEDS_CLASS
+	depends on GPIOLIB || COMPILE_TEST
+	help
+	  This option enables support for the two LEDs connected to GPIO
+	  outputs. These two GPIO LEDs act as one LED in the sysfs and
+	  perform different intensity by enable either one of them or both.
+
 config LEDS_LP3944
 	tristate "LED Support for N.S. LP3944 (Fun Light) I2C chip"
 	depends on LEDS_CLASS
diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
index 2a698df9da57..10015cc81f79 100644
--- a/drivers/leds/Makefile
+++ b/drivers/leds/Makefile
@@ -30,6 +30,7 @@ obj-$(CONFIG_LEDS_DA903X)		+= leds-da903x.o
 obj-$(CONFIG_LEDS_DA9052)		+= leds-da9052.o
 obj-$(CONFIG_LEDS_FSG)			+= leds-fsg.o
 obj-$(CONFIG_LEDS_GPIO)			+= leds-gpio.o
+obj-$(CONFIG_LEDS_DUAL_GPIO)		+= leds-dual-gpio.o
 obj-$(CONFIG_LEDS_GPIO_REGISTER)	+= leds-gpio-register.o
 obj-$(CONFIG_LEDS_HP6XX)		+= leds-hp6xx.o
 obj-$(CONFIG_LEDS_INTEL_SS4200)		+= leds-ss4200.o
diff --git a/drivers/leds/leds-dual-gpio.c b/drivers/leds/leds-dual-gpio.c
new file mode 100644
index 000000000000..5d3b9be46f4b
--- /dev/null
+++ b/drivers/leds/leds-dual-gpio.c
@@ -0,0 +1,136 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * LEDs driver for GPIOs
+ *
+ * Copyright (C) 2021 Axis Communications AB
+ * Hermes Zhang <chenhui.zhang@axis.com>
+ */
+
+#include <linux/err.h>
+#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
+#include <linux/kernel.h>
+#include <linux/leds.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/property.h>
+#include <linux/slab.h>
+
+#define GPIO_LOGICAL_ON   1
+#define GPIO_LOGICAL_OFF  0
+
+struct gpio_dual_leds_priv {
+	struct gpio_desc *low_gpio;
+	struct gpio_desc *high_gpio;
+	struct led_classdev cdev;
+};
+
+
+static void gpio_dual_led_set(struct led_classdev *led_cdev,
+	enum led_brightness value)
+{
+	struct gpio_dual_leds_priv *priv;
+
+	priv = container_of(led_cdev, struct gpio_dual_leds_priv, cdev);
+
+	if (value == LED_FULL) {
+		gpiod_set_value(priv->low_gpio, GPIO_LOGICAL_ON);
+		gpiod_set_value(priv->high_gpio, GPIO_LOGICAL_ON);
+	} else if (value < LED_FULL && value > LED_HALF) {
+		/* Enable high only */
+		gpiod_set_value(priv->low_gpio, GPIO_LOGICAL_OFF);
+		gpiod_set_value(priv->high_gpio, GPIO_LOGICAL_ON);
+	} else if (value <= LED_HALF && value > LED_OFF) {
+		/* Enable low only */
+		gpiod_set_value(priv->low_gpio, GPIO_LOGICAL_ON);
+		gpiod_set_value(priv->high_gpio, GPIO_LOGICAL_OFF);
+	} else {
+		gpiod_set_value(priv->low_gpio, GPIO_LOGICAL_OFF);
+		gpiod_set_value(priv->high_gpio, GPIO_LOGICAL_OFF);
+	}
+}
+
+static int gpio_dual_led_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *node = dev->of_node;
+	struct gpio_dual_leds_priv *priv = NULL;
+	int ret;
+	const char *state;
+
+	priv = devm_kzalloc(dev, sizeof(struct gpio_dual_leds_priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->low_gpio = devm_gpiod_get(dev, "low", GPIOD_OUT_LOW);
+	ret = PTR_ERR_OR_ZERO(priv->low_gpio);
+	if (ret) {
+		dev_err(dev, "cannot get low-gpios %d\n", ret);
+		return ret;
+	}
+
+	priv->high_gpio = devm_gpiod_get(dev, "high", GPIOD_OUT_LOW);
+	ret = PTR_ERR_OR_ZERO(priv->high_gpio);
+	if (ret) {
+		dev_err(dev, "cannot get high-gpios %d\n", ret);
+		return ret;
+	}
+
+	priv->cdev.name = of_get_property(node, "label", NULL);
+	priv->cdev.max_brightness = LED_FULL;
+	priv->cdev.default_trigger =
+	  of_get_property(node, "linux,default-trigger", NULL);
+	priv->cdev.brightness_set = gpio_dual_led_set;
+
+	ret = devm_led_classdev_register(dev, &priv->cdev);
+	if (ret < 0)
+		return ret;
+
+	if (!of_property_read_string(node, "default-state", &state)
+	    && !strcmp(state, "on"))
+		gpio_dual_led_set(&priv->cdev, LED_FULL);
+	else
+		gpio_dual_led_set(&priv->cdev, LED_OFF);
+
+	platform_set_drvdata(pdev, priv);
+
+	return 0;
+}
+
+static void gpio_dual_led_shutdown(struct platform_device *pdev)
+{
+	struct gpio_dual_leds_priv *priv = platform_get_drvdata(pdev);
+
+	gpio_dual_led_set(&priv->cdev, LED_OFF);
+}
+
+static int gpio_dual_led_remove(struct platform_device *pdev)
+{
+	gpio_dual_led_shutdown(pdev);
+
+	return 0;
+}
+
+static const struct of_device_id of_gpio_dual_leds_match[] = {
+	{ .compatible = "gpio-dual-leds", },
+	{},
+};
+
+MODULE_DEVICE_TABLE(of, of_gpio_dual_leds_match);
+
+static struct platform_driver gpio_dual_led_driver = {
+	.probe		= gpio_dual_led_probe,
+	.remove		= gpio_dual_led_remove,
+	.shutdown	= gpio_dual_led_shutdown,
+	.driver		= {
+		.name	= "leds-dual-gpio",
+		.of_match_table = of_gpio_dual_leds_match,
+	},
+};
+
+module_platform_driver(gpio_dual_led_driver);
+
+MODULE_DESCRIPTION("Dual GPIO LED driver");
+MODULE_LICENSE("GPL v2");
+MODULE_ALIAS("platform:leds-dual-gpio");
-- 
2.20.1

