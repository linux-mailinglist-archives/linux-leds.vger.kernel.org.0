Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1518F2717E4
	for <lists+linux-leds@lfdr.de>; Sun, 20 Sep 2020 22:42:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726151AbgITUmG (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 20 Sep 2020 16:42:06 -0400
Received: from mail.nic.cz ([217.31.204.67]:57622 "EHLO mail.nic.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726148AbgITUmG (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Sun, 20 Sep 2020 16:42:06 -0400
Received: from dellmb.labs.office.nic.cz (unknown [IPv6:2001:1488:fffe:6:cac7:3539:7f1f:463])
        by mail.nic.cz (Postfix) with ESMTP id C08D1140A7D;
        Sun, 20 Sep 2020 22:42:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
        t=1600634524; bh=i/cQt/bvvJa7JbUzJ3gwFFCIRamBlqSO1m9zA3O0x34=;
        h=From:To:Date;
        b=atjuBXbeIRy8K++wHVECwiI/iPBONMVqcANNUnJJ522DLW1LbdpmbB2XXcixAnG95
         LXBCsKboU4ttaCYb3u5teOT1wJ/LRbzk4Vn6OYqL39jZNDXHzXqQJDnk0FIxj2u/9l
         QbbpFajcrlb+qSj1N9l60RvgqGbOUu/SQkuAn+Vw=
From:   =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>
To:     linux-leds@vger.kernel.org
Cc:     Pavel Machek <pavel@ucw.cz>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>, dmurphy@ti.com,
        linux-kernel@vger.kernel.org, Antonio Ospite <ao2@ao2.it>,
        =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>
Subject: [PATCH leds] leds: regulator: remove driver
Date:   Sun, 20 Sep 2020 22:42:03 +0200
Message-Id: <20200920204203.17148-1-marek.behun@nic.cz>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.nic.cz
X-Spam-Status: No, score=0.00
X-Spamd-Bar: /
X-Virus-Scanned: clamav-milter 0.102.2 at mail
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

The leds-regulator driver only supports the old platform data binding
and no in-tree code uses it. It also seems that no OpenWRT board uses
it.

Remove this driver.

Signed-off-by: Marek Behún <marek.behun@nic.cz>
---
 drivers/leds/Kconfig           |   7 --
 drivers/leds/Makefile          |   1 -
 drivers/leds/leds-regulator.c  | 200 ---------------------------------
 include/linux/leds-regulator.h |  42 -------
 4 files changed, 250 deletions(-)
 delete mode 100644 drivers/leds/leds-regulator.c
 delete mode 100644 include/linux/leds-regulator.h

diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index a008170e73cd8..905e1ff367f33 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -586,13 +586,6 @@ config LEDS_PWM
 	help
 	  This option enables support for pwm driven LEDs
 
-config LEDS_REGULATOR
-	tristate "REGULATOR driven LED support"
-	depends on LEDS_CLASS
-	depends on REGULATOR
-	help
-	  This option enables support for regulator driven LEDs.
-
 config LEDS_BD2802
 	tristate "LED driver for BD2802 RGB LED"
 	depends on LEDS_CLASS
diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
index 778cb4bb8c520..159878eb95f28 100644
--- a/drivers/leds/Makefile
+++ b/drivers/leds/Makefile
@@ -78,7 +78,6 @@ obj-$(CONFIG_LEDS_PCA963X)		+= leds-pca963x.o
 obj-$(CONFIG_LEDS_PM8058)		+= leds-pm8058.o
 obj-$(CONFIG_LEDS_POWERNV)		+= leds-powernv.o
 obj-$(CONFIG_LEDS_PWM)			+= leds-pwm.o
-obj-$(CONFIG_LEDS_REGULATOR)		+= leds-regulator.o
 obj-$(CONFIG_LEDS_S3C24XX)		+= leds-s3c24xx.o
 obj-$(CONFIG_LEDS_SC27XX_BLTC)		+= leds-sc27xx-bltc.o
 obj-$(CONFIG_LEDS_SGM3140)		+= leds-sgm3140.o
diff --git a/drivers/leds/leds-regulator.c b/drivers/leds/leds-regulator.c
deleted file mode 100644
index 208c98918433e..0000000000000
--- a/drivers/leds/leds-regulator.c
+++ /dev/null
@@ -1,200 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * leds-regulator.c - LED class driver for regulator driven LEDs.
- *
- * Copyright (C) 2009 Antonio Ospite <ospite@studenti.unina.it>
- *
- * Inspired by leds-wm8350 driver.
- */
-
-#include <linux/module.h>
-#include <linux/err.h>
-#include <linux/slab.h>
-#include <linux/leds.h>
-#include <linux/leds-regulator.h>
-#include <linux/platform_device.h>
-#include <linux/regulator/consumer.h>
-
-#define to_regulator_led(led_cdev) \
-	container_of(led_cdev, struct regulator_led, cdev)
-
-struct regulator_led {
-	struct led_classdev cdev;
-	int enabled;
-	struct mutex mutex;
-
-	struct regulator *vcc;
-};
-
-static inline int led_regulator_get_max_brightness(struct regulator *supply)
-{
-	int ret;
-	int voltage = regulator_list_voltage(supply, 0);
-
-	if (voltage <= 0)
-		return 1;
-
-	/* even if regulator can't change voltages,
-	 * we still assume it can change status
-	 * and the LED can be turned on and off.
-	 */
-	ret = regulator_set_voltage(supply, voltage, voltage);
-	if (ret < 0)
-		return 1;
-
-	return regulator_count_voltages(supply);
-}
-
-static int led_regulator_get_voltage(struct regulator *supply,
-		enum led_brightness brightness)
-{
-	if (brightness == 0)
-		return -EINVAL;
-
-	return regulator_list_voltage(supply, brightness - 1);
-}
-
-
-static void regulator_led_enable(struct regulator_led *led)
-{
-	int ret;
-
-	if (led->enabled)
-		return;
-
-	ret = regulator_enable(led->vcc);
-	if (ret != 0) {
-		dev_err(led->cdev.dev, "Failed to enable vcc: %d\n", ret);
-		return;
-	}
-
-	led->enabled = 1;
-}
-
-static void regulator_led_disable(struct regulator_led *led)
-{
-	int ret;
-
-	if (!led->enabled)
-		return;
-
-	ret = regulator_disable(led->vcc);
-	if (ret != 0) {
-		dev_err(led->cdev.dev, "Failed to disable vcc: %d\n", ret);
-		return;
-	}
-
-	led->enabled = 0;
-}
-
-static int regulator_led_brightness_set(struct led_classdev *led_cdev,
-					 enum led_brightness value)
-{
-	struct regulator_led *led = to_regulator_led(led_cdev);
-	int voltage;
-	int ret = 0;
-
-	mutex_lock(&led->mutex);
-
-	if (value == LED_OFF) {
-		regulator_led_disable(led);
-		goto out;
-	}
-
-	if (led->cdev.max_brightness > 1) {
-		voltage = led_regulator_get_voltage(led->vcc, value);
-		dev_dbg(led->cdev.dev, "brightness: %d voltage: %d\n",
-				value, voltage);
-
-		ret = regulator_set_voltage(led->vcc, voltage, voltage);
-		if (ret != 0)
-			dev_err(led->cdev.dev, "Failed to set voltage %d: %d\n",
-				voltage, ret);
-	}
-
-	regulator_led_enable(led);
-
-out:
-	mutex_unlock(&led->mutex);
-	return ret;
-}
-
-static int regulator_led_probe(struct platform_device *pdev)
-{
-	struct led_regulator_platform_data *pdata =
-			dev_get_platdata(&pdev->dev);
-	struct regulator_led *led;
-	struct regulator *vcc;
-	int ret = 0;
-
-	if (pdata == NULL) {
-		dev_err(&pdev->dev, "no platform data\n");
-		return -ENODEV;
-	}
-
-	vcc = devm_regulator_get_exclusive(&pdev->dev, "vled");
-	if (IS_ERR(vcc)) {
-		dev_err(&pdev->dev, "Cannot get vcc for %s\n", pdata->name);
-		return PTR_ERR(vcc);
-	}
-
-	led = devm_kzalloc(&pdev->dev, sizeof(*led), GFP_KERNEL);
-	if (led == NULL)
-		return -ENOMEM;
-
-	led->cdev.max_brightness = led_regulator_get_max_brightness(vcc);
-	if (pdata->brightness > led->cdev.max_brightness) {
-		dev_err(&pdev->dev, "Invalid default brightness %d\n",
-				pdata->brightness);
-		return -EINVAL;
-	}
-
-	led->cdev.brightness_set_blocking = regulator_led_brightness_set;
-	led->cdev.name = pdata->name;
-	led->cdev.flags |= LED_CORE_SUSPENDRESUME;
-	led->vcc = vcc;
-
-	/* to handle correctly an already enabled regulator */
-	if (regulator_is_enabled(led->vcc))
-		led->enabled = 1;
-
-	mutex_init(&led->mutex);
-
-	platform_set_drvdata(pdev, led);
-
-	ret = led_classdev_register(&pdev->dev, &led->cdev);
-	if (ret < 0)
-		return ret;
-
-	/* to expose the default value to userspace */
-	led->cdev.brightness = pdata->brightness;
-
-	/* Set the default led status */
-	regulator_led_brightness_set(&led->cdev, led->cdev.brightness);
-
-	return 0;
-}
-
-static int regulator_led_remove(struct platform_device *pdev)
-{
-	struct regulator_led *led = platform_get_drvdata(pdev);
-
-	led_classdev_unregister(&led->cdev);
-	regulator_led_disable(led);
-	return 0;
-}
-
-static struct platform_driver regulator_led_driver = {
-	.driver = {
-		   .name  = "leds-regulator",
-		   },
-	.probe  = regulator_led_probe,
-	.remove = regulator_led_remove,
-};
-
-module_platform_driver(regulator_led_driver);
-
-MODULE_AUTHOR("Antonio Ospite <ospite@studenti.unina.it>");
-MODULE_DESCRIPTION("Regulator driven LED driver");
-MODULE_LICENSE("GPL");
-MODULE_ALIAS("platform:leds-regulator");
diff --git a/include/linux/leds-regulator.h b/include/linux/leds-regulator.h
deleted file mode 100644
index 899f816073a14..0000000000000
--- a/include/linux/leds-regulator.h
+++ /dev/null
@@ -1,42 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * leds-regulator.h - platform data structure for regulator driven LEDs.
- *
- * Copyright (C) 2009 Antonio Ospite <ospite@studenti.unina.it>
- */
-
-#ifndef __LINUX_LEDS_REGULATOR_H
-#define __LINUX_LEDS_REGULATOR_H
-
-/*
- * Use "vled" as supply id when declaring the regulator consumer:
- *
- * static struct regulator_consumer_supply pcap_regulator_VVIB_consumers [] = {
- * 	{ .dev_name = "leds-regulator.0", .supply = "vled" },
- * };
- *
- * If you have several regulator driven LEDs, you can append a numerical id to
- * .dev_name as done above, and use the same id when declaring the platform
- * device:
- *
- * static struct led_regulator_platform_data a780_vibrator_data = {
- * 	.name   = "a780::vibrator",
- * };
- *
- * static struct platform_device a780_vibrator = {
- * 	.name = "leds-regulator",
- * 	.id   = 0,
- * 	.dev  = {
- * 		.platform_data = &a780_vibrator_data,
- * 	},
- * };
- */
-
-#include <linux/leds.h>
-
-struct led_regulator_platform_data {
-	char *name;                     /* LED name as expected by LED class */
-	enum led_brightness brightness; /* initial brightness value */
-};
-
-#endif /* __LINUX_LEDS_REGULATOR_H */
-- 
2.26.2

