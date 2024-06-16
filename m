Return-Path: <linux-leds+bounces-1975-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FB1E90A03C
	for <lists+linux-leds@lfdr.de>; Sun, 16 Jun 2024 23:59:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 10D3C1F219FC
	for <lists+linux-leds@lfdr.de>; Sun, 16 Jun 2024 21:59:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C44B713AD25;
	Sun, 16 Jun 2024 21:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YC7dv2Qf"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BCCE13A86E;
	Sun, 16 Jun 2024 21:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718574966; cv=none; b=rG/05wB2PHUjeAJsIr7QTjV4UhT7YpBQjd9j+JIPPZ9vBRuz1qTRcwJvJ7NKP264cSzWvc0xxSzdzl+eAnjujpBYkmltFnJvQQ1EEf6EBAIfrm1bA0bY9kpdKgs9ZRoJ3LqsVNBUBrHsHTWBagFGdi2sF9RT/LyZW6Opzas+isI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718574966; c=relaxed/simple;
	bh=teN6RcLhTClIKudPtCae74rHmHToMDH/zDtMOoFPC9M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dGI6Gvq7ZUfGjyciZpSorOKoLvV5I0r1vY7awcoT+IFObDY8/KW16evJufNqK9Aegi20VorbVxtMlgl2VWXvIdl9LxGDmjukIFJCGltAyQvAEcm+ve2NfTsH1bywIfbkEbRzAGJoAFSNlIiYkgGuxBhaKBP21Xce7pbY0RYV7+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YC7dv2Qf; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-35dc9cef36dso3459237f8f.3;
        Sun, 16 Jun 2024 14:56:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718574963; x=1719179763; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=936srXE0qPYMcHTRufholGRjWGSRbgibILay/ewjoZA=;
        b=YC7dv2QfgrnV1b00BFsbQbrNj5J6VlbWaEAmKW2m6sMNjm5cb/UPOkatxHBTlPxAEM
         0ExnASIdvhwblK0AYPgQBpquKlR+nWtgGbEimgkwO23LxGiD/cGWC5HZj6QUjW9vcpgb
         FHrFUJeYslCanSyIyoVGnJGWNC+olMmAy+UqGAnpfL6CHAnhAVwwMH/AHyzoQJQNwV+Y
         /vtiDmBHSSI62XrAr/04iOaBeX31OmX9QBF8dlsgsXn5palx4yEH3W9t0RAqBy0VTOkz
         z5g64ImeLrqyRUMIWhl+27Npo7aw+zvhfOhz9gqsdil3+gnfP9uAuYGHInI8KlhziY7j
         efNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718574963; x=1719179763;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=936srXE0qPYMcHTRufholGRjWGSRbgibILay/ewjoZA=;
        b=etRnF4zyKfy9X/cDpkjIkMYtBEfgG6tkAyGwE/Wa86QbE/TXFyivptNXdIs8ss8y4Y
         QXg8NBeWIZXIVTsGcak9YGOqasH+Qn6MNIHf/L7LQolKT/Me6DjuPIse5nrL5GGIW8HL
         8zKFXAxjgUpXsPjxFa2MfFcTrES88l/iT9BoSjYvDgWUaQNRMKASe7yd1E3Rh7lvUbkj
         xmfsk6iEOJVGFUPVtY5lGgNIGCYoNXYDPP4T9HA2wwKcXI/k6mIi74gXT/ayrjCMcs1l
         L2eqAvywchQRx0AXwKJ+qGCEJKbDMC4x5XqL7q6TpGjl85QpLY7qjPT5cM4rpKobV5Ch
         Z28w==
