Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F8A62710F7
	for <lists+linux-leds@lfdr.de>; Sun, 20 Sep 2020 00:15:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726755AbgISWPy (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 19 Sep 2020 18:15:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726749AbgISWPy (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 19 Sep 2020 18:15:54 -0400
Received: from mail.nic.cz (lists.nic.cz [IPv6:2001:1488:800:400::400])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13FC3C0613CE
        for <linux-leds@vger.kernel.org>; Sat, 19 Sep 2020 15:15:54 -0700 (PDT)
Received: from dellmb.labs.office.nic.cz (unknown [IPv6:2001:1488:fffe:6:cac7:3539:7f1f:463])
        by mail.nic.cz (Postfix) with ESMTP id 421C0140A84;
        Sun, 20 Sep 2020 00:15:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
        t=1600553751; bh=vzSvdQrOWGNH1dxpbdbbhheFqh4N+DKhDr+pGP0PLTA=;
        h=From:To:Date;
        b=CpB1sL+1jKziJblJ6kj2JWsy7lhBHkdNLzyCkQHFv8wuu+z2VWUKaj5H5fYPOAWZ/
         UzkUPcuIBVxVNlRoY8j7VJIWNi47aCTbqg3B087s5UyVKq/qSfNKVaeyem09PEBhsu
         MLvCqKDrIGZ0gDwjlgtYCLuR+9ZJJwVAmV6ANaMc=
From:   =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>
To:     linux-leds@vger.kernel.org
Cc:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>,
        NeilBrown <neilb@suse.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        "H . Nikolaus Schaller" <hns@goldelico.com>
Subject: [PATCH leds + devicetree 09/13] leds: tca6507: use devres for LED and gpiochip registration
Date:   Sun, 20 Sep 2020 00:15:44 +0200
Message-Id: <20200919221548.29984-10-marek.behun@nic.cz>
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

By using devres for LED and gpiochip registration the driver gets
simpler.

Signed-off-by: Marek Behún <marek.behun@nic.cz>
Cc: NeilBrown <neilb@suse.de>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: H. Nikolaus Schaller <hns@goldelico.com>
---
 drivers/leds/leds-tca6507.c | 36 +++++-------------------------------
 1 file changed, 5 insertions(+), 31 deletions(-)

diff --git a/drivers/leds/leds-tca6507.c b/drivers/leds/leds-tca6507.c
index 03858b61c7af1..e2be615855ae3 100644
--- a/drivers/leds/leds-tca6507.c
+++ b/drivers/leds/leds-tca6507.c
@@ -613,7 +613,7 @@ static int tca6507_register_gpios(struct device *dev,
 				  struct tca6507_chip *tca,
 				  unsigned long gpio_bitmap)
 {
-	int i, gpios, ret;
+	int i, gpios;
 
 	if (!gpio_bitmap)
 		return 0;
@@ -631,17 +631,7 @@ static int tca6507_register_gpios(struct device *dev,
 #ifdef CONFIG_OF_GPIO
 	tca->gpio.of_node = of_node_get(dev_of_node(dev));
 #endif
-	ret = gpiochip_add_data(&tca->gpio, tca);
-	if (ret)
-		tca->gpio.ngpio = 0;
-
-	return ret;
-}
-
-static void tca6507_remove_gpio(struct tca6507_chip *tca)
-{
-	if (tca->gpio.ngpio)
-		gpiochip_remove(&tca->gpio);
+	return devm_gpiochip_add_data(dev, &tca->gpio, tca);
 }
 #else /* CONFIG_GPIOLIB */
 static int tca6507_register_gpios(struct device *dev,
@@ -650,9 +640,6 @@ static int tca6507_register_gpios(struct device *dev,
 {
 	return 0;
 }
-static void tca6507_remove_gpio(struct tca6507_chip *tca)
-{
-}
 #endif /* CONFIG_GPIOLIB */
 
 static int tca6507_register_leds_and_gpios(struct device *dev,
@@ -699,7 +686,7 @@ static int tca6507_register_leds_and_gpios(struct device *dev,
 		led->led_cdev.brightness_set = tca6507_brightness_set;
 		led->led_cdev.blink_set = tca6507_blink_set;
 		led->bank = -1;
-		ret = led_classdev_register(dev, &led->led_cdev);
+		ret = devm_led_classdev_register(dev, &led->led_cdev);
 		if (ret) {
 			dev_err(dev, "Failed to register LED for node %pfw\n",
 				child);
@@ -725,7 +712,7 @@ static int tca6507_probe(struct i2c_client *client,
 	struct device *dev = &client->dev;
 	struct i2c_adapter *adapter;
 	struct tca6507_chip *tca;
-	int err, i;
+	int err;
 
 	adapter = client->adapter;
 
@@ -743,32 +730,19 @@ static int tca6507_probe(struct i2c_client *client,
 
 	err = tca6507_register_leds_and_gpios(dev, tca);
 	if (err)
-		goto exit;
+		return err;
 
 	/* set all registers to known state - zero */
 	tca->reg_set = 0x7f;
 	schedule_work(&tca->work);
 
 	return 0;
-exit:
-	for (i = 0; i < NUM_LEDS; ++i)
-		if (tca->leds[i].led_cdev.name)
-			led_classdev_unregister(&tca->leds[i].led_cdev);
-
-	return err;
 }
 
 static int tca6507_remove(struct i2c_client *client)
 {
-	int i;
 	struct tca6507_chip *tca = i2c_get_clientdata(client);
-	struct tca6507_led *tca_leds = tca->leds;
 
-	for (i = 0; i < NUM_LEDS; i++) {
-		if (tca_leds[i].led_cdev.name)
-			led_classdev_unregister(&tca_leds[i].led_cdev);
-	}
-	tca6507_remove_gpio(tca);
 	cancel_work_sync(&tca->work);
 
 	return 0;
-- 
2.26.2

