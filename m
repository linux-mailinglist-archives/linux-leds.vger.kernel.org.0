Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 240773AB7F
	for <lists+linux-leds@lfdr.de>; Sun,  9 Jun 2019 21:10:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731123AbfFITJx (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 9 Jun 2019 15:09:53 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:46133 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730458AbfFITIz (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 9 Jun 2019 15:08:55 -0400
Received: by mail-wr1-f67.google.com with SMTP id n4so6933172wrw.13;
        Sun, 09 Jun 2019 12:08:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Zb0S+kv68PgG+pBeAnbaHOnFNrsLe1KdA3qhUfCq5K0=;
        b=D8GCkkr4TkYAWnJp+fnC2QxWsMtm21fqIolXl29pd3lXnNi1M4Wf0t69fxgb/Txjzl
         Cr6zrl0DJUiat6+rb3MEvsyiZPLdBM1ZEnhEtYiEPAbd9eONhVFyjcrafE/mZW/SAd4M
         UGTXzJOHeOwN7lOeJDirvQo1lyZUUUyFEo9tMkIlYKIaSB2d4BQR+SLHfmnH+o8j/ca5
         vr3jyDRGDqaE2RFEPy0OQdjclf8Wb90q0UvL37BoQ6wBFBB/X3hdw04t+z+mRxwoP6y8
         sydWTYSTgicOAK7UJz8bDWINM1UZoNqhCTeVMXs3R1CjmCI19ndxLyEo58ZuV4w0UtI4
         wm0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Zb0S+kv68PgG+pBeAnbaHOnFNrsLe1KdA3qhUfCq5K0=;
        b=mYeGvh8PfUDjBqdzcpg75lJNI1knCkGFfuAwtnnoXYkBggq7+uG6sKEp4As/mNnOB9
         pC56v5MuIgr6Sibx4Eqxea69ESh3nSc2KbxDCtQCuMATvnH+zTzGcX8qGzN+Z1m/da6Z
         OfnwUg5MVzBYbyZ8owFQAlWA8k6FfLdmw4MWC5Ufk4qq3MkhjC2h1IcdCvQTJ4jWZ71U
         csXqRvJIczn2ZlLTXGtCLccQFLmVpCVQfr2HPzb6sTW8fJpYadIgEeDwxgK+GDNzxNlO
         1KpdlbGcHD0NzSb7V+F25jteTkgGMW6Qab85Im/y+LyJb7hN9iwwIPqmnCf0N1H7e+xT
         E6RQ==
X-Gm-Message-State: APjAAAWropQG2zoSyRapxNDANxHz/JXxK50FT1hfpw8KaW9DOED8TGAD
        lwPGcliIEHUl6XlA4U0P0lZSB6KQ
X-Google-Smtp-Source: APXvYqxgqa1sgXG5QifVLCgk8f+hLZi8WDJ8H2OUiCz7Fpi//WZD0o7FxCJevrYhhBoeZCG/C1kHEQ==
X-Received: by 2002:a05:6000:1289:: with SMTP id f9mr3775360wrx.125.1560107333026;
        Sun, 09 Jun 2019 12:08:53 -0700 (PDT)
Received: from myhost.home (ckm12.neoplus.adsl.tpnet.pl. [83.31.88.12])
        by smtp.gmail.com with ESMTPSA id y38sm14725041wrd.41.2019.06.09.12.08.51
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 09 Jun 2019 12:08:52 -0700 (PDT)
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
To:     linux-leds@vger.kernel.org
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        pavel@ucw.cz, robh@kernel.org, dtor@google.com, linux@roeck-us.net,
        dmurphy@ti.com, jacek.anaszewski@gmail.com
Subject: [PATCH v5 15/26] leds: lm3601x: Use generic support for composing LED names
Date:   Sun,  9 Jun 2019 21:07:52 +0200
Message-Id: <20190609190803.14815-16-jacek.anaszewski@gmail.com>
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
Tested-by: Dan Murphy <dmurphy@ti.com>
Acked-by: Pavel Machek <pavel@ucw.cz>
---
 drivers/leds/leds-lm3601x.c | 38 +++++++++++++++++---------------------
 1 file changed, 17 insertions(+), 21 deletions(-)

diff --git a/drivers/leds/leds-lm3601x.c b/drivers/leds/leds-lm3601x.c
index 081aa71e43a3..b02972f1a341 100644
--- a/drivers/leds/leds-lm3601x.c
+++ b/drivers/leds/leds-lm3601x.c
@@ -10,7 +10,6 @@
 #include <linux/module.h>
 #include <linux/regmap.h>
 #include <linux/slab.h>
-#include <uapi/linux/uleds.h>
 
 #define LM3601X_LED_IR		0x0
 #define LM3601X_LED_TORCH	0x1
@@ -90,8 +89,6 @@ struct lm3601x_led {
 	struct regmap *regmap;
 	struct mutex lock;
 
-	char led_name[LED_MAX_NAME_SIZE];
-
 	unsigned int flash_timeout;
 	unsigned int last_flag;
 
@@ -322,10 +319,12 @@ static const struct led_flash_ops flash_ops = {
 	.fault_get		= lm3601x_flash_fault_get,
 };
 
-static int lm3601x_register_leds(struct lm3601x_led *led)
+static int lm3601x_register_leds(struct lm3601x_led *led,
+				 struct fwnode_handle *fwnode)
 {
 	struct led_classdev *led_cdev;
 	struct led_flash_setting *setting;
+	struct led_init_data init_data = {};
 
 	led->fled_cdev.ops = &flash_ops;
 
@@ -342,20 +341,25 @@ static int lm3601x_register_leds(struct lm3601x_led *led)
 	setting->val = led->flash_current_max;
 
 	led_cdev = &led->fled_cdev.led_cdev;
-	led_cdev->name = led->led_name;
 	led_cdev->brightness_set_blocking = lm3601x_brightness_set;
 	led_cdev->max_brightness = DIV_ROUND_UP(led->torch_current_max,
 						LM3601X_TORCH_REG_DIV);
 	led_cdev->flags |= LED_DEV_CAP_FLASH;
 
-	return led_classdev_flash_register(&led->client->dev, &led->fled_cdev);
+	init_data.fwnode = fwnode;
+	init_data.devicename = led->client->name;
+	init_data.default_label = (led->led_mode == LM3601X_LED_TORCH) ?
+					"torch" : "infrared";
+
+	return led_classdev_flash_register_ext(&led->client->dev,
+						&led->fled_cdev, &init_data);
 }
 
-static int lm3601x_parse_node(struct lm3601x_led *led)
+static int lm3601x_parse_node(struct lm3601x_led *led,
+			      struct fwnode_handle **fwnode)
 {
 	struct fwnode_handle *child = NULL;
 	int ret = -ENODEV;
-	const char *name;
 
 	child = device_get_next_child_node(&led->client->dev, child);
 	if (!child) {
@@ -376,17 +380,6 @@ static int lm3601x_parse_node(struct lm3601x_led *led)
 		goto out_err;
 	}
 
-	ret = fwnode_property_read_string(child, "label", &name);
-	if (ret) {
-		if (led->led_mode == LM3601X_LED_TORCH)
-			name = "torch";
-		else
-			name = "infrared";
-	}
-
-	snprintf(led->led_name, sizeof(led->led_name),
-		"%s:%s", led->client->name, name);
-
 	ret = fwnode_property_read_u32(child, "led-max-microamp",
 					&led->torch_current_max);
 	if (ret) {
@@ -411,6 +404,8 @@ static int lm3601x_parse_node(struct lm3601x_led *led)
 		goto out_err;
 	}
 
+	*fwnode = child;
+
 out_err:
 	fwnode_handle_put(child);
 	return ret;
@@ -419,6 +414,7 @@ static int lm3601x_parse_node(struct lm3601x_led *led)
 static int lm3601x_probe(struct i2c_client *client)
 {
 	struct lm3601x_led *led;
+	struct fwnode_handle *fwnode;
 	int ret;
 
 	led = devm_kzalloc(&client->dev, sizeof(*led), GFP_KERNEL);
@@ -428,7 +424,7 @@ static int lm3601x_probe(struct i2c_client *client)
 	led->client = client;
 	i2c_set_clientdata(client, led);
 
-	ret = lm3601x_parse_node(led);
+	ret = lm3601x_parse_node(led, &fwnode);
 	if (ret)
 		return -ENODEV;
 
@@ -442,7 +438,7 @@ static int lm3601x_probe(struct i2c_client *client)
 
 	mutex_init(&led->lock);
 
-	return lm3601x_register_leds(led);
+	return lm3601x_register_leds(led, fwnode);
 }
 
 static int lm3601x_remove(struct i2c_client *client)
-- 
2.11.0

