Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E14BE2710F4
	for <lists+linux-leds@lfdr.de>; Sun, 20 Sep 2020 00:15:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726747AbgISWPy (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 19 Sep 2020 18:15:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726738AbgISWPx (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 19 Sep 2020 18:15:53 -0400
Received: from mail.nic.cz (lists.nic.cz [IPv6:2001:1488:800:400::400])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87445C0613CE
        for <linux-leds@vger.kernel.org>; Sat, 19 Sep 2020 15:15:53 -0700 (PDT)
Received: from dellmb.labs.office.nic.cz (unknown [IPv6:2001:1488:fffe:6:cac7:3539:7f1f:463])
        by mail.nic.cz (Postfix) with ESMTP id A3EF2140A85;
        Sun, 20 Sep 2020 00:15:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
        t=1600553750; bh=f9S4N5M9gA782ksCiLviXKNq7OXunh1ReTX4Dlb6uQM=;
        h=From:To:Date;
        b=UHpOLkhrjxdt02eiZ9J/G1gKrk1mmPJT2IXwWWoAWyvI1TRpP1Fo4Fg9tWUOZmnmi
         Z0+hy0TrvrEeQ5oNrR2S+ntB51XP6WpG+/1HpjGFhlDCZOoupDbSAsjrLjtB3c9gLf
         ACNyo7hb75BiI8EPoxHCmWdQJKmMl9RPmQG3FnSk=
From:   =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>
To:     linux-leds@vger.kernel.org
Cc:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>,
        NeilBrown <neilb@suse.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        "H . Nikolaus Schaller" <hns@goldelico.com>
Subject: [PATCH leds + devicetree 06/13] leds: tca6507: cosmetic change: use helper variable
Date:   Sun, 20 Sep 2020 00:15:41 +0200
Message-Id: <20200919221548.29984-7-marek.behun@nic.cz>
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

Use helper variable dev instead of always writing &client->dev.

Signed-off-by: Marek Behún <marek.behun@nic.cz>
Cc: NeilBrown <neilb@suse.de>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: H. Nikolaus Schaller <hns@goldelico.com>
---
 drivers/leds/leds-tca6507.c | 33 ++++++++++++++++-----------------
 1 file changed, 16 insertions(+), 17 deletions(-)

diff --git a/drivers/leds/leds-tca6507.c b/drivers/leds/leds-tca6507.c
index 58dcbddfa0b27..6323539e54ae7 100644
--- a/drivers/leds/leds-tca6507.c
+++ b/drivers/leds/leds-tca6507.c
@@ -635,7 +635,7 @@ static int tca6507_gpio_direction_output(struct gpio_chip *gc,
 	return 0;
 }
 
-static int tca6507_probe_gpios(struct i2c_client *client,
+static int tca6507_probe_gpios(struct device *dev,
 			       struct tca6507_chip *tca,
 			       struct tca6507_platform_data *pdata)
 {
@@ -659,9 +659,9 @@ static int tca6507_probe_gpios(struct i2c_client *client,
 	tca->gpio.owner = THIS_MODULE;
 	tca->gpio.direction_output = tca6507_gpio_direction_output;
 	tca->gpio.set = tca6507_gpio_set_value;
-	tca->gpio.parent = &client->dev;
+	tca->gpio.parent = dev;
 #ifdef CONFIG_OF_GPIO
-	tca->gpio.of_node = of_node_get(dev_of_node(&client->dev));
+	tca->gpio.of_node = of_node_get(dev_of_node(dev));
 #endif
 	err = gpiochip_add_data(&tca->gpio, tca);
 	if (err) {
@@ -677,7 +677,7 @@ static void tca6507_remove_gpio(struct tca6507_chip *tca)
 		gpiochip_remove(&tca->gpio);
 }
 #else /* CONFIG_GPIOLIB */
-static int tca6507_probe_gpios(struct i2c_client *client,
+static int tca6507_probe_gpios(struct device *dev,
 			       struct tca6507_chip *tca,
 			       struct tca6507_platform_data *pdata)
 {
@@ -689,23 +689,23 @@ static void tca6507_remove_gpio(struct tca6507_chip *tca)
 #endif /* CONFIG_GPIOLIB */
 
 static struct tca6507_platform_data *
-tca6507_led_dt_init(struct i2c_client *client)
+tca6507_led_dt_init(struct device *dev)
 {
 	struct tca6507_platform_data *pdata;
 	struct fwnode_handle *child;
 	struct led_info *tca_leds;
 	int count;
 
-	count = device_get_child_node_count(&client->dev);
+	count = device_get_child_node_count(dev);
 	if (!count || count > NUM_LEDS)
 		return ERR_PTR(-ENODEV);
 
-	tca_leds = devm_kcalloc(&client->dev, NUM_LEDS, sizeof(struct led_info),
+	tca_leds = devm_kcalloc(dev, NUM_LEDS, sizeof(struct led_info),
 				GFP_KERNEL);
 	if (!tca_leds)
 		return ERR_PTR(-ENOMEM);
 
-	device_for_each_child_node(&client->dev, child) {
+	device_for_each_child_node(dev, child) {
 		struct led_info led;
 		u32 reg;
 		int ret;
@@ -730,7 +730,7 @@ tca6507_led_dt_init(struct i2c_client *client)
 		tca_leds[reg] = led;
 	}
 
-	pdata = devm_kzalloc(&client->dev, sizeof(struct tca6507_platform_data),
+	pdata = devm_kzalloc(dev, sizeof(struct tca6507_platform_data),
 			     GFP_KERNEL);
 	if (!pdata)
 		return ERR_PTR(-ENOMEM);
@@ -753,8 +753,9 @@ MODULE_DEVICE_TABLE(of, of_tca6507_leds_match);
 static int tca6507_probe(struct i2c_client *client,
 		const struct i2c_device_id *id)
 {
-	struct tca6507_chip *tca;
+	struct device *dev = &client->dev;
 	struct i2c_adapter *adapter;
+	struct tca6507_chip *tca;
 	struct tca6507_platform_data *pdata;
 	int err;
 	int i = 0;
@@ -764,13 +765,12 @@ static int tca6507_probe(struct i2c_client *client,
 	if (!i2c_check_functionality(adapter, I2C_FUNC_I2C))
 		return -EIO;
 
-	pdata = tca6507_led_dt_init(client);
+	pdata = tca6507_led_dt_init(dev);
 	if (IS_ERR(pdata)) {
-		dev_err(&client->dev, "Need %d entries in platform-data list\n",
-			NUM_LEDS);
+		dev_err(dev, "Need %d entries in platform-data list\n", NUM_LEDS);
 		return PTR_ERR(pdata);
 	}
-	tca = devm_kzalloc(&client->dev, sizeof(*tca), GFP_KERNEL);
+	tca = devm_kzalloc(dev, sizeof(*tca), GFP_KERNEL);
 	if (!tca)
 		return -ENOMEM;
 
@@ -791,13 +791,12 @@ static int tca6507_probe(struct i2c_client *client,
 			l->led_cdev.brightness_set = tca6507_brightness_set;
 			l->led_cdev.blink_set = tca6507_blink_set;
 			l->bank = -1;
-			err = led_classdev_register(&client->dev,
-						    &l->led_cdev);
+			err = led_classdev_register(dev, &l->led_cdev);
 			if (err < 0)
 				goto exit;
 		}
 	}
-	err = tca6507_probe_gpios(client, tca, pdata);
+	err = tca6507_probe_gpios(dev, tca, pdata);
 	if (err)
 		goto exit;
 	/* set all registers to known state - zero */
-- 
2.26.2

