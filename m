Return-Path: <linux-leds+bounces-2144-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AB3249186A8
	for <lists+linux-leds@lfdr.de>; Wed, 26 Jun 2024 18:04:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 35D3D1F215AC
	for <lists+linux-leds@lfdr.de>; Wed, 26 Jun 2024 16:04:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 583071922D3;
	Wed, 26 Jun 2024 16:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BpDox2c9"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41B4A191477;
	Wed, 26 Jun 2024 16:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719417652; cv=none; b=RIYbKmF1zE/gyqNMBa2FHzxI1omO5PCpMfFQIea4v1bXcRPw0pJK7DGBkFr/blMBb4ivvrpDN5BArqCgFbLhDeY5AVUELvHADUUruEg9s9HppscsB5Qk9iYADcBDEMvD0TNCvi0ElEmnFJ8KlLRDQaBIlCaGw2uQwJdx4xuMmgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719417652; c=relaxed/simple;
	bh=3bxi4xkVgRCvQWcLRemgpCSBNvRxdHNqfr0Vs3j/pwE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Xq4cxCPflKN5jR28j4sYJFZdNKvkoPr+mr7DICSqOnaaDXaITBwnDtjl9illJ4bFQxyb/z+jugz1l2tzrVQoLlwoyYWSC0lfnj7Xgv0uiT3H0fZJd0GKMKi1HiRWzenLhX6eY10gWAbG0W3zZIK/ufU0YkTjjG1N0y9wZLk5yPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BpDox2c9; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-52cdc4d221eso5415633e87.3;
        Wed, 26 Jun 2024 09:00:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719417648; x=1720022448; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t+4e8cF7k4UIhR54Dq5vhlEbflgX0teWBDZHJEHCUVk=;
        b=BpDox2c9NLNfunsvcBfb3ewytydKG4bsH03mJvANxpY1+KAkTA3FTkxcM/rFzN8DIu
         3lHzrsVB9BGrZ+IrreyXwRY5Y2mUFzMDBhElBLc0g7gQnSaZ2uIztefu/Fvmo7fWC4Z8
         b4a+Y0PqeUddEm4xZ2FT5/WNrfaPlmKgWo5u83/hBCzraPdYtE0l6YQSjAgFIqcuRFbr
         Mcg2wP6mrhd4jE50/dIM/r8t1xDvaXEzZv1JUgrQSzSE0JG8urfyWF6xH5a4m9K5QFfD
         qcGPECJz92jtyPCKp/JSGMpcURy4crbM6w0ilQx5aE8kJAbOyrd8dtuF3RwtQzjt3pf6
         B9PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719417648; x=1720022448;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t+4e8cF7k4UIhR54Dq5vhlEbflgX0teWBDZHJEHCUVk=;
        b=byhle80Aiu0hTRyYp5t9X5HY30WN686H/oZ9DWu59pXhlYueIrX2jlQdVh4ZEw07dd
         OJpN/EaTz9WmlWBs3cFiVj5l121DJsur9viQAlSU9biPpNzIvOMSUUWJypdFZ2Tyxq7E
         5c4a7JDV2WxptBy8vapNykMweu9ERfogY9aT8UIj3Bt15huwOLO0f5NNzK80L7wLlfdO
         VuVHBbMqSOOXGSGcsz6XzOLHOxVvf8sXh5+IV6Lb4BsR0wNDb3x43LZaA0Q0RzKM0Y4N
         zpz28zkr8SztSeOUAEM+ENtTI8Wvyv+zvX+JTFtWOuayymoyOzqZzoDk003NzYhiHsIq
         6gSg==
X-Forwarded-Encrypted: i=1; AJvYcCXPgKIUnLeOF7HCHnXipxns4MOa6yCciQD6a2kLAJ0nUUIR9eSMzXf3V8ox6bxaXoDLO2TZ2ToBSJk3urFe0YrldgctVbQzOV/IVMaaSTM/YCA8LqffoIf1dm7FS+9svVF8RrCOUNV5KqZoZX76rrLwe/Ml4OdHWJwEJhea/ydpGmGLMxY=
X-Gm-Message-State: AOJu0YzEOpaOO/jc+yWT8ZxhItfB/wWTX1WBjx7OslYTt189iKvHSGyb
	GeGDGPFDaSI3btQhbkw3bvWxGtZ8U+FZAfhh8U1VL0/ZS0nN9G/d
