Return-Path: <linux-leds+bounces-2081-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A3389114E7
	for <lists+linux-leds@lfdr.de>; Thu, 20 Jun 2024 23:42:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BEA821F22CCA
	for <lists+linux-leds@lfdr.de>; Thu, 20 Jun 2024 21:42:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4775714C580;
	Thu, 20 Jun 2024 21:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eU/rMTzP"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3934B14373D;
	Thu, 20 Jun 2024 21:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718919703; cv=none; b=nkDlGfBYK8Yy/k704MFohX5c6qyy13WDdRfbQNdjfHNCmQZbY5FHqTXweCufihAjLFKuyYWtvubZgFHWnT56BrZcxjwR5gJxEulY+rHDqrHEQbwYT/Sz7YM8M48nUR7FjSqgQGzZ8bz09i8n1RhTtykSkcS1McyMXba2PgVr62M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718919703; c=relaxed/simple;
	bh=k1mXjvx/G8zS0uIhmuzJpBHoZ+lhLAJjEsOyhtMNUTQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s8Hg/JTpvjLvklPDVk/Y1xtIoaMjxrLp+RRrh2MlAiMOT7/TeH5qOuhSYKAwqKnqNDzdyqu9HU197SDldkWpeOR3zLtukqbHRJ2xwfF1w2AkKwnHqjKTBl+rioQ5r8qO7eW+ypNFKg5siQB58S92ja+QZmfRbuJQHGrExLDvQgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eU/rMTzP; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-364a39824baso1095520f8f.1;
        Thu, 20 Jun 2024 14:41:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718919699; x=1719524499; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y8U8NBtMm/u2IVD8/kM9yB3umzeKyozmtPIP44s+PjY=;
        b=eU/rMTzPW1ulpZmJ0E0Yfu5jrDeBuAwisK7GTVjfbDqQaeSkGOCO2ct/rM/ShG6tAX
         mz1ILXJzvi7TCwAVdEkqW9GNBya3hOGT1E8OCdXrD4/1wZ4/8IgbxWo0YyXDRyTrd1+L
         LxYu9HDBaQzHpMXDW0kWOhH5vWxNsWhZh7dfM2Zs3D0tCLrJFGiN/tHyUWLrhow4PoS/
         Y5/sEqKtaDjAjrQg15pC2P+P89/czs43ecCTnsgpkV8bax3A4lguGR7beUtUiMSnCch/
         HryyhFKberOe9us9leoU61eeFlrcO3YIXPN7CDO4Vk9Qg+EzuAP9PAthJfxC1DB1KDZi
         eC4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718919699; x=1719524499;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y8U8NBtMm/u2IVD8/kM9yB3umzeKyozmtPIP44s+PjY=;
        b=i9btxbPLfss5BETf9MsGRweXgJXrCFzH1aUIbR1CHLUk8J/8jwx64Cdx+zfN7JPWCE
         qOl4kBTzR2tknQxth+bjlpcv3iz7B6Ucn/ruWF4XXp3cKRrR2QBKTF6Qscdxp+61Ksu0
         u9wolz18+Rq5f8LtD6Ik+bd3BrkNojinGXVtBEwt1HAAbjXacfF+beaInplwoZOWxCrK
         HyLT/wyTgOCaNcd41FJrd2O35WmAjoaNBrkCdGnMQfHqXl7X3lX4rObwoxV9TqNRlb/k
         0mESXQesAiX0BJE9F6BgewLc058MbjiWoD8dQ35U3F4qcqBOCw3Ex1UmWo6JhVMx6/u/
         x44g==
X-Forwarded-Encrypted: i=1; AJvYcCXaA+jWZGbnilNlyz8B8yrFYZBEERAEAXrFLC2SbXoU1ln0rzVwXKlXtUj90jiNVI/V7GJ4UpZHlZ9Kr6v21CgKSGWVt1zCI7X2B+2oE08iZNAeqJ46KnFfw08UZiWPLX/i7jXnMyNaVQ/BsIfa8hmSagL3ii5r6zWQQa/Fbv/g5+OIJ4k=
X-Gm-Message-State: AOJu0Yz27J8uhHCVAHIXBrfKSgtB498fyvPfwrf5u/LlKHCp7kANqmDu
	C/f2GVK2XeJac+hoO4HTOO4kH8XF+VTN9b+R1HJ9yi0nczxIz1eQ6GRMRQ==
X-Google-Smtp-Source: AGHT+IHsvAbpWfMA3+B/I7g4oI+WwGIW+26bofaf8uy/t9lMfPUWhc3jZsW/7FTkiLBfhUSlTqdpVg==
X-Received: by 2002:adf:e508:0:b0:361:93d5:782f with SMTP id ffacd0b85a97d-36316ff8165mr4569354f8f.9.1718919699590;
        Thu, 20 Jun 2024 14:41:39 -0700 (PDT)
Received: from localhost.localdomain (93-34-90-105.ip49.fastwebnet.it. [93.34.90.105])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-366383f68acsm48866f8f.2.2024.06.20.14.41.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 14:41:39 -0700 (PDT)
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
Subject: [PATCH v7 05/20] leds: leds-lp55xx: Generalize load_engine function
Date: Thu, 20 Jun 2024 23:03:21 +0200
Message-ID: <20240620210401.22053-6-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240620210401.22053-1-ansuelsmth@gmail.com>
References: <20240620210401.22053-1-ansuelsmth@gmail.com>
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

Suggested-by: Lee Jones <lee@kernel.org>
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/leds/leds-lp5521.c        | 26 +++---------------------
 drivers/leds/leds-lp5523.c        | 26 +++---------------------
 drivers/leds/leds-lp5562.c        | 24 ++--------------------
 drivers/leds/leds-lp55xx-common.c | 33 ++++++++++++++++++++++++++++++-
 drivers/leds/leds-lp55xx-common.h |  1 +
 drivers/leds/leds-lp8501.c        | 17 ++--------------
 6 files changed, 43 insertions(+), 84 deletions(-)

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
index 2949ea56a170..3461158ad372 100644
--- a/drivers/leds/leds-lp55xx-common.c
+++ b/drivers/leds/leds-lp55xx-common.c
@@ -9,6 +9,7 @@
  * Derived from leds-lp5521.c, leds-lp5523.c
  */
 
+#include <linux/bitfield.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/firmware.h>
@@ -26,8 +27,24 @@
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
@@ -76,6 +93,20 @@ void lp55xx_stop_all_engine(struct lp55xx_chip *chip)
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
2.45.1


