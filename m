Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57F651AA154
	for <lists+linux-leds@lfdr.de>; Wed, 15 Apr 2020 14:46:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S369903AbgDOMhP (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 15 Apr 2020 08:37:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S369896AbgDOMhN (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Wed, 15 Apr 2020 08:37:13 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 918C8C061A0C
        for <linux-leds@vger.kernel.org>; Wed, 15 Apr 2020 05:37:12 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id u15so3498242ljd.3
        for <linux-leds@vger.kernel.org>; Wed, 15 Apr 2020 05:37:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=84jmeY8yD94bXgAA6yS5WB/Jxq14nK2lnqrW4lJ2Iq0=;
        b=IstT0BfTm89sG9IEQ0MyI2/a6M/Zx2dJMTKDjJaR8wMu/RzPaz8+wfEm3oNRgaLR+M
         jEcdlIL53GzmorEEyYN5EXAKX1ZISrGrIP0IKSA/gLKAoUGVacG3ShROCOWsVl5HscOy
         Bvebu3DAVQlqQWB7bWxQFAYc54c9wSG/60UYrOlFr1Phw5ejeZ4uhuGL/aFoPqab/drZ
         J3jrnn4XpT9KOD4ll0vgnQfXzwFbGS75ONa8mIdFqYd/dYd9bZyTJfE+s+rVURX1473W
         a0suM0G5JDf4v/l5itZQCPvq1mBS96ONfbZnKa7QH9upjxCsqA/k5M7q5lT/JXOZNw7P
         tHYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=84jmeY8yD94bXgAA6yS5WB/Jxq14nK2lnqrW4lJ2Iq0=;
        b=K79wq3sjGJKi3nIPFenZUrYqMIb1PvGFsiZjjeL4Xt1OmZDXawt24oWO4P/rXZUUot
         deT458AFQ8RkQqIwqNZUq4kdVMXKbW0n1RpdqCZiXGQpzP4yBztGYxB505wanT1NV/lf
         zDbyf+yksDXqdQrXrBLEz57dP1D+izQUlEQswa7aBlW1y4T6EzdhRkMek+zS0fAKG+K/
         lKZ7n2RtuZuBWxuFr1kYskJtS+vGGL3FBl02oDs4W1pJN5sNJADtsH83niWrQ9Qdct8X
         oLv2qnO82Js4yggL+xrH7uzNGA1TUikV6k2LYG5uLs70v5W8j8iUBPnkCyeMGADB69DG
         cmYg==
X-Gm-Message-State: AGi0PubmBHO1G0/WCbdkPzdm7xe8jik1u0lu5cgPyu9m5QjII6je3HhU
        VJaAVWfMh5QYGTMLlrnaeZj0KD13B1U=
X-Google-Smtp-Source: APiQypJGWUo1mYumYlSqnIURwDhLv5xSwpiP4gWKDI2pDkunRI2T200Gu3mlozaNSF+F1P9uaaXxdg==
X-Received: by 2002:a05:651c:23b:: with SMTP id z27mr3027697ljn.125.1586954230989;
        Wed, 15 Apr 2020 05:37:10 -0700 (PDT)
Received: from localhost.localdomain (c-f3d7225c.014-348-6c756e10.bbcust.telenor.se. [92.34.215.243])
        by smtp.gmail.com with ESMTPSA id v64sm1557906lfa.54.2020.04.15.05.37.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2020 05:37:10 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>
Cc:     linux-leds@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Tony Makkiel <tony.makkiel@daqri.com>
Subject: [PATCH] leds: lp3952: Include the right header
Date:   Wed, 15 Apr 2020 14:35:08 +0200
Message-Id: <20200415123508.113621-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.25.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

This driver is using the GPIO descriptor API properly
as it should be but is including the legacy GPIO header
<linux/gpio.h>. Fix it by including <linux/gpio/consumer.h>
instead.

Cc: Tony Makkiel <tony.makkiel@daqri.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/leds/leds-lp3952.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/leds-lp3952.c b/drivers/leds/leds-lp3952.c
index 4e4e542774cb..6ee9131fbf25 100644
--- a/drivers/leds/leds-lp3952.c
+++ b/drivers/leds/leds-lp3952.c
@@ -7,7 +7,7 @@
  */
 
 #include <linux/delay.h>
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
 #include <linux/io.h>
 #include <linux/kernel.h>
-- 
2.25.2

