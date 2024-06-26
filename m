Return-Path: <linux-leds+bounces-2137-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FB31918693
	for <lists+linux-leds@lfdr.de>; Wed, 26 Jun 2024 18:02:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C9141287220
	for <lists+linux-leds@lfdr.de>; Wed, 26 Jun 2024 16:02:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F9D319004B;
	Wed, 26 Jun 2024 16:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RMvg9HOd"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5362218FDAE;
	Wed, 26 Jun 2024 16:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719417644; cv=none; b=rNaQgvACha340NbzuEwpPtbWp6LtPuQPlGJ0+wkdg5QTEPr/STxTymN36YYU2RSZpU9PWMLY2OcOa0r9abyHVrjTJCXg9LO1XnIRhY+UGbPbhMA69jnOYEjyB+6LS8+mNZeukrnwCmZ4BlteM9ZlDs7RN3w2p5ixDpt4uR5hMzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719417644; c=relaxed/simple;
	bh=9W8X/uXPJ33ZTJoIbeDuSXduZ5KaunqFPUGZtRzhOa0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=q7vHA4qwO7CnDNenDs9s9C7cgtvLYapsVGIUQLDszyX+d/9Rv1q3F0TUy7bPZLFcdGmN1xfTviB2ARl921twYMa5FfVVjizgeuNKX0Ai0nHSZtjRsIaBCAdUxtvo3i9AweUD0t4PblMwvOR/bigST69ZcnQoeqmKFbDzidcTLWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RMvg9HOd; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3658197cdbbso3725305f8f.3;
        Wed, 26 Jun 2024 09:00:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719417641; x=1720022441; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vudVfkGmrTvIppVR7JpN4yzf5uM8Dn6rAyVmA1h9sfE=;
        b=RMvg9HOd4RPV54iS1W798cMkeiBTKy2t+6C2Xi8Y85WE4hULJlH6+lNUg5yxIfM4ji
         Yk49o/XtmwvK8OVcXpqhjdDA46XlXJ2X28C6MRK1rimayxG8tjSaA66Tb/U6y0mraKp5
         USBFat5gWEwDFv43jp9XfZn/saayGsh4s4XSQVFSnq3vFRq4eTZKYxlEQRrgEScuC/D/
         oHJV/tuw/unuJtXRIMSb85Pe+xbY4OYvsB27jjr8v+ChYvGpurkyf9xOzC+wpBm3tLUl
         1f/aNFsd0010nnqbh1JxTjkTKX2K3h+uGXbYOwM8EqTNz7qy7Pvv4lDmvTxTQMPxYDMI
         1seg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719417641; x=1720022441;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vudVfkGmrTvIppVR7JpN4yzf5uM8Dn6rAyVmA1h9sfE=;
        b=fIJ681VyERUrVHLpb/OmBRAVjfRLHvRTJyOcXBTWbPl3MJbCOttAQ+H3cVZhGMq1/2
         bElScN6NzHf/Sa8qcPvtqPQlGDyMyD8IolP8vjs/C1Ec1En9bHFzEFDdeo959NyoVJ7y
         B/kXEX2NjeeU46Mj1qHS3nhjwhF+/i0IM2Wu2sxpIIhJNUJoNuCHuWjXgs8mNmQyGKe+
         uL5EZ47vfcRC3u71HRmUx7x1Sg6AzSK1QwVCMbFq6ildbOtgWlJi83wfwbDFsG810Apz
         ONpj9hEVdzVZC39R5e/LAabF4CxdpN7UUNVawc2t5M9yz9pdPVIM9L/B3ECf48LZIVHM
         e8Sg==
X-Forwarded-Encrypted: i=1; AJvYcCVqmhp/vpcVHO0Lk/0iBH9JnRnHYH2fEDVaZjByhqBsSumrwTrYyYuuPSHcWC93Tv6hPE3qDv/g2LQxcbrqP50zGV1ggZftjV9L6rP3iBVH2gQfU6Ml2DmAj0wBb1gShSytjyWqo/5P/aQVJKf7eOLeTs6JkrbyrV2OfKEboGoWs/mYu1Y=
X-Gm-Message-State: AOJu0YzN7R4cFNo11nb9vnm6mI83o5cOzIEQFFiCgNijxg6RKIEmR8of
	uW9oPiUjDOPAaxAwg5y74KAKyq2M/RK1sWd0UJPlJisOo9zI+BG1
X-Google-Smtp-Source: AGHT+IFAMUhX0Q/dvdYS5XQgUaXA/HXbRMD24bPeuMpr5dchsC7yBWqbpbwhua5I8Cjw81OfKTHsHg==
X-Received: by 2002:a5d:6681:0:b0:362:7c2e:e9f7 with SMTP id ffacd0b85a97d-366e94cbbe3mr6957048f8f.32.1719417640715;
        Wed, 26 Jun 2024 09:00:40 -0700 (PDT)
