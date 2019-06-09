Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C32A63AB6C
	for <lists+linux-leds@lfdr.de>; Sun,  9 Jun 2019 21:10:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730636AbfFITJE (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 9 Jun 2019 15:09:04 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:45013 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730607AbfFITJD (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 9 Jun 2019 15:09:03 -0400
Received: by mail-wr1-f66.google.com with SMTP id b17so6958433wrq.11;
        Sun, 09 Jun 2019 12:09:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=QdHNc4an0f/5FwrYZYHKmxbdNbnGMTXLO6NDwG9nRak=;
        b=ru9y+jYKa45z5SOlOduxdkrQ45nd9lnFvj4Hsr8m7A63Y8PnfAeX4VvqhNPawFoeB/
         uJEwVnzLOa5wjIFfm8QF27u5J3upvzKAW3Wx9g9J8Vwqyv6cqJv+A4fobWbX71Z/le1k
         JAgwpLkZ/BTCHVWBN/94zN3D+7/MJz4sq6E3EmeMB5r8KzwcSsYn7+pEmcN9K+5gQ8VK
         HHn8pm1a3dOJ9HH0V8lrmw0OI6r0V4aSvlL9IZx07rl0wI13OTWM3w3Szykp4dPJRa5u
         7OvIyb96VqPEn7IuH+KzgZl9HgrTT0tH46mSXnjbixv44wv+ZzWyLZbJrJRX24wgx9h7
         NLcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=QdHNc4an0f/5FwrYZYHKmxbdNbnGMTXLO6NDwG9nRak=;
        b=HehUm9u0HUeXj097lFlaDVOcTeVj5BigIzd3GKskHiNzUlAfwwOv6UNQM3/HfefA4u
         uw+PL3B2Mx5nNdAmA6tZjJmoHPxmqnnKtGxDCFzBq7qbEfmYOlt495n6kYh++yGma2nE
         ZjQmmdhn7Sqpkc6sbiXvE8dyfQmSTO21oIrQIFZ9wMlBkTTPJ9R6yVsCUjzEbK//3WEU
         KZJssQxS7Sh++dJgJirNJkfxVv1LC7m8pMNU4KJ8lpTDN14hGmlY55gBtEVEJ9NrjGQi
         UrXA0CvzMJCV9MqD97GiCUOLq5D9zAZiRMYH0fhVd38CFWvVPy006KZ2oG5t/Jp7BjgV
         qgDA==
X-Gm-Message-State: APjAAAUfNp3G5vpz8Dtvb0/OJerhF/1mNFo0N/7nfpSbg0yz89omweHj
        dRdmjYsDsBSk93xGgNAL8uR1evUp
X-Google-Smtp-Source: APXvYqxDbYSFK93qoeBNf1Y6bP0ZIhjR6fVtQs2kAQz8ZWrfchyBnsOVKuP5zdjHqx3oOBB587CTvA==
X-Received: by 2002:adf:fd8d:: with SMTP id d13mr7964379wrr.8.1560107341345;
        Sun, 09 Jun 2019 12:09:01 -0700 (PDT)
Received: from myhost.home (ckm12.neoplus.adsl.tpnet.pl. [83.31.88.12])
        by smtp.gmail.com with ESMTPSA id y38sm14725041wrd.41.2019.06.09.12.08.59
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 09 Jun 2019 12:09:00 -0700 (PDT)
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
To:     linux-leds@vger.kernel.org
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        pavel@ucw.cz, robh@kernel.org, dtor@google.com, linux@roeck-us.net,
        dmurphy@ti.com, jacek.anaszewski@gmail.com
Subject: [PATCH v5 19/26] leds: aat1290: Use generic support for composing LED names
Date:   Sun,  9 Jun 2019 21:07:56 +0200
Message-Id: <20190609190803.14815-20-jacek.anaszewski@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190609190803.14815-1-jacek.anaszewski@gmail.com>
References: <20190609190803.14815-1-jacek.anaszewski@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Switch to using generic LED support for composing LED class
device name.

After switching to new led_classdev_register_ext() the validity
of struct led_classdev's name property is no longer guaranteed,
and therefore rely on struct device's kobj.name instead.

Signed-off-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Acked-by: Pavel Machek <pavel@ucw.cz>
---
 drivers/leds/leds-aat1290.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/leds/leds-aat1290.c b/drivers/leds/leds-aat1290.c
index 43bd8a43f36c..d892a96fd1bd 100644
--- a/drivers/leds/leds-aat1290.c
+++ b/drivers/leds/leds-aat1290.c
@@ -45,6 +45,8 @@
 #define AAT1290_FLASH_TM_NUM_LEVELS	16
 #define AAT1290_MM_CURRENT_SCALE_SIZE	15
 
+#define AAT1290_NAME			"aat1290"
+
 
 struct aat1290_led_config_data {
 	/* maximum LED current in movie mode */
@@ -78,7 +80,6 @@ struct aat1290_led {
 	int *mm_current_scale;
 	/* device mode */
 	bool movie_mode;
-
 	/* brightness cache */
 	unsigned int torch_brightness;
 };
@@ -218,7 +219,6 @@ static int aat1290_led_parse_dt(struct aat1290_led *led,
 			struct aat1290_led_config_data *cfg,
 			struct device_node **sub_node)
 {
-	struct led_classdev *led_cdev = &led->fled_cdev.led_cdev;
 	struct device *dev = &led->pdev->dev;
 	struct device_node *child_node;
 #if IS_ENABLED(CONFIG_V4L2_FLASH_LED_CLASS)
@@ -257,9 +257,6 @@ static int aat1290_led_parse_dt(struct aat1290_led *led,
 		return -EINVAL;
 	}
 
-	led_cdev->name = of_get_property(child_node, "label", NULL) ? :
-						child_node->name;
-
 	ret = of_property_read_u32(child_node, "led-max-microamp",
 				&cfg->max_mm_current);
 	/*
@@ -431,7 +428,7 @@ static void aat1290_init_v4l2_flash_config(struct aat1290_led *led,
 	struct led_classdev *led_cdev = &led->fled_cdev.led_cdev;
 	struct led_flash_setting *s;
 
-	strlcpy(v4l2_sd_cfg->dev_name, led_cdev->name,
+	strlcpy(v4l2_sd_cfg->dev_name, led_cdev->dev->kobj.name,
 		sizeof(v4l2_sd_cfg->dev_name));
 
 	s = &v4l2_sd_cfg->intensity;
@@ -469,6 +466,7 @@ static int aat1290_led_probe(struct platform_device *pdev)
 	struct aat1290_led *led;
 	struct led_classdev *led_cdev;
 	struct led_classdev_flash *fled_cdev;
+	struct led_init_data init_data = {};
 	struct aat1290_led_config_data led_cfg = {};
 	struct v4l2_flash_config v4l2_sd_cfg = {};
 	int ret;
@@ -497,8 +495,12 @@ static int aat1290_led_probe(struct platform_device *pdev)
 
 	aat1290_init_flash_timeout(led, &led_cfg);
 
+	init_data.fwnode = of_fwnode_handle(sub_node);
+	init_data.devicename = AAT1290_NAME;
+
 	/* Register LED Flash class device */
-	ret = led_classdev_flash_register(&pdev->dev, fled_cdev);
+	ret = led_classdev_flash_register_ext(&pdev->dev, fled_cdev,
+					      &init_data);
 	if (ret < 0)
 		goto err_flash_register;
 
-- 
2.11.0

