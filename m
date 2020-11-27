Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 48B532C5EFC
	for <lists+linux-leds@lfdr.de>; Fri, 27 Nov 2020 04:29:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388855AbgK0D3K (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 26 Nov 2020 22:29:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727037AbgK0D3K (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 26 Nov 2020 22:29:10 -0500
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04B27C0613D1;
        Thu, 26 Nov 2020 19:29:10 -0800 (PST)
Received: by mail-pg1-x544.google.com with SMTP id t37so3202793pga.7;
        Thu, 26 Nov 2020 19:29:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=COEm4ghbDKgbcUxg3aR1shfZUSf7tqGokicggJyh/18=;
        b=n+VrhTbdq6A1PHfZrcp3AriHw/pLkqG4tG9zWOzJLIcivAWhAxsgyC6quVBksFkFYO
         AeMOo+TA8ffNW6TQryGgIaszq1zkbbd3feMwx//mC1RiiN6L4Js5NrXdW+wGMasIMYH3
         LMJcqLOhOXIH2H7OfvFg7oj9ZwNqiNqs/sVSiIHToyUY+VCvdTTrdLhSCMqe/G4wMQaO
         3srAqKN3yJ0QRbVhgkgkRNNF1lrwnH6Oqf8BsgVczCRMYlUuAmZCfiH+VAiBPZaL7np8
         4Kx0eO1cfuUok0lzMEk79wi0bhRJPqtWfkmQmE4z8ifzxPrF3k+qoaC1EC1hYFXymSlJ
         PlFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=COEm4ghbDKgbcUxg3aR1shfZUSf7tqGokicggJyh/18=;
        b=XasV6HNPmLsbL4iLDVn1HXINSXHpqpBxoWi+3CUv0mrK9/EFgczZeLOCRliVhrCxXl
         NaUqBH3lpspNmn/bzE6MY7p4Gx168PMrj4Rp/kpGbyUe2ZOlz8enDda7Kj0gCyRp76VJ
         0nX64d0Xht4LakYcYLhXjQaXMKhIatH4qxd7ucM6zO13EmMnlPcbm8i9jzp3zxpxgk5T
         IiXPNMlKfD3hXZ32uXWJlZRmDQ5TDUPlRMBQBpVWgGJCpa8m0neITf2EItw5Ns4yljce
         TRXwUo1d+bSD5FDDMtP5zwLd0/6ipz8fBr8FXP8q2J7hIrSj3kjE0fL1BSc0IORnjbZD
         MnBw==
X-Gm-Message-State: AOAM530staYa9gAFP5z1zVlB2N8eoC+ZKomURXcRjvYOzz/j+9wHApGu
        jpKQKp5608p8A75V+LJg6hU=
X-Google-Smtp-Source: ABdhPJweoiNIUMUSj5R2uDgHAMqootGvrX3+C8pyaYEEyNjxrTVhF3OvyhH9niCWzgZ3EfsA/aNZKQ==
X-Received: by 2002:aa7:93bb:0:b029:198:2fb2:43d5 with SMTP id x27-20020aa793bb0000b02901982fb243d5mr5208244pff.27.1606447749627;
        Thu, 26 Nov 2020 19:29:09 -0800 (PST)
Received: from localhost.localdomain ([101.12.27.127])
        by smtp.gmail.com with ESMTPSA id m73sm6063962pfd.106.2020.11.26.19.29.05
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 26 Nov 2020 19:29:09 -0800 (PST)
From:   Gene Chen <gene.chen.richtek@gmail.com>
To:     jacek.anaszewski@gmail.com, pavel@ucw.cz, robh+dt@kernel.org,
        matthias.bgg@gmail.com
Cc:     dmurphy@ti.com, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        gene_chen@richtek.com, Wilma.Wu@mediatek.com,
        shufan_lee@richtek.com, cy_huang@richtek.com,
        benjamin.chao@mediatek.com
Subject: [PATCH v10 1/6] leds: flash: Add flash registration with undefined CONFIG_LEDS_CLASS_FLASH
Date:   Fri, 27 Nov 2020 11:28:51 +0800
Message-Id: <1606447736-7944-2-git-send-email-gene.chen.richtek@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1606447736-7944-1-git-send-email-gene.chen.richtek@gmail.com>
References: <1606447736-7944-1-git-send-email-gene.chen.richtek@gmail.com>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

From: Gene Chen <gene_chen@richtek.com>

Add flash registration with undefined CONFIG_LEDS_CLASS_FLASH,
and reuse same registration functions no matter flash class exist or not.

Signed-off-by: Gene Chen <gene_chen@richtek.com>
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

