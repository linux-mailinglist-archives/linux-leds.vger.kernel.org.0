Return-Path: <linux-leds+bounces-1935-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4516D909A65
	for <lists+linux-leds@lfdr.de>; Sun, 16 Jun 2024 01:13:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B65501F21681
	for <lists+linux-leds@lfdr.de>; Sat, 15 Jun 2024 23:13:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EB4473537;
	Sat, 15 Jun 2024 23:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SMkZIIJT"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78F9273440;
	Sat, 15 Jun 2024 23:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718493178; cv=none; b=DmvtdEMeqXVdZkeaMDVH94uJbSCckw6gNHH8jfbHyCBXExfcButYE73FS+nS4/95hoCQVK+pEZilwtwLY9nhUiGgFsKdrUjSDUg6n1SFgaAB432U5+0HYBrBJe0WMPrCq6LIkcPi7a4DSQbECd/blrs7j3ozx7T7u4ypqK9FSu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718493178; c=relaxed/simple;
	bh=cvAiLUhTdfb5YLxDKNEaxqaIFMQeeKrIojLSJL4XvEs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E389GM7oiU82XSlHbaf9nt/QpZW5c6dqF+X1fSrlVh9stuMexSFuwt9sb2+70iriu+4Pcsvio7MDtiXlJ3tjdEX/DrcC4sbbS5aNM8m6hSVal2+OGfsLdWq2QGSIQw0dw8wFP6FzUw30ZmVqVopnAz/J4dprEYrU18nXfxny9B0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SMkZIIJT; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-35f1c490c13so3634923f8f.3;
        Sat, 15 Jun 2024 16:12:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718493175; x=1719097975; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VEeaFUg3lKCARsm4zm9LOeHkJGdpWuIijdSVUZOssgc=;
        b=SMkZIIJT6/jhWoFNoCzM+b8KHmpMZwajuXjB8Zo1cf5hOA4G4eOsQxz6Fyjz5hEnvA
         vp2TDW3SKz/FiwC5e1UkPTUXlamvCzZwNdiakEOAR/teVtmVosXkyWtuPavUplfklD2z
         5S1RvwQxWtFRrbN8IKw4YfyqPA8QAUm0qT/CCEZa2g/VDSaz0LP96kydp7YraLKDcz5k
         I6CpOwKNBHdt+brP+H+o21Y06hoCyzWUyH0Rc/Vv9pKs0ojRbd2q9Mq8GnRoZ1/sfCz3
         CDVY6uS4eJMTMw1pM+bEj2q17lDX3yiXSeR4izZgj/XvQVIBR43RD7NVXmrB3UqfOUq9
         EcUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718493175; x=1719097975;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VEeaFUg3lKCARsm4zm9LOeHkJGdpWuIijdSVUZOssgc=;
        b=Ei7hEAy9q/HDIFunrHO1HzmjPEbJ+P97a3oWMOAWK/105+FuS2Mksovc9YtSsthUzi
         /vgf0m24tGMQOs/+XqjwfWh6pTb619GPXtO3KnXJm94pcQoIQ3xqJWIZP65yrsAtZ1R8
         JkAyW2cpVeQwgDimFgXvnbQrOP9s0JRYG+cbNyGL8bQmfyrIyHjBefh+o9EMLOwKozlI
         iemN+2o4MpGiU2mYfnj8KR+x9rJDG2vA5pnj22UoCQ7ohN91wccbdm4j0oyPee5U5R3u
         UrGOiyARKbB1lLlVq2+P/+VTn+4WvbSbPUhw44R8VgGDNsvULD30WkCVPdLzU0KFfNxB
         LXtg==
X-Forwarded-Encrypted: i=1; AJvYcCUJ6WWE3yMDApLNB1bkdAvN3U6DLxCui7m2peFmXVvQ6J0tK51QVxuxWTQXUcQulJ0fg/fCjPexv2a6u18YmCk244FfZur4BfFQxDoQkP9AbIIo8BxElciITjohl7xT33QuZMMZ2YAUrGrtsaGvbiqoV/COUtTwrJxGf5HjR8OG9l+OVdc=
X-Gm-Message-State: AOJu0YyAlk9pndMf8AYhqqUbFFTAiuh0CYuIVUCwpuL+7FbrdOESzlzO
	NoXMrb7P08ssEAQbx1i656knwRhOCqZEs15181R4f3K/16wRmnZ8
