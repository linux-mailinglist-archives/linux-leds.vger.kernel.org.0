Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7DF92E2379
	for <lists+linux-leds@lfdr.de>; Thu, 24 Dec 2020 02:48:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728470AbgLXBsP (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 23 Dec 2020 20:48:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726288AbgLXBsP (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 23 Dec 2020 20:48:15 -0500
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CBF5C06179C;
        Wed, 23 Dec 2020 17:47:35 -0800 (PST)
Received: by mail-pf1-x42a.google.com with SMTP id t8so445030pfg.8;
        Wed, 23 Dec 2020 17:47:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=4grD7Th+x9uvL3+IHonwI2oI5c9zZZYb+5MfV4KDZ/E=;
        b=EjL5E9kMWETqsHTZwHEYdtXlpcGPHPRCvH1PjtnZpcSJsl5yoCyi89KVo/05rxUmqv
         gtvqq7uGkTwDlpqLNPsY/FOZ37aXh7Hefgm7iVocDBtzfv6YA7gaccGgAO6VqqAAznJM
         LBbQc2YINXB7NbsaDiZlVHY7dfvdndjNDsxCu7GqjYwijLEywo7cefYi7Kc/OAxdqbOV
         l0O2ylM39Dqc8UXuyirMpxNC9wKAXuecWww4fXaa4ez4Yf09diP7wosUqdUbxsbRb9Di
         Zbj0tJiG6a1nxSsD1V2UwIDzi8gAYVuBW0HcDCFea++zwJSp1zj0i1ruz8Kc0aQJao/D
         kb1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=4grD7Th+x9uvL3+IHonwI2oI5c9zZZYb+5MfV4KDZ/E=;
        b=Py+UKi5ETFPbRWOTzTsleBits3Dvf+F0U9TAoiTOPhX2Sad5zGe6glgihVwJAJMm2f
         6VHJED/3rOSALDLqsIlaSgzG4p1hl6hOxJvMX5wk5wXc8kor4GdPakzxdcL+gFjsYMqc
         TdA9nqk34oFzWVwNOtQy6EHDIqzCYPvQq3uRgdwRXckleZNKqm3+miuzaYW/oQxrUMmY
         eA8hw5uD41V0iY2JIiUeu6MEIUwV0apdVF42UVwEGCXcQF1mKzJCKgA/TawmT61A7DLX
         fsCsAaKlvQmaivdRePGwsMtjUAUyL4zylldIwbdS7yscFFMuQNfli2eXhOW83lnNfHLx
         NxiA==
X-Gm-Message-State: AOAM530cJJDYXI6Ng+YCOM2UZbXqZpvanFAD+XrqZctOt8Jq7WrdpeWn
        I1U7Y79dYIGxr1MRPoJzzDs=
X-Google-Smtp-Source: ABdhPJyByxxF0CjtLO9FmSSx8jJR9wTpt4c1zuxKIyqJsXUfOOUS4jcQAexO8WWWB6K/6Cwo8djkvQ==
X-Received: by 2002:a63:445a:: with SMTP id t26mr26780548pgk.402.1608774454681;
        Wed, 23 Dec 2020 17:47:34 -0800 (PST)
Received: from localhost.localdomain ([2402:7500:492:86cf:7e4a:b265:b394:eefd])
        by smtp.gmail.com with ESMTPSA id h16sm26604516pgd.62.2020.12.23.17.47.30
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 23 Dec 2020 17:47:34 -0800 (PST)
From:   Gene Chen <gene.chen.richtek@gmail.com>
To:     jacek.anaszewski@gmail.com, pavel@ucw.cz, robh+dt@kernel.org,
        matthias.bgg@gmail.com
Cc:     dmurphy@ti.com, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        gene_chen@richtek.com, Wilma.Wu@mediatek.com,
        shufan_lee@richtek.com, cy_huang@richtek.com,
        benjamin.chao@mediatek.com
Subject: [PATCH resend v13 1/5] leds: flash: Add flash registration with undefined CONFIG_LEDS_CLASS_FLASH
Date:   Thu, 24 Dec 2020 09:47:16 +0800
Message-Id: <1608774440-21655-2-git-send-email-gene.chen.richtek@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1608774440-21655-1-git-send-email-gene.chen.richtek@gmail.com>
References: <1608774440-21655-1-git-send-email-gene.chen.richtek@gmail.com>
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

