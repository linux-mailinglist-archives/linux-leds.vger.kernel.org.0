Return-Path: <linux-leds+bounces-2143-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E2B3C9186C8
	for <lists+linux-leds@lfdr.de>; Wed, 26 Jun 2024 18:07:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 43555B27DE8
	for <lists+linux-leds@lfdr.de>; Wed, 26 Jun 2024 16:04:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13F2D191491;
	Wed, 26 Jun 2024 16:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VvkGd8qJ"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1A1E190683;
	Wed, 26 Jun 2024 16:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719417651; cv=none; b=WVvAjogEo4qWDMTuknTwvnF+Gkn121y2jzzkUa7IWqJIjHfsKyOuYyVWmAiZnqxk4PtAF+ok7RnFCGCS9FtS8vbPZ0G1UF0Hx8Q4ve7wrOkQ6BMEngImCjotVaN+/RR9bjMSvBEw/r58QN64bPYC+MCKHcRbxILzTwDHYeRxBhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719417651; c=relaxed/simple;
	bh=oQTkijkig+TTMGeA52/UiQnffzMmX+MMJCK7FJjxfjw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FQM582fKsPR/DUa36eMU586KPelU/QzEJU91NyMZm1nU3K/LBGTcsGk8wo/A78uGUNTMG/tZdfY2cuZWl0gk01J+x5/EKdPbyRf6lWUtLqjpOICj+93QtYP88fJuktMlAfeGqFcA0meeXzDDm68jtLN61AhGL4hsodCnpeAjYZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VvkGd8qJ; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-36701e6c6e8so1006717f8f.1;
        Wed, 26 Jun 2024 09:00:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719417647; x=1720022447; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zkzn+tBnOJfYBqIIubPBDn9JQ0osj8n0lCkRhH87/uc=;
        b=VvkGd8qJJt8kHl4o43dfmXpXIG6aAzVQCwoLxSgP5yBGtDMhn8dJokKA/xHC9war0M
         mYMGCpImu8yQ9g/Ud++iDpdQpT8RNibK7n9zpiX5y9H/wRaChe8wERYAZOYT2tu9gUiZ
         1GTX7hiQWdgKGY0Dg5bIrBVPZ04z4oyaJBzU0ZL3kW49lewmoa0E7cKGAuNdkj+/yzGb
         C/CR1sDdPb7u189LrvwNzgDEUDA5CyrJAmPbtGFa6vTBpRP3KNN6aNI89mJffLTtR1Yv
         IjyhfpHNAUPNdXQObWVV1HAV2rEkuvktql6L1/0Jd7zy0hdUsrYDWdXuyy29ANily9+k
         Nn3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719417647; x=1720022447;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zkzn+tBnOJfYBqIIubPBDn9JQ0osj8n0lCkRhH87/uc=;
        b=HwOFqVB14cvMvulkXt0HoDTjHTMqUfEjC2EJbz7TLWBJM/oBcBJ3VJOy6J8WcvQB7e
         zqKQBpl0qWM9EBIsm49YhseGJq2n64LFnsTAn4cyAY67A2tijmKVvK25NaBiqgmuJjEd
         6gXdMAzHdI9PyXF4WywtDwnakvsCE5B7gArAQ0xNKVi3ia4UQEgCvS4cIY6juDnWMoRS
         rv5WrYjwe9JgfCNBlZvIWiGFGtPXcTlE+etXgvxzwiQmYWc0l+S9gCNxNxClR72McShz
         Rr/n1Qlp82lT9jEzX9yTT7zdHhRxVrBKKhAf3p+KFfvHU2L1TjHV8VafWBY0jv0oeJZW
         fkJg==
X-Forwarded-Encrypted: i=1; AJvYcCUzUlNsbG49BMnPyKwSSopO/DaCFH/V/tFDckmIq/yLKcPI9LbBG25GTrgPe+2RkL69LYbs9URQ9GcJ0NEWdErO5sYzSxapQTptGa1QAXjBW31AIglTditkWl5XWjnN2GTQtHh2vxjAqmmENSBtogIGAZgK4if5AwqfAT/m7TL+Ev4Kw5w=
X-Gm-Message-State: AOJu0Yzqq9W9l78SbKJYbh5jhXz0NYC7cfawdkh+c+KUKG8GqCyeU7lW
	if6q0rcqUbh8M64WvXf9OQO8v0w/koXW1vFB7w1Xx3EafmJ23nWLUBh3MQ==
