Return-Path: <linux-leds+bounces-1942-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BF2B9909A79
	for <lists+linux-leds@lfdr.de>; Sun, 16 Jun 2024 01:15:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5EBED2827F5
	for <lists+linux-leds@lfdr.de>; Sat, 15 Jun 2024 23:15:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C06BF13A3EB;
	Sat, 15 Jun 2024 23:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IZrdJC7C"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA69B69D3C;
	Sat, 15 Jun 2024 23:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718493184; cv=none; b=mIf4f5QRE0YvP1lBfXrdqS+KhsY7tZU0v3vyyJXBsdLYZ4Srv7yZ+Ya9bhbz+PKUdLQxAigbcFT+eO4UguLx1ZMoHZWC8PWwzfN8S575U4xtLb3468gfChFL5dlALrNg2p8YGPNVYyhZj21zm1h15vResLq6Bp3zoHgvEqs9HVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718493184; c=relaxed/simple;
	bh=yroiYVCG3OrL9rLeHVt+g+A3LCLonVZlQg1L6D97zTM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uV9bUMJu0DrUQjhKbn58bNzja0bq0khQzW0v0kzLb/3yK+g/iH1LaWIi+H6NE6T6Jo4zZD5R0VqqO3kDL5PWZJXbJmb30CYYFZd7CI0qku/bwf+dXlSNxWZI2NL287lDEtKuIq0uw//nn8iST8vs9Ve+YpfzoA0bRWJ5UnV/xy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IZrdJC7C; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-35f1c209893so3520148f8f.2;
        Sat, 15 Jun 2024 16:13:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718493181; x=1719097981; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5ZlvWImeqPpjcJvX0N7IvZkD4LWa/430M0KkBEQJ84o=;
        b=IZrdJC7Cp+ynBOAbpPby2FdQtukaBG9HmBHCe+Zk4QLSeT5b6eOjI4KQRrj05+D6aj
         zM8QZxyUaYtOgxSWEq4kE2U6JaazEVwgr5QJ8lNHjlP0uklViKlQG+oqoLIwOnpVufwk
         3lJuuZ4s4VAV/BxOsb5RaEsWUjShhmjM8JROCtSUUCnZSUAOIkdM+Q8ktDmJNb92U7rU
         FnZsEUTEH3gcFc3g0RGZjjK7rIXnT43RXFzNmCIYVIfLIBRfzTR2YDRVyh6nIK6jClvC
         1HZ3Nr3gzMIqIplUfFCdlXHY62vqeIq/Lhuk7EF7vaujNir4i8SMlHIYc1FKLic73ume
         48Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718493181; x=1719097981;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5ZlvWImeqPpjcJvX0N7IvZkD4LWa/430M0KkBEQJ84o=;
        b=eZ0j94L1SnDg8TOOl/ryA/eGlCW89vc6jkYAugsmqDprR2tLDdnN0+eNrZ8x8af3cj
         ylFXfRORucKsXWFDvp2mPl3h5RNHBpTZTz+qnQaXywMPcMNQSb5xo9RJoKydmwLaBJjJ
         C0zP3Bj6NR6oHXOhRzZ/TsOJeRG2TRZyhWPDkRDv5e4JlOSMbJo5moVv0ze6WPIBqDql
         94cIhid9GjN3A0we5h2gplvxXu+yZ6vVOujPr9c+Efm4SfjnEiZm0kDygGO1Nv2Sgl67
         RY2hl02J2jkT2kRoZVeBV0lljwmNlGBRf0XP2WJiKaQTmBqGJwfw9NKhqB/kjXxq9m1l
         4uzA==
X-Forwarded-Encrypted: i=1; AJvYcCVQ6X6cBGPg1GvpLXMJ5Z0bMq3GTibKEjRjTGthNhMuszqWqwN3CwLBeqBqkH/ODE0cMk/rXRf5INDfATBLE6b+26/YK/w8WSB4PE2TsKGa3xkJrgZMM5OqVyAjKgZ5Wg6R9RqiA7jgVPtfOkOGICWix10AYvQr2fp53e3ojrILM54G4/E=
X-Gm-Message-State: AOJu0YwXrszVIGMHrhnzcIg3KYKmsW8dUgh88ZVYKQ5AN4xmXUKiqI9r
	De8WWqvPkk+HiY9LGxGaFlBAXm8upMt1ZF8aRRs2ayRkPA61vzJZJjAnNQ==