X-Forwarded-Encrypted: i=1; AJvYcCW+3zn4eQqfYkYV2XkUX2Q0UnRTuiOz/fW0+1e0cDayccz6GW/FAgssYbCk20uKWJkY9IuhzPRgwAv9G2OMcCH7Rqmz/Di/M52tQ8IewazOUnjUqduirKf2DTEvWKwe/PEfKfXKEWngaNxnnyOta76lS9S/OijQQ5IUCbbb5Z+nmBMH8AQ=
X-Gm-Message-State: AOJu0Ywx9djlAXR8P075u+hK8w+toGt0IqETR5jT386ieP2nQEw13gty
	MemWdSrbo0aD3cPxWFgJYVJOwDjiURtIs78QpBH+pqMNrmBertKN
X-Google-Smtp-Source: AGHT+IEnTgvpdT6cM2x2z65aBRUyYrbD6Ncd/QQWH/4fRipvVj6ofVQLSONJPv65oJzH/fqllu8jkA==
X-Received: by 2002:a5d:528b:0:b0:35f:2729:a110 with SMTP id ffacd0b85a97d-3607a7207c9mr5774521f8f.9.1718574962737;
        Sun, 16 Jun 2024 14:56:02 -0700 (PDT)
Received: from localhost.localdomain (93-34-90-105.ip49.fastwebnet.it. [93.34.90.105])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-36075104b74sm10362879f8f.107.2024.06.16.14.56.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Jun 2024 14:56:02 -0700 (PDT)
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
Subject: [PATCH v6 15/20] leds: leds-lp55xx: generalize sysfs engine_load and engine_mode
Date: Sun, 16 Jun 2024 23:52:14 +0200
Message-ID: <20240616215226.2112-16-ansuelsmth@gmail.com>
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

Generalize sysfs engine_load and engine_mode since their implementation
is the same acrosso some lp55xx based LED driver.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/leds/leds-lp5521.c        | 88 +++----------------------------
 drivers/leds/leds-lp5523.c        | 88 +++----------------------------
 drivers/leds/leds-lp55xx-common.c | 83 ++++++++++++++++++++++++++---
 drivers/leds/leds-lp55xx-common.h | 26 +++++++--
 4 files changed, 112 insertions(+), 173 deletions(-)

diff --git a/drivers/leds/leds-lp5521.c b/drivers/leds/leds-lp5521.c
index 4afae0c70d19..519e7627ac22 100644
--- a/drivers/leds/leds-lp5521.c
+++ b/drivers/leds/leds-lp5521.c
@@ -201,82 +201,6 @@ static int lp5521_run_selftest(struct lp55xx_chip *chip, char *buf)
 	return 0;
 }
 
-static ssize_t show_engine_mode(struct device *dev,
-				struct device_attribute *attr,
-				char *buf, int nr)
-{
-	struct lp55xx_led *led = i2c_get_clientdata(to_i2c_client(dev));
-	struct lp55xx_chip *chip = led->chip;
-	enum lp55xx_engine_mode mode = chip->engines[nr - 1].mode;
-
-	switch (mode) {
-	case LP55XX_ENGINE_RUN:
-		return sprintf(buf, "run\n");
-	case LP55XX_ENGINE_LOAD:
-		return sprintf(buf, "load\n");
-	case LP55XX_ENGINE_DISABLED:
-	default:
-		return sprintf(buf, "disabled\n");
-	}
-}
-show_mode(1)
-show_mode(2)
-show_mode(3)
-
-static ssize_t store_engine_mode(struct device *dev,
-				 struct device_attribute *attr,
-				 const char *buf, size_t len, int nr)
-{
-	struct lp55xx_led *led = i2c_get_clientdata(to_i2c_client(dev));
-	struct lp55xx_chip *chip = led->chip;
-	struct lp55xx_engine *engine = &chip->engines[nr - 1];
-
-	mutex_lock(&chip->lock);
-
-	chip->engine_idx = nr;
-
-	if (!strncmp(buf, "run", 3)) {
-		lp5521_run_engine(chip, true);
-		engine->mode = LP55XX_ENGINE_RUN;
-	} else if (!strncmp(buf, "load", 4)) {
-		lp55xx_stop_engine(chip);
-		lp55xx_load_engine(chip);
-		engine->mode = LP55XX_ENGINE_LOAD;
-	} else if (!strncmp(buf, "disabled", 8)) {
-		lp55xx_stop_engine(chip);
-		engine->mode = LP55XX_ENGINE_DISABLED;
-	}
-
-	mutex_unlock(&chip->lock);
-
-	return len;
-}
-store_mode(1)
-store_mode(2)
-store_mode(3)
-
-static ssize_t store_engine_load(struct device *dev,
-			     struct device_attribute *attr,
-			     const char *buf, size_t len, int nr)
-{
-	struct lp55xx_led *led = i2c_get_clientdata(to_i2c_client(dev));
-	struct lp55xx_chip *chip = led->chip;
-	int ret;
-
-	mutex_lock(&chip->lock);
-
-	chip->engine_idx = nr;
-	lp55xx_load_engine(chip);
-	ret = lp55xx_update_program_memory(chip, buf, len);
-
-	mutex_unlock(&chip->lock);
-
-	return ret;
-}
-store_load(1)
-store_load(2)
-store_load(3)
-
 static ssize_t lp5521_selftest(struct device *dev,
 			       struct device_attribute *attr,
 			       char *buf)
