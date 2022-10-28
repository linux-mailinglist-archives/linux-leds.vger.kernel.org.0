Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C7F66112F5
	for <lists+linux-leds@lfdr.de>; Fri, 28 Oct 2022 15:36:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230527AbiJ1NgX (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 28 Oct 2022 09:36:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231137AbiJ1NgR (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 28 Oct 2022 09:36:17 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD6A31D066A
        for <linux-leds@vger.kernel.org>; Fri, 28 Oct 2022 06:36:16 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id 13so13027788ejn.3
        for <linux-leds@vger.kernel.org>; Fri, 28 Oct 2022 06:36:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mind.be; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QJ1/9+mz9wLZBGth25p4Y+hydexORf1H94ubr9V2GJ4=;
        b=GmTZ5xZVkUyOaqVe9KcQ7ZpSZaEyKE/RR85jDbmrkXF8L7hLkTcV1IsDnHhn6b8pwR
         pYAL7pg9XUA2xPhHkcg4N/C0ZTVlx2MR2JJU56JzaZS6qz6gJ75I8iM+ArSEyvXDqrVx
         AtbpV+MkFVaxULWjHUB0ehys7KbZipwUmBZiKul5sZBPUB0HAU5M/UhxRdLBdNs4dXOn
         vqmDk9FZS2Vg8Aj7S0qb16dVnCcU5AieuGHZ+0AXXWUaq1XvFzDAppG7c0eDoArITqZz
         LYl3RSlkRSu2/WJ9iYuaWnw/x/XqZazmy6B2qP/jH9JOWq2YwdPNDq2xO/UcTtYougoP
         NkyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QJ1/9+mz9wLZBGth25p4Y+hydexORf1H94ubr9V2GJ4=;
        b=JMTmB9Fx18UPTk4tHgyLg2OVds4DXHN3ncYshp8SsMVVxWiJVNgVYtOTooylW5dhFk
         o1D9+gcQIYuYaPXQk6ieFI6mhl3pg/SYMU8apJzfUFJiijN9nffNtUDY5ArKbxJltAz6
         /sP4YalM00n4IpOaIh068tFSq/1W6yOJmvrLVoE7DbZI1SEvvR8qn6P9O/I750B5RVWU
         vje5yjWQrvsTGQuRXcAnLayD4z04IpMd3AWCOUBcWXSmtWGmeSa8JoYRCBeUN/A6tM1N
         aHMaLxczM9M6Lrx1MR+OSjPVBwcoppZXK7uhcjEBuQH+mJ9mTNT2fgjUxk00fil6Uaa4
         Qwag==
X-Gm-Message-State: ACrzQf2uqjUY6LaCYuYBmU9/SF/NXdUoRAOEPmDvgqaNvBuHZ8TIOy7I
        cPA6uck0zb3PBRYAB/0lM1hzcZibovOTfSD2
X-Google-Smtp-Source: AMsMyM7gBqQbueIy64R952zxpUgSgMjODrkshOdgrjkXWY/KSz6K8srJHO9Wu0cB47S4tDqwAUhdWw==
X-Received: by 2002:a05:6402:4443:b0:45f:ca04:719b with SMTP id o3-20020a056402444300b0045fca04719bmr42834827edb.171.1666964164716;
        Fri, 28 Oct 2022 06:36:04 -0700 (PDT)
Received: from dtpc.zanders.be (78-22-137-109.access.telenet.be. [78.22.137.109])
        by smtp.gmail.com with ESMTPSA id mf7-20020a170906cb8700b007aa239cf4d9sm2190907ejb.89.2022.10.28.06.36.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Oct 2022 06:36:04 -0700 (PDT)
From:   Maarten Zanders <maarten.zanders@mind.be>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Maarten Zanders <maarten.zanders@mind.be>,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] leds: lp55xx: add option to disable charge pump
Date:   Fri, 28 Oct 2022 15:34:59 +0200
Message-Id: <20221028133501.95833-3-maarten.zanders@mind.be>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221028133501.95833-1-maarten.zanders@mind.be>
References: <20221028133501.95833-1-maarten.zanders@mind.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

The LP55xx range of devices have an internal charge pump which
can (automatically) increase the output voltage towards the
LED's, boosting the output voltage to 4.5V.

While undocumented, it is possible to connect an external power
rail to the Vout pin on the device to save power. However, when
doing this, the internal charge pump needs to be disabled. If
it is enabled in this configuration, there is leakage from the
externally supplied Vout back to Vin (Vdd).

This commit adds an option in the devicetree to disable the
charge pump. When the option is not present, the device config
is exactly as before (automatic mode).

Tested on LP55231. Datasheet analysis shows that LP5521, LP5523
and LP8501 are identical in topology and have been modified in
the same way.

Signed-off-by: Maarten Zanders <maarten.zanders@mind.be>
---
 drivers/leds/leds-lp5521.c                |  6 ++++--
 drivers/leds/leds-lp5523.c                | 15 +++++++++++----
 drivers/leds/leds-lp55xx-common.c         |  3 +++
 drivers/leds/leds-lp8501.c                |  5 ++++-
 include/linux/platform_data/leds-lp55xx.h |  3 +++
 5 files changed, 25 insertions(+), 7 deletions(-)

diff --git a/drivers/leds/leds-lp5521.c b/drivers/leds/leds-lp5521.c
index 7ff20c260504..80f3b50c9502 100644
--- a/drivers/leds/leds-lp5521.c
+++ b/drivers/leds/leds-lp5521.c
@@ -64,8 +64,7 @@
 #define LP5521_CP_MODE_AUTO		0x18	/* Automatic mode selection */
 #define LP5521_R_TO_BATT		0x04	/* R out: 0 = CP, 1 = Vbat */
 #define LP5521_CLK_INT			0x01	/* Internal clock */
-#define LP5521_DEFAULT_CFG		\
-	(LP5521_PWM_HF | LP5521_PWRSAVE_EN | LP5521_CP_MODE_AUTO)
+#define LP5521_DEFAULT_CFG		(LP5521_PWM_HF | LP5521_PWRSAVE_EN)
 
 /* Status */
 #define LP5521_EXT_CLK_USED		0x08
@@ -310,6 +309,9 @@ static int lp5521_post_init_device(struct lp55xx_chip *chip)
 	if (!lp55xx_is_extclk_used(chip))
 		val |= LP5521_CLK_INT;
 
+	if (!chip->pdata->cp_disable)
+		val |= LP5521_CP_MODE_AUTO;
+
 	ret = lp55xx_write(chip, LP5521_REG_CONFIG, val);
 	if (ret)
 		return ret;
diff --git a/drivers/leds/leds-lp5523.c b/drivers/leds/leds-lp5523.c
index 369d40b0b65b..06d81a520168 100644
--- a/drivers/leds/leds-lp5523.c
+++ b/drivers/leds/leds-lp5523.c
@@ -59,6 +59,9 @@
 #define LP5523_PWM_PWR_SAVE		0x04
 #define LP5523_CP_AUTO			0x18
 #define LP5523_AUTO_CLK			0x02
+#define LP5523_DEFAULT_CONFIG	\
+	(LP5523_AUTO_INC | LP5523_PWR_SAVE |\
+	 LP5523_AUTO_CLK | LP5523_PWM_PWR_SAVE)
 
 #define LP5523_EN_LEDTEST		0x80
 #define LP5523_LEDTEST_DONE		0x80
@@ -125,6 +128,7 @@ static void lp5523_set_led_current(struct lp55xx_led *led, u8 led_current)
 static int lp5523_post_init_device(struct lp55xx_chip *chip)
 {
 	int ret;
+	int val;
 
 	ret = lp55xx_write(chip, LP5523_REG_ENABLE, LP5523_ENABLE);
 	if (ret)
@@ -133,10 +137,13 @@ static int lp5523_post_init_device(struct lp55xx_chip *chip)
 	/* Chip startup time is 500 us, 1 - 2 ms gives some margin */
 	usleep_range(1000, 2000);
 
-	ret = lp55xx_write(chip, LP5523_REG_CONFIG,
-			    LP5523_AUTO_INC | LP5523_PWR_SAVE |
-			    LP5523_CP_AUTO | LP5523_AUTO_CLK |
-			    LP5523_PWM_PWR_SAVE);
+	val = LP5523_DEFAULT_CONFIG;
+
+	if (!chip->pdata->cp_disable)
+		val |= LP5523_CP_AUTO;
+
+	ret = lp55xx_write(chip, LP5523_REG_CONFIG, val);
+
 	if (ret)
 		return ret;
 
diff --git a/drivers/leds/leds-lp55xx-common.c b/drivers/leds/leds-lp55xx-common.c
index ca2e28fb843f..aadaca26fb23 100644
--- a/drivers/leds/leds-lp55xx-common.c
+++ b/drivers/leds/leds-lp55xx-common.c
@@ -691,6 +691,9 @@ struct lp55xx_platform_data *lp55xx_of_populate_pdata(struct device *dev,
 		i++;
 	}
 
+	if (of_find_property(np, "ti,disable-charge-pump", NULL))
+		pdata->cp_disable = 1;
+
 	of_property_read_string(np, "label", &pdata->label);
 	of_property_read_u8(np, "clock-mode", &pdata->clock_mode);
 
diff --git a/drivers/leds/leds-lp8501.c b/drivers/leds/leds-lp8501.c
index ae11a02c0ab2..6370abb2c7ae 100644
--- a/drivers/leds/leds-lp8501.c
+++ b/drivers/leds/leds-lp8501.c
@@ -56,7 +56,7 @@
 #define LP8501_CP_AUTO			0x18
 #define LP8501_INT_CLK			BIT(0)
 #define LP8501_DEFAULT_CFG	\
-	(LP8501_PWM_PSAVE | LP8501_AUTO_INC | LP8501_PWR_SAVE | LP8501_CP_AUTO)
+	(LP8501_PWM_PSAVE | LP8501_AUTO_INC | LP8501_PWR_SAVE)
 
 #define LP8501_REG_RESET		0x3D
 #define LP8501_RESET			0xFF
@@ -102,6 +102,9 @@ static int lp8501_post_init_device(struct lp55xx_chip *chip)
 	if (chip->pdata->clock_mode != LP55XX_CLOCK_EXT)
 		val |= LP8501_INT_CLK;
 
+	if (!chip->pdata->cp_disable)
+		val |= LP8501_CP_AUTO;
+
 	ret = lp55xx_write(chip, LP8501_REG_CONFIG, val);
 	if (ret)
 		return ret;
diff --git a/include/linux/platform_data/leds-lp55xx.h b/include/linux/platform_data/leds-lp55xx.h
index 3441064713a3..8e2ba5e2a7ee 100644
--- a/include/linux/platform_data/leds-lp55xx.h
+++ b/include/linux/platform_data/leds-lp55xx.h
@@ -73,6 +73,9 @@ struct lp55xx_platform_data {
 	/* Clock configuration */
 	u8 clock_mode;
 
+	/* charge pump disable */
+	u8 cp_disable;
+
 	/* optional enable GPIO */
 	struct gpio_desc *enable_gpiod;
 
-- 
2.37.3

