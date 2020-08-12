Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D63C242730
	for <lists+linux-leds@lfdr.de>; Wed, 12 Aug 2020 11:07:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726517AbgHLJH0 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 12 Aug 2020 05:07:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727048AbgHLJHY (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 12 Aug 2020 05:07:24 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A108C06174A
        for <linux-leds@vger.kernel.org>; Wed, 12 Aug 2020 02:07:23 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id m15so760378lfp.7
        for <linux-leds@vger.kernel.org>; Wed, 12 Aug 2020 02:07:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=o2EP5lEDfp0OFxwdrNPfzku9f4PWEtGywlyHDdxwNr0=;
        b=m5LErjw1bKr32y4Zm9HJYz6CEvmuWjn0IBb8STrPN+TehWELH3Zil+IMj8Qd0d+wki
         bCfOSPyotU0ghYdNgMEHBXeeEkDVbUAb3Oflewh7rxTckEe3WnRHLCe2YkN6GnngCz+w
         b+6pmgr221u8oA8UIn6FFdVyBF6N4/dpzklKFyghQx7xjMTyGPi2XxjebH26v6Z1ibCw
         3MgmqN7ZhCHRo3zP8HMqvRd14d9VeKykzEtQnYFqXvMojs9VEwl7M9YDhY4t0sEv9kAZ
         qQjZaEjtijAeInBTC+dI1KB3CPTPu1MhJ5v2WJTP+lxwXoOhM1em/dm+ubIj10ICCRtO
         MHBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=o2EP5lEDfp0OFxwdrNPfzku9f4PWEtGywlyHDdxwNr0=;
        b=GSmpFKMrXTqQgut04fjNOwsILsisLCJXghHxMTS7QVy95XJiTNMpnnO1ufOIADhMcO
         2erCRIHydY0FGYl+BWeBYYtceDQV3yxNoCIhvc+DpYoHyIvIN+NVLDjY6AhJlp+DZEe7
         etTBiwdhIzHPm9JHOfj19GcehzWq3NUm09UhzzJqOyLMMq0kKa961xQguGhoq7V2fpP9
         p0EFqivVWYbL1WqsCslepJPShbRmAsWwT/k1qUWnvsX46VMC2IP5FFkubIvm93vG5ORX
         o0fFsYkTSBCRfXK3EoGJ7fYOD5qpLDSP+iBIVjHBsnV83p4lEBzmSIFmWG2jPZ76U+4c
         SQIg==
X-Gm-Message-State: AOAM532wEeAHGjK2yDXLTu/idcq7+Rx4ET1UQKJ+AjVTYa1U8VBJLvhK
        Y9PjMgTiv2pP+msH30DiEYnz9g==
X-Google-Smtp-Source: ABdhPJwsJHRQ9i1bIp7bEDFon2kXi+Pm4CoZlrwMkluQkFwTFXyPJhCaucdP5fqPSR4G5ud0beiBmw==
X-Received: by 2002:a19:24c2:: with SMTP id k185mr5214587lfk.120.1597223241936;
        Wed, 12 Aug 2020 02:07:21 -0700 (PDT)
Received: from localhost.bredbandsbolaget (c-92d7225c.014-348-6c756e10.bbcust.telenor.se. [92.34.215.146])
        by smtp.gmail.com with ESMTPSA id s4sm305346lja.124.2020.08.12.02.07.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2020 02:07:21 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>
Cc:     linux-leds@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        newbytee@protonmail.com, Stephan Gerhold <stephan@gerhold.net>
Subject: [PATCH 2/2] leds: rt8515: Add Richtek RT8515 LED driver
Date:   Wed, 12 Aug 2020 11:07:11 +0200
Message-Id: <20200812090711.2644688-2-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200812090711.2644688-1-linus.walleij@linaro.org>
References: <20200812090711.2644688-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

This adds a driver for the Richtek RT8515 dual channel
torch/flash white LED driver.

This LED driver is found in some mobile phones from
Samsung such as the GT-S7710 and GT-I8190.

Cc: newbytee@protonmail.com
Cc: Stephan Gerhold <stephan@gerhold.net>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/leds/Kconfig       |  11 ++
 drivers/leds/Makefile      |   1 +
 drivers/leds/leds-rt8515.c | 299 +++++++++++++++++++++++++++++++++++++
 3 files changed, 311 insertions(+)
 create mode 100644 drivers/leds/leds-rt8515.c

diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index 1c181df24eae..e2c03e4e54f5 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -901,6 +901,17 @@ config LEDS_IP30
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
index c2c7d7ade0d0..debbf505034a 100644
--- a/drivers/leds/Makefile
+++ b/drivers/leds/Makefile
@@ -78,6 +78,7 @@ obj-$(CONFIG_LEDS_PM8058)		+= leds-pm8058.o
 obj-$(CONFIG_LEDS_POWERNV)		+= leds-powernv.o
 obj-$(CONFIG_LEDS_PWM)			+= leds-pwm.o
 obj-$(CONFIG_LEDS_REGULATOR)		+= leds-regulator.o
+obj-$(CONFIG_LEDS_RT8515)		+= leds-rt8515.o
 obj-$(CONFIG_LEDS_S3C24XX)		+= leds-s3c24xx.o
 obj-$(CONFIG_LEDS_SC27XX_BLTC)		+= leds-sc27xx-bltc.o
 obj-$(CONFIG_LEDS_SGM3140)		+= leds-sgm3140.o
diff --git a/drivers/leds/leds-rt8515.c b/drivers/leds/leds-rt8515.c
new file mode 100644
index 000000000000..ff104ad37129
--- /dev/null
+++ b/drivers/leds/leds-rt8515.c
@@ -0,0 +1,299 @@
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
+/* This is setting the torch light level */
+static int rt8515_led_brightness_set(struct led_classdev *led,
+				     enum led_brightness brightness)
+{
+	struct led_classdev_flash *fled = lcdev_to_flcdev(led);
+	struct rt8515 *rt = to_rt8515(fled);
+	int i;
+
+	mutex_lock(&rt->lock);
+
+	if (brightness == LED_OFF) {
+		/* Off */
+		gpiod_set_value(rt->enf, 0);
+		gpiod_set_value(rt->ent, 0);
+	} else if (brightness < RT8515_TORCH_MAX) {
+		/* Step it up to movie mode brightness using the flash pin */
+		for (i = 0; i < brightness; i++) {
+			gpiod_set_value(rt->ent, 0);
+			udelay(1);
+			gpiod_set_value(rt->ent, 1);
+			udelay(1);
+		}
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
+	int i;
+
+	mutex_lock(&rt->lock);
+
+	if (state) {
+		/* Enable LED flash mode */
+		for (i = 0; i < brightness; i++) {
+			gpiod_set_value(rt->enf, 0);
+			udelay(1);
+			gpiod_set_value(rt->enf, 1);
+			udelay(1);
+		}
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
+	led->name = "torch";
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