X-Google-Smtp-Source: AGHT+IHW/3OugEVeEU+2effz9irHwRbIdkW4AQOZ9q8Kqg8k2OQ71taTtZpkFKXRzEoECzUR9a4HrQ==
X-Received: by 2002:a5d:6a10:0:b0:35f:1f06:3d9d with SMTP id ffacd0b85a97d-3607a7888f4mr5168880f8f.70.1718493174813;
        Sat, 15 Jun 2024 16:12:54 -0700 (PDT)
Received: from localhost.localdomain (93-34-90-105.ip49.fastwebnet.it. [93.34.90.105])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3607509355dsm8145532f8f.13.2024.06.15.16.12.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Jun 2024 16:12:54 -0700 (PDT)
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
Subject: [PATCH v5 05/20] leds: leds-lp55xx: generalize load_engine function
Date: Sun, 16 Jun 2024 01:11:35 +0200
Message-ID: <20240615231152.28201-6-ansuelsmth@gmail.com>
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

LED driver based on lp55xx have all a very similar implementation for
load_engine function. Move the function to lp55xx-common and rework the
define to be more dynamic instead of having to declare a temp array for
them.

Engine mask are the same for every LED based on lp55xx.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/leds/leds-lp5521.c        | 26 +++----------------------
 drivers/leds/leds-lp5523.c        | 26 +++----------------------
 drivers/leds/leds-lp5562.c        | 24 ++---------------------
 drivers/leds/leds-lp55xx-common.c | 32 ++++++++++++++++++++++++++++++-
 drivers/leds/leds-lp55xx-common.h |  1 +
 drivers/leds/leds-lp8501.c        | 17 ++--------------
 6 files changed, 42 insertions(+), 84 deletions(-)

diff --git a/drivers/leds/leds-lp5521.c b/drivers/leds/leds-lp5521.c
index 5015f385cc17..08db470fff6c 100644
--- a/drivers/leds/leds-lp5521.c
+++ b/drivers/leds/leds-lp5521.c
@@ -115,26 +115,6 @@ static void lp5521_set_led_current(struct lp55xx_led *led, u8 led_current)
 		led_current);
 }
 
-static void lp5521_load_engine(struct lp55xx_chip *chip)
-{
-	enum lp55xx_engine_index idx = chip->engine_idx;
-	static const u8 mask[] = {
-		[LP55XX_ENGINE_1] = LP5521_MODE_R_M,
-		[LP55XX_ENGINE_2] = LP5521_MODE_G_M,
-		[LP55XX_ENGINE_3] = LP5521_MODE_B_M,
-	};
-
-	static const u8 val[] = {
-		[LP55XX_ENGINE_1] = LP5521_LOAD_R,
-		[LP55XX_ENGINE_2] = LP5521_LOAD_G,
-		[LP55XX_ENGINE_3] = LP5521_LOAD_B,
-	};
-
-	lp55xx_update_bits(chip, LP5521_REG_OP_MODE, mask[idx], val[idx]);
-
-	lp5521_wait_opmode_done();
-}
-
 static void lp5521_stop_engine(struct lp55xx_chip *chip)
 {
 	enum lp55xx_engine_index idx = chip->engine_idx;
@@ -264,7 +244,7 @@ static void lp5521_firmware_loaded(struct lp55xx_chip *chip)
 	 *  2) write firmware data into program memory
 	 */
 
-	lp5521_load_engine(chip);
+	lp55xx_load_engine(chip);
 	lp5521_update_program_memory(chip, fw->data, fw->size);
 }
 
