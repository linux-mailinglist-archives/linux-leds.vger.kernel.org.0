Return-Path: <linux-leds+bounces-1971-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5963290A030
	for <lists+linux-leds@lfdr.de>; Sun, 16 Jun 2024 23:58:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9ACFCB20A27
	for <lists+linux-leds@lfdr.de>; Sun, 16 Jun 2024 21:58:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8806B13A242;
	Sun, 16 Jun 2024 21:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dsATTHlr"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 906A513541E;
	Sun, 16 Jun 2024 21:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718574962; cv=none; b=CcQRdxTT3Ak+jDZ2TGDTlV3UIlQxwquQXatJktl1GFtY0OSBcAUwtnYk5u61nQj5K0wMxnF6psaTcIY8L6eYEzkzvvBlONV+aTpMeMSM9+pqhJOL0AQtup2fxklOAK3xugBkD2z9592MxREO+VT1+pLm0qY12Rx54uxnIi50WF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718574962; c=relaxed/simple;
	bh=rM0K4/9vjJYHqS3YAXpaJzhrRbVDajL53pbbU+bBn6c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M04q/WMhwfGnkT6wQk9Gxrs0ZZ8hNYWCrQ0leW4f2/YL0cCALRtzKOutZ5IpS70A58d81T+ObgkpWwnXHyt3+rfQ9qIj1pzPDuV9tWAajnqMMu+O+FoGWlGXklPrRh7XSq+a9I1K/LUh9wmrLf+yqLO3d/mU53xsQqoLjq6SeHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dsATTHlr; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-35f223e7691so2470160f8f.1;
        Sun, 16 Jun 2024 14:56:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718574959; x=1719179759; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l75o3fwlv4tb6gV40sJ/HQkyJddD7j0kEEi/md20QUE=;
        b=dsATTHlrSvriUajoaqrYvmOHtLIqwwYNyT72LnCl0WbqHmqI6mLiDPKWKfVGyGWfgl
         iLTB4/eTqteXsn7EeCbDMngHLK2NtXtg3Z2pz1q7HtWJrY2Gzip5H0kBXZJoyytBNpqb
         93eaMLrj67RzncM8/UhjiOBKSSE4gEycSGvLBvMyIONIy0s9c4TcB3fSwZ54yF/IQ6h5
         lx5McMkrIb/mjxK9hKqnUffJJVHArlcW4RSS/nIMz7PyU24yAmUtW3LBi9zWIy8r0hJ2
         wn52tSAK+fH95PrZL9wc+prGSaONOLeibNw83Sp7fOpk5KV8EbgjqF2DELBtCKzy4TPd
         hYJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718574959; x=1719179759;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l75o3fwlv4tb6gV40sJ/HQkyJddD7j0kEEi/md20QUE=;
        b=Yj7Ke5HOSNCX/ye7Id2oG41NjAeX7JwUEydhL8viV3XYLIf8ooXv5KWJ1WN0qsIYgu
         VxTaKqj+dm00Fmg96MysD9GyMFjP8I0HWyYAvGT9e9dhwLvnxok1k8pYRa22hD27pS+r
         CMNbGjtWYTIMoP5dvtl59FXflWFrYzpuIIYRzYwj2w5GcrVNI8PLEK09G/0cyfJXocjn
         rFavM3uO/FfXeUj/6+RQGgotkS2lw4CpxEC0BtWxGBE9uvY7byvjkgd+J9/tuYEHXguk
         0A2mLYLY3N0uJGf6IZwVTent0TDWg0q3s1esQr85KMjxsB6R/xjavgtXMvPh/lT7fc/a
         o9aw==