X-Google-Smtp-Source: AGHT+IFS3kmr+W04MV3qaugiybrhTsp2g+gp+bBgc6KDRWpEeH0VTXX8wa3UPa++539vCcG44887zQ==
X-Received: by 2002:a5d:424d:0:b0:35f:650f:c316 with SMTP id ffacd0b85a97d-3607a768c89mr5389793f8f.41.1718493181215;
        Sat, 15 Jun 2024 16:13:01 -0700 (PDT)
Received: from localhost.localdomain (93-34-90-105.ip49.fastwebnet.it. [93.34.90.105])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3607509355dsm8145532f8f.13.2024.06.15.16.13.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Jun 2024 16:13:00 -0700 (PDT)
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
Subject: [PATCH v5 12/20] leds: leds-lp55xx: generalize set_led_current function
Date: Sun, 16 Jun 2024 01:11:42 +0200
Message-ID: <20240615231152.28201-13-ansuelsmth@gmail.com>
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

Generalize set_led_current function as the implementation is the same for
most of the lp55xx based LED driver.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/leds/leds-lp5521.c        | 12 ++++--------
 drivers/leds/leds-lp5523.c        | 12 ++++--------
 drivers/leds/leds-lp55xx-common.c | 11 +++++++++++
 drivers/leds/leds-lp55xx-common.h |  3 +++
 drivers/leds/leds-lp8501.c        | 12 ++++--------
 5 files changed, 26 insertions(+), 24 deletions(-)

diff --git a/drivers/leds/leds-lp5521.c b/drivers/leds/leds-lp5521.c
index dd7e996f22f9..a1a3bf0ff703 100644
--- a/drivers/leds/leds-lp5521.c
+++ b/drivers/leds/leds-lp5521.c
@@ -108,13 +108,6 @@ static inline void lp5521_wait_enable_done(void)
 	usleep_range(500, 600);
 }
 
