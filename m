Return-Path: <linux-leds+bounces-2140-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EA9191869E
	for <lists+linux-leds@lfdr.de>; Wed, 26 Jun 2024 18:03:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DD7241F231D6
	for <lists+linux-leds@lfdr.de>; Wed, 26 Jun 2024 16:03:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0757190490;
	Wed, 26 Jun 2024 16:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MWUS9MUJ"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8C0819006C;
	Wed, 26 Jun 2024 16:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719417647; cv=none; b=Mgr0NBAhDw7Pxp1oZUrpSlzduBRUvq5oHu6bxi7NHQxg+LRnZ5jqVoSQ7nCzVrPx+hOzBxySGytEismN8D1o492e+C+6mWdk5BuRr6Xcr94v0JY1+MSrtmMplhmsbb1mT0M9tkU9DBOGb2CRGlSZeXzPm/D16YU7gC5xdri8BiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719417647; c=relaxed/simple;
	bh=WYfEnqGU/jttnGRW1Dl3AAXqGn8PsUodgf/YFXg4lD0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mJ5CZ9DWzOMAF9kv1tYIJsHhgP2U3LA+HZ2fq9kgJpz+/8Z/fyIitzSOmjup6VBRY2y0sW2WKh1L6Hgf+2uERLh6HlY9+uZEyWwAY9lQcfp3Ga2zVpj2x05yya7MaL1CqZsR5NqyZLUw6TBD0YjdcwomIgDGJnKdWJ2NUn6iUKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MWUS9MUJ; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-363826fbcdeso5057326f8f.0;
        Wed, 26 Jun 2024 09:00:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719417644; x=1720022444; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gKKOM38AF+UhyCgTW0uK8yuV/Hf10uvfG1nRgbJlZYo=;
        b=MWUS9MUJLZoCTX0DXSYrb7moQOovYAuXHMOF1Fyy2R6fNrRa747ZZLu8qFqbLEg6Bf
         4UNWZJR4AV9t+6DYp6Rj5eFGeSrdSSCvZx+UkBaRtj5Ia0SgPDMBxAIzIMR5LuWdY+MF
         k72nyQOxnLlrc0ko2b0lEv5xoYXlOy8WlVj0vujguDbwDR3k3Gw7gVfd4RgW7ISw0vYB
         jsbmJWMwufmoVq9sG7L/rv0TIv9PjaCxSuHsYQP5EjncAbtbm7uYizGoGO5lQ7VPZL/+
         eclO+GEpwR1t563m2K+CGrdE+anC+E0F2PwZgTrzzE8fWWCaCjjQv04tz2NtmazmoPwJ
         ruRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719417644; x=1720022444;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gKKOM38AF+UhyCgTW0uK8yuV/Hf10uvfG1nRgbJlZYo=;
        b=bjemK0mtpQ4j9SknCuuU3Yi4nJWK4Its9cRXLW32L4PIs02fiCwdooZKsZb0dAod9g
         5fV0ve27Ayjs+GxTZ+iuJwDWlNfhXQa2RX5MMbMgCwKddKDhtcghU0SVNrESqX3dKuL7
         nhSNvuiX8JF/FaPm/QnPzw1NYnXTWryAWyaHG0eYmqFNlFMXez3brswDOqHrSF/aZJoR
         9WP8ETTTkJo04IiP5bpCvM8GIVrjy0zoz2PL7Dd2U9QJ47D17akpyUfi/MSJn7g8RW5F
         WerUa2Rv7s8S+vzeT+sxPu++eiPKomCkf/Ewcu+qKU7nm/6E+VwhQV9V9WUI7tIAhcoq
         nfAQ==
X-Forwarded-Encrypted: i=1; AJvYcCWATCSZYu/Uug55RtP95vgGQwuMrboAWWGcmZ7F1/hbqpUe7UyTndEzL61s/3ktMypICis2vacalKkTYJdTt9MEmpDjYyOucuOqmURy4Do+KZt2JnwNIK5XF1k1s8JSOZF1FHqZyOj9MgyqpBduvm1oJY+qBlHf9hSO1WjY0MU6aQZAcls=
X-Gm-Message-State: AOJu0Yxk7jAykodRtyIBT/nKQf21KfEkKCqLztcwgBZmAkerBjbe0jrw
	jpns0i0AlAaYYkHCTNWCB+AJSnaF5PL41k+qBZkPwOgLSDJwUCnOCPKxpg==
X-Google-Smtp-Source: AGHT+IH+E/EuGJvKHTY+dv2nxR4rP/l1wdtfLHJIBtysuboai8d33l5WWSO6yXNBO9kZUxl2XU3Zzw==
X-Received: by 2002:a05:6000:178f:b0:366:ee52:28bf with SMTP id ffacd0b85a97d-366ee522954mr8216061f8f.59.1719417644218;
        Wed, 26 Jun 2024 09:00:44 -0700 (PDT)
