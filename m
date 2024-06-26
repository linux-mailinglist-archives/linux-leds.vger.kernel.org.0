Return-Path: <linux-leds+bounces-2142-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F3CB59186A5
	for <lists+linux-leds@lfdr.de>; Wed, 26 Jun 2024 18:04:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 20D351C22B44
	for <lists+linux-leds@lfdr.de>; Wed, 26 Jun 2024 16:04:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F6B7191474;
	Wed, 26 Jun 2024 16:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FIfJKl7W"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F14FB190661;
	Wed, 26 Jun 2024 16:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719417650; cv=none; b=HsmpI+lytKMnAaMqpK+qcZAQJciPUhlCelAKVVtkWBRyHP++246OMG2rD5YbjzjwBtuqMj/acKymH0pFpWepApDTKB1FgjXAIb9ywzgzWHsrvv1QxrBtTDDKS/YDRgCZherpleZbsbmbrQeTm3+4lp6GEmenpPsxSzBBNiCwQI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719417650; c=relaxed/simple;
	bh=xIfhZd12c7XRnkbv7tz+FMHPDNGQOGQnVqAKk7l9NkY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JIHoStJDWQg9jnFmt0y58cGVE0vj9Gf+Ht4bBJylFsL0PwzNHYPmE0+YK9QzmUgm0whrkZ3mGAzY9Zpst1mIvWT/s4eejLkMpFcTNjtLF1/0pJI7m9GFrHJPKm3zHKnIPYfsy1c4UFDqIFfUVrtaC6K9zBJbYCgIXsvX3t7GSfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FIfJKl7W; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-362b32fbb3bso4389931f8f.2;
        Wed, 26 Jun 2024 09:00:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719417646; x=1720022446; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R08tb1yYmAfU91n0VowZ692+xVkx6UEt3wQz/LuzwAE=;
        b=FIfJKl7Wwj4gERON7ze8uPaU7J90PtnO/hc4f7fewUgQDR0y9SheS++il/3lPLu2Ls
         5Bi+bj6RPdOM5G30PLNreF0Bd8Y+S2jcLVoznnKd9zDb6aYg3owvwIQJhxBsLFLtr2D2
         cyvgJ7j+qfTtj9+RDXSX+kJR6mj+bQaqJR0aaQ8a6mrPKMT/4pgMPyuqlDt061m6cMMX
         t9M6fpfebYBm9hMcQISMqcmRwfsi4TQqIoODnbAVqwBXbPiFKaOFp2ZDuuFahzV8JWFy
         xHGO4XKxxroUeEkcOrfwKeFmqcS+PJWS4VM2cu3uER7f4GoGYZc1oPs0G+5VFqwomErO
         HoBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719417646; x=1720022446;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R08tb1yYmAfU91n0VowZ692+xVkx6UEt3wQz/LuzwAE=;
        b=GKdCNVkQfPa2aIF5IYhIhxFWgYERie9iJ5oPcbQxepEuWeCutAHxr/9QP4SLSPFs5v
         Y2vwuMhnDZjDmEZ4cY15A7EgYPv115C2+DWxUADKEeMzrZ2MDBM8wNZHR2rf6IhnbOTs
         EW2o82GzlLyhzbubm8YxYL70Ij2t+36nliXMPCsNt4eBB2/+ubruVSQS29uvAokp4cJC
         v0BeCP6JrYghuUEXIYxoM87Sl98Jh8xm+SfY+qcu+60ucVdjGhKnmQqj2e+S3/s83+Fd
         +Iq02s5KRbGluKHn7aTxmi/XxJndZGYWyrbY8hAo6xg4qASKfppTfPELOYkWgWoQNvVb
         sC9A==
X-Forwarded-Encrypted: i=1; AJvYcCVNKdJ1bRFps3XnHo+9StqbyCGTH5lhzsJiIjHTDWtnHpxR62zxM9Mjvp/pLbJFfVePo/9CL4fFEy37R6MphRwaBG+Q6f1tH6U0YnR/SKxPPRM7v3WxMg74v7wbtcXZdEJ+9acnkmISPGfXlaBcYgr/Qe3sF81NQ9fda5qxSYbBKyLxPVI=
X-Gm-Message-State: AOJu0YzodfWJIbpJDeJKHkEmVuVJ/ZVCHeHpHDRHj+/9YVig3xrkExuH
	SQcU1iHr4RKrCqD+u+JD+U0srhle6RJ7Aj2JtvLkstmamFYxkXWGgo+c6w==
X-Google-Smtp-Source: AGHT+IFOdbtNtXtOGttz1FmQuQ1Ur0JhQ0n4GuSpChcVEJTnFs6Pu5ADzMpovmq9LVaKgEYMKZ7oNA==
X-Received: by 2002:a5d:6c63:0:b0:366:ead8:6019 with SMTP id ffacd0b85a97d-366ead86044mr11036142f8f.49.1719417646242;
        Wed, 26 Jun 2024 09:00:46 -0700 (PDT)
Received: from localhost.localdomain (93-34-90-105.ip49.fastwebnet.it. [93.34.90.105])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-366389b88easm16180589f8f.39.2024.06.26.09.00.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 09:00:45 -0700 (PDT)
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
Subject: [PATCH v8 15/20] leds: leds-lp55xx: Generalize sysfs engine_load and engine_mode
Date: Wed, 26 Jun 2024 18:00:20 +0200
Message-ID: <20240626160027.19703-16-ansuelsmth@gmail.com>
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