@@ -415,7 +395,7 @@ static ssize_t store_engine_mode(struct device *dev,
 		engine->mode = LP55XX_ENGINE_RUN;
 	} else if (!strncmp(buf, "load", 4)) {
 		lp5521_stop_engine(chip);
-		lp5521_load_engine(chip);
+		lp55xx_load_engine(chip);
 		engine->mode = LP55XX_ENGINE_LOAD;
 	} else if (!strncmp(buf, "disabled", 8)) {
 		lp5521_stop_engine(chip);
@@ -441,7 +421,7 @@ static ssize_t store_engine_load(struct device *dev,
 	mutex_lock(&chip->lock);
 
 	chip->engine_idx = nr;
-	lp5521_load_engine(chip);
+	lp55xx_load_engine(chip);
 	ret = lp5521_update_program_memory(chip, buf, len);
 
 	mutex_unlock(&chip->lock);
diff --git a/drivers/leds/leds-lp5523.c b/drivers/leds/leds-lp5523.c
index bd0209e2ee42..086b4d8975a4 100644
--- a/drivers/leds/leds-lp5523.c
+++ b/drivers/leds/leds-lp5523.c
@@ -159,26 +159,6 @@ static int lp5523_post_init_device(struct lp55xx_chip *chip)
 	return lp5523_init_program_engine(chip);
 }
 
-static void lp5523_load_engine(struct lp55xx_chip *chip)
-{
-	enum lp55xx_engine_index idx = chip->engine_idx;
-	static const u8 mask[] = {
-		[LP55XX_ENGINE_1] = LP5523_MODE_ENG1_M,
-		[LP55XX_ENGINE_2] = LP5523_MODE_ENG2_M,
-		[LP55XX_ENGINE_3] = LP5523_MODE_ENG3_M,
-	};
-
-	static const u8 val[] = {
-		[LP55XX_ENGINE_1] = LP5523_LOAD_ENG1,
-		[LP55XX_ENGINE_2] = LP5523_LOAD_ENG2,
-		[LP55XX_ENGINE_3] = LP5523_LOAD_ENG3,
-	};
-
-	lp55xx_update_bits(chip, LP5523_REG_OP_MODE, mask[idx], val[idx]);
-
-	lp5523_wait_opmode_done();
-}
-
 static void lp5523_load_engine_and_select_page(struct lp55xx_chip *chip)
 {
 	enum lp55xx_engine_index idx = chip->engine_idx;
@@ -188,7 +168,7 @@ static void lp5523_load_engine_and_select_page(struct lp55xx_chip *chip)
 		[LP55XX_ENGINE_3] = LP5523_PAGE_ENG3,
 	};
 
-	lp5523_load_engine(chip);
+	lp55xx_load_engine(chip);
 
 	lp55xx_write(chip, LP5523_REG_PROG_PAGE_SEL, page_sel[idx]);
 }
@@ -425,7 +405,7 @@ static ssize_t store_engine_mode(struct device *dev,
 		engine->mode = LP55XX_ENGINE_RUN;
 	} else if (!strncmp(buf, "load", 4)) {
 		lp5523_stop_engine(chip);
-		lp5523_load_engine(chip);
+		lp55xx_load_engine(chip);
 		engine->mode = LP55XX_ENGINE_LOAD;
 	} else if (!strncmp(buf, "disabled", 8)) {
 		lp5523_stop_engine(chip);
@@ -502,7 +482,7 @@ static int lp5523_load_mux(struct lp55xx_chip *chip, u16 mux, int nr)
 		[LP55XX_ENGINE_3] = LP5523_PAGE_MUX3,
 	};
 
-	lp5523_load_engine(chip);
+	lp55xx_load_engine(chip);
 
 	ret = lp55xx_write(chip, LP5523_REG_PROG_PAGE_SEL, mux_page[nr]);
 	if (ret)
diff --git a/drivers/leds/leds-lp5562.c b/drivers/leds/leds-lp5562.c
index 65a6a05c3848..5e26a52f534f 100644
--- a/drivers/leds/leds-lp5562.c
+++ b/drivers/leds/leds-lp5562.c
@@ -124,26 +124,6 @@ static void lp5562_set_led_current(struct lp55xx_led *led, u8 led_current)
 	lp55xx_write(led->chip, addr[led->chan_nr], led_current);
 }
 
