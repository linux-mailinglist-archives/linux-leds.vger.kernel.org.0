Return-Path: <linux-leds+bounces-1940-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A0574909A75
	for <lists+linux-leds@lfdr.de>; Sun, 16 Jun 2024 01:14:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BA9D6B21A4D
	for <lists+linux-leds@lfdr.de>; Sat, 15 Jun 2024 23:14:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 212AB135A4E;
	Sat, 15 Jun 2024 23:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g09jh1mR"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 137AB8175B;
	Sat, 15 Jun 2024 23:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718493183; cv=none; b=NC+NtINMRloMuXqvr/98/aQMfUMxc7zBf9HcQMv2FqnKUoWyw1Tx5VGFfQJSRR9EiW9+DGv60UHJAbzxLXApq8+jA7rhYA2Zz22lAWhbO3B44asqOhpQcyN8xHFMQ4BdtyfrYn+ghZhCI7di/zcWzxcCWgOAuBSV1pvFpIMgk1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718493183; c=relaxed/simple;
	bh=U0orKFk2dhQdQvk92NKAOsmad1yNY3xl/DPRqhxJn14=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gIloW2SmBnicHr9APFFiAmM2whQgg+MNwdXK6edKLeLSfoQEft3mDdSqDYFOiICsRWA4NOrnxP8rHTMT4g/Ipox/404TxaUD7jwEtWOuWQJJK22BYPeZYbVqN2aq3oFRNUj2KRhbq1tXEl45iw+GK+3HpqFuwGx3mO29srFtEWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g09jh1mR; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-35f223e7691so2120640f8f.1;
        Sat, 15 Jun 2024 16:13:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718493179; x=1719097979; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qwJ/5jg54x8XV3v6t3PKGyWXpISXPGstbY09wxVLffY=;
        b=g09jh1mRB96i+joC9rztg6BOHr9pAX2R1VU+eoKin3ZDY1aGxj6QbIhjxL7PKdEqUU
         +wcNT36z8yUXPmsxpw4Mmi7XidE+eLfwN+kyH4Xn3EzVMYWycVmymMGeKvai4hDcy1G8
         lOVpEdjY7VKQQ1dxZJi9sy+YJpRz+S2PvdI95QTm98zqSMqEJVMBZ4UaCvQHgGNl8mR6
         cDjAn0Qk9vZwjTV8JgH9vdFgAIYJIblRz6uC/0w6wUXV9FM7T9CZNfDU7xAW4t7RlR7w
         7PrHW8rJiUiyqbcMtCKxA8LObct7Pf9vNPgldynxFwuN7ZdOWUBjNkMICDOo+dMN7dZq
         +IHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718493179; x=1719097979;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qwJ/5jg54x8XV3v6t3PKGyWXpISXPGstbY09wxVLffY=;
        b=FpoNT7SOWa295jjVn6w4RRwSpqMQQsfHF/E6uH0NbP3zEUdQo8ubJHbljgueEbu60g
         FI4AtOKsGCKgsoKdEnmwAb5BaNar8htU5fLXlij5zAkdWo2iMZDf31DuVq0GnwqMnOMz
         +JPAqZW2QCIhPgWrk001s/Ex2yti3L+f1cLj5NUew12srGz7TM2liU5ppjagO6wGbYX4
         jLJHF/VTzEpGPTGmlW8+MYte1BdZamOurISI2viQDm6g7P2tJuU3LDACNEphStpSennX
         C6jT+VWHI+wPdO/cHYA0YsinCzjmy6XrCP5EKGNGCbrRHfyPLiPIvvB2JgDU1kQScgQI
         82Ow==
X-Forwarded-Encrypted: i=1; AJvYcCURGDLeubRfGwberquVgBiN7EtRYXHNrn5WO07nLG/AlColh1KUagAReFV9eB58+TYLKb4LvxrxsoqYUFWUCWEXozTe1+mCCeF3yyHBdqh0fPn9HOs/GusQJOVmaZvAxyEOHekuXo5+0KSOVmMdq6J83zY5ADVO/uAsXm2bT+fqCn8D0IA=
X-Gm-Message-State: AOJu0YwEy3snr1VLsdtvqxh+SRJJvq4ag/T/jH3auHKyVtnQ0l50fHaa
	TfyuYVRhP21vNwtrMpC7/RN27vQBA1pH833MyNpc85WbxFfQkINC
X-Google-Smtp-Source: AGHT+IHU3X3jPsKGU8Cnltkc45b0cl+S2v86R8QTSPYXzfQhwMsLnTJZXSWCnn5GbUncMjC0lRbkAQ==
X-Received: by 2002:a5d:64ab:0:b0:35f:2c6b:ffe4 with SMTP id ffacd0b85a97d-36071901383mr11670182f8f.28.1718493179384;
        Sat, 15 Jun 2024 16:12:59 -0700 (PDT)
Received: from localhost.localdomain (93-34-90-105.ip49.fastwebnet.it. [93.34.90.105])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3607509355dsm8145532f8f.13.2024.06.15.16.12.58
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
Subject: [PATCH v5 10/20] leds: leds-lp55xx: generalize led_brightness function
Date: Sun, 16 Jun 2024 01:11:40 +0200
Message-ID: <20240615231152.28201-11-ansuelsmth@gmail.com>
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
index 51bbe91cc7f2..726283f155a0 100644
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
2.43.0


