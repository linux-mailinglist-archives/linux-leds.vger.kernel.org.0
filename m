Return-Path: <linux-leds+bounces-1946-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F9BC909A86
	for <lists+linux-leds@lfdr.de>; Sun, 16 Jun 2024 01:16:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 698EF1C20961
	for <lists+linux-leds@lfdr.de>; Sat, 15 Jun 2024 23:16:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 200D813B585;
	Sat, 15 Jun 2024 23:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TNRzLlTd"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFD5B13AA51;
	Sat, 15 Jun 2024 23:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718493189; cv=none; b=uJtlu/ZeoRp0ck/j4Oas8PRPoKVsbZO4X4372xV29XlhrJndqhHSXQk/ywyX+GSZUwDbb1mlGozJc5KjLpActzZEK7sC5EPzuw0Ud4qpQwXLcSNpcosTjwhRM4L1NXOYh8vnUHLTR00zvnSL4UjEOGyvbVWNJ8jYWAqpM9NDEXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718493189; c=relaxed/simple;
	bh=s+Xy1QEPPUf4SIg0wEw2U1aiJooBNiy7cynH6Fvn1gE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kUzCLqtIeQJtQEXs62w3v7duMz2WNiTeWFKoe4K6gXvflzatx0M1G2A6ttse3sozFvDhrcuQNrJNtfsVHdcLi8Wiek1PoqRBADG83wCnOIM6ZQEPmBb/ZxLo7MJ38KZuxvGolo4KwUSXhFSEPXf60xs2pkSdpHQzGRZ9mFt22y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TNRzLlTd; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-42172ed3487so25028705e9.0;
        Sat, 15 Jun 2024 16:13:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718493185; x=1719097985; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HvDbI2xilT38vRdpEN0TMS7XC7ztBOK0klqpk68uRTQ=;
        b=TNRzLlTdJYtQwSA0d24QqiLf5779LEUrzKKeA0Ph5rW7hKgd0qjDkiYCsg5Jxl6Mjz
         mWMqVouSbmh+EWCDX0Z5p2kRqwbnR/K4E96BwotJAZxqqJJCNVqxkzSH+Hu7t8PrSSj3
         9of1YqbsH00PPW6mnG7Bvrfi/xqjaHtzlAl1dUxYT0ps5H3X6Krk9L3vb0xbjLvYuGcX
         lQTcX0vODmb31ffwnsue8rkJmZRtu+BaJGiooolv8hb+RqKE8luDg6rdX8QL9YZQjrOB
         6qdl0MiJ2f0dK7t/FcGir907La0CMKHya56Tbscqk0brXobs5CChtLwQ4/E2xTsCu2SQ
         SZqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718493185; x=1719097985;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HvDbI2xilT38vRdpEN0TMS7XC7ztBOK0klqpk68uRTQ=;
        b=cnp4b4bRw9hM1HFU0k8B71u+A7cTPVsMHKX/OyJAT+3f7s1DriCgohSh5x+SR/wrXB
         bN9bn739s8nw8Uc6L8olnuv/Wsgf1WgCmXOXv9JAVA1wqbTgIB8XZ6qdJBguQpKCAuou
         ZY5vIto0WeMmsIE0CLzavXbhIvBQMYPkQEk6lc+Cb08da239C9mYwJmfsGI+/GXTSqI2
         HFMKggvmszBah6Op/07d553cuW4Po7WmlhOQHyyO8N06fVszVplbNyTolEOuLaGKR5L1
         tl1iRMvV+Kzc9+QuUqVGjWfnadPjyTzK7G0ISxAELhwun7zlYWXI1q/9iTUTc9aoDuKb
         Maiw==
X-Forwarded-Encrypted: i=1; AJvYcCVh87qhga3SI1watWsfu7JNcvEj/ao4qXVBWixdeZryKlM/KR9elIvTR7fSNZJbpq8PNTA1c0h3AzeMjdtcc84oAWRKNl5VhBKkjGs5tBPMlGjrtlc54o63fW2/AFpSC3fy3guVtIttv4VGzfjCdvkAXcnNBa0Vcca3nmoLftlwwSPpwMM=
X-Gm-Message-State: AOJu0YyKMreWOEoboE7bkQImIuz3Ot23ZF4BV20SENm05KiHM6HOle17
	vduoXuM7bYDIsgtiJ97MTLcGQHcKjMqTSeHsjDftdaXUgrLxnav5
