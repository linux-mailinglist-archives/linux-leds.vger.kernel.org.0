Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 50BB94F1B61
	for <lists+linux-leds@lfdr.de>; Mon,  4 Apr 2022 23:23:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1379624AbiDDVUL (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 4 Apr 2022 17:20:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1380596AbiDDUjt (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 4 Apr 2022 16:39:49 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFF4326AC8
        for <linux-leds@vger.kernel.org>; Mon,  4 Apr 2022 13:37:52 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id e16so19454522lfc.13
        for <linux-leds@vger.kernel.org>; Mon, 04 Apr 2022 13:37:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wXd7MQ3R8DlS2U8G/UUEE/J7wGJYvs66gXT9b6R666M=;
        b=fwh9rj1x7brhDKaZe8B5oHVYo7ESn21APvI36bPJ7mjFgRl+dHEcLU4PjmJB9y70UM
         rzJucCAyaYdqox89TZXZZlnV9QCg/CsWGShpzImA4czpIdRiDBFDlIW9u+6ht9H3lrfu
         wvJ5Ut7LlzfYBmwHmMF023ZEA9Ifek6gwF+kUPM8FsL53+oWanfyNiA+xiIuE+kz7ep4
         cgECpRfgxCIGgWnqYIb29aWAN67MzJxL+g5VSLjU6KvuzlGbflyodbVrfJhpJX5ZhUcu
         n+9++2Vvo2JrM1nMfKD2enpsZ9DSNeT9hLhScc5FaY/7OaEsKLeb/ZIZ083Sl7kigNSi
         WITQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wXd7MQ3R8DlS2U8G/UUEE/J7wGJYvs66gXT9b6R666M=;
        b=Hav0uSIDdkXGALbqh+Zf+p7ncqdBhFbiBqg5s5oW0oXvljwJB6BsHy6LCwr0vZmCuQ
         MGCkLAOnf6G2nAqKNWh+kGGseU7NIW6ynSWTGH0oW04fzQo1RyHX0qyeFGGrojV7Uuhz
         Lbzi0WVfx9a477Isx9CeYrZR85o+iQm+d6Lu9MOCoBD+kPd4Rn8G+p8/7bZvZR5ReXoQ
         Du90t1oz33TmnYif9Rduw9jqjbmMyqfJrDsiU0fIyDcOvhMLS9ZWqU+MtZGdrt46yCU1
         qXOrBnErR10PS7N3XWuVSeHybMeTmY64wvdCeywzuvhrzXI7WU8FP018ygMkU/96XE8t
         I6uw==
X-Gm-Message-State: AOAM530+mDQ4xQg2cuKijTBEI4rpuxuCGegwIs2cZ4xAQeFkduTMtc4Z
        6gLZP22Ew6GGoDJrA4pkMiup7g==
X-Google-Smtp-Source: ABdhPJw06dmp/qmd75CMJumrWUv0O2dps6JG3ldN1OucoEa9qv8bMtetnpiMLAgL3Yy2QleMdJkKLg==
X-Received: by 2002:a05:6512:3d0f:b0:44a:d8a5:9c38 with SMTP id d15-20020a0565123d0f00b0044ad8a59c38mr112725lfv.84.1649104671153;
        Mon, 04 Apr 2022 13:37:51 -0700 (PDT)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id m14-20020a2eb6ce000000b0024afbbbb0c3sm1154650ljo.70.2022.04.04.13.37.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Apr 2022 13:37:50 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     linux-leds@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Antonio Ospite <ao2@ao2.it>
Subject: [PATCH 3/3] leds: regulator: Make probeable from device tree
Date:   Mon,  4 Apr 2022 22:35:22 +0200
Message-Id: <20220404203522.2068071-3-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220404203522.2068071-1-linus.walleij@linaro.org>
References: <20220404203522.2068071-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

The regulator LED can easily be adapted to probe from the
device tree.

We switch led_classdev_register() to led_classdev_register_ext()
passing some struct led_init_data init_data that we leave NULL
save the fwnode if platform data isn't present so that it will be
populated from the device tree.

If we have platform data we set up the name from the platform
data but using init_data instead.

Cc: Antonio Ospite <ao2@ao2.it>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v1->v2:
- Rebase on v5.18-rc1
---
 drivers/leds/leds-regulator.c | 42 +++++++++++++++++++----------------
 1 file changed, 23 insertions(+), 19 deletions(-)

diff --git a/drivers/leds/leds-regulator.c b/drivers/leds/leds-regulator.c
index 87b9f46e572b..8a8b73b4e358 100644
--- a/drivers/leds/leds-regulator.c
+++ b/drivers/leds/leds-regulator.c
@@ -8,6 +8,7 @@
  */
 
 #include <linux/module.h>
+#include <linux/mod_devicetable.h>
 #include <linux/err.h>
 #include <linux/slab.h>
 #include <linux/leds.h>
@@ -124,18 +125,14 @@ static int regulator_led_probe(struct platform_device *pdev)
 	struct led_regulator_platform_data *pdata =
 			dev_get_platdata(&pdev->dev);
 	struct device *dev = &pdev->dev;
+	struct led_init_data init_data = {};
 	struct regulator_led *led;
 	struct regulator *vcc;
 	int ret = 0;
 
-	if (pdata == NULL) {
-		dev_err(dev, "no platform data\n");
-		return -ENODEV;
-	}
-
 	vcc = devm_regulator_get_exclusive(dev, "vled");
 	if (IS_ERR(vcc)) {
-		dev_err(dev, "Cannot get vcc for %s\n", pdata->name);
+		dev_err(dev, "Cannot get vcc\n");
 		return PTR_ERR(vcc);
 	}
 
@@ -143,15 +140,21 @@ static int regulator_led_probe(struct platform_device *pdev)
 	if (led == NULL)
 		return -ENOMEM;
 
+	init_data.fwnode = dev->fwnode;
+
 	led->cdev.max_brightness = led_regulator_get_max_brightness(vcc);
-	if (pdata->brightness > led->cdev.max_brightness) {
-		dev_err(dev, "Invalid default brightness %d\n",
+	/* Legacy platform data label assignment */
+	if (pdata) {
+		if (pdata->brightness > led->cdev.max_brightness) {
+			dev_err(dev, "Invalid default brightness %d\n",
 				pdata->brightness);
-		return -EINVAL;
+			return -EINVAL;
+		}
+		led->cdev.brightness = pdata->brightness;
+		init_data.default_label = pdata->name;
 	}
 
 	led->cdev.brightness_set_blocking = regulator_led_brightness_set;
-	led->cdev.name = pdata->name;
 	led->cdev.flags |= LED_CORE_SUSPENDRESUME;
 	led->vcc = vcc;
 
@@ -163,16 +166,10 @@ static int regulator_led_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, led);
 
-	ret = led_classdev_register(dev, &led->cdev);
+	ret = led_classdev_register_ext(dev, &led->cdev, &init_data);
 	if (ret < 0)
 		return ret;
 
-	/* to expose the default value to userspace */
-	led->cdev.brightness = pdata->brightness;
-
-	/* Set the default led status */
-	regulator_led_brightness_set(&led->cdev, led->cdev.brightness);
-
 	return 0;
 }
 
@@ -185,10 +182,17 @@ static int regulator_led_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static const struct of_device_id regulator_led_of_match[] = {
+	{ .compatible = "regulator-led", },
+	{}
+};
+MODULE_DEVICE_TABLE(of, regulator_led_of_match);
+
 static struct platform_driver regulator_led_driver = {
 	.driver = {
-		   .name  = "leds-regulator",
-		   },
+		.name  = "leds-regulator",
+		.of_match_table = regulator_led_of_match,
+	},
 	.probe  = regulator_led_probe,
 	.remove = regulator_led_remove,
 };
-- 
2.35.1

