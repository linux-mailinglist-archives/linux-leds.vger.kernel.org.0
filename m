Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C1D7A7A4C94
	for <lists+linux-leds@lfdr.de>; Mon, 18 Sep 2023 17:36:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229533AbjIRPgp (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 18 Sep 2023 11:36:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229632AbjIRPgn (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 18 Sep 2023 11:36:43 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BF87137
        for <linux-leds@vger.kernel.org>; Mon, 18 Sep 2023 08:32:09 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-502934c88b7so7674209e87.2
        for <linux-leds@vger.kernel.org>; Mon, 18 Sep 2023 08:32:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695050939; x=1695655739; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qpkia8kMLrWz8ddvYuwxZ25DCyYDGFA4RB5AWzn1+X4=;
        b=KX88Crc9BrAmp0Syq8AqZqkAihk2zEcGb/bUfAiJ+13LfbprkT+dWcALgTDo8bXeuv
         N0q6QsarRlLrm3v/t3SVXHwP6c8XZ1QuCmHv8tkJpGvQPWmRESStsDYQaba+mnOmYd6P
         +ydxoNjIsCGP8KjfiHLmrb9ZypPQYk7GeAavZv06ERW8fGyLfuW4KD+xD9DdP/96VJbm
         K/BoHN43qMhhetwy0IE0iTScEOvKTuTyTg9ObNXa3Ue5fZb1BgJ0/wHiewgpinPahffQ
         DAwvTqqOqqwnJ2RzHccSgw6GICUtQEnqtNzJ4Or8L6y6ZvXR6MwkKO8KlJwkf9IhN7q9
         Ty4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695050939; x=1695655739;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qpkia8kMLrWz8ddvYuwxZ25DCyYDGFA4RB5AWzn1+X4=;
        b=ufMENoNzXkB5sCjD7LtCn+z+18l0cvcyDYszlHdMhE291Xm8nnlF1wA/0K84K5fWpN
         LO+txzRkthVMaqjqlQdGwrt22PC1UPfIig8Wubad4kzOq1cjNsywU5ORLk81L7jTM6AZ
         Vq6QanOnTgGCFJ8aLAk5TbGRHniBLEPbNn1rwHGZq6OJBdztVmISLGETcpCPaXHMxVP6
         yX1lqyO5jlTjsgctcJwnTuh8g6v+s5QcxqtpbRtMRsQnP6fn2P1aPB5bR5B3q+7dBmiA
         JDBJhy1m3BEGhn1Rt1gb7cmBjJlPc/S0NSpagxi1SBDtJ2z0W3JiLp4GWiExJRx5Nue7
         pOig==
X-Gm-Message-State: AOJu0YzdQTeZDRzZwQM50JjAG44ggwmWE1Pm1gHF/4w3UfiQs12vOMPj
        kAP8zLMGNctFdn80mI5ko5h0zl+xk68=
X-Google-Smtp-Source: AGHT+IFn3Uub80JJFkkHOMPy9v3+XdW+kVvZa5y0aEAe3GfaGI+NlChbBf+/obOsPXWfHuXaP6egkw==
X-Received: by 2002:a05:6000:11d1:b0:31f:8e7c:6ebe with SMTP id i17-20020a05600011d100b0031f8e7c6ebemr8156993wrx.5.1695047559395;
        Mon, 18 Sep 2023 07:32:39 -0700 (PDT)
Received: from eichest-laptop.netmodule.intranet ([2a02:168:af72:0:fee5:6aa7:222c:e5be])
        by smtp.gmail.com with ESMTPSA id b16-20020a05600010d000b0031aef72a021sm12621708wrx.86.2023.09.18.07.32.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Sep 2023 07:32:39 -0700 (PDT)
From:   Stefan Eichenberger <eichest@gmail.com>
To:     linux-leds@vger.kernel.org
Cc:     pavel@ucw.cz, lee@kernel.org
Subject: [PATCH] leds: lp55xx: use gpiod_set_value_cansleep
Date:   Mon, 18 Sep 2023 16:32:38 +0200
Message-Id: <20230918143238.75600-1-eichest@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Use gpiod_set_value_cansleep in the init_device function. Without this
change, the driver may print a warning if the LP55xx enable pin is
connected to a GPIO chip which can sleep (e.g. a GPIO expander):
WARNING: CPU: 0 PID: 2719 at drivers/gpio/gpiolib.c:3051 gpiod_set_value+0x64/0xbc

Signed-off-by: Stefan Eichenberger <eichest@gmail.com>
---
 drivers/leds/leds-lp55xx-common.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/leds/leds-lp55xx-common.c b/drivers/leds/leds-lp55xx-common.c
index 77bb26906ea6e..8e7074f0fee00 100644
--- a/drivers/leds/leds-lp55xx-common.c
+++ b/drivers/leds/leds-lp55xx-common.c
@@ -442,9 +442,9 @@ int lp55xx_init_device(struct lp55xx_chip *chip)
 		gpiod_direction_output(pdata->enable_gpiod, 0);
 
 		gpiod_set_consumer_name(pdata->enable_gpiod, "LP55xx enable");
-		gpiod_set_value(pdata->enable_gpiod, 0);
+		gpiod_set_value_cansleep(pdata->enable_gpiod, 0);
 		usleep_range(1000, 2000); /* Keep enable down at least 1ms */
-		gpiod_set_value(pdata->enable_gpiod, 1);
+		gpiod_set_value_cansleep(pdata->enable_gpiod, 1);
 		usleep_range(1000, 2000); /* 500us abs min. */
 	}
 
-- 
2.39.2