Generalize sysfs engine_load and engine_mode since their implementation
is the same acrosso some lp55xx based LED driver.

Suggested-by: Lee Jones <lee@kernel.org>
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/leds/leds-lp5521.c        | 88 +++----------------------------
 drivers/leds/leds-lp5523.c        | 88 +++----------------------------
 drivers/leds/leds-lp55xx-common.c | 83 ++++++++++++++++++++++++++---
 drivers/leds/leds-lp55xx-common.h | 44 ++++++++++------
 4 files changed, 117 insertions(+), 186 deletions(-)

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
index cecff34e6e15..0974488780c0 100644
--- a/drivers/leds/leds-lp55xx-common.c
+++ b/drivers/leds/leds-lp55xx-common.c
@@ -541,8 +541,8 @@ static int lp55xx_request_firmware(struct lp55xx_chip *chip)
 }
 
 static ssize_t select_engine_show(struct device *dev,
-			    struct device_attribute *attr,
-			    char *buf)
+				  struct device_attribute *attr,
+				  char *buf)
 {
 	struct lp55xx_led *led = i2c_get_clientdata(to_i2c_client(dev));
 	struct lp55xx_chip *chip = led->chip;
@@ -551,8 +551,8 @@ static ssize_t select_engine_show(struct device *dev,
 }
 
 static ssize_t select_engine_store(struct device *dev,
-			     struct device_attribute *attr,
-			     const char *buf, size_t len)
+				   struct device_attribute *attr,
+				   const char *buf, size_t len)
 {
 	struct lp55xx_led *led = i2c_get_clientdata(to_i2c_client(dev));
 	struct lp55xx_chip *chip = led->chip;
@@ -593,8 +593,8 @@ static inline void lp55xx_run_engine(struct lp55xx_chip *chip, bool start)
 }
 
 static ssize_t run_engine_store(struct device *dev,
-			     struct device_attribute *attr,
-			     const char *buf, size_t len)
+				struct device_attribute *attr,
+				const char *buf, size_t len)
 {
 	struct lp55xx_led *led = i2c_get_clientdata(to_i2c_client(dev));
 	struct lp55xx_chip *chip = led->chip;
@@ -620,6 +620,77 @@ static ssize_t run_engine_store(struct device *dev,
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
+		return sysfs_emit(buf, "run\n");
+	case LP55XX_ENGINE_LOAD:
+		return sysfs_emit(buf, "load\n");
+	case LP55XX_ENGINE_DISABLED:
+	default:
+		return sysfs_emit(buf, "disabled\n");
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
index 0aba6955a3af..5b3e9473cadc 100644
--- a/drivers/leds/leds-lp55xx-common.h
+++ b/drivers/leds/leds-lp55xx-common.h
@@ -35,21 +35,21 @@ enum lp55xx_engine_mode {
 #define LP55XX_DEV_ATTR_WO(name, store)		\
 	DEVICE_ATTR(name, S_IWUSR, NULL, store)
 
-#define show_mode(nr)							\
+#define LP55XX_DEV_ATTR_ENGINE_MODE(nr)					\
 static ssize_t show_engine##nr##_mode(struct device *dev,		\
-				    struct device_attribute *attr,	\
-				    char *buf)				\
+				      struct device_attribute *attr,	\
+				      char *buf)				\
 {									\
-	return show_engine_mode(dev, attr, buf, nr);			\
-}
-
-#define store_mode(nr)							\
+	return lp55xx_show_engine_mode(dev, attr, buf, nr);		\
+}									\
 static ssize_t store_engine##nr##_mode(struct device *dev,		\
-				     struct device_attribute *attr,	\
-				     const char *buf, size_t len)	\
+				       struct device_attribute *attr,	\
+				       const char *buf, size_t len)	\
 {									\
-	return store_engine_mode(dev, attr, buf, len, nr);		\
-}
+	return lp55xx_store_engine_mode(dev, attr, buf, len, nr);	\
+}									\
+static LP55XX_DEV_ATTR_RW(engine##nr##_mode, show_engine##nr##_mode,	\
+			  store_engine##nr##_mode)
 
 #define show_leds(nr)							\
 static ssize_t show_engine##nr##_leds(struct device *dev,		\
@@ -67,13 +67,14 @@ static ssize_t store_engine##nr##_leds(struct device *dev,	\
 	return store_engine_leds(dev, attr, buf, len, nr);	\
 }
 
-#define store_load(nr)							\
+#define LP55XX_DEV_ATTR_ENGINE_LOAD(nr)					\
 static ssize_t store_engine##nr##_load(struct device *dev,		\
-				     struct device_attribute *attr,	\
-				     const char *buf, size_t len)	\
+				       struct device_attribute *attr,	\
+				       const char *buf, size_t len)	\
 {									\
-	return store_engine_load(dev, attr, buf, len, nr);		\
-}
+	return lp55xx_store_engine_load(dev, attr, buf, len, nr);	\
+}									\
+static LP55XX_DEV_ATTR_WO(engine##nr##_load, store_engine##nr##_load)
 
 struct lp55xx_led;
 struct lp55xx_chip;
@@ -227,4 +228,15 @@ extern void lp55xx_stop_engine(struct lp55xx_chip *chip);
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
2.45.1


