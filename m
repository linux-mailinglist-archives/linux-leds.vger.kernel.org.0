Return-Path: <linux-leds+bounces-2138-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EB713918699
	for <lists+linux-leds@lfdr.de>; Wed, 26 Jun 2024 18:03:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F2BCAB226B2
	for <lists+linux-leds@lfdr.de>; Wed, 26 Jun 2024 16:02:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E8A1190079;
	Wed, 26 Jun 2024 16:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KgvMTiM0"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23D58190044;
	Wed, 26 Jun 2024 16:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719417646; cv=none; b=Jgclw8qp68uyhQWgOAmqK4uBR6qkXBqP86hKwHHUsaGXCkW7qxHzxxIsTqQ06dpiplARxqH3dJDdOwF6ICdwj4KU4lC2TJK+cCML01Fsnvha/8mYPwV3Jwf8ZaluyJZcRhNmYjYJd0VPF1SCUoN1kNw0SRrjOs6D39EpKrh3TZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719417646; c=relaxed/simple;
	bh=DNqXmzHMEsh3DwV1S15V2tQqJuzOJaJFTIW5s/jJFbo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ilLCO8IAzTrbc+SYtzJtXIPmn7f8uLEGJGXGCsIhj4x59RXFKCOqCTpv6lxkqnAXiRZ5S/VbJr7DJwQM+5S+aHdKWjY0xXL7nKPLM6RdNQYN1hyzRw64Y5YJaNn0siovfquODOQrAw6I7jyahRhen5I0yX8spJjhapoS/+0AowI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KgvMTiM0; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-362b32fbb3bso4389863f8f.2;
        Wed, 26 Jun 2024 09:00:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719417642; x=1720022442; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+cd55MwcmwxDYM1xS6QNPLsC66LDeGdAfdzlXmx5K3c=;
        b=KgvMTiM02VzVQkGmQQ3j4Yyymf78W60HiMHY25XGU3iSaxtFlIs8zWLXKV6tpt7X8j
         6av4ObqhsQdI8Hrp683oqUvfcUJ21FCuoQ6S6SF1RWhxJQMfQmnLOTC+h3N4YZRsohjL
         P8g0JS0vxD6KWayFNt7NLjMfS/zYjbBjqBpoRkb8i18fQQlc2ETT6zPruWrk5LICSGhy
         cp6N1EPw6pn3Z63Si0HGAdn/Egvmrb49f2fB/UeXs0FhwZSTlsnXd7EPRM8s+30hYpdo
         L3VmLIAXokOYfm2krKj3/ZUviiRdjjW9LUm4K+qMF38Om6yQmdUiLRri4N4saHn4B3Ew
         /krg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719417642; x=1720022442;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+cd55MwcmwxDYM1xS6QNPLsC66LDeGdAfdzlXmx5K3c=;
        b=DDwEyE/WElIj/9wZfutddtnheoB45n4jBbLtCukUQpXpS70wNXVGOLKTc2ycA5eSj/
         UpY40QNASIjtVP7vOhd3Vg8WGkelPsJRnbQqs2yD7aNsiLwZWHAQEQKHH5l1XpGzntkX
         2BnBdgAurcJxpwPG+Wry7QzG+b3Csl9sBy4SuulDWIZ/1oLDdS5JqdXBP8ELo2a0i6Ox
         B9rDXw5iYSPLDG2Hov+NE+YLfLBXhoIsfqprio1IYnxKCupiiR4ouAAOnRfYjQiwW9cp
         PjG2yIWneqhXM+VW1pxkEiAz4bHMVHe8ggZi3wJCeYSjtb7I6gC21GkUj1/OaBcm2KBT
         Ap/w==
