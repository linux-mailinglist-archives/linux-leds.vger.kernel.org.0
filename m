Return-Path: <linux-leds+bounces-1966-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 75C9D90A01E
	for <lists+linux-leds@lfdr.de>; Sun, 16 Jun 2024 23:56:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7CDC21C2107C
	for <lists+linux-leds@lfdr.de>; Sun, 16 Jun 2024 21:56:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E613978C96;
	Sun, 16 Jun 2024 21:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PyoURJBU"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A0A16CDB1;
	Sun, 16 Jun 2024 21:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718574956; cv=none; b=RRaLnKcXJwKmE4bzuLFjhCL2ID5xECLuZ3j03bLrb15lT2V1/IUZbrYY7fUv88GBdpzKZMQmZfs5NAM4y6+VhipLRFBUXefa4Mbb62A3L+XoU2tIXYrC+ePLfJwmK0S5+ynkg4LYNFJvLGkI+PfCq90PVDG7ZU5lvhXqLKWb+pg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718574956; c=relaxed/simple;
	bh=ofm1/aqbQ8vyZsai7B92L51HhpZdqT6diDCk8mc9/HE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bGyXUJNXlRZjMwzLOALTv7/UfeyExH1wDtH+DPy/e1CVB3tSnj5bZhV+ebof7pTz63EwaNl7HDv5rfN5U61WfcuuYZZ83HBqyawlsRJOT8zfPohoGDQ5ofVxMwTERVcr6gO6vgc0/GiMqFiyZGkGhFpb+rdDgGMya0Fef3vyrU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PyoURJBU; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-35dc9cef36dso3459185f8f.3;
        Sun, 16 Jun 2024 14:55:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718574953; x=1719179753; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y4N1QzuzwTokHn8cBWRXHr0MFuy3qvLg8M7dbWmQS14=;
        b=PyoURJBU0ZnS9i0h8GSl9F7Abgo7QaMwvxG/bqzboVLN2tYrzCLL6zccMChEijWFkX
         HJTTieGrwKDnhW9xJvdOx1w2H3aNGbwb45HkH23e/0akDNufNckNzgagSg3Kt4bL/P0F
         ZIJaDEccrQaQ4h41w0dR6hT5k1l5tQMob9PyNfEt+67Q3KLBF/AVPTWRTtk4E39K77+E
         6Iryl7bp/kg0AULOZZSI1qMbjTACI7NhAm8+dmcL+7SeXl9bYU7c2WeqCXKhPhnt8Iig
         dzDSI9JxuT6e38NgNZMpspJmIwxrOjBEugwum+uV7ZElVoKKt2pmZ1Hfk4d6egZBdeNJ
         Ubbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718574953; x=1719179753;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y4N1QzuzwTokHn8cBWRXHr0MFuy3qvLg8M7dbWmQS14=;
        b=bBzbWjCYg/LrYDqHiYb3exOG6J+OVOTlT/uBKtq++Df2ez5VIt05C0ZmP/RXa/dqRZ
         4ZwBFZR0uTN5zM38dK/WnUM6NZ8/OnnuVg3tqNYGxi84Zq+RHWAWi65vbt+PTj2IChUo
         s2vTjT93YJHTcu8cCpUMoaRnVIvOjKegiUR6yJViHo5eSNBvG+vgNaIByzK+VgMFC+sj
         v+Gqhy+InZAsrDBOztyagJY/XC1HcsP7RIKmB3ynnjOq4FJHv7l7Ym39OqSa/vfApmNt
         FvZGzPtKsWVA8kcyzT3Og0Iwzu4znwfm/69E+lYrCumem3kpnnhY6R4kY9Bm3lYphlkb
         CjDw==
X-Forwarded-Encrypted: i=1; AJvYcCW28f7uv8NM9rIMpjAEfxrcV5lWXFzkabGQtGcWGQqN3THHVqpoy6juElhGXZ7r0Y+/DaLVIXsDpda5sAKU6YKchbSip5AAD/t2NWU2ZiQjW5qUJ5y4PAfMmbyXmIZapHlwMqG6Oel+AzvTJtqTS+tczUmcbvZ2HcxhWZ4eBPb8VlRzXqk=
X-Gm-Message-State: AOJu0YzeimHax6sKqVpwp+LIrkcP2ZIdMPtjoytLhVOOBRF7GVplXqpv
	Vg4ir1tRdgl8kkfUsbkG5/4fK2cC1slMIidD0XADO1EcuoKYdvCO
X-Google-Smtp-Source: AGHT+IHd+xrJwbuOIV+bwfkNuunqhoJ2y711quJGp4yOiyv6HQEugqt5+WAeaS6KDt9JUkkDXwFjOQ==
X-Received: by 2002:adf:cd8c:0:b0:360:791c:aff0 with SMTP id ffacd0b85a97d-3607a72039cmr5853072f8f.8.1718574953315;
        Sun, 16 Jun 2024 14:55:53 -0700 (PDT)
