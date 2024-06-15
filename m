Return-Path: <linux-leds+bounces-1947-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C03F0909A8A
	for <lists+linux-leds@lfdr.de>; Sun, 16 Jun 2024 01:16:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 468181F21B26
	for <lists+linux-leds@lfdr.de>; Sat, 15 Jun 2024 23:16:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BF9013B7AF;
	Sat, 15 Jun 2024 23:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="erWPdYBY"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F12C213AD2B;
	Sat, 15 Jun 2024 23:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718493190; cv=none; b=C/7psD+2SnI2BZrs6bt5gLN5TrYTDZeJ59YDD64TMEHxFydPcT4vx+hxDYVI9WiHNfDbGe3wMrHyPuifdXpBKQnLzv3fK+gi+QwUs9T4Ca3d4PevOGZj+jKbWTbCsycqrUD8JIbNE/tRymlVMpUXssg7mE7ySboiDvYb3kxme0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718493190; c=relaxed/simple;
	bh=rLp5PUoWlLYXy9ow7R+J0uBhguk6lzJWLm+9dQJ/NIA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AL/TiQwGpP7nrkOSLbp/VvQsO+Hs1grekNrZC2bk/ad4Ogv6hQTYPm2TpDaW77xpFez5zjOIOUQQ5TxfBMY3WV6fsxvlBP9A2zj/mBRx8IhhX3oVTOIUflMQXJ9RRANsyUbqFqXFgpyKBWPBnl42OvnIEBCjzqRXHLh2kn013jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=erWPdYBY; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-35f2d723ef0so2865115f8f.1;
        Sat, 15 Jun 2024 16:13:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718493186; x=1719097986; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qe05OY5XgNl7IgZQMzl3g7W3eb3ZqytHjml6Zdphh7I=;
        b=erWPdYBYVTl8vhz/2eCqMmingVrRipSVqj+MG6+Zop6laQZm2WSl4/lsWIsocU+Sy+
         ANdCe9cD3ZJfsYxbcaY3eTIDUPyXh/e4s5nw9YCk0l7wNhFy0cuuACSo4ue4qE4mK2Jo
         K0vDApRBlobXsDyscBdJZxWixx3EqUD9vDrpfFbFDDpl6zU7wExIkxI/7/82VbWnayKX
         JpZwar3qYgVoVGDyzwycROxGgDiNkFarP7nEbXlzk57hpIrlPwxa08S0cwujuj7Mpajx
         3OGuZkwPh17o0cykXqVOgUY25q5HkekUIJjop32D+WbaIHSUAOcSJtiAoiafqjsYdotV
         yQ8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718493186; x=1719097986;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qe05OY5XgNl7IgZQMzl3g7W3eb3ZqytHjml6Zdphh7I=;
        b=T5ymiFZKcP+rCh+x67uKOIfj/t9aXnYHfetezL/R1Fpy4X648ImQHL8FG3FmgIrpMB
         RKwx0Xrba/1rDwwyojdKe1z6u391zGlpcShOQDZxmdbwjUa/B76jKGmKeGhUNGmHqbJd
         Plt/RYRJf9eX1NOSDSqa+I9/yPERmfZGV3MNT8tQby8SLutMIbpVLjzt3uH0Bdxq7hwm
         tCa+hI98DHj0wUfup6lhFcZq5oWonobVBgrQ/1j6j4E+nXTKUr4Ivw/upbmx3hAYl4ev
         q5L4tMdZsXJp3aUkpPnfV7QflbVMwRW4wozXa0aDGuwcXUL21J3i4Bpogqx07bxkRtQ1
         7LSw==
X-Forwarded-Encrypted: i=1; AJvYcCVrd9y/T7spGYKFtE7KKwGf+G/PPIemlkotltXdMeagAlBjU+JC4mqH3WzVlWW8vnrxO1bNMgazUaPOozY/Kvx1cKIDAGZCSuoMEdeKwYyFhc2edMiHqX1/4Y3Xt635LH+8cKiOOLr5ayU0XB5wloM+Y5SZjkagDvKztxpLCGEOM/K831Y=
X-Gm-Message-State: AOJu0YwtqB++/zsfvxugO9GxkaSfAEzSFT1woezCNTkz81kSYaMxG3fr
	qYTpN92AW9mOfh7gsKJpEZs/UJLR8JXr0/bJ23PGdYB39064jLsW
X-Google-Smtp-Source: AGHT+IHm64I/T3lr/JtVXnnZuxi+3VMj/vc9rYWyeT9SeyeSzuP5ktBTfWWM5B1bTsOsrgh6zEnVzg==
X-Received: by 2002:adf:e88b:0:b0:360:8f85:a5f1 with SMTP id ffacd0b85a97d-3608f85a70amr1330174f8f.5.1718493186165;
        Sat, 15 Jun 2024 16:13:06 -0700 (PDT)