X-Forwarded-Encrypted: i=1; AJvYcCUw7DIVx7+MYiynzAvyLTRAeSBmwqwuFpkLyJFN9SN7ooJQx52qpzlqTg4ECO8HBzrXzrrF3s58bKPrGD1wnTqE1ih2hcKj+uwnfjO1Da8H0XQBQLiCQ2hTKcx9LnxMVdsU296L5dhvZfp9v4ddjL0hdhQKwFZTryImORfoc+WQRJscwUs=
X-Gm-Message-State: AOJu0YxfMKq7BJnVU1TpWaeVcDoF9BOIRUfIRVPppW/rRmbeIaHMKwgM
	Fhuxhzs3Vwxo1Qk/aK8VOEqJZMqWHXMeCh7FmAmixKCTKriC9dCw
X-Google-Smtp-Source: AGHT+IGnM3CtH4XKpdKgrWFEL5XQ4VMM0zdK6aCU/kP4DNVzhX5igAuO4TQ2xCI19+ZATi+ICGZHLw==
X-Received: by 2002:adf:e38f:0:b0:35f:488:6d3d with SMTP id ffacd0b85a97d-366e7a63686mr7503365f8f.58.1719417642364;
        Wed, 26 Jun 2024 09:00:42 -0700 (PDT)
Received: from localhost.localdomain (93-34-90-105.ip49.fastwebnet.it. [93.34.90.105])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-366389b88easm16180589f8f.39.2024.06.26.09.00.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 09:00:41 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jacek Anaszewski <jacek.anaszewski@gmail.com>,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH v8 11/20] leds: leds-lp55xx: Generalize multicolor_brightness function
Date: Wed, 26 Jun 2024 18:00:16 +0200
Message-ID: <20240626160027.19703-12-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240626160027.19703-1-ansuelsmth@gmail.com>
References: <20240626160027.19703-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Generalize multicolor_brightness function as the implementation is the
same for most of the lp55xx based LED driver.

Suggested-by: Lee Jones <lee@kernel.org>
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/leds/leds-lp5521.c        | 21 +--------------------
 drivers/leds/leds-lp5523.c        | 21 +--------------------
 drivers/leds/leds-lp55xx-common.c | 21 +++++++++++++++++++++
 drivers/leds/leds-lp55xx-common.h |  1 +
 4 files changed, 24 insertions(+), 40 deletions(-)

diff --git a/drivers/leds/leds-lp5521.c b/drivers/leds/leds-lp5521.c
index e4d0dcdbf11b..dd7e996f22f9 100644
--- a/drivers/leds/leds-lp5521.c
+++ b/drivers/leds/leds-lp5521.c
@@ -222,25 +222,6 @@ static int lp5521_run_selftest(struct lp55xx_chip *chip, char *buf)
 	return 0;
 }
 
-static int lp5521_multicolor_brightness(struct lp55xx_led *led)
-{
-	struct lp55xx_chip *chip = led->chip;
-	int ret;
-	int i;
-
-	mutex_lock(&chip->lock);
-	for (i = 0; i < led->mc_cdev.num_colors; i++) {
-		ret = lp55xx_write(chip,
-				   LP5521_REG_LED_PWM_BASE +
-				   led->mc_cdev.subled_info[i].channel,
-				   led->mc_cdev.subled_info[i].brightness);
-		if (ret)
-			break;
-	}
-	mutex_unlock(&chip->lock);
-	return ret;
-}
-
 static ssize_t show_engine_mode(struct device *dev,
 				struct device_attribute *attr,
 				char *buf, int nr)
