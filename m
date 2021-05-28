Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 876583947EE
	for <lists+linux-leds@lfdr.de>; Fri, 28 May 2021 22:26:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229612AbhE1U2E (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 28 May 2021 16:28:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229589AbhE1U2E (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 28 May 2021 16:28:04 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 016D3C061574
        for <linux-leds@vger.kernel.org>; Fri, 28 May 2021 13:26:29 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id v8so7037327lft.8
        for <linux-leds@vger.kernel.org>; Fri, 28 May 2021 13:26:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LxWC3vqRK4riX3AOu3PMRZSJjS9JAOvjJvGx0mZ+krs=;
        b=om2Z93AyPtbwA1PZ5zKN11E8qtx9VylIlH0mhFxeTo0uyUSAyAXiNSXvokiW8WblMY
         EQtd9rKVT4jKKTGMi15vk2IGMNu+S/VAasYCSvV0+e3zBcihqyiXn4NW/3nBj5q8WdFZ
         ZFa5GkMXTNOqtykoErbFvvbLIlSgXNQ11jow6CjNlRVFXt7GsrW41X5gX7llXhr14X7m
         UFJ3uPFk67c7T0HEegmPSwHrEe/f9JSuxweyC6rdJv1BwmLCS1XD4fxh283jC6qooJnn
         EdJKzCofeJ53fIeC2j5uduwqB4FLONx+wBHY4ABagEA9DUdzIZstmBlp/SNUkywb8wXj
         th5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LxWC3vqRK4riX3AOu3PMRZSJjS9JAOvjJvGx0mZ+krs=;
        b=pG0m1VZSLiBVxElyctdi0ffXqIPwuage10XNOZ6ga4iuolTzF4rSKdu5CcoDJLxw7Y
         pMZi6yjRJoGN3xZu2I0KMlTf0foFUw6vUlA85C2ucAghiBLhO9ktDHxyz+qBype+SViK
         TUbsiIZQFwKaQ9EhGo1Wb5q2CC4GqtcqXTZSQOvveuHe+cvE7vLUqRjps5OJj87sLhya
         hb9n9Z7duRcRR+OtA2bBOkKENY7QKdbPcoPNA206Mr39oM7qdooBY+rz8tSMFCzKnNzn
         IKrajfdCn4ZvYKLClXXE1xIRlwvCucRRC2UMyDmyH3k39yXVde6gxBRORJUKwnTWk1WL
         4Sog==
X-Gm-Message-State: AOAM5304n+fzrvv4idez8kuzyQwgtq369J6oQ/OFG6woVyCQ06behsZ3
        23PpZEZgzDDh9d3SGZnnWlNdVQ==
X-Google-Smtp-Source: ABdhPJyMU1JWX74Dr4jBgGtHhHGl1qUtulnJoGOrkMVFBFiRHzG756nEdK0lI4kLcnIObSoBM/Dqcw==
X-Received: by 2002:a19:9104:: with SMTP id t4mr6716699lfd.43.1622233587324;
        Fri, 28 May 2021 13:26:27 -0700 (PDT)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id q184sm709908ljb.54.2021.05.28.13.26.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 May 2021 13:26:27 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     linux-leds@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Luca Weiss <luca@z3ntu.xyz>
Subject: [PATCH 4/6] leds: sgm3140: Move driver to flash subdirectory
Date:   Fri, 28 May 2021 22:24:02 +0200
Message-Id: <20210528202404.431859-4-linus.walleij@linaro.org>
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

Cc: Luca Weiss <luca@z3ntu.xyz>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/leds/Kconfig                    | 8 --------
 drivers/leds/Makefile                   | 1 -
 drivers/leds/flash/Kconfig              | 7 +++++++
 drivers/leds/flash/Makefile             | 1 +
 drivers/leds/{ => flash}/leds-sgm3140.c | 0
 5 files changed, 8 insertions(+), 9 deletions(-)
 rename drivers/leds/{ => flash}/leds-sgm3140.c (100%)

diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index 723de0d30039..171ccfd4de1b 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -883,14 +883,6 @@ config LEDS_IP30
 	  To compile this driver as a module, choose M here: the module
 	  will be called leds-ip30.
 
-config LEDS_SGM3140
-	tristate "LED support for the SGM3140"
-	depends on LEDS_CLASS_FLASH
-	depends on V4L2_FLASH_LED_CLASS || !V4L2_FLASH_LED_CLASS
-	help
-	  This option enables support for the SGM3140 500mA Buck/Boost Charge
-	  Pump LED Driver.
-
 config LEDS_ACER_A500
 	tristate "Power button LED support for Acer Iconia Tab A500"
 	depends on LEDS_CLASS && MFD_ACER_A500_EC
diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
index 6f4aa0e6e355..5e804f72b8e5 100644
--- a/drivers/leds/Makefile
+++ b/drivers/leds/Makefile
@@ -79,7 +79,6 @@ obj-$(CONFIG_LEDS_PWM)			+= leds-pwm.o
 obj-$(CONFIG_LEDS_REGULATOR)		+= leds-regulator.o
 obj-$(CONFIG_LEDS_S3C24XX)		+= leds-s3c24xx.o
 obj-$(CONFIG_LEDS_SC27XX_BLTC)		+= leds-sc27xx-bltc.o
-obj-$(CONFIG_LEDS_SGM3140)		+= leds-sgm3140.o
 obj-$(CONFIG_LEDS_SUNFIRE)		+= leds-sunfire.o
 obj-$(CONFIG_LEDS_SYSCON)		+= leds-syscon.o
 obj-$(CONFIG_LEDS_TCA6507)		+= leds-tca6507.o
diff --git a/drivers/leds/flash/Kconfig b/drivers/leds/flash/Kconfig
index 6401af23947f..788d698587a7 100644
--- a/drivers/leds/flash/Kconfig
+++ b/drivers/leds/flash/Kconfig
@@ -52,4 +52,11 @@ config LEDS_RT8515
 	  To compile this driver as a module, choose M here: the module
 	  will be called leds-rt8515.
 
+config LEDS_SGM3140
+	tristate "LED support for the SGM3140"
+	depends on V4L2_FLASH_LED_CLASS || !V4L2_FLASH_LED_CLASS
+	help
+	  This option enables support for the SGM3140 500mA Buck/Boost Charge
+	  Pump LED Driver.
+
 endif # LEDS_CLASS_FLASH
diff --git a/drivers/leds/flash/Makefile b/drivers/leds/flash/Makefile
index c2a5e530261d..2f9153e78717 100644
--- a/drivers/leds/flash/Makefile
+++ b/drivers/leds/flash/Makefile
@@ -5,3 +5,4 @@ obj-$(CONFIG_LEDS_AS3645A)	+= leds-as3645a.o
 obj-$(CONFIG_LEDS_MAX77693)	+= leds-max77693.o
 obj-$(CONFIG_LEDS_RT4505)	+= leds-rt4505.o
 obj-$(CONFIG_LEDS_RT8515)	+= leds-rt8515.o
+obj-$(CONFIG_LEDS_SGM3140)	+= leds-sgm3140.o
diff --git a/drivers/leds/leds-sgm3140.c b/drivers/leds/flash/leds-sgm3140.c
similarity index 100%
rename from drivers/leds/leds-sgm3140.c
rename to drivers/leds/flash/leds-sgm3140.c
-- 
2.31.1

