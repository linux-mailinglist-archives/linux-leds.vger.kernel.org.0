Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CF10B98042
	for <lists+linux-leds@lfdr.de>; Wed, 21 Aug 2019 18:36:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728806AbfHUQgW (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 21 Aug 2019 12:36:22 -0400
Received: from mga17.intel.com ([192.55.52.151]:55687 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727222AbfHUQgW (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Wed, 21 Aug 2019 12:36:22 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 21 Aug 2019 09:36:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,412,1559545200"; 
   d="scan'208";a="186277742"
Received: from black.fi.intel.com ([10.237.72.28])
  by FMSMGA003.fm.intel.com with ESMTP; 21 Aug 2019 09:36:18 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 0950373; Wed, 21 Aug 2019 19:36:17 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        linux-leds@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 2/2] leds: Switch to use fwnode instead of be stuck with OF one
Date:   Wed, 21 Aug 2019 19:36:17 +0300
Message-Id: <20190821163617.33881-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.23.0.rc1
In-Reply-To: <20190821163617.33881-1-andriy.shevchenko@linux.intel.com>
References: <20190821163617.33881-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

There is no need to be stuck with OF node when we may use agnostic
firmware node instead.

It allows users to get property if needed independently of provider.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/leds/led-class.c      | 26 ++++++++++++++------------
 drivers/leds/leds-cr0014114.c |  8 ++------
 drivers/leds/leds-gpio.c      | 11 +++++------
 drivers/leds/leds-max77650.c  |  2 +-
 drivers/leds/leds-pwm.c       |  3 +--
 include/linux/leds.h          | 16 ++++++++--------
 6 files changed, 31 insertions(+), 35 deletions(-)

diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
index 4793e77808e2..80974de814f3 100644
--- a/drivers/leds/led-class.c
+++ b/drivers/leds/led-class.c
@@ -242,14 +242,15 @@ static int led_classdev_next_name(const char *init_name, char *name,
 }
 
 /**
- * of_led_classdev_register - register a new object of led_classdev class.
+ * fwnode_led_classdev_register - register a new object of led_classdev class.
  *
  * @parent: parent of LED device
+ * @fwnode: firmware node describing this LED
  * @led_cdev: the led_classdev structure for this device.
- * @np: DT node describing this LED
  */
-int of_led_classdev_register(struct device *parent, struct device_node *np,
-			    struct led_classdev *led_cdev)
+int fwnode_led_classdev_register(struct device *parent,
+				 struct fwnode_handle *fwnode,
+				 struct led_classdev *led_cdev)
 {
 	char name[LED_MAX_NAME_SIZE];
 	int ret;
@@ -266,7 +267,7 @@ int of_led_classdev_register(struct device *parent, struct device_node *np,
 		mutex_unlock(&led_cdev->led_access);
 		return PTR_ERR(led_cdev->dev);
 	}
-	led_cdev->dev->of_node = np;
+	led_cdev->dev->fwnode = fwnode;
 
 	if (ret)
 		dev_warn(parent, "Led %s renamed to %s due to name collision",
@@ -311,7 +312,7 @@ int of_led_classdev_register(struct device *parent, struct device_node *np,
 
 	return 0;
 }
-EXPORT_SYMBOL_GPL(of_led_classdev_register);
+EXPORT_SYMBOL_GPL(fwnode_led_classdev_register);
 
 /**
  * led_classdev_unregister - unregisters a object of led_properties class.
@@ -356,14 +357,15 @@ static void devm_led_classdev_release(struct device *dev, void *res)
 }
 
 /**
- * devm_of_led_classdev_register - resource managed led_classdev_register()
+ * devm_fwnode_led_classdev_register - resource managed led_classdev_register()
  *
  * @parent: parent of LED device
+ * @fwnode: firmware node describing this LED
  * @led_cdev: the led_classdev structure for this device.
  */
-int devm_of_led_classdev_register(struct device *parent,
-				  struct device_node *np,
-				  struct led_classdev *led_cdev)
+int devm_fwnode_led_classdev_register(struct device *parent,
+				      struct fwnode_handle *fwnode,
+				      struct led_classdev *led_cdev)
 {
 	struct led_classdev **dr;
 	int rc;
@@ -372,7 +374,7 @@ int devm_of_led_classdev_register(struct device *parent,
 	if (!dr)
 		return -ENOMEM;
 
-	rc = of_led_classdev_register(parent, np, led_cdev);
+	rc = fwnode_led_classdev_register(parent, fwnode, led_cdev);
 	if (rc) {
 		devres_free(dr);
 		return rc;
@@ -383,7 +385,7 @@ int devm_of_led_classdev_register(struct device *parent,
 
 	return 0;
 }
-EXPORT_SYMBOL_GPL(devm_of_led_classdev_register);
+EXPORT_SYMBOL_GPL(devm_fwnode_led_classdev_register);
 
 static int devm_led_classdev_match(struct device *dev, void *res, void *data)
 {
diff --git a/drivers/leds/leds-cr0014114.c b/drivers/leds/leds-cr0014114.c
index 0e4262462cb9..cb91dab7a1e1 100644
--- a/drivers/leds/leds-cr0014114.c
+++ b/drivers/leds/leds-cr0014114.c
@@ -183,12 +183,10 @@ static int cr0014114_probe_dt(struct cr0014114 *priv)
 	size_t			i = 0;
 	struct cr0014114_led	*led;
 	struct fwnode_handle	*child;
-	struct device_node	*np;
 	int			ret;
 	const char		*str;
 
 	device_for_each_child_node(priv->dev, child) {
-		np = to_of_node(child);
 		led = &priv->leds[i];
 
 		ret = fwnode_property_read_string(child, "label", &str);
@@ -207,8 +205,8 @@ static int cr0014114_probe_dt(struct cr0014114 *priv)
 		led->ldev.max_brightness	  = CR_MAX_BRIGHTNESS;
 		led->ldev.brightness_set_blocking = cr0014114_set_sync;
 
-		ret = devm_of_led_classdev_register(priv->dev, np,
-						    &led->ldev);
+		ret = devm_fwnode_led_classdev_register(priv->dev, child,
+							&led->ldev);
 		if (ret) {
 			dev_err(priv->dev,
 				"failed to register LED device %s, err %d",
@@ -217,8 +215,6 @@ static int cr0014114_probe_dt(struct cr0014114 *priv)
 			return ret;
 		}
 
-		led->ldev.dev->of_node = np;
-
 		i++;
 	}
 
diff --git a/drivers/leds/leds-gpio.c b/drivers/leds/leds-gpio.c
index bdc98ddca1dc..9035e1c4c534 100644
--- a/drivers/leds/leds-gpio.c
+++ b/drivers/leds/leds-gpio.c
@@ -73,7 +73,7 @@ static int gpio_blink_set(struct led_classdev *led_cdev,
 
 static int create_gpio_led(const struct gpio_led *template,
 	struct gpio_led_data *led_dat, struct device *parent,
-	struct device_node *np, gpio_blink_set_t blink_set)
+	struct fwnode_handle *child, gpio_blink_set_t blink_set)
 {
 	int ret, state;
 
@@ -108,7 +108,7 @@ static int create_gpio_led(const struct gpio_led *template,
 	if (ret < 0)
 		return ret;
 
-	return devm_of_led_classdev_register(parent, np, &led_dat->cdev);
+	return devm_fwnode_led_classdev_register(parent, child, &led_dat->cdev);
 }
 
 struct gpio_leds_priv {
@@ -141,11 +141,10 @@ static struct gpio_leds_priv *gpio_leds_create(struct platform_device *pdev)
 		struct gpio_led_data *led_dat = &priv->leds[priv->num_leds];
 		struct gpio_led led = {};
 		const char *state = NULL;
-		struct device_node *np = to_of_node(child);
 
 		ret = fwnode_property_read_string(child, "label", &led.name);
-		if (ret && IS_ENABLED(CONFIG_OF) && np)
-			led.name = np->name;
+		if (ret && is_of_node(child))
+			led.name = to_of_node(child)->name;
 		if (!led.name) {
 			fwnode_handle_put(child);
 			return ERR_PTR(-EINVAL);
@@ -181,7 +180,7 @@ static struct gpio_leds_priv *gpio_leds_create(struct platform_device *pdev)
 		if (fwnode_property_present(child, "panic-indicator"))
 			led.panic_indicator = 1;
 
-		ret = create_gpio_led(&led, led_dat, dev, np, NULL);
+		ret = create_gpio_led(&led, led_dat, dev, child, NULL);
 		if (ret < 0) {
 			fwnode_handle_put(child);
 			return ERR_PTR(ret);
diff --git a/drivers/leds/leds-max77650.c b/drivers/leds/leds-max77650.c
index ae752ec150d9..d6fdbb47fce0 100644
--- a/drivers/leds/leds-max77650.c
+++ b/drivers/leds/leds-max77650.c
@@ -110,7 +110,7 @@ static int max77650_led_probe(struct platform_device *pdev)
 		fwnode_property_read_string(child, "linux,default-trigger",
 					    &led->cdev.default_trigger);
 
-		rv = devm_of_led_classdev_register(dev, to_of_node(child), &led->cdev);
+		rv = devm_fwnode_led_classdev_register(dev, child, &led->cdev);
 		if (rv)
 			return rv;
 
diff --git a/drivers/leds/leds-pwm.c b/drivers/leds/leds-pwm.c
index 48d068f80f11..a582c3e768e6 100644
--- a/drivers/leds/leds-pwm.c
+++ b/drivers/leds/leds-pwm.c
@@ -111,8 +111,7 @@ static int led_pwm_add(struct device *dev, struct led_pwm_priv *priv,
 	if (!led_data->period && (led->pwm_period_ns > 0))
 		led_data->period = led->pwm_period_ns;
 
-	ret = devm_of_led_classdev_register(dev, to_of_node(fwnode),
-					    &led_data->cdev);
+	ret = devm_fwnode_led_classdev_register(dev, fwnode, &led_data->cdev);
 	if (ret == 0) {
 		priv->num_leds++;
 		led_pwm_set(&led_data->cdev, led_data->cdev.brightness);
diff --git a/include/linux/leds.h b/include/linux/leds.h
index 9b2bf574a17a..c94375ef8af6 100644
--- a/include/linux/leds.h
+++ b/include/linux/leds.h
@@ -125,16 +125,16 @@ struct led_classdev {
 	struct mutex		led_access;
 };
 
-extern int of_led_classdev_register(struct device *parent,
-				    struct device_node *np,
-				    struct led_classdev *led_cdev);
+extern int fwnode_led_classdev_register(struct device *parent,
+					struct fwnode_handle *fwnode,
+					struct led_classdev *led_cdev);
 #define led_classdev_register(parent, led_cdev)				\
-	of_led_classdev_register(parent, NULL, led_cdev)
-extern int devm_of_led_classdev_register(struct device *parent,
-					 struct device_node *np,
-					 struct led_classdev *led_cdev);
+	fwnode_led_classdev_register(parent, NULL, led_cdev)
+extern int devm_fwnode_led_classdev_register(struct device *parent,
+					     struct fwnode_handle *fwnode,
+					     struct led_classdev *led_cdev);
 #define devm_led_classdev_register(parent, led_cdev)			\
-	devm_of_led_classdev_register(parent, NULL, led_cdev)
+	devm_fwnode_led_classdev_register(parent, NULL, led_cdev)
 extern void led_classdev_unregister(struct led_classdev *led_cdev);
 extern void devm_led_classdev_unregister(struct device *parent,
 					 struct led_classdev *led_cdev);
-- 
2.23.0.rc1

