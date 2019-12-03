Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4AE4210FB3B
	for <lists+linux-leds@lfdr.de>; Tue,  3 Dec 2019 10:59:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725939AbfLCJ7Q (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 3 Dec 2019 04:59:16 -0500
Received: from mail-lf1-f65.google.com ([209.85.167.65]:33471 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725774AbfLCJ7Q (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 3 Dec 2019 04:59:16 -0500
Received: by mail-lf1-f65.google.com with SMTP id n25so2446825lfl.0
        for <linux-leds@vger.kernel.org>; Tue, 03 Dec 2019 01:59:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UJIY4sH3QE29xBEDG6U0kLRdXgsLA2G/LrGj6WAHtGk=;
        b=JWhDAQTR7dH/WaoVmKRyR/etWfHhctWUc7lZkbNpWvCCEoWivytePjutq9rQUGI/iF
         o0IvMc//+kew/+HJhelkE/+zHEa6jlXnOQO4I+swSdS+rP1WjayrthvQjX9q3EqMUqUs
         6QDZ/jt4Yy/TjPReLrgFsFa/dvBRWbls+iSMm5AjRGGUiiy3ocTpSFeKPoTulycTz0a7
         dHFGHlpVWmx327N6gE8lKFnwLUAyVxZ+EJwhNWShkkpbQRJ+cSy4th2UYCVpfpUmfDeM
         blpFMhUsJXmm8g9nfjUleWihqHDwUhLCbZpdmX2W0WcyxkgXzY0v5TBwkP9ShxtQayaZ
         Af2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UJIY4sH3QE29xBEDG6U0kLRdXgsLA2G/LrGj6WAHtGk=;
        b=JzYlEGyhJcRC+lv3rwJ13kNQp58cyU74qud7W1WnuBRYuFfmPWl/Sozzj7RSYZgsWN
         T/anJSMjRfoeaz5uJMn21TIO45dpqJhfVaGTGZieLVZ7eerOMKyK+uWTUl2UvO6fAvyi
         eG6y0viZikSxlTjoNoLXpVBdwCH7USc/TkvKxr17tCST3OyI/ZvJroukmhlaClkXkQIs
         cojwWCyPIOqNlvw5mgyRTgkxK7L+HIgSNeGoCsxJ/wqMV4uoY8lCApVBMsJ6A6FOcaZO
         Wp2Enr45rOq0qbqCcaJRr5LF16IzSYBFZ3bg6HljcnEBBaHL/Zi7RXWh8/FocGjfjCBR
         dCIw==
X-Gm-Message-State: APjAAAUfk/DpO2xTH1eRcGtX+xJWerjnqR7Pp4W0I6Iw7ZqF2O2sreXK
        OuiU3UU3YmclVXC9ULSjEbBR9w==
X-Google-Smtp-Source: APXvYqxzg4DmOkNZwzheCfus1OM8Rf/OvoTc8IsKdmzUegrJGFvqtpckhYOia6yvwlKUvtzZONM5TA==
X-Received: by 2002:a19:40d8:: with SMTP id n207mr2201127lfa.4.1575367152916;
        Tue, 03 Dec 2019 01:59:12 -0800 (PST)
Received: from genomnajs.ideon.se ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id a9sm1009305lfi.50.2019.12.03.01.59.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2019 01:59:11 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>
Cc:     linux-leds@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Kim Kyuwon <chammoru@gmail.com>
Subject: [PATCH] leds: bd2802: Convert to use GPIO descriptors
Date:   Tue,  3 Dec 2019 10:59:08 +0100
Message-Id: <20191203095908.52926-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

The Rohm BD2802 have no in-kernel users so we can drop the
GPIO number from the platform data and require users to
provide the GPIO line using machine descriptors.

As the descriptors come with inherent polarity inversion
semantics, we invert the calls to set the GPIO line such
that 0 means "unasserted" and 1 means "asserted".

Put a note in the driver that machine descriptor tables
will need to specify that the line is active low.

Cc: Kim Kyuwon <chammoru@gmail.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/leds/leds-bd2802.c  | 27 ++++++++++++++++++---------
 include/linux/leds-bd2802.h |  1 -
 2 files changed, 18 insertions(+), 10 deletions(-)

diff --git a/drivers/leds/leds-bd2802.c b/drivers/leds/leds-bd2802.c
index e7ec6bff2b5f..d551f7434897 100644
--- a/drivers/leds/leds-bd2802.c
+++ b/drivers/leds/leds-bd2802.c
@@ -10,7 +10,7 @@
 
 #include <linux/module.h>
 #include <linux/i2c.h>
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/delay.h>
 #include <linux/leds.h>
 #include <linux/leds-bd2802.h>
@@ -67,6 +67,7 @@ struct led_state {
 struct bd2802_led {
 	struct bd2802_led_platform_data	*pdata;
 	struct i2c_client		*client;
+	struct gpio_desc		*reset;
 	struct rw_semaphore		rwsem;
 
 	struct led_state		led[2];
@@ -200,7 +201,7 @@ static void bd2802_update_state(struct bd2802_led *led, enum led_ids id,
 		return;
 
 	if (bd2802_is_all_off(led) && !led->adf_on) {
-		gpio_set_value(led->pdata->reset_gpio, 0);
+		gpiod_set_value(led->reset, 1);
 		return;
 	}
 
@@ -226,7 +227,7 @@ static void bd2802_configure(struct bd2802_led *led)
 
 static void bd2802_reset_cancel(struct bd2802_led *led)
 {
-	gpio_set_value(led->pdata->reset_gpio, 1);
+	gpiod_set_value(led->reset, 0);
 	udelay(100);
 	bd2802_configure(led);
 }
@@ -420,7 +421,7 @@ static void bd2802_disable_adv_conf(struct bd2802_led *led)
 						bd2802_addr_attributes[i]);
 
 	if (bd2802_is_all_off(led))
-		gpio_set_value(led->pdata->reset_gpio, 0);
+		gpiod_set_value(led->reset, 1);
 
 	led->adf_on = 0;
 }
@@ -670,8 +671,16 @@ static int bd2802_probe(struct i2c_client *client,
 	pdata = led->pdata = dev_get_platdata(&client->dev);
 	i2c_set_clientdata(client, led);
 
-	/* Configure RESET GPIO (L: RESET, H: RESET cancel) */
-	gpio_request_one(pdata->reset_gpio, GPIOF_OUT_INIT_HIGH, "RGB_RESETB");
+	/*
+	 * Configure RESET GPIO (L: RESET, H: RESET cancel)
+	 *
+	 * We request the reset GPIO as OUT_LOW which means de-asserted,
+	 * board files specifying this GPIO line in a machine descriptor
+	 * table should take care to specify GPIO_ACTIVE_LOW for this line.
+	 */
+	led->reset = devm_gpiod_get(&client->dev, "rgb-resetb", GPIOD_OUT_LOW);
+	if (IS_ERR(led->reset))
+		return PTR_ERR(led->reset);
 
 	/* Tacss = min 0.1ms */
 	udelay(100);
@@ -685,7 +694,7 @@ static int bd2802_probe(struct i2c_client *client,
 		dev_info(&client->dev, "return 0x%02x\n", ret);
 
 	/* To save the power, reset BD2802 after detecting */
-	gpio_set_value(led->pdata->reset_gpio, 0);
+	gpiod_set_value(led->reset, 1);
 
 	/* Default attributes */
 	led->wave_pattern = BD2802_PATTERN_HALF;
@@ -720,7 +729,7 @@ static int bd2802_remove(struct i2c_client *client)
 	struct bd2802_led *led = i2c_get_clientdata(client);
 	int i;
 
-	gpio_set_value(led->pdata->reset_gpio, 0);
+	gpiod_set_value(led->reset, 1);
 	bd2802_unregister_led_classdev(led);
 	if (led->adf_on)
 		bd2802_disable_adv_conf(led);
@@ -750,7 +759,7 @@ static int bd2802_suspend(struct device *dev)
 	struct i2c_client *client = to_i2c_client(dev);
 	struct bd2802_led *led = i2c_get_clientdata(client);
 
-	gpio_set_value(led->pdata->reset_gpio, 0);
+	gpiod_set_value(led->reset, 1);
 
 	return 0;
 }
diff --git a/include/linux/leds-bd2802.h b/include/linux/leds-bd2802.h
index dd93c8d787b4..ec577f5f8707 100644
--- a/include/linux/leds-bd2802.h
+++ b/include/linux/leds-bd2802.h
@@ -11,7 +11,6 @@
 #define _LEDS_BD2802_H_
 
 struct bd2802_led_platform_data{
-	int	reset_gpio;
 	u8	rgb_time;
 };
 
-- 
2.23.0