X-Forwarded-Encrypted: i=1; AJvYcCVC+sASJbq9SW0+GQR6xGbMuMIsj99UewZm12bliYowhw/sOugXent+S3nBBfEGXw/IUXHnVyOSV8xXRT02BaAPCMaOwpslrrrO+kih6610q095zV2Io+kwALKoGLy1sabnN7gdvKJVXG2v5kbotd74yAdRrP/1EOSLFu78T566+2FI5bY=
X-Gm-Message-State: AOJu0YyU+yToIEEhMjK06ouD3eAJyDv7w2FbbaoxM5UZbuqkXdSfMl1f
	SEaXMV7uPjta4gO1HB4V0PHUhm/odESzSdLii/IH6t+3cx7tQq4T
X-Google-Smtp-Source: AGHT+IHHCKl1WzRzbQKWQNz8c1xGN2sOW/XQhOjZMJYs+yyK6XMotSMEhw51S4sdKxbbjY0yDHO9XQ==
X-Received: by 2002:adf:f5cc:0:b0:360:7c76:dd5 with SMTP id ffacd0b85a97d-3607c760ed5mr6478190f8f.14.1718574958697;
        Sun, 16 Jun 2024 14:55:58 -0700 (PDT)
Received: from localhost.localdomain (93-34-90-105.ip49.fastwebnet.it. [93.34.90.105])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-36075104b74sm10362879f8f.107.2024.06.16.14.55.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Jun 2024 14:55:58 -0700 (PDT)
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
Subject: [PATCH v6 11/20] leds: leds-lp55xx: generalize multicolor_brightness function
Date: Sun, 16 Jun 2024 23:52:10 +0200
Message-ID: <20240616215226.2112-12-ansuelsmth@gmail.com>
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

Generalize multicolor_brightness function as the implementation is the
same for most of the lp55xx based LED driver.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/leds/leds-lp5521.c        | 21 +--------------------
 drivers/leds/leds-lp5523.c        | 21 +--------------------
 drivers/leds/leds-lp55xx-common.c | 21 +++++++++++++++++++++
 drivers/leds/leds-lp55xx-common.h |  1 +
 4 files changed, 24 insertions(+), 40 deletions(-)

diff --git a/drivers/leds/leds-lp5521.c b/drivers/leds/leds-lp5521.c
index e4d0dcdbf11b..dd7e996f22f9 100644
--- a/drivers/leds/leds-lp5521.c
+++ b/drivers/leds/leds-lp5521.c
@@ -222,25 +222,6 @@ static int lp5521_run_selftest(struct lp55xx_chip *chip, char *buf)
 	return 0;
 }
 
-static int lp5521_multicolor_brightness(struct lp55xx_led *led)
-{
-	struct lp55xx_chip *chip = led->chip;
-	int ret;
-	int i;
-
-	mutex_lock(&chip->lock);
-	for (i = 0; i < led->mc_cdev.num_colors; i++) {
-		ret = lp55xx_write(chip,
-				   LP5521_REG_LED_PWM_BASE +
-				   led->mc_cdev.subled_info[i].channel,
-				   led->mc_cdev.subled_info[i].brightness);
-		if (ret)
-			break;
-	}
-	mutex_unlock(&chip->lock);
-	return ret;
-}
-
 static ssize_t show_engine_mode(struct device *dev,
 				struct device_attribute *attr,
 				char *buf, int nr)