X-Google-Smtp-Source: AGHT+IEI+Gkdy87U976pBdRgKuum0fBiZTVEGKvF9xsJ/BW79IB8rjJX5BoMz7nBT73DMNYsxfMnvw==
X-Received: by 2002:a05:600c:3550:b0:421:e3d6:920b with SMTP id 5b1f17b1804b1-42304811e38mr51229905e9.3.1718493185184;
        Sat, 15 Jun 2024 16:13:05 -0700 (PDT)
Received: from localhost.localdomain (93-34-90-105.ip49.fastwebnet.it. [93.34.90.105])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3607509355dsm8145532f8f.13.2024.06.15.16.13.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Jun 2024 16:13:04 -0700 (PDT)
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
Subject: [PATCH v5 16/20] leds: leds-lp55xx: generalize sysfs engine_leds
Date: Sun, 16 Jun 2024 01:11:46 +0200
Message-ID: <20240615231152.28201-17-ansuelsmth@gmail.com>
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

Generalize sysfs engine_leds since their implementation is the same across
some lp55xx based LED driver.

While at it simplify the implementation for show_engine_leds.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/leds/leds-lp5523.c        | 119 +-----------------------------
 drivers/leds/leds-lp55xx-common.c | 108 +++++++++++++++++++++++++++
 drivers/leds/leds-lp55xx-common.h |  15 +++-
 3 files changed, 124 insertions(+), 118 deletions(-)

diff --git a/drivers/leds/leds-lp5523.c b/drivers/leds/leds-lp5523.c
index 19b119a2b256..9d91c2c5a3eb 100644
--- a/drivers/leds/leds-lp5523.c
+++ b/drivers/leds/leds-lp5523.c
@@ -225,119 +225,6 @@ static int lp5523_init_program_engine(struct lp55xx_chip *chip)
 	return ret;
 }
 
-static int lp5523_mux_parse(const char *buf, u16 *mux, size_t len)
-{
-	u16 tmp_mux = 0;
-	int i;
-
-	len = min_t(int, len, LP5523_MAX_LEDS);
-
-	for (i = 0; i < len; i++) {
-		switch (buf[i]) {
-		case '1':
-			tmp_mux |= (1 << i);
-			break;
-		case '0':
-			break;
-		case '\n':
-			i = len;
-			break;
-		default:
-			return -1;
-		}
-	}
-	*mux = tmp_mux;
-
-	return 0;
-}
-
-static void lp5523_mux_to_array(u16 led_mux, char *array)
-{
-	int i, pos = 0;
-
-	for (i = 0; i < LP5523_MAX_LEDS; i++)
-		pos += sprintf(array + pos, "%x", LED_ACTIVE(led_mux, i));
-
-	array[pos] = '\0';
-}
-
-static ssize_t show_engine_leds(struct device *dev,
-			    struct device_attribute *attr,
-			    char *buf, int nr)
-{
-	struct lp55xx_led *led = i2c_get_clientdata(to_i2c_client(dev));
-	struct lp55xx_chip *chip = led->chip;
-	char mux[LP5523_MAX_LEDS + 1];
-
-	lp5523_mux_to_array(chip->engines[nr - 1].led_mux, mux);
-
-	return sprintf(buf, "%s\n", mux);
-}
-show_leds(1)
-show_leds(2)
-show_leds(3)
-
-static int lp5523_load_mux(struct lp55xx_chip *chip, u16 mux, int nr)
-{
-	struct lp55xx_engine *engine = &chip->engines[nr - 1];
-	int ret;
-	static const u8 mux_page[] = {
-		[LP55XX_ENGINE_1] = LP5523_PAGE_MUX1,
-		[LP55XX_ENGINE_2] = LP5523_PAGE_MUX2,
-		[LP55XX_ENGINE_3] = LP5523_PAGE_MUX3,
-	};
-
-	lp55xx_load_engine(chip);
-
-	ret = lp55xx_write(chip, LP5523_REG_PROG_PAGE_SEL, mux_page[nr]);
-	if (ret)
-		return ret;
-
-	ret = lp55xx_write(chip, LP5523_REG_PROG_MEM, (u8)(mux >> 8));
-	if (ret)
-		return ret;
-
-	ret = lp55xx_write(chip, LP5523_REG_PROG_MEM + 1, (u8)(mux));
-	if (ret)
-		return ret;
-
-	engine->led_mux = mux;
-	return 0;
-}
-
-static ssize_t store_engine_leds(struct device *dev,
-			     struct device_attribute *attr,
-			     const char *buf, size_t len, int nr)
-{
-	struct lp55xx_led *led = i2c_get_clientdata(to_i2c_client(dev));
-	struct lp55xx_chip *chip = led->chip;
-	struct lp55xx_engine *engine = &chip->engines[nr - 1];
-	u16 mux = 0;
-	ssize_t ret;
-
-	if (lp5523_mux_parse(buf, &mux, len))
-		return -EINVAL;
-
-	mutex_lock(&chip->lock);
-
-	chip->engine_idx = nr;
-	ret = -EINVAL;
-
-	if (engine->mode != LP55XX_ENGINE_LOAD)
-		goto leave;
-
-	if (lp5523_load_mux(chip, mux, nr))
-		goto leave;
-
-	ret = len;
-leave:
-	mutex_unlock(&chip->lock);
-	return ret;
-}
-store_leds(1)
-store_leds(2)
-store_leds(3)
-
 static ssize_t lp5523_selftest(struct device *dev,
 			       struct device_attribute *attr,
 			       char *buf)
