Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 603D834A10A
	for <lists+linux-leds@lfdr.de>; Fri, 26 Mar 2021 06:29:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229889AbhCZF25 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 26 Mar 2021 01:28:57 -0400
Received: from smtp2.axis.com ([195.60.68.18]:6449 "EHLO smtp2.axis.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229782AbhCZF2w (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Fri, 26 Mar 2021 01:28:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1616736532;
  x=1648272532;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9n9kzlHM/kAGr088hfHnQ3Z5BwNvyfuLLuWpHBUcbZY=;
  b=D1wVnOn583yY2HPJK1Ern2KDLsdXClcqhrlX69FPg3w6vZL8rqqBSs/U
   pblmq7zqhSlYxUvFK6asft25r0933A71K0uC+BAz6YW26nWWdyJqzIwuh
   V802tUN7J7tyox1x7vIHpl+kXpxJdFYxcwm0BULOJpLhDq2n38jE2D4Wu
   t6jjK/vQn56zUOfGKupeRup37xkQy3yjYn/rF87UGzAOqEpj9gNwS9u0U
   pQky+2r4fqU3+o/H9tOgKTJpUP3f4CVSram+c9FhtdLyByjyYNPIJpFel
   gFM4MI3mKO5Lh4WDDGQaBwq5jDE8x4tE+6UK1fBKh+a9vn8p+c+8Mzo+x
   Q==;
From:   Hermes Zhang <chenhui.zhang@axis.com>
To:     <pavel@ucw.cz>, <dmurphy@ti.com>, <robh+dt@kernel.org>
CC:     <linux-leds@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <chenhuiz@axis.com>,
        <lkml@axis.com>, <kernel@axis.com>
Subject: [PATCH v2 2/2] leds: leds-multi-gpio: Add multiple GPIOs LED driver
Date:   Fri, 26 Mar 2021 13:28:01 +0800
Message-ID: <20210326052801.17666-3-chenhui.zhang@axis.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210326052801.17666-1-chenhui.zhang@axis.com>
References: <20210326052801.17666-1-chenhui.zhang@axis.com>
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
 drivers/leds/Kconfig                  |   3 +
 drivers/leds/Makefile                 |   3 +
 drivers/leds/simple/Kconfig           |  23 ++++
 drivers/leds/simple/Makefile          |   3 +
 drivers/leds/simple/leds-multi-gpio.c | 144 ++++++++++++++++++++++++++
 5 files changed, 176 insertions(+)
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
index 2a698df9da57..26917d93fa03 100644
--- a/drivers/leds/Makefile
+++ b/drivers/leds/Makefile
@@ -111,3 +111,6 @@ obj-$(CONFIG_LEDS_TRIGGERS)		+= trigger/
 
 # LED Blink
 obj-$(CONFIG_LEDS_BLINK)                += blink/
+
+# LED Blink
+obj-$(CONFIG_LEDS_SIMPLE)		+= simple/
diff --git a/drivers/leds/simple/Kconfig b/drivers/leds/simple/Kconfig
new file mode 100644
index 000000000000..7aef82701f86
--- /dev/null
+++ b/drivers/leds/simple/Kconfig
@@ -0,0 +1,23 @@
+menuconfig LEDS_SIMPLE
+	bool "Simple LED support"
+	depends on LEDS_CLASS
+	help
+	  This option enables simple leds support for the leds class.
+	  If unsure, say Y.
+
+if LEDS_SIMPLE
+
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
+
+endif # LEDS_SIMPLE
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
index 000000000000..14fdaa5a2aac
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
+	if (ret != 1 << gpios->ndescs) {
+		dev_err(dev, "led-states number should equal to 2^led-gpios\n");
+		return -EINVAL;
+	}
+
+	nr_states = ret;
+
+	priv = devm_kzalloc(dev, sizeof(struct multi_gpio_led_priv)
+			+ sizeof(u8) * nr_states , GFP_KERNEL);
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

