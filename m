Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A2093947EF
	for <lists+linux-leds@lfdr.de>; Fri, 28 May 2021 22:26:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229618AbhE1U2J (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 28 May 2021 16:28:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229589AbhE1U2G (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 28 May 2021 16:28:06 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35252C061574
        for <linux-leds@vger.kernel.org>; Fri, 28 May 2021 13:26:30 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id a2so7026203lfc.9
        for <linux-leds@vger.kernel.org>; Fri, 28 May 2021 13:26:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qbYTPH0dXLJe60KT6GUwl9z9aucwOkzrzW5kGt6lPOY=;
        b=T9zLAP0VBe5iKeVBBPfF9eIkBX/X4JVjxoFrty6yo+/0RMd3d4rIXYWq2Gzx9wuthq
         scCh78XTw5jja3T5niUWUdSqhHzpQ0jgqfwNt61lNH5iL0Ajm5hoJz0LkvuklrqUPKSW
         Ob5xFnZge1QIGtye2Zm1k3Lg58WXk7GiO0Frjmd2qsz4HiAQ3GyyBPWqywdK+n6VHtZU
         6wamYcL0w6PGKSnKi0F1w4M+7DL8Kz6N1THl/Rle3kzxUuTYvUrx1pSY1uuHzkWqAdcR
         +eL8QDWNkPCZlMqU35SodUBNA9pZFenidHGj1m/0qhwTpUrNWhgm8vTB0VdyJ93+XWDT
         J1/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qbYTPH0dXLJe60KT6GUwl9z9aucwOkzrzW5kGt6lPOY=;
        b=r33+qMzXiFnQhmocUNgq3ezwzbATVWtqjUh7wSsUTmvZEG0NjuvXmeQTGdvT9mDMgI
         q4h0VU0jLHkJE6A5FYlo9SwONt0d81Q2dowAXgyvnpn5y2Px6DqQhmelRrC3D9XP9LS4
         hfpxTh5iwM0G7vHf10Gb5LKkUom7nzWcjqpFQHm/1FNw6cJ5H2q5uscjIduOPmMQd2zP
         lPhwaNU+zn5R3UTtipjPGAP65LWXGMje8q7aCO1gzDLE8IrxD9+0399YOQwTSBEqs/9M
         cmCz2ZrRX8zzOqMpobByUnNtae2HU2vOgWEmN+gYG7pNE7u8sBNB4m+B3SmoDwCNyfhs
         eQQQ==
X-Gm-Message-State: AOAM531SBj78sxKOivApKsopze0Zs30egkGnNTpZY8GGuX799QtadNW3
        Ya628I0zpmprP0dtuyh9qEkd0g==
X-Google-Smtp-Source: ABdhPJwcqw1VxhgziqETklby28ACl2tCxU4KOwrqjC78m/mmRN/52uF2S1wzhUPNSudjV5K5Wf/FXA==
X-Received: by 2002:a05:6512:3da8:: with SMTP id k40mr6939036lfv.450.1622233588557;
        Fri, 28 May 2021 13:26:28 -0700 (PDT)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id q184sm709908ljb.54.2021.05.28.13.26.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 May 2021 13:26:28 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     linux-leds@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Dan Murphy <dmurphy@ti.com>
Subject: [PATCH 5/6] leds: lm3601x: Move driver to flash subdirectory
Date:   Fri, 28 May 2021 22:24:03 +0200
Message-Id: <20210528202404.431859-5-linus.walleij@linaro.org>
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

Cc: Dan Murphy <dmurphy@ti.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/leds/Kconfig                    | 9 ---------
 drivers/leds/Makefile                   | 1 -
 drivers/leds/flash/Kconfig              | 8 ++++++++
 drivers/leds/flash/Makefile             | 1 +
 drivers/leds/{ => flash}/leds-lm3601x.c | 0
 5 files changed, 9 insertions(+), 10 deletions(-)
 rename drivers/leds/{ => flash}/leds-lm3601x.c (100%)

diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index 171ccfd4de1b..1671aa2f90b5 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -220,15 +220,6 @@ config LEDS_LM3692X
 	  This option enables support for the TI LM3692x family
 	  of white LED string drivers used for backlighting.
 
-config LEDS_LM3601X
-	tristate "LED support for LM3601x Chips"
-	depends on LEDS_CLASS && I2C
-	depends on LEDS_CLASS_FLASH
-	select REGMAP_I2C
-	help
-	  This option enables support for the TI LM3601x family
-	  of flash, torch and indicator classes.
-
 config LEDS_LOCOMO
 	tristate "LED Support for Locomo device"
 	depends on LEDS_CLASS
diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
index 5e804f72b8e5..6d5c23afaf98 100644
--- a/drivers/leds/Makefile
+++ b/drivers/leds/Makefile
@@ -40,7 +40,6 @@ obj-$(CONFIG_LEDS_LM3530)		+= leds-lm3530.o
 obj-$(CONFIG_LEDS_LM3532)		+= leds-lm3532.o
 obj-$(CONFIG_LEDS_LM3533)		+= leds-lm3533.o
 obj-$(CONFIG_LEDS_LM355x)		+= leds-lm355x.o
-obj-$(CONFIG_LEDS_LM3601X)		+= leds-lm3601x.o
 obj-$(CONFIG_LEDS_LM36274)		+= leds-lm36274.o
 obj-$(CONFIG_LEDS_LM3642)		+= leds-lm3642.o
 obj-$(CONFIG_LEDS_LM3692X)		+= leds-lm3692x.o
diff --git a/drivers/leds/flash/Kconfig b/drivers/leds/flash/Kconfig
index 788d698587a7..6cb6600555f0 100644
--- a/drivers/leds/flash/Kconfig
+++ b/drivers/leds/flash/Kconfig
@@ -20,6 +20,14 @@ config LEDS_AS3645A
 	  controller. V4L2 flash API is provided as well if
 	  CONFIG_V4L2_FLASH_API is enabled.
 
+config LEDS_LM3601X
+	tristate "LED support for LM3601x Chips"
+	depends on LEDS_CLASS && I2C
+	select REGMAP_I2C
+	help
+	  This option enables support for the TI LM3601x family
+	  of flash, torch and indicator classes.
+
 config LEDS_MAX77693
 	tristate "LED support for MAX77693 Flash"
 	depends on V4L2_FLASH_LED_CLASS || !V4L2_FLASH_LED_CLASS
diff --git a/drivers/leds/flash/Makefile b/drivers/leds/flash/Makefile
index 2f9153e78717..67556329441e 100644
--- a/drivers/leds/flash/Makefile
+++ b/drivers/leds/flash/Makefile
@@ -2,6 +2,7 @@
 
 obj-$(CONFIG_LEDS_AAT1290)	+= leds-aat1290.o
 obj-$(CONFIG_LEDS_AS3645A)	+= leds-as3645a.o
+obj-$(CONFIG_LEDS_LM3601X)	+= leds-lm3601x.o
 obj-$(CONFIG_LEDS_MAX77693)	+= leds-max77693.o
 obj-$(CONFIG_LEDS_RT4505)	+= leds-rt4505.o
 obj-$(CONFIG_LEDS_RT8515)	+= leds-rt8515.o
diff --git a/drivers/leds/leds-lm3601x.c b/drivers/leds/flash/leds-lm3601x.c
similarity index 100%
rename from drivers/leds/leds-lm3601x.c
rename to drivers/leds/flash/leds-lm3601x.c
-- 
2.31.1

