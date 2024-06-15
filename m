Return-Path: <linux-leds+bounces-1945-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 70D98909A83
	for <lists+linux-leds@lfdr.de>; Sun, 16 Jun 2024 01:16:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 566361C20325
	for <lists+linux-leds@lfdr.de>; Sat, 15 Jun 2024 23:16:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78C0713B292;
	Sat, 15 Jun 2024 23:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KOCVOua7"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C824213A86C;
	Sat, 15 Jun 2024 23:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718493188; cv=none; b=pKLlzYB2gUvzpCfy/4rE0Cr4cRMr/Ji9ishqS1IM3uxKKuVJRnh+m939yWcYkOlppWFJ2VLSkT19KIyK9uSvMH8FIwt2K6nwR7wbX2DDI9zGaxrdJlvJsA3Xg0/jkZXKsk8DPCYTBkuEeg0lJ+PQCkKKjbDtTPWY6UrNDxAtRbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718493188; c=relaxed/simple;
	bh=eDCzwNIT591azxhv6PXsf1s5SvTRycO5Fm/oFIO5rU4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FEDtlHpFqo0V9wPR+hufNZ9H+2T+/RfntaYn+ZgkPjYE1dHUyR6ndxIhdJ5gOKm9myMC2yeky7Et0N/BtREa+/Dn74HufrbVL/d8l78dvJwjN/2+Totib4xanB4OLtqM0bCG14FnX3LG5DHjQcdtCCDV0ndcWMLcl5C+MtLJxCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KOCVOua7; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3608e6d14b6so414578f8f.0;
        Sat, 15 Jun 2024 16:13:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718493184; x=1719097984; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rg5TqlrNR+nh/4AugtVKGL98AXuwEC87Lj9NvCDOYXs=;
        b=KOCVOua7CrJxuUZpNxbWxeKPRjOvTNXMKH5kEM1oo/6LKKYuYdvaF2Zi/uGtnT5F0U
         EyAG41ZIxIcW8jQ7C8CqpupUR1/KCyITOz5I0LHTl+76+4ApJBGrgrvkf/8/A803Px1f
         fUJorfe7ge7CKj4OK5iZznvTbKOToGi3upenQzwNeDSHnkavbv5YZZCaGyO/qgs4lXw/
         zbiepyvpigA+mYtnCmENt4Pksaz4KIPJZZ7mYyJlJ5xqReU05WELFK8eNDilR/wW+MPV
         6Vz0kb30840KWF47BIPaILiOsVNSX2uaEVl++n6HPVPag4rhP/LlB4KImc34hdqZvFq4
         xAVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718493184; x=1719097984;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rg5TqlrNR+nh/4AugtVKGL98AXuwEC87Lj9NvCDOYXs=;
        b=pFm3j4TRwmZkcYibHxYhbQbWpHtX9f1Um5tK7biK1I3FulE/y+gnlbnEudRHlBn452
         dTlUlJZNRv7gVMS5KXV2A2enQFHuVE31O27Mf7ki4quHYsq7PHLwyvs0PtT+68TLYt0A
         MI6fBAmIPLbHWmYLjjGIHP08idMyzYjeifZZhoYVUObyxf3miq/ROUI8wNtO0k9RtKfW
         CIkf7ZpwX0NkJJzpi8V0bvrm5O0vLH0KvKxC+U1P1NM5WZldz9NYsdWh/nDmq7kEKUSK
         flQPC0mBx0bvlNH2eYcHrMI+fu8mUzMickgu97kG6Mvm3EnWByt8QIljUCDcBgiwtWlZ
         8SoQ==
X-Forwarded-Encrypted: i=1; AJvYcCVPTnkXWvJhnR8X/5FDHxlxyCakrndc5TIRrqKc//+aNab1YVfOAq/MQaiRxjphQejI0S9ZEXPNFV0ndimg14MSjSYH6xjI3ZbBR24dsMVE+iNnEhW62ubJEQl8BY8TkCWDodM+3MiENE6PNCUjcOZNBzxeVIrGvWsyx+3C71sDN49b8pI=
X-Gm-Message-State: AOJu0YyC+2oBnBcTizJtrao6LPOtYW9ExoUnc8VmsigfvyUgeaF/nCmb
	Pwv99dAzYqaakMJaRKLFzFl0j7/xbEKFDpNKPP9kMcVSzQY/B4wk
X-Google-Smtp-Source: AGHT+IELWRWUvbB66aD9Fsh2nj6tetnWGSH7UB29glV/DBq4kpDnwTHRB8KizmjUwy2/k6xYTGjyUw==
X-Received: by 2002:a05:6000:2aa:b0:360:73f4:9f19 with SMTP id ffacd0b85a97d-3607a77f9efmr5500063f8f.50.1718493184134;
        Sat, 15 Jun 2024 16:13:04 -0700 (PDT)
Received: from localhost.localdomain (93-34-90-105.ip49.fastwebnet.it. [93.34.90.105])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3607509355dsm8145532f8f.13.2024.06.15.16.13.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Jun 2024 16:13:03 -0700 (PDT)
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
Subject: [PATCH v5 15/20] leds: leds-lp55xx: generalize sysfs engine_load and engine_mode
Date: Sun, 16 Jun 2024 01:11:45 +0200
Message-ID: <20240615231152.28201-16-ansuelsmth@gmail.com>
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
index 46b1eb1ce775..1a23352c9850 100644
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


