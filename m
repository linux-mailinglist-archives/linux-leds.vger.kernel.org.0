Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C08F73A5AF1
	for <lists+linux-leds@lfdr.de>; Mon, 14 Jun 2021 01:20:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232168AbhFMXWJ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 13 Jun 2021 19:22:09 -0400
Received: from mail-lf1-f45.google.com ([209.85.167.45]:42975 "EHLO
        mail-lf1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232154AbhFMXWI (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 13 Jun 2021 19:22:08 -0400
Received: by mail-lf1-f45.google.com with SMTP id j2so17855108lfg.9
        for <linux-leds@vger.kernel.org>; Sun, 13 Jun 2021 16:19:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hRCpeFmIYg1JEjTMc8/Ljy8Q0O+bWExH/qyGdjQ4Qss=;
        b=TxcVq8hqCuc+T+N2Wfds3XQrEZzsvkf0Yxb26VeHRn07YVIOllCCvPTNQsyntTv2nv
         pjMdY8aazKodij8tVBphYmaXpbiuh81XQafg5a23NaUN2zU9DLqV2O0U1B4RDxoUbwn2
         Ci8BKZer5JDjnFct1mqVXuQLsk89Ltgjke6gmqSTw0cWgfK7vyHe3vwklK/rBRCy7pTB
         SoFsalp3HRY+vBxWSuEJ9sHzhYncGvj+krzK/OGxRZTKp6eyCY1gmGu69GvmGmkjIMGl
         2VZjgqDcWJXhlxZBCUwqY5SkJRsIZLy1TK+DVoPcmTI0JzD8YRdDYCDDRrFsn0HxHJQj
         7QGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hRCpeFmIYg1JEjTMc8/Ljy8Q0O+bWExH/qyGdjQ4Qss=;
        b=keDqwB1hZ28dRfWVN8xEr1tXjY9kSWMo5S74wtmnkfcFWj0Cs7FP3miBNQLIiqNYnx
         wOYl9jZV9voB99YtzTNMZEQdC4oxSUoiswkiUMDOcajDmBInTDRYtFzKd5381w2ZKsHf
         bCiGOgZl3ba/gQfPAwM6mOyvsNGpAxoO9DQB0dozEd4liaI3gcYmYLdnxQUc/zF8KAza
         Gy6Z/T4YTLh9+E1UqVbBJmfScBM/Bd/J/HCil8pjU4dRxAEHIk4mgMiKJFdEEA1rj+op
         0oGIypLGQjKMhvxTcGr7jcplEPe36tvvYXc/DWbkXfKtUKlkaWX1s95lF3LljbZET5Kl
         vS4g==
X-Gm-Message-State: AOAM533+bT2/GWCJIn04bo4SLDIJkXfmp80+ay6ShyoQtG6giPpgeLi1
        NHYGifEo78ToOCh8HTvmY7YrpQ==
X-Google-Smtp-Source: ABdhPJw3/e4AMcVHCpBpnrVY13ajERn93hcptp9zsAdJfs/ciX39oDrL3Sp7lHhHQhjkGLfMoN6LKw==
X-Received: by 2002:a19:7402:: with SMTP id v2mr6641845lfe.398.1623626329589;
        Sun, 13 Jun 2021 16:18:49 -0700 (PDT)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id y20sm1295781lfj.236.2021.06.13.16.18.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Jun 2021 16:18:49 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     linux-leds@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Amireddy Mallikarjuna reddy 
        <mallikarjunax.reddy@linux.intel.com>
Subject: [PATCH] leds: lgm: Fix up includes
Date:   Mon, 14 Jun 2021 01:16:47 +0200
Message-Id: <20210613231647.511805-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

This driver is including the legacy GPIO header <linux/gpio.h>
but the only thing it is using from that header is the wrong
define for GPIOF_DIR_OUT.

Fix it up by using GPIO_LINE_DIRECTION_OUT and including the
correct consumer and driver headers.

Cc: Amireddy Mallikarjuna reddy <mallikarjunax.reddy@linux.intel.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/leds/blink/leds-lgm-sso.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/leds/blink/leds-lgm-sso.c b/drivers/leds/blink/leds-lgm-sso.c
index 6a63846d10b5..4c70f7d022ac 100644
--- a/drivers/leds/blink/leds-lgm-sso.c
+++ b/drivers/leds/blink/leds-lgm-sso.c
@@ -7,7 +7,8 @@
 
 #include <linux/bitfield.h>
 #include <linux/clk.h>
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
+#include <linux/gpio/driver.h>
 #include <linux/init.h>
 #include <linux/kernel.h>
 #include <linux/leds.h>
@@ -423,7 +424,7 @@ static void sso_gpio_free(struct gpio_chip *chip, unsigned int offset)
 
 static int sso_gpio_get_dir(struct gpio_chip *chip, unsigned int offset)
 {
-	return GPIOF_DIR_OUT;
+	return GPIO_LINE_DIRECTION_OUT;
 }
 
 static int
-- 
2.31.1