X-Google-Smtp-Source: AGHT+IHB2Lb1q37tlItuhWaaWx/mUKWgDidi9jwKsT+v+el28XVvvVU3GNMvWt25Z1Vc3TmA3xxgPQ==
X-Received: by 2002:a05:6512:3b22:b0:52d:259f:d6c with SMTP id 2adb3069b0e04-52d259f1106mr3034152e87.26.1719417648320;
        Wed, 26 Jun 2024 09:00:48 -0700 (PDT)
Received: from localhost.localdomain (93-34-90-105.ip49.fastwebnet.it. [93.34.90.105])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-366389b88easm16180589f8f.39.2024.06.26.09.00.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 09:00:47 -0700 (PDT)
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
Subject: [PATCH v8 17/20] leds: leds-lp55xx: Generalize sysfs master_fader
Date: Wed, 26 Jun 2024 18:00:22 +0200
Message-ID: <20240626160027.19703-18-ansuelsmth@gmail.com>
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

Generalize sysfs master_fader since their implementation is the same across
some lp55xx based LED driver.

Suggested-by: Lee Jones <lee@kernel.org>
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/leds/leds-lp5523.c        | 150 +++---------------------------
 drivers/leds/leds-lp55xx-common.c | 113 ++++++++++++++++++++++
 drivers/leds/leds-lp55xx-common.h |  32 +++++++
 3 files changed, 156 insertions(+), 139 deletions(-)

diff --git a/drivers/leds/leds-lp5523.c b/drivers/leds/leds-lp5523.c
index 9d91c2c5a3eb..1b3ffdc3dfa3 100644
--- a/drivers/leds/leds-lp5523.c
+++ b/drivers/leds/leds-lp5523.c
@@ -315,137 +315,6 @@ static ssize_t lp5523_selftest(struct device *dev,
 	return pos;
 }
 
