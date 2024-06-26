Return-Path: <linux-leds+bounces-2159-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 14317919A7E
	for <lists+linux-leds@lfdr.de>; Thu, 27 Jun 2024 00:16:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 650A8B23218
	for <lists+linux-leds@lfdr.de>; Wed, 26 Jun 2024 22:16:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3C27194143;
	Wed, 26 Jun 2024 22:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hw72Za3T"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86B1819309B;
	Wed, 26 Jun 2024 22:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719440141; cv=none; b=ewmKZ5oGUA5VGZx6gHnbI1Zbkfr9lYZvgfbgA4R/tD7vwP+gH8gdmy+uueMSr7TTbracZ3g+SH11aV6hQuVa46ahOaQQxXddYhvm/Nt1ncQ0NMLwOHg8eELKBUXAJVDfAkmDqrTwfucy2FKuJeobKUrCSCwP3kcsfYPVlIEmtbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719440141; c=relaxed/simple;
	bh=euD8H9nhTWjMYgaFrJyGcZpK5f7HZBYh2TkuafSVTXg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Yrwoaw7uH9niDOIiH/gzshgg/kxyTPPeDfiG0k4lnvZyNEExGWSo/n4W6s4lF/Q70prdsBapshguUJHuEfEOXfLxtoDsGrW1NuPUMcWwbfm//ah7A4wkjSJS7mFv/eRcTVGXFlJX+Kf2met5k4gPegiW8PtFpt558ewm2DJjdo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hw72Za3T; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-42108856c33so7071055e9.1;
        Wed, 26 Jun 2024 15:15:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719440138; x=1720044938; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iYxBdR+wOFYbAoJ4+ERABgkCtVZGe8zC55wy5HLb/Rs=;
        b=Hw72Za3TifFCvH12oNg4ClpsoVUU91WZg7cOPOiWf96ejFNMzDZzQ1dkvbBqsSd1WI
         z8iy+7pla2lBf/ds1QfD1WbE+4iJDBSJgshXPDRLWF3b/26s3tgIPRDB/FdCEwubChHd
         ju8kNgnfmCS4g0Kdl8q340QwEzkre+cv8/hf27Ci7c1jeJ5OfVcXE3lh+GvYDeSwzx4I
         aoOTfQs4xnJX0eowIANBenlVouqe3C6U3OJ4rnutlB9uH+Rwl5ma353sLXAX1A6jmQew
         Aruvi8Phptlkt4PHmaDsDb05Fioo9FSqbOl4n4IYDk+pbo56AqgFCpw9R/06BzHnEIxo
         R8wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719440138; x=1720044938;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iYxBdR+wOFYbAoJ4+ERABgkCtVZGe8zC55wy5HLb/Rs=;
        b=NZE5+gLLkUaGOrl6FwzC9gmD8l1nnSKp48gpiSmyPctVeV7+HsXk7mBWFqmZzeLU+9
         1IeKRKZdXY2HmBbVhpGgLDR9w7XYHE0EcnUq4MLlj3RgkaB5a3cgmALyzpY40hnIO+6c
         NbFxvzz6rxMK3YEfyj5iNJ0BtpmWLBlJ6jGlofgBfzf8I6miCtK5UJO/6x+ICqXQ/kqo
         snDzlsxUS0U70Izi0Y1DdudZM0j2YbOSfuwMsTleY/5ZnOHXxEldYuB0GY0EJfDfB31D
         ocNF7rkMQuLZRaJBhbia2417CIpMVUcJYbjvCUGWLPopIp/LeUbiU+d3C2POHrU7F6yf
         sKGQ==
