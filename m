Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8731C3947EB
	for <lists+linux-leds@lfdr.de>; Fri, 28 May 2021 22:26:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229482AbhE1U1t (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 28 May 2021 16:27:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229563AbhE1U1r (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 28 May 2021 16:27:47 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B71ABC061574
        for <linux-leds@vger.kernel.org>; Fri, 28 May 2021 13:26:11 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id o8so6885481ljp.0
        for <linux-leds@vger.kernel.org>; Fri, 28 May 2021 13:26:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7/Eg1spwq71+WIMd8JequNMmAScxgsfqLFxwn1RWlpc=;
        b=cpjYKywILmExqavhWuMBsvDpjQegojOQVNfHsqi3MephD1tVK5sHFXp1BTBm9K2sNu
         zWIw7dm1QjLkJrg5SSQmmx4Si6nGwkfb73Uoh1XLH3Ik0xVBMy2ZMCFSOJ8HDVX2Qg27
         dyRZ+GZUI+NUgCchLvd6mqB7n55txXZImhK1WJv8bpm/29ItwdbhwbWTM7QwVuK3guE5
         fTKmiuvFr1Ag18LGiW1JWi0Ucm+9BsaH03JGv9Ag70x0FT0ix0xlYELiNutiZc4Wsr57
         zo5vEJfMQOh1ppSv+/ZghKGPHfz6ttK9YSKNU0IYnaxRLB7ODEFi6EhRQMyE0yLJEtv/
         LCcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7/Eg1spwq71+WIMd8JequNMmAScxgsfqLFxwn1RWlpc=;
        b=rxibcfSLmoE5gMjvz0W56Q7bBnKD+2X9x0GPcTi5TdmVWJkjbB7hCI+n87gZPL4+rn
         h3tB0ZFoniw7pihecEjQSAWXO10aFKE9emdgRbbM904u7jnesVRWYSTrkaHlIEG3Dhyd
         T//eOFQSZjbsbQNfaVh4L7SMC1ik8gImX4TM0GY9Sn0+WiffmWOuHYUHYmq/AytGJkOG
         dSLfFjZYbdTi1tsh4g8vnvY3Wii/l8BAkWiXRROACuApPEHNyXBXlYN5wkU5BwyDml9K
         biA+uJzR6yooPpctqIO7XsdT0EBl1/XEPxz/kixEt+smOIRFceW5j4W2mJIaeWBnprva
         lkgg==
X-Gm-Message-State: AOAM531g7+vyizuMNd2hAP9lH0UmCVyEhQaBYSEv1D3OAP6mNLMArps1
        2NMvCz+PtWvsgFcc8O/HrKtgbBgTxuy4kA==
X-Google-Smtp-Source: ABdhPJwTu4g41Trgo3yLVUg/JiNgEnji8BMaVvCjc3byS5qQEtbdzPkBS/jygn3MSu6ZJ9AKNgXIWA==
X-Received: by 2002:a05:651c:3cc:: with SMTP id f12mr7892995ljp.364.1622233570105;
        Fri, 28 May 2021 13:26:10 -0700 (PDT)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id q184sm709908ljb.54.2021.05.28.13.26.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 May 2021 13:26:09 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     linux-leds@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: [PATCH 1/6] leds: aat1290: Move driver to flash subdirectory
Date:   Fri, 28 May 2021 22:23:59 +0200
Message-Id: <20210528202404.431859-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

We created a subdirectory for LED drivers that depend on
CONFIG_LEDS_CLASS_FLASH, and this driver does so let's
move it there.

Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/leds/Kconfig                    | 10 ----------
 drivers/leds/Makefile                   |  1 -
 drivers/leds/flash/Kconfig              |  9 +++++++++
 drivers/leds/flash/Makefile             |  1 +
 drivers/leds/{ => flash}/leds-aat1290.c |  0
 5 files changed, 10 insertions(+), 11 deletions(-)
 rename drivers/leds/{ => flash}/leds-aat1290.c (100%)

diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index bdf16180f5ff..a350d8fbb085 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -59,16 +59,6 @@ config LEDS_88PM860X
 	  This option enables support for on-chip LED drivers found on Marvell
 	  Semiconductor 88PM8606 PMIC.
 
-config LEDS_AAT1290
-	tristate "LED support for the AAT1290"
-	depends on LEDS_CLASS_FLASH
-	depends on V4L2_FLASH_LED_CLASS || !V4L2_FLASH_LED_CLASS
-	depends on GPIOLIB || COMPILE_TEST
-	depends on OF
-	depends on PINCTRL
-	help
-	  This option enables support for the LEDs on the AAT1290.
-
 config LEDS_AN30259A
 	tristate "LED support for Panasonic AN30259A"
 	depends on LEDS_CLASS && I2C && OF
diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
index 7e604d3028c8..c7231975837a 100644
--- a/drivers/leds/Makefile
+++ b/drivers/leds/Makefile
@@ -9,7 +9,6 @@ obj-$(CONFIG_LEDS_TRIGGERS)		+= led-triggers.o
 
 # LED Platform Drivers (keep this sorted, M-| sort)
 obj-$(CONFIG_LEDS_88PM860X)		+= leds-88pm860x.o
-obj-$(CONFIG_LEDS_AAT1290)		+= leds-aat1290.o
 obj-$(CONFIG_LEDS_ACER_A500)		+= leds-acer-a500.o
 obj-$(CONFIG_LEDS_ADP5520)		+= leds-adp5520.o
 obj-$(CONFIG_LEDS_AN30259A)		+= leds-an30259a.o
diff --git a/drivers/leds/flash/Kconfig b/drivers/leds/flash/Kconfig
index 3f49f3edbffb..736153b0bfd6 100644
--- a/drivers/leds/flash/Kconfig
+++ b/drivers/leds/flash/Kconfig
@@ -2,6 +2,15 @@
 
 if LEDS_CLASS_FLASH
 
+config LEDS_AAT1290
+	tristate "LED support for the AAT1290"
+	depends on V4L2_FLASH_LED_CLASS || !V4L2_FLASH_LED_CLASS
+	depends on GPIOLIB || COMPILE_TEST
+	depends on OF
+	depends on PINCTRL
+	help
+	  This option enables support for the LEDs on the AAT1290.
+
 config LEDS_RT4505
 	tristate "LED support for RT4505 flashlight controller"
 	depends on I2C && OF
diff --git a/drivers/leds/flash/Makefile b/drivers/leds/flash/Makefile
index 09aee561f769..11bec5881d51 100644
--- a/drivers/leds/flash/Makefile
+++ b/drivers/leds/flash/Makefile
@@ -1,4 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
 
+obj-$(CONFIG_LEDS_AAT1290)	+= leds-aat1290.o
 obj-$(CONFIG_LEDS_RT4505)	+= leds-rt4505.o
 obj-$(CONFIG_LEDS_RT8515)	+= leds-rt8515.o
diff --git a/drivers/leds/leds-aat1290.c b/drivers/leds/flash/leds-aat1290.c
similarity index 100%
rename from drivers/leds/leds-aat1290.c
rename to drivers/leds/flash/leds-aat1290.c
-- 
2.31.1

