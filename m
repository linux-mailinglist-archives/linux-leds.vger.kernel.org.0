Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B916B3FA7AA
	for <lists+linux-leds@lfdr.de>; Sat, 28 Aug 2021 23:43:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231276AbhH1Vnz (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 28 Aug 2021 17:43:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230253AbhH1Vnz (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 28 Aug 2021 17:43:55 -0400
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com [IPv6:2607:f8b0:4864:20::832])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 141C2C061756
        for <linux-leds@vger.kernel.org>; Sat, 28 Aug 2021 14:43:04 -0700 (PDT)
Received: by mail-qt1-x832.google.com with SMTP id s15so5031227qta.10
        for <linux-leds@vger.kernel.org>; Sat, 28 Aug 2021 14:43:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=ZEfnvPgBNzuVkmRRnt7Uf7wZBAhV0DrX6/5am8FnFQU=;
        b=WcF+rDB8LxUvKO2jVzzkCkty19dWca+eviMlWMihGzkbbj9pcYsSN5NgO/yGPluNpi
         szlXWIYYbqndfGsOksb4IK0Px+BowdZapga8h6uOgSO/8A7+5BHbiKG4MGU3REysF2m2
         ol3HVsWKDeDolP27uwzZZCDFC+lK2gSMD4uXXQfxWqpqXBXX4B6SHk9AOcY7o2RNiWx+
         bktfsq6JNgdXO14FKS50tlgkAUyhDovqEjVDYI9o34N99xmI6eMzVnNT3PGNHCrqlPpa
         ulYWoLcDoHYFy8BC52+uTm7qIgLd2DpnaHAnZjdSRHWk3mMzIVR0TO0CVXk0vOGfigOq
         uBVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=ZEfnvPgBNzuVkmRRnt7Uf7wZBAhV0DrX6/5am8FnFQU=;
        b=UFhdjfQXh/Rrq1PUZsfeRIVrg13AJ4gH3lyqu+3gMRGQLUbiMEzRGezwmVoLMkWmhn
         fi7u6IJwiZxunrCc2XZ/eTQSEN7r0URydywadhOrOf9Lqit4uG9WvfQOL5MPSGVGBjjE
         dkMX/429tATGQSydZrV5QzOa6abiRjnTy35SjNaKMDb3H9zbPpsIaYodKjjmOUTAqvZS
         1jjB78e7v06LrmSZqWwLCTUcp9OhxTUJ2OtY+FMZoIPEXy/KHDdyegjDigPOI9mj1pEU
         xNIJrNP+2lHXkdNJAqORDR/x/mfSezbXULY/cA/oZfKCflO41DAU9At6SQ9uLDnTQwps
         Z4aQ==
X-Gm-Message-State: AOAM530SjF2S8xKubVhI/6izNCBR6J0ucIyaUfBXeGmeNGJwBMfkwtDg
        Q78A1jPiiYV2FCk3ayfGLXk=
X-Google-Smtp-Source: ABdhPJz6X2xqX79KJwhQCON2gvLb0ijgcDstbcfzKbWnX92PmG4ekbfcmqOXsnSO+4GuWRvmx+cY+g==
X-Received: by 2002:ac8:6d14:: with SMTP id o20mr14344485qtt.97.1630186983167;
        Sat, 28 Aug 2021 14:43:03 -0700 (PDT)
Received: from donovan-FR.attlocal.net ([2600:1700:3ec0:6ec0:160:4122:cf45:8024])
        by smtp.googlemail.com with ESMTPSA id p187sm7537887qkd.101.2021.08.28.14.43.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Aug 2021 14:43:03 -0700 (PDT)
From:   DonDrews <donovancarldrews@gmail.com>
Cc:     pavel@ucw.cz, linux-leds@vger.kernel.org,
        DonDrews <donovancarldrews@gmail.com>
Subject: [PATCH] leds: lp50xx: Fix bank enable mask
Date:   Sat, 28 Aug 2021 14:42:53 -0700
Message-Id: <20210828214253.16207-1-donovancarldrews@gmail.com>
X-Mailer: git-send-email 2.17.1
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

	Fixes an issue where previously 0 is used as a sentinel when
	moving device tree configuration into the bank enable mask. This
	prevented the first LED from being added to bank control.

Signed-off-by: DonDrews <donovancarldrews@gmail.com>
---
 drivers/leds/leds-lp50xx.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/leds/leds-lp50xx.c b/drivers/leds/leds-lp50xx.c
index 401df1e2e05d..45f56caea182 100644
--- a/drivers/leds/leds-lp50xx.c
+++ b/drivers/leds/leds-lp50xx.c
@@ -347,17 +347,15 @@ static int lp50xx_brightness_set(struct led_classdev *cdev,
 	return ret;
 }
 
-static int lp50xx_set_banks(struct lp50xx *priv, u32 led_banks[])
+static int lp50xx_set_banks(struct lp50xx *priv, u32 led_banks[], int num_leds)
 {
 	u8 led_config_lo, led_config_hi;
 	u32 bank_enable_mask = 0;
 	int ret;
 	int i;
 
-	for (i = 0; i < priv->chip_info->max_modules; i++) {
-		if (led_banks[i])
-			bank_enable_mask |= (1 << led_banks[i]);
-	}
+	for (i = 0; i < num_leds; i++)
+		bank_enable_mask |= (1 << led_banks[i]);
 
 	led_config_lo = bank_enable_mask;
 	led_config_hi = bank_enable_mask >> 8;
@@ -413,7 +411,7 @@ static int lp50xx_probe_leds(struct fwnode_handle *child, struct lp50xx *priv,
 			return ret;
 		}
 
-		ret = lp50xx_set_banks(priv, led_banks);
+		ret = lp50xx_set_banks(priv, led_banks, num_leds);
 		if (ret) {
 			dev_err(priv->dev, "Cannot setup banked LEDs\n");
 			return ret;
-- 
2.17.1