X-Forwarded-Encrypted: i=1; AJvYcCXRmBothi/eRyrXRhcx9cup8uMcQR2aTa7G7LABrDcnw7V3XcJ1sNUaYznPcI0z+fi2tZyCeojduO03c1ejWFotyyxJSyXna9hq6LkoqDuUIcN2PpwvNgmyhrpWhdwNz4CmjVEf/qwVaA==
X-Gm-Message-State: AOJu0Yw0HhYTOKFMtZjDctQgU23UdgclJ96O0LuJy9q7PZq7FCawBP20
	Xzw8A5xuDa51GJjR86h9x2UnSfvq056AUcP/4qkdWt8gMAjgG+Hl
X-Google-Smtp-Source: AGHT+IGCpsc3L7v8ad+FUI3szjdD1TyNX6xJCCgi6F/r+g0P+IyHhf16nibF7z33+ipx6kZugvzl7A==
X-Received: by 2002:a5d:6d04:0:b0:366:eadc:573f with SMTP id ffacd0b85a97d-367419135c5mr161449f8f.27.1719440137638;
        Wed, 26 Jun 2024 15:15:37 -0700 (PDT)
Received: from localhost.localdomain (93-34-90-105.ip49.fastwebnet.it. [93.34.90.105])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3674357c100sm39283f8f.21.2024.06.26.15.15.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 15:15:37 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee@kernel.org>,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Christian Marangi <ansuelsmth@gmail.com>,
	Markus Elfring <Markus.Elfring@web.de>
Subject: [PATCH 3/3] leds: leds-lp55xx: Convert mutex lock/unlock to guard API
Date: Thu, 27 Jun 2024 00:15:13 +0200
Message-ID: <20240626221520.2846-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240626221520.2846-1-ansuelsmth@gmail.com>
References: <20240626221520.2846-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert any entry of mutex lock/unlock to guard API and simplify code.
With the use of guard API, handling for selttest functions can be
greatly simplified.

Suggested-by: Markus Elfring <Markus.Elfring@web.de>
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/leds/leds-lp5521.c        |  5 +-
 drivers/leds/leds-lp5523.c        | 25 +++-----
 drivers/leds/leds-lp5562.c        | 13 +++--
 drivers/leds/leds-lp5569.c        | 18 ++----
 drivers/leds/leds-lp55xx-common.c | 94 +++++++++++++------------------
 5 files changed, 64 insertions(+), 91 deletions(-)

diff --git a/drivers/leds/leds-lp5521.c b/drivers/leds/leds-lp5521.c
index de0f8ea48eba..56d16ea18617 100644
--- a/drivers/leds/leds-lp5521.c
+++ b/drivers/leds/leds-lp5521.c
@@ -9,6 +9,7 @@
  *          Milo(Woogyom) Kim <milo.kim@ti.com>
  */
 
+#include <linux/cleanup.h>
 #include <linux/delay.h>
 #include <linux/firmware.h>
 #include <linux/i2c.h>
@@ -185,9 +186,9 @@ static ssize_t lp5521_selftest(struct device *dev,
 	struct lp55xx_chip *chip = led->chip;
 	int ret;
 
-	mutex_lock(&chip->lock);
+	guard(mutex, &chip->lock);
+
 	ret = lp5521_run_selftest(chip, buf);
-	mutex_unlock(&chip->lock);
 
 	return sysfs_emit(buf, "%s\n", ret ? "FAIL" : "OK");
 }
diff --git a/drivers/leds/leds-lp5523.c b/drivers/leds/leds-lp5523.c
index 095060533d1a..baa1a3ac1a56 100644
--- a/drivers/leds/leds-lp5523.c
+++ b/drivers/leds/leds-lp5523.c
@@ -9,6 +9,7 @@
  *          Milo(Woogyom) Kim <milo.kim@ti.com>
  */
 
+#include <linux/cleanup.h>
 #include <linux/delay.h>
 #include <linux/firmware.h>
 #include <linux/i2c.h>
