Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C6EC53AB8C
	for <lists+linux-leds@lfdr.de>; Sun,  9 Jun 2019 21:10:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730542AbfFITKW (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 9 Jun 2019 15:10:22 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:40599 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729120AbfFITIl (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 9 Jun 2019 15:08:41 -0400
Received: by mail-wr1-f68.google.com with SMTP id p11so6975184wre.7;
        Sun, 09 Jun 2019 12:08:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=xeS3pFHNvjix++EL35ueInrHkQ3W+h8kfOXAxNqPy0U=;
        b=Boq5tNp1VK6nzwBemQDjHD6h3zk1NRrd4IWZcxezRhueNn9Usiv0IAuKkNhPCUDmCp
         t3cUYxUJYs5hNO0RN9nPbNh2FbruaNxEdgviB5AHGzIL/3+b9csYdiETqPqBChyogyFt
         G4jjFOGosov2EIC/suxPIiv6XxTv84Bxc7aY9rYtB/kwIuHqbRdiwvJaIue3CdXMiN6d
         P/D38pI0sJtVOEEpcjRCfDMKaeQzRU4WkVVniK3I5x1WZO175nsb8wjWIlIwvVaqBzis
         XDH5JQnepPJvqaJlL4x0vqS+gpEs4UpBeX0ncSjYWqfDIjnsKekITP4K3bcdluGkXu44
         0YlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=xeS3pFHNvjix++EL35ueInrHkQ3W+h8kfOXAxNqPy0U=;
        b=hDv0X+EM44ta7kpCtFBwJMuSVGu1gty15UvGb6PpSmAUvE4pXWXCOit2T6mcxaYXuM
         gZxs22wnAJ/zNxcP3EQGeBYmb6OBhZT7jWWLYJOKrhsYEv1Reiuo39r3MrokbgNlYWi6
         5Nv0PAvfuBxE2xpHAkt1sEcbJxKs0F2rHtAq40sCGoZYKZ/FNYz6VDhqNXHrNudVqsxw
         CVHhK5VuWRK5+g7V+JWydTCpUM0tnZzG7SiCgCpAHKrDzRZJgETVDlJ2weyqSYNv42Su
         LsrO/pSFPrCuIbJA5qzeruRTLwOEeo+Wd1tpE6t6C+tbyQO7mfNjgsjQi7lqY11POYK4
         UQAw==
X-Gm-Message-State: APjAAAVFZv1F79AKl60F5cGMJhNYUPIwvI3CEOwEa4ns+e6QrFCE7USj
        lyc5zQu07N3KdLw10iv4TGdk3oDk
X-Google-Smtp-Source: APXvYqxcnB9NsPDxbDcYqfQxgPXplAjIqdm0SseYHYdS9iq11R32iUbHq+HDWL/uufOljOzl29P3Ew==
X-Received: by 2002:adf:eb09:: with SMTP id s9mr40928863wrn.127.1560107319200;
        Sun, 09 Jun 2019 12:08:39 -0700 (PDT)
Received: from myhost.home (ckm12.neoplus.adsl.tpnet.pl. [83.31.88.12])
        by smtp.gmail.com with ESMTPSA id y38sm14725041wrd.41.2019.06.09.12.08.37
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 09 Jun 2019 12:08:38 -0700 (PDT)
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
To:     linux-leds@vger.kernel.org
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        pavel@ucw.cz, robh@kernel.org, dtor@google.com, linux@roeck-us.net,
        dmurphy@ti.com, jacek.anaszewski@gmail.com,
        Baolin Wang <baolin.wang@linaro.org>
Subject: [PATCH v5 07/26] leds: sc27xx-blt: Use generic support for composing LED names
Date:   Sun,  9 Jun 2019 21:07:44 +0200
Message-Id: <20190609190803.14815-8-jacek.anaszewski@gmail.com>
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
Cc: Baolin Wang <baolin.wang@linaro.org>
Acked-by: Pavel Machek <pavel@ucw.cz>
---
 drivers/leds/leds-sc27xx-bltc.c | 22 +++++++++-------------
 1 file changed, 9 insertions(+), 13 deletions(-)

diff --git a/drivers/leds/leds-sc27xx-bltc.c b/drivers/leds/leds-sc27xx-bltc.c
index fecf27fb1cdc..0ede87420bfc 100644
--- a/drivers/leds/leds-sc27xx-bltc.c
+++ b/drivers/leds/leds-sc27xx-bltc.c
@@ -6,7 +6,6 @@
 #include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
-#include <uapi/linux/uleds.h>
 
 /* PMIC global control register definition */
 #define SC27XX_MODULE_EN0	0xc08
@@ -46,7 +45,7 @@
 #define SC27XX_DELTA_T_MAX	(SC27XX_LEDS_STEP * 255)
 
 struct sc27xx_led {
-	char name[LED_MAX_NAME_SIZE];
+	struct fwnode_handle *fwnode;
 	struct led_classdev ldev;
 	struct sc27xx_led_priv *priv;
 	u8 line;
@@ -249,19 +248,24 @@ static int sc27xx_led_register(struct device *dev, struct sc27xx_led_priv *priv)
 
 	for (i = 0; i < SC27XX_LEDS_MAX; i++) {
 		struct sc27xx_led *led = &priv->leds[i];
+		struct led_init_data init_data = {};
 
 		if (!led->active)
 			continue;
 
 		led->line = i;
 		led->priv = priv;
-		led->ldev.name = led->name;
 		led->ldev.brightness_set_blocking = sc27xx_led_set;
 		led->ldev.pattern_set = sc27xx_led_pattern_set;
 		led->ldev.pattern_clear = sc27xx_led_pattern_clear;
 		led->ldev.default_trigger = "pattern";
 
-		err = devm_led_classdev_register(dev, &led->ldev);
+		init_data.fwnode = led->fwnode;
+		init_data.devicename = "sc27xx";
+		init_data.default_label = ":";
+
+		err = devm_led_classdev_register_ext(dev, &led->ldev,
+						     &init_data);
 		if (err)
 			return err;
 	}
@@ -274,7 +278,6 @@ static int sc27xx_led_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct device_node *np = dev->of_node, *child;
 	struct sc27xx_led_priv *priv;
-	const char *str;
 	u32 base, count, reg;
 	int err;
 
@@ -316,15 +319,8 @@ static int sc27xx_led_probe(struct platform_device *pdev)
 			return -EINVAL;
 		}
 
+		priv->leds[reg].fwnode = of_fwnode_handle(child);
 		priv->leds[reg].active = true;
-
-		err = of_property_read_string(child, "label", &str);
-		if (err)
-			snprintf(priv->leds[reg].name, LED_MAX_NAME_SIZE,
-				 "sc27xx::");
-		else
-			snprintf(priv->leds[reg].name, LED_MAX_NAME_SIZE,
-				 "sc27xx:%s", str);
 	}
 
 	err = sc27xx_led_register(dev, priv);
-- 
2.11.0

