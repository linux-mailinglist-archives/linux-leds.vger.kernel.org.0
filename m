Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55CDA2710FD
	for <lists+linux-leds@lfdr.de>; Sun, 20 Sep 2020 00:15:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726707AbgISWPz (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 19 Sep 2020 18:15:55 -0400
Received: from mail.nic.cz ([217.31.204.67]:50108 "EHLO mail.nic.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726598AbgISWPz (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Sat, 19 Sep 2020 18:15:55 -0400
Received: from dellmb.labs.office.nic.cz (unknown [IPv6:2001:1488:fffe:6:cac7:3539:7f1f:463])
        by mail.nic.cz (Postfix) with ESMTP id D66E8140A8A;
        Sun, 20 Sep 2020 00:15:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
        t=1600553751; bh=p1J4GCBWLOMg/lbUnYKnK8LI8tcukk/W7PkUQakYTl4=;
        h=From:To:Date;
        b=dzuH5R96pm3hInhDAGVjgnw4Im7ohvUxx7gQprM/uagwLyJogzTjx0P/gFDvrexar
         0Rdk5IWxqmPW422eUjyq/Yt3VC+No94oTaUOUs0ABxKFCw1xDuAJUXnBqqlILs+oM+
         BU4eXgK8JdIy/sm1Ri27AoW8wKzagkMytI3ckTpo=
From:   =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>
To:     linux-leds@vger.kernel.org
Cc:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>,
        NeilBrown <neilb@suse.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        "H . Nikolaus Schaller" <hns@goldelico.com>
Subject: [PATCH leds + devicetree 07/13] leds: tca6507: register LEDs and GPIOs immediately after parsing
Date:   Sun, 20 Sep 2020 00:15:42 +0200
Message-Id: <20200919221548.29984-8-marek.behun@nic.cz>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200919221548.29984-1-marek.behun@nic.cz>
References: <20200919221548.29984-1-marek.behun@nic.cz>
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

Register LEDs immediately after parsing the properties.
Register GPIOs afterwards, at the moment we know all their IDs.

This allows us to be rid of platdata structure.

Signed-off-by: Marek Behún <marek.behun@nic.cz>
Cc: NeilBrown <neilb@suse.de>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: H. Nikolaus Schaller <hns@goldelico.com>
---
 drivers/leds/leds-tca6507.c | 161 ++++++++++++++----------------------
 1 file changed, 62 insertions(+), 99 deletions(-)

diff --git a/drivers/leds/leds-tca6507.c b/drivers/leds/leds-tca6507.c
index 6323539e54ae7..e9c7c19481702 100644
--- a/drivers/leds/leds-tca6507.c
+++ b/drivers/leds/leds-tca6507.c
@@ -107,15 +107,6 @@
 #define TCA6507_LS_BLINK0	0x6	/* Blink at Bank0 rate */
 #define TCA6507_LS_BLINK1	0x7	/* Blink at Bank1 rate */
 
-struct tca6507_platform_data {
-	struct led_platform_data leds;
-#ifdef CONFIG_GPIOLIB
-	int gpio_base;
-#endif
-};
-
-#define	TCA6507_MAKE_GPIO 1
-
 enum {
 	BANK0,
 	BANK1,
@@ -635,27 +626,21 @@ static int tca6507_gpio_direction_output(struct gpio_chip *gc,
 	return 0;
 }
 
-static int tca6507_probe_gpios(struct device *dev,
-			       struct tca6507_chip *tca,
-			       struct tca6507_platform_data *pdata)
+static int tca6507_register_gpios(struct device *dev,
+				  struct tca6507_chip *tca,
+				  unsigned long gpio_bitmap)
 {
-	int err;
-	int i = 0;
-	int gpios = 0;
-
-	for (i = 0; i < NUM_LEDS; i++)
-		if (pdata->leds.leds[i].name && pdata->leds.leds[i].flags) {
-			/* Configure as a gpio */
-			tca->gpio_map[gpios] = i;
-			gpios++;
-		}
+	int i, gpios, ret;
 
-	if (!gpios)
+	if (!gpio_bitmap)
 		return 0;
 
+	for_each_set_bit(i, &gpio_bitmap, NUM_LEDS)
+		tca->gpio_map[gpios++] = i;
+
 	tca->gpio.label = "gpio-tca6507";
 	tca->gpio.ngpio = gpios;
-	tca->gpio.base = pdata->gpio_base;
+	tca->gpio.base = -1;
 	tca->gpio.owner = THIS_MODULE;
 	tca->gpio.direction_output = tca6507_gpio_direction_output;
 	tca->gpio.set = tca6507_gpio_set_value;
@@ -663,12 +648,11 @@ static int tca6507_probe_gpios(struct device *dev,
 #ifdef CONFIG_OF_GPIO
 	tca->gpio.of_node = of_node_get(dev_of_node(dev));
 #endif
-	err = gpiochip_add_data(&tca->gpio, tca);
-	if (err) {
+	ret = gpiochip_add_data(&tca->gpio, tca);
+	if (ret)
 		tca->gpio.ngpio = 0;
-		return err;
-	}
-	return 0;
+
+	return ret;
 }
 
 static void tca6507_remove_gpio(struct tca6507_chip *tca)
@@ -677,9 +661,9 @@ static void tca6507_remove_gpio(struct tca6507_chip *tca)
 		gpiochip_remove(&tca->gpio);
 }
 #else /* CONFIG_GPIOLIB */
-static int tca6507_probe_gpios(struct device *dev,
-			       struct tca6507_chip *tca,
-			       struct tca6507_platform_data *pdata)
+static int tca6507_register_gpios(struct device *dev,
+				  struct tca6507_chip *tca,
+				  unsigned long gpio_bitmap)
 {
 	return 0;
 }
@@ -688,60 +672,62 @@ static void tca6507_remove_gpio(struct tca6507_chip *tca)
 }
 #endif /* CONFIG_GPIOLIB */
 
-static struct tca6507_platform_data *
-tca6507_led_dt_init(struct device *dev)
+static int tca6507_register_leds_and_gpios(struct device *dev,
+					   struct tca6507_chip *tca)
 {
-	struct tca6507_platform_data *pdata;
+	unsigned long gpio_bitmap = 0;
 	struct fwnode_handle *child;
-	struct led_info *tca_leds;
-	int count;
+	int count, ret;
 
 	count = device_get_child_node_count(dev);
-	if (!count || count > NUM_LEDS)
-		return ERR_PTR(-ENODEV);
-
-	tca_leds = devm_kcalloc(dev, NUM_LEDS, sizeof(struct led_info),
-				GFP_KERNEL);
-	if (!tca_leds)
-		return ERR_PTR(-ENOMEM);
+	if (!count)
+		return -ENODEV;
+	else if (count > NUM_LEDS)
+		return -EINVAL;
 
 	device_for_each_child_node(dev, child) {
-		struct led_info led;
+		struct tca6507_led *led;
 		u32 reg;
-		int ret;
-
-		if (fwnode_property_read_string(child, "label", &led.name))
-			led.name = fwnode_get_name(child);
-
-		fwnode_property_read_string(child, "linux,default-trigger",
-					    &led.default_trigger);
-
-		led.flags = 0;
-		if (fwnode_property_match_string(child, "compatible",
-						 "gpio") >= 0)
-			led.flags |= TCA6507_MAKE_GPIO;
 
 		ret = fwnode_property_read_u32(child, "reg", &reg);
 		if (ret || reg >= NUM_LEDS) {
-			fwnode_handle_put(child);
-			return ERR_PTR(ret);
+			dev_err(dev, "Invalid 'reg' property for node %pfw\n",
+				child);
+			goto err;
 		}
 
-		tca_leds[reg] = led;
-	}
+		if (fwnode_property_match_string(child, "compatible",
+						 "gpio") >= 0) {
+			gpio_bitmap |= BIT(reg);
+			continue;
+		}
 
-	pdata = devm_kzalloc(dev, sizeof(struct tca6507_platform_data),
-			     GFP_KERNEL);
-	if (!pdata)
-		return ERR_PTR(-ENOMEM);
+		led = &tca->leds[reg];
+		led->chip = tca;
+		led->num = reg;
 
-	pdata->leds.leds = tca_leds;
-	pdata->leds.num_leds = NUM_LEDS;
-#ifdef CONFIG_GPIOLIB
-	pdata->gpio_base = -1;
-#endif
+		if (fwnode_property_read_string(child, "label",
+						&led->led_cdev.name))
+			led->led_cdev.name = fwnode_get_name(child);
+
+		fwnode_property_read_string(child, "linux,default-trigger",
+					    &led->led_cdev.default_trigger);
+
+		led->led_cdev.brightness_set = tca6507_brightness_set;
+		led->led_cdev.blink_set = tca6507_blink_set;
+		led->bank = -1;
+		ret = led_classdev_register(dev, &led->led_cdev);
+		if (ret) {
+			dev_err(dev, "Failed to register LED for node %pfw\n",
+				child);
+			goto err;
+		}
+	}
 
-	return pdata;
+	return tca6507_register_gpios(dev, tca, gpio_bitmap);
+err:
+	fwnode_handle_put(child);
+	return ret;
 }
 
 static const struct of_device_id of_tca6507_leds_match[] = {
@@ -756,20 +742,13 @@ static int tca6507_probe(struct i2c_client *client,
 	struct device *dev = &client->dev;
 	struct i2c_adapter *adapter;
 	struct tca6507_chip *tca;
-	struct tca6507_platform_data *pdata;
-	int err;
-	int i = 0;
+	int err, i;
 
 	adapter = client->adapter;
 
 	if (!i2c_check_functionality(adapter, I2C_FUNC_I2C))
 		return -EIO;
 
-	pdata = tca6507_led_dt_init(dev);
-	if (IS_ERR(pdata)) {
-		dev_err(dev, "Need %d entries in platform-data list\n", NUM_LEDS);
-		return PTR_ERR(pdata);
-	}
 	tca = devm_kzalloc(dev, sizeof(*tca), GFP_KERNEL);
 	if (!tca)
 		return -ENOMEM;
@@ -779,36 +758,20 @@ static int tca6507_probe(struct i2c_client *client,
 	spin_lock_init(&tca->lock);
 	i2c_set_clientdata(client, tca);
 
-	for (i = 0; i < NUM_LEDS; i++) {
-		struct tca6507_led *l = tca->leds + i;
-
-		l->chip = tca;
-		l->num = i;
-		if (pdata->leds.leds[i].name && !pdata->leds.leds[i].flags) {
-			l->led_cdev.name = pdata->leds.leds[i].name;
-			l->led_cdev.default_trigger
-				= pdata->leds.leds[i].default_trigger;
-			l->led_cdev.brightness_set = tca6507_brightness_set;
-			l->led_cdev.blink_set = tca6507_blink_set;
-			l->bank = -1;
-			err = led_classdev_register(dev, &l->led_cdev);
-			if (err < 0)
-				goto exit;
-		}
-	}
-	err = tca6507_probe_gpios(dev, tca, pdata);
+	err = tca6507_register_leds_and_gpios(dev, tca);
 	if (err)
 		goto exit;
+
 	/* set all registers to known state - zero */
 	tca->reg_set = 0x7f;
 	schedule_work(&tca->work);
 
 	return 0;
 exit:
-	while (i--) {
+	for (i = 0; i < NUM_LEDS; ++i)
 		if (tca->leds[i].led_cdev.name)
 			led_classdev_unregister(&tca->leds[i].led_cdev);
-	}
+
 	return err;
 }
 
-- 
2.26.2

