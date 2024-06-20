Return-Path: <linux-leds+bounces-2086-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D4469114F6
	for <lists+linux-leds@lfdr.de>; Thu, 20 Jun 2024 23:43:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 92A9D1F23952
	for <lists+linux-leds@lfdr.de>; Thu, 20 Jun 2024 21:43:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C434152E12;
	Thu, 20 Jun 2024 21:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a4TyCx14"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 778C51514CB;
	Thu, 20 Jun 2024 21:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718919708; cv=none; b=olsms+fiznK6+8V9qG6ZiZ4aWsLBLdpUd8jzkV6SsMOPoCG/adUaPYSuz5XuzEH20Z2hTNr7+7ijmUK4iSf+3XH9rctScMgKkqPDyRqDJ5WFfqMWS94YHDPjD5CgoP6xXhMRoe1P+NVPAjL/tDBFSS6hRmIty+MUjY3MlY6H+OE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718919708; c=relaxed/simple;
	bh=9W8X/uXPJ33ZTJoIbeDuSXduZ5KaunqFPUGZtRzhOa0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n1EW0DpTKrdVRieEi3LlTgU7Chm///pTxc1biJy8xS0tQ9SVszkWUOOmOOo5B04SzjwLuAxwnpkmUhl9brQdk7yjZHGBZ8PWsjF4mm250f1a+PJqWuPTcifutvUf4hGJWXWRHEHR2DFbSxROylqhwUZ3opoCzS3rhvkonL+Zbv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a4TyCx14; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-42189d3c7efso16358955e9.2;
        Thu, 20 Jun 2024 14:41:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718919705; x=1719524505; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vudVfkGmrTvIppVR7JpN4yzf5uM8Dn6rAyVmA1h9sfE=;
        b=a4TyCx149EhJdqzzsIjl0F6wL1ErR2ll3zLrcC1EQqlWmTtuaOWVzz8WXFJseRwAgV
         r9iJo2mLy1dpwR+bn39uqg4d+YL9R0DkE4CzFHlWup+8CIg4D2gYdx6x63oj3JdkCoHZ
         b8/jhAefcfdrR2xh1LzKscclDkAvC8jwMpU8qj8cVcRLQ63okyRisH2A8iqdFOh2+6bn
         AsCcYWGbj2ziiLdGvmmYVkBolauesbPbTqJ1G7x0O3bVonHDd4sBQMUF1Y/4k7IlqMpr
         iaxd00XWsf8ihtkIdDv+CcOwhv/fYmIb/pU/oItXhdsEr2c5f6bqjzZj+GzeDP7hXn68
         OgiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718919705; x=1719524505;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vudVfkGmrTvIppVR7JpN4yzf5uM8Dn6rAyVmA1h9sfE=;
        b=ox/JDgqkwGINvIISpG8ZBdYWigVEDzcZ7WZwjlq9/Mo8hA/DLvThWgvsuiNm+cQYQm
         tA6/G3JhViKt1P0nzE0YE9QFoHi8OxIRDtUmhYpTaYiQZFcGXy1hnpelUt3VHjAuGIOs
         zPnksqzQpnn9spwCoW3wHjqc8YBBFBg2Glnq7/ffsGayukdxCDzUA8KDqtLuwQdZt3sW
         eedUrrQ5DLIqk+1gsmmkDarVRdWhiItOp9cndPR2Fvip2OGeGrkuc4NNd8whtOMcldUQ
         qNLUrx9algXid7oYH5DdjNAfeuxbicQCYlZYUujuGUi2ufIJ1T2fnKgvh608meJir+TC
         EDlw==
X-Forwarded-Encrypted: i=1; AJvYcCVIYsKLYZi6lMdW0MBs5CK1f7699wrGDTRqRGibbCUG7Bvh5sd/fu+7pEFpxUtoKm463/KB7F9A7HHgjmB8UjYAnxaajI7RF96jSVQsK/F9GtX/lSdi7+2Ma8XH7VrtVK05+qCrrWF/FVB7lC7A6IckIP8iZGTU/dfguHrnwmCdELH1Evw=
X-Gm-Message-State: AOJu0Yx+jVBuAj/DbHWLy8KYW0H24eq0kPoxe1YTM/qKCpaCOiqw0946
	Vnbjw4pWsYtPpBB1IBuyzjRivny4m6Pn+KNHs8RT/zp74GwiwWTp
X-Google-Smtp-Source: AGHT+IFmAh5GyF8H+4C6AqYClJGLrvIeVbqL4Uione9FDq72sMw28eTl9CZR/+l6ZKOTZ4xJGwGp7g==
X-Received: by 2002:a7b:c307:0:b0:421:7f07:92cf with SMTP id 5b1f17b1804b1-4247529c28amr64655905e9.36.1718919704881;
        Thu, 20 Jun 2024 14:41:44 -0700 (PDT)
Received: from localhost.localdomain (93-34-90-105.ip49.fastwebnet.it. [93.34.90.105])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-366383f68acsm48866f8f.2.2024.06.20.14.41.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 14:41:44 -0700 (PDT)
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
Subject: [PATCH v7 10/20] leds: leds-lp55xx: Generalize led_brightness function
Date: Thu, 20 Jun 2024 23:03:26 +0200
Message-ID: <20240620210401.22053-11-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240620210401.22053-1-ansuelsmth@gmail.com>
References: <20240620210401.22053-1-ansuelsmth@gmail.com>
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


