Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB9772B7BBB
	for <lists+linux-leds@lfdr.de>; Wed, 18 Nov 2020 11:49:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727829AbgKRKsX (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 18 Nov 2020 05:48:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727825AbgKRKsX (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 18 Nov 2020 05:48:23 -0500
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD1DEC0613D4;
        Wed, 18 Nov 2020 02:48:22 -0800 (PST)
Received: by mail-pg1-x541.google.com with SMTP id t21so934262pgl.3;
        Wed, 18 Nov 2020 02:48:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=FV/lAkBucS5LQIPKPYGSp0NZnz+d0fTaTfxhBzUFBmg=;
        b=rx53iFEbW3I/q2gRtazSrThT860eG+V9HPo8HUIDdfrfXp/BYCFjI5ARhOSoTZZQQE
         jTFqM2jjWKuVHzcqw7eKwSMMHi1ir4O/ZcvSQDsvnnT4JyzKEP/ms0IAkDRBeLqKNDV+
         L/xQOUP6usmIzuPcn7gZrAdIR8RpyWtU1oXafS6WyKpipY+MYLAE4STX95klLuyX504H
         j9T3Z7TCVpu17OwuG/G3kHuyNRjPsCBNEaxLPo50Odo1G5l/yattlG0pKBtQXUfPDfwn
         UClU98Fe8qycScNn+Gc+sCit3aWm+ZFszpgYULtwwl787/IcVyk+V6HzxOBT9SVtHRZC
         0A9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=FV/lAkBucS5LQIPKPYGSp0NZnz+d0fTaTfxhBzUFBmg=;
        b=ntBf/G9bmsMHyRSS47Z8W/TIA1zAdqk66bRkczBG+149np6/UAJWVaZDdTukFXO27S
         tPRPTFEeLgMTXPguq57xCgFyg+i3qB1AZQRRwkRnRFRYhL2l5w2Z+I10h4XVpqboOLWE
         wqD4sl5dIfplK1X9DFO4pB89U6IXaJHHtRY7Holpdxiz/C8PU0zx8chjtFLVBlFZrJBX
         lFvojwA8JMVSoN7djlSryO/SLSw3Lob9X42jbEkLjqLvf25WdgooICeb63C3GzAN5Fcp
         xoQc8ahlw2K+2RFgsJTg3A+EQ/ZepfMNmf6/ZvJuwxHmTuOAnjhjwKtXR8iQwFfkhtY5
         kNqA==
X-Gm-Message-State: AOAM531tqeZz4YJMCYn+KuqxWcHt0IEC3vc2lUHVzFPmrftdhH5ccwr2
        rLpZEEaaGnhLgbUdsc2PVZUqln5UaRw=
X-Google-Smtp-Source: ABdhPJzEaEWsY6qbN+SszSro9Y+IgIerXYDSz7bt4XbLz3dBTUtR8LM3Yt/i9pzbl5i4r0TfU3vSyw==
X-Received: by 2002:a63:6305:: with SMTP id x5mr7690356pgb.269.1605696502540;
        Wed, 18 Nov 2020 02:48:22 -0800 (PST)
Received: from localhost.localdomain ([2402:7500:575:2174:b7aa:599:e762:e486])
        by smtp.gmail.com with ESMTPSA id a3sm25345154pfd.58.2020.11.18.02.48.16
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 18 Nov 2020 02:48:22 -0800 (PST)
From:   Gene Chen <gene.chen.richtek@gmail.com>
To:     jacek.anaszewski@gmail.com, pavel@ucw.cz, robh+dt@kernel.org,
        matthias.bgg@gmail.com
Cc:     dmurphy@ti.com, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        gene_chen@richtek.com, Wilma.Wu@mediatek.com,
        shufan_lee@richtek.com, cy_huang@richtek.com,
        benjamin.chao@mediatek.com
Subject: [PATCH v7 1/5] leds: flash: Add flash registration with undefined CONFIG_LEDS_CLASS_FLASH
Date:   Wed, 18 Nov 2020 18:47:38 +0800
Message-Id: <1605696462-391-2-git-send-email-gene.chen.richtek@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1605696462-391-1-git-send-email-gene.chen.richtek@gmail.com>
References: <1605696462-391-1-git-send-email-gene.chen.richtek@gmail.com>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

From: Gene Chen <gene_chen@richtek.com>

Add flash registration with undefined CONFIG_LEDS_CLASS_FLASH

Signed-off-by: Gene Chen <gene_chen@richtek.com>
---
 include/linux/led-class-flash.h | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/include/linux/led-class-flash.h b/include/linux/led-class-flash.h
index 21a3358..4f56c28 100644
--- a/include/linux/led-class-flash.h
+++ b/include/linux/led-class-flash.h
@@ -85,6 +85,7 @@ static inline struct led_classdev_flash *lcdev_to_flcdev(
 	return container_of(lcdev, struct led_classdev_flash, led_cdev);
 }
 
+#if IS_ENABLED(CONFIG_LEDS_CLASS_FLASH)
 /**
  * led_classdev_flash_register_ext - register a new object of LED class with
  *				     init data and with support for flash LEDs
@@ -127,6 +128,41 @@ static inline int devm_led_classdev_flash_register(struct device *parent,
 void devm_led_classdev_flash_unregister(struct device *parent,
 					struct led_classdev_flash *fled_cdev);
 
+#else
+
+static inline int led_classdev_flash_register_ext(struct device *parent,
+				    struct led_classdev_flash *fled_cdev,
+				    struct led_init_data *init_data)
+{
+	return -EINVAL;
+}
+
+static inline int led_classdev_flash_register(struct device *parent,
+					   struct led_classdev_flash *fled_cdev)
+{
+	return led_classdev_flash_register_ext(parent, fled_cdev, NULL);
+}
+
+static inline void led_classdev_flash_unregister(struct led_classdev_flash *fled_cdev) {};
+static inline int devm_led_classdev_flash_register_ext(struct device *parent,
+				     struct led_classdev_flash *fled_cdev,
+				     struct led_init_data *init_data)
+{
+	return -EINVAL;
+}
+
+static inline int devm_led_classdev_flash_register(struct device *parent,
+				     struct led_classdev_flash *fled_cdev)
+{
+	return devm_led_classdev_flash_register_ext(parent, fled_cdev, NULL);
+}
+
+void devm_led_classdev_flash_unregister(struct device *parent,
+					struct led_classdev_flash *fled_cdev)
+{};
+
+#endif  /* IS_ENABLED(CONFIG_LEDS_CLASS_FLASH) */
+
 /**
  * led_set_flash_strobe - setup flash strobe
  * @fled_cdev: the flash LED to set strobe on
-- 
2.7.4

