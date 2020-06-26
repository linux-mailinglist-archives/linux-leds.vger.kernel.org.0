Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E9FC120BCED
	for <lists+linux-leds@lfdr.de>; Sat, 27 Jun 2020 00:47:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725931AbgFZWrl (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 26 Jun 2020 18:47:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725913AbgFZWrl (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 26 Jun 2020 18:47:41 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A83BC03E979
        for <linux-leds@vger.kernel.org>; Fri, 26 Jun 2020 15:47:41 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id d21so5980464lfb.6
        for <linux-leds@vger.kernel.org>; Fri, 26 Jun 2020 15:47:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2+560p/rARAZT9qzw01ojEh0mFbjhFo9sC0CCzw58pw=;
        b=tPrcq6jjyPfgOiR/H1djdjwHVUCccUC7DDRdg/01BOFIWG46dwEAViH7Foxtmcc3Zc
         Y6LecHfEkWi5gMvIRBCcNb2ynyefI6ubKUj853R2OnPRWs8FjEGoQ1o8no8PrNc0h8yv
         9HXSUngDOubtjgm7uMmRKPyS84lfSBmTlxm5LblBmg6rXHWXIE5VSPP6zAMJ09GNzzV6
         C5JvdVSvnLC0h+fpDVHFUe78o0c4UqzrVaPs/ULRcA4lh21iASu69U53HATMlH4btidh
         asFi0D/v3CHno23sq64PPtmmb08iSIzvpweyEAsOl0oYQ9ZGCsqRKSJ5tMRWDAbvLrp9
         UNCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2+560p/rARAZT9qzw01ojEh0mFbjhFo9sC0CCzw58pw=;
        b=bB9X74p5awTb7f0mcEXUyuWTUecf6s45wv8x16A3I8xHsSwwAcDlhWSgtgbJCTxPIJ
         AwBGY1E74glePfwpzqyEp57sEeLOlG4wEyJAO29NORdAvP9FW5mQ2aAwH/bjsI+q35sy
         zy5IksnSU9tdoGFjbEDjqC+NdCo7GpsH+JhDi3SkhNGwLCoOYxzIlMvDBK/xoI73Ynfs
         KtOEnqk5AZu1ktf0EUX+N281wxPkwUCem0kdsyvTdkzOBNA/CHSirSX4TsqJLx4cIaJj
         W74lwUrXTNwWQNbSLx3vHifCgjDE9Hi5w8m+KsmHkN0dxofwSColJqBkGncwfTZwnZGZ
         tYyQ==
X-Gm-Message-State: AOAM533XwEB5G5gV9DcubMxzEG6Etv2CFdsQPLHylOO2+bt1wtfJrgal
        NYr2CI35ZQw8UChPOm8lDlQ6rw==
X-Google-Smtp-Source: ABdhPJyEWlbfd4kic/4n6Bm1Vek+DnF5N51SX0Nex1cmYdX/gcVc36w1iSqY6Xt+aYfXylFuJsjZ3A==
X-Received: by 2002:a19:c50a:: with SMTP id w10mr3099090lfe.48.1593211658817;
        Fri, 26 Jun 2020 15:47:38 -0700 (PDT)
Received: from genomnajs.lan (c-d63ee155.152980-0-69706f6e6c79.bbcust.telenor.se. [85.225.62.214])
        by smtp.gmail.com with ESMTPSA id w1sm5719287ljo.80.2020.06.26.15.47.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2020 15:47:38 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>
Cc:     linux-leds@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Andrew Jeffery <andrew@aj.id.au>,
        Joel Stanley <joel@jms.id.au>,
        Matt Spinler <mspinler@linux.vnet.ibm.com>,
        =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH] leds: pca955x: Include the right GPIO header
Date:   Sat, 27 Jun 2020 00:47:35 +0200
Message-Id: <20200626224735.384181-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

This driver provides a GPIO chip, so include <linux/gpio/driver.h>
and not the legacy <linux/gpio.h> header.

Cc: Andrew Jeffery <andrew@aj.id.au>
Cc: Joel Stanley <joel@jms.id.au>
Cc: Matt Spinler <mspinler@linux.vnet.ibm.com>
Cc: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/leds/leds-pca955x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/leds-pca955x.c b/drivers/leds/leds-pca955x.c
index 4037c504589c..131f8e922ade 100644
--- a/drivers/leds/leds-pca955x.c
+++ b/drivers/leds/leds-pca955x.c
@@ -40,7 +40,7 @@
 #include <linux/ctype.h>
 #include <linux/delay.h>
 #include <linux/err.h>
-#include <linux/gpio.h>
+#include <linux/gpio/driver.h>
 #include <linux/i2c.h>
 #include <linux/leds.h>
 #include <linux/module.h>
-- 
2.25.4

