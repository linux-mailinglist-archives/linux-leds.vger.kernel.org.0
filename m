Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 815224BCB31
	for <lists+linux-leds@lfdr.de>; Sun, 20 Feb 2022 00:58:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229677AbiBSX6m (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 19 Feb 2022 18:58:42 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:49314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232156AbiBSX6l (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 19 Feb 2022 18:58:41 -0500
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D76CCBCA7
        for <linux-leds@vger.kernel.org>; Sat, 19 Feb 2022 15:58:21 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id o2so12043602lfd.1
        for <linux-leds@vger.kernel.org>; Sat, 19 Feb 2022 15:58:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=j1lBYqoMVGMcb0CHyreIzMQuBYPA3qOgCje3bJMw18w=;
        b=CpDMcp/LRwZ9CBzdxvkyGVUb8uvbpzJRN8tuo1/TxDZEAnmqAMpAsgfXfvoDekhQhA
         zfa6R09Y0rAIO2SueeS9M3nE2IHfnREPzNQ4q3xo4WQSa1IJ1MgfIXVX1p/xSh4ZlBUz
         o7mk2Q9JOMbm0wOgNWGuEWEDk3QJzZI7x3/WfutsLY7HCPhC8IhsKsR5mAyr27E7LR/y
         OUV0hcqn8HsKn/yrJuG0xfXztxV7aByMY8YpfdsHrtsE3gSmlSJQCugqURE0roqxBz3+
         q61OZlyzegegc6J6S9QPe3qgNkmyQUYxntQRFov43m/KlRM3KUP7pkdj4zzcYCMnWxD8
         OMoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=j1lBYqoMVGMcb0CHyreIzMQuBYPA3qOgCje3bJMw18w=;
        b=MBaocXM1wyHuhJpMwgXq51wXw/VAnDviFPlxcZTDi8Pq5waVkbHTCsDakGXKFka9as
         toZv1mw523dKo9Myyzd76sN1s8n6s3/zVBbTbXGumskQSb3kH7AVZ5CoPsI88MMr3WFE
         VtVdli10gtQ5hFdSdgsaZz2oqsnVXWQSxirp7yKC22vZuSWZ4xT59NP3wHBfTe5CsqEq
         j6yyMbnxvYXKut+4A1QK2gnGmktctQ+z1/vn6wr/D9k91acfh6Uilf/xkXhm3j6KIUou
         QrumaSieAo/7fj1xHiGytegG9/neYs+2LT5fU5aulOs88wMFuxapTc8njGlwWZTd70nW
         uCDQ==
X-Gm-Message-State: AOAM531UxJosA8Qqnox/QnQoIxg650337dvP/ox/0dCpcplr0UFTUWeY
        ayOFuxmOx2/0w6xg5dIJPr/REa9rzB0H5rZi
X-Google-Smtp-Source: ABdhPJxhuN32JrosZXRaED14ICyv+FqDGMU4gQGz0hchZWiMaKwi75zf+qgOMA4sImwkWafDqIbuWA==
X-Received: by 2002:a19:f00f:0:b0:443:ae5c:47d0 with SMTP id p15-20020a19f00f000000b00443ae5c47d0mr8277091lfc.332.1645315100226;
        Sat, 19 Feb 2022 15:58:20 -0800 (PST)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id q34sm814106lje.121.2022.02.19.15.58.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Feb 2022 15:58:19 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     linux-leds@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Antonio Ospite <ao2@ao2.it>
Subject: [PATCH 3/3] leds: regulator: Make probeable from device tree
Date:   Sun, 20 Feb 2022 00:56:07 +0100
Message-Id: <20220219235607.1613686-3-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220219235607.1613686-1-linus.walleij@linaro.org>
References: <20220219235607.1613686-1-linus.walleij@linaro.org>
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
2.34.1

