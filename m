Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E634C4F1B71
	for <lists+linux-leds@lfdr.de>; Mon,  4 Apr 2022 23:23:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1379630AbiDDVUM (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 4 Apr 2022 17:20:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1380595AbiDDUjs (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 4 Apr 2022 16:39:48 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84F1C25EB8
        for <linux-leds@vger.kernel.org>; Mon,  4 Apr 2022 13:37:51 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id e16so19454448lfc.13
        for <linux-leds@vger.kernel.org>; Mon, 04 Apr 2022 13:37:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GfUQJ+5ZKTsh5/P7HOu/fecB4P8HYcIT9EAtiQi9qYw=;
        b=owtX2OX5gEMDhOb2tI+OzblKDVHGdBTAT1HkXZK1b72EyMRhul0SGChncwQK1t+VId
         /cweVmES4uGM2ef/Hudrik0yBYhHrUaH2ry/O6jCd4Toea2WsiLD1XMn3N7SO2b9EOt5
         0PBwKGXDJqS0XxfD4ipbh2kQP09evohJ8d4b8H69AFUlke9NN5csxPrgLl/fezk6y3fw
         F1CIjxdpXq3PIIfKdZG3g4R4SWncVp70WbfJzAaZejJPWtsAx2LPA22ahbd7GRLFvEd5
         1uXCjh3IxofKT0BwXmuOQojVKXRmxDvLtYrepMIqXeTPEf3Lt2KNQGh0EA/LXvKeOOHQ
         WIjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GfUQJ+5ZKTsh5/P7HOu/fecB4P8HYcIT9EAtiQi9qYw=;
        b=OFWEY8fPwr7w0PxNpAk/+v+BIpFTfkJpmApJ9yYms520kpgXLsO3+5dcQd/vP09qOC
         1p7CfugKPDSO3fD0STBEhRCEZQpb0liLl0xck8O4PqFHNTUbh1tSsnRnO77E/L1jbdiv
         FP994HDVlOD0ZK2ABTfcIKzccltdEv3Iw5vq8doFS9KiX9a98rGJN+W23DStDhefkeru
         F8TZ2p8y/bYLsAu02CxfGh0xpf4EJJv4CtvK6lBVwM8d3dy93vXZuHNkjxUQ9bjUEYuJ
         XIGaKuRn/K7pXRzmF9hiPs0W2ogldisV6oH/c59F2gRVYIxH4a1mZdxv64ImxBlmOY2S
         AA7g==
X-Gm-Message-State: AOAM533P47FB150DZiknCk6ZSSZGA5OgiE8fAMp7GrESLMh/uH5098e+
        getWtzLjZnhxLhlcKFc5/JasaQ==
X-Google-Smtp-Source: ABdhPJy2t36zV7CHqwT5f+UGlpEXXWpKqFtSwQEtnEk1Ku8aucozAFx7D4XB6DrdimvodqzGmbEfzA==
X-Received: by 2002:a05:6512:e8f:b0:44a:bf22:89c8 with SMTP id bi15-20020a0565120e8f00b0044abf2289c8mr77975lfb.323.1649104669783;
        Mon, 04 Apr 2022 13:37:49 -0700 (PDT)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id m14-20020a2eb6ce000000b0024afbbbb0c3sm1154650ljo.70.2022.04.04.13.37.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Apr 2022 13:37:49 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     linux-leds@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Antonio Ospite <ao2@ao2.it>
Subject: [PATCH 2/3] leds: regulator: Add dev helper variable
Date:   Mon,  4 Apr 2022 22:35:21 +0200
Message-Id: <20220404203522.2068071-2-linus.walleij@linaro.org>
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

Instead of repeating the hard to read &pdev->dev just create a
local struct device *dev in probe().

Cc: Antonio Ospite <ao2@ao2.it>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v1->v2:
- Rebase on v5.18-rc1
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
2.35.1