@@ -188,16 +189,16 @@ static ssize_t lp5523_selftest(struct device *dev,
 	int ret, pos = 0;
 	u8 status, adc, vdd, i;
 
-	mutex_lock(&chip->lock);
+	guard(mutex, &chip->lock);
 
 	ret = lp55xx_read(chip, LP5523_REG_STATUS, &status);
 	if (ret < 0)
-		goto fail;
+		return sysfs_emit(buf, "FAIL\n");
 
 	/* Check that ext clock is really in use if requested */
 	if (pdata->clock_mode == LP55XX_CLOCK_EXT) {
 		if  ((status & LP5523_EXT_CLK_USED) == 0)
-			goto fail;
+			return sysfs_emit(buf, "FAIL\n");
 	}
 
 	/* Measure VDD (i.e. VBAT) first (channel 16 corresponds to VDD) */
@@ -205,14 +206,14 @@ static ssize_t lp5523_selftest(struct device *dev,
 	usleep_range(3000, 6000); /* ADC conversion time is typically 2.7 ms */
 	ret = lp55xx_read(chip, LP5523_REG_STATUS, &status);
 	if (ret < 0)
-		goto fail;
+		return sysfs_emit(buf, "FAIL\n");
 
 	if (!(status & LP5523_LEDTEST_DONE))
 		usleep_range(3000, 6000); /* Was not ready. Wait little bit */
 
 	ret = lp55xx_read(chip, LP5523_REG_LED_TEST_ADC, &vdd);
 	if (ret < 0)
-		goto fail;
+		return sysfs_emit(buf, "FAIL\n");
 
 	vdd--;	/* There may be some fluctuation in measurement */
 
@@ -235,14 +236,14 @@ static ssize_t lp5523_selftest(struct device *dev,
 		usleep_range(3000, 6000);
 		ret = lp55xx_read(chip, LP5523_REG_STATUS, &status);
 		if (ret < 0)
-			goto fail;
+			return sysfs_emit(buf, "FAIL\n");
 
 		if (!(status & LP5523_LEDTEST_DONE))
 			usleep_range(3000, 6000); /* Was not ready. Wait. */
 
 		ret = lp55xx_read(chip, LP5523_REG_LED_TEST_ADC, &adc);
 		if (ret < 0)
-			goto fail;
+			return sysfs_emit(buf, "FAIL\n");
 
 		if (adc >= vdd || adc < LP5523_ADC_SHORTCIRC_LIM)
 			pos += sysfs_emit_at(buf, pos, "LED %d FAIL\n",
@@ -256,16 +257,8 @@ static ssize_t lp5523_selftest(struct device *dev,
 			     led->led_current);
 		led++;
 	}
-	if (pos == 0)
-		pos = sysfs_emit(buf, "OK\n");
-	goto release_lock;
-fail:
-	pos = sysfs_emit(buf, "FAIL\n");
 
-release_lock:
-	mutex_unlock(&chip->lock);
-
-	return pos;
+	return pos == 0 ? sysfs_emit(buf, "OK\n") : pos;
 }
 
 LP55XX_DEV_ATTR_ENGINE_MODE(1);
diff --git a/drivers/leds/leds-lp5562.c b/drivers/leds/leds-lp5562.c
index 6ba5dbb9cace..69a4e3d5a126 100644
--- a/drivers/leds/leds-lp5562.c
+++ b/drivers/leds/leds-lp5562.c
@@ -7,6 +7,7 @@
  * Author: Milo(Woogyom) Kim <milo.kim@ti.com>
  */
 
+#include <linux/cleanup.h>
 #include <linux/delay.h>
 #include <linux/firmware.h>
 #include <linux/i2c.h>
@@ -171,9 +172,9 @@ static int lp5562_led_brightness(struct lp55xx_led *led)
 	};
 	int ret;
 
-	mutex_lock(&chip->lock);
+	guard(mutex, &chip->lock);
+
 	ret = lp55xx_write(chip, addr[led->chan_nr], led->brightness);
-	mutex_unlock(&chip->lock);
 
 	return ret;
 }
