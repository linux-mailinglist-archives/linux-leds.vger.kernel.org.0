Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 08FDA2710F0
	for <lists+linux-leds@lfdr.de>; Sun, 20 Sep 2020 00:15:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726626AbgISWPw (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 19 Sep 2020 18:15:52 -0400
Received: from lists.nic.cz ([217.31.204.67]:49956 "EHLO mail.nic.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726598AbgISWPw (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Sat, 19 Sep 2020 18:15:52 -0400
Received: from dellmb.labs.office.nic.cz (unknown [IPv6:2001:1488:fffe:6:cac7:3539:7f1f:463])
        by mail.nic.cz (Postfix) with ESMTP id C94EB140A46;
        Sun, 20 Sep 2020 00:15:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
        t=1600553750; bh=e+tf2lRY+bvJ0jEj5qA2w6GLc74kkgFVI/NbOn998GU=;
        h=From:To:Date;
        b=L9iiFE0dMtJ1n01mFWC5hkraJmmF+6fPqOmq1Ljn8MsQIZQ2l/E9o7A+FfU1TaI6q
         pteYIHrC8Nu3aKyai9AyzoRGCIfqWrCSQL273NCFrCoBJu54U/gmMfa/hTzdawIhRF
         aQcIR37qRrTBWEjyQ7mvHJfc0u5emHN8vj6QWa60=
From:   =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>
To:     linux-leds@vger.kernel.org
Cc:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>,
        NeilBrown <neilb@suse.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        "H . Nikolaus Schaller" <hns@goldelico.com>
Subject: [PATCH leds + devicetree 02/13] leds: tca6507: use fwnode API instead of OF
Date:   Sun, 20 Sep 2020 00:15:37 +0200
Message-Id: <20200919221548.29984-3-marek.behun@nic.cz>
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

Convert to use fwnode API instead of OF. It is more generic and if
someone wants to use this driver without device-tree yet still, they
will be able to via swnode fwnodes.

Remove the gpio setup function from platdata.

Signed-off-by: Marek Behún <marek.behun@nic.cz>
Cc: NeilBrown <neilb@suse.de>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: H. Nikolaus Schaller <hns@goldelico.com>
---
 drivers/leds/leds-tca6507.c | 66 ++++++++++++++++---------------------
 1 file changed, 29 insertions(+), 37 deletions(-)

diff --git a/drivers/leds/leds-tca6507.c b/drivers/leds/leds-tca6507.c
index b5b5bafe2176e..3e01fe2510f7c 100644
--- a/drivers/leds/leds-tca6507.c
+++ b/drivers/leds/leds-tca6507.c
@@ -94,8 +94,8 @@
 #include <linux/err.h>
 #include <linux/i2c.h>
 #include <linux/gpio/driver.h>
+#include <linux/property.h>
 #include <linux/workqueue.h>
-#include <linux/of.h>
 
 /* LED select registers determine the source that drives LED outputs */
 #define TCA6507_LS_LED_OFF	0x0	/* Output HI-Z (off) */
@@ -111,7 +111,6 @@ struct tca6507_platform_data {
 	struct led_platform_data leds;
 #ifdef CONFIG_GPIOLIB
 	int gpio_base;
-	void (*setup)(unsigned gpio_base, unsigned ngpio);
 #endif
 };
 
@@ -672,8 +671,6 @@ static int tca6507_probe_gpios(struct i2c_client *client,
 		tca->gpio.ngpio = 0;
 		return err;
 	}
-	if (pdata->setup)
-		pdata->setup(tca->gpio.base, tca->gpio.ngpio);
 	return 0;
 }
 
@@ -694,44 +691,50 @@ static void tca6507_remove_gpio(struct tca6507_chip *tca)
 }
 #endif /* CONFIG_GPIOLIB */
 