@@ -293,12 +217,12 @@ static ssize_t lp5521_selftest(struct device *dev,
 }
 
 /* device attributes */
-static LP55XX_DEV_ATTR_RW(engine1_mode, show_engine1_mode, store_engine1_mode);
-static LP55XX_DEV_ATTR_RW(engine2_mode, show_engine2_mode, store_engine2_mode);
-static LP55XX_DEV_ATTR_RW(engine3_mode, show_engine3_mode, store_engine3_mode);
-static LP55XX_DEV_ATTR_WO(engine1_load, store_engine1_load);
-static LP55XX_DEV_ATTR_WO(engine2_load, store_engine2_load);
-static LP55XX_DEV_ATTR_WO(engine3_load, store_engine3_load);
+LP55XX_DEV_ATTR_ENGINE_MODE(1);
+LP55XX_DEV_ATTR_ENGINE_MODE(2);
+LP55XX_DEV_ATTR_ENGINE_MODE(3);
+LP55XX_DEV_ATTR_ENGINE_LOAD(1);
+LP55XX_DEV_ATTR_ENGINE_LOAD(2);
+LP55XX_DEV_ATTR_ENGINE_LOAD(3);
 static LP55XX_DEV_ATTR_RO(selftest, lp5521_selftest);
 
 static struct attribute *lp5521_attributes[] = {
diff --git a/drivers/leds/leds-lp5523.c b/drivers/leds/leds-lp5523.c
index 1dd909a0fff5..19b119a2b256 100644
--- a/drivers/leds/leds-lp5523.c
+++ b/drivers/leds/leds-lp5523.c
@@ -225,60 +225,6 @@ static int lp5523_init_program_engine(struct lp55xx_chip *chip)
 	return ret;
 }
 
