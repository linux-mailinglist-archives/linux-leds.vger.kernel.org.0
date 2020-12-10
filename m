Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5ED472D5394
	for <lists+linux-leds@lfdr.de>; Thu, 10 Dec 2020 07:04:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732901AbgLJGCb (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 10 Dec 2020 01:02:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727004AbgLJGCZ (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 10 Dec 2020 01:02:25 -0500
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A1D4C061793;
        Wed,  9 Dec 2020 22:01:45 -0800 (PST)
Received: by mail-pf1-x443.google.com with SMTP id d2so3035459pfq.5;
        Wed, 09 Dec 2020 22:01:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=4grD7Th+x9uvL3+IHonwI2oI5c9zZZYb+5MfV4KDZ/E=;
        b=gkGXerWDDA3tvkrgZg4BEvG6viwI789Ynn/xm8OyQRtkugou/GXF3z6jdSCs8NVC/r
         8uRz9LBLxUo5h+hIXOtWHxE4e/6Ur3IR7gBJ4Kf8BIhFHAtbuI82xZdANjhSLZmgtyZq
         zl4I0Hd7TpXPMlAiD01D+NC1oiuQGSdw01MPWXMxG1KGTgQMe024aTf/+YP9LISI9biS
         C7rR64jMWalq2oT+eW2rCCC2r3p0vre11naZkAYNPMp7H45tiODd2yWgyG9+owJ945h0
         UsknU8PBZeeM+binvxaOpN+7JZIq4RUj3Cwvt9grVH3pwUa5SJc9ZJSZfgzOP+nYArsf
         QsIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=4grD7Th+x9uvL3+IHonwI2oI5c9zZZYb+5MfV4KDZ/E=;
        b=Pyc5GN4ZyyElz6/kC4YkXY1lEUrXAoUZe/Lw4REnbDVxIr7A0BUHPcX6MAnRdInEN1
         K9Q5lLAfKj75oPrXiq2M5scrduOjZJ1tPHofQ8ZxCPdjCHC+aO2pxTc5WQt5uU1/yiB+
         Fq5YbJMrkv8q/ewv2VKzYXmV3A3rDwI/Jr/fV72KI1GPm+IerVX+AUPEpb6T+l85xPaG
         5iLbe/NbjM59316/QR+GGY+QWuwMZr/BbktE1ikM4c61O7MWdoU82Ty/obpeacycdAeI
         aNeOhe9qjzAJMufgGV7GrwQzfznbDId9DU4TnwJhPYDN/AQysxpqHsTVQNGNUNZArPe1
         U76w==
X-Gm-Message-State: AOAM5317X8g/P0jrP1+/4gN6Y7qGOwSjXzxpWbupA5l5cXfU7QCQJXXs
        CIJRDayifsrSNgGEpViT2AE=
X-Google-Smtp-Source: ABdhPJylx9gv5wJD+ibbPwIlScTAN+p7MZxuuPn+5hvZpZkpvRzeTP38ph01WnkNv1Ks/6nz1q03Rg==
X-Received: by 2002:a62:1a47:0:b029:19b:c093:2766 with SMTP id a68-20020a621a470000b029019bc0932766mr5436901pfa.10.1607580104907;
        Wed, 09 Dec 2020 22:01:44 -0800 (PST)
Received: from localhost.localdomain ([2402:7500:568:b3ad:229b:9ee7:b946:7876])
        by smtp.gmail.com with ESMTPSA id j19sm4355377pff.74.2020.12.09.22.01.39
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 09 Dec 2020 22:01:44 -0800 (PST)
From:   Gene Chen <gene.chen.richtek@gmail.com>
To:     jacek.anaszewski@gmail.com, pavel@ucw.cz, robh+dt@kernel.org,
        matthias.bgg@gmail.com
Cc:     dmurphy@ti.com, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        gene_chen@richtek.com, Wilma.Wu@mediatek.com,
        shufan_lee@richtek.com, cy_huang@richtek.com,
        benjamin.chao@mediatek.com
Subject: [PATCH v12 1/5] leds: flash: Add flash registration with undefined CONFIG_LEDS_CLASS_FLASH
Date:   Thu, 10 Dec 2020 14:00:53 +0800
Message-Id: <1607580057-4408-2-git-send-email-gene.chen.richtek@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1607580057-4408-1-git-send-email-gene.chen.richtek@gmail.com>
References: <1607580057-4408-1-git-send-email-gene.chen.richtek@gmail.com>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

From: Gene Chen <gene_chen@richtek.com>

Add flash registration with undefined CONFIG_LEDS_CLASS_FLASH,
and move the same registration functions outside of #ifdef block.

Signed-off-by: Gene Chen <gene_chen@richtek.com>
Acked-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
---
 include/linux/led-class-flash.h | 42 ++++++++++++++++++++++++++++++++---------
 1 file changed, 33 insertions(+), 9 deletions(-)

diff --git a/include/linux/led-class-flash.h b/include/linux/led-class-flash.h
index 21a3358..612b4ca 100644
--- a/include/linux/led-class-flash.h
+++ b/include/linux/led-class-flash.h
@@ -85,6 +85,7 @@ static inline struct led_classdev_flash *lcdev_to_flcdev(
 	return container_of(lcdev, struct led_classdev_flash, led_cdev);
 }
 
+#if IS_ENABLED(CONFIG_LEDS_CLASS_FLASH)
 /**
  * led_classdev_flash_register_ext - register a new object of LED class with
  *				     init data and with support for flash LEDs
@@ -98,12 +99,6 @@ int led_classdev_flash_register_ext(struct device *parent,
 				    struct led_classdev_flash *fled_cdev,
 				    struct led_init_data *init_data);
 
-static inline int led_classdev_flash_register(struct device *parent,
-					   struct led_classdev_flash *fled_cdev)
-{
-	return led_classdev_flash_register_ext(parent, fled_cdev, NULL);
-}
-
 /**
  * led_classdev_flash_unregister - unregisters an object of led_classdev class
  *				   with support for flash LEDs
@@ -118,15 +113,44 @@ int devm_led_classdev_flash_register_ext(struct device *parent,
 				     struct led_init_data *init_data);
 
 
+void devm_led_classdev_flash_unregister(struct device *parent,
+					struct led_classdev_flash *fled_cdev);
+
+#else
+
+static inline int led_classdev_flash_register_ext(struct device *parent,
+				    struct led_classdev_flash *fled_cdev,
+				    struct led_init_data *init_data)
+{
+	return 0;
+}
+
+static inline void led_classdev_flash_unregister(struct led_classdev_flash *fled_cdev) {};
+static inline int devm_led_classdev_flash_register_ext(struct device *parent,
+				     struct led_classdev_flash *fled_cdev,
+				     struct led_init_data *init_data)
+{
+	return 0;
+}
+
+static inline void devm_led_classdev_flash_unregister(struct device *parent,
+					struct led_classdev_flash *fled_cdev)
+{};
+
+#endif  /* IS_ENABLED(CONFIG_LEDS_CLASS_FLASH) */
+
+static inline int led_classdev_flash_register(struct device *parent,
+					   struct led_classdev_flash *fled_cdev)
+{
+	return led_classdev_flash_register_ext(parent, fled_cdev, NULL);
+}
+
 static inline int devm_led_classdev_flash_register(struct device *parent,
 				     struct led_classdev_flash *fled_cdev)
 {
 	return devm_led_classdev_flash_register_ext(parent, fled_cdev, NULL);
 }
 
-void devm_led_classdev_flash_unregister(struct device *parent,
-					struct led_classdev_flash *fled_cdev);
-
 /**
  * led_set_flash_strobe - setup flash strobe
  * @fled_cdev: the flash LED to set strobe on
-- 
2.7.4

