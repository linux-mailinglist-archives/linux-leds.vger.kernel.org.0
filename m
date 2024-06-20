Return-Path: <linux-leds+bounces-2087-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 824BD9114FB
	for <lists+linux-leds@lfdr.de>; Thu, 20 Jun 2024 23:44:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9032C1C225CE
	for <lists+linux-leds@lfdr.de>; Thu, 20 Jun 2024 21:44:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AD74153BF0;
	Thu, 20 Jun 2024 21:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VCiJdOVA"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DE5415251B;
	Thu, 20 Jun 2024 21:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718919709; cv=none; b=UipvZOjxGb6TSbnnBq9PGRnxXW+Cg04dds5YtvLstUOCwElnUa4uMvfG7A7nEEdWMc1irOJfUifGYoesDG/O2/+v8oy5r8LpnOGncCxhF4GJvAploH7tYNLl9HzA9CldyOft9v9qL29J8cyc6F8rEUlQmFgWTj9wz8O7dheBhg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718919709; c=relaxed/simple;
	bh=DNqXmzHMEsh3DwV1S15V2tQqJuzOJaJFTIW5s/jJFbo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j1Zwhb3z2XS2sOrPzoUPTlcM2p0aBU0rPrKknHO7Zlk3JtiNfFNhw25xfzewa2ElVXr5q4RFpeYqI+G4g/Jdub1t+8plHoEe6+YTXl/tW96lT9mIsEXzQEyH9qct+rlp3wpl01ALR5q+oJkjCHhnnye3IL0GQNGoHvRvShx0Q7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VCiJdOVA; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-42165f6645fso12603295e9.2;
        Thu, 20 Jun 2024 14:41:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718919706; x=1719524506; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+cd55MwcmwxDYM1xS6QNPLsC66LDeGdAfdzlXmx5K3c=;
        b=VCiJdOVAsD9eyNGNdQTJXnfPsLtMZoXWnItCfXx3179sgwJaiVINV57Y/a0oFm3Wdz
         EL5iTH6sk2Xf56XiiYlMMYq3XOxiUoGgZ16/FGD8ne+oSkRWFLqLGybzFroyHEugq3Xi
         goQ7nmHokBwA7+n2NSt0zYB8cg+xgALcttqbk/eESLVNIOFEYDAt5E7+YJmkUGFKX3EV
         8nB0W2NoiFgZ5VuDZpUINmjtKhGvxXpLCPaphj+E9mRUJFnxG+10lJojDMgAyFmNEha9
         PXtr3anNzHkTq2s5iecd6tuSulBofn64Ik/6pZTl9hYCXlV605qDUkvMvsrzi2FMlJQK
         RdQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718919706; x=1719524506;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+cd55MwcmwxDYM1xS6QNPLsC66LDeGdAfdzlXmx5K3c=;
        b=JsSQQGtPoV8mkUC73yU1d6G7FnPQN9iU7za6+uHmrO/pimiCzQbzy2vx6ADmbqW8kZ
         iFEORVm4l7jpJPw5N+VJXWHwVj/CogfIoExEX1I5qg4/Rxm2O3gLBkBrFQ6S2HDQBWxB
         6IDEXcjJMSRr0VysRpII4eFRlld7+Iq7UV40rMNs9uGdovW/dymf+bl0Qy4qO96V//M8
         me19UjpBEnrKEUCgseSrfQBLLn0VfeIpCnFYNAb1RJ1c1KjK+2Dj2i5oZFRNSJANKst5
         3r3tnCTymuQPThwpK0rwkzaiohWsmO5thsXvn0DbVoSbkUsOPBOEA64E5NaK7NBjgljU
         aPzQ==
X-Forwarded-Encrypted: i=1; AJvYcCXYJV+7QtnUPeMwAnHD/iJ3xQQhTDPeh3CutabCO+6QBchOHz3OwdW0T2ZxXNujK87llkPd2wyy8h/DKgUk5DnsdajFx64a4xu+d0CFK8M9dqZpVzdmr9Mz69rjb/K8eJ99rdiIzYyMEzUNATZaOWBOvHPXcbdwby+JxxY42JWtPdCEMh8=
X-Gm-Message-State: AOJu0YzzeHQPaCZ/ISl2QmUhJQ1L05iNJ6IS6WzwWkZttmDAAr6QjV1H
	C/WmW61/p2h3/5jmf5RgbgeMAp7se5EP1Fwn/GzEUwEO765V9uyx
X-Google-Smtp-Source: AGHT+IEdvuvSWbCecqBEgSesFZlQBBEStjHAOm0Pgpsjz9YMgGQeq1pufHl8QVbs2bQsqAMUxCl0Nw==
X-Received: by 2002:a05:600c:4f95:b0:421:c211:a57e with SMTP id 5b1f17b1804b1-4247529b019mr55449665e9.35.1718919705895;
        Thu, 20 Jun 2024 14:41:45 -0700 (PDT)
Received: from localhost.localdomain (93-34-90-105.ip49.fastwebnet.it. [93.34.90.105])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-366383f68acsm48866f8f.2.2024.06.20.14.41.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 14:41:45 -0700 (PDT)
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
Subject: [PATCH v7 11/20] leds: leds-lp55xx: Generalize multicolor_brightness function
Date: Thu, 20 Jun 2024 23:03:27 +0200
Message-ID: <20240620210401.22053-12-ansuelsmth@gmail.com>
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

Generalize multicolor_brightness function as the implementation is the
same for most of the lp55xx based LED driver.

Suggested-by: Lee Jones <lee@kernel.org>
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
index cc393e407837..27008b6a4757 100644
--- a/drivers/leds/leds-lp55xx-common.c
+++ b/drivers/leds/leds-lp55xx-common.c
@@ -256,6 +256,27 @@ int lp55xx_led_brightness(struct lp55xx_led *led)
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
2.45.1


