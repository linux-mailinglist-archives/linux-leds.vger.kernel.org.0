Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 17F80347314
	for <lists+linux-leds@lfdr.de>; Wed, 24 Mar 2021 08:58:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235810AbhCXH5u (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 24 Mar 2021 03:57:50 -0400
Received: from smtp2.axis.com ([195.60.68.18]:32629 "EHLO smtp2.axis.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235953AbhCXH52 (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Wed, 24 Mar 2021 03:57:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1616572648;
  x=1648108648;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=tz3c8vEg+YhUyImT/Omf8T6K+ChEbg7v/T3Ay+6ePXU=;
  b=SkNVltBTjy1O1ezIvX64YvkX8qBWmydUZkNWC5mcm6I0DOUtpniaOksE
   cm6EyxlDlnAkeeZKi/yi+YgX3FwjFQiSWdBZBsym2YY3JtXKxsGzkUsS3
   ojh9V19tTKGpdybFw31KPELX/Dos0przrKH4llN3HLPCA2YzYAcg7yZYs
   Mx9fa03ZfQoWbr7pMKApQjmZkQ4Fj3b1kTC2bKjk19MXkWvll+d0cLpFH
   WMsyFMMq+pJfTLhtlGzyPXt8nLbZedNshEFkPv3CsdLY4PzZYCvPilRA9
   +sRJhVIgwtWx+cNFyXPnBXgmK9tk/PUvDohcuFgoqlrKCqleKXyY0zwOC
   Q==;
From:   Hermes Zhang <chenhui.zhang@axis.com>
To:     <pavel@ucw.cz>, <dmurphy@ti.com>, <robh+dt@kernel.org>
CC:     <linux-leds@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <chenhuiz@axis.com>,
        <lkml@axis.com>, <kernel@axis.com>
Subject: [PATCH 1/2] leds: leds-multi-gpio: Add multiple GPIOs LED driver
Date:   Wed, 24 Mar 2021 15:56:30 +0800
Message-ID: <20210324075631.5004-2-chenhui.zhang@axis.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210324075631.5004-1-chenhui.zhang@axis.com>
References: <20210324075631.5004-1-chenhui.zhang@axis.com>
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
 drivers/leds/Kconfig           |  12 +++
 drivers/leds/Makefile          |   1 +
 drivers/leds/leds-multi-gpio.c | 140 +++++++++++++++++++++++++++++++++
 3 files changed, 153 insertions(+)
 create mode 100644 drivers/leds/leds-multi-gpio.c

diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index b6742b4231bf..e3ff84080192 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -370,6 +370,18 @@ config LEDS_GPIO
 	  defined as platform devices and/or OpenFirmware platform devices.
 	  The code to use these bindings can be selected below.
 
+config LEDS_MULTI_GPIO
+	tristate "LED Support for multiple GPIOs LED"
+	depends on LEDS_CLASS
+	depends on GPIOLIB
+	help
+	  This option enables support for a multiple GPIOs LED. Such LED is made
+	  of multiple GPIOs and could change the brightness by setting different
+	  states of the GPIOs.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called leds-multi-gpio.
+
 config LEDS_LP3944
 	tristate "LED Support for N.S. LP3944 (Fun Light) I2C chip"
 	depends on LEDS_CLASS
diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
index 2a698df9da57..984201ec5375 100644
--- a/drivers/leds/Makefile
+++ b/drivers/leds/Makefile
@@ -30,6 +30,7 @@ obj-$(CONFIG_LEDS_DA903X)		+= leds-da903x.o
 obj-$(CONFIG_LEDS_DA9052)		+= leds-da9052.o
 obj-$(CONFIG_LEDS_FSG)			+= leds-fsg.o
 obj-$(CONFIG_LEDS_GPIO)			+= leds-gpio.o
+obj-$(CONFIG_LEDS_MULTI_GPIO)		+= leds-multi-gpio.o
 obj-$(CONFIG_LEDS_GPIO_REGISTER)	+= leds-gpio-register.o
 obj-$(CONFIG_LEDS_HP6XX)		+= leds-hp6xx.o
 obj-$(CONFIG_LEDS_INTEL_SS4200)		+= leds-ss4200.o
diff --git a/drivers/leds/leds-multi-gpio.c b/drivers/leds/leds-multi-gpio.c
new file mode 100644
index 000000000000..54d92c81a476
--- /dev/null
+++ b/drivers/leds/leds-multi-gpio.c
@@ -0,0 +1,140 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2021 Axis Communications AB
+ */
+
+#include <linux/err.h>
+#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
+#include <linux/kernel.h>
+#include <linux/leds.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_gpio.h>
+#include <linux/platform_device.h>
+#include <linux/property.h>
+#include <linux/slab.h>
+
+#define MAX_GPIO_NUM  8
+
+struct multi_gpio_led_priv {
+	struct led_classdev cdev;
+
+	struct gpio_descs *gpios;
+
+	u8 *states;
+	int nr_states;
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
+	idx = (value - LED_OFF) * priv->nr_states / (LED_FULL + 1);
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
+
+	priv = devm_kzalloc(dev, sizeof(struct multi_gpio_led_priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->gpios = devm_gpiod_get_array(dev, "led", GPIOD_OUT_LOW);
+	if (IS_ERR(priv->gpios))
+		return PTR_ERR(priv->gpios);
+
+	if (priv->gpios->ndescs >= MAX_GPIO_NUM) {
+		dev_err(dev, "Too many GPIOs\n");
+		return -EINVAL;
+	}
+
+	ret = of_property_count_u8_elems(node, "led-states");
+	if (ret < 0)
+		return ret;
+
+	priv->nr_states = ret;
+	priv->states = devm_kzalloc(dev, sizeof(*priv->states) * priv->nr_states, GFP_KERNEL);
+	if (!priv->states)
+		return -ENOMEM;
+
+	ret = of_property_read_u8_array(node, "led-states", priv->states, priv->nr_states);
+	if (ret)
+		return ret;
+
+	priv->cdev.max_brightness = LED_FULL;
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
+		multi_gpio_led_set(&priv->cdev, LED_FULL);
+	else
+		multi_gpio_led_set(&priv->cdev, LED_OFF);
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
+	multi_gpio_led_set(&priv->cdev, LED_OFF);
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