-static ssize_t show_engine_mode(struct device *dev,
-				struct device_attribute *attr,
-				char *buf, int nr)
-{
-	struct lp55xx_led *led = i2c_get_clientdata(to_i2c_client(dev));
-	struct lp55xx_chip *chip = led->chip;
-	enum lp55xx_engine_mode mode = chip->engines[nr - 1].mode;
-
-	switch (mode) {
-	case LP55XX_ENGINE_RUN:
-		return sprintf(buf, "run\n");
-	case LP55XX_ENGINE_LOAD:
-		return sprintf(buf, "load\n");
-	case LP55XX_ENGINE_DISABLED:
-	default:
-		return sprintf(buf, "disabled\n");
-	}
-}
-show_mode(1)
-show_mode(2)
-show_mode(3)
-
-static ssize_t store_engine_mode(struct device *dev,
-				 struct device_attribute *attr,
-				 const char *buf, size_t len, int nr)
-{
-	struct lp55xx_led *led = i2c_get_clientdata(to_i2c_client(dev));
-	struct lp55xx_chip *chip = led->chip;
-	struct lp55xx_engine *engine = &chip->engines[nr - 1];
-
-	mutex_lock(&chip->lock);
-
-	chip->engine_idx = nr;
-
-	if (!strncmp(buf, "run", 3)) {
-		lp5523_run_engine(chip, true);
-		engine->mode = LP55XX_ENGINE_RUN;
-	} else if (!strncmp(buf, "load", 4)) {
-		lp55xx_stop_engine(chip);
-		lp55xx_load_engine(chip);
-		engine->mode = LP55XX_ENGINE_LOAD;
-	} else if (!strncmp(buf, "disabled", 8)) {
-		lp55xx_stop_engine(chip);
-		engine->mode = LP55XX_ENGINE_DISABLED;
-	}
-
-	mutex_unlock(&chip->lock);
-
-	return len;
-}
-store_mode(1)
-store_mode(2)
-store_mode(3)
-
 static int lp5523_mux_parse(const char *buf, u16 *mux, size_t len)
 {
 	u16 tmp_mux = 0;
@@ -392,28 +338,6 @@ store_leds(1)
 store_leds(2)
 store_leds(3)
 
-static ssize_t store_engine_load(struct device *dev,
-			     struct device_attribute *attr,
-			     const char *buf, size_t len, int nr)
-{
-	struct lp55xx_led *led = i2c_get_clientdata(to_i2c_client(dev));
-	struct lp55xx_chip *chip = led->chip;
-	int ret;
-
-	mutex_lock(&chip->lock);
-
-	chip->engine_idx = nr;
-	lp55xx_load_engine(chip);
-	ret = lp55xx_update_program_memory(chip, buf, len);
-
-	mutex_unlock(&chip->lock);
-
-	return ret;
-}
-store_load(1)
-store_load(2)
-store_load(3)
-
 static ssize_t lp5523_selftest(struct device *dev,
 			       struct device_attribute *attr,
 			       char *buf)
@@ -635,15 +559,15 @@ static ssize_t store_master_fader_leds(struct device *dev,
 	return ret;
 }
 
-static LP55XX_DEV_ATTR_RW(engine1_mode, show_engine1_mode, store_engine1_mode);
-static LP55XX_DEV_ATTR_RW(engine2_mode, show_engine2_mode, store_engine2_mode);
-static LP55XX_DEV_ATTR_RW(engine3_mode, show_engine3_mode, store_engine3_mode);
+LP55XX_DEV_ATTR_ENGINE_MODE(1);
+LP55XX_DEV_ATTR_ENGINE_MODE(2);
+LP55XX_DEV_ATTR_ENGINE_MODE(3);
 static LP55XX_DEV_ATTR_RW(engine1_leds, show_engine1_leds, store_engine1_leds);
 static LP55XX_DEV_ATTR_RW(engine2_leds, show_engine2_leds, store_engine2_leds);
 static LP55XX_DEV_ATTR_RW(engine3_leds, show_engine3_leds, store_engine3_leds);
-static LP55XX_DEV_ATTR_WO(engine1_load, store_engine1_load);
-static LP55XX_DEV_ATTR_WO(engine2_load, store_engine2_load);
-static LP55XX_DEV_ATTR_WO(engine3_load, store_engine3_load);
+LP55XX_DEV_ATTR_ENGINE_LOAD(1);
+LP55XX_DEV_ATTR_ENGINE_LOAD(2);
+LP55XX_DEV_ATTR_ENGINE_LOAD(3);
 static LP55XX_DEV_ATTR_RO(selftest, lp5523_selftest);
 static LP55XX_DEV_ATTR_RW(master_fader1, show_master_fader1,
 			  store_master_fader1);
diff --git a/drivers/leds/leds-lp55xx-common.c b/drivers/leds/leds-lp55xx-common.c
index 09a81476c4ce..506cde3f4cc1 100644
--- a/drivers/leds/leds-lp55xx-common.c
+++ b/drivers/leds/leds-lp55xx-common.c
@@ -543,8 +543,8 @@ static int lp55xx_request_firmware(struct lp55xx_chip *chip)
 }
 
 static ssize_t select_engine_show(struct device *dev,
-			    struct device_attribute *attr,
-			    char *buf)
+				  struct device_attribute *attr,
+				  char *buf)
 {
 	struct lp55xx_led *led = i2c_get_clientdata(to_i2c_client(dev));
 	struct lp55xx_chip *chip = led->chip;
@@ -553,8 +553,8 @@ static ssize_t select_engine_show(struct device *dev,
 }
 
 static ssize_t select_engine_store(struct device *dev,
-			     struct device_attribute *attr,
-			     const char *buf, size_t len)
+				   struct device_attribute *attr,
+				   const char *buf, size_t len)
 {
 	struct lp55xx_led *led = i2c_get_clientdata(to_i2c_client(dev));
 	struct lp55xx_chip *chip = led->chip;
@@ -595,8 +595,8 @@ static inline void lp55xx_run_engine(struct lp55xx_chip *chip, bool start)
 }
 
 static ssize_t run_engine_store(struct device *dev,
-			     struct device_attribute *attr,
-			     const char *buf, size_t len)
+				struct device_attribute *attr,
+				const char *buf, size_t len)
 {
 	struct lp55xx_led *led = i2c_get_clientdata(to_i2c_client(dev));
 	struct lp55xx_chip *chip = led->chip;
@@ -622,6 +622,77 @@ static ssize_t run_engine_store(struct device *dev,
 static DEVICE_ATTR_RW(select_engine);
 static DEVICE_ATTR_WO(run_engine);
 
+ssize_t lp55xx_show_engine_mode(struct device *dev,
+				struct device_attribute *attr,
+				char *buf, int nr)
+{
+	struct lp55xx_led *led = i2c_get_clientdata(to_i2c_client(dev));
+	struct lp55xx_chip *chip = led->chip;
+	enum lp55xx_engine_mode mode = chip->engines[nr - 1].mode;
+
+	switch (mode) {
+	case LP55XX_ENGINE_RUN:
+		return sprintf(buf, "run\n");
+	case LP55XX_ENGINE_LOAD:
+		return sprintf(buf, "load\n");
+	case LP55XX_ENGINE_DISABLED:
+	default:
+		return sprintf(buf, "disabled\n");
+	}
+}
+EXPORT_SYMBOL_GPL(lp55xx_show_engine_mode);
+
+ssize_t lp55xx_store_engine_mode(struct device *dev,
+				 struct device_attribute *attr,
+				 const char *buf, size_t len, int nr)
+{
+	struct lp55xx_led *led = i2c_get_clientdata(to_i2c_client(dev));
+	struct lp55xx_chip *chip = led->chip;
+	const struct lp55xx_device_config *cfg = chip->cfg;
+	struct lp55xx_engine *engine = &chip->engines[nr - 1];
+
+	mutex_lock(&chip->lock);
+
+	chip->engine_idx = nr;
+
+	if (!strncmp(buf, "run", 3)) {
+		cfg->run_engine(chip, true);
+		engine->mode = LP55XX_ENGINE_RUN;
+	} else if (!strncmp(buf, "load", 4)) {
+		lp55xx_stop_engine(chip);
+		lp55xx_load_engine(chip);
+		engine->mode = LP55XX_ENGINE_LOAD;
+	} else if (!strncmp(buf, "disabled", 8)) {
+		lp55xx_stop_engine(chip);
+		engine->mode = LP55XX_ENGINE_DISABLED;
+	}
+
+	mutex_unlock(&chip->lock);
+
+	return len;
+}
+EXPORT_SYMBOL_GPL(lp55xx_store_engine_mode);
+
+ssize_t lp55xx_store_engine_load(struct device *dev,
+				 struct device_attribute *attr,
+				 const char *buf, size_t len, int nr)
+{
+	struct lp55xx_led *led = i2c_get_clientdata(to_i2c_client(dev));
+	struct lp55xx_chip *chip = led->chip;
+	int ret;
+
+	mutex_lock(&chip->lock);
+
+	chip->engine_idx = nr;
+	lp55xx_load_engine(chip);
+	ret = lp55xx_update_program_memory(chip, buf, len);
+
+	mutex_unlock(&chip->lock);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(lp55xx_store_engine_load);
+
 static struct attribute *lp55xx_engine_attributes[] = {
 	&dev_attr_select_engine.attr,
 	&dev_attr_run_engine.attr,
diff --git a/drivers/leds/leds-lp55xx-common.h b/drivers/leds/leds-lp55xx-common.h
index 0aba6955a3af..00d16a86b750 100644
--- a/drivers/leds/leds-lp55xx-common.h
+++ b/drivers/leds/leds-lp55xx-common.h
@@ -40,7 +40,7 @@ static ssize_t show_engine##nr##_mode(struct device *dev,		\
 				    struct device_attribute *attr,	\
 				    char *buf)				\
 {									\
-	return show_engine_mode(dev, attr, buf, nr);			\
+	return lp55xx_show_engine_mode(dev, attr, buf, nr);		\
 }
 
 #define store_mode(nr)							\
@@ -48,9 +48,14 @@ static ssize_t store_engine##nr##_mode(struct device *dev,		\
 				     struct device_attribute *attr,	\
 				     const char *buf, size_t len)	\
 {									\
-	return store_engine_mode(dev, attr, buf, len, nr);		\
+	return lp55xx_store_engine_mode(dev, attr, buf, len, nr);	\
 }
 
+#define LP55XX_DEV_ATTR_ENGINE_MODE(nr)  \
+	show_mode(nr)			 \
+	store_mode(nr)			 \
+	static LP55XX_DEV_ATTR_RW(engine##nr##_mode, show_engine##nr##_mode, store_engine##nr##_mode)
+
 #define show_leds(nr)							\
 static ssize_t show_engine##nr##_leds(struct device *dev,		\
 			    struct device_attribute *attr,		\
@@ -72,9 +77,13 @@ static ssize_t store_engine##nr##_load(struct device *dev,		\
 				     struct device_attribute *attr,	\
 				     const char *buf, size_t len)	\
 {									\
-	return store_engine_load(dev, attr, buf, len, nr);		\
+	return lp55xx_store_engine_load(dev, attr, buf, len, nr);	\
 }
 
+#define LP55XX_DEV_ATTR_ENGINE_LOAD(nr)  \
+	store_load(nr)			 \
+	static LP55XX_DEV_ATTR_WO(engine##nr##_load, store_engine##nr##_load)
+
 struct lp55xx_led;
 struct lp55xx_chip;
 
@@ -227,4 +236,15 @@ extern void lp55xx_stop_engine(struct lp55xx_chip *chip);
 extern int lp55xx_probe(struct i2c_client *client);
 extern void lp55xx_remove(struct i2c_client *client);
 
+/* common sysfs function */
+extern ssize_t lp55xx_show_engine_mode(struct device *dev,
+				       struct device_attribute *attr,
+				       char *buf, int nr);
+extern ssize_t lp55xx_store_engine_mode(struct device *dev,
+					struct device_attribute *attr,
+					const char *buf, size_t len, int nr);
+extern ssize_t lp55xx_store_engine_load(struct device *dev,
+					struct device_attribute *attr,
+					const char *buf, size_t len, int nr);
+
 #endif /* _LEDS_LP55XX_COMMON_H */
-- 
2.43.0