-static void lp5521_set_led_current(struct lp55xx_led *led, u8 led_current)
-{
-	led->led_current = led_current;
-	lp55xx_write(led->chip, LP5521_REG_LED_CURRENT_BASE + led->chan_nr,
-		led_current);
-}
-
 static void lp5521_stop_engine(struct lp55xx_chip *chip)
 {
 	enum lp55xx_engine_index idx = chip->engine_idx;
@@ -359,11 +352,14 @@ static struct lp55xx_device_config lp5521_cfg = {
 	.reg_led_pwm_base = {
 		.addr = LP5521_REG_LED_PWM_BASE,
 	},
+	.reg_led_current_base = {
+		.addr = LP5521_REG_LED_CURRENT_BASE,
+	},
 	.max_channel  = LP5521_MAX_LEDS,
 	.post_init_device   = lp5521_post_init_device,
 	.brightness_fn      = lp55xx_led_brightness,
 	.multicolor_brightness_fn = lp55xx_multicolor_brightness,
-	.set_led_current    = lp5521_set_led_current,
+	.set_led_current    = lp55xx_set_led_current,
 	.firmware_cb        = lp55xx_firmware_loaded_cb,
 	.run_engine         = lp5521_run_engine,
 	.dev_attr_group     = &lp5521_group,
diff --git a/drivers/leds/leds-lp5523.c b/drivers/leds/leds-lp5523.c
index bfa0c4431ede..3030a4495808 100644
--- a/drivers/leds/leds-lp5523.c
+++ b/drivers/leds/leds-lp5523.c
@@ -122,13 +122,6 @@ static inline void lp5523_wait_opmode_done(void)
 	usleep_range(1000, 2000);
 }
 
-static void lp5523_set_led_current(struct lp55xx_led *led, u8 led_current)
-{
-	led->led_current = led_current;
-	lp55xx_write(led->chip, LP5523_REG_LED_CURRENT_BASE + led->chan_nr,
-		led_current);
-}
-
 static int lp5523_post_init_device(struct lp55xx_chip *chip)
 {
 	int ret;
@@ -731,12 +724,15 @@ static struct lp55xx_device_config lp5523_cfg = {
 	.reg_led_pwm_base = {
 		.addr = LP5523_REG_LED_PWM_BASE,
 	},
+	.reg_led_current_base = {
+		.addr = LP5523_REG_LED_CURRENT_BASE,
+	},
 	.pages_per_engine   = LP5523_PAGES_PER_ENGINE,
 	.max_channel  = LP5523_MAX_LEDS,
 	.post_init_device   = lp5523_post_init_device,
 	.brightness_fn      = lp55xx_led_brightness,
 	.multicolor_brightness_fn = lp55xx_multicolor_brightness,
-	.set_led_current    = lp5523_set_led_current,
+	.set_led_current    = lp55xx_set_led_current,
 	.firmware_cb        = lp55xx_firmware_loaded_cb,
 	.run_engine         = lp5523_run_engine,
 	.dev_attr_group     = &lp5523_group,
diff --git a/drivers/leds/leds-lp55xx-common.c b/drivers/leds/leds-lp55xx-common.c
index 9e7c4a798687..0d9c2990c335 100644
--- a/drivers/leds/leds-lp55xx-common.c
+++ b/drivers/leds/leds-lp55xx-common.c
@@ -277,6 +277,17 @@ int lp55xx_multicolor_brightness(struct lp55xx_led *led)
 }
 EXPORT_SYMBOL_GPL(lp55xx_multicolor_brightness);
 
+void lp55xx_set_led_current(struct lp55xx_led *led, u8 led_current)
+{
+	struct lp55xx_chip *chip = led->chip;
+	const struct lp55xx_device_config *cfg = chip->cfg;
+
+	led->led_current = led_current;
+	lp55xx_write(led->chip, cfg->reg_led_current_base.addr + led->chan_nr,
+		     led_current);
+}
+EXPORT_SYMBOL_GPL(lp55xx_set_led_current);
+
 static void lp55xx_reset_device(struct lp55xx_chip *chip)
 {
 	const struct lp55xx_device_config *cfg = chip->cfg;
diff --git a/drivers/leds/leds-lp55xx-common.h b/drivers/leds/leds-lp55xx-common.h
index 021dd17bc5d7..e638049d9297 100644
--- a/drivers/leds/leds-lp55xx-common.h
+++ b/drivers/leds/leds-lp55xx-common.h
@@ -101,6 +101,7 @@ struct lp55xx_reg {
  * @enable             : Chip specific enable command
  * @prog_mem_base      : Chip specific base reg address for chip SMEM programming
  * @reg_led_pwm_base   : Chip specific base reg address for LED PWM conf
+ * @reg_led_current_base : Chip specific base reg address for LED current conf
  * @pages_per_engine   : Assigned pages for each engine
  *                       (if not set chip doesn't support pages)
  * @max_channel        : Maximum number of channels
@@ -120,6 +121,7 @@ struct lp55xx_device_config {
 	const struct lp55xx_reg enable;
 	const struct lp55xx_reg prog_mem_base;
 	const struct lp55xx_reg reg_led_pwm_base;
+	const struct lp55xx_reg reg_led_current_base;
 	const int pages_per_engine;
 	const int max_channel;
 
@@ -217,6 +219,7 @@ extern int lp55xx_update_program_memory(struct lp55xx_chip *chip,
 extern void lp55xx_firmware_loaded_cb(struct lp55xx_chip *chip);
 extern int lp55xx_led_brightness(struct lp55xx_led *led);
 extern int lp55xx_multicolor_brightness(struct lp55xx_led *led);
+extern void lp55xx_set_led_current(struct lp55xx_led *led, u8 led_current);
 
 /* common probe/remove function */
 extern int lp55xx_probe(struct i2c_client *client);
diff --git a/drivers/leds/leds-lp8501.c b/drivers/leds/leds-lp8501.c
index 8f1fd9525e9a..d924572e4533 100644
--- a/drivers/leds/leds-lp8501.c
+++ b/drivers/leds/leds-lp8501.c
@@ -84,13 +84,6 @@ static inline void lp8501_wait_opmode_done(void)
 	usleep_range(1000, 2000);
 }
 
-static void lp8501_set_led_current(struct lp55xx_led *led, u8 led_current)
-{
-	led->led_current = led_current;
-	lp55xx_write(led->chip, LP8501_REG_LED_CURRENT_BASE + led->chan_nr,
-		led_current);
-}
-
 static int lp8501_post_init_device(struct lp55xx_chip *chip)
 {
 	int ret;
@@ -163,11 +156,14 @@ static struct lp55xx_device_config lp8501_cfg = {
 	.reg_led_pwm_base = {
 		.addr = LP8501_REG_LED_PWM_BASE,
 	},
+	.reg_led_current_base = {
+		.addr = LP8501_REG_LED_CURRENT_BASE,
+	},
 	.pages_per_engine   = LP8501_PAGES_PER_ENGINE,
 	.max_channel  = LP8501_MAX_LEDS,
 	.post_init_device   = lp8501_post_init_device,
 	.brightness_fn      = lp55xx_led_brightness,
-	.set_led_current    = lp8501_set_led_current,
+	.set_led_current    = lp55xx_set_led_current,
 	.firmware_cb        = lp55xx_firmware_loaded_cb,
 	.run_engine         = lp8501_run_engine,
 };
-- 
2.43.0