-#define show_fader(nr)						\
-static ssize_t show_master_fader##nr(struct device *dev,	\
-			    struct device_attribute *attr,	\
-			    char *buf)				\
-{								\
-	return show_master_fader(dev, attr, buf, nr);		\
-}
-
-#define store_fader(nr)						\
-static ssize_t store_master_fader##nr(struct device *dev,	\
-			     struct device_attribute *attr,	\
-			     const char *buf, size_t len)	\
-{								\
-	return store_master_fader(dev, attr, buf, len, nr);	\
-}
-
-static ssize_t show_master_fader(struct device *dev,
-				 struct device_attribute *attr,
-				 char *buf, int nr)
-{
-	struct lp55xx_led *led = i2c_get_clientdata(to_i2c_client(dev));
-	struct lp55xx_chip *chip = led->chip;
-	int ret;
-	u8 val;
-
-	mutex_lock(&chip->lock);
-	ret = lp55xx_read(chip, LP5523_REG_MASTER_FADER_BASE + nr - 1, &val);
-	mutex_unlock(&chip->lock);
-
-	if (ret == 0)
-		ret = sprintf(buf, "%u\n", val);
-
-	return ret;
-}
-show_fader(1)
-show_fader(2)
-show_fader(3)
-
-static ssize_t store_master_fader(struct device *dev,
-				  struct device_attribute *attr,
-				  const char *buf, size_t len, int nr)
-{
-	struct lp55xx_led *led = i2c_get_clientdata(to_i2c_client(dev));
-	struct lp55xx_chip *chip = led->chip;
-	int ret;
-	unsigned long val;
-
-	if (kstrtoul(buf, 0, &val))
-		return -EINVAL;
-
-	if (val > 0xff)
-		return -EINVAL;
-
-	mutex_lock(&chip->lock);
-	ret = lp55xx_write(chip, LP5523_REG_MASTER_FADER_BASE + nr - 1,
-			   (u8)val);
-	mutex_unlock(&chip->lock);
-
-	if (ret == 0)
-		ret = len;
-
-	return ret;
-}
-store_fader(1)
-store_fader(2)
-store_fader(3)
-
-static ssize_t show_master_fader_leds(struct device *dev,
-				      struct device_attribute *attr,
-				      char *buf)
-{
-	struct lp55xx_led *led = i2c_get_clientdata(to_i2c_client(dev));
-	struct lp55xx_chip *chip = led->chip;
-	int i, ret, pos = 0;
-	u8 val;
-
-	mutex_lock(&chip->lock);
-
-	for (i = 0; i < LP5523_MAX_LEDS; i++) {
-		ret = lp55xx_read(chip, LP5523_REG_LED_CTRL_BASE + i, &val);
-		if (ret)
-			goto leave;
-
-		val = (val & LP5523_FADER_MAPPING_MASK)
-			>> LP5523_FADER_MAPPING_SHIFT;
-		if (val > 3) {
-			ret = -EINVAL;
-			goto leave;
-		}
-		buf[pos++] = val + '0';
-	}
-	buf[pos++] = '\n';
-	ret = pos;
-leave:
-	mutex_unlock(&chip->lock);
-	return ret;
-}
-
-static ssize_t store_master_fader_leds(struct device *dev,
-				       struct device_attribute *attr,
-				       const char *buf, size_t len)
-{
-	struct lp55xx_led *led = i2c_get_clientdata(to_i2c_client(dev));
-	struct lp55xx_chip *chip = led->chip;
-	int i, n, ret;
-	u8 val;
-
-	n = min_t(int, len, LP5523_MAX_LEDS);
-
-	mutex_lock(&chip->lock);
-
-	for (i = 0; i < n; i++) {
-		if (buf[i] >= '0' && buf[i] <= '3') {
-			val = (buf[i] - '0') << LP5523_FADER_MAPPING_SHIFT;
-			ret = lp55xx_update_bits(chip,
-						 LP5523_REG_LED_CTRL_BASE + i,
-						 LP5523_FADER_MAPPING_MASK,
-						 val);
-			if (ret)
-				goto leave;
-		} else {
-			ret = -EINVAL;
-			goto leave;
-		}
-	}
-	ret = len;
-leave:
-	mutex_unlock(&chip->lock);
-	return ret;
-}
-
 LP55XX_DEV_ATTR_ENGINE_MODE(1);
 LP55XX_DEV_ATTR_ENGINE_MODE(2);
 LP55XX_DEV_ATTR_ENGINE_MODE(3);
@@ -456,14 +325,11 @@ LP55XX_DEV_ATTR_ENGINE_LOAD(1);
 LP55XX_DEV_ATTR_ENGINE_LOAD(2);
 LP55XX_DEV_ATTR_ENGINE_LOAD(3);
 static LP55XX_DEV_ATTR_RO(selftest, lp5523_selftest);