Received: from localhost.localdomain (93-34-90-105.ip49.fastwebnet.it. [93.34.90.105])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-36075104b74sm10362879f8f.107.2024.06.16.14.55.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Jun 2024 14:55:52 -0700 (PDT)
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
Subject: [PATCH v6 06/20] leds: leds-lp55xx: generalize load_engine_and_select_page function
Date: Sun, 16 Jun 2024 23:52:05 +0200
Message-ID: <20240616215226.2112-7-ansuelsmth@gmail.com>
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

Generalize load_engine_and_select_page by reworking the implementation
and making it part of the generic load_engine function.

Add a new option in device_config, pages_per_engine used to define pages
assigned to each engine. With this option set, it's assumed LED chip
supports pages and load_engine will correctly setup the write page.

An equal amount of pages is assigned to each engine and they are
assigned from page 0.

Update any lp55xx based LED driver to define the option and use the new
function.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/leds/leds-lp5523.c        | 22 +++++-----------------
 drivers/leds/leds-lp55xx-common.c | 10 ++++++++++
 drivers/leds/leds-lp55xx-common.h |  3 +++
 drivers/leds/leds-lp8501.c        | 19 +++----------------
 4 files changed, 21 insertions(+), 33 deletions(-)

diff --git a/drivers/leds/leds-lp5523.c b/drivers/leds/leds-lp5523.c
index 086b4d8975a4..8dabd5814110 100644
--- a/drivers/leds/leds-lp5523.c
+++ b/drivers/leds/leds-lp5523.c
@@ -30,6 +30,7 @@
  * 0x40 engine 2 muxing info
  * 0x50 engine 3 muxing info
  */
+#define LP5523_PAGES_PER_ENGINE		1
 #define LP5523_MAX_LEDS			9
 
 /* Registers */
@@ -159,20 +160,6 @@ static int lp5523_post_init_device(struct lp55xx_chip *chip)
 	return lp5523_init_program_engine(chip);
 }
 