-static void lp5562_load_engine(struct lp55xx_chip *chip)
-{
-	enum lp55xx_engine_index idx = chip->engine_idx;
-	static const u8 mask[] = {
-		[LP55XX_ENGINE_1] = LP5562_MODE_ENG1_M,
-		[LP55XX_ENGINE_2] = LP5562_MODE_ENG2_M,
-		[LP55XX_ENGINE_3] = LP5562_MODE_ENG3_M,
-	};
-
-	static const u8 val[] = {
-		[LP55XX_ENGINE_1] = LP5562_LOAD_ENG1,
-		[LP55XX_ENGINE_2] = LP5562_LOAD_ENG2,
-		[LP55XX_ENGINE_3] = LP5562_LOAD_ENG3,
-	};
-
-	lp55xx_update_bits(chip, LP5562_REG_OP_MODE, mask[idx], val[idx]);
-
-	lp5562_wait_opmode_done();
-}
-
 static void lp5562_run_engine(struct lp55xx_chip *chip, bool start)
 {
 	int ret;
@@ -270,7 +250,7 @@ static void lp5562_firmware_loaded(struct lp55xx_chip *chip)
 	 *  2) write firmware data into program memory
 	 */
 
-	lp5562_load_engine(chip);
+	lp55xx_load_engine(chip);
 	lp5562_update_firmware(chip, fw->data, fw->size);
 }
 
@@ -371,7 +351,7 @@ static int lp5562_run_predef_led_pattern(struct lp55xx_chip *chip, int mode)
 	/* Load engines */
 	for (i = LP55XX_ENGINE_1; i <= LP55XX_ENGINE_3; i++) {
 		chip->engine_idx = i;
-		lp5562_load_engine(chip);
+		lp55xx_load_engine(chip);
 	}
 
 	/* Clear program registers */
diff --git a/drivers/leds/leds-lp55xx-common.c b/drivers/leds/leds-lp55xx-common.c
index a2ea449a1d5e..06cbdef70f9a 100644
--- a/drivers/leds/leds-lp55xx-common.c
+++ b/drivers/leds/leds-lp55xx-common.c
@@ -26,8 +26,24 @@
 /* OP MODE require at least 153 us to clear regs */
 #define LP55XX_CMD_SLEEP		200
 
-/* Program Commands */
+/*
+ * Program Memory Operations
+ * Same Mask for each engine for both mode and exec
+ * ENG1        GENMASK(3, 2)
+ * ENG2        GENMASK(5, 4)
+ * ENG3        GENMASK(7, 6)
+ */
 #define LP55xx_MODE_DISABLE_ALL_ENG	0x0
+#define LP55xx_MODE_ENG_MASK           GENMASK(1, 0)
+#define   LP55xx_MODE_DISABLE_ENG      FIELD_PREP_CONST(LP55xx_MODE_ENG_MASK, 0x0)
+#define   LP55xx_MODE_LOAD_ENG         FIELD_PREP_CONST(LP55xx_MODE_ENG_MASK, 0x1)
+#define   LP55xx_MODE_RUN_ENG          FIELD_PREP_CONST(LP55xx_MODE_ENG_MASK, 0x2)
+#define   LP55xx_MODE_HALT_ENG         FIELD_PREP_CONST(LP55xx_MODE_ENG_MASK, 0x3)
+
+#define   LP55xx_MODE_ENGn_SHIFT(n, shift)	((shift) + (2 * (3 - (n))))
+#define   LP55xx_MODE_ENGn_MASK(n, shift)     (LP55xx_MODE_ENG_MASK << LP55xx_MODE_ENGn_SHIFT(n, shift))
+#define   LP55xx_MODE_ENGn_GET(n, mode, shift)        \
+	(((mode) >> LP55xx_MODE_ENGn_SHIFT(n, shift)) & LP55xx_MODE_ENG_MASK)
 
 /* External clock rate */
 #define LP55XX_CLK_32K			32768