@@ -268,9 +269,9 @@ static ssize_t lp5562_store_pattern(struct device *dev,
 	if (mode > num_patterns || !ptn)
 		return -EINVAL;
 
-	mutex_lock(&chip->lock);
+	guard(mutex, &chip->lock);
+
 	ret = lp5562_run_predef_led_pattern(chip, mode);
-	mutex_unlock(&chip->lock);
 
 	if (ret)
 		return ret;
@@ -320,9 +321,9 @@ static ssize_t lp5562_store_engine_mux(struct device *dev,
 		return -EINVAL;
 	}
 
-	mutex_lock(&chip->lock);
+	guard(mutex, &chip->lock);
+
 	lp55xx_update_bits(chip, LP5562_REG_ENG_SEL, mask, val);
-	mutex_unlock(&chip->lock);
 
 	return len;
 }
diff --git a/drivers/leds/leds-lp5569.c b/drivers/leds/leds-lp5569.c
index e5e7e61c8916..dc8efb25b78e 100644
--- a/drivers/leds/leds-lp5569.c
+++ b/drivers/leds/leds-lp5569.c
@@ -4,6 +4,7 @@
  */
 
 #include <linux/bitfield.h>
+#include <linux/cleanup.h>
 #include <linux/delay.h>
 #include <linux/firmware.h>
 #include <linux/i2c.h>
@@ -396,17 +397,17 @@ static ssize_t lp5569_selftest(struct device *dev,
 	struct lp55xx_chip *chip = led->chip;
 	int i, pos = 0;
 
-	mutex_lock(&chip->lock);
+	guard(mutex, &chip->lock);
 
 	/* Test LED Open */
 	pos = lp5569_led_open_test(led, buf);
 	if (pos < 0)
-		goto fail;
+		return sprintf(buf, "FAIL\n");
 
 	/* Test LED Shorted */
 	pos += lp5569_led_short_test(led, buf);
 	if (pos < 0)
-		goto fail;
+		return sprintf(buf, "FAIL\n");
 
 	for (i = 0; i < chip->pdata->num_channels; i++) {
 		/* Restore current */
@@ -419,16 +420,7 @@ static ssize_t lp5569_selftest(struct device *dev,
 		led++;
 	}
 
-	if (pos == 0)
-		pos = sysfs_emit(buf, "OK\n");
-	goto release_lock;
-fail:
-	pos = sysfs_emit(buf, "FAIL\n");
-
-release_lock:
-	mutex_unlock(&chip->lock);
-
-	return pos;
+	return pos == 0 ? sysfs_emit(buf, "OK\n") : pos;
 }
 
 LP55XX_DEV_ATTR_ENGINE_MODE(1);
diff --git a/drivers/leds/leds-lp55xx-common.c b/drivers/leds/leds-lp55xx-common.c
index 1b71f512206d..f8cf5c0e983a 100644
--- a/drivers/leds/leds-lp55xx-common.c
+++ b/drivers/leds/leds-lp55xx-common.c
@@ -10,6 +10,7 @@
  */
 
 #include <linux/bitfield.h>
+#include <linux/cleanup.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/firmware.h>
@@ -272,10 +273,10 @@ int lp55xx_led_brightness(struct lp55xx_led *led)
 	const struct lp55xx_device_config *cfg = chip->cfg;
 	int ret;
 
-	mutex_lock(&chip->lock);
+	guard(mutex, &chip->lock);
+
 	ret = lp55xx_write(chip, cfg->reg_led_pwm_base.addr + led->chan_nr,
 			   led->brightness);
-	mutex_unlock(&chip->lock);
 	return ret;
 }
 EXPORT_SYMBOL_GPL(lp55xx_led_brightness);
@@ -287,7 +288,8 @@ int lp55xx_multicolor_brightness(struct lp55xx_led *led)
 	int ret;
 	int i;
 
