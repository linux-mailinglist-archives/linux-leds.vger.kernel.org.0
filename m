Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 336011984CD
	for <lists+linux-leds@lfdr.de>; Mon, 30 Mar 2020 21:48:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728383AbgC3TsQ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 30 Mar 2020 15:48:16 -0400
Received: from mail.z3ntu.xyz ([128.199.32.197]:38716 "EHLO mail.z3ntu.xyz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727749AbgC3TsN (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Mon, 30 Mar 2020 15:48:13 -0400
Received: from localhost.localdomain (80-110-124-168.cgn.dynamic.surfer.at [80.110.124.168])
        by mail.z3ntu.xyz (Postfix) with ESMTPSA id 081E8C44D3;
        Mon, 30 Mar 2020 19:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=z3ntu.xyz; s=z3ntu;
        t=1585597691; bh=Ruipd1bzAKmwlDFx+YmmhE3RYOyP2v6rGobEDeBAkf8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=SYqiUScnSxQr781OD/EjndMWjPyPlZB1aVHLweqgbKgFADtPXTRxMW6Mjz4dlI+Rm
         H5CtGPtl09sLY28mSq0oBHKH6zv/CdnaR+8ds0JshawFF2VHl2SdsDDmyFzaVVTuOQ
         fXDHmqD1uUVRunUsWQNWT2NVw6cheAShQX5ySf5k=
From:   Luca Weiss <luca@z3ntu.xyz>
To:     linux-leds@vger.kernel.org
Cc:     Dan Murphy <dmurphy@ti.com>, Heiko Stuebner <heiko@sntech.de>,
        Icenowy Zheng <icenowy@aosc.io>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Maxime Ripard <mripard@kernel.org>,
        Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, Luca Weiss <luca@z3ntu.xyz>
Subject: [PATCH v2 2/2] leds: add sgm3140 driver
Date:   Mon, 30 Mar 2020 21:47:57 +0200
Message-Id: <20200330194757.2645388-3-luca@z3ntu.xyz>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200330194757.2645388-1-luca@z3ntu.xyz>
References: <20200330194757.2645388-1-luca@z3ntu.xyz>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Add a driver for the SGMICRO SGM3140 Buck/Boost Charge Pump LED driver.

This device is controlled by two GPIO pins, one for enabling and the
second one for switching between torch and flash mode.

Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
---
Changes since v1:
- Add vin-supply (keep track of 'enabled' state for that)
- Wrap lines
- static const -ify some structs and methods
- use strscpy instead of strlcpy
- remove u32 cast by adding 'U' suffix to constants
- rebase on linux-next

 drivers/leds/Kconfig        |   9 +
 drivers/leds/Makefile       |   1 +
 drivers/leds/leds-sgm3140.c | 317 ++++++++++++++++++++++++++++++++++++
 3 files changed, 327 insertions(+)
 create mode 100644 drivers/leds/leds-sgm3140.c

diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index 7599dbee8de1..f5beeff16bdd 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -871,6 +871,15 @@ config LEDS_IP30
 	  To compile this driver as a module, choose M here: the module
 	  will be called leds-ip30.
 
+config LEDS_SGM3140
+	tristate "LED support for the SGM3140"
+	depends on LEDS_CLASS_FLASH
+	depends on V4L2_FLASH_LED_CLASS || !V4L2_FLASH_LED_CLASS
+	depends on OF
+	help
+	  This option enables support for the SGM3140 500mA Buck/Boost Charge
+	  Pump LED Driver.
+
 comment "LED Triggers"
 source "drivers/leds/trigger/Kconfig"
 
diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
index fd61421f7d40..f60ed0c09d4c 100644
--- a/drivers/leds/Makefile
+++ b/drivers/leds/Makefile
@@ -77,6 +77,7 @@ obj-$(CONFIG_LEDS_PWM)			+= leds-pwm.o
 obj-$(CONFIG_LEDS_REGULATOR)		+= leds-regulator.o
 obj-$(CONFIG_LEDS_S3C24XX)		+= leds-s3c24xx.o
 obj-$(CONFIG_LEDS_SC27XX_BLTC)		+= leds-sc27xx-bltc.o
+obj-$(CONFIG_LEDS_SGM3140)		+= leds-sgm3140.o
 obj-$(CONFIG_LEDS_SUNFIRE)		+= leds-sunfire.o
 obj-$(CONFIG_LEDS_SYSCON)		+= leds-syscon.o
 obj-$(CONFIG_LEDS_TCA6507)		+= leds-tca6507.o
diff --git a/drivers/leds/leds-sgm3140.c b/drivers/leds/leds-sgm3140.c
new file mode 100644
index 000000000000..28fe5e34f931
--- /dev/null
+++ b/drivers/leds/leds-sgm3140.c
@@ -0,0 +1,317 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright (C) 2020 Luca Weiss <luca@z3ntu.xyz>
+
+#include <linux/gpio/consumer.h>
+#include <linux/led-class-flash.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/regulator/consumer.h>
+#include <linux/platform_device.h>
+
+#include <media/v4l2-flash-led-class.h>
+
+#define FLASH_TIMEOUT_DEFAULT		250000U /* 250ms */
+#define FLASH_MAX_TIMEOUT_DEFAULT	300000U /* 300ms */
+
+struct sgm3140 {
+	bool enabled;
+	struct gpio_desc *flash_gpio;
+	struct gpio_desc *enable_gpio;
+	struct regulator *vin_regulator;
+
+	/* current timeout in us */
+	u32 timeout;
+	/* maximum timeout in us */
+	u32 max_timeout;
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
+static int sgm3140_strobe_set(struct led_classdev_flash *fled_cdev, bool state)
+{
+	struct sgm3140 *priv = flcdev_to_sgm3140(fled_cdev);
+	int ret;
+
+	if (priv->enabled == state)
+		return 0;
+
+	if (state) {
+		ret = regulator_enable(priv->vin_regulator);
+		if (ret) {
+			dev_err(fled_cdev->led_cdev.dev,
+				"failed to enable regulator: %d\n", ret);
+			return ret;
+		}
+		gpiod_set_value_cansleep(priv->flash_gpio, 1);
+		gpiod_set_value_cansleep(priv->enable_gpio, 1);
+		mod_timer(&priv->powerdown_timer,
+			  jiffies + usecs_to_jiffies(priv->timeout));
+	} else {
+		del_timer_sync(&priv->powerdown_timer);
+		gpiod_set_value_cansleep(priv->enable_gpio, 0);
+		gpiod_set_value_cansleep(priv->flash_gpio, 0);
+		ret = regulator_disable(priv->vin_regulator);
+		if (ret) {
+			dev_err(fled_cdev->led_cdev.dev,
+				"failed to disable regulator: %d\n", ret);
+			return ret;
+		}
+	}
+
+	priv->enabled = state;
+
+	return 0;
+}
+
+static int sgm3140_strobe_get(struct led_classdev_flash *fled_cdev, bool *state)
+{
+	struct sgm3140 *priv = flcdev_to_sgm3140(fled_cdev);
+
+	*state = timer_pending(&priv->powerdown_timer);
+
+	return 0;
+}
+
+static int sgm3140_timeout_set(struct led_classdev_flash *fled_cdev,
+			       u32 timeout)
+{
+	struct sgm3140 *priv = flcdev_to_sgm3140(fled_cdev);
+
+	priv->timeout = timeout;
+
+	return 0;
+}
+
+static const struct led_flash_ops sgm3140_flash_ops = {
+	.strobe_set = sgm3140_strobe_set,
+	.strobe_get = sgm3140_strobe_get,
+	.timeout_set = sgm3140_timeout_set,
+};
+
+static int sgm3140_brightness_set(struct led_classdev *led_cdev,
+				  enum led_brightness brightness)
+{
+	struct led_classdev_flash *fled_cdev = lcdev_to_flcdev(led_cdev);
+	struct sgm3140 *priv = flcdev_to_sgm3140(fled_cdev);
+	bool enable = brightness == LED_ON;
+	int ret;
+
+	if (priv->enabled == enable)
+		return 0;
+
+	if (enable) {
+		ret = regulator_enable(priv->vin_regulator);
+		if (ret) {
+			dev_err(led_cdev->dev,
+				"failed to enable regulator: %d\n", ret);
+			return ret;
+		}
+		gpiod_set_value_cansleep(priv->enable_gpio, 1);
+	} else {
+		gpiod_set_value_cansleep(priv->enable_gpio, 0);
+		ret = regulator_disable(priv->vin_regulator);
+		if (ret) {
+			dev_err(led_cdev->dev,
+				"failed to disable regulator: %d\n", ret);
+			return ret;
+		}
+	}
+
+	priv->enabled = enable;
+
+	return 0;
+}
+
+static void sgm3140_powerdown_timer(struct timer_list *t)
+{
+	struct sgm3140 *priv = from_timer(priv, t, powerdown_timer);
+
+	gpiod_set_value(priv->enable_gpio, 0);
+	gpiod_set_value(priv->flash_gpio, 0);
+	regulator_disable(priv->vin_regulator);
+
+	priv->enabled = false;
+}
+
+static void sgm3140_init_flash_timeout(struct sgm3140 *priv)
+{
+	struct led_classdev_flash *fled_cdev = &priv->fled_cdev;
+	struct led_flash_setting *s;
+
+	/* Init flash timeout setting */
+	s = &fled_cdev->timeout;
+	s->min = 1;
+	s->max = priv->max_timeout;
+	s->step = 1;
+	s->val = FLASH_TIMEOUT_DEFAULT;
+}
+
+#if IS_ENABLED(CONFIG_V4L2_FLASH_LED_CLASS)
+static void sgm3140_init_v4l2_flash_config(struct sgm3140 *priv,
+					struct v4l2_flash_config *v4l2_sd_cfg)
+{
+	struct led_classdev *led_cdev = &priv->fled_cdev.led_cdev;
+	struct led_flash_setting *s;
+
+	strscpy(v4l2_sd_cfg->dev_name, led_cdev->dev->kobj.name,
+		sizeof(v4l2_sd_cfg->dev_name));
+
+	/* Init flash intensity setting */
+	s = &v4l2_sd_cfg->intensity;
+	s->min = 0;
+	s->max = 1;
+	s->step = 1;
+	s->val = 1;
+}
+
+#else
+static void sgm3140_init_v4l2_flash_config(struct sgm3140 *priv,
+					struct v4l2_flash_config *v4l2_sd_cfg)
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
+	struct v4l2_flash_config v4l2_sd_cfg = {};
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
+			dev_err(&pdev->dev,
+				"Failed to request flash gpio: %d\n", ret);
+		return ret;
+	}
+
+	priv->enable_gpio = devm_gpiod_get(&pdev->dev, "enable", GPIOD_OUT_LOW);
+	ret = PTR_ERR_OR_ZERO(priv->enable_gpio);
+	if (ret) {
+		if (ret != -EPROBE_DEFER)
+			dev_err(&pdev->dev,
+				"Failed to request enable gpio: %d\n", ret);
+		return ret;
+	}
+
+	priv->vin_regulator = devm_regulator_get(&pdev->dev, "vin");
+	ret = PTR_ERR_OR_ZERO(priv->vin_regulator);
+	if (ret) {
+		if (ret != -EPROBE_DEFER)
+			dev_err(&pdev->dev,
+				"Failed to request regulator: %d\n", ret);
+		return ret;
+	}
+
+	child_node = of_get_next_available_child(pdev->dev.of_node, NULL);
+	if (!child_node) {
+		dev_err(&pdev->dev,
+			"No DT child node found for connected LED.\n");
+		return -EINVAL;
+	}
+
+	ret = of_property_read_u32(child_node, "flash-max-timeout-us",
+				   &priv->max_timeout);
+	if (ret) {
+		priv->max_timeout = FLASH_MAX_TIMEOUT_DEFAULT;
+		dev_warn(&pdev->dev,
+			 "flash-max-timeout-us DT property missing\n");
+	}
+
+	/*
+	 * Set default timeout to FLASH_DEFAULT_TIMEOUT except if max_timeout
+	 * from DT is lower.
+	 */
+	priv->timeout = min(priv->max_timeout, FLASH_TIMEOUT_DEFAULT);
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
+	sgm3140_init_flash_timeout(priv);
+
+	init_data.fwnode = of_fwnode_handle(child_node);
+
+	platform_set_drvdata(pdev, priv);
+
+	/* Register in the LED subsystem */
+	ret = devm_led_classdev_flash_register_ext(&pdev->dev,
+						   fled_cdev, &init_data);
+	if (ret) {
+		dev_err(&pdev->dev, "Failed to register flash device: %d\n",
+			ret);
+		goto err;
+	}
+
+	sgm3140_init_v4l2_flash_config(priv, &v4l2_sd_cfg);
+
+	/* Create V4L2 Flash subdev */
+	priv->v4l2_flash = v4l2_flash_init(&pdev->dev,
+					   of_fwnode_handle(child_node),
+					   fled_cdev, NULL,
+					   &v4l2_sd_cfg);
+	if (IS_ERR(priv->v4l2_flash)) {
+		ret = PTR_ERR(priv->v4l2_flash);
+		goto err;
+	}
+
+err:
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
2.26.0

