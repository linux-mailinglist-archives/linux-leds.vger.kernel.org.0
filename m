Return-Path: <linux-leds+bounces-2088-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC78E9114FE
	for <lists+linux-leds@lfdr.de>; Thu, 20 Jun 2024 23:44:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 71F9B281A0C
	for <lists+linux-leds@lfdr.de>; Thu, 20 Jun 2024 21:44:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6B2F1552E1;
	Thu, 20 Jun 2024 21:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fTz9sE7j"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94B8784D13;
	Thu, 20 Jun 2024 21:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718919710; cv=none; b=tHeamG3+q54aKvYwiKAiz9JLU1bt/79+UWvyg5pFgNoQt5EF/Sh4aCGUqXp5kISrB4DkVqZpbbSW06RGwnJd8x80EfmsLh8Du70VrCZpTfMYcx8GGMPPj1noBhNOPWYrpZ95ebR3unqugqyPoMvR9Gtax3NTIxr4w+JzVsoxvBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718919710; c=relaxed/simple;
	bh=bE+H6/d5S3V3ne3J941Ravni7sgv7nsfpyZypdmVHYU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EIcs+t7FhOdbazsGaoksL+cZr7U9ovPKD3eIAsPLBL90kteOxHCxnY7mlBKMidbo3bzT5q9DF5hLVQYm4TxZHCl9Gbr2PSAvW5V3mV03zjzMArrsEsedrrmzPLjl/JrdjTsl9RlBWYIeUEKeuQdFjrnLBS6Y7sP9327j+zr1OQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fTz9sE7j; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-421a1b834acso12260665e9.3;
        Thu, 20 Jun 2024 14:41:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718919707; x=1719524507; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2HSlEfR9855aoWqKhwBylO/wmGxDdnbWadMM9N3fBmc=;
        b=fTz9sE7j4hn59nDYxGebcnjopzivshGBH+rtFjdqjb5YFruuUZ016TZAs7R+aQxj+A
         Z6bziJXesNpbm4EQFNyQv40FNurg314bp8C3PF8NVy73b3ARGHSKchwopEU9gR0B3Aam
         mCmAW7KgYbG7f4FeyLDVYDGpZ45ujg7CTWXebWJ1jtZNJxOXDZTSmErLwbAM89GTUw9v
         maOn53+blUukWChQCRie8Jp0R+Ua1S2EQQU16DbvxazEtUUw3oltajjw9reR5VPZQxaV
         gdGp787XOyusBr6pqPZziCsgNolVHQbk+HJhW1Qz1E7WiABx21cZOuXHAGBpfeYX395Z
         lLzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718919707; x=1719524507;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2HSlEfR9855aoWqKhwBylO/wmGxDdnbWadMM9N3fBmc=;
        b=WoCl6Q7wJ+Y7Fo/YW61wwsU/5NXgVaFNc/7x7m77btEPjl2TaeR+SQ9yFzeUEtFiGL
         +f+dJ3b8pcDQ1PuZWuMAtaNVgEyBdsB2T1iCrqTR/3vxKbepEts7FV4/sMrWZATEpnaD
         j1+wKL5qGGxhTU9IEjM0MTi3tHjpy5hDoOtsL+MT1OmiHAnRBwkHfNVkVnI1GHsRibwC
         9Xssqh8T7QdCiIEk9jNJjB4PvC7sEB2n116vwvklMTfQNRoKS1zD4nhElbFD51Ty2iv1
         GY4WVuKZwDzf6LDolQdjeJprFJxfUIFjBHvXEtnxd1rD8TE9UraixNTV74bOADCoyUw8
         SZbQ==
X-Forwarded-Encrypted: i=1; AJvYcCUsQjTQny83LDnDGliMR6RmI/p5UoUGHmofcFi5EXdv4+F8ffoOLO6w3MJ94b2c7OX6GiXQ6TkKe16f/J/sWuZxTmSRcHZxIZVVNNfAiNpHVQ8y0EqH1VyZcxbXvgarHljw/cIma5TLkQhzJIKVCNfnzrk7DkuD61WTqfXhpnLGuSeBxvc=
X-Gm-Message-State: AOJu0Yy+JPxD/aj/VWbgz4pFNnKKVSA3z4gLvTV9KxIzPzppk3NmUf+1
	umzmlfsKiIcCjBDsap18n0cFyY8z4ozJsO3QALGAaN06ejn54k67
X-Google-Smtp-Source: AGHT+IH/VuiTnrgvURk9WxGkgxAwkINU/kU9JwtJoavYc3B3TrwzkfvOmcjJ0v4OzleqCWVz+WYWzA==
X-Received: by 2002:a05:600c:5c4:b0:421:5ada:c137 with SMTP id 5b1f17b1804b1-4247529b439mr50778335e9.33.1718919706912;
        Thu, 20 Jun 2024 14:41:46 -0700 (PDT)
Received: from localhost.localdomain (93-34-90-105.ip49.fastwebnet.it. [93.34.90.105])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-366383f68acsm48866f8f.2.2024.06.20.14.41.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 14:41:46 -0700 (PDT)
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
Subject: [PATCH v7 12/20] leds: leds-lp55xx: Generalize set_led_current function
Date: Thu, 20 Jun 2024 23:03:28 +0200
Message-ID: <20240620210401.22053-13-ansuelsmth@gmail.com>
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

Generalize set_led_current function as the implementation is the same for
most of the lp55xx based LED driver.

Suggested-by: Lee Jones <lee@kernel.org>
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
index 27008b6a4757..d17538ebfcf9 100644
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
2.45.1