-static void lp5523_load_engine_and_select_page(struct lp55xx_chip *chip)
-{
-	enum lp55xx_engine_index idx = chip->engine_idx;
-	static const u8 page_sel[] = {
-		[LP55XX_ENGINE_1] = LP5523_PAGE_ENG1,
-		[LP55XX_ENGINE_2] = LP5523_PAGE_ENG2,
-		[LP55XX_ENGINE_3] = LP5523_PAGE_ENG3,
-	};
-
-	lp55xx_load_engine(chip);
-
-	lp55xx_write(chip, LP5523_REG_PROG_PAGE_SEL, page_sel[idx]);
-}
-
 static void lp5523_stop_engine(struct lp55xx_chip *chip)
 {
 	enum lp55xx_engine_index idx = chip->engine_idx;
@@ -272,7 +259,7 @@ static int lp5523_init_program_engine(struct lp55xx_chip *chip)
 	/* write LED MUX address space for each engine */
 	for (i = LP55XX_ENGINE_1; i <= LP55XX_ENGINE_3; i++) {
 		chip->engine_idx = i;
-		lp5523_load_engine_and_select_page(chip);
+		lp55xx_load_engine(chip);
 
 		for (j = 0; j < LP5523_PROGRAM_LENGTH; j++) {
 			ret = lp55xx_write(chip, LP5523_REG_PROG_MEM + j,
@@ -362,7 +349,7 @@ static void lp5523_firmware_loaded(struct lp55xx_chip *chip)
 	 *  2) write firmware data into program memory
 	 */
 
-	lp5523_load_engine_and_select_page(chip);
+	lp55xx_load_engine(chip);
 	lp5523_update_program_memory(chip, fw->data, fw->size);
 }
 
@@ -544,7 +531,7 @@ static ssize_t store_engine_load(struct device *dev,
 	mutex_lock(&chip->lock);
 
 	chip->engine_idx = nr;
-	lp5523_load_engine_and_select_page(chip);
+	lp55xx_load_engine(chip);
 	ret = lp5523_update_program_memory(chip, buf, len);
 
 	mutex_unlock(&chip->lock);
@@ -865,6 +852,7 @@ static struct lp55xx_device_config lp5523_cfg = {
 		.addr = LP5523_REG_ENABLE,
 		.val  = LP5523_ENABLE,
 	},
+	.pages_per_engine   = LP5523_PAGES_PER_ENGINE,
 	.max_channel  = LP5523_MAX_LEDS,
 	.post_init_device   = lp5523_post_init_device,
 	.brightness_fn      = lp5523_led_brightness,
diff --git a/drivers/leds/leds-lp55xx-common.c b/drivers/leds/leds-lp55xx-common.c
index b5a5ba7c80e4..fd94dc708951 100644
--- a/drivers/leds/leds-lp55xx-common.c
+++ b/drivers/leds/leds-lp55xx-common.c
@@ -46,6 +46,11 @@
 #define   LP55xx_MODE_ENGn_GET(n, mode, shift)        \
 	(((mode) >> LP55xx_MODE_ENGn_SHIFT(n, shift)) & LP55xx_MODE_ENG_MASK)
 
+/* Memory Page Selection */
+#define LP55xx_REG_PROG_PAGE_SEL	0x4f
+/* If supported, each ENGINE have an equal amount of pages offset from page 0 */
+#define LP55xx_PAGE_OFFSET(n, pages)	(((n) - 1) * (pages))
+
 /* External clock rate */
 #define LP55XX_CLK_32K			32768
 
@@ -106,6 +111,11 @@ void lp55xx_load_engine(struct lp55xx_chip *chip)
 
 	lp55xx_update_bits(chip, cfg->reg_op_mode.addr, mask, val);
 	lp55xx_wait_opmode_done(chip);
+
+	/* Setup PAGE if supported (pages_per_engine not 0)*/
+	if (cfg->pages_per_engine)
+		lp55xx_write(chip, LP55xx_REG_PROG_PAGE_SEL,
+			     LP55xx_PAGE_OFFSET(idx, cfg->pages_per_engine));
 }
 EXPORT_SYMBOL_GPL(lp55xx_load_engine);
 
diff --git a/drivers/leds/leds-lp55xx-common.h b/drivers/leds/leds-lp55xx-common.h
index bb146bcecdcf..015ac2ef4e4d 100644
--- a/drivers/leds/leds-lp55xx-common.h
+++ b/drivers/leds/leds-lp55xx-common.h
@@ -99,6 +99,8 @@ struct lp55xx_reg {
  *			 (if not supported 153 us sleep)
  * @reset              : Chip specific reset command
  * @enable             : Chip specific enable command
+ * @pages_per_engine   : Assigned pages for each engine
+ *                       (if not set chip doesn't support pages)
  * @max_channel        : Maximum number of channels
  * @post_init_device   : Chip specific initialization code
  * @brightness_fn      : Brightness function
@@ -113,6 +115,7 @@ struct lp55xx_device_config {
 	const struct lp55xx_reg engine_busy; /* addr, mask */
 	const struct lp55xx_reg reset;
 	const struct lp55xx_reg enable;
+	const int pages_per_engine;
 	const int max_channel;
 
 	/* define if the device has specific initialization process */
diff --git a/drivers/leds/leds-lp8501.c b/drivers/leds/leds-lp8501.c
index 04173d6875af..abe2c4b213d7 100644
--- a/drivers/leds/leds-lp8501.c
+++ b/drivers/leds/leds-lp8501.c
@@ -21,6 +21,7 @@
 #include "leds-lp55xx-common.h"
 
 #define LP8501_PROGRAM_LENGTH		32
+#define LP8501_PAGES_PER_ENGINE		1
 #define LP8501_MAX_LEDS			9
 
 /* Registers */
@@ -116,21 +117,6 @@ static int lp8501_post_init_device(struct lp55xx_chip *chip)
 				LP8501_PWR_CONFIG_M, chip->pdata->pwr_sel);
 }
 
-static void lp8501_load_engine(struct lp55xx_chip *chip)
-{
-	enum lp55xx_engine_index idx = chip->engine_idx;
-
-	static const u8 page_sel[] = {
-		[LP55XX_ENGINE_1] = LP8501_PAGE_ENG1,
-		[LP55XX_ENGINE_2] = LP8501_PAGE_ENG2,
-		[LP55XX_ENGINE_3] = LP8501_PAGE_ENG3,
-	};
-
-	lp55xx_load_engine(chip);
-
-	lp55xx_write(chip, LP8501_REG_PROG_PAGE_SEL, page_sel[idx]);
-}
-
 static void lp8501_turn_off_channels(struct lp55xx_chip *chip)
 {
 	int i;
@@ -250,7 +236,7 @@ static void lp8501_firmware_loaded(struct lp55xx_chip *chip)
 	 *  2) write firmware data into program memory
 	 */
 
-	lp8501_load_engine(chip);
+	lp55xx_load_engine(chip);
 	lp8501_update_program_memory(chip, fw->data, fw->size);
 }
 
@@ -284,6 +270,7 @@ static struct lp55xx_device_config lp8501_cfg = {
 		.addr = LP8501_REG_ENABLE,
 		.val  = LP8501_ENABLE,
 	},
+	.pages_per_engine   = LP8501_PAGES_PER_ENGINE,
 	.max_channel  = LP8501_MAX_LEDS,
 	.post_init_device   = lp8501_post_init_device,
 	.brightness_fn      = lp8501_led_brightness,
-- 
2.43.0