-static LP55XX_DEV_ATTR_RW(master_fader1, show_master_fader1,
-			  store_master_fader1);
-static LP55XX_DEV_ATTR_RW(master_fader2, show_master_fader2,
-			  store_master_fader2);
-static LP55XX_DEV_ATTR_RW(master_fader3, show_master_fader3,
-			  store_master_fader3);
-static LP55XX_DEV_ATTR_RW(master_fader_leds, show_master_fader_leds,
-			  store_master_fader_leds);
+LP55XX_DEV_ATTR_MASTER_FADER(1);
+LP55XX_DEV_ATTR_MASTER_FADER(2);
+LP55XX_DEV_ATTR_MASTER_FADER(3);
+static LP55XX_DEV_ATTR_RW(master_fader_leds, lp55xx_show_master_fader_leds,
+			  lp55xx_store_master_fader_leds);
 
 static struct attribute *lp5523_attributes[] = {
 	&dev_attr_engine1_mode.attr,
@@ -516,6 +382,12 @@ static struct lp55xx_device_config lp5523_cfg = {
 	.reg_led_current_base = {
 		.addr = LP5523_REG_LED_CURRENT_BASE,
 	},
+	.reg_master_fader_base = {
+		.addr = LP5523_REG_MASTER_FADER_BASE,
+	},
+	.reg_led_ctrl_base = {
+		.addr = LP5523_REG_LED_CTRL_BASE,
+	},
 	.pages_per_engine   = LP5523_PAGES_PER_ENGINE,
 	.max_channel  = LP5523_MAX_LEDS,
 	.post_init_device   = lp5523_post_init_device,
diff --git a/drivers/leds/leds-lp55xx-common.c b/drivers/leds/leds-lp55xx-common.c
index f0b673c61396..dd7630aaa438 100644
--- a/drivers/leds/leds-lp55xx-common.c
+++ b/drivers/leds/leds-lp55xx-common.c
@@ -64,6 +64,9 @@
 
 #define LED_ACTIVE(mux, led)		(!!((mux) & (0x0001 << (led))))
 
+/* MASTER FADER common property */
+#define LP55xx_FADER_MAPPING_MASK	GENMASK(7, 6)
+
 /* External clock rate */
 #define LP55XX_CLK_32K			32768
 
@@ -800,6 +803,116 @@ ssize_t lp55xx_store_engine_leds(struct device *dev,
 }
 EXPORT_SYMBOL_GPL(lp55xx_store_engine_leds);
 
+ssize_t lp55xx_show_master_fader(struct device *dev,
+				 struct device_attribute *attr,
+				 char *buf, int nr)
+{
+	struct lp55xx_led *led = i2c_get_clientdata(to_i2c_client(dev));
+	struct lp55xx_chip *chip = led->chip;
+	const struct lp55xx_device_config *cfg = chip->cfg;
+	int ret;
+	u8 val;
+
+	mutex_lock(&chip->lock);
+	ret = lp55xx_read(chip, cfg->reg_master_fader_base.addr + nr - 1, &val);
+	mutex_unlock(&chip->lock);
+
+	return ret ? ret : sysfs_emit(buf, "%u\n", val);
+}
+EXPORT_SYMBOL_GPL(lp55xx_show_master_fader);
+
+ssize_t lp55xx_store_master_fader(struct device *dev,
+				  struct device_attribute *attr,
+				  const char *buf, size_t len, int nr)
+{
+	struct lp55xx_led *led = i2c_get_clientdata(to_i2c_client(dev));
+	struct lp55xx_chip *chip = led->chip;
+	const struct lp55xx_device_config *cfg = chip->cfg;
+	int ret;
+	unsigned long val;
+
+	if (kstrtoul(buf, 0, &val))
+		return -EINVAL;
+
+	if (val > 0xff)
+		return -EINVAL;
+
+	mutex_lock(&chip->lock);
+	ret = lp55xx_write(chip, cfg->reg_master_fader_base.addr + nr - 1,
+			   (u8)val);
+	mutex_unlock(&chip->lock);
+
+	return ret ? ret : len;
+}
+EXPORT_SYMBOL_GPL(lp55xx_store_master_fader);
+
+ssize_t lp55xx_show_master_fader_leds(struct device *dev,
+				      struct device_attribute *attr,
+				      char *buf)
+{
+	struct lp55xx_led *led = i2c_get_clientdata(to_i2c_client(dev));
+	struct lp55xx_chip *chip = led->chip;
+	const struct lp55xx_device_config *cfg = chip->cfg;
+	int i, ret, pos = 0;
+	u8 val;
+
+	mutex_lock(&chip->lock);
+
+	for (i = 0; i < cfg->max_channel; i++) {
+		ret = lp55xx_read(chip, cfg->reg_led_ctrl_base.addr + i, &val);
+		if (ret)
+			goto leave;
+
+		val = FIELD_GET(LP55xx_FADER_MAPPING_MASK, val);
+		if (val > FIELD_MAX(LP55xx_FADER_MAPPING_MASK)) {
+			ret = -EINVAL;
+			goto leave;
+		}
+		buf[pos++] = val + '0';
+	}
+	buf[pos++] = '\n';
+	ret = pos;
+leave:
+	mutex_unlock(&chip->lock);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(lp55xx_show_master_fader_leds);
+
+ssize_t lp55xx_store_master_fader_leds(struct device *dev,
+				       struct device_attribute *attr,
+				       const char *buf, size_t len)
+{
+	struct lp55xx_led *led = i2c_get_clientdata(to_i2c_client(dev));
+	struct lp55xx_chip *chip = led->chip;
+	const struct lp55xx_device_config *cfg = chip->cfg;
+	int i, n, ret;
+	u8 val;
+
+	n = min_t(int, len, cfg->max_channel);
+
+	mutex_lock(&chip->lock);
+
+	for (i = 0; i < n; i++) {
+		if (buf[i] >= '0' && buf[i] <= '3') {
+			val = (buf[i] - '0') << __bf_shf(LP55xx_FADER_MAPPING_MASK);
+			ret = lp55xx_update_bits(chip,
+						 cfg->reg_led_ctrl_base.addr + i,
+						 LP55xx_FADER_MAPPING_MASK,
+						 val);
+			if (ret)
+				goto leave;
+		} else {
+			ret = -EINVAL;
+			goto leave;
+		}
+	}
+	ret = len;
+leave:
+	mutex_unlock(&chip->lock);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(lp55xx_store_master_fader_leds);
+
 static struct attribute *lp55xx_engine_attributes[] = {
 	&dev_attr_select_engine.attr,
 	&dev_attr_run_engine.attr,
diff --git a/drivers/leds/leds-lp55xx-common.h b/drivers/leds/leds-lp55xx-common.h
index 5f2394a6de15..6dcffa0db647 100644
--- a/drivers/leds/leds-lp55xx-common.h
+++ b/drivers/leds/leds-lp55xx-common.h
@@ -76,6 +76,22 @@ static ssize_t store_engine##nr##_load(struct device *dev,		\
 }									\
 static LP55XX_DEV_ATTR_WO(engine##nr##_load, store_engine##nr##_load)
 
+#define LP55XX_DEV_ATTR_MASTER_FADER(nr)				\
+static ssize_t show_master_fader##nr(struct device *dev,		\
+				     struct device_attribute *attr,	\
+				     char *buf)				\
+{									\
+	return lp55xx_show_master_fader(dev, attr, buf, nr);		\
+}									\
+static ssize_t store_master_fader##nr(struct device *dev,		\
+				      struct device_attribute *attr,	\
+				      const char *buf, size_t len)	\
+{									\
+	return lp55xx_store_master_fader(dev, attr, buf, len, nr);	\
+}									\
+static LP55XX_DEV_ATTR_RW(master_fader##nr, show_master_fader##nr,	\
+			  store_master_fader##nr)
+
 struct lp55xx_led;
 struct lp55xx_chip;
 
@@ -103,6 +119,8 @@ struct lp55xx_reg {
  * @prog_mem_base      : Chip specific base reg address for chip SMEM programming
  * @reg_led_pwm_base   : Chip specific base reg address for LED PWM conf
  * @reg_led_current_base : Chip specific base reg address for LED current conf
+ * @reg_master_fader_base : Chip specific base reg address for master fader base
+ * @reg_led_ctrl_base  : Chip specific base reg address for LED ctrl base
  * @pages_per_engine   : Assigned pages for each engine
  *                       (if not set chip doesn't support pages)
  * @max_channel        : Maximum number of channels
@@ -123,6 +141,8 @@ struct lp55xx_device_config {
 	const struct lp55xx_reg prog_mem_base;
 	const struct lp55xx_reg reg_led_pwm_base;
 	const struct lp55xx_reg reg_led_current_base;
+	const struct lp55xx_reg reg_master_fader_base;
+	const struct lp55xx_reg reg_led_ctrl_base;
 	const int pages_per_engine;
 	const int max_channel;
 
@@ -244,5 +264,17 @@ extern ssize_t lp55xx_show_engine_leds(struct device *dev,
 extern ssize_t lp55xx_store_engine_leds(struct device *dev,
 					struct device_attribute *attr,
 					const char *buf, size_t len, int nr);
+extern ssize_t lp55xx_show_master_fader(struct device *dev,
+					struct device_attribute *attr,
+					char *buf, int nr);
+extern ssize_t lp55xx_store_master_fader(struct device *dev,
+					 struct device_attribute *attr,
+					 const char *buf, size_t len, int nr);
+extern ssize_t lp55xx_show_master_fader_leds(struct device *dev,
+					     struct device_attribute *attr,
+					     char *buf);
+extern ssize_t lp55xx_store_master_fader_leds(struct device *dev,
+					      struct device_attribute *attr,
+					      const char *buf, size_t len);
 
 #endif /* _LEDS_LP55XX_COMMON_H */
-- 
2.45.1


