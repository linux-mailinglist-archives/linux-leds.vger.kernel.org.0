Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C0CCC2AE563
	for <lists+linux-leds@lfdr.de>; Wed, 11 Nov 2020 02:14:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732319AbgKKBOd (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 10 Nov 2020 20:14:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731746AbgKKBO3 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 10 Nov 2020 20:14:29 -0500
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 964D1C0613D1
        for <linux-leds@vger.kernel.org>; Tue, 10 Nov 2020 17:14:27 -0800 (PST)
Received: by mail-lj1-x241.google.com with SMTP id q19so135643ljc.10
        for <linux-leds@vger.kernel.org>; Tue, 10 Nov 2020 17:14:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sPP9a9B/tXu52SXiHzuCBSti5dQEq2cWaujBKDJaUkU=;
        b=GlPJslaaPDSPl5DfGxf9WTjVAoe4//JEjLPQMqRXV66xBQg27Kq+9ZqdkDXtn9NLW8
         G6uDmlLmxWACk78tAbXu1yAAShyk0X2bF2uLoXrjF4Gyxr8cKZ9R5yDL860P62aRarI6
         TvJY4hYlX8hJTr6GOe0dgCrqFZpqZR6TCzGqRm98/ny/9057Y/k7wd7tb9gQeEIhDJ7R
         YUwvYW1BMDKfFStPOGN6CHiX6FUPNbLBqLLlb7akeqxaH/PLcXBF6nwmIt+PSdqM0SNE
         WwvZG6zAFHMFnwaQrAd1XYPfiooTJjyuFUJgY8TOsDwLNs05DeCbZ9kEbBAms4mfwl1t
         Ywpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sPP9a9B/tXu52SXiHzuCBSti5dQEq2cWaujBKDJaUkU=;
        b=GJ7z23k4MsvCkHa4dNlPjbJD2zCGfXUYIgm4f6ZduRvrPkbVGQpKEs0T44G59xAshw
         OfR+B1LqyMBzg/aTssOYfZQ26sQwV/VCnjeK/lOmsCii4WLW3eMDmowNCMy7yIu+s6aq
         oFpDqTaPaGN1k/JhqMN3s4kMLe98MPRXpNRNDdQ5MlpyeroUzuNXB4JHTAidnpTIXoMe
         S/HiIhhH9+ZRwUOi7UwiOqLuDXf+skG41JnbOrRwMbXcz/zbKcfJ97xmbv1uEDTIuy8E
         2DxcZz4Q6QQL4KkkGYZ/4kZamlSL3ve7+wfm8E+pxOmXqRM6RtUZPnvrlK2R4lo7cOsh
         8zzg==
X-Gm-Message-State: AOAM5318QMKQ5sBpne1GCB/4Ke48HYlUr059TObj80J8WNeBMqInGCHM
        GakSk6sbsbFr5PRiXgeXNHgygA==
X-Google-Smtp-Source: ABdhPJxUp1pMidhde1gm2xkox97pY8Nphm1QEc9D3BbbF23kbKhhkjFm6GuJMnmQt4NhdcLHWoe54A==
X-Received: by 2002:a05:651c:1105:: with SMTP id d5mr3401064ljo.265.1605057265069;
        Tue, 10 Nov 2020 17:14:25 -0800 (PST)
Received: from localhost.bredbandsbolaget (c-92d7225c.014-348-6c756e10.bbcust.telenor.se. [92.34.215.146])
        by smtp.gmail.com with ESMTPSA id r9sm47836ljd.23.2020.11.10.17.14.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2020 17:14:24 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>
Cc:     linux-leds@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Sakari Ailus <sakari.ailus@iki.fi>, newbytee@protonmail.com,
        Stephan Gerhold <stephan@gerhold.net>
Subject: [PATCH 2/2 v3] leds: rt8515: Add Richtek RT8515 LED driver
Date:   Wed, 11 Nov 2020 02:14:17 +0100
Message-Id: <20201111011417.2275501-2-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201111011417.2275501-1-linus.walleij@linaro.org>
References: <20201111011417.2275501-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

This adds a driver for the Richtek RT8515 dual channel
torch/flash white LED driver.

This LED driver is found in some mobile phones from
Samsung such as the GT-S7710 and GT-I8190.

A V4L interface is added.

I do not have any datsheet for the Richtek RT8515.
In the outoftree code that exists for example for Asus
Zenfone the intensity is set to min/max in percent
(0-100%) so the numerals 1-100 step 1 so the same as
the brightness. I do not know the actuall current
this results in.

Cc: Sakari Ailus <sakari.ailus@iki.fi>
Cc: newbytee@protonmail.com
Cc: Stephan Gerhold <stephan@gerhold.net>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Changelog v2->v3:
- Expand commit message.
- Add Sakari to Cc.
- Resend.
ChangeLog v1->v2:
- Break out routine to bitbang the brightness on a
  GPIO pin.
- Do not hardcode the LED name so that the framework
  can name it from DT properties.
---
 drivers/leds/Kconfig       |  11 ++
 drivers/leds/Makefile      |   1 +
 drivers/leds/leds-rt8515.c | 303 +++++++++++++++++++++++++++++++++++++
 3 files changed, 315 insertions(+)
 create mode 100644 drivers/leds/leds-rt8515.c

diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index 849d3c5f908e..df632608d732 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -913,6 +913,17 @@ config LEDS_IP30
 	  To compile this driver as a module, choose M here: the module
 	  will be called leds-ip30.
 
+config LEDS_RT8515
+	tristate "LED support for Richtek RT8515 flash/torch LED"
+	depends on LEDS_CLASS_FLASH
+	depends on GPIOLIB
+	help
+	  This option enables support for the Richtek RT8515 flash
+	  and torch LEDs found on some mobile phones.
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called leds-rt8515.
+
 config LEDS_SGM3140
 	tristate "LED support for the SGM3140"
 	depends on LEDS_CLASS_FLASH
diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
index 73e603e1727e..aa6b2a19e051 100644
--- a/drivers/leds/Makefile
+++ b/drivers/leds/Makefile
@@ -80,6 +80,7 @@ obj-$(CONFIG_LEDS_PM8058)		+= leds-pm8058.o
 obj-$(CONFIG_LEDS_POWERNV)		+= leds-powernv.o
 obj-$(CONFIG_LEDS_PWM)			+= leds-pwm.o
 obj-$(CONFIG_LEDS_REGULATOR)		+= leds-regulator.o
+obj-$(CONFIG_LEDS_RT8515)		+= leds-rt8515.o
 obj-$(CONFIG_LEDS_S3C24XX)		+= leds-s3c24xx.o
 obj-$(CONFIG_LEDS_SC27XX_BLTC)		+= leds-sc27xx-bltc.o
 obj-$(CONFIG_LEDS_SGM3140)		+= leds-sgm3140.o
diff --git a/drivers/leds/leds-rt8515.c b/drivers/leds/leds-rt8515.c
new file mode 100644
index 000000000000..a87019b7eebe
--- /dev/null
+++ b/drivers/leds/leds-rt8515.c
@@ -0,0 +1,303 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * LED driver for Richtek RT8515 flash/torch white LEDs
+ * found on some Samsung mobile phones.
+ * This is a 1.5A Boost dual channel driver produced around 2011.
+ *
+ * Linus Walleij <linus.walleij@linaro.org>
+ */
+#include <linux/delay.h>
+#include <linux/err.h>
+#include <linux/gpio/consumer.h>
+#include <linux/led-class-flash.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/regulator/consumer.h>
+
+#include <media/v4l2-flash-led-class.h>
+
+#define RT8515_FLASH_MAX 16
+#define RT8515_TORCH_MAX 100
+
+#define RT8515_TIMEOUT_DEFAULT		250000U /* 250ms */
+#define RT8515_MAX_TIMEOUT_DEFAULT	300000U /* 300ms */
+
+struct rt8515 {
+	struct led_classdev_flash fled;
+	struct v4l2_flash *v4l2_flash;
+	struct mutex lock;
+	struct regulator *reg;
+	struct gpio_desc *ent;
+	struct gpio_desc *enf;
+	struct timer_list powerdown_timer;
+	u32 max_timeout; /* Flash max timeout */
+};
+
+static struct rt8515 *to_rt8515(struct led_classdev_flash *fled)
+{
+	return container_of(fled, struct rt8515, fled);
+}
+
+static void rt8515_gpio_brightness_commit(struct gpio_desc *gpiod,
+					  int brightness)
+{
+	int i;
+
+	/*
+	 * Toggling a GPIO line with a small delay increases the
+	 * brightness one step at a time.
+	 */
+	for (i = 0; i < brightness; i++) {
+		gpiod_set_value(gpiod, 0);
+		udelay(1);
+		gpiod_set_value(gpiod, 1);
+		udelay(1);
+	}
+}
+
+/* This is setting the torch light level */
+static int rt8515_led_brightness_set(struct led_classdev *led,
+				     enum led_brightness brightness)
+{
+	struct led_classdev_flash *fled = lcdev_to_flcdev(led);
+	struct rt8515 *rt = to_rt8515(fled);
+
+	mutex_lock(&rt->lock);
+
+	if (brightness == LED_OFF) {
+		/* Off */
+		gpiod_set_value(rt->enf, 0);
+		gpiod_set_value(rt->ent, 0);
+	} else if (brightness < RT8515_TORCH_MAX) {
+		/* Step it up to movie mode brightness using the flash pin */
+		rt8515_gpio_brightness_commit(rt->ent, brightness);
+	} else {
+		/* Max torch brightness requested */
+		gpiod_set_value(rt->ent, 1);
+	}
+
+	mutex_unlock(&rt->lock);
+
+	return 0;
+}
+
+static int rt8515_led_flash_strobe_set(struct led_classdev_flash *fled,
+				       bool state)
+{
+	struct rt8515 *rt = to_rt8515(fled);
+	struct led_flash_setting *timeout = &fled->timeout;
+	int brightness = 4; /* max 16 */
+
+	mutex_lock(&rt->lock);
+
+	if (state) {
+		/* Enable LED flash mode and set brightness */
+		rt8515_gpio_brightness_commit(rt->enf, brightness);
+		/* Set timeout */
+		mod_timer(&rt->powerdown_timer,
+			  jiffies + usecs_to_jiffies(timeout->val));
+	} else {
+		del_timer_sync(&rt->powerdown_timer);
+		/* Turn the LED off */
+		gpiod_set_value(rt->enf, 0);
+		gpiod_set_value(rt->ent, 0);
+	}
+
+	fled->led_cdev.brightness = LED_OFF;
+	/* After this the torch LED will be disabled */
+
+	mutex_unlock(&rt->lock);
+
+	return 0;
+}
+
+static int rt8515_led_flash_strobe_get(struct led_classdev_flash *fled,
+				       bool *state)
+{
+	struct rt8515 *rt = to_rt8515(fled);
+
+	*state = timer_pending(&rt->powerdown_timer);
+
+	return 0;
+}
+
+static int rt8515_led_flash_timeout_set(struct led_classdev_flash *fled,
+					u32 timeout)
+{
+	/* The timeout is stored in the led-class-flash core */
+	return 0;
+}
+
+static const struct led_flash_ops rt8515_flash_ops = {
+	.strobe_set = rt8515_led_flash_strobe_set,
+	.strobe_get = rt8515_led_flash_strobe_get,
+	.timeout_set = rt8515_led_flash_timeout_set,
+};
+
+static void rt8515_powerdown_timer(struct timer_list *t)
+{
+	struct rt8515 *rt = from_timer(rt, t, powerdown_timer);
+
+	/* Turn the LED off */
+	gpiod_set_value(rt->enf, 0);
+	gpiod_set_value(rt->ent, 0);
+}
+
+static void rt8515_init_flash_timeout(struct rt8515 *rt)
+{
+	struct led_classdev_flash *fled = &rt->fled;
+	struct led_flash_setting *s;
+
+	/* Init flash timeout setting */
+	s = &fled->timeout;
+	s->min = 1;
+	s->max = rt->max_timeout;
+	s->step = 1;
+	/*
+	 * Set default timeout to RT8515_DEFAULT_TIMEOUT except if
+	 * max_timeout from DT is lower.
+	 */
+	s->val = min(rt->max_timeout, RT8515_TIMEOUT_DEFAULT);
+}
+
+#if IS_ENABLED(CONFIG_V4L2_FLASH_LED_CLASS)
+/* Configure the V2L2 flash subdevice */
+static void rt8515_init_v4l2_flash_config(struct rt8515 *rt,
+					  struct v4l2_flash_config *v4l2_sd_cfg)
+{
+	struct led_classdev *led = &rt->fled.led_cdev;
+	struct led_flash_setting *s;
+
+	strscpy(v4l2_sd_cfg->dev_name, led->dev->kobj.name,
+		sizeof(v4l2_sd_cfg->dev_name));
+
+	/* Init flash intensity setting */
+	s = &v4l2_sd_cfg->intensity;
+	s->min = 0;
+	s->max = rt->fled.led_cdev.max_brightness;
+	s->step = 1;
+	s->val = s->max;
+}
+
+#else
+static void rt8515_init_v4l2_flash_config(struct rt8515 *rt,
+					  struct v4l2_flash_config *v4l2_sd_cfg)
+{
+}
+#endif
+
+static int rt8515_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct fwnode_handle *child;
+	struct rt8515 *rt;
+	struct led_classdev *led;
+	struct led_classdev_flash *fled;
+	struct led_init_data init_data = {};
+	struct v4l2_flash_config v4l2_sd_cfg = {};
+	int ret;
+
+	rt = devm_kzalloc(dev, sizeof(*rt), GFP_KERNEL);
+	if (!rt)
+		return -ENOMEM;
+
+	fled = &rt->fled;
+	led = &fled->led_cdev;
+
+	/* ENF - Enable Flash line */
+	rt->enf = devm_gpiod_get(dev, "enf", GPIOD_OUT_LOW);
+	if (IS_ERR(rt->enf)) {
+		dev_err(dev, "cannot get ENF (enable flash) GPIO\n");
+		return PTR_ERR(rt->enf);
+	}
+
+	/* ENT - Enable Torch line */
+	rt->ent = devm_gpiod_get(dev, "ent", GPIOD_OUT_LOW);
+	if (IS_ERR(rt->ent)) {
+		dev_err(dev, "cannot get ENT (enable torch) GPIO\n");
+		return PTR_ERR(rt->ent);
+	}
+
+	child = fwnode_get_next_available_child_node(dev->fwnode, NULL);
+	if (!child) {
+		dev_err(dev,
+			"No fwnode child node found for connected LED.\n");
+		return -EINVAL;
+	}
+	init_data.fwnode = child;
+
+	ret = fwnode_property_read_u32(child, "flash-max-timeout-us",
+				       &rt->max_timeout);
+	if (ret) {
+		rt->max_timeout = RT8515_MAX_TIMEOUT_DEFAULT;
+		dev_warn(dev,
+			 "flash-max-timeout-us property missing\n");
+	}
+	timer_setup(&rt->powerdown_timer, rt8515_powerdown_timer, 0);
+	rt8515_init_flash_timeout(rt);
+
+	fled->ops = &rt8515_flash_ops;
+
+	led->max_brightness = RT8515_TORCH_MAX;
+	led->brightness_set_blocking = rt8515_led_brightness_set;
+	led->flags |= LED_CORE_SUSPENDRESUME | LED_DEV_CAP_FLASH;
+
+	mutex_init(&rt->lock);
+
+	platform_set_drvdata(pdev, rt);
+
+	ret = devm_led_classdev_flash_register_ext(dev, fled, &init_data);
+	if (ret) {
+		dev_err(dev, "can't register LED %s\n", led->name);
+		mutex_destroy(&rt->lock);
+		return ret;
+	}
+
+	rt8515_init_v4l2_flash_config(rt, &v4l2_sd_cfg);
+
+	/* Create a V4L2 Flash device if V4L2 flash is enabled */
+	rt->v4l2_flash = v4l2_flash_init(dev, child, fled, NULL, &v4l2_sd_cfg);
+	if (IS_ERR(rt->v4l2_flash)) {
+		ret = PTR_ERR(rt->v4l2_flash);
+		dev_err(dev, "failed to register V4L2 flash device (%d)\n",
+			ret);
+		/*
+		 * Continue without the V4L2 flash
+		 * (we still have the classdev)
+		 */
+	}
+
+	return 0;
+}
+
+static int rt8515_remove(struct platform_device *pdev)
+{
+	struct rt8515 *rt = platform_get_drvdata(pdev);
+
+	v4l2_flash_release(rt->v4l2_flash);
+	del_timer_sync(&rt->powerdown_timer);
+	mutex_destroy(&rt->lock);
+
+	return 0;
+}
+
+static const struct of_device_id rt8515_match[] = {
+	{ .compatible = "richtek,rt8515", },
+	{ /* sentinel */ },
+};
+MODULE_DEVICE_TABLE(of, rt8515_match);
+
+static struct platform_driver rt8515_driver = {
+	.driver = {
+		.name  = "rt8515",
+		.of_match_table = rt8515_match,
+	},
+	.probe  = rt8515_probe,
+	.remove = rt8515_remove,
+};
+module_platform_driver(rt8515_driver);
+
+MODULE_AUTHOR("Linus Walleij <linus.walleij@linaro.org>");
+MODULE_DESCRIPTION("Richtek RT8515 LED driver");
+MODULE_LICENSE("GPL v2");
-- 
2.26.2