@@ -381,7 +362,7 @@ static struct lp55xx_device_config lp5521_cfg = {
 	.max_channel  = LP5521_MAX_LEDS,
 	.post_init_device   = lp5521_post_init_device,
 	.brightness_fn      = lp55xx_led_brightness,
-	.multicolor_brightness_fn = lp5521_multicolor_brightness,
+	.multicolor_brightness_fn = lp55xx_multicolor_brightness,
 	.set_led_current    = lp5521_set_led_current,
 	.firmware_cb        = lp55xx_firmware_loaded_cb,
 	.run_engine         = lp5521_run_engine,
diff --git a/drivers/leds/leds-lp5523.c b/drivers/leds/leds-lp5523.c
index a3b4063d504e..bfa0c4431ede 100644
--- a/drivers/leds/leds-lp5523.c
+++ b/drivers/leds/leds-lp5523.c
@@ -664,25 +664,6 @@ static ssize_t store_master_fader_leds(struct device *dev,
 	return ret;
 }
 
-static int lp5523_multicolor_brightness(struct lp55xx_led *led)
-{
-	struct lp55xx_chip *chip = led->chip;
-	int ret;
-	int i;
-
-	mutex_lock(&chip->lock);
-	for (i = 0; i < led->mc_cdev.num_colors; i++) {
-		ret = lp55xx_write(chip,
-				   LP5523_REG_LED_PWM_BASE +
-				   led->mc_cdev.subled_info[i].channel,
-				   led->mc_cdev.subled_info[i].brightness);
-		if (ret)
-			break;
-	}
-	mutex_unlock(&chip->lock);
-	return ret;
-}
-
 static LP55XX_DEV_ATTR_RW(engine1_mode, show_engine1_mode, store_engine1_mode);
 static LP55XX_DEV_ATTR_RW(engine2_mode, show_engine2_mode, store_engine2_mode);
 static LP55XX_DEV_ATTR_RW(engine3_mode, show_engine3_mode, store_engine3_mode);
@@ -754,7 +735,7 @@ static struct lp55xx_device_config lp5523_cfg = {
 	.max_channel  = LP5523_MAX_LEDS,
 	.post_init_device   = lp5523_post_init_device,
 	.brightness_fn      = lp55xx_led_brightness,
-	.multicolor_brightness_fn = lp5523_multicolor_brightness,
+	.multicolor_brightness_fn = lp55xx_multicolor_brightness,
 	.set_led_current    = lp5523_set_led_current,
 	.firmware_cb        = lp55xx_firmware_loaded_cb,
 	.run_engine         = lp5523_run_engine,
diff --git a/drivers/leds/leds-lp55xx-common.c b/drivers/leds/leds-lp55xx-common.c
index cc393e407837..27008b6a4757 100644
--- a/drivers/leds/leds-lp55xx-common.c
+++ b/drivers/leds/leds-lp55xx-common.c
@@ -256,6 +256,27 @@ int lp55xx_led_brightness(struct lp55xx_led *led)
 }
 EXPORT_SYMBOL_GPL(lp55xx_led_brightness);
 
+int lp55xx_multicolor_brightness(struct lp55xx_led *led)
+{
+	struct lp55xx_chip *chip = led->chip;
+	const struct lp55xx_device_config *cfg = chip->cfg;
+	int ret;
+	int i;
+
+	mutex_lock(&chip->lock);
+	for (i = 0; i < led->mc_cdev.num_colors; i++) {
+		ret = lp55xx_write(chip,
+				   cfg->reg_led_pwm_base.addr +
+				   led->mc_cdev.subled_info[i].channel,
+				   led->mc_cdev.subled_info[i].brightness);
+		if (ret)
+			break;
+	}
+	mutex_unlock(&chip->lock);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(lp55xx_multicolor_brightness);
+
 static void lp55xx_reset_device(struct lp55xx_chip *chip)
 {
 	const struct lp55xx_device_config *cfg = chip->cfg;
diff --git a/drivers/leds/leds-lp55xx-common.h b/drivers/leds/leds-lp55xx-common.h
index 4578418e5011..021dd17bc5d7 100644
--- a/drivers/leds/leds-lp55xx-common.h
+++ b/drivers/leds/leds-lp55xx-common.h
@@ -216,6 +216,7 @@ extern int lp55xx_update_program_memory(struct lp55xx_chip *chip,
 					const u8 *data, size_t size);
 extern void lp55xx_firmware_loaded_cb(struct lp55xx_chip *chip);
 extern int lp55xx_led_brightness(struct lp55xx_led *led);
+extern int lp55xx_multicolor_brightness(struct lp55xx_led *led);
 
 /* common probe/remove function */
 extern int lp55xx_probe(struct i2c_client *client);
-- 
2.45.1