Received: from localhost.localdomain (93-34-90-105.ip49.fastwebnet.it. [93.34.90.105])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3607509355dsm8145532f8f.13.2024.06.15.16.13.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Jun 2024 16:13:05 -0700 (PDT)
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
Subject: [PATCH v5 17/20] leds: leds-lp55xx: generalize sysfs master_fader
Date: Sun, 16 Jun 2024 01:11:47 +0200
Message-ID: <20240615231152.28201-18-ansuelsmth@gmail.com>
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

Generalize sysfs master_fader since their implementation is the same across
some lp55xx based LED driver.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/leds/leds-lp5523.c        | 144 ++----------------------------
 drivers/leds/leds-lp55xx-common.c | 119 ++++++++++++++++++++++++
 drivers/leds/leds-lp55xx-common.h |  37 ++++++++
 3 files changed, 161 insertions(+), 139 deletions(-)

diff --git a/drivers/leds/leds-lp5523.c b/drivers/leds/leds-lp5523.c
index 9d91c2c5a3eb..6f25a6c32869 100644
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
diff --git a/drivers/leds/leds-lp55xx-common.c b/drivers/leds/leds-lp55xx-common.c
index 687693bed868..ac02ab938dd8 100644
--- a/drivers/leds/leds-lp55xx-common.c
+++ b/drivers/leds/leds-lp55xx-common.c
@@ -63,6 +63,9 @@
 
 #define LED_ACTIVE(mux, led)		(!!(mux & (0x0001 << led)))
 
+/* MASTER FADER common property */
+#define LP55xx_FADER_MAPPING_MASK	GENMASK(7, 6)
+
 /* External clock rate */
 #define LP55XX_CLK_32K			32768
 
@@ -799,6 +802,122 @@ ssize_t lp55xx_store_engine_leds(struct device *dev,
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
+	if (ret == 0)
+		ret = sprintf(buf, "%u\n", val);
+
+	return ret;
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
+	if (ret == 0)
+		ret = len;
+
+	return ret;
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
index 212bdb216c9a..063d7392b6a2 100644
--- a/drivers/leds/leds-lp55xx-common.h
+++ b/drivers/leds/leds-lp55xx-common.h
@@ -89,6 +89,27 @@ static ssize_t store_engine##nr##_load(struct device *dev,		\
 	store_load(nr)			 \
 	static LP55XX_DEV_ATTR_WO(engine##nr##_load, store_engine##nr##_load)
 
+#define show_fader(nr)						\
+static ssize_t show_master_fader##nr(struct device *dev,	\
+			    struct device_attribute *attr,	\
+			    char *buf)				\
+{								\
+	return lp55xx_show_master_fader(dev, attr, buf, nr);	\
+}
+
+#define store_fader(nr)						\
+static ssize_t store_master_fader##nr(struct device *dev,	\
+			     struct device_attribute *attr,	\
+			     const char *buf, size_t len)	\
+{								\
+	return lp55xx_store_master_fader(dev, attr, buf, len, nr); \
+}
+
+#define LP55XX_DEV_ATTR_MASTER_FADER(nr)  \
+	show_fader(nr)			  \
+	store_fader(nr)			  \
+	static LP55XX_DEV_ATTR_RW(master_fader##nr, show_master_fader##nr, store_master_fader##nr)
+
 struct lp55xx_led;
 struct lp55xx_chip;
 
@@ -116,6 +137,8 @@ struct lp55xx_reg {
  * @prog_mem_base      : Chip specific base reg address for chip SMEM programming
  * @reg_led_pwm_base   : Chip specific base reg address for LED PWM conf
  * @reg_led_current_base : Chip specific base reg address for LED current conf
+ * @reg_master_fader_base : Chip specific base reg address for master fader base
+ * @reg_led_ctrl_base  : Chip specific base reg address for LED ctrl base
  * @pages_per_engine   : Assigned pages for each engine
  *                       (if not set chip doesn't support pages)
  * @max_channel        : Maximum number of channels
@@ -136,6 +159,8 @@ struct lp55xx_device_config {
 	const struct lp55xx_reg prog_mem_base;
 	const struct lp55xx_reg reg_led_pwm_base;
 	const struct lp55xx_reg reg_led_current_base;
+	const struct lp55xx_reg reg_master_fader_base;
+	const struct lp55xx_reg reg_led_ctrl_base;
 	const int pages_per_engine;
 	const int max_channel;
 
@@ -257,5 +282,17 @@ extern ssize_t lp55xx_show_engine_leds(struct device *dev,
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
2.43.0


