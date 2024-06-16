Return-Path: <linux-leds+bounces-1972-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E08F90A032
	for <lists+linux-leds@lfdr.de>; Sun, 16 Jun 2024 23:58:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E72E1281D1F
	for <lists+linux-leds@lfdr.de>; Sun, 16 Jun 2024 21:58:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B5E213A3F1;
	Sun, 16 Jun 2024 21:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gAJ3oyHC"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7443D1386BF;
	Sun, 16 Jun 2024 21:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718574963; cv=none; b=g4Qd9OV70lzlSoNKo0Ud0HfEhb6IoOykI0PQMiTHKiKEfCeVZvI01pvrVXMEv7Qy111AfaIV8szx8bObVY6FslqNX/Ofg5+EUIKqYeiXaF1O2+we64xouQIyDWR8AoDTsmkHLV093+JbzeGq0mSsFYTIviSU0l4Dy2uMuzjXUQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718574963; c=relaxed/simple;
	bh=nY+8QIq/NVecO0v1z1bXAulWhQ6IcntQKCxitZOJseM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d/ZVSGJQomZGPAQHHUlX30zqfGex6Dc6G/ulRnkJyyxbrMh9yikMZ+k3V9Bc4mhudATS5PqP7Md/ExDkfPMz1+UdQHoY3tspk4DlMGTL3wg/41sanhLYwPqGC3ziTKF99MwhlC3VCZ0r3iTmX0SSChZzkfcoBYe81Mxj1DZ2lUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gAJ3oyHC; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-42165f6645fso30720585e9.2;
        Sun, 16 Jun 2024 14:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718574960; x=1719179760; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3qoiYX0eH9044ehhjYfAJBrI3lPSxFRdf3bv91uFvdw=;
        b=gAJ3oyHC4UXytYP1ZwvyqdX1azZQEloFI7DYwCdxkqzyd4k9jdTeESda2VEY9a6mkF
         NDt23Qp9tmGMwvQTUYUFFx5z+a9zVpDQ5KipW2a1XoAvxFoNuN2zuF8yZgZeYjSmr60Q
         ZKRHI4CUp6LkynqhLqVfg425RL5qEj2stCSMxg24gC5BepSNnzYo1phomwmZvpJNQBTj
         9tw6lsi0Eo6YaKFUlzO1MnJOX0Biz/QfOzt47SqTlMCeqeWISTO3qWHBu+ABJ/s8HmfI
         OTqGimWs2RZlRi9kAiB669BUEai9fduqO1iralCJ0wF8bcB3bq+UQqTurHV8ms1LG7AC
         dy4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718574960; x=1719179760;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3qoiYX0eH9044ehhjYfAJBrI3lPSxFRdf3bv91uFvdw=;
        b=C6vu9ZTy6Fc54UmYSBweKNr9YZEeXNgyud2b3G4UEkleG2EOzJsvRpa28vo5AbczYz
         Poh65R/5STR8cn6/FjDWmu/tz/HE8SPs0EDewNWPj8c86XC1e6VU8SThNRDB90W3b8gR
         37rnaAC6oGoMEkJKvcFTzMxDReLJT9ybdffmqrw848HCToewF0knJHZfZhxD73Jqr8HJ
         lht0VqEggeTjDerEutaBfI/+rZHEXSEKLN2myRywr8fREtkOtQzqDdQnNE1nfi+/U8nE
         eVdXX1HC4yp58HKEEtc1WqkNQYpxihpSOXgdA2pWmwnfOWUaG87DwYskWRYiq4cqm7Sb
         vbfQ==
X-Forwarded-Encrypted: i=1; AJvYcCUj/2Vyi/mZ7cMwHQbrTYCbuKQnUiuMrZ+flxNYW7O3GqSoiUsTgIrTbQQv5pNtGXt8GgxIxhTbWNaA+TdMzQ1/kjMeh0qfBUjss8S4wDojwk7qiZY13p8U0RsiTY11/xd8hgfIXzLkDhyf5hSQrE1di7oygEEqRIQTJHP6HDMSWZ0fmBM=
X-Gm-Message-State: AOJu0YwoNmt8TfKb87IrK4UQA2FB2D9HKJ4kiKARAR5dbzt/ESE/63RV
	5/Uj6zIaM445ivYj2oIsxBlkcNV5RsQBKhvOJnPi4Ei8Ha4IhkKv
X-Google-Smtp-Source: AGHT+IFvtXjcLVHpBKPky6IoqCUz71xxqzcUMkNXxxmMUrdQ4RdGjG6/e6rAyHeSP27vcyXJNk6vHQ==
X-Received: by 2002:a05:600c:2303:b0:423:b579:777e with SMTP id 5b1f17b1804b1-423b579785bmr38621805e9.30.1718574959727;
        Sun, 16 Jun 2024 14:55:59 -0700 (PDT)
Received: from localhost.localdomain (93-34-90-105.ip49.fastwebnet.it. [93.34.90.105])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-36075104b74sm10362879f8f.107.2024.06.16.14.55.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Jun 2024 14:55:59 -0700 (PDT)
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
Subject: [PATCH v6 12/20] leds: leds-lp55xx: generalize set_led_current function
Date: Sun, 16 Jun 2024 23:52:11 +0200
Message-ID: <20240616215226.2112-13-ansuelsmth@gmail.com>
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
index d3a18045df56..d8662d128945 100644
--- a/drivers/leds/leds-lp55xx-common.c
+++ b/drivers/leds/leds-lp55xx-common.c
@@ -279,6 +279,17 @@ int lp55xx_multicolor_brightness(struct lp55xx_led *led)
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


