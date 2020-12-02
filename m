Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C28932CBAF2
	for <lists+linux-leds@lfdr.de>; Wed,  2 Dec 2020 11:50:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388642AbgLBKrn (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 2 Dec 2020 05:47:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728747AbgLBKrn (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 2 Dec 2020 05:47:43 -0500
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB98DC0613D6;
        Wed,  2 Dec 2020 02:47:02 -0800 (PST)
Received: by mail-pj1-x1041.google.com with SMTP id r9so785645pjl.5;
        Wed, 02 Dec 2020 02:47:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=4grD7Th+x9uvL3+IHonwI2oI5c9zZZYb+5MfV4KDZ/E=;
        b=NbrG0HmRxUlFj01zCj+adifxjH851sNK+NABxKu5JOC36B/1HLW7UIQ3wA03x4b+m9
         QUkJK90CK6fXT5lkVQFCmDqKc8mQP3bcilYM/6RMZ0YfjueA2c4zSdbrllmI1FAFcwlN
         plZ0dzQc8TfGYPghz+rm4NO+AWqLW2dd9syOXarD2GulJwTpIbxjvQ1f3FYZzZSwPbyF
         5j1M/3CGw66tpHOp17JnhgZn3mTk7txZji2/RjF3H5RlYjCLxMrZDfrJ+kZVl4doxKra
         ViUHiyOsuqXf6FTiLy0tT7y6zDr57zo33jzBKKcuQdzZNK8ZgFWjm4wuPZ2KuxCXMrdI
         king==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=4grD7Th+x9uvL3+IHonwI2oI5c9zZZYb+5MfV4KDZ/E=;
        b=KYCQEr0hBd8M5hvnJdRRVp1tsJqSzhnjQdG92sEmn+oZ9A8gtLZXHf+FzcREchzYks
         KQAR3sIuFpB8NPJuW2YOL65hiVP/ucihco3kSS5jiAzsUoiVxQHBsUjmROf7e4QLtMCu
         ZF2Q8hZBFhklmEiMjarIsu9zsZ6CUsZx/nyelu6BH6M6P+YYkttRY3TpzRt+IWhNE8XJ
         Had86/4uaHEKOmIfGDiUjzxat0vlvDJD7dWW8pH+ebE/Di2Vq9XElCV+P0S6C1XTOwd3
         QJXIl8Qk5yDBVc7KZzDclCkBzQ6/Ann+79hgtcE7ve0vIETVonIFQFngJ4vX864y++/T
         6l9g==
X-Gm-Message-State: AOAM530XDkG6vHT2EHUgon2vpSbcD3czxTlAYor49MF59dX53emjCSOh
        +EhxgSOXCEsRrJL+n71PRU67SHv7xr94Ww==
X-Google-Smtp-Source: ABdhPJw/B4TIQ1bEUAq8yNpgeFKDVh2BkooOMI6EB/ae4bRBYDMQcFYzjNU+uEjwWpNtEiQxs+mBKw==
X-Received: by 2002:a17:902:7d94:b029:da:53c:f7cb with SMTP id a20-20020a1709027d94b02900da053cf7cbmr1942874plm.69.1606906022553;
        Wed, 02 Dec 2020 02:47:02 -0800 (PST)
Received: from localhost.localdomain ([2402:7500:561:5929:abfa:5e69:aaf7:6f59])
        by smtp.gmail.com with ESMTPSA id e14sm1648109pjt.17.2020.12.02.02.46.58
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 02 Dec 2020 02:47:02 -0800 (PST)
From:   Gene Chen <gene.chen.richtek@gmail.com>
To:     jacek.anaszewski@gmail.com, pavel@ucw.cz, robh+dt@kernel.org,
        matthias.bgg@gmail.com
Cc:     dmurphy@ti.com, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        gene_chen@richtek.com, Wilma.Wu@mediatek.com,
        shufan_lee@richtek.com, cy_huang@richtek.com,
        benjamin.chao@mediatek.com
Subject: [PATCH v11 1/5] leds: flash: Add flash registration with undefined CONFIG_LEDS_CLASS_FLASH
Date:   Wed,  2 Dec 2020 18:46:47 +0800
Message-Id: <1606906011-25633-2-git-send-email-gene.chen.richtek@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1606906011-25633-1-git-send-email-gene.chen.richtek@gmail.com>
References: <1606906011-25633-1-git-send-email-gene.chen.richtek@gmail.com>
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

