Return-Path: <linux-leds+bounces-2139-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 694E191869A
	for <lists+linux-leds@lfdr.de>; Wed, 26 Jun 2024 18:03:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1FDCE286E16
	for <lists+linux-leds@lfdr.de>; Wed, 26 Jun 2024 16:03:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E78D9190476;
	Wed, 26 Jun 2024 16:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jFaMoXpo"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F19C618EFCC;
	Wed, 26 Jun 2024 16:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719417646; cv=none; b=A5Z2bYHrmnTOF+s34OstSqKZf+Z0L+S2shY7XpdFHn3aB0W40ILeJuIOdEaQqUoDh13vO0eCAmWn4noXHjkWDGVHe5BVPsNAawLOUYgP7a2NKpscYwZmU+3/JY1TlzBSj0FKv3YJCiXJj6Fxxwp9Do0dJeCiAwk71AoVspnMPKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719417646; c=relaxed/simple;
	bh=bE+H6/d5S3V3ne3J941Ravni7sgv7nsfpyZypdmVHYU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FIGTWNRT5TisH7SVjOsFKNoo1zcmspBFQ1rhhi5IH+ZEf3u42nHdrqllI3OfjtGtAhl8jkSm6x5RK47bCFExx4Tz68a5NiQG1Z1C5+tFos3j+gZ7thMTJ1nJpLtIBXucqhQBCob/GNv26kntZRvJrZV6uMMvDGXWl6ITz/TYZlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jFaMoXpo; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-42499b98d4cso17823125e9.2;
        Wed, 26 Jun 2024 09:00:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719417643; x=1720022443; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2HSlEfR9855aoWqKhwBylO/wmGxDdnbWadMM9N3fBmc=;
        b=jFaMoXpof2CilBt7dsy3ILV3Lz9V0yKfy2QPn7RhJqh5O16LyckDdPvAmbTjYL8a64
         PmdezGRbedS5WHyEvTx6WhniK6T4Mx1BXSMpzMtEPfK/SA6ahIZdZo6smYNnGviMGp+J
         jIGnz8X2HRYiW+dV6g5ygcW3yKppeWnJ7nSKRAyidYFjEXo+l+3VnWG3t4eK/rkUQzQN
         bHAinqcJxTSM6yhRsquBLSD1QqlfndPoyVXfkSTX2NOTB6hAfTBHhR5rWpShLsavm/k6
         XTryMo1aRfVQUVCp8rnuCGepq/760wtsVc5aIQNkkAN51dYngI8kCpxve3urpmoEmM38
         MXwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719417643; x=1720022443;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2HSlEfR9855aoWqKhwBylO/wmGxDdnbWadMM9N3fBmc=;
        b=B53TCWAEDHNCcl3B/2bCVtSh/Xspfa7TvVois8TYA0Jmz+iMbnP/OMrSv7SpotgWJi
         D5liGwcqsiY0tUBEdJdn7IsHnKlzmMz+3pNN6gShD5JAPoIgJiGcTYO1h4XZDcdh2Y+5
         6v072TKvIjAHo3/pKe31MjQd/c41ZbwZ2q7YVLU+wSjCBifIFQIENU9zP0W6fi7Pafba
         Ue3kravnVpXi76EgzHnHeFCHej6cz220p5QDPVsQSaZtsi0dwjmq/tIVXc2POrI6t9iW
         /XdSgBp1YebVRWvhfeKLHblKF/QSpXgwooz2q326ot3gCZFVUcBPikUPomFYlfJupF86
         0UXQ==
X-Forwarded-Encrypted: i=1; AJvYcCWOqu1na9vsMOEyIUKPD1fZDwpT1MsfmqVjO04CeQPeuXyLdJr9qTrLdeRK2LWL9sPkeQJWHDc/0nIsv9TorHb26UgcDqeGXKUUHgpMPGg8y1yk79EWgMDouGe4N0WuBgQCLJqnmyWBZqEUhdvBEjig3UejlD+ktMyIdqW3QONTznoc7W0=
X-Gm-Message-State: AOJu0Yw/IR6ThxTIVkWzDG9EC0F/5WmMgyRLiquInvH2LkiRFjQwXk7J
	3gt8dUTpyuY6x/8xw0XWsXAlAvIuzK/gQlo16DxLRzPOpPCR9Xq7
X-Google-Smtp-Source: AGHT+IG8CUf3Vdt2s7DvlhfPFFxmNBu8RNUo+ar23XEKqoyV7f+ye0R+GzwOjst4wySV0z/Y7BYt0Q==
X-Received: by 2002:a05:6000:2a5:b0:366:ec30:adcc with SMTP id ffacd0b85a97d-366ec30ae4fmr7582730f8f.5.1719417643313;
        Wed, 26 Jun 2024 09:00:43 -0700 (PDT)
Received: from localhost.localdomain (93-34-90-105.ip49.fastwebnet.it. [93.34.90.105])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-366389b88easm16180589f8f.39.2024.06.26.09.00.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 09:00:43 -0700 (PDT)
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
Subject: [PATCH v8 12/20] leds: leds-lp55xx: Generalize set_led_current function
Date: Wed, 26 Jun 2024 18:00:17 +0200
Message-ID: <20240626160027.19703-13-ansuelsmth@gmail.com>
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


