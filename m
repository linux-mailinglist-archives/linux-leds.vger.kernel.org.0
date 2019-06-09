Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E42E53AB66
	for <lists+linux-leds@lfdr.de>; Sun,  9 Jun 2019 21:10:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730438AbfFITIx (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 9 Jun 2019 15:08:53 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:33514 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730367AbfFITIw (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 9 Jun 2019 15:08:52 -0400
Received: by mail-wm1-f67.google.com with SMTP id h19so7576825wme.0;
        Sun, 09 Jun 2019 12:08:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=syrjFnIWviazPR6lJeBGQDU7BxIerQba1dStKQmEHzA=;
        b=gkkWLCcXD0x4MtILb3QGrqp+lq0jgNkz/bhmBiNs3Jyl0z9wZLgqZEPWIuttSItJ+u
         alD4T03e8NYi05ImcpDDhR9n6PywILbXXIeKdmP+uovP9CBKiaqk6CgUyTE6nAYr96Of
         z2vdfC7iCudNb83QeSMu1Nb1KrJT4Dh9DgupFAxpDSf2wP43hG3k9xBsB5SfLoNkusuG
         0jmw7ryiyQG/SDAAex8PpOzuJMAmRUb1KnU2OXdJiTEgiKFNyadDxX9KQ3otKk7yD4vT
         KAraLVwNWOdy4BGxlmUg1eisp/9m133Ot+evP6tq39JAG7bESO+lHY3vPW4LArSYQeCo
         tJow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=syrjFnIWviazPR6lJeBGQDU7BxIerQba1dStKQmEHzA=;
        b=Q47O0edTyG1Z1UYs53feiZlfdjonJgdf52Rp7lsdW0jIYQAUmb964cykuAZJCT4ahU
         gyl8BvUlU/jqtEuJV9yxZM3dsUszDFwKb9YVKYjt8vt9Ef67rmlnzvzXlCWsSivytHwh
         YsFZIK4AA0ZO1sZqolBIVujXZBHAqO/qvrKy+lozyMjePOYhzhGV0ta/l36Qo3KjISFJ
         NUbUKSWpT9SMhLNfHvGJgmER7Gp+4fGLAtX+hcgNhVv6YQLQZkg9XbDHVvhPkVHO/BxT
         /QZZbU+q5JGoj7aMGrD0OBcnPybKfh5YX/D2SwXrhvc8tgsk/9lIlx64+lG0/7ehb7L9
         SpfA==
X-Gm-Message-State: APjAAAXHv2D4eLIzpPR/UgbB9Vt6pF6ZG9D5t97bvpHZEy9/0vySz5ps
        gjBPVVau5FGf9yNKvswqv4uAGwcS
X-Google-Smtp-Source: APXvYqz8Jup2vXWGV5HIGXBZPaE0UOV8rFvWq5ImGr4lKnc4NgM/rBqef2kTQ3m5JD4EDQNjcwtsCQ==
X-Received: by 2002:a1c:208c:: with SMTP id g134mr10974994wmg.112.1560107329904;
        Sun, 09 Jun 2019 12:08:49 -0700 (PDT)
Received: from myhost.home (ckm12.neoplus.adsl.tpnet.pl. [83.31.88.12])
        by smtp.gmail.com with ESMTPSA id y38sm14725041wrd.41.2019.06.09.12.08.48
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 09 Jun 2019 12:08:49 -0700 (PDT)
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
To:     linux-leds@vger.kernel.org
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        pavel@ucw.cz, robh@kernel.org, dtor@google.com, linux@roeck-us.net,
        dmurphy@ti.com, jacek.anaszewski@gmail.com
Subject: [PATCH v5 13/26] leds: lm3692x: Use generic support for composing LED names
Date:   Sun,  9 Jun 2019 21:07:50 +0200
Message-Id: <20190609190803.14815-14-jacek.anaszewski@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190609190803.14815-1-jacek.anaszewski@gmail.com>
References: <20190609190803.14815-1-jacek.anaszewski@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Switch to using generic LED support for composing LED class
device name.

At this occassion remove initialization of struct led_classdev's
dev->of_node property in the driver, since now it will be taken from
fwnode assigned to struct led_init_data and passed to the new
devm_led_classdev_register_ext() API.

Signed-off-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Tested-by: Dan Murphy <dmurphy@ti.com>
Acked-by: Pavel Machek <pavel@ucw.cz>
---
 drivers/leds/leds-lm3692x.c | 22 ++++++----------------
 1 file changed, 6 insertions(+), 16 deletions(-)

diff --git a/drivers/leds/leds-lm3692x.c b/drivers/leds/leds-lm3692x.c
index 4f413a7c5f05..3d381f2f73d0 100644
--- a/drivers/leds/leds-lm3692x.c
+++ b/drivers/leds/leds-lm3692x.c
@@ -13,7 +13,6 @@
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
 #include <linux/slab.h>
-#include <uapi/linux/uleds.h>
 
 #define LM36922_MODEL	0
 #define LM36923_MODEL	1
@@ -103,7 +102,6 @@
  * @regmap - Devices register map
  * @enable_gpio - VDDIO/EN gpio to enable communication interface
  * @regulator - LED supply regulator pointer
- * @label - LED label
  * @led_enable - LED sync to be enabled
  * @model_id - Current device model ID enumerated
  */
@@ -114,7 +112,6 @@ struct lm3692x_led {
 	struct regmap *regmap;
 	struct gpio_desc *enable_gpio;
 	struct regulator *regulator;
-	char label[LED_MAX_NAME_SIZE];
 	int led_enable;
 	int model_id;
 };
@@ -325,7 +322,7 @@ static int lm3692x_init(struct lm3692x_led *led)
 static int lm3692x_probe_dt(struct lm3692x_led *led)
 {
 	struct fwnode_handle *child = NULL;
-	const char *name;
+	struct led_init_data init_data = {};
 	int ret;
 
 	led->enable_gpio = devm_gpiod_get_optional(&led->client->dev,
@@ -350,30 +347,23 @@ static int lm3692x_probe_dt(struct lm3692x_led *led)
 	fwnode_property_read_string(child, "linux,default-trigger",
 				    &led->led_dev.default_trigger);
 
-	ret = fwnode_property_read_string(child, "label", &name);
-	if (ret)
-		snprintf(led->label, sizeof(led->label),
-			"%s::", led->client->name);
-	else
-		snprintf(led->label, sizeof(led->label),
-			 "%s:%s", led->client->name, name);
-
 	ret = fwnode_property_read_u32(child, "reg", &led->led_enable);
 	if (ret) {
 		dev_err(&led->client->dev, "reg DT property missing\n");
 		return ret;
 	}
 
-	led->led_dev.name = led->label;
+	init_data.fwnode = child;
+	init_data.devicename = led->client->name;
+	init_data.default_label = ":";
 
-	ret = devm_led_classdev_register(&led->client->dev, &led->led_dev);
+	ret = devm_led_classdev_register_ext(&led->client->dev, &led->led_dev,
+					     &init_data);
 	if (ret) {
 		dev_err(&led->client->dev, "led register err: %d\n", ret);
 		return ret;
 	}
 
-	led->led_dev.dev->of_node = to_of_node(child);
-
 	return 0;
 }
 
-- 
2.11.0

