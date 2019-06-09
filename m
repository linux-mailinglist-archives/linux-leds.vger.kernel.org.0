Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 389F13AB93
	for <lists+linux-leds@lfdr.de>; Sun,  9 Jun 2019 21:11:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729448AbfFITIa (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 9 Jun 2019 15:08:30 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:40562 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729120AbfFITIa (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 9 Jun 2019 15:08:30 -0400
Received: by mail-wm1-f66.google.com with SMTP id v19so6173839wmj.5;
        Sun, 09 Jun 2019 12:08:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=KJlKrkdCO/37uzmiPXnsvjiCXznoAHT4Vv9Nxk2wiT8=;
        b=A0k2dsZ20dackdMYXSD+HotfvtuAXLfUm6xhlgMNyKncGKTr8/19FsySPljs0Q/QkD
         NowNnYqZ8J2TFwXe712ytlPmbRkoesRRLnXD67FC75V41Jc8Zkbj5h8J5FNw+jvXPN5e
         dn8Z/ZFKKLmkMhWdaC33AG1YC2lsm0Zs2drY5bmSvLW7GYCW9XW7WqWDgOj4iHbo7lP+
         CbDYw+NCKqlNKAsaOJ7hDErvBtIXWIlpOXm8SujmmBK+J9Ox45xBS0kEvyBJGaXcftCk
         mZIt5/XVtKwbQoancLuNvLHBHwZSGlG/w32Iry7XTSIYQ4kOBvnv6E42Klh6XUjHkXi0
         jo8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=KJlKrkdCO/37uzmiPXnsvjiCXznoAHT4Vv9Nxk2wiT8=;
        b=ZXA7/hu5ajExxE7UBB6jxeUOuoYM7OujXqPzKI9umfF+85QcEi7oLrl/F0UhId4/0a
         XM8Ldd855IjdbhHATG3/LfJyye9spTDFnJ3iV+t+afv56ZGQGKqzOjskNz88mCppcO8K
         0QxiWum9i2eWgFLkL4u9HI1qnPxnvn/IjLy56BzFO93Z5/6TG0HTpzMfqJ87y/t0p1Ib
         kwg9ye53Se7R+wMCkRMSJjI2mdKFG70k4nJtlLc7FkN//A0Wx06bRLbKqiEl3M1mVCb3
         vAfNOivorZEerQOLr80HbibZWivPHTvgZqxW7RWiX7OhDfYInBj5Lqc3Z0ROBPMYrivz
         dxwg==
X-Gm-Message-State: APjAAAWsVcZrrxZJignQcrVNQw4gX+S8GAsD6T1UID3QQW76NOWunsKS
        qnd3l3j8S27vhztwpvpOJUD7qEse
X-Google-Smtp-Source: APXvYqz8YlgoyJ5n5OkA71SywCqBj7Bvqrr1zZ49Jne1TTgrzFfau/eoLPLfGvjP393OtIJ7blLapQ==
X-Received: by 2002:a1c:208c:: with SMTP id g134mr10974219wmg.112.1560107306560;
        Sun, 09 Jun 2019 12:08:26 -0700 (PDT)
Received: from myhost.home (ckm12.neoplus.adsl.tpnet.pl. [83.31.88.12])
        by smtp.gmail.com with ESMTPSA id y38sm14725041wrd.41.2019.06.09.12.08.23
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 09 Jun 2019 12:08:26 -0700 (PDT)
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
To:     linux-leds@vger.kernel.org
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        pavel@ucw.cz, robh@kernel.org, dtor@google.com, linux@roeck-us.net,
        dmurphy@ti.com, jacek.anaszewski@gmail.com,
        Baolin Wang <baolin.wang@linaro.org>,
        Daniel Mack <daniel@zonque.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Oleh Kravchenko <oleg@kaa.org.ua>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Simon Shields <simon@lineageos.org>
Subject: [PATCH v5 01/26] leds: class: Improve LED and LED flash class registration API
Date:   Sun,  9 Jun 2019 21:07:38 +0200
Message-Id: <20190609190803.14815-2-jacek.anaszewski@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190609190803.14815-1-jacek.anaszewski@gmail.com>
References: <20190609190803.14815-1-jacek.anaszewski@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Replace of_led_classdev_register() with led_classdev_register_ext(), which
accepts easily extendable struct led_init_data, instead of the fixed
struct device_node argument. The latter can be now passed in an fwnode
property of the struct led_init_data.

The modification is driven by the need for passing additional arguments
required for the forthcoming generic mechanism for composing LED names.
Currently the LED name is conveyed in the "name" char pointer property of
the struct led_classdev. This is redundant since LED class device name
is accessible throughout the whole LED class device life time via
associated struct device's kobj->name property.

The change will not break any existing clients since the patch alters
also existing led_classdev{_flash}_register() macro wrappers, that pass
NULL in place of init_data, which leads to using legacy name
initialization path basing on the struct led_classdev's "name" property.

Three existing users of devm_of_led_classdev_registers() are modified
to use devm_led_classdev_register(), which will not impact their
operation since they in fact didn't need to pass struct device_node on
registration from the beginning.

Signed-off-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Baolin Wang <baolin.wang@linaro.org>
Cc: Pavel Machek <pavel@ucw.cz>
Cc: Dan Murphy <dmurphy@ti.com>
Cc: Daniel Mack <daniel@zonque.org>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Oleh Kravchenko <oleg@kaa.org.ua>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Simon Shields <simon@lineageos.org>
---
 drivers/leds/led-class-flash.c  |  9 +++++----
 drivers/leds/led-class.c        | 29 +++++++++++++++++------------
 drivers/leds/leds-cr0014114.c   |  3 +--
 drivers/leds/leds-gpio.c        |  2 +-
 drivers/leds/leds-pwm.c         |  2 +-
 include/linux/led-class-flash.h | 15 ++++++++++-----
 include/linux/leds.h            | 34 ++++++++++++++++++++++++----------
 7 files changed, 59 insertions(+), 35 deletions(-)

diff --git a/drivers/leds/led-class-flash.c b/drivers/leds/led-class-flash.c
index cf398275a53c..8d1c1177bb9a 100644
--- a/drivers/leds/led-class-flash.c
+++ b/drivers/leds/led-class-flash.c
@@ -285,8 +285,9 @@ static void led_flash_init_sysfs_groups(struct led_classdev_flash *fled_cdev)
 	led_cdev->groups = flash_groups;
 }
 
-int led_classdev_flash_register(struct device *parent,
-				struct led_classdev_flash *fled_cdev)
+int led_classdev_flash_register_ext(struct device *parent,
+				    struct led_classdev_flash *fled_cdev,
+				    struct led_init_data *init_data)
 {
 	struct led_classdev *led_cdev;
 	const struct led_flash_ops *ops;
@@ -312,13 +313,13 @@ int led_classdev_flash_register(struct device *parent,
 	}
 
 	/* Register led class device */
-	ret = led_classdev_register(parent, led_cdev);
+	ret = led_classdev_register_ext(parent, led_cdev, init_data);
 	if (ret < 0)
 		return ret;
 
 	return 0;
 }
-EXPORT_SYMBOL_GPL(led_classdev_flash_register);
+EXPORT_SYMBOL_GPL(led_classdev_flash_register_ext);
 
 void led_classdev_flash_unregister(struct led_classdev_flash *fled_cdev)
 {
diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
index 85848c5da705..a564948e5f53 100644
--- a/drivers/leds/led-class.c
+++ b/drivers/leds/led-class.c
@@ -17,6 +17,7 @@
 #include <linux/leds.h>
 #include <linux/list.h>
 #include <linux/module.h>
+#include <linux/of.h>
 #include <linux/slab.h>
 #include <linux/spinlock.h>
 #include <linux/timer.h>
@@ -245,14 +246,16 @@ static int led_classdev_next_name(const char *init_name, char *name,
 }
 
 /**
- * of_led_classdev_register - register a new object of led_classdev class.
+ * led_classdev_register_ext - register a new object of led_classdev class
+ *			       with init data.
  *
  * @parent: parent of LED device
  * @led_cdev: the led_classdev structure for this device.
- * @np: DT node describing this LED
+ * @init_data: LED class device initialization data
  */
-int of_led_classdev_register(struct device *parent, struct device_node *np,
-			    struct led_classdev *led_cdev)
+int led_classdev_register_ext(struct device *parent,
+			      struct led_classdev *led_cdev,
+			      struct led_init_data *init_data)
 {
 	char name[LED_MAX_NAME_SIZE];
 	int ret;
@@ -269,7 +272,8 @@ int of_led_classdev_register(struct device *parent, struct device_node *np,
 		mutex_unlock(&led_cdev->led_access);
 		return PTR_ERR(led_cdev->dev);
 	}
-	led_cdev->dev->of_node = np;
+	if (init_data && init_data->fwnode)
+		led_cdev->dev->of_node = to_of_node(init_data->fwnode);
 
 	if (ret)
 		dev_warn(parent, "Led %s renamed to %s due to name collision",
@@ -314,7 +318,7 @@ int of_led_classdev_register(struct device *parent, struct device_node *np,
 
 	return 0;
 }
-EXPORT_SYMBOL_GPL(of_led_classdev_register);
+EXPORT_SYMBOL_GPL(led_classdev_register_ext);
 
 /**
  * led_classdev_unregister - unregisters a object of led_properties class.
@@ -359,14 +363,15 @@ static void devm_led_classdev_release(struct device *dev, void *res)
 }
 
 /**
- * devm_of_led_classdev_register - resource managed led_classdev_register()
+ * devm_led_classdev_register_ext - resource managed led_classdev_register_ext()
  *
  * @parent: parent of LED device
  * @led_cdev: the led_classdev structure for this device.
+ * @init_data: LED class device initialization data
  */
-int devm_of_led_classdev_register(struct device *parent,
-				  struct device_node *np,
-				  struct led_classdev *led_cdev)
+int devm_led_classdev_register_ext(struct device *parent,
+				   struct led_classdev *led_cdev,
+				   struct led_init_data *init_data)
 {
 	struct led_classdev **dr;
 	int rc;
@@ -375,7 +380,7 @@ int devm_of_led_classdev_register(struct device *parent,
 	if (!dr)
 		return -ENOMEM;
 
-	rc = of_led_classdev_register(parent, np, led_cdev);
+	rc = led_classdev_register_ext(parent, led_cdev, init_data);
 	if (rc) {
 		devres_free(dr);
 		return rc;
@@ -386,7 +391,7 @@ int devm_of_led_classdev_register(struct device *parent,
 
 	return 0;
 }
-EXPORT_SYMBOL_GPL(devm_of_led_classdev_register);
+EXPORT_SYMBOL_GPL(devm_led_classdev_register_ext);
 
 static int devm_led_classdev_match(struct device *dev, void *res, void *data)
 {
diff --git a/drivers/leds/leds-cr0014114.c b/drivers/leds/leds-cr0014114.c
index 0e4262462cb9..1c82152764d2 100644
--- a/drivers/leds/leds-cr0014114.c
+++ b/drivers/leds/leds-cr0014114.c
@@ -207,8 +207,7 @@ static int cr0014114_probe_dt(struct cr0014114 *priv)
 		led->ldev.max_brightness	  = CR_MAX_BRIGHTNESS;
 		led->ldev.brightness_set_blocking = cr0014114_set_sync;
 
-		ret = devm_of_led_classdev_register(priv->dev, np,
-						    &led->ldev);
+		ret = devm_led_classdev_register(priv->dev, &led->ldev);
 		if (ret) {
 			dev_err(priv->dev,
 				"failed to register LED device %s, err %d",
diff --git a/drivers/leds/leds-gpio.c b/drivers/leds/leds-gpio.c
index 998f2ff6914d..b26cf78993d1 100644
--- a/drivers/leds/leds-gpio.c
+++ b/drivers/leds/leds-gpio.c
@@ -112,7 +112,7 @@ static int create_gpio_led(const struct gpio_led *template,
 	if (ret < 0)
 		return ret;
 
-	return devm_of_led_classdev_register(parent, np, &led_dat->cdev);
+	return devm_led_classdev_register(parent, &led_dat->cdev);
 }
 
 struct gpio_leds_priv {
diff --git a/drivers/leds/leds-pwm.c b/drivers/leds/leds-pwm.c
index af08bcdc4fd8..fcb3e87a9887 100644
--- a/drivers/leds/leds-pwm.c
+++ b/drivers/leds/leds-pwm.c
@@ -114,7 +114,7 @@ static int led_pwm_add(struct device *dev, struct led_pwm_priv *priv,
 	if (!led_data->period && (led->pwm_period_ns > 0))
 		led_data->period = led->pwm_period_ns;
 
-	ret = devm_of_led_classdev_register(dev, child, &led_data->cdev);
+	ret = devm_led_classdev_register(dev, &led_data->cdev);
 	if (ret == 0) {
 		priv->num_leds++;
 		led_pwm_set(&led_data->cdev, led_data->cdev.brightness);
diff --git a/include/linux/led-class-flash.h b/include/linux/led-class-flash.h
index 700efaa9e115..ded8d9fa6149 100644
--- a/include/linux/led-class-flash.h
+++ b/include/linux/led-class-flash.h
@@ -90,15 +90,20 @@ static inline struct led_classdev_flash *lcdev_to_flcdev(
 }
 
 /**
- * led_classdev_flash_register - register a new object of led_classdev class
- *				 with support for flash LEDs
- * @parent: the flash LED to register
+ * led_classdev_flash_register_ext - register a new object of LED class with
+ *				     init data and with support for flash LEDs
+ * @parent: LED flash controller device this flash LED is driven by
  * @fled_cdev: the led_classdev_flash structure for this device
+ * @init_data: the LED class flash device initialization data
  *
  * Returns: 0 on success or negative error value on failure
  */
-extern int led_classdev_flash_register(struct device *parent,
-				struct led_classdev_flash *fled_cdev);
+extern int led_classdev_flash_register_ext(struct device *parent,
+					struct led_classdev_flash *fled_cdev,
+					struct led_init_data *init_data);
+
+#define led_classdev_flash_register(parent, fled_cdev)		\
+	led_classdev_flash_register_ext(parent, fled_cdev, NULL)
 
 /**
  * led_classdev_flash_unregister - unregisters an object of led_classdev class
diff --git a/include/linux/leds.h b/include/linux/leds.h
index 78204650fe2a..fab83a2d7bff 100644
--- a/include/linux/leds.h
+++ b/include/linux/leds.h
@@ -34,6 +34,11 @@ enum led_brightness {
 	LED_FULL	= 255,
 };
 
+struct led_init_data {
+	/* device fwnode handle */
+	struct fwnode_handle *fwnode;
+};
+
 struct led_classdev {
 	const char		*name;
 	enum led_brightness	 brightness;
@@ -129,16 +134,25 @@ struct led_classdev {
 	struct mutex		led_access;
 };
 
-extern int of_led_classdev_register(struct device *parent,
-				    struct device_node *np,
-				    struct led_classdev *led_cdev);
-#define led_classdev_register(parent, led_cdev)				\
-	of_led_classdev_register(parent, NULL, led_cdev)
-extern int devm_of_led_classdev_register(struct device *parent,
-					 struct device_node *np,
-					 struct led_classdev *led_cdev);
-#define devm_led_classdev_register(parent, led_cdev)			\
-	devm_of_led_classdev_register(parent, NULL, led_cdev)
+/**
+ * led_classdev_register_ext - register a new object of LED class with
+ *			       init data
+ * @parent: LED controller device this LED is driven by
+ * @led_cdev: the led_classdev structure for this device
+ * @init_data: the LED class device initialization data
+ *
+ * Returns: 0 on success or negative error value on failure
+ */
+extern int led_classdev_register_ext(struct device *parent,
+				     struct led_classdev *led_cdev,
+				     struct led_init_data *init_data);
+#define led_classdev_register(parent, led_cdev)			\
+	led_classdev_register_ext(parent, led_cdev, NULL)
+extern int devm_led_classdev_register_ext(struct device *parent,
+					  struct led_classdev *led_cdev,
+					  struct led_init_data *init_data);
+#define devm_led_classdev_register(parent, led_cdev)		\
+	devm_led_classdev_register_ext(parent, led_cdev, NULL)
 extern void led_classdev_unregister(struct led_classdev *led_cdev);
 extern void devm_led_classdev_unregister(struct device *parent,
 					 struct led_classdev *led_cdev);
-- 
2.11.0

