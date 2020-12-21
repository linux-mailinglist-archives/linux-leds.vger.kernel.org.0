Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7AEA92DFB31
	for <lists+linux-leds@lfdr.de>; Mon, 21 Dec 2020 11:53:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725954AbgLUKwZ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 21 Dec 2020 05:52:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725807AbgLUKwY (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 21 Dec 2020 05:52:24 -0500
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC55EC0613D6;
        Mon, 21 Dec 2020 02:51:44 -0800 (PST)
Received: by mail-pg1-x529.google.com with SMTP id z21so6135281pgj.4;
        Mon, 21 Dec 2020 02:51:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=4grD7Th+x9uvL3+IHonwI2oI5c9zZZYb+5MfV4KDZ/E=;
        b=OuyMMqDuTq2byb20apbddLdGFxSeRNXUBWUDt7ZPrUCwmfuGJvSwkqN3XHSILxNH5o
         TgGkd4Uv/Acian7iXIwlICc3cI1kiRYP+DOPyoNWCvIu/CQm56a9h1q2tpGWPDOu/IR1
         NL+HuhEgYD+cRXwayONn9n8WDTXYu4Y6EZ/26Bzt04piTgCKQ1T7IZXokLQK3ca6eNQn
         GtJ97so95DVzQh4a7Noop5WBYganYhbd0hsB2qvghEfFTkcLA3rZGlmAaIxJByLmYrfD
         SVknbsZ3+W/IxipsBjJ0p7Eess1TigPDPJXzQiADFUAHUXa5lMmY7C4Wi7clzgByZcrA
         oiiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=4grD7Th+x9uvL3+IHonwI2oI5c9zZZYb+5MfV4KDZ/E=;
        b=CScE/81cJnSMQLsszueF+Fd4EeaWMLSnsdYMlxAAnsPB5vD0Rb1HtIiqwXXD2rDkD4
         MxgF4c3mefrsbsmW3Ln7VvFt3yYN8rVXkpnJ8nD/f31vuZs6XKy/QUqA1Wc+LbH94VSJ
         by8vEIH5cEf6kpcQXhR8bsEijU4I8nGxk7VCpVR0OiZr+flh6ULQhIpXONnrFBQl954j
         D9ZFYA+TSu3aON5VbjfSTDsXMM7sbZINUC9x1xs7GV3TEdEEOxJNTx1EURqdvdg2Mbbw
         Rqn/KBUsbUgv2X9/0tcB6YSfwfHBDJyANN931O/r9eyQ1RlqvxSHkxJ+Z/22+JgNyWfc
         Z8EA==
X-Gm-Message-State: AOAM533kEDjDlCAm/RNjO52ZDyTbmsTRpiTeSFZ3jVWRGDn1fMMyzjyv
        gzu8LfLifCohI+W++APNeZA=
X-Google-Smtp-Source: ABdhPJzCYGc96On1kM36O56w2EfkcKMVZf181RyVdsehYq9EChXmuL3srhM7ukO5JFLhMB53cL1Kfg==
X-Received: by 2002:a63:e108:: with SMTP id z8mr11633102pgh.363.1608547904359;
        Mon, 21 Dec 2020 02:51:44 -0800 (PST)
Received: from localhost.localdomain ([2402:7500:469:a113:4308:e075:646d:7374])
        by smtp.gmail.com with ESMTPSA id p4sm15364193pjl.30.2020.12.21.02.51.40
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 21 Dec 2020 02:51:43 -0800 (PST)
From:   Gene Chen <gene.chen.richtek@gmail.com>
To:     jacek.anaszewski@gmail.com, pavel@ucw.cz, robh+dt@kernel.org,
        matthias.bgg@gmail.com
Cc:     dmurphy@ti.com, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        gene_chen@richtek.com, Wilma.Wu@mediatek.com,
        shufan_lee@richtek.com, cy_huang@richtek.com,
        benjamin.chao@mediatek.com
Subject: [PATCH v13 1/5] leds: flash: Add flash registration with undefined CONFIG_LEDS_CLASS_FLASH
Date:   Mon, 21 Dec 2020 18:45:50 +0800
Message-Id: <1608547554-6602-2-git-send-email-gene.chen.richtek@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1608547554-6602-1-git-send-email-gene.chen.richtek@gmail.com>
References: <1608547554-6602-1-git-send-email-gene.chen.richtek@gmail.com>
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

