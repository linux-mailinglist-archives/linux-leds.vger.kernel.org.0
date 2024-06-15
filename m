Return-Path: <linux-leds+bounces-1941-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B3AA5909A77
	for <lists+linux-leds@lfdr.de>; Sun, 16 Jun 2024 01:14:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0809FB21B86
	for <lists+linux-leds@lfdr.de>; Sat, 15 Jun 2024 23:14:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC6F3139D0C;
	Sat, 15 Jun 2024 23:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bhfEoB1x"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3C4912D743;
	Sat, 15 Jun 2024 23:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718493183; cv=none; b=apiUuYsEKgpRAZ2gD1kZIqxX1hU+22LpjhtTCFKXRRQy7UohqL5lHyxprYKp8/iuNicZXFt84WH3e+DMgzOSC3NaQ2MW3ehXmaBv0iK6/Qzdoi2kMOWqjN3of9QGb3+lQSczGUR7LgjpJwr4fYZYybl7O8gqW1p9VqXQ9Te06KQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718493183; c=relaxed/simple;
	bh=ZJDV39hSgo6/+74yn9pAfMDBxRXa1yEaTqYO1Bioi40=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jAMznaQ4PYxhucQv22p0hGqcO//9y+/pFpnxkiS8ZvkCdzUWOnvUjGdL6tCAilAX15vAhfpq+uyqbeCBF4LoXlNtPr3hbW1S6olxKcYRTX+9GrgG+T+esUhLxdRaGmf5PoOo1k1/c9aK7+Y9sLLxWm+79/uqD8C3n6Bcf7zKgAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bhfEoB1x; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3608e6d14b6so414560f8f.0;
        Sat, 15 Jun 2024 16:13:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718493180; x=1719097980; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=reTZJNzq8aHLKkEuuQCDgaH0V9cWHkEAk851oTzT2nY=;
        b=bhfEoB1xI0rlX3zgGbsBFvYvkc4SjnZkvbMDdLTb1SpNz8DM0IfVMJko6d6QYG9YMj
         PtViOBtmt62bGvBXQ8kvdEuy06G3Gr8bMibubnbCK8lHzM6dFwYVvr9KaH+1j/8uJaDN
         2X0HaFHqjzEeTYDXAopxbgWTPH6FiYNjcM08yqDJrqVJE7NAhRKI2Qyv0sHkWacWCAdN
         6YtCaaUpanQIwTasE0pqhL8YHWsxBvVXJ59V3+oArMjy1x0y3qieAklpn6tuFUX+Dfey
         mCKlfOKwA2L9SeMYC4qjOefdKBYcyFx+y5Y/KoqBH0WmxNmLfUXJ61ZmSb8N/wsfir5P
         Nc8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718493180; x=1719097980;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=reTZJNzq8aHLKkEuuQCDgaH0V9cWHkEAk851oTzT2nY=;
        b=pPW4YfHMGUJf/SlIKfDS2JyoRB7OVsrEnTVkYDJKJe70wp6J0xSnrY2s3BsbDlj6d5
         j7xSpXaHE0x50EQlhFgT4kuH4pDoBJWsrxxDxWwVD5XNh90Cv0IGcfjyPcEy1+alXcg/
         Cet4RZhFZ9xdw2A4eVvbBVT3lEcvv1/5OmhoBUza1dakYTZ4I+sGYL12j/7FwoczueLT
         JhBy5lj/0PPk1L/YA28tADLplgctwNGH8Ut3PRYtOvXj4zqE+WfOBsgXZEaIEMq4Ubgc
         0jzgz9AOCkCU5eYmScMw12R1tsDgIJovSGrMNT8mtb50QAuQZw/pGiW1LOhhlPdFOfhK
         G4Iw==
X-Forwarded-Encrypted: i=1; AJvYcCXF8ePurPog8DR1W66Q1ELt1UNWKRX/zTVcDyXv3iACqMgiGS3MmJ06290UhD8sxn1YioI6nYWw/8Bl/0L8iLuVnYcRd7W9BoJhOrZBXw29JGfvYBOYnHE5f2JOKdfeLb3OEfaEOLq32kIPBpS0HsWR2J4RnkjORLE/5YhkqmXoLMj4vlk=
X-Gm-Message-State: AOJu0Yz57mZif7/t41M0hvuAlDBoeQx7R6T/D3QlMaNDQWPxiYVq/HHT
	XckU86ptfys35HgyHCLkOotD3Cipwo28btTR+8uDe6HRGlUjp1XH
X-Google-Smtp-Source: AGHT+IEeCYY6mdLo3thvqaP4z+4x3ehx+Uoe4ODHNCHnAV6Ez9dzMnuwjXrEVFYdz5DONT0iDjNF6A==
X-Received: by 2002:a05:6000:248:b0:35f:2cd8:cb31 with SMTP id ffacd0b85a97d-3607a762d2amr4734757f8f.35.1718493180265;
        Sat, 15 Jun 2024 16:13:00 -0700 (PDT)
Received: from localhost.localdomain (93-34-90-105.ip49.fastwebnet.it. [93.34.90.105])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3607509355dsm8145532f8f.13.2024.06.15.16.12.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Jun 2024 16:12:59 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jacek Anaszewski <jacek.anaszewski@gmail.com>,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH v5 11/20] leds: leds-lp55xx: generalize multicolor_brightness function
Date: Sun, 16 Jun 2024 01:11:41 +0200
Message-ID: <20240615231152.28201-12-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240615231152.28201-1-ansuelsmth@gmail.com>
References: <20240615231152.28201-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Generalize multicolor_brightness function as the implementation is the
same for most of the lp55xx based LED driver.

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
index 726283f155a0..9e7c4a798687 100644
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
2.43.0