-	mutex_lock(&chip->lock);
+	guard(mutex, &chip->lock);
+
 	for (i = 0; i < led->mc_cdev.num_colors; i++) {
 		ret = lp55xx_write(chip,
 				   cfg->reg_led_pwm_base.addr +
@@ -296,7 +298,7 @@ int lp55xx_multicolor_brightness(struct lp55xx_led *led)
 		if (ret)
 			break;
 	}
-	mutex_unlock(&chip->lock);
+
 	return ret;
 }
 EXPORT_SYMBOL_GPL(lp55xx_multicolor_brightness);
@@ -404,9 +406,9 @@ static ssize_t led_current_store(struct device *dev,
 	if (!chip->cfg->set_led_current)
 		return len;
 
-	mutex_lock(&chip->lock);
+	guard(mutex, &chip->lock);
+
 	chip->cfg->set_led_current(led, (u8)curr);
-	mutex_unlock(&chip->lock);
 
 	return len;
 }
@@ -541,14 +543,12 @@ static void lp55xx_firmware_loaded(const struct firmware *fw, void *context)
 	}
 
 	/* handling firmware data is chip dependent */
-	mutex_lock(&chip->lock);
-
-	chip->engines[idx - 1].mode = LP55XX_ENGINE_LOAD;
-	chip->fw = fw;
-	if (chip->cfg->firmware_cb)
-		chip->cfg->firmware_cb(chip);
-
-	mutex_unlock(&chip->lock);
+	scoped_guard(mutex, &chip->lock) {
+		chip->engines[idx - 1].mode = LP55XX_ENGINE_LOAD;
+		chip->fw = fw;
+		if (chip->cfg->firmware_cb)
+			chip->cfg->firmware_cb(chip);
+	}
 
 	/* firmware should be released for other channel use */
 	release_firmware(chip->fw);
@@ -592,10 +592,10 @@ static ssize_t select_engine_store(struct device *dev,
 	case LP55XX_ENGINE_1:
 	case LP55XX_ENGINE_2:
 	case LP55XX_ENGINE_3:
-		mutex_lock(&chip->lock);
-		chip->engine_idx = val;
-		ret = lp55xx_request_firmware(chip);
-		mutex_unlock(&chip->lock);
+		scoped_guard(mutex, &chip->lock) {
+			chip->engine_idx = val;
+			ret = lp55xx_request_firmware(chip);
+		}
 		break;
 	default:
 		dev_err(dev, "%lu: invalid engine index. (1, 2, 3)\n", val);
@@ -634,9 +634,9 @@ static ssize_t run_engine_store(struct device *dev,
 		return len;
 	}
 
-	mutex_lock(&chip->lock);
+	guard(mutex, &chip->lock);
+
 	lp55xx_run_engine(chip, true);
-	mutex_unlock(&chip->lock);
 
 	return len;
 }
@@ -673,7 +673,7 @@ ssize_t lp55xx_store_engine_mode(struct device *dev,
 	const struct lp55xx_device_config *cfg = chip->cfg;
 	struct lp55xx_engine *engine = &chip->engines[nr - 1];
 
-	mutex_lock(&chip->lock);
+	guard(mutex, &chip->lock);
 
 	chip->engine_idx = nr;
 
@@ -689,8 +689,6 @@ ssize_t lp55xx_store_engine_mode(struct device *dev,
 		engine->mode = LP55XX_ENGINE_DISABLED;
 	}
 
-	mutex_unlock(&chip->lock);
-
 	return len;
 }
 EXPORT_SYMBOL_GPL(lp55xx_store_engine_mode);
@@ -703,14 +701,12 @@ ssize_t lp55xx_store_engine_load(struct device *dev,
 	struct lp55xx_chip *chip = led->chip;
 	int ret;
 
-	mutex_lock(&chip->lock);
+	guard(mutex, &chip->lock);
 
 	chip->engine_idx = nr;
 	lp55xx_load_engine(chip);
 	ret = lp55xx_update_program_memory(chip, buf, len);
 
-	mutex_unlock(&chip->lock);
-
 	return ret;
 }
 EXPORT_SYMBOL_GPL(lp55xx_store_engine_load);
