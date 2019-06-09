Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CEE823AB6A
	for <lists+linux-leds@lfdr.de>; Sun,  9 Jun 2019 21:10:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730542AbfFITI7 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 9 Jun 2019 15:08:59 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:33272 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730367AbfFITI7 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 9 Jun 2019 15:08:59 -0400
Received: by mail-wr1-f65.google.com with SMTP id n9so7018764wru.0;
        Sun, 09 Jun 2019 12:08:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Z2eH+3/86F7l26OXjPtVzBX++Fh8MEXdrET9Il+DCLQ=;
        b=GwzGRTDWLjhPT3moaYmOv2coVV9+ArjxYA9Jg8jMKpt0uIc4hUu8kKhfoXCk7b8jhl
         vsLU3Y/36mNP+rj1dJa62ufqhrildmBDjIMGx2sdfSJzsXioxLGctGyvTXRDMqpba2/h
         thMd7ULOWwRFG46GEHYjsQKSFeLgHBjdVMR5lrTtLpKCa3DK0cstrEAw5GrZ6kVLl61w
         6B9BBG1aSV5sVRW93S3CDkjM9Xnq/Cb0NnqPeNT4ExU2lbILx5KaVObUf1nbzYbWul5T
         lMORAoQYh+UAV2TVr0nJdqByWaR2Jvmgg73TuCQKdGh/QJ3biqkTXR6es+qwEzOH1Lsd
         N9YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Z2eH+3/86F7l26OXjPtVzBX++Fh8MEXdrET9Il+DCLQ=;
        b=Dwa9VUYUyvj0vLqpwbKQMCFlUqUUYfcB49SfNDfTGUfSzHDyF5+KQA4nN3yZgyQfdW
         ComHd7ijZbweWR9D4nzvMv8N7VuH2BBmfPhPZXENcNzjVo8iuEV3dGMr5JGwJ8+CLPJS
         Y6jsSfhgn5rFmB2tPOs0I0MjfTOXuDmIotT9+2XWugfj7Qu42ZQYDppyy4DWNPSQw23+
         kil+c62+48pwmOHvj+o0oFh5aEQXpBHcuOR8N3X/ijY4BLLfvyGddu7OFvV6+CkbzgNt
         QEGrpFjEhI0t732duTS1fdwmj2n7KyR7XkPOe1S3iAXNG98KoHlEROxYXjM0c/4YEKok
         1zvQ==
X-Gm-Message-State: APjAAAUMMNYyjt8GdlZVMJJfLWJdhhsILbXHD3EOCvBuGAUjTlOZzvAU
        f2hxap4g1mziLoUpUEymDlVzEBX1
X-Google-Smtp-Source: APXvYqwIknc6FYFCm0U+sVb6eRFWTG5vGcqGjB3rgxsr+kwYonwshCjeWqQ6xR1OJRAqjxDB6T/7uw==
X-Received: by 2002:a5d:4cc3:: with SMTP id c3mr15668352wrt.259.1560107336873;
        Sun, 09 Jun 2019 12:08:56 -0700 (PDT)
Received: from myhost.home (ckm12.neoplus.adsl.tpnet.pl. [83.31.88.12])
        by smtp.gmail.com with ESMTPSA id y38sm14725041wrd.41.2019.06.09.12.08.55
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 09 Jun 2019 12:08:56 -0700 (PDT)
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
To:     linux-leds@vger.kernel.org
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        pavel@ucw.cz, robh@kernel.org, dtor@google.com, linux@roeck-us.net,
        dmurphy@ti.com, jacek.anaszewski@gmail.com,
        Oleh Kravchenko <oleg@kaa.org.ua>
Subject: [PATCH v5 17/26] leds: cr0014114: Use generic support for composing LED names
Date:   Sun,  9 Jun 2019 21:07:54 +0200
Message-Id: <20190609190803.14815-18-jacek.anaszewski@gmail.com>
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
Cc: Oleh Kravchenko <oleg@kaa.org.ua>
Acked-by: Pavel Machek <pavel@ucw.cz>
---
 drivers/leds/leds-cr0014114.c | 32 +++++++++++---------------------
 1 file changed, 11 insertions(+), 21 deletions(-)

diff --git a/drivers/leds/leds-cr0014114.c b/drivers/leds/leds-cr0014114.c
index 1c82152764d2..2da448ae718e 100644
--- a/drivers/leds/leds-cr0014114.c
+++ b/drivers/leds/leds-cr0014114.c
@@ -8,7 +8,6 @@
 #include <linux/of_device.h>
 #include <linux/spi/spi.h>
 #include <linux/workqueue.h>
-#include <uapi/linux/uleds.h>
 
 /*
  *  CR0014114 SPI protocol descrtiption:
@@ -40,8 +39,9 @@
 #define CR_FW_DELAY_MSEC	10
 #define CR_RECOUNT_DELAY	(HZ * 3600)
 
+#define CR_DEV_NAME		"cr0014114"
+
 struct cr0014114_led {
-	char			name[LED_MAX_NAME_SIZE];
 	struct cr0014114	*priv;
 	struct led_classdev	ldev;
 	u8			brightness;
@@ -167,8 +167,7 @@ static int cr0014114_set_sync(struct led_classdev *ldev,
 						    struct cr0014114_led,
 						    ldev);
 
-	dev_dbg(led->priv->dev, "Set brightness of %s to %d\n",
-		led->name, brightness);
+	dev_dbg(led->priv->dev, "Set brightness to %d\n", brightness);
 
 	mutex_lock(&led->priv->lock);
 	led->brightness = (u8)brightness;
@@ -183,41 +182,32 @@ static int cr0014114_probe_dt(struct cr0014114 *priv)
 	size_t			i = 0;
 	struct cr0014114_led	*led;
 	struct fwnode_handle	*child;
-	struct device_node	*np;
+	struct led_init_data	init_data = {};
 	int			ret;
-	const char		*str;
 
 	device_for_each_child_node(priv->dev, child) {
-		np = to_of_node(child);
 		led = &priv->leds[i];
 
-		ret = fwnode_property_read_string(child, "label", &str);
-		if (ret)
-			snprintf(led->name, sizeof(led->name),
-				 "cr0014114::");
-		else
-			snprintf(led->name, sizeof(led->name),
-				 "cr0014114:%s", str);
-
 		fwnode_property_read_string(child, "linux,default-trigger",
 					    &led->ldev.default_trigger);
 
 		led->priv			  = priv;
-		led->ldev.name			  = led->name;
 		led->ldev.max_brightness	  = CR_MAX_BRIGHTNESS;
 		led->ldev.brightness_set_blocking = cr0014114_set_sync;
 
-		ret = devm_led_classdev_register(priv->dev, &led->ldev);
+		init_data.fwnode = child;
+		init_data.devicename = CR_DEV_NAME;
+		init_data.default_label = ":";
+
+		ret = devm_led_classdev_register_ext(priv->dev, &led->ldev,
+						     &init_data);
 		if (ret) {
 			dev_err(priv->dev,
-				"failed to register LED device %s, err %d",
-				led->name, ret);
+				"failed to register LED device, err %d", ret);
 			fwnode_handle_put(child);
 			return ret;
 		}
 
-		led->ldev.dev->of_node = np;
-
 		i++;
 	}
 
-- 
2.11.0

