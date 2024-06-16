Return-Path: <linux-leds+bounces-1976-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 18C4A90A03E
	for <lists+linux-leds@lfdr.de>; Sun, 16 Jun 2024 23:59:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B6F4B281EBE
	for <lists+linux-leds@lfdr.de>; Sun, 16 Jun 2024 21:59:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A70713B29C;
	Sun, 16 Jun 2024 21:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iVikqjlU"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 762E813AA4C;
	Sun, 16 Jun 2024 21:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718574967; cv=none; b=Immod1Sj0Hs+m7nwF4vjOPTJrC5jUtEGpjRHRquPCmBGCorzuiaCEmRiowmV25n557N6R7hzwyc2b4LmfSytLb3D6SpYlcowm9M6wPeSSq+LNGp+Kty/MW6R2U6T2391inVDzvZTU9Kg3rUkIFz+95DM9YDTF1CZatc5Ksb632c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718574967; c=relaxed/simple;
	bh=T3UbZSBHEOWonVq01FuSupTB8ewGy03zPFXoi0Jefd0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HkB/9xjnZshPWSL1oyl7BHTOqhKS9b3cgr21Gw8MHyBTZUwtHeGwrpCLLQ4Hc/jtTl4MQQWz0s+cmY7XqXSOYeSMxMJT4xwJsuQnMGLA0rC/tXKp3spiEVmQ1iDib7kPkhulBUizUrxirsyl3DRKrzkI45eiO+5lPOyO4K8QStk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iVikqjlU; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-35f1cb7a40fso3226773f8f.0;
        Sun, 16 Jun 2024 14:56:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718574964; x=1719179764; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tsQ6+wnPGxeyG9A/0+Qd3Wo05d2QvtyTNpm2jCWthiI=;
        b=iVikqjlUBaoOApBfAYQDMXidBzn7D0Sv6clMozd3oAjph9nV7VAUZ9x+QdDGsiIj1L
         5b/Ba4jNE6BudjsXxjH7cSspiSRnkVCRe0R9RSmA7siyE7IU17fvymcD2a1vBrIt1IQd
         BMmC4rFpkCUAS3UnQ1756CNSE4KPNvjx9LQJYn98UhNJO4KvrviSFg2bDkyaslA5Wo/4
         ectelD/LHZFV3SR+HHX716C+5JyoAFsTW4zpldO18d2Spm4UX1dz9gxuyG0wHc0H6tTg
         8a2y7MCcFkRGoYTK5G03if0WRtCsdSM1c7RFlWHJJU0OT0t7MNLqHaEANkJLfzQk2dCe
         1K5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718574964; x=1719179764;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tsQ6+wnPGxeyG9A/0+Qd3Wo05d2QvtyTNpm2jCWthiI=;
        b=prFGNScClauKry2u+jYyB0gz89fTwGelYOdFULKHDiYAeX45fFAKdbGn/Jp/Pbh8ES
         omSD9AegKCZH6B2REtljMg+M8fjnxka6YUojEbvgvNOvu0tWS8r5QJ0VhsVbbrll0q+I
         ANsNDL3N2DhMiJIdfHaxiDkuOPZeCTHIgGzum+VhrpYvXGDyO84kaTeE1VRN/Gip/rVb
         GLglUPGONzV553DLtJ3tntXg3pwB2WKLUWw/EBZB3TZbmG9kigaW+LzmFUto0P1EBrF4
         3ymGLJYSlH85L8BhCEZ1ehSJdZqku8knjWqylXKWJ6NjpIx1T6LyDr5VhD1Q0970BWwm
         hppg==
X-Forwarded-Encrypted: i=1; AJvYcCVrBCmebWTg9Q+bcYlm9B2+IPm9UFqw2FbC2PsP1+f9apCK8xL9paBGFex1cLN2diDNZsPP1M0LALV6nrK9vrl74gCxX2D7ju4/z0B51z1B2nStg61+P9S9mcTrmzs0ZnqU6DSSzWBcFFSa9g59IjQWuGFkN1reckAQ1OLWhBiew01YFNI=
X-Gm-Message-State: AOJu0Yy5fPs2ZOVONATxP1nrPmqMlpRbNg/XE7IrM3ckaHe0UZ+31EnP
	CBBRVwaeYQX8QYiLyznAN2NtFX1RNOnQlcd98d1mxM0Qny+SCi3g
X-Google-Smtp-Source: AGHT+IE5V75ihQZaYFqFTNT22HtgIZNiyI/80/BzTAZjfrEpnKyjvdaaI/OQbV7+0n7AyJ9WAdAFRg==
X-Received: by 2002:adf:f906:0:b0:35f:30ae:a6e4 with SMTP id ffacd0b85a97d-3607a782371mr5606646f8f.46.1718574963806;
        Sun, 16 Jun 2024 14:56:03 -0700 (PDT)
Received: from localhost.localdomain (93-34-90-105.ip49.fastwebnet.it. [93.34.90.105])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-36075104b74sm10362879f8f.107.2024.06.16.14.56.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Jun 2024 14:56:03 -0700 (PDT)
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
Subject: [PATCH v6 16/20] leds: leds-lp55xx: generalize sysfs engine_leds
Date: Sun, 16 Jun 2024 23:52:15 +0200
Message-ID: <20240616215226.2112-17-ansuelsmth@gmail.com>
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
index 506cde3f4cc1..df94c1d385b9 100644
--- a/drivers/leds/leds-lp55xx-common.c
+++ b/drivers/leds/leds-lp55xx-common.c
@@ -62,6 +62,8 @@
 /* If supported, each ENGINE have an equal amount of pages offset from page 0 */
 #define LP55xx_PAGE_OFFSET(n, pages)	(((n) - 1) * (pages))
 
+#define LED_ACTIVE(mux, led)		(!!(mux & (0x0001 << led)))
+
 /* External clock rate */
 #define LP55XX_CLK_32K			32768
 
@@ -693,6 +695,112 @@ ssize_t lp55xx_store_engine_load(struct device *dev,
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


