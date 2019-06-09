Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D45F43AB73
	for <lists+linux-leds@lfdr.de>; Sun,  9 Jun 2019 21:10:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730786AbfFITJL (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 9 Jun 2019 15:09:11 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:35371 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730367AbfFITJK (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 9 Jun 2019 15:09:10 -0400
Received: by mail-wr1-f65.google.com with SMTP id m3so7005848wrv.2;
        Sun, 09 Jun 2019 12:09:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=oXwCvaOUC9RvoHYx8yAS+swNCbtgxdjgYrIH9bepZgg=;
        b=CF6MvhtoA0H3IumEKJUASP4feaB7e7dXqpSPOrfuasRnaOqGbhe/LNeY+ZwRmaVgnS
         pwwurWqZ7VACGGSsSbf4MbZoE0/omqRNRnQ7t5nwj6hgcfsNbXltaCBGOZZ4h3MqW59O
         BsG4XftF0Cs1moOwxpuWA7b8mMol9eZH10n9jb4b5cyCYnjagN64mfRrjmH+DyoFlTje
         arpPdXknz3ymQhxoPDx2LNgE1pafWL9PqHigSrItiv4BQEmsulvnfdwQU76szl0JRUE4
         BD+nmyXqNGeLyiEoOPFKzhw8HoTcMINCvpBR1+F2NkK3ZBgYPWdv0V7yKKwB34YJlyoo
         3d8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=oXwCvaOUC9RvoHYx8yAS+swNCbtgxdjgYrIH9bepZgg=;
        b=iflz/lrrVSvIgh+V4KCiAR1lggpQOFcFE2IUh4IBlH4p8tj/uVajjt88yQ0968qlye
         dfhQpHoPFfpNUqFlKwVHUse3GBx3NMkG8NHlKLZ1re9cU5jizzBpX1wgjPNh2hG0L1Wq
         Xci82Ls3K6CyP8EaDp4sqSo26uGJoyuk7KriN61Qb+D+raj/4cuLDvDEiv+lN0ivUr1O
         0PEczEKv/wtMZ9WJVTs3OFyiqlfVAu1SDFlb5gSRqepmCLShvPiDV+pV2wopRf4BLDXk
         atJg6XfuchSaTGLUrxiI9B1mwscBFl+BJpI67t7A89Iwg6FZCDR2jQZxRuyyrHanGbZZ
         aadw==
X-Gm-Message-State: APjAAAWyEjJeW05Q/pniHfQgv0uU+TV7ZuYV/XYVRri4LPQn0H2J2Jws
        tmsB/T3erAKDctjBn5CJN99ijvFy
X-Google-Smtp-Source: APXvYqxzszUX1dwqMI7B5HEafvjKHzJTeuNx5ouEPuP5Bu2wXorJGN4n4qd4V4cNN9svaZDf/TRvGg==
X-Received: by 2002:a05:6000:1289:: with SMTP id f9mr3776086wrx.125.1560107348752;
        Sun, 09 Jun 2019 12:09:08 -0700 (PDT)
Received: from myhost.home (ckm12.neoplus.adsl.tpnet.pl. [83.31.88.12])
        by smtp.gmail.com with ESMTPSA id y38sm14725041wrd.41.2019.06.09.12.09.07
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 09 Jun 2019 12:09:08 -0700 (PDT)
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
To:     linux-leds@vger.kernel.org
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        pavel@ucw.cz, robh@kernel.org, dtor@google.com, linux@roeck-us.net,
        dmurphy@ti.com, jacek.anaszewski@gmail.com,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v5 23/26] leds: gpio: Use generic support for composing LED names
Date:   Sun,  9 Jun 2019 21:08:00 +0200
Message-Id: <20190609190803.14815-24-jacek.anaszewski@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190609190803.14815-1-jacek.anaszewski@gmail.com>
References: <20190609190803.14815-1-jacek.anaszewski@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Switch to using generic LED support for composing LED class
device name.

Signed-off-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/leds/leds-gpio.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/leds/leds-gpio.c b/drivers/leds/leds-gpio.c
index b26cf78993d1..fe70613aca34 100644
--- a/drivers/leds/leds-gpio.c
+++ b/drivers/leds/leds-gpio.c
@@ -77,11 +77,11 @@ static int gpio_blink_set(struct led_classdev *led_cdev,
 
 static int create_gpio_led(const struct gpio_led *template,
 	struct gpio_led_data *led_dat, struct device *parent,
-	struct device_node *np, gpio_blink_set_t blink_set)
+	struct fwnode_handle *fwnode, gpio_blink_set_t blink_set)
 {
+	struct led_init_data init_data = {};
 	int ret, state;
 
-	led_dat->cdev.name = template->name;
 	led_dat->cdev.default_trigger = template->default_trigger;
 	led_dat->can_sleep = gpiod_cansleep(led_dat->gpiod);
 	if (!led_dat->can_sleep)
@@ -112,7 +112,16 @@ static int create_gpio_led(const struct gpio_led *template,
 	if (ret < 0)
 		return ret;
 
-	return devm_led_classdev_register(parent, &led_dat->cdev);
+	if (template->name) {
+		led_dat->cdev.name = template->name;
+		ret = devm_led_classdev_register(parent, &led_dat->cdev);
+	} else {
+		init_data.fwnode = fwnode;
+		ret = devm_led_classdev_register_ext(parent, &led_dat->cdev,
+						     &init_data);
+	}
+
+	return ret;
 }
 
 struct gpio_leds_priv {
@@ -145,15 +154,6 @@ static struct gpio_leds_priv *gpio_leds_create(struct platform_device *pdev)
 		struct gpio_led_data *led_dat = &priv->leds[priv->num_leds];
 		struct gpio_led led = {};
 		const char *state = NULL;
-		struct device_node *np = to_of_node(child);
-
-		ret = fwnode_property_read_string(child, "label", &led.name);
-		if (ret && IS_ENABLED(CONFIG_OF) && np)
-			led.name = np->name;
-		if (!led.name) {
-			fwnode_handle_put(child);
-			return ERR_PTR(-EINVAL);
-		}
 
 		led.gpiod = devm_fwnode_get_gpiod_from_child(dev, NULL, child,
 							     GPIOD_ASIS,
@@ -185,7 +185,7 @@ static struct gpio_leds_priv *gpio_leds_create(struct platform_device *pdev)
 		if (fwnode_property_present(child, "panic-indicator"))
 			led.panic_indicator = 1;
 
-		ret = create_gpio_led(&led, led_dat, dev, np, NULL);
+		ret = create_gpio_led(&led, led_dat, dev, child, NULL);
 		if (ret < 0) {
 			fwnode_handle_put(child);
 			return ERR_PTR(ret);
-- 
2.11.0