Received: from localhost.localdomain (93-34-90-105.ip49.fastwebnet.it. [93.34.90.105])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-366389b88easm16180589f8f.39.2024.06.26.09.00.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 09:00:40 -0700 (PDT)
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
Subject: [PATCH v8 10/20] leds: leds-lp55xx: Generalize led_brightness function
Date: Wed, 26 Jun 2024 18:00:15 +0200
Message-ID: <20240626160027.19703-11-ansuelsmth@gmail.com>
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

Generalize led_brightness function as the implementation is the same for
most of the lp55xx based LED driver.

Introduce a new option in device_config, reg_led_pwm_base since the reg
value is not the same for every LED chip.

Suggested-by: Lee Jones <lee@kernel.org>
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/leds/leds-lp5521.c        | 18 ++++--------------
 drivers/leds/leds-lp5523.c        | 17 ++++-------------
 drivers/leds/leds-lp55xx-common.c | 14 ++++++++++++++
 drivers/leds/leds-lp55xx-common.h |  3 +++
 drivers/leds/leds-lp8501.c        | 18 ++++--------------
 5 files changed, 29 insertions(+), 41 deletions(-)

diff --git a/drivers/leds/leds-lp5521.c b/drivers/leds/leds-lp5521.c
index 722b5cd9236e..e4d0dcdbf11b 100644
--- a/drivers/leds/leds-lp5521.c
+++ b/drivers/leds/leds-lp5521.c
@@ -241,19 +241,6 @@ static int lp5521_multicolor_brightness(struct lp55xx_led *led)
 	return ret;
 }
 
-static int lp5521_led_brightness(struct lp55xx_led *led)
-{
-	struct lp55xx_chip *chip = led->chip;
-	int ret;
-
-	mutex_lock(&chip->lock);
-	ret = lp55xx_write(chip, LP5521_REG_LED_PWM_BASE + led->chan_nr,
-		led->brightness);
-	mutex_unlock(&chip->lock);
-
-	return ret;
-}
-
 static ssize_t show_engine_mode(struct device *dev,
 				struct device_attribute *attr,
 				char *buf, int nr)
@@ -388,9 +375,12 @@ static struct lp55xx_device_config lp5521_cfg = {
 	.prog_mem_base = {
 		.addr = LP5521_REG_R_PROG_MEM,
 	},
+	.reg_led_pwm_base = {
+		.addr = LP5521_REG_LED_PWM_BASE,
+	},
 	.max_channel  = LP5521_MAX_LEDS,
 	.post_init_device   = lp5521_post_init_device,
-	.brightness_fn      = lp5521_led_brightness,
+	.brightness_fn      = lp55xx_led_brightness,
 	.multicolor_brightness_fn = lp5521_multicolor_brightness,
 	.set_led_current    = lp5521_set_led_current,
 	.firmware_cb        = lp55xx_firmware_loaded_cb,
diff --git a/drivers/leds/leds-lp5523.c b/drivers/leds/leds-lp5523.c
index 5525d60c342c..a3b4063d504e 100644
--- a/drivers/leds/leds-lp5523.c
+++ b/drivers/leds/leds-lp5523.c
@@ -683,18 +683,6 @@ static int lp5523_multicolor_brightness(struct lp55xx_led *led)
 	return ret;
 }
 
-static int lp5523_led_brightness(struct lp55xx_led *led)
-{
-	struct lp55xx_chip *chip = led->chip;
-	int ret;
-
-	mutex_lock(&chip->lock);
-	ret = lp55xx_write(chip, LP5523_REG_LED_PWM_BASE + led->chan_nr,
-		     led->brightness);
-	mutex_unlock(&chip->lock);
-	return ret;
-}
-
 static LP55XX_DEV_ATTR_RW(engine1_mode, show_engine1_mode, store_engine1_mode);
 static LP55XX_DEV_ATTR_RW(engine2_mode, show_engine2_mode, store_engine2_mode);
 static LP55XX_DEV_ATTR_RW(engine3_mode, show_engine3_mode, store_engine3_mode);