Received: from localhost.localdomain (93-34-90-105.ip49.fastwebnet.it. [93.34.90.105])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-366389b88easm16180589f8f.39.2024.06.26.09.00.43
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
Subject: [PATCH v8 13/20] leds: leds-lp55xx: Generalize turn_off_channels function
Date: Wed, 26 Jun 2024 18:00:18 +0200
Message-ID: <20240626160027.19703-14-ansuelsmth@gmail.com>
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

Generalize turn_off_channels function as the implementation is the same for
most of the lp55xx based LED driver.

Suggested-by: Lee Jones <lee@kernel.org>
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/leds/leds-lp5523.c        | 10 +---------
 drivers/leds/leds-lp55xx-common.c | 10 ++++++++++
 drivers/leds/leds-lp55xx-common.h |  1 +
 drivers/leds/leds-lp8501.c        | 10 +---------
 4 files changed, 13 insertions(+), 18 deletions(-)

diff --git a/drivers/leds/leds-lp5523.c b/drivers/leds/leds-lp5523.c
index 3030a4495808..4a4463cb44a4 100644
--- a/drivers/leds/leds-lp5523.c
+++ b/drivers/leds/leds-lp5523.c
@@ -167,20 +167,12 @@ static void lp5523_stop_engine(struct lp55xx_chip *chip)
 	lp5523_wait_opmode_done();
 }
 
-static void lp5523_turn_off_channels(struct lp55xx_chip *chip)
-{
-	int i;
-
-	for (i = 0; i < LP5523_MAX_LEDS; i++)
-		lp55xx_write(chip, LP5523_REG_LED_PWM_BASE + i, 0);
-}
-
 static void lp5523_run_engine(struct lp55xx_chip *chip, bool start)
 {
 	/* stop engine */
 	if (!start) {
 		lp5523_stop_engine(chip);
-		lp5523_turn_off_channels(chip);
+		lp55xx_turn_off_channels(chip);
 		return;
 	}
 
diff --git a/drivers/leds/leds-lp55xx-common.c b/drivers/leds/leds-lp55xx-common.c
index d17538ebfcf9..58121f27f17b 100644
--- a/drivers/leds/leds-lp55xx-common.c
+++ b/drivers/leds/leds-lp55xx-common.c
@@ -288,6 +288,16 @@ void lp55xx_set_led_current(struct lp55xx_led *led, u8 led_current)
 }
 EXPORT_SYMBOL_GPL(lp55xx_set_led_current);
 
+void lp55xx_turn_off_channels(struct lp55xx_chip *chip)
+{
+	const struct lp55xx_device_config *cfg = chip->cfg;
+	int i;
+
+	for (i = 0; i < cfg->max_channel; i++)
+		lp55xx_write(chip, cfg->reg_led_pwm_base.addr + i, 0);
+}
+EXPORT_SYMBOL_GPL(lp55xx_turn_off_channels);
+
 static void lp55xx_reset_device(struct lp55xx_chip *chip)
 {
 	const struct lp55xx_device_config *cfg = chip->cfg;
diff --git a/drivers/leds/leds-lp55xx-common.h b/drivers/leds/leds-lp55xx-common.h
index e638049d9297..531fbb0acb2e 100644
--- a/drivers/leds/leds-lp55xx-common.h
+++ b/drivers/leds/leds-lp55xx-common.h
@@ -220,6 +220,7 @@ extern void lp55xx_firmware_loaded_cb(struct lp55xx_chip *chip);
 extern int lp55xx_led_brightness(struct lp55xx_led *led);
 extern int lp55xx_multicolor_brightness(struct lp55xx_led *led);
 extern void lp55xx_set_led_current(struct lp55xx_led *led, u8 led_current);
+extern void lp55xx_turn_off_channels(struct lp55xx_chip *chip);
 
 /* common probe/remove function */
 extern int lp55xx_probe(struct i2c_client *client);
diff --git a/drivers/leds/leds-lp8501.c b/drivers/leds/leds-lp8501.c
index d924572e4533..1fb876f64cb7 100644
--- a/drivers/leds/leds-lp8501.c
+++ b/drivers/leds/leds-lp8501.c
@@ -110,20 +110,12 @@ static int lp8501_post_init_device(struct lp55xx_chip *chip)
 				LP8501_PWR_CONFIG_M, chip->pdata->pwr_sel);
 }
 
-static void lp8501_turn_off_channels(struct lp55xx_chip *chip)
-{
-	int i;
-
-	for (i = 0; i < LP8501_MAX_LEDS; i++)
-		lp55xx_write(chip, LP8501_REG_LED_PWM_BASE + i, 0);
-}
-
 static void lp8501_run_engine(struct lp55xx_chip *chip, bool start)
 {
 	/* stop engine */
 	if (!start) {
 		lp55xx_stop_all_engine(chip);
-		lp8501_turn_off_channels(chip);
+		lp55xx_turn_off_channels(chip);
 		return;
 	}
 
-- 
2.45.1