@@ -562,9 +449,9 @@ static ssize_t store_master_fader_leds(struct device *dev,
 LP55XX_DEV_ATTR_ENGINE_MODE(1);
 LP55XX_DEV_ATTR_ENGINE_MODE(2);
 LP55XX_DEV_ATTR_ENGINE_MODE(3);
-static LP55XX_DEV_ATTR_RW(engine1_leds, show_engine1_leds, store_engine1_leds);
-static LP55XX_DEV_ATTR_RW(engine2_leds, show_engine2_leds, store_engine2_leds);
-static LP55XX_DEV_ATTR_RW(engine3_leds, show_engine3_leds, store_engine3_leds);
+LP55XX_DEV_ATTR_ENGINE_LEDS(1);
+LP55XX_DEV_ATTR_ENGINE_LEDS(2);
+LP55XX_DEV_ATTR_ENGINE_LEDS(3);
 LP55XX_DEV_ATTR_ENGINE_LOAD(1);
 LP55XX_DEV_ATTR_ENGINE_LOAD(2);
 LP55XX_DEV_ATTR_ENGINE_LOAD(3);
diff --git a/drivers/leds/leds-lp55xx-common.c b/drivers/leds/leds-lp55xx-common.c
index 1a23352c9850..687693bed868 100644
--- a/drivers/leds/leds-lp55xx-common.c
+++ b/drivers/leds/leds-lp55xx-common.c
@@ -61,6 +61,8 @@
 /* If supported, each ENGINE have an equal amount of pages offset from page 0 */
 #define LP55xx_PAGE_OFFSET(n, pages)	(((n) - 1) * (pages))
 
+#define LED_ACTIVE(mux, led)		(!!(mux & (0x0001 << led)))
+
 /* External clock rate */
 #define LP55XX_CLK_32K			32768
 
@@ -691,6 +693,112 @@ ssize_t lp55xx_store_engine_load(struct device *dev,
 }
 EXPORT_SYMBOL_GPL(lp55xx_store_engine_load);
 
+static int lp55xx_mux_parse(struct lp55xx_chip *chip, const char *buf,
+			    u16 *mux, size_t len)
+{
+	const struct lp55xx_device_config *cfg = chip->cfg;
+	u16 tmp_mux = 0;
+	int i;
+
+	len = min_t(int, len, cfg->max_channel);
+
+	for (i = 0; i < len; i++) {
+		switch (buf[i]) {
+		case '1':
+			tmp_mux |= (1 << i);
+			break;
+		case '0':
+			break;
+		case '\n':
+			i = len;
+			break;
+		default:
+			return -1;
+		}
+	}
+	*mux = tmp_mux;
+
+	return 0;
+}
+
+ssize_t lp55xx_show_engine_leds(struct device *dev,
+				struct device_attribute *attr,
+				char *buf, int nr)
+{
+	struct lp55xx_led *led = i2c_get_clientdata(to_i2c_client(dev));
+	struct lp55xx_chip *chip = led->chip;
+	const struct lp55xx_device_config *cfg = chip->cfg;
+	int i, pos = 0;
+
+	for (i = 0; i < cfg->max_channel; i++)
+		pos += sysfs_emit_at(buf, pos, "%x",
+				     LED_ACTIVE(chip->engines[nr - 1].led_mux,
+				     i));
+
+	pos += sysfs_emit_at(buf, pos, "\n");
+
+	return pos;
+}
+EXPORT_SYMBOL_GPL(lp55xx_show_engine_leds);
+
+static int lp55xx_load_mux(struct lp55xx_chip *chip, u16 mux, int nr)
+{
+	struct lp55xx_engine *engine = &chip->engines[nr - 1];
+	const struct lp55xx_device_config *cfg = chip->cfg;
+	u8 mux_page;
+	int ret;
+
+	lp55xx_load_engine(chip);
+
+	/* Derive the MUX page offset by starting at the end of the ENGINE pages */
+	mux_page = cfg->pages_per_engine * LP55XX_ENGINE_MAX + (nr - 1);
+	ret = lp55xx_write(chip, LP55xx_REG_PROG_PAGE_SEL, mux_page);
+	if (ret)
+		return ret;
+
+	ret = lp55xx_write(chip, cfg->prog_mem_base.addr, (u8)(mux >> 8));
+	if (ret)
+		return ret;
+
+	ret = lp55xx_write(chip, cfg->prog_mem_base.addr + 1, (u8)(mux));
+	if (ret)
+		return ret;
+
+	engine->led_mux = mux;
+	return 0;
+}
+
+ssize_t lp55xx_store_engine_leds(struct device *dev,
+				 struct device_attribute *attr,
+				 const char *buf, size_t len, int nr)
+{
+	struct lp55xx_led *led = i2c_get_clientdata(to_i2c_client(dev));
+	struct lp55xx_chip *chip = led->chip;
+	struct lp55xx_engine *engine = &chip->engines[nr - 1];
+	u16 mux = 0;
+	ssize_t ret;
+
+	if (lp55xx_mux_parse(chip, buf, &mux, len))
+		return -EINVAL;
+
+	mutex_lock(&chip->lock);
+
+	chip->engine_idx = nr;
+	ret = -EINVAL;
+
+	if (engine->mode != LP55XX_ENGINE_LOAD)
+		goto leave;
+
+	if (lp55xx_load_mux(chip, mux, nr))
+		goto leave;
+
+	ret = len;
+leave:
+	mutex_unlock(&chip->lock);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(lp55xx_store_engine_leds);
+
 static struct attribute *lp55xx_engine_attributes[] = {
 	&dev_attr_select_engine.attr,
 	&dev_attr_run_engine.attr,
diff --git a/drivers/leds/leds-lp55xx-common.h b/drivers/leds/leds-lp55xx-common.h
index 00d16a86b750..212bdb216c9a 100644
--- a/drivers/leds/leds-lp55xx-common.h
+++ b/drivers/leds/leds-lp55xx-common.h
@@ -61,7 +61,7 @@ static ssize_t show_engine##nr##_leds(struct device *dev,		\
 			    struct device_attribute *attr,		\
 			    char *buf)					\
 {									\
-	return show_engine_leds(dev, attr, buf, nr);			\
+	return lp55xx_show_engine_leds(dev, attr, buf, nr);		\
 }
 
 #define store_leds(nr)						\
@@ -69,9 +69,14 @@ static ssize_t store_engine##nr##_leds(struct device *dev,	\
 			     struct device_attribute *attr,	\
 			     const char *buf, size_t len)	\
 {								\
-	return store_engine_leds(dev, attr, buf, len, nr);	\
+	return lp55xx_store_engine_leds(dev, attr, buf, len, nr); \
 }
 
+#define LP55XX_DEV_ATTR_ENGINE_LEDS(nr)  \
+	show_leds(nr)			 \
+	store_leds(nr)			 \
+	static LP55XX_DEV_ATTR_RW(engine##nr##_leds, show_engine##nr##_leds, store_engine##nr##_leds)
+
 #define store_load(nr)							\
 static ssize_t store_engine##nr##_load(struct device *dev,		\
 				     struct device_attribute *attr,	\
@@ -246,5 +251,11 @@ extern ssize_t lp55xx_store_engine_mode(struct device *dev,
 extern ssize_t lp55xx_store_engine_load(struct device *dev,
 					struct device_attribute *attr,
 					const char *buf, size_t len, int nr);
+extern ssize_t lp55xx_show_engine_leds(struct device *dev,
+				       struct device_attribute *attr,
+				       char *buf, int nr);
+extern ssize_t lp55xx_store_engine_leds(struct device *dev,
+					struct device_attribute *attr,
+					const char *buf, size_t len, int nr);
 
 #endif /* _LEDS_LP55XX_COMMON_H */
-- 
2.43.0


