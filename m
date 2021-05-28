Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EEE413947EC
	for <lists+linux-leds@lfdr.de>; Fri, 28 May 2021 22:26:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229607AbhE1U2D (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 28 May 2021 16:28:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229563AbhE1U2C (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 28 May 2021 16:28:02 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37D30C061574
        for <linux-leds@vger.kernel.org>; Fri, 28 May 2021 13:26:26 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id v5so6773638ljg.12
        for <linux-leds@vger.kernel.org>; Fri, 28 May 2021 13:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TUAKJ8IRCN2U1wad/t83HjVoTxsdfaJu8QUZUEqiiJQ=;
        b=FUN3yNvlbZ797gZbXALu0DJEmoA+gYIgge+1zASsWygYRD1VIFqeUxLTRELMeY0bcW
         pXNTQVeLiWfvzZvpUu3+naPd/NdqD/1VJyVns2UHj4QAKfWZQ5LB9CY8zCT77eMJbRW7
         aTst78VhGnrJ5RME8fcgb5mfDmqiYRqbIlrTAMbRK4k4s15Phawto6dU1n/RIBWXwqJc
         Teez/ZNMMPS2XRm9nPRz3OTNd0Dh9zcGFE+L1WJD2CyCBSDxAVBkAbyNTRJW9YYNH0Bp
         CUwecdWhyeDVPSY4Ylkq4DIw2+ByD/fyzru0CIZNvMjCN5M7CsilGi4oTGCbPI/oUrbc
         rzPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TUAKJ8IRCN2U1wad/t83HjVoTxsdfaJu8QUZUEqiiJQ=;
        b=DCsdR2v32ID7N5AMVFWvHZEPLpo7oSmxYVG45zEfuvUKjPN0rYoZ9OtzJvPIu84Jz/
         dLZHezgnAPRAF9901g9VYTreIM396XPoZBsY4bPpndK7oLqltq4mB/qqDw+h4hKTjV74
         yOddEZ1Z6ZYwu31vOWBo166KK7UGnwmof3eZCpQ2icLpiOrWQhhijFryTo8htDHzLiSc
         tvGHtvBOxexjToY9gZUv47ZIzcstBf+XkTtnX0OcOsCYhLN3vG1adFmarJ9/O3Eg6Ar7
         X5y8kA76ZrK7TsSoBRfGYbsQeBn49bRzZviThJDyaN2laf7XELZv1HeQdgdghVimg9Ly
         Munw==
X-Gm-Message-State: AOAM531HBU5ANTv8bdZ57Aw+3DZd4eqqQZIsx7bQd8JNbwywCoA9EBon
        5ElYndCPI5DzTg2iU2mvRefp5iv+RqhIVg==
X-Google-Smtp-Source: ABdhPJyJZydqmWPPmNYHwuqqLqv6CwDYHPnEGe0AeA6XuWXSju4ASXy5gdpNQ05uZWozq371ea3d4Q==
X-Received: by 2002:a05:651c:232:: with SMTP id z18mr8088066ljn.489.1622233584587;
        Fri, 28 May 2021 13:26:24 -0700 (PDT)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id q184sm709908ljb.54.2021.05.28.13.26.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 May 2021 13:26:24 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     linux-leds@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [PATCH 2/6] leds: as3645a: Move driver to flash subdirectory
Date:   Fri, 28 May 2021 22:24:00 +0200
Message-Id: <20210528202404.431859-2-linus.walleij@linaro.org>
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

Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 MAINTAINERS                             | 2 +-
 drivers/leds/Kconfig                    | 9 ---------
 drivers/leds/Makefile                   | 1 -
 drivers/leds/flash/Kconfig              | 9 +++++++++
 drivers/leds/flash/Makefile             | 1 +
 drivers/leds/{ => flash}/leds-as3645a.c | 0
 6 files changed, 11 insertions(+), 11 deletions(-)
 rename drivers/leds/{ => flash}/leds-as3645a.c (100%)

diff --git a/MAINTAINERS b/MAINTAINERS
index bd7aff0c120f..7816098d09b9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2793,7 +2793,7 @@ AS3645A LED FLASH CONTROLLER DRIVER
 M:	Sakari Ailus <sakari.ailus@iki.fi>
 L:	linux-leds@vger.kernel.org
 S:	Maintained
-F:	drivers/leds/leds-as3645a.c
+F:	drivers/leds/flash/leds-as3645a.c
 
 ASAHI KASEI AK7375 LENS VOICE COIL DRIVER
 M:	Tianshu Qiu <tian.shu.qiu@intel.com>
diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index a350d8fbb085..cfa6b8194b6b 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -94,15 +94,6 @@ config LEDS_ARIEL
 
 	  Say Y to if your machine is a Dell Wyse 3020 thin client.
 
-config LEDS_AS3645A
-	tristate "AS3645A and LM3555 LED flash controllers support"
-	depends on I2C && LEDS_CLASS_FLASH
-	depends on V4L2_FLASH_LED_CLASS || !V4L2_FLASH_LED_CLASS
-	help
-	  Enable LED flash class support for AS3645A LED flash
-	  controller. V4L2 flash API is provided as well if
-	  CONFIG_V4L2_FLASH_API is enabled.
-
 config LEDS_AW2013
 	tristate "LED support for Awinic AW2013"
 	depends on LEDS_CLASS && I2C && OF
diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
index c7231975837a..a3a6fda8ab99 100644
--- a/drivers/leds/Makefile
+++ b/drivers/leds/Makefile
@@ -14,7 +14,6 @@ obj-$(CONFIG_LEDS_ADP5520)		+= leds-adp5520.o
 obj-$(CONFIG_LEDS_AN30259A)		+= leds-an30259a.o
 obj-$(CONFIG_LEDS_APU)			+= leds-apu.o
 obj-$(CONFIG_LEDS_ARIEL)		+= leds-ariel.o
-obj-$(CONFIG_LEDS_AS3645A)		+= leds-as3645a.o
 obj-$(CONFIG_LEDS_ASIC3)		+= leds-asic3.o
 obj-$(CONFIG_LEDS_AW2013)		+= leds-aw2013.o
 obj-$(CONFIG_LEDS_BCM6328)		+= leds-bcm6328.o
diff --git a/drivers/leds/flash/Kconfig b/drivers/leds/flash/Kconfig
index 736153b0bfd6..1126ad3954b6 100644
--- a/drivers/leds/flash/Kconfig
+++ b/drivers/leds/flash/Kconfig
@@ -11,6 +11,15 @@ config LEDS_AAT1290
 	help
 	  This option enables support for the LEDs on the AAT1290.
 
+config LEDS_AS3645A
+	tristate "AS3645A and LM3555 LED flash controllers support"
+	depends on I2C
+	depends on V4L2_FLASH_LED_CLASS || !V4L2_FLASH_LED_CLASS
+	help
+	  Enable LED flash class support for AS3645A LED flash
+	  controller. V4L2 flash API is provided as well if
+	  CONFIG_V4L2_FLASH_API is enabled.
+
 config LEDS_RT4505
 	tristate "LED support for RT4505 flashlight controller"
 	depends on I2C && OF
diff --git a/drivers/leds/flash/Makefile b/drivers/leds/flash/Makefile
index 11bec5881d51..9bb2fccee047 100644
--- a/drivers/leds/flash/Makefile
+++ b/drivers/leds/flash/Makefile
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 
 obj-$(CONFIG_LEDS_AAT1290)	+= leds-aat1290.o
+obj-$(CONFIG_LEDS_AS3645A)	+= leds-as3645a.o
 obj-$(CONFIG_LEDS_RT4505)	+= leds-rt4505.o
 obj-$(CONFIG_LEDS_RT8515)	+= leds-rt8515.o
diff --git a/drivers/leds/leds-as3645a.c b/drivers/leds/flash/leds-as3645a.c
similarity index 100%
rename from drivers/leds/leds-as3645a.c
rename to drivers/leds/flash/leds-as3645a.c
-- 
2.31.1

