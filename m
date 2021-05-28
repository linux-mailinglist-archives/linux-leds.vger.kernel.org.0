Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 436AF3947ED
	for <lists+linux-leds@lfdr.de>; Fri, 28 May 2021 22:26:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229563AbhE1U2D (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 28 May 2021 16:28:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229589AbhE1U2D (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 28 May 2021 16:28:03 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84017C06174A
        for <linux-leds@vger.kernel.org>; Fri, 28 May 2021 13:26:27 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id v8so7037264lft.8
        for <linux-leds@vger.kernel.org>; Fri, 28 May 2021 13:26:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uCly6lMG0kzW4R5BHWVku0EV4SlEDlhFqYn8kAXDDic=;
        b=nkDkfoKm4Ip98GgG/YDsguk7x6CTtD91FtbETv4S1fC5OPFPtw+267HtBNHgDHATzq
         8ntkQHwMPOPDPiQApFDJKdUXUlFViBoMXbdHPiUhWvopGhOVngnzZ1z0RFMDgGsUa74B
         E8OeSdP3tckOHRwm1D9WO1osQ+PR1dNvpPT+LsSDYThT261lZrF1v66kz/6GMvNjP9oV
         z5Inr0P9zKSLA5ZLIUFhbeZ+4q+E/petSq3Da2CxDQiuj/mQkyDFjE7czIHbpWDSshJu
         Z2HBTigJEXUZc+GqgQHmhzQ8Hzs31M0cdYWW8iEAui+Db/t3zSTlaYs4XR1ZSz9VyNLm
         F3Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uCly6lMG0kzW4R5BHWVku0EV4SlEDlhFqYn8kAXDDic=;
        b=h3MIsSSNGhtA+M0nJV+NuXatCNPbhdRDTbuPomvaESErsOORMt0814dNjnOo5pKkH4
         WzuThbVTBvS7UWzsQ8tHDpChTZ7o3JnwxM23OwmsCKizPaEqH8lolgkp2Y2oYPgkcKiQ
         VUuC1+Sx5d4hmjwXB4vXhIfI0aliQI4nhSEDJWxAwsZ5bM3IRB2CZQb2YrxNEPGWFwRL
         SdEcNrpZk9mQsUSv4pY90XvL11leAsky6rLHb7fRa7lFZ+1MgZWQmJyGkEPBQLEwYhTm
         WCHKL4c3xx4QhwcY2V+exOufBExZgs86BEpboHrRyshlK72reGE6DBpgGZEt+LqOooKb
         GXqw==
X-Gm-Message-State: AOAM530hwGCrIYA0vDH17Pcc4W+vXz9wPI6hTG307aC8Rs/sJnGytG7+
        XqCcCXqDMC5VvLX9kST4hb9w5Q==
X-Google-Smtp-Source: ABdhPJyWequyhgcSOVz4HbyTEiDz8B5zqe7ByoSycjosJOpQ3OBh0xar0Wz4iA5N9BLQs4y9HhJebQ==
X-Received: by 2002:a05:6512:3b93:: with SMTP id g19mr7091745lfv.548.1622233585884;
        Fri, 28 May 2021 13:26:25 -0700 (PDT)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id q184sm709908ljb.54.2021.05.28.13.26.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 May 2021 13:26:25 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     linux-leds@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: [PATCH 3/6] leds: max77693: Move driver to flash subdirectory
Date:   Fri, 28 May 2021 22:24:01 +0200
Message-Id: <20210528202404.431859-3-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210528202404.431859-1-linus.walleij@linaro.org>
References: <20210528202404.431859-1-linus.walleij@linaro.org>
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
 drivers/leds/Kconfig                     | 11 -----------
 drivers/leds/Makefile                    |  1 -
 drivers/leds/flash/Kconfig               | 10 ++++++++++
 drivers/leds/flash/Makefile              |  1 +
 drivers/leds/{ => flash}/leds-max77693.c |  0
 5 files changed, 11 insertions(+), 12 deletions(-)
 rename drivers/leds/{ => flash}/leds-max77693.c (100%)

diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index cfa6b8194b6b..723de0d30039 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -680,17 +680,6 @@ config LEDS_MAX77650
 	help
 	  LEDs driver for MAX77650 family of PMICs from Maxim Integrated.
 
-config LEDS_MAX77693
-	tristate "LED support for MAX77693 Flash"
-	depends on LEDS_CLASS_FLASH
-	depends on V4L2_FLASH_LED_CLASS || !V4L2_FLASH_LED_CLASS
-	depends on MFD_MAX77693
-	depends on OF
-	help
-	  This option enables support for the flash part of the MAX77693
-	  multifunction device. It has build in control for two leds in flash
-	  and torch mode.
-
 config LEDS_MAX8997
 	tristate "LED support for MAX8997 PMIC"
 	depends on LEDS_CLASS && MFD_MAX8997
diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
index a3a6fda8ab99..6f4aa0e6e355 100644
--- a/drivers/leds/Makefile
+++ b/drivers/leds/Makefile
@@ -58,7 +58,6 @@ obj-$(CONFIG_LEDS_LP8788)		+= leds-lp8788.o
 obj-$(CONFIG_LEDS_LP8860)		+= leds-lp8860.o
 obj-$(CONFIG_LEDS_LT3593)		+= leds-lt3593.o
 obj-$(CONFIG_LEDS_MAX77650)		+= leds-max77650.o
-obj-$(CONFIG_LEDS_MAX77693)		+= leds-max77693.o
 obj-$(CONFIG_LEDS_MAX8997)		+= leds-max8997.o
 obj-$(CONFIG_LEDS_MC13783)		+= leds-mc13783.o
 obj-$(CONFIG_LEDS_MENF21BMC)		+= leds-menf21bmc.o
diff --git a/drivers/leds/flash/Kconfig b/drivers/leds/flash/Kconfig
index 1126ad3954b6..6401af23947f 100644
--- a/drivers/leds/flash/Kconfig
+++ b/drivers/leds/flash/Kconfig
@@ -20,6 +20,16 @@ config LEDS_AS3645A
 	  controller. V4L2 flash API is provided as well if
 	  CONFIG_V4L2_FLASH_API is enabled.
 
+config LEDS_MAX77693
+	tristate "LED support for MAX77693 Flash"
+	depends on V4L2_FLASH_LED_CLASS || !V4L2_FLASH_LED_CLASS
+	depends on MFD_MAX77693
+	depends on OF
+	help
+	  This option enables support for the flash part of the MAX77693
+	  multifunction device. It has build in control for two leds in flash
+	  and torch mode.
+
 config LEDS_RT4505
 	tristate "LED support for RT4505 flashlight controller"
 	depends on I2C && OF
diff --git a/drivers/leds/flash/Makefile b/drivers/leds/flash/Makefile
index 9bb2fccee047..c2a5e530261d 100644
--- a/drivers/leds/flash/Makefile
+++ b/drivers/leds/flash/Makefile
@@ -2,5 +2,6 @@
 
 obj-$(CONFIG_LEDS_AAT1290)	+= leds-aat1290.o
 obj-$(CONFIG_LEDS_AS3645A)	+= leds-as3645a.o
+obj-$(CONFIG_LEDS_MAX77693)	+= leds-max77693.o
 obj-$(CONFIG_LEDS_RT4505)	+= leds-rt4505.o
 obj-$(CONFIG_LEDS_RT8515)	+= leds-rt8515.o
diff --git a/drivers/leds/leds-max77693.c b/drivers/leds/flash/leds-max77693.c
similarity index 100%
rename from drivers/leds/leds-max77693.c
rename to drivers/leds/flash/leds-max77693.c
-- 
2.31.1

