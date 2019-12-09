Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7C55E11648A
	for <lists+linux-leds@lfdr.de>; Mon,  9 Dec 2019 01:44:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726621AbfLIAou (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 8 Dec 2019 19:44:50 -0500
Received: from mail-lf1-f65.google.com ([209.85.167.65]:39580 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726422AbfLIAot (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 8 Dec 2019 19:44:49 -0500
Received: by mail-lf1-f65.google.com with SMTP id c9so8783856lfi.6
        for <linux-leds@vger.kernel.org>; Sun, 08 Dec 2019 16:44:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OYvzSMJfxyxxDK64cQm+CKt68UJvaTrObdm8BBeYqJQ=;
        b=TMMnyl5cVLyVeiFJHDQIUS5dnItoaK2wa7CoAk3CevxVEYksLJM6Ptj+z2CoiyOXcu
         FkX2bNJnlf0kXGVZYZjj3XamSOvGz4nuGO4orX1Ki9RzF/3DAEbgIzBZ7Z+2NvMaCbRF
         W04q5E11MUCiuNddt6UYuiiTT5hrXala1OGQ73TRHTPCTcRMKVxdBCdt3qTfbqebyo/o
         Px8kWWVxm+7NzOSjYrPIcau/QsOqBBrqDT5KD9fPZviCAjDmCeSlkc7H5QHY+6cxHCmq
         i/r8l41RemxrebtKIehNJkJk73Vyi1xKwqWpSGoT7lliQ6REj5XbvLlaXH65cw4+ko8E
         DzLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OYvzSMJfxyxxDK64cQm+CKt68UJvaTrObdm8BBeYqJQ=;
        b=OyxQAUb30+lxcJwYFD4jR+154jaahufSYE7vnW4aYpumeVCX6F93p/cLdwuAkpavBO
         /VP3uVLeVIo4zEROs7JkbnvMJr+ZrgB/ztuCFnoFQ85xX9q7tHnCoVFPVVXGi7QrYBh5
         X2hEBbW4a17xgbT9Remzi2Y/4IGo+7ab+Xr/P54NWhF0R0tZMk6OocTcE5CnCxNex2uP
         8FmSqyqqy2ufjkEjGVpBafDnXoPy/5WzoHH+5Ng9LmgIlpGdmi/81r+7N6rEluJ9DkJy
         lTOes2CuHgisrw7YjM3GGiuv29TJpzXNS+6zAChKvSGBp16wB4D6cqKcpwQOw6ZrnwQ0
         7FYA==
X-Gm-Message-State: APjAAAXy9WAv5dW1zoHXxfMRGYfnr9qHZVsTW3ZViKig4QxeKHNrAzvU
        49EUW6kGndob0hgxUoo941OseQ==
X-Google-Smtp-Source: APXvYqyiadFiaa6QWKFr9MhAqcArqR5PxM4pS+hc05v/JgD61+QnUGGDCli604PRX/e/LALW1cKGPQ==
X-Received: by 2002:ac2:54b4:: with SMTP id w20mr13998887lfk.67.1575852287021;
        Sun, 08 Dec 2019 16:44:47 -0800 (PST)
Received: from localhost.localdomain (c-21cd225c.014-348-6c756e10.bbcust.telenor.se. [92.34.205.33])
        by smtp.gmail.com with ESMTPSA id j22sm1136959lfh.93.2019.12.08.16.44.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Dec 2019 16:44:45 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>
Cc:     linux-leds@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Kim Kyuwon <chammoru@gmail.com>
Subject: [PATCH v2] leds: bd2802: Convert to use GPIO descriptors
Date:   Mon,  9 Dec 2019 01:42:42 +0100
Message-Id: <20191209004242.18152-1-linus.walleij@linaro.org>
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
ChangeLog v1->v2:
- Ask simply for a GPIO descriptor named "reset", drop the
  idiomatic naming from the code.
---
 drivers/leds/leds-bd2802.c  | 27 ++++++++++++++++++---------
 include/linux/leds-bd2802.h |  1 -
 2 files changed, 18 insertions(+), 10 deletions(-)

diff --git a/drivers/leds/leds-bd2802.c b/drivers/leds/leds-bd2802.c
index e7ec6bff2b5f..bd61a823d0ca 100644
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
+	led->reset = devm_gpiod_get(&client->dev, "reset", GPIOD_OUT_LOW);
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