-#ifdef CONFIG_OF
 static struct tca6507_platform_data *
 tca6507_led_dt_init(struct i2c_client *client)
 {
-	struct device_node *np = dev_of_node(&client->dev), *child;
 	struct tca6507_platform_data *pdata;
+	struct fwnode_handle *child;
 	struct led_info *tca_leds;
 	int count;
 
-	count = of_get_available_child_count(np);
+	count = device_get_child_node_count(&client->dev);
 	if (!count || count > NUM_LEDS)
 		return ERR_PTR(-ENODEV);
 
-	tca_leds = devm_kcalloc(&client->dev,
-			NUM_LEDS, sizeof(struct led_info), GFP_KERNEL);
+	tca_leds = devm_kcalloc(&client->dev, NUM_LEDS, sizeof(struct led_info),
+				GFP_KERNEL);
 	if (!tca_leds)
 		return ERR_PTR(-ENOMEM);
 
-	for_each_available_child_of_node(np, child) {
+	device_for_each_child_node(&client->dev, child) {
 		struct led_info led;
 		u32 reg;
 		int ret;
 
-		led.name =
-			of_get_property(child, "label", NULL) ? : child->name;
-		led.default_trigger =
-			of_get_property(child, "linux,default-trigger", NULL);
+		if (fwnode_property_read_string(child, "label", &led.name))
+			led.name = fwnode_get_name(child);
+
+		fwnode_property_read_string(child, "linux,default-trigger",
+					    &led.default_trigger);
+
 		led.flags = 0;
-		if (of_property_match_string(child, "compatible", "gpio") >= 0)
+		if (fwnode_property_match_string(child, "compatible",
+						 "gpio") >= 0)
 			led.flags |= TCA6507_MAKE_GPIO;
-		ret = of_property_read_u32(child, "reg", &reg);
-		if (ret != 0 || reg >= NUM_LEDS)
-			continue;
+
+		ret = fwnode_property_read_u32(child, "reg", &reg);
+		if (ret || reg >= NUM_LEDS) {
+			fwnode_handle_put(child);
+			return ERR_PTR(ret);
+		}
 
 		tca_leds[reg] = led;
 	}
-	pdata = devm_kzalloc(&client->dev,
-			sizeof(struct tca6507_platform_data), GFP_KERNEL);
+
+	pdata = devm_kzalloc(&client->dev, sizeof(struct tca6507_platform_data),
+			     GFP_KERNEL);
 	if (!pdata)
 		return ERR_PTR(-ENOMEM);
 
@@ -740,6 +743,7 @@ tca6507_led_dt_init(struct i2c_client *client)
 #ifdef CONFIG_GPIOLIB
 	pdata->gpio_base = -1;
 #endif
+
 	return pdata;
 }
 
@@ -749,15 +753,6 @@ static const struct of_device_id of_tca6507_leds_match[] = {
 };
 MODULE_DEVICE_TABLE(of, of_tca6507_leds_match);
 
-#else
-static struct tca6507_platform_data *
-tca6507_led_dt_init(struct i2c_client *client)
-{
-	return ERR_PTR(-ENODEV);
-}
-
-#endif
-
 static int tca6507_probe(struct i2c_client *client,
 		const struct i2c_device_id *id)
 {
@@ -768,18 +763,15 @@ static int tca6507_probe(struct i2c_client *client,
 	int i = 0;
 
 	adapter = client->adapter;
-	pdata = dev_get_platdata(&client->dev);
 
 	if (!i2c_check_functionality(adapter, I2C_FUNC_I2C))
 		return -EIO;
 
-	if (!pdata || pdata->leds.num_leds != NUM_LEDS) {
-		pdata = tca6507_led_dt_init(client);
-		if (IS_ERR(pdata)) {
-			dev_err(&client->dev, "Need %d entries in platform-data list\n",
-				NUM_LEDS);
-			return PTR_ERR(pdata);
-		}
+	pdata = tca6507_led_dt_init(client);
+	if (IS_ERR(pdata)) {
+		dev_err(&client->dev, "Need %d entries in platform-data list\n",
+			NUM_LEDS);
+		return PTR_ERR(pdata);
 	}
 	tca = devm_kzalloc(&client->dev, sizeof(*tca), GFP_KERNEL);
 	if (!tca)
-- 
2.26.2

