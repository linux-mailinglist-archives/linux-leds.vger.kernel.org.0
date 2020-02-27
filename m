Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D93E5172875
	for <lists+linux-leds@lfdr.de>; Thu, 27 Feb 2020 20:18:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729545AbgB0TSU (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 27 Feb 2020 14:18:20 -0500
Received: from mail.z3ntu.xyz ([128.199.32.197]:51496 "EHLO mail.z3ntu.xyz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729418AbgB0TST (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Thu, 27 Feb 2020 14:18:19 -0500
X-Greylist: delayed 319 seconds by postgrey-1.27 at vger.kernel.org; Thu, 27 Feb 2020 14:18:17 EST
Received: from localhost.localdomain (80-110-126-226.cgn.dynamic.surfer.at [80.110.126.226])
        by mail.z3ntu.xyz (Postfix) with ESMTPSA id 4C186C2E6A;
        Thu, 27 Feb 2020 19:12:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=z3ntu.xyz; s=z3ntu;
        t=1582830775; bh=Y/pmKEy6mbtQ9MTu4C5WRO85Y36YOBMP53cw8i6LEMw=;
        h=From:To:Cc:Subject:Date;
        b=AAE2+wUxPm7bqokJXZtsH3ivLMlJvxVtUMR3pTaMn/472pkS24BDjnuINAJsbo5fx
         5mE/yaMC9dtIfBOfTD6a5HZdDRQZCR01qK26UQgzQNKh/olOTJWOwtksJPN98qOflD
         UddF9PdCWrJjaDBx65wuOLy846W1QBTz2trqtqlE=
From:   Luca Weiss <luca@z3ntu.xyz>
To:     linux-leds@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, Luca Weiss <luca@z3ntu.xyz>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        linux-kernel@vger.kernel.org
Subject: [RFC PATCH] leds: add sgm3140 driver
Date:   Thu, 27 Feb 2020 19:50:15 +0100
Message-Id: <20200227185015.212479-1-luca@z3ntu.xyz>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Add a driver for the SGMICRO SGM3140 Buck/Boost Charge Pump LED driver.

This device is controller by two GPIO lines, one for enabling the LED
and the second one for switching between torch and flash mode.

The device will automatically switch to torch mode after being in flash
mode for about 250-300ms, so after that time the driver will turn the
LED off again automatically.

Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
---
Hi, this driver is controllable via sysfs and v4l2 APIs (as documented
in Documentation/leds/leds-class-flash.rst).

The following is possible:

# Torch on
echo 1 > /sys/class/leds/white\:flash/brightness
# Torch off
echo 0 > /sys/class/leds/white\:flash/brightness
# Activate flash
echo 1 > /sys/class/leds/white\:flash/flash_strobe

# Torch on
v4l2-ctl -d /dev/video1 -c led_mode=2
# Torch off
v4l2-ctl -d /dev/video1 -c led_mode=0
# Activate flash
v4l2-ctl -d /dev/video1 -c strobe=1

Unfortunately the last command (enabling the 'flash' via v4l2 results in
the following being printed and nothing happening:

  VIDIOC_S_EXT_CTRLS: failed: Resource busy
  strobe: Resource busy

Unfortunately I couldn't figure out the reason so I'm hoping to get some
guidance for this. iirc it worked at some point but then stopped.

I will also write dt bindings for the driver once I have "strobe"
working.

Regards,
Luca

 drivers/leds/Kconfig        |   9 ++
 drivers/leds/Makefile       |   1 +
 drivers/leds/leds-sgm3140.c | 210 ++++++++++++++++++++++++++++++++++++
 3 files changed, 220 insertions(+)
 create mode 100644 drivers/leds/leds-sgm3140.c

diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index 4b68520ac251..7c391af8b380 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -836,6 +836,15 @@ config LEDS_LM36274
 	  Say Y to enable the LM36274 LED driver for TI LMU devices.
 	  This supports the LED device LM36274.
 
+config LEDS_SGM3140
+	tristate "LED support for the SGM3140"
+	depends on LEDS_CLASS_FLASH
+	depends on V4L2_FLASH_LED_CLASS || !V4L2_FLASH_LED_CLASS
+	depends on OF
+	help
+	  This option enables support for the SGM3140 500mA Buck/Boost Charge
+	  Pump LED Driver. It has supports flash and torch mode.
+
 comment "LED Triggers"
 source "drivers/leds/trigger/Kconfig"
 
diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
index 2da39e896ce8..38d57dd53e4b 100644
--- a/drivers/leds/Makefile
+++ b/drivers/leds/Makefile
@@ -85,6 +85,7 @@ obj-$(CONFIG_LEDS_LM3601X)		+= leds-lm3601x.o
 obj-$(CONFIG_LEDS_TI_LMU_COMMON)	+= leds-ti-lmu-common.o
 obj-$(CONFIG_LEDS_LM3697)		+= leds-lm3697.o
 obj-$(CONFIG_LEDS_LM36274)		+= leds-lm36274.o
+obj-$(CONFIG_LEDS_SGM3140)		+= leds-sgm3140.o
 
 # LED SPI Drivers
 obj-$(CONFIG_LEDS_CR0014114)		+= leds-cr0014114.o
diff --git a/drivers/leds/leds-sgm3140.c b/drivers/leds/leds-sgm3140.c
new file mode 100644
index 000000000000..9e91392f0343
--- /dev/null
+++ b/drivers/leds/leds-sgm3140.c
@@ -0,0 +1,210 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright (C) 2020 Luca Weiss <luca@z3ntu.xyz>
+
+#include <linux/gpio/consumer.h>
+#include <linux/led-class-flash.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+
+#include <media/v4l2-flash-led-class.h>
+
+#define SGM3140_NAME "sgm3140"
+
+struct sgm3140 {
+	struct gpio_desc *flash_gpio;
+	struct gpio_desc *enable_gpio;
+
+	struct led_classdev_flash fled_cdev;
+	struct v4l2_flash *v4l2_flash;
+
+	struct timer_list powerdown_timer;
+};
+
+static struct sgm3140 *flcdev_to_sgm3140(struct led_classdev_flash *flcdev)
+{
+	return container_of(flcdev, struct sgm3140, fled_cdev);
+}
+
+int sgm3140_strobe_set(struct led_classdev_flash *fled_cdev, bool state)
+{
+	struct sgm3140 *priv = flcdev_to_sgm3140(fled_cdev);
+
+	if (state) {
+		gpiod_set_value_cansleep(priv->flash_gpio, 1);
+		gpiod_set_value_cansleep(priv->enable_gpio, 1);
+		mod_timer(&priv->powerdown_timer,
+			  jiffies + msecs_to_jiffies(250));
+	} else {
+		gpiod_set_value_cansleep(priv->enable_gpio, 0);
+		gpiod_set_value_cansleep(priv->flash_gpio, 0);
+		del_timer_sync(&priv->powerdown_timer);
+	}
+
+	return 0;
+}
+
+struct led_flash_ops sgm3140_flash_ops = {
+	.strobe_set = sgm3140_strobe_set,
+};
+
+int sgm3140_brightness_set(struct led_classdev *led_cdev,
+			   enum led_brightness brightness)
+{
+	struct led_classdev_flash *fled_cdev = lcdev_to_flcdev(led_cdev);
+	struct sgm3140 *priv = flcdev_to_sgm3140(fled_cdev);
+
+	if (brightness == LED_OFF)
+		gpiod_set_value_cansleep(priv->enable_gpio, 0);
+	else
+		gpiod_set_value_cansleep(priv->enable_gpio, 1);
+
+	return 0;
+}
+
+static void sgm3140_powerdown_timer(struct timer_list *t)
+{
+	struct sgm3140 *priv = from_timer(priv, t, powerdown_timer);
+
+	gpiod_set_value_cansleep(priv->enable_gpio, 0);
+	gpiod_set_value_cansleep(priv->flash_gpio, 0);
+}
+
+#if IS_ENABLED(CONFIG_V4L2_FLASH_LED_CLASS)
+static void sgm3140_init_v4l2_flash_config(struct sgm3140 *priv,
+					   struct v4l2_flash_config *v4l2_sd_cfg)
+{
+	struct led_classdev *led_cdev = &priv->fled_cdev.led_cdev;
+	struct led_flash_setting *s;
+
+	strlcpy(v4l2_sd_cfg->dev_name, led_cdev->dev->kobj.name,
+		sizeof(v4l2_sd_cfg->dev_name));
+
+	s = &v4l2_sd_cfg->intensity;
+	s->min = 0;
+	s->max = 1;
+	s->step = 1;
+	s->val = 1;
+}
+
+#else
+static void sgm3140_init_v4l2_flash_config(struct sgm3140 *priv,
+					   struct v4l2_flash_config *v4l2_sd_cfg)
+{
+}
+#endif
+
+static int sgm3140_probe(struct platform_device *pdev)
+{
+	struct sgm3140 *priv;
+	struct led_classdev *led_cdev;
+	struct led_classdev_flash *fled_cdev;
+	struct led_init_data init_data = {};
+	struct device_node *child_node;
+	struct v4l2_flash_config v4l2_sd_cfg;
+	int ret;
+
+	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->flash_gpio = devm_gpiod_get(&pdev->dev, "flash", GPIOD_OUT_LOW);
+	ret = PTR_ERR_OR_ZERO(priv->flash_gpio);
+	if (ret) {
+		if (ret != -EPROBE_DEFER)
+			dev_err(&pdev->dev, "Failed to request flash gpio: %d\n",
+				ret);
+		return ret;
+	}
+
+	priv->enable_gpio = devm_gpiod_get(&pdev->dev, "enable", GPIOD_OUT_LOW);
+	ret = PTR_ERR_OR_ZERO(priv->enable_gpio);
+	if (ret) {
+		if (ret != -EPROBE_DEFER)
+			dev_err(&pdev->dev, "Failed to request enable gpio: %d\n",
+				ret);
+		return ret;
+	}
+
+	child_node = of_get_next_available_child(pdev->dev.of_node, NULL);
+	if (!child_node) {
+		dev_err(&pdev->dev, "No DT child node found for connected LED.\n");
+		return -EINVAL;
+	}
+
+	timer_setup(&priv->powerdown_timer, sgm3140_powerdown_timer, 0);
+
+	fled_cdev = &priv->fled_cdev;
+	led_cdev = &fled_cdev->led_cdev;
+
+	fled_cdev->ops = &sgm3140_flash_ops;
+
+	led_cdev->brightness_set_blocking = sgm3140_brightness_set;
+	led_cdev->max_brightness = LED_ON;
+	led_cdev->flags |= LED_DEV_CAP_FLASH;
+
+	init_data.fwnode = of_fwnode_handle(child_node);
+	init_data.devicename = SGM3140_NAME;
+
+	platform_set_drvdata(pdev, priv);
+
+	/* Register in the LED subsystem */
+	ret = led_classdev_flash_register_ext(&pdev->dev, fled_cdev, &init_data);
+	if (ret < 0) {
+		dev_err(&pdev->dev, "Failed to register flash device: %d\n",
+			ret);
+		goto err_flash_register;
+	}
+
+	sgm3140_init_v4l2_flash_config(priv, &v4l2_sd_cfg);
+
+	/* Create V4L2 Flash subdev */
+	priv->v4l2_flash = v4l2_flash_init(&pdev->dev, of_fwnode_handle(child_node),
+					   fled_cdev, NULL,
+					   &v4l2_sd_cfg);
+	if (IS_ERR(priv->v4l2_flash)) {
+		ret = PTR_ERR(priv->v4l2_flash);
+		goto err_v4l2_flash_init;
+	}
+
+	return 0;
+
+err_v4l2_flash_init:
+	led_classdev_flash_unregister(fled_cdev);
+err_flash_register:
+	of_node_put(child_node);
+	return ret;
+}
+
+static int sgm3140_remove(struct platform_device *pdev)
+{
+	struct sgm3140 *priv = platform_get_drvdata(pdev);
+
+	del_timer_sync(&priv->powerdown_timer);
+
+	v4l2_flash_release(priv->v4l2_flash);
+	led_classdev_flash_unregister(&priv->fled_cdev);
+
+	return 0;
+}
+
+static const struct of_device_id sgm3140_dt_match[] = {
+	{ .compatible = "sgmicro,sgm3140" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, sgm3140_dt_match);
+
+static struct platform_driver sgm3140_driver = {
+	.probe	= sgm3140_probe,
+	.remove	= sgm3140_remove,
+	.driver	= {
+		.name	= "sgm3140",
+		.of_match_table = sgm3140_dt_match,
+	},
+};
+
+module_platform_driver(sgm3140_driver);
+
+MODULE_AUTHOR("Luca Weiss <luca@z3ntu.xyz>");
+MODULE_DESCRIPTION("SG Micro SGM3140 charge pump led driver");
+MODULE_LICENSE("GPL v2");
-- 
2.25.1

