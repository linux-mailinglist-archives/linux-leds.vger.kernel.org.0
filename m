Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 79501213F36
	for <lists+linux-leds@lfdr.de>; Fri,  3 Jul 2020 20:15:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726148AbgGCSPn (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 3 Jul 2020 14:15:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726147AbgGCSPn (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 3 Jul 2020 14:15:43 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07FD4C061794
        for <linux-leds@vger.kernel.org>; Fri,  3 Jul 2020 11:15:43 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id z24so13091068ljn.8
        for <linux-leds@vger.kernel.org>; Fri, 03 Jul 2020 11:15:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nPjx2N5clfCByQygFfiY1P3jSLHWK6BHWlrqtBAz+mc=;
        b=Ifua75RBjhNfQ1tom2+/WasKQkhOxjfUIej5BEIT36NPUNZLF4ftEvJOAPAlc5c0Oz
         toc7gL5CHIBROwKk2H1mvI+PRZy3VX8qabERHkv0k7rvidYkx5oPutWVnFG3cvZ4ANhv
         HlvGd59BrPl53tRuk8U+2tjLulTZriKZnwYxpNaopB2CgICYOtv74Ht/uEgYv3l8xP6R
         bmbQ76iXuqzF71uxRVIiFD4MDj/vqEhCH3qACrsiV9WD4mlOtRuxh9z5s4kLmogo7qA7
         xNOMH7UKDpy7hG+xdRxCKcOrWzI9Jxl+fzage4mZoFD47qU7OVJ7JBC7R3BBag4pn26l
         2DOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nPjx2N5clfCByQygFfiY1P3jSLHWK6BHWlrqtBAz+mc=;
        b=LDhQmIOpHLuw74ePSBf7FZinKdQiZNl8QkgAmEYVlJaM67bMZQos4mMOClUrmuxC7C
         VDVPnqJyMRfz0MsGbXuMEwsh1HYW0go1Aaivj4dbAsFbfXF4r83xXo4sjz2mPYIa7u4N
         65/XUDdlTgjBxD3qRhtwcdT6NgVdNT+6EWPKkICFALU0128oF1Zw9jN0mHr5scjD9PBu
         ZFb5EGA7tT/UQ9HHvbxOYntp7hwdyXEdMb6WbUUz24yQM8xzWFsdKZ4/Vo7usGZAoBQu
         4urdALvqWcZ1kSa2ah8rT6tNMR3IesdU6fQ/sFZXeQ7GnOVDcPfTfOqPynrwGIyXj/kg
         r1Sg==
X-Gm-Message-State: AOAM530RGITLLU9EdKd0ThP8tWjM6JCM16cyCKHU0eXt0crq2XDfjMQS
        E/K9Cs8cjrIE9nERLuhYALsT0Q==
X-Google-Smtp-Source: ABdhPJyPAURVY+cdDi1O6ZO/GhhXGrH5GkppyUfsMvaILiWz6DE/shOi0kFEhZdVS3mBr0P7BHODvw==
X-Received: by 2002:a2e:b607:: with SMTP id r7mr14307637ljn.5.1593800141351;
        Fri, 03 Jul 2020 11:15:41 -0700 (PDT)
Received: from localhost.localdomain (c-92d7225c.014-348-6c756e10.bbcust.telenor.se. [92.34.215.146])
        by smtp.gmail.com with ESMTPSA id x30sm4890781lfn.3.2020.07.03.11.15.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2020 11:15:40 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>
Cc:     linux-leds@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] leds: gpio: Fix semantic error
Date:   Fri,  3 Jul 2020 20:13:38 +0200
Message-Id: <20200703181338.602569-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

The leds-gpio driver mixes up the legacy GPIO flags with the
GPIO descriptor flags and passes a legacy flag to
devm_gpiod_get_index().

Fix this by replacing the flags variable with the strict
descriptor flag.

Fixes: 45d4c6de4e49 ("leds: gpio: Try to lookup gpiod from device")
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/leds/leds-gpio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/leds-gpio.c b/drivers/leds/leds-gpio.c
index 2bf74595610f..200688c602cd 100644
--- a/drivers/leds/leds-gpio.c
+++ b/drivers/leds/leds-gpio.c
@@ -220,7 +220,7 @@ static struct gpio_desc *gpio_led_get_gpiod(struct device *dev, int idx,
 	 * device, this will hit the board file, if any and get
 	 * the GPIO from there.
 	 */
-	gpiod = devm_gpiod_get_index(dev, NULL, idx, flags);
+	gpiod = devm_gpiod_get_index(dev, NULL, idx, GPIOD_OUT_LOW);
 	if (!IS_ERR(gpiod)) {
 		gpiod_set_consumer_name(gpiod, template->name);
 		return gpiod;
-- 
2.25.4