@@ -77,6 +93,20 @@ void lp55xx_stop_all_engine(struct lp55xx_chip *chip)
 }
 EXPORT_SYMBOL_GPL(lp55xx_stop_all_engine);
 
+void lp55xx_load_engine(struct lp55xx_chip *chip)
+{
+	enum lp55xx_engine_index idx = chip->engine_idx;
+	const struct lp55xx_device_config *cfg = chip->cfg;
+	u8 mask, val;
+
+	mask = LP55xx_MODE_ENGn_MASK(idx, cfg->reg_op_mode.shift);
+	val = LP55xx_MODE_LOAD_ENG << LP55xx_MODE_ENGn_SHIFT(idx, cfg->reg_op_mode.shift);
+
+	lp55xx_update_bits(chip, cfg->reg_op_mode.addr, mask, val);
+	lp55xx_wait_opmode_done(chip);
+}
+EXPORT_SYMBOL_GPL(lp55xx_load_engine);
+
 static void lp55xx_reset_device(struct lp55xx_chip *chip)
 {
 	const struct lp55xx_device_config *cfg = chip->cfg;
diff --git a/drivers/leds/leds-lp55xx-common.h b/drivers/leds/leds-lp55xx-common.h
index 26a724acac16..bb146bcecdcf 100644
--- a/drivers/leds/leds-lp55xx-common.h
+++ b/drivers/leds/leds-lp55xx-common.h
@@ -202,6 +202,7 @@ extern bool lp55xx_is_extclk_used(struct lp55xx_chip *chip);
 
 /* common chip functions */
 extern void lp55xx_stop_all_engine(struct lp55xx_chip *chip);
+extern void lp55xx_load_engine(struct lp55xx_chip *chip);
 
 /* common probe/remove function */
 extern int lp55xx_probe(struct i2c_client *client);
diff --git a/drivers/leds/leds-lp8501.c b/drivers/leds/leds-lp8501.c
index d3c718bb8275..04173d6875af 100644
--- a/drivers/leds/leds-lp8501.c
+++ b/drivers/leds/leds-lp8501.c
@@ -119,17 +119,6 @@ static int lp8501_post_init_device(struct lp55xx_chip *chip)
 static void lp8501_load_engine(struct lp55xx_chip *chip)
 {
 	enum lp55xx_engine_index idx = chip->engine_idx;
-	static const u8 mask[] = {
-		[LP55XX_ENGINE_1] = LP8501_MODE_ENG1_M,
-		[LP55XX_ENGINE_2] = LP8501_MODE_ENG2_M,
-		[LP55XX_ENGINE_3] = LP8501_MODE_ENG3_M,
-	};
-
-	static const u8 val[] = {
-		[LP55XX_ENGINE_1] = LP8501_LOAD_ENG1,
-		[LP55XX_ENGINE_2] = LP8501_LOAD_ENG2,
-		[LP55XX_ENGINE_3] = LP8501_LOAD_ENG3,
-	};
 
 	static const u8 page_sel[] = {
 		[LP55XX_ENGINE_1] = LP8501_PAGE_ENG1,
@@ -137,9 +126,7 @@ static void lp8501_load_engine(struct lp55xx_chip *chip)
 		[LP55XX_ENGINE_3] = LP8501_PAGE_ENG3,
 	};
 
-	lp55xx_update_bits(chip, LP8501_REG_OP_MODE, mask[idx], val[idx]);
-
-	lp8501_wait_opmode_done();
+	lp55xx_load_engine(chip);
 
 	lp55xx_write(chip, LP8501_REG_PROG_PAGE_SEL, page_sel[idx]);
 }
@@ -287,7 +274,7 @@ static struct lp55xx_device_config lp8501_cfg = {
 	},
 	.engine_busy = {
 		.addr = LP8501_REG_STATUS,
-		.maks = LP8501_ENGINE_BUSY,
+		.mask = LP8501_ENGINE_BUSY,
 	},
 	.reset = {
 		.addr = LP8501_REG_RESET,
-- 
2.43.0


