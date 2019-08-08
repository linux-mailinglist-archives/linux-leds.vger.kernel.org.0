Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6AC9A862F1
	for <lists+linux-leds@lfdr.de>; Thu,  8 Aug 2019 15:20:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732643AbfHHNUZ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 8 Aug 2019 09:20:25 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:46387 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732933AbfHHNUY (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 8 Aug 2019 09:20:24 -0400
Received: by mail-lj1-f193.google.com with SMTP id v24so89033408ljg.13
        for <linux-leds@vger.kernel.org>; Thu, 08 Aug 2019 06:20:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tsmMXyG+3x5AZXEqNlZQgoo7f68pElfGVBoRv0b3gvo=;
        b=LzCxGiaxNOfjM+78XDZTOJRnskTb08MwprRO+ginrWKGzqmVwBJI9yr/3Rsg1SkyNT
         Qr+fQNsZWF7/2kd1hmMEId6HKez+Ui42TK73FZLtZWJD+dMmirdeg0mMgIslvjYfgYs4
         V8g7AijBN3bI0Dey1KCSZozlxsIzvr7b8gW+V7ZrNxisfMCC1Q2VXI/gImr739S9ZxYa
         DY2sjGavW4dVqyN/seeqr4dQXPxhPbMTf7YjZOoL1q3Ooe3HBvruyF1gFPSFFKk89eYF
         8i5huDNzT/7FL5JngRy2XeyElgXKHUt4WoXFhTVP9/oijXALFcYgmsXN0OZYO37tqMiy
         o7Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tsmMXyG+3x5AZXEqNlZQgoo7f68pElfGVBoRv0b3gvo=;
        b=cteY/wVkc9cu7MQ2y5xMyPSBpi22Q14DtWuY3LwbjVNvKk5jf15GrhYBwZAs3Bm+E3
         8+Fm3z7DngZ6bCJ9XGgqq6hnH4bC5wfDzjg7tw7Tzfcf4QiYTqLCnkv67lY3JL+rAUIG
         AvKLqS1kJ7b89Q1E+WTHTSFXTZxq1XZ7iJ1UtIf1tIg6iVgdJbQAJVchOOhRGg/WUOQY
         DrtGXYyOYBu1RlUdlkz7Nkv3j+rDBHjeiyQ/sY9Y2QfGfo5HhHCNuIm0uPpwFpQN093p
         YlTfQrg/q37WQx0ClsY2owCS8sU8tA5LW10LxywBovmQknQwB/EcurlRWerPBNRax5do
         eB0A==
X-Gm-Message-State: APjAAAVuJ39Z2U3VPppJaRMeAg/sIoWpIhLINt8YVmvtKg1yOIPj5GUC
        bPY/aq0iKAfUNzjBSbT7ApyW2w==
X-Google-Smtp-Source: APXvYqzPnhou3Ga35/6S9wocY6g0QkLOdo2fi/7VCtzcxiTxVSFHuUD8SugzQcfOG814zlYnc0ilJg==
X-Received: by 2002:a05:651c:150:: with SMTP id c16mr2959578ljd.193.1565270422890;
        Thu, 08 Aug 2019 06:20:22 -0700 (PDT)
Received: from genomnajs.ideon.se ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id r8sm5025831lfc.39.2019.08.08.06.20.21
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 08 Aug 2019 06:20:21 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>
Cc:     linux-leds@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] gpio: pca953x: Include the right header
Date:   Thu,  8 Aug 2019 15:20:20 +0200
Message-Id: <20190808132020.15470-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

This LED chip provides a GPIO driver, so include
<linux/gpio/driver.h> rather than the legacy header
<linux/gpio.h>.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/leds/leds-pca9532.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/leds-pca9532.c b/drivers/leds/leds-pca9532.c
index 290871072d65..c7c7199e8ebd 100644
--- a/drivers/leds/leds-pca9532.c
+++ b/drivers/leds/leds-pca9532.c
@@ -16,7 +16,7 @@
 #include <linux/mutex.h>
 #include <linux/workqueue.h>
 #include <linux/leds-pca9532.h>
-#include <linux/gpio.h>
+#include <linux/gpio/driver.h>
 #include <linux/of.h>
 #include <linux/of_device.h>
 
-- 
2.21.0

