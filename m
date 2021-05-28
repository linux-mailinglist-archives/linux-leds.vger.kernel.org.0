Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A24613947F0
	for <lists+linux-leds@lfdr.de>; Fri, 28 May 2021 22:26:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229589AbhE1U2J (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 28 May 2021 16:28:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229616AbhE1U2H (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 28 May 2021 16:28:07 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4367C06174A
        for <linux-leds@vger.kernel.org>; Fri, 28 May 2021 13:26:31 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id e17so7087520lfb.2
        for <linux-leds@vger.kernel.org>; Fri, 28 May 2021 13:26:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2nvFIf9K+8bSqa+V/uXhIo4b03jKOmYhREmjOr7Bhug=;
        b=rsg8diga6/YM9VHRxOZ73FFsbYuIo8s7sDA6tups25GS0BeTQtiiWvAV6rDVQc2jH0
         C9TPfXd6r6eVkNyuW92shbePESMNTBRXem/2BAxAn/fx7K+fJIhB4SycAkuAEdeNGv8e
         Xtaj61/vrGkWpX7c9IOFfbLqorXRRwHz1/2xpsytUSE6UoEXn0V+ggXdrI90nrGRa5t3
         VZaeOQVj9KeLLpQp1pVwcg3cUpwhzz/p7Mx06o0m213ykM3N9ahrCVsnBWXLnRmBn6j0
         lATr6mfVfy1vy1yqCEMtlFoe7cYrFGVemjSztJ7n9OIWriLh7eiGdfaoos0F4zAwiPW1
         RGhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2nvFIf9K+8bSqa+V/uXhIo4b03jKOmYhREmjOr7Bhug=;
        b=r5I4t73HLAfJNwaUIQ8CFXNBylb5j2Kv82Eok69gg5dVD076uvJIajMtovqo3kvpTq
         aR+n97CsOPBIRd3dakF4UHKq8oST9S3fBr+iPQs6ri5KMV9YjYQc0j9YneYsh9VC89+B
         kDLctgkppx/IBI+TJst6v2S2o8t2DHkrwcihxfcNavh1gH3WeDQUEo5xKXvQfigBt15p
         LrAs/jboHbzycKzhVPlaM6VXuUZyJDLF57mJfk0tY7xqjwOZM4ohj87dBG9ptoxUWaAC
         OxE4I1zmQAHbTlPmwW5jKhlxDzJIbZdtKIK7e8NFm/ier8zRWaeqk/5wo1tzSaYCSGJR
         EOOQ==
X-Gm-Message-State: AOAM531hdmDrpTJl5O4Vl9nE2IrIC/VfHiTEJjuby1cQAjcJHOfOLNTr
        85Ecgl5hkIKVas5W4AJ9MtVx/g==
X-Google-Smtp-Source: ABdhPJw8kUO+uKtUYecNbsbVslZJwO2lAarfgMXA2uiwFaLrQgr4Oh7XDPjOWAd16BPEYKJqLPiSjQ==
X-Received: by 2002:a05:6512:1288:: with SMTP id u8mr6960261lfs.657.1622233590019;
        Fri, 28 May 2021 13:26:30 -0700 (PDT)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id q184sm709908ljb.54.2021.05.28.13.26.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 May 2021 13:26:29 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     linux-leds@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Ingi Kim <ingi2.kim@samsung.com>
Subject: [PATCH 6/6] leds: ktd2692: Move driver to flash subdirectory
Date:   Fri, 28 May 2021 22:24:04 +0200
Message-Id: <20210528202404.431859-6-linus.walleij@linaro.org>
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

Cc: Ingi Kim <ingi2.kim@samsung.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/leds/Kconfig                    | 10 ----------
 drivers/leds/Makefile                   |  1 -
 drivers/leds/flash/Kconfig              | 10 ++++++++++
 drivers/leds/flash/Makefile             |  1 +
 drivers/leds/{ => flash}/leds-ktd2692.c |  0
 5 files changed, 11 insertions(+), 11 deletions(-)
 rename drivers/leds/{ => flash}/leds-ktd2692.c (100%)

diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index 1671aa2f90b5..da7773dc8670 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -702,16 +702,6 @@ config LEDS_MENF21BMC
 	  This driver can also be built as a module. If so the module
 	  will be called leds-menf21bmc.
 
-config LEDS_KTD2692
-	tristate "LED support for KTD2692 flash LED controller"
-	depends on LEDS_CLASS_FLASH && OF
-	depends on GPIOLIB || COMPILE_TEST
-	help
-	  This option enables support for KTD2692 LED flash connected
-	  through ExpressWire interface.
-
-	  Say Y to enable this driver.
-
 config LEDS_IS31FL319X
 	tristate "LED Support for ISSI IS31FL319x I2C LED controller family"
 	depends on LEDS_CLASS && I2C && OF
diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
index 6d5c23afaf98..c636ec069612 100644
--- a/drivers/leds/Makefile
+++ b/drivers/leds/Makefile
@@ -35,7 +35,6 @@ obj-$(CONFIG_LEDS_IP30)			+= leds-ip30.o
 obj-$(CONFIG_LEDS_IPAQ_MICRO)		+= leds-ipaq-micro.o
 obj-$(CONFIG_LEDS_IS31FL319X)		+= leds-is31fl319x.o
 obj-$(CONFIG_LEDS_IS31FL32XX)		+= leds-is31fl32xx.o
-obj-$(CONFIG_LEDS_KTD2692)		+= leds-ktd2692.o
 obj-$(CONFIG_LEDS_LM3530)		+= leds-lm3530.o
 obj-$(CONFIG_LEDS_LM3532)		+= leds-lm3532.o
 obj-$(CONFIG_LEDS_LM3533)		+= leds-lm3533.o
diff --git a/drivers/leds/flash/Kconfig b/drivers/leds/flash/Kconfig
index 6cb6600555f0..b230f3d65eb0 100644
--- a/drivers/leds/flash/Kconfig
+++ b/drivers/leds/flash/Kconfig
@@ -20,6 +20,16 @@ config LEDS_AS3645A
 	  controller. V4L2 flash API is provided as well if
 	  CONFIG_V4L2_FLASH_API is enabled.
 
+config LEDS_KTD2692
+	tristate "LED support for Kinetic KTD2692 flash LED controller"
+	depends on OF
+	depends on GPIOLIB || COMPILE_TEST
+	help
+	  This option enables support for Kinetic KTD2692 LED flash connected
+	  through ExpressWire interface.
+
+	  Say Y to enable this driver.
+
 config LEDS_LM3601X
 	tristate "LED support for LM3601x Chips"
 	depends on LEDS_CLASS && I2C
diff --git a/drivers/leds/flash/Makefile b/drivers/leds/flash/Makefile
index 67556329441e..ebea42f9c37e 100644
--- a/drivers/leds/flash/Makefile
+++ b/drivers/leds/flash/Makefile
@@ -2,6 +2,7 @@
 
 obj-$(CONFIG_LEDS_AAT1290)	+= leds-aat1290.o
 obj-$(CONFIG_LEDS_AS3645A)	+= leds-as3645a.o
+obj-$(CONFIG_LEDS_KTD2692)	+= leds-ktd2692.o
 obj-$(CONFIG_LEDS_LM3601X)	+= leds-lm3601x.o
 obj-$(CONFIG_LEDS_MAX77693)	+= leds-max77693.o
 obj-$(CONFIG_LEDS_RT4505)	+= leds-rt4505.o
diff --git a/drivers/leds/leds-ktd2692.c b/drivers/leds/flash/leds-ktd2692.c
similarity index 100%
rename from drivers/leds/leds-ktd2692.c
rename to drivers/leds/flash/leds-ktd2692.c
-- 
2.31.1

