Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9B57A3AB87
	for <lists+linux-leds@lfdr.de>; Sun,  9 Jun 2019 21:10:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730129AbfFITIr (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 9 Jun 2019 15:08:47 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:33259 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730006AbfFITIo (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 9 Jun 2019 15:08:44 -0400
Received: by mail-wr1-f68.google.com with SMTP id n9so7018425wru.0;
        Sun, 09 Jun 2019 12:08:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Bz7yBH0ZG4WYN9u1mMXdTJhiVmNUWfJvc4aKT16NQ50=;
        b=q0rz9mQUgOSidGSso0AjPgYZD3mHSgdPL5KYAZPALvYy1/VpARv0B8v78yeYQgUQuo
         ZD3uGc+WYT8L7tj2m21a2vjxeMakKqeXqCMYw32NSST3bLOb6Vy6Y+EDooluAilmW9gV
         0lStTHr/+4nDUNUA24YVaGuNVefsCGueZ+9I1MM8Gau8CHfEbOtgqMgtDJQ9VGvlad3a
         378KHb08FK/iRtsItTHU+QrFZUEcsI7AY2D52MiEm3nH8pzuRZK7IqoUARxDxLak2z1q
         mSswGHqJ3V1QBHbhblFgUGNZmBLsT99G3bbJDDtPQZu7MiwrHFRki4+HjJWHJ68vrsBl
         KDlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Bz7yBH0ZG4WYN9u1mMXdTJhiVmNUWfJvc4aKT16NQ50=;
        b=IPiHUf9VqwEz4J3nQW6vu2Kou7kVaI1XE5xV96fvr4MTjjMl3UpKqRxWr+w6cKpOSL
         DUL4CEty6c+aay9CD1gjfsFTlh15bcP991SZ41HhSePQL46knI9l8YxrSmRb1s0Zk7+G
         rBIrRiiZYwEZ6PIhtM0gjqaWKjl/KmRRW/+zi9IwgsVscNtMN+MiBWUN2tfP8fS7AfKS
         42aFgVA0+PpDZOM4rxlU/uNZ6propozOpz95h+jSq6T8pHDnX5Qbc4ydj4lIT3xId4RI
         I4M83BR0u3klMkq3wRQwavItUcVGdd/HXergSwYAmj3xUJUW+FUaMH6u5YwAc+PZ1AEc
         xATw==
X-Gm-Message-State: APjAAAUw7k+doVUe0UeaCNBMJ4drETnhVSVQwTXerJnBmN/vav/0s64n
        f1C1tCVVxux/PcywdHVzbxXe20wa
X-Google-Smtp-Source: APXvYqwG1VizOVXySgoKorTAQg6kz1ElPGhF/0f/6ivrQfd2WBnT8ugZefyTe6sqTHRwtu7E5I6lzA==
X-Received: by 2002:a5d:4cc3:: with SMTP id c3mr15667680wrt.259.1560107322764;
        Sun, 09 Jun 2019 12:08:42 -0700 (PDT)
Received: from myhost.home (ckm12.neoplus.adsl.tpnet.pl. [83.31.88.12])
        by smtp.gmail.com with ESMTPSA id y38sm14725041wrd.41.2019.06.09.12.08.41
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 09 Jun 2019 12:08:42 -0700 (PDT)
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
To:     linux-leds@vger.kernel.org
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        pavel@ucw.cz, robh@kernel.org, dtor@google.com, linux@roeck-us.net,
        dmurphy@ti.com, jacek.anaszewski@gmail.com,
        Daniel Mack <daniel@zonque.org>
Subject: [PATCH v5 09/26] leds: lt3593: Use generic support for composing LED names
Date:   Sun,  9 Jun 2019 21:07:46 +0200
Message-Id: <20190609190803.14815-10-jacek.anaszewski@gmail.com>
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
Cc: Daniel Mack <daniel@zonque.org>
Acked-by: Pavel Machek <pavel@ucw.cz>
---
 drivers/leds/leds-lt3593.c | 20 ++++++++------------
 1 file changed, 8 insertions(+), 12 deletions(-)

diff --git a/drivers/leds/leds-lt3593.c b/drivers/leds/leds-lt3593.c
index 83e8e58d81cb..c94995f0daa2 100644
--- a/drivers/leds/leds-lt3593.c
+++ b/drivers/leds/leds-lt3593.c
@@ -10,10 +10,10 @@
 #include <linux/slab.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <uapi/linux/uleds.h>
+
+#define LED_LT3593_NAME "lt3593"
 
 struct lt3593_led_data {
-	char name[LED_MAX_NAME_SIZE];
 	struct led_classdev cdev;
 	struct gpio_desc *gpiod;
 };
@@ -66,6 +66,7 @@ static int lt3593_led_probe(struct platform_device *pdev)
 	struct lt3593_led_data *led_data;
 	struct fwnode_handle *child;
 	int ret, state = LEDS_GPIO_DEFSTATE_OFF;
+	struct led_init_data init_data = {};
 	const char *tmp;
 
 	if (!dev->of_node)
@@ -86,14 +87,6 @@ static int lt3593_led_probe(struct platform_device *pdev)
 
 	child = device_get_next_child_node(dev, NULL);
 
-	ret = fwnode_property_read_string(child, "label", &tmp);
-	if (ret < 0)
-		snprintf(led_data->name, sizeof(led_data->name),
-			 "lt3593::");
-	else
-		snprintf(led_data->name, sizeof(led_data->name),
-			 "lt3593:%s", tmp);
-
 	fwnode_property_read_string(child, "linux,default-trigger",
 				    &led_data->cdev.default_trigger);
 
@@ -102,11 +95,14 @@ static int lt3593_led_probe(struct platform_device *pdev)
 			state = LEDS_GPIO_DEFSTATE_ON;
 	}
 
-	led_data->cdev.name = led_data->name;
 	led_data->cdev.brightness_set_blocking = lt3593_led_set;
 	led_data->cdev.brightness = state ? LED_FULL : LED_OFF;
 
-	ret = devm_led_classdev_register(dev, &led_data->cdev);
+	init_data.fwnode = child;
+	init_data.devicename = LED_LT3593_NAME;
+	init_data.default_label = ":";
+
+	ret = devm_led_classdev_register_ext(dev, &led_data->cdev, &init_data);
 	if (ret < 0) {
 		fwnode_handle_put(child);
 		return ret;
-- 
2.11.0

