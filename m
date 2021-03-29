Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0671034C371
	for <lists+linux-leds@lfdr.de>; Mon, 29 Mar 2021 08:00:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229706AbhC2F7u (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 29 Mar 2021 01:59:50 -0400
Received: from smtp2.axis.com ([195.60.68.18]:44902 "EHLO smtp2.axis.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229441AbhC2F71 (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Mon, 29 Mar 2021 01:59:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1616997567;
  x=1648533567;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=A0ahMseseobxPOc7DP9GAwnbyElcLbIj7QUkgmfY3SA=;
  b=NnWwHGWry11LscpE6DNFrp2BfXAPyRA30W1+WMSAD9FAAvjqF0tbyEuO
   n52F2EqRl6NsvK3OcUE60F/UBnj/MkU/Dwk+YqEV7dbuiHmmxUbi5Grvw
   EOYrPgjC4tOCCzTO63mzW9tfzcgISmofLKl9qccIXf607k7zRF61ryaPU
   qwhRxBAllydhWuJV1RT6GTe/M9OEc6V5Bo1ReqTi5buvCMH66aDLgqkdO
   k+Oq1wi3niob9hhNFu+VzGhbpMHJFyYvd/HFPopL9JFw+iKlkIzYPJEHD
   hTtgM3nkJOz4Rr6YZotU3yr0YfsFfmy2ALOS5hAuy0M/0wfmqbFBVZ89b
   A==;
From:   Hermes Zhang <chenhui.zhang@axis.com>
To:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>
CC:     <kernel@axis.com>, Hermes Zhang <chenhuiz@axis.com>,
        <linux-kernel@vger.kernel.org>, <linux-leds@vger.kernel.org>
Subject: [PATCH v3] leds: leds-multi-gpio: Add multiple GPIOs LED driver
Date:   Mon, 29 Mar 2021 13:58:46 +0800
Message-ID: <20210329055847.13293-1-chenhui.zhang@axis.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

From: Hermes Zhang <chenhuiz@axis.com>

Introduce a new multiple GPIOs LED driver. This LED will made of
multiple GPIOs (up to 8) and will map different brightness to different
GPIOs states which defined in dts file.

Signed-off-by: Hermes Zhang <chenhuiz@axis.com>
---

Notes:
    changes v3:
    - Remove LEDS_SIMPLE menu
    - Minro code style fix
    
    changes v2:
    - use max_brightness(2^gpio numbers) instead of LED_FULL
    - malloc the priv in once
    - move the code to simple folder

 drivers/leds/Kconfig                  |   3 +
 drivers/leds/Makefile                 |   3 +
 drivers/leds/simple/Kconfig           |  12 +++
 drivers/leds/simple/Makefile          |   3 +
 drivers/leds/simple/leds-multi-gpio.c | 144 ++++++++++++++++++++++++++
 5 files changed, 165 insertions(+)
 create mode 100644 drivers/leds/simple/Kconfig
 create mode 100644 drivers/leds/simple/Makefile
 create mode 100644 drivers/leds/simple/leds-multi-gpio.c

diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index b6742b4231bf..f95217b2fcf1 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -937,4 +937,7 @@ source "drivers/leds/trigger/Kconfig"
 comment "LED Blink"
 source "drivers/leds/blink/Kconfig"
 
+comment "LED Simple"
+source "drivers/leds/simple/Kconfig"
+
 endif # NEW_LEDS
diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
index 2a698df9da57..22cba8dfd6a9 100644
--- a/drivers/leds/Makefile
+++ b/drivers/leds/Makefile
@@ -111,3 +111,6 @@ obj-$(CONFIG_LEDS_TRIGGERS)		+= trigger/
 
 # LED Blink
 obj-$(CONFIG_LEDS_BLINK)                += blink/
+
+# LED Simple
+obj-$(CONFIG_LEDS_SIMPLE)		+= simple/
diff --git a/drivers/leds/simple/Kconfig b/drivers/leds/simple/Kconfig
new file mode 100644
index 000000000000..98540b6c8d7a
--- /dev/null
+++ b/drivers/leds/simple/Kconfig
@@ -0,0 +1,12 @@
+config LEDS_MULTI_GPIO
+	tristate "LED Support for multiple GPIOs LED"
+	depends on LEDS_CLASS
+	depends on GPIOLIB
+	depends on OF
+	help
+	  This option enables support for a multiple GPIOs LED. Such LED is made
+	  of multiple GPIOs and could change the brightness by setting different
+	  states of the GPIOs.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called leds-multi-gpio.
diff --git a/drivers/leds/simple/Makefile b/drivers/leds/simple/Makefile
new file mode 100644
index 000000000000..2ba655fdc175
--- /dev/null
+++ b/drivers/leds/simple/Makefile
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0
+
+obj-$(CONFIG_LEDS_MULTI_GPIO)	+= leds-multi-gpio.o
diff --git a/drivers/leds/simple/leds-multi-gpio.c b/drivers/leds/simple/leds-multi-gpio.c
new file mode 100644
index 000000000000..ede033354156
--- /dev/null
+++ b/drivers/leds/simple/leds-multi-gpio.c
@@ -0,0 +1,144 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2021 Axis Communications AB
+ */
+
+#include <linux/leds.h>
+#include <linux/gpio/consumer.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+
+
+#define MAX_GPIO_NUM  8
+
+struct multi_gpio_led_priv {
+	struct led_classdev cdev;
+
+	struct gpio_descs *gpios;
+
+	u16 nr_states;
+
+	u8 states[0];
+};
+
+
+static void multi_gpio_led_set(struct led_classdev *led_cdev,
+	enum led_brightness value)
+{
+	struct multi_gpio_led_priv *priv;
+	int idx;
+
+	DECLARE_BITMAP(values, MAX_GPIO_NUM);
+
+	priv = container_of(led_cdev, struct multi_gpio_led_priv, cdev);
+
+	idx = value > led_cdev->max_brightness ? led_cdev->max_brightness : value;
+
+	values[0] = priv->states[idx];
+
+	gpiod_set_array_value(priv->gpios->ndescs, priv->gpios->desc,
+	    priv->gpios->info, values);
+}
+
+static int multi_gpio_led_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *node = dev->of_node;
+	struct multi_gpio_led_priv *priv = NULL;
+	int ret;
+	const char *state = NULL;
+	struct led_init_data init_data = {};
+	struct gpio_descs *gpios;
+	u16 nr_states;
+
+	gpios = devm_gpiod_get_array(dev, "led", GPIOD_OUT_LOW);
+	if (IS_ERR(gpios))
+		return PTR_ERR(gpios);
+
+	if (gpios->ndescs >= MAX_GPIO_NUM) {
+		dev_err(dev, "Too many GPIOs\n");
+		return -EINVAL;
+	}
+
+	ret = of_property_count_u8_elems(node, "led-states");
+	if (ret < 0)
+		return ret;
+
+	if (ret != (1 << gpios->ndescs)) {
+		dev_err(dev, "led-states number should equal to 2^led-gpios\n");
+		return -EINVAL;
+	}
+
+	nr_states = ret;
+
+	priv = devm_kzalloc(dev, sizeof(struct multi_gpio_led_priv) + nr_states,
+			GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	ret = of_property_read_u8_array(node, "led-states", priv->states, nr_states);
+	if (ret)
+		return ret;
+
+	priv->gpios = gpios;
+	priv->nr_states = nr_states;
+
+	priv->cdev.max_brightness = nr_states;
+	priv->cdev.default_trigger = of_get_property(node, "linux,default-trigger", NULL);
+	priv->cdev.brightness_set = multi_gpio_led_set;
+
+	init_data.fwnode = of_fwnode_handle(node);
+
+	ret = devm_led_classdev_register_ext(dev, &priv->cdev, &init_data);
+	if (ret < 0)
+		return ret;
+
+	of_property_read_string(node, "default-state", &state);
+	if (!strcmp(state, "on"))
+		multi_gpio_led_set(&priv->cdev, priv->cdev.max_brightness);
+	else
+		multi_gpio_led_set(&priv->cdev, 0);
+
+	platform_set_drvdata(pdev, priv);
+
+	return 0;
+}
+
+static void multi_gpio_led_shutdown(struct platform_device *pdev)
+{
+	struct multi_gpio_led_priv *priv = platform_get_drvdata(pdev);
+
+	multi_gpio_led_set(&priv->cdev, 0);
+}
+
+static int multi_gpio_led_remove(struct platform_device *pdev)
+{
+	multi_gpio_led_shutdown(pdev);
+
+	return 0;
+}
+
+static const struct of_device_id of_multi_gpio_led_match[] = {
+	{ .compatible = "multi-gpio-led", },
+	{},
+};
+
+MODULE_DEVICE_TABLE(of, of_multi_gpio_led_match);
+
+static struct platform_driver multi_gpio_led_driver = {
+	.probe		= multi_gpio_led_probe,
+	.remove		= multi_gpio_led_remove,
+	.shutdown	= multi_gpio_led_shutdown,
+	.driver		= {
+		.name	= "multi-gpio-led",
+		.of_match_table = of_multi_gpio_led_match,
+	},
+};
+
+module_platform_driver(multi_gpio_led_driver);
+
+MODULE_AUTHOR("Hermes Zhang <chenhui.zhang@axis.com>");
+MODULE_DESCRIPTION("Multiple GPIOs LED driver");
+MODULE_LICENSE("GPL v2");
+MODULE_ALIAS("platform:leds-multi-gpio");
-- 
2.20.1