@@ -759,10 +747,13 @@ static struct lp55xx_device_config lp5523_cfg = {
 	.prog_mem_base = {
 		.addr = LP5523_REG_PROG_MEM,
 	},
+	.reg_led_pwm_base = {
+		.addr = LP5523_REG_LED_PWM_BASE,
+	},
 	.pages_per_engine   = LP5523_PAGES_PER_ENGINE,
 	.max_channel  = LP5523_MAX_LEDS,
 	.post_init_device   = lp5523_post_init_device,
-	.brightness_fn      = lp5523_led_brightness,
+	.brightness_fn      = lp55xx_led_brightness,
 	.multicolor_brightness_fn = lp5523_multicolor_brightness,
 	.set_led_current    = lp5523_set_led_current,
 	.firmware_cb        = lp55xx_firmware_loaded_cb,
diff --git a/drivers/leds/leds-lp55xx-common.c b/drivers/leds/leds-lp55xx-common.c
index 1c9348ed3edc..cc393e407837 100644
--- a/drivers/leds/leds-lp55xx-common.c
+++ b/drivers/leds/leds-lp55xx-common.c
@@ -242,6 +242,20 @@ void lp55xx_firmware_loaded_cb(struct lp55xx_chip *chip)
 }
 EXPORT_SYMBOL_GPL(lp55xx_firmware_loaded_cb);
 
+int lp55xx_led_brightness(struct lp55xx_led *led)
+{
+	struct lp55xx_chip *chip = led->chip;
+	const struct lp55xx_device_config *cfg = chip->cfg;
+	int ret;
+
+	mutex_lock(&chip->lock);
+	ret = lp55xx_write(chip, cfg->reg_led_pwm_base.addr + led->chan_nr,
+			   led->brightness);
+	mutex_unlock(&chip->lock);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(lp55xx_led_brightness);
+
 static void lp55xx_reset_device(struct lp55xx_chip *chip)
 {
 	const struct lp55xx_device_config *cfg = chip->cfg;
diff --git a/drivers/leds/leds-lp55xx-common.h b/drivers/leds/leds-lp55xx-common.h
index cbc122c56828..4578418e5011 100644
--- a/drivers/leds/leds-lp55xx-common.h
+++ b/drivers/leds/leds-lp55xx-common.h
@@ -100,6 +100,7 @@ struct lp55xx_reg {
  * @reset              : Chip specific reset command
  * @enable             : Chip specific enable command
  * @prog_mem_base      : Chip specific base reg address for chip SMEM programming
+ * @reg_led_pwm_base   : Chip specific base reg address for LED PWM conf
  * @pages_per_engine   : Assigned pages for each engine
  *                       (if not set chip doesn't support pages)
  * @max_channel        : Maximum number of channels
@@ -118,6 +119,7 @@ struct lp55xx_device_config {
 	const struct lp55xx_reg reset;
 	const struct lp55xx_reg enable;
 	const struct lp55xx_reg prog_mem_base;
+	const struct lp55xx_reg reg_led_pwm_base;
 	const int pages_per_engine;
 	const int max_channel;
 
@@ -213,6 +215,7 @@ extern int lp55xx_run_engine_common(struct lp55xx_chip *chip);
 extern int lp55xx_update_program_memory(struct lp55xx_chip *chip,
 					const u8 *data, size_t size);
 extern void lp55xx_firmware_loaded_cb(struct lp55xx_chip *chip);
+extern int lp55xx_led_brightness(struct lp55xx_led *led);
 
 /* common probe/remove function */
 extern int lp55xx_probe(struct i2c_client *client);
diff --git a/drivers/leds/leds-lp8501.c b/drivers/leds/leds-lp8501.c
index 1ea7bb73cd22..8f1fd9525e9a 100644
--- a/drivers/leds/leds-lp8501.c
+++ b/drivers/leds/leds-lp8501.c
@@ -137,19 +137,6 @@ static void lp8501_run_engine(struct lp55xx_chip *chip, bool start)
 	lp55xx_run_engine_common(chip);
 }
 
-static int lp8501_led_brightness(struct lp55xx_led *led)
-{
-	struct lp55xx_chip *chip = led->chip;
-	int ret;
-
-	mutex_lock(&chip->lock);
-	ret = lp55xx_write(chip, LP8501_REG_LED_PWM_BASE + led->chan_nr,
-		     led->brightness);
-	mutex_unlock(&chip->lock);
-
-	return ret;
-}
-
 /* Chip specific configurations */
 static struct lp55xx_device_config lp8501_cfg = {
 	.reg_op_mode = {
@@ -173,10 +160,13 @@ static struct lp55xx_device_config lp8501_cfg = {
 	.prog_mem_base = {
 		.addr = LP8501_REG_PROG_MEM,
 	},
+	.reg_led_pwm_base = {
+		.addr = LP8501_REG_LED_PWM_BASE,
+	},
 	.pages_per_engine   = LP8501_PAGES_PER_ENGINE,
 	.max_channel  = LP8501_MAX_LEDS,
 	.post_init_device   = lp8501_post_init_device,
-	.brightness_fn      = lp8501_led_brightness,
+	.brightness_fn      = lp55xx_led_brightness,
 	.set_led_current    = lp8501_set_led_current,
 	.firmware_cb        = lp55xx_firmware_loaded_cb,
 	.run_engine         = lp8501_run_engine,
-- 
2.45.1