@@ -381,7 +362,7 @@ static struct lp55xx_device_config lp5521_cfg = {
 	.max_channel  = LP5521_MAX_LEDS,
 	.post_init_device   = lp5521_post_init_device,
 	.brightness_fn      = lp55xx_led_brightness,
-	.multicolor_brightness_fn = lp5521_multicolor_brightness,
+	.multicolor_brightness_fn = lp55xx_multicolor_brightness,
 	.set_led_current    = lp5521_set_led_current,
 	.firmware_cb        = lp55xx_firmware_loaded_cb,
 	.run_engine         = lp5521_run_engine,
diff --git a/drivers/leds/leds-lp5523.c b/drivers/leds/leds-lp5523.c
index a3b4063d504e..bfa0c4431ede 100644
--- a/drivers/leds/leds-lp5523.c
+++ b/drivers/leds/leds-lp5523.c
@@ -664,25 +664,6 @@ static ssize_t store_master_fader_leds(struct device *dev,
 	return ret;
 }
 
-static int lp5523_multicolor_brightness(struct lp55xx_led *led)
-{
-	struct lp55xx_chip *chip = led->chip;
-	int ret;
-	int i;
-
-	mutex_lock(&chip->lock);
-	for (i = 0; i < led->mc_cdev.num_colors; i++) {
-		ret = lp55xx_write(chip,
-				   LP5523_REG_LED_PWM_BASE +
-				   led->mc_cdev.subled_info[i].channel,
-				   led->mc_cdev.subled_info[i].brightness);
-		if (ret)
-			break;
-	}
-	mutex_unlock(&chip->lock);
-	return ret;
-}
-
 static LP55XX_DEV_ATTR_RW(engine1_mode, show_engine1_mode, store_engine1_mode);
 static LP55XX_DEV_ATTR_RW(engine2_mode, show_engine2_mode, store_engine2_mode);
 static LP55XX_DEV_ATTR_RW(engine3_mode, show_engine3_mode, store_engine3_mode);
@@ -754,7 +735,7 @@ static struct lp55xx_device_config lp5523_cfg = {
 	.max_channel  = LP5523_MAX_LEDS,
 	.post_init_device   = lp5523_post_init_device,
 	.brightness_fn      = lp55xx_led_brightness,
-	.multicolor_brightness_fn = lp5523_multicolor_brightness,
+	.multicolor_brightness_fn = lp55xx_multicolor_brightness,
 	.set_led_current    = lp5523_set_led_current,
 	.firmware_cb        = lp55xx_firmware_loaded_cb,
 	.run_engine         = lp5523_run_engine,
diff --git a/drivers/leds/leds-lp55xx-common.c b/drivers/leds/leds-lp55xx-common.c
index 4d607849cd50..d3a18045df56 100644
--- a/drivers/leds/leds-lp55xx-common.c
+++ b/drivers/leds/leds-lp55xx-common.c
@@ -258,6 +258,27 @@ int lp55xx_led_brightness(struct lp55xx_led *led)
 }
 EXPORT_SYMBOL_GPL(lp55xx_led_brightness);
 
+int lp55xx_multicolor_brightness(struct lp55xx_led *led)
+{
+	struct lp55xx_chip *chip = led->chip;
+	const struct lp55xx_device_config *cfg = chip->cfg;
+	int ret;
+	int i;
+
+	mutex_lock(&chip->lock);
+	for (i = 0; i < led->mc_cdev.num_colors; i++) {
+		ret = lp55xx_write(chip,
+				   cfg->reg_led_pwm_base.addr +
+				   led->mc_cdev.subled_info[i].channel,
+				   led->mc_cdev.subled_info[i].brightness);
+		if (ret)
+			break;
+	}
+	mutex_unlock(&chip->lock);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(lp55xx_multicolor_brightness);
+
 static void lp55xx_reset_device(struct lp55xx_chip *chip)
 {
 	const struct lp55xx_device_config *cfg = chip->cfg;
diff --git a/drivers/leds/leds-lp55xx-common.h b/drivers/leds/leds-lp55xx-common.h
index 4578418e5011..021dd17bc5d7 100644
--- a/drivers/leds/leds-lp55xx-common.h
+++ b/drivers/leds/leds-lp55xx-common.h
@@ -216,6 +216,7 @@ extern int lp55xx_update_program_memory(struct lp55xx_chip *chip,
 					const u8 *data, size_t size);
 extern void lp55xx_firmware_loaded_cb(struct lp55xx_chip *chip);
 extern int lp55xx_led_brightness(struct lp55xx_led *led);
+extern int lp55xx_multicolor_brightness(struct lp55xx_led *led);
 
 /* common probe/remove function */
 extern int lp55xx_probe(struct i2c_client *client);
-- 
2.43.0


