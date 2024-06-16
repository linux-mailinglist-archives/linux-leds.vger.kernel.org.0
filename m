Return-Path: <linux-leds+bounces-1970-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C14390A02C
	for <lists+linux-leds@lfdr.de>; Sun, 16 Jun 2024 23:57:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 751E928100C
	for <lists+linux-leds@lfdr.de>; Sun, 16 Jun 2024 21:57:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D9F0137929;
	Sun, 16 Jun 2024 21:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m222zH2M"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 348D912D74D;
	Sun, 16 Jun 2024 21:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718574961; cv=none; b=FvyW50KztaG2f75AmLYR0Lk7h3odxmvyWebUsix4iV6FIi5/+aOKg6/4/BJlf2IYPBL4NqskM4mIsc50zSmzXxI0q/h9rlgcTFYy0To0U7DfZF2qiQuUXrTtsifovtOHBe7N/56Whv4taljsY3rkpPLdXUcH8NBE3EOFeeySzUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718574961; c=relaxed/simple;
	bh=NxsBdO1ugPMVxl+cLRuL99pkvySUXvjOOtPa5hkRW6s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OjgSDPInen2QNamzB64dq+BoTUeviiwgWFy9CPM+cF+1rGl+jac9WVHhI6Ki+zoKfEAFLkzur545Mp99CmNFd03n6xFJKvHRMzZWPwALablBv6qs/apcuHyYphxdxgessiqR8RN2NcwT6GAe4TG8INMv/IOSZ97f5Q9lI9lxilA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m222zH2M; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4217dbeb4caso30814395e9.1;
        Sun, 16 Jun 2024 14:55:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718574957; x=1719179757; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KHZc/1LWhRCQc67SMp9qGtUXdrtThurh67cPSPDWhgc=;
        b=m222zH2MriGyrkEz365Ak2gVIY5UnC95DqmcgjOMh+OUG+jieopRzx2HItfMOcNhB5
         2yr0a8G41j9B6ULXGBHqvJV5QOdjqOO8/xFJF5L1agVgnMf6T3HVJWFfCKj4KB5eHlL0
         Z5aJsh/nNmdHV71pyi1CGqGkKzuxuTV/TnvUtx/AF6wx/VFFmzq4GkZiXqPVGh6FQGcg
         uQi2vXwb/Qv7xe5RxhJGQ2OZyiXw3drM7JIpvKaKUw9i4EoZ7ZMlrCYpG054UEzno9qu
         PmDOeAqk127eehGjmiQ88JT1bfzcYKGWNyyz8WbqIrX/noIKUHPskTHNA/rJvmeumNyJ
         ZihA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718574957; x=1719179757;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KHZc/1LWhRCQc67SMp9qGtUXdrtThurh67cPSPDWhgc=;
        b=FlsDj1gLddxiHLcrEkC3lBJIoqBgooqiuYk4vW4mVzHaR3Wpy04FqOY9gSd6PZ0A5Z
         xVUFGIM4xsw7SeQD8xuTF3M0sXXAOO53r4GN4lqBQfyrWfhAXhqQpvCgvQ1QyKBSI3tI
         a8erjiRLwqp4xRr7BTZSvEOPrKThkTixBfuR1JY2bV7DBVLMz4LlGZdccTfqtr4QgzSq
         DHqNgX1/akGBiyI3vV2VpL6sS4GrkWWGI6xpKqfx+SnpePRgOhPHeRdjLcjm212GJe5R
         1R7zTLKfWdjEc2jBaK+I+SZP6/AsIxuH9EAidDFbw368CZgiO9OF7vBKPdKqCZooy5To
         Cmpg==
X-Forwarded-Encrypted: i=1; AJvYcCXD/8I/Iiae5rrjeA4Wlbheardp44C12s44JjARan4lVNOirI+zVdq4FGhmw6WCpeVzebQkMAQGIbwWDyNpa8aYcYkIoIoYW/cU6yTlhw6ipgUN8n+QqzspE+zLGvLF6FlVsdXUN4YugMxI+85b1aJqKryuQ8ZXyQ0izaGe47V+Kf6thLY=
X-Gm-Message-State: AOJu0YxNm9oafIkRWnpzXo/dQlLyp6upS68ZZJlGYTs4E/XlgWy0aqCK
	htJpsCxivhziVJzQC5wCWJ31h9QFybphwvBOQA8+2Yzzo1aQrHvwGq0rbw==
X-Google-Smtp-Source: AGHT+IHbX67+xJVR8xJIFoy+waN4vpZRJZU8hO44Q455ATBCnRCtv5gzDmauQ7uogKMgC30f5VN9xQ==
X-Received: by 2002:a05:600c:364a:b0:421:cbb8:ca7d with SMTP id 5b1f17b1804b1-4230485a61fmr59395415e9.37.1718574957571;
        Sun, 16 Jun 2024 14:55:57 -0700 (PDT)
Received: from localhost.localdomain (93-34-90-105.ip49.fastwebnet.it. [93.34.90.105])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-36075104b74sm10362879f8f.107.2024.06.16.14.55.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Jun 2024 14:55:57 -0700 (PDT)
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
Subject: [PATCH v6 10/20] leds: leds-lp55xx: generalize led_brightness function
Date: Sun, 16 Jun 2024 23:52:09 +0200
Message-ID: <20240616215226.2112-11-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240616215226.2112-1-ansuelsmth@gmail.com>
References: <20240616215226.2112-1-ansuelsmth@gmail.com>
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
index 9844823ece63..4d607849cd50 100644
--- a/drivers/leds/leds-lp55xx-common.c
+++ b/drivers/leds/leds-lp55xx-common.c
@@ -244,6 +244,20 @@ void lp55xx_firmware_loaded_cb(struct lp55xx_chip *chip)
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
2.43.0