X-Google-Smtp-Source: AGHT+IHyesbRNTJSuHLztlFJ/YlLDnlB6dTgmTgG0truI8+3btcMHfZpS/uGwzxLys2b/gpT+V4tjQ==
X-Received: by 2002:a05:6000:154d:b0:366:e7b5:3b49 with SMTP id ffacd0b85a97d-366e7b540a8mr10707665f8f.54.1719417647201;
        Wed, 26 Jun 2024 09:00:47 -0700 (PDT)
Received: from localhost.localdomain (93-34-90-105.ip49.fastwebnet.it. [93.34.90.105])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-366389b88easm16180589f8f.39.2024.06.26.09.00.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 09:00:46 -0700 (PDT)
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
Subject: [PATCH v8 16/20] leds: leds-lp55xx: Generalize sysfs engine_leds
Date: Wed, 26 Jun 2024 18:00:21 +0200
Message-ID: <20240626160027.19703-17-ansuelsmth@gmail.com>
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

Generalize sysfs engine_leds since their implementation is the same across
some lp55xx based LED driver.

While at it simplify the implementation for show_engine_leds.

Suggested-by: Lee Jones <lee@kernel.org>
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/leds/leds-lp5523.c        | 119 +-----------------------------
 drivers/leds/leds-lp55xx-common.c | 109 +++++++++++++++++++++++++++
 drivers/leds/leds-lp55xx-common.h |  32 ++++----
 3 files changed, 131 insertions(+), 129 deletions(-)

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
index 0974488780c0..f0b673c61396 100644
--- a/drivers/leds/leds-lp55xx-common.c
+++ b/drivers/leds/leds-lp55xx-common.c
@@ -62,6 +62,8 @@
 /* If supported, each ENGINE have an equal amount of pages offset from page 0 */
 #define LP55xx_PAGE_OFFSET(n, pages)	(((n) - 1) * (pages))
 
+#define LED_ACTIVE(mux, led)		(!!((mux) & (0x0001 << (led))))
+
 /* External clock rate */
 #define LP55XX_CLK_32K			32768
 
@@ -691,6 +693,113 @@ ssize_t lp55xx_store_engine_load(struct device *dev,
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
+	unsigned int led_active;
+	int i, pos = 0;
+
+	for (i = 0; i < cfg->max_channel; i++) {
+		led_active = LED_ACTIVE(chip->engines[nr - 1].led_mux, i);
+		pos += sysfs_emit_at(buf, pos, "%x", led_active);
+	}
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
index 5b3e9473cadc..5f2394a6de15 100644
--- a/drivers/leds/leds-lp55xx-common.h
+++ b/drivers/leds/leds-lp55xx-common.h
@@ -51,21 +51,21 @@ static ssize_t store_engine##nr##_mode(struct device *dev,		\
 static LP55XX_DEV_ATTR_RW(engine##nr##_mode, show_engine##nr##_mode,	\
 			  store_engine##nr##_mode)
 
-#define show_leds(nr)							\
+#define LP55XX_DEV_ATTR_ENGINE_LEDS(nr)					\
 static ssize_t show_engine##nr##_leds(struct device *dev,		\
-			    struct device_attribute *attr,		\
-			    char *buf)					\
+				      struct device_attribute *attr,	\
+				      char *buf)			\
 {									\
-	return show_engine_leds(dev, attr, buf, nr);			\
-}
-
-#define store_leds(nr)						\
-static ssize_t store_engine##nr##_leds(struct device *dev,	\
-			     struct device_attribute *attr,	\
-			     const char *buf, size_t len)	\
-{								\
-	return store_engine_leds(dev, attr, buf, len, nr);	\
-}
+	return lp55xx_show_engine_leds(dev, attr, buf, nr);		\
+}									\
+static ssize_t store_engine##nr##_leds(struct device *dev,		\
+				       struct device_attribute *attr,	\
+				       const char *buf, size_t len)	\
+{									\
+	return lp55xx_store_engine_leds(dev, attr, buf, len, nr);	\
+}									\
+static LP55XX_DEV_ATTR_RW(engine##nr##_leds, show_engine##nr##_leds,	\
+			  store_engine##nr##_leds)
 
 #define LP55XX_DEV_ATTR_ENGINE_LOAD(nr)					\
 static ssize_t store_engine##nr##_load(struct device *dev,		\
@@ -238,5 +238,11 @@ extern ssize_t lp55xx_store_engine_mode(struct device *dev,
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
2.45.1