@@ -804,21 +800,17 @@ ssize_t lp55xx_store_engine_leds(struct device *dev,
 	if (lp55xx_mux_parse(chip, buf, &mux, len))
 		return -EINVAL;
 
-	mutex_lock(&chip->lock);
+	guard(mutex, &chip->lock);
 
 	chip->engine_idx = nr;
-	ret = -EINVAL;
 
 	if (engine->mode != LP55XX_ENGINE_LOAD)
-		goto leave;
+		return -EINVAL;
 
 	if (lp55xx_load_mux(chip, mux, nr))
-		goto leave;
+		return -EINVAL;
 
-	ret = len;
-leave:
-	mutex_unlock(&chip->lock);
-	return ret;
+	return len;
 }
 EXPORT_SYMBOL_GPL(lp55xx_store_engine_leds);
 
@@ -832,9 +824,9 @@ ssize_t lp55xx_show_master_fader(struct device *dev,
 	int ret;
 	u8 val;
 
-	mutex_lock(&chip->lock);
+	guard(mutex, &chip->lock);
+
 	ret = lp55xx_read(chip, cfg->reg_master_fader_base.addr + nr - 1, &val);
-	mutex_unlock(&chip->lock);
 
 	return ret ? ret : sysfs_emit(buf, "%u\n", val);
 }
@@ -856,10 +848,10 @@ ssize_t lp55xx_store_master_fader(struct device *dev,
 	if (val > 0xff)
 		return -EINVAL;
 
-	mutex_lock(&chip->lock);
+	guard(mutex, &chip->lock);
+
 	ret = lp55xx_write(chip, cfg->reg_master_fader_base.addr + nr - 1,
 			   (u8)val);
-	mutex_unlock(&chip->lock);
 
 	return ret ? ret : len;
 }
@@ -875,25 +867,22 @@ ssize_t lp55xx_show_master_fader_leds(struct device *dev,
 	int i, ret, pos = 0;
 	u8 val;
 
-	mutex_lock(&chip->lock);
+	guard(mutex, &chip->lock);
 
 	for (i = 0; i < cfg->max_channel; i++) {
 		ret = lp55xx_read(chip, cfg->reg_led_ctrl_base.addr + i, &val);
 		if (ret)
-			goto leave;
+			return ret;
 
 		val = FIELD_GET(LP55xx_FADER_MAPPING_MASK, val);
 		if (val > FIELD_MAX(LP55xx_FADER_MAPPING_MASK)) {
-			ret = -EINVAL;
-			goto leave;
+			return -EINVAL;
 		}
 		buf[pos++] = val + '0';
 	}
 	buf[pos++] = '\n';
-	ret = pos;
-leave:
-	mutex_unlock(&chip->lock);
-	return ret;
+
+	return pos;
 }
 EXPORT_SYMBOL_GPL(lp55xx_show_master_fader_leds);
 
@@ -909,7 +898,7 @@ ssize_t lp55xx_store_master_fader_leds(struct device *dev,
 
 	n = min_t(int, len, cfg->max_channel);
 
-	mutex_lock(&chip->lock);
+	guard(mutex, &chip->lock);
 
 	for (i = 0; i < n; i++) {
 		if (buf[i] >= '0' && buf[i] <= '3') {
@@ -919,16 +908,13 @@ ssize_t lp55xx_store_master_fader_leds(struct device *dev,
 						 LP55xx_FADER_MAPPING_MASK,
 						 val);
 			if (ret)
-				goto leave;
+				return ret;
 		} else {
-			ret = -EINVAL;
-			goto leave;
+			return -EINVAL;
 		}
 	}
-	ret = len;
-leave:
-	mutex_unlock(&chip->lock);
-	return ret;
+
+	return len;
 }
 EXPORT_SYMBOL_GPL(lp55xx_store_master_fader_leds);
 
-- 
2.45.1


