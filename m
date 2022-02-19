Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 18A0E4BCB30
	for <lists+linux-leds@lfdr.de>; Sun, 20 Feb 2022 00:58:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229821AbiBSX6l (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 19 Feb 2022 18:58:41 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:49246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229677AbiBSX6k (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 19 Feb 2022 18:58:40 -0500
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A30C138A5
        for <linux-leds@vger.kernel.org>; Sat, 19 Feb 2022 15:58:20 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id u20so12008317lff.2
        for <linux-leds@vger.kernel.org>; Sat, 19 Feb 2022 15:58:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LFss8ysMBD8Jhg8w3hi8+xycCjjqs7KkMfVxCv6AFTg=;
        b=mzkDVYMEJwSJQtBKnmCc/3FCnxmQlEcEJPqGV5R4hIsbAoj/ulqprlug2yvn3Cea7k
         MFK2YZTafG5l2uH1sR5IEOngFJwfSNVXax/XL5fSfIMeplpn5vkmsJ0rA4niCpyVZXcs
         6nTgavnEC3mqcQ7JbcDrfdMsmcHl9mi0NgDz1q5OfO7wL9YFWmRNoF+Xr/WBTft/Bto+
         06Gz/yArg0FuDjgesVwPggAcX72ldlj9LDZ+yRwsmOoDwI27YYu79+dGHOseN2nAnU59
         JxTuSTi9PSqmhe3piHlTAJecTCkxtfPJV4SSzTrD8cDyI3BgDrIdFnq3Nf4WylLzvYsy
         lS+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LFss8ysMBD8Jhg8w3hi8+xycCjjqs7KkMfVxCv6AFTg=;
        b=0OPVmtAqlWT8xGxLlqk9KGctoJ6anIQiHqHXm5E2fMSSUCuZYaXuo9aCdWuAaPO+8y
         nf4eTfF+WtNMFhptccUQJCoUQyz6oLoaX40mhta6z3jzBj4VNlKEQJqZk/+JrzDrTks1
         UEKUYGT+Rwat9auovC6zHnxTPk/in3RUepAZeAUDjeI9KzK5lCBkjPU0gAGtZ5IpiYX1
         qCyOG7NIFUtofyoBpRmybw2usTlAZX4O9fwdkv464/nWz7TRPwJCg06oFQum/2A3VpUm
         LYdMIM4MpWYPL4czJBhBQZ6r9B92dQs/hav49VK7RugxTJ+/AOva5aJtJgeoIz392zd/
         x0Nw==
X-Gm-Message-State: AOAM532jpq2SSgYgkfI0U1DKK7O2uOEsRXJ97EBiLqmGU4LAeJ9Euvds
        0f5m2O9gXpaT+MLuQlsNx2zXhIaJ+k8MdVYQ
X-Google-Smtp-Source: ABdhPJz8C+mfWF1daTKkDozHPHt7cCFObh94mOi4OXTjC+gs1K8PKbQ2hciGVcchs4Ticzh/yr6Xdg==
X-Received: by 2002:ac2:5de4:0:b0:443:5b80:d4c4 with SMTP id z4-20020ac25de4000000b004435b80d4c4mr9749259lfq.373.1645315099007;
        Sat, 19 Feb 2022 15:58:19 -0800 (PST)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id q34sm814106lje.121.2022.02.19.15.58.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Feb 2022 15:58:18 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     linux-leds@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Antonio Ospite <ao2@ao2.it>
Subject: [PATCH 2/3] leds: regulator: Add dev helper variable
Date:   Sun, 20 Feb 2022 00:56:06 +0100
Message-Id: <20220219235607.1613686-2-linus.walleij@linaro.org>
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

Instead of repeating the hard to read &pdev->dev just create a
local struct device *dev in probe().

Cc: Antonio Ospite <ao2@ao2.it>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/leds/leds-regulator.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/leds/leds-regulator.c b/drivers/leds/leds-regulator.c
index 208c98918433..87b9f46e572b 100644
--- a/drivers/leds/leds-regulator.c
+++ b/drivers/leds/leds-regulator.c
@@ -123,28 +123,29 @@ static int regulator_led_probe(struct platform_device *pdev)
 {
 	struct led_regulator_platform_data *pdata =
 			dev_get_platdata(&pdev->dev);
+	struct device *dev = &pdev->dev;
 	struct regulator_led *led;
 	struct regulator *vcc;
 	int ret = 0;
 
 	if (pdata == NULL) {
-		dev_err(&pdev->dev, "no platform data\n");
+		dev_err(dev, "no platform data\n");
 		return -ENODEV;
 	}
 
-	vcc = devm_regulator_get_exclusive(&pdev->dev, "vled");
+	vcc = devm_regulator_get_exclusive(dev, "vled");
 	if (IS_ERR(vcc)) {
-		dev_err(&pdev->dev, "Cannot get vcc for %s\n", pdata->name);
+		dev_err(dev, "Cannot get vcc for %s\n", pdata->name);
 		return PTR_ERR(vcc);
 	}
 
-	led = devm_kzalloc(&pdev->dev, sizeof(*led), GFP_KERNEL);
+	led = devm_kzalloc(dev, sizeof(*led), GFP_KERNEL);
 	if (led == NULL)
 		return -ENOMEM;
 
 	led->cdev.max_brightness = led_regulator_get_max_brightness(vcc);
 	if (pdata->brightness > led->cdev.max_brightness) {
-		dev_err(&pdev->dev, "Invalid default brightness %d\n",
+		dev_err(dev, "Invalid default brightness %d\n",
 				pdata->brightness);
 		return -EINVAL;
 	}
@@ -162,7 +163,7 @@ static int regulator_led_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, led);
 
-	ret = led_classdev_register(&pdev->dev, &led->cdev);
+	ret = led_classdev_register(dev, &led->cdev);
 	if (ret < 0)
 		return ret;
 
-- 
2.34.1

