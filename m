Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 437853AB55
	for <lists+linux-leds@lfdr.de>; Sun,  9 Jun 2019 21:09:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730353AbfFITIt (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 9 Jun 2019 15:08:49 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:40610 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730121AbfFITIt (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 9 Jun 2019 15:08:49 -0400
Received: by mail-wr1-f68.google.com with SMTP id p11so6975358wre.7;
        Sun, 09 Jun 2019 12:08:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=dO5o0aICCdFSSOf14DSqWo2uCOCH5kCpOWfHNkQ6e24=;
        b=dTW2KQY3g3bKk8XXN3o6jqGpvSb69oaqy7Ns91HVZUsMxMEGOSllnhYLau4xlgarBg
         VjeST1V5SjMMt7KA8bY1HJfTLpyNNFch0AZ1k3fBP0AmsFo47t9FESkiAOjViIL/JDTD
         S9Ho6VpT2gZ2pWeMTzhn/oWJ7qCrFchk7pS4ha65Ta+Xb2d6ye5/SDfdfHctrn05XSq+
         jNyGBcmY5vlv9gKbair2PLDEoUvL3Qr2kqJzGAJOr59oLb7fHQI3df9aNt9+2yrs/VLA
         2+jtlCgNqPNZ/0RpiGlko2A/LO7+qjfKEKOHMkgHcRblMoQA7xhoyViL62WX0GvnAh//
         htlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=dO5o0aICCdFSSOf14DSqWo2uCOCH5kCpOWfHNkQ6e24=;
        b=MBuVkcZ1KzEYMmkRxYqLOp9VnLTtFLVAb6d9047HLmHYDq1URWQtEBcBhw9XBzde+c
         iFQP8TQyntLOZqMkAdcjw6f2xyl1+8NfbBbE6mAfse7JeAr9soZK8/4aQv5oebECnOuo
         XQS9Bj0YCpDdU1lRzYXW2fBdMxB3Vx/3FUUlvGMqjRNWxdfBdnNgx0k/fLLXDBkSbkSK
         spxG1wzxJGxsCVEJ+aoQvaskEHEUltz2clQ3/l+VUaN6EntMU6SBhNSji1IY5hJa/Wmu
         nCFyPHuNLLa5p1Tt+6AiDvyu50d2BE9f3AG9GRmJWBo/kts/RfH4+tOU7FJ3BaYJ+6eT
         6eCw==
X-Gm-Message-State: APjAAAU7ZWjZyPHJDSbla0LVdVEtiRXrv9O+GUXm+NbvsLUxV5zSTVwM
        Zyug8LV5CjEz7Fx97VxDSsuJDknh
X-Google-Smtp-Source: APXvYqzMJkvuy1WSyl3eVa/cB3zsL5JpHnoQ/tBzW7Fs4yT5mLXwiNsufSWZooX9Ng5uzOdPllN8hQ==
X-Received: by 2002:adf:fd8d:: with SMTP id d13mr7963697wrr.8.1560107326649;
        Sun, 09 Jun 2019 12:08:46 -0700 (PDT)
Received: from myhost.home (ckm12.neoplus.adsl.tpnet.pl. [83.31.88.12])
        by smtp.gmail.com with ESMTPSA id y38sm14725041wrd.41.2019.06.09.12.08.45
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 09 Jun 2019 12:08:46 -0700 (PDT)
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
To:     linux-leds@vger.kernel.org
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        pavel@ucw.cz, robh@kernel.org, dtor@google.com, linux@roeck-us.net,
        dmurphy@ti.com, jacek.anaszewski@gmail.com
Subject: [PATCH v5 11/26] leds: lp8860: Use generic support for composing LED names
Date:   Sun,  9 Jun 2019 21:07:48 +0200
Message-Id: <20190609190803.14815-12-jacek.anaszewski@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190609190803.14815-1-jacek.anaszewski@gmail.com>
References: <20190609190803.14815-1-jacek.anaszewski@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Switch to using generic LED support for composing LED class
device name.

While at it, avoid iterating through available child of nodes
in favor of obtaining single expected child node using single
call to of_get_next_available_child().

Signed-off-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Acked-by: Pavel Machek <pavel@ucw.cz>
Tested-by: Dan Murphy <dmurphy@ti.com>
---
 drivers/leds/leds-lp8860.c | 35 ++++++++++++++++-------------------
 1 file changed, 16 insertions(+), 19 deletions(-)

diff --git a/drivers/leds/leds-lp8860.c b/drivers/leds/leds-lp8860.c
index 39c72a908f3b..e1587210c783 100644
--- a/drivers/leds/leds-lp8860.c
+++ b/drivers/leds/leds-lp8860.c
@@ -22,7 +22,6 @@
 #include <linux/of_gpio.h>
 #include <linux/gpio/consumer.h>
 #include <linux/slab.h>
-#include <uapi/linux/uleds.h>
 
 #define LP8860_DISP_CL1_BRT_MSB		0x00
 #define LP8860_DISP_CL1_BRT_LSB		0x01
@@ -87,6 +86,8 @@
 
 #define LP8860_CLEAR_FAULTS		0x01
 
+#define LP8860_NAME			"lp8860"
+
 /**
  * struct lp8860_led -
  * @lock - Lock for reading/writing the device
@@ -96,7 +97,6 @@
  * @eeprom_regmap - EEPROM register map
  * @enable_gpio - VDDIO/EN gpio to enable communication interface
  * @regulator - LED supply regulator pointer
- * @label - LED label
  */
 struct lp8860_led {
 	struct mutex lock;
@@ -106,7 +106,6 @@ struct lp8860_led {
 	struct regmap *eeprom_regmap;
 	struct gpio_desc *enable_gpio;
 	struct regulator *regulator;
-	char label[LED_MAX_NAME_SIZE];
 };
 
 struct lp8860_eeprom_reg {
@@ -387,25 +386,19 @@ static int lp8860_probe(struct i2c_client *client,
 	struct lp8860_led *led;
 	struct device_node *np = client->dev.of_node;
 	struct device_node *child_node;
-	const char *name;
+	struct led_init_data init_data = {};
 
 	led = devm_kzalloc(&client->dev, sizeof(*led), GFP_KERNEL);
 	if (!led)
 		return -ENOMEM;
 
-	for_each_available_child_of_node(np, child_node) {
-		led->led_dev.default_trigger = of_get_property(child_node,
-						    "linux,default-trigger",
-						    NULL);
-
-		ret = of_property_read_string(child_node, "label", &name);
-		if (!ret)
-			snprintf(led->label, sizeof(led->label), "%s:%s",
-				 id->name, name);
-		else
-			snprintf(led->label, sizeof(led->label),
-				"%s::display_cluster", id->name);
-	}
+	child_node = of_get_next_available_child(np, NULL);
+	if (!child_node)
+		return -EINVAL;
+
+	led->led_dev.default_trigger = of_get_property(child_node,
+					    "linux,default-trigger",
+					    NULL);
 
 	led->enable_gpio = devm_gpiod_get_optional(&client->dev,
 						   "enable", GPIOD_OUT_LOW);
@@ -420,7 +413,6 @@ static int lp8860_probe(struct i2c_client *client,
 		led->regulator = NULL;
 
 	led->client = client;
-	led->led_dev.name = led->label;
 	led->led_dev.brightness_set_blocking = lp8860_brightness_set;
 
 	mutex_init(&led->lock);
@@ -447,7 +439,12 @@ static int lp8860_probe(struct i2c_client *client,
 	if (ret)
 		return ret;
 
-	ret = devm_led_classdev_register(&client->dev, &led->led_dev);
+	init_data.fwnode = of_fwnode_handle(child_node);
+	init_data.devicename = LP8860_NAME;
+	init_data.default_label = ":display_cluster";
+
+	ret = devm_led_classdev_register_ext(&client->dev, &led->led_dev,
+					     &init_data);
 	if (ret) {
 		dev_err(&client->dev, "led register err: %d\n", ret);
 		return ret;
-- 
2.11.0

