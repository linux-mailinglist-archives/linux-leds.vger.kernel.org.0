Return-Path: <linux-leds+bounces-1973-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 83FC490A036
	for <lists+linux-leds@lfdr.de>; Sun, 16 Jun 2024 23:58:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2ABC41F219D8
	for <lists+linux-leds@lfdr.de>; Sun, 16 Jun 2024 21:58:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F18C13A88D;
	Sun, 16 Jun 2024 21:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HaWmG/wM"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F51313A24D;
	Sun, 16 Jun 2024 21:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718574964; cv=none; b=OlTE4wIufMro6gsjJp7jOoISMgjkxXHnYFMd7Nm+oHrki5EaFPagdPNLw/2VpBEzHyQo5+bW+VE+ZMCBCHzyPiIhsV4+oF38cDCyFdcs8K6qfyFnJr2MxStFvqINABNnPzjrAcx6vaMY1NpGC0BxOGVcZ3Vfep3kQQgT6VI7qjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718574964; c=relaxed/simple;
	bh=EbLGmRy7LcD4aKq9UQD6BVxBGiSR9miLEzJdzhdonfo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nO20fUmeNT0zax6wXxay61LU0cZLMGxllG9RTdXPqTEEIaIp9EQjAZ9Mc3rwLpgRo/kBBNUmwuOQ3NQhb1tVgiA2pYcf0Gd3iKy432sSuP8FZ80yBgeZ7N1yIqLIj/jzFItd6G2SWRFfNMPwJNqvBCz0cCQHqzEzaoZO4IXEvu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HaWmG/wM; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-35f27eed98aso3059113f8f.2;
        Sun, 16 Jun 2024 14:56:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718574961; x=1719179761; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/eoGUyvX2njKZUc4Ego9siu0xJbl3KtjGslqTW6DXh4=;
        b=HaWmG/wMBzd0W8SHzwGA010ib9wgXge/FBpOMAMxohJ/J9feRSCX90C6NLjySX1Nlz
         V7pZBRVpE/yrCLBP1E7BXNBavqpaHU6HyJwWsT9JHYumNR1O2eqGvYm9jr2hDbJsuFFr
         tb4Z2BA4GoGeykWbYwBLgUFh8ZsNCHaX6wgFFeuPmtMK4s42F3OEYRtudUv5JrzB5Yko
         2dHUxxQJ4KQ416hTSSYiF89EKjXKhWa2NbGrB915EiDLxjmVkeNItng43l/HH7AH8MKt
         f+a4EcFy0a8fHdJMSsENsqCSdSG+hKTbJ5mBs5WxSDwJNdN0ZXI1MqByrujaViF0LgQ5
         60+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718574961; x=1719179761;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/eoGUyvX2njKZUc4Ego9siu0xJbl3KtjGslqTW6DXh4=;
        b=m+L1z/Jb9ER2xn/bL1WpcTWzfbjxzN+i3TlQXdFygxn/sjqeJJDb0y294rh4IisMlT
         o8unQC5w2iOamIjJhglgOHymuv8Q08dqZEHdx2e6C8nkwOTS5hDfs/3c/kImzCLWnJ0H
         GH2OKEQIcH2iyCQsgzkSwSrjswMwSeHs/I4O0H+7FzRivOCFpi9orwqZzsR0lk67k0sD
         fD/R1H87MZ0bsVcfLjamhJTkb8f+IO3ZKcbM5yr44Lnv4GZMyiGSr+SvdofNf5N1GQjl
         paH3irNPoTiHYngUi7OhzZlTw9fY8IY3SB4OcGf1mCw5rue3+MNI5wR60Bgmn+xzbnwH
         MmFQ==
X-Forwarded-Encrypted: i=1; AJvYcCWkQUoFuyUD5RhOqqh3X8+MgDu+aASZ/hCN9gbhWI6nY4Shbb8bzVnb9u/QV/kDFHqfrv4MQLIXo5WTsEhU+b0OyMWJhkP0ZFg0HdSsXej937o9E/RbCnyJNFL79UH1UbQqeqZlL8DiObIb8pa7GdPu6xYUiIpHikyKFK5WZkjXgW/JikE=
X-Gm-Message-State: AOJu0YwZzpkhCfluB9iKgM+e4O0RzhjPQ2XayY9E6gkxY3nW+OzpOwh8
	KIcehvtodkwsY718fJqkfMfyqBt7xyZjKazAp4EAFwfVuMBR4WlmNkj9Pg==
X-Google-Smtp-Source: AGHT+IHZ/tJuawD7clx25ood8aMusPMhMMXRoj5Ub/NqdtABJjEfNxnNiFhrupBQBuGKKzJ7LyBycA==
X-Received: by 2002:a5d:6e03:0:b0:35f:ece:3f63 with SMTP id ffacd0b85a97d-3607a77afa8mr5365879f8f.46.1718574960833;
        Sun, 16 Jun 2024 14:56:00 -0700 (PDT)
Received: from localhost.localdomain (93-34-90-105.ip49.fastwebnet.it. [93.34.90.105])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-36075104b74sm10362879f8f.107.2024.06.16.14.55.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Jun 2024 14:56:00 -0700 (PDT)
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
Subject: [PATCH v6 13/20] leds: leds-lp55xx: generalize turn_off_channels function
Date: Sun, 16 Jun 2024 23:52:12 +0200
Message-ID: <20240616215226.2112-14-ansuelsmth@gmail.com>
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

Generalize turn_off_channels function as the implementation is the same for
most of the lp55xx based LED driver.

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
index d8662d128945..202b598dd177 100644
--- a/drivers/leds/leds-lp55xx-common.c
+++ b/drivers/leds/leds-lp55xx-common.c
@@ -290,6 +290,16 @@ void lp55xx_set_led_current(struct lp55xx_led *led, u8 led_current)
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
2.43.0


