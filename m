Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9852720BCD4
	for <lists+linux-leds@lfdr.de>; Sat, 27 Jun 2020 00:40:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725913AbgFZWkR (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 26 Jun 2020 18:40:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726388AbgFZWkQ (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 26 Jun 2020 18:40:16 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E0A7C03E979
        for <linux-leds@vger.kernel.org>; Fri, 26 Jun 2020 15:40:16 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id s9so11892440ljm.11
        for <linux-leds@vger.kernel.org>; Fri, 26 Jun 2020 15:40:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=f0bx3NI0TQNLxD0Zdrz9oRVvUPchRfitiWV9WakPrvw=;
        b=oqMxDQmpmMzqMwr3weunHgXI3yGm+DP73Hngm7+RacKPlN3s4LBIR3phTlGvqfIutU
         9lW3cfRsgjIp7HcFWrw2FT8ZmC60+JweAXwEBsWjNpE8tqY/6ZzF7360vZdBDMHwlgQt
         4xzAyEIhe705g3DfWXw9rCOc/qnGl7CnJbK1eNocw0W/Vmny5HmjrEJEANtQ4fdGXRyE
         7FH/prNoXwHMkZbdMqbQeUliueE6jn7lEN8wNM/RBV7O26ELVjkM4r9vfLX822cz3Npi
         muv09wSu318DH3ZOMyeUp41M0ijqmy0Mg9i/r5dSa8uGwqdz4E8etYrm+GsMH+vCs7iB
         u6KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=f0bx3NI0TQNLxD0Zdrz9oRVvUPchRfitiWV9WakPrvw=;
        b=e48s21DqS7ziV3y6AquqOrd/yOlHeTVkRXqerkshDA25dk0qlCxIgDgQJdoP5Q6zBE
         gUfoUohbNuRclyuedrtnCxc7lvQoyCDcHC5YKTJUrd26JEYzhxRFTw1+akGT5IuhHnb4
         T7wWrx7Gcw9YocNIcheing6wRy1NTdmYORFe+kCRR2rlj9vMojxYva3B+C3Q4Omp84Wa
         B4UJSi0R3e2wrrZ3vzJnsqbzHBFhBgHD2XOj36KbtkmU7qvKrqQdoU0UTN5lf6miy0hd
         bVNX5Ue74CvRi+6xwvFLrM9gKHkUpwLzAfCfYWzVPZf33Rk/VnYO2edjSkBmOI6h7A7s
         iOVw==
X-Gm-Message-State: AOAM5309/v1H8iaVMpg4XnAWWYHD9X111TMLK7+Iw53L1zGPj7eY7bvz
        n9noUGHuCdG0/8fFeVmQmdv0xw==
X-Google-Smtp-Source: ABdhPJxE+YgU8Qr2dYjzOPp8+9zEljiwaGH//MuC5u0j0hLfBXZQ3aCjLm5LwtVTxIsXG+1tDRcPhA==
X-Received: by 2002:a2e:3507:: with SMTP id z7mr2436998ljz.389.1593211214935;
        Fri, 26 Jun 2020 15:40:14 -0700 (PDT)
Received: from genomnajs.lan (c-d63ee155.152980-0-69706f6e6c79.bbcust.telenor.se. [85.225.62.214])
        by smtp.gmail.com with ESMTPSA id q14sm7055050lfn.75.2020.06.26.15.40.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2020 15:40:14 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>
Cc:     linux-leds@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Milo Kim <milo.kim@ti.com>
Subject: [PATCH] leds: lp55xx: Convert to use GPIO descriptors
Date:   Sat, 27 Jun 2020 00:40:11 +0200
Message-Id: <20200626224011.379368-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

The LP55xx driver is already using the of_gpio() functions to
pick a global GPIO number for "enable" from the device tree and
request the line. Simplify it by just using a GPIO descriptor.

Make sure to keep the enable GPIO line optional, change the
naming from "lp5523_enable" to "LP55xx enable" to reflect that
this is used on all LP55xx LED drivers.

Cc: Milo Kim <milo.kim@ti.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/leds/leds-lp55xx-common.c         | 27 +++++++++--------------
 include/linux/platform_data/leds-lp55xx.h |  6 +++--
 2 files changed, 15 insertions(+), 18 deletions(-)

diff --git a/drivers/leds/leds-lp55xx-common.c b/drivers/leds/leds-lp55xx-common.c
index 44ced02b49f9..1354965ac866 100644
--- a/drivers/leds/leds-lp55xx-common.c
+++ b/drivers/leds/leds-lp55xx-common.c
@@ -17,8 +17,7 @@
 #include <linux/module.h>
 #include <linux/platform_data/leds-lp55xx.h>
 #include <linux/slab.h>
-#include <linux/gpio.h>
-#include <linux/of_gpio.h>
+#include <linux/gpio/consumer.h>
 
 #include "leds-lp55xx-common.h"
 
@@ -395,18 +394,11 @@ int lp55xx_init_device(struct lp55xx_chip *chip)
 	if (!pdata || !cfg)
 		return -EINVAL;
 
-	if (gpio_is_valid(pdata->enable_gpio)) {
-		ret = devm_gpio_request_one(dev, pdata->enable_gpio,
-					    GPIOF_DIR_OUT, "lp5523_enable");
-		if (ret < 0) {
-			dev_err(dev, "could not acquire enable gpio (err=%d)\n",
-				ret);
-			goto err;
-		}
-
-		gpio_set_value(pdata->enable_gpio, 0);
+	if (pdata->enable_gpiod) {
+		gpiod_set_consumer_name(pdata->enable_gpiod, "LP55xx enable");
+		gpiod_set_value(pdata->enable_gpiod, 0);
 		usleep_range(1000, 2000); /* Keep enable down at least 1ms */
-		gpio_set_value(pdata->enable_gpio, 1);
+		gpiod_set_value(pdata->enable_gpiod, 1);
 		usleep_range(1000, 2000); /* 500us abs min. */
 	}
 
@@ -447,8 +439,8 @@ void lp55xx_deinit_device(struct lp55xx_chip *chip)
 	if (chip->clk)
 		clk_disable_unprepare(chip->clk);
 
-	if (gpio_is_valid(pdata->enable_gpio))
-		gpio_set_value(pdata->enable_gpio, 0);
+	if (pdata->enable_gpiod)
+		gpiod_set_value(pdata->enable_gpiod, 0);
 }
 EXPORT_SYMBOL_GPL(lp55xx_deinit_device);
 
@@ -579,7 +571,10 @@ struct lp55xx_platform_data *lp55xx_of_populate_pdata(struct device *dev,
 	of_property_read_string(np, "label", &pdata->label);
 	of_property_read_u8(np, "clock-mode", &pdata->clock_mode);
 
-	pdata->enable_gpio = of_get_named_gpio(np, "enable-gpio", 0);
+	pdata->enable_gpiod = devm_gpiod_get_optional(dev, "enable",
+						      GPIOD_ASIS);
+	if (IS_ERR(pdata->enable_gpiod))
+		return ERR_CAST(pdata->enable_gpiod);
 
 	/* LP8501 specific */
 	of_property_read_u8(np, "pwr-sel", (u8 *)&pdata->pwr_sel);
diff --git a/include/linux/platform_data/leds-lp55xx.h b/include/linux/platform_data/leds-lp55xx.h
index 96a787100fda..00492d6ff018 100644
--- a/include/linux/platform_data/leds-lp55xx.h
+++ b/include/linux/platform_data/leds-lp55xx.h
@@ -12,6 +12,8 @@
 #ifndef _LEDS_LP55XX_H
 #define _LEDS_LP55XX_H
 
+#include <linux/gpio/consumer.h>
+
 /* Clock configuration */
 #define LP55XX_CLOCK_AUTO	0
 #define LP55XX_CLOCK_INT	1
@@ -49,7 +51,7 @@ enum lp8501_pwr_sel {
  * @clock_mode        : Input clock mode. LP55XX_CLOCK_AUTO or _INT or _EXT
  * @setup_resources   : Platform specific function before enabling the chip
  * @release_resources : Platform specific function after  disabling the chip
- * @enable            : EN pin control by platform side
+ * @enable_gpiod      : enable GPIO descriptor
  * @patterns          : Predefined pattern data for RGB channels
  * @num_patterns      : Number of patterns
  * @update_config     : Value of CONFIG register
@@ -65,7 +67,7 @@ struct lp55xx_platform_data {
 	u8 clock_mode;
 
 	/* optional enable GPIO */
-	int enable_gpio;
+	struct gpio_desc *enable_gpiod;
 
 	/* Predefined pattern data */
 	struct lp55xx_predef_pattern *patterns;
-- 
2.25.4

