Return-Path: <linux-leds+bounces-2135-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EF6191868D
	for <lists+linux-leds@lfdr.de>; Wed, 26 Jun 2024 18:02:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B526A1C22561
	for <lists+linux-leds@lfdr.de>; Wed, 26 Jun 2024 16:02:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9459B18FDB6;
	Wed, 26 Jun 2024 16:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OqLjhMzN"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42F8518FC82;
	Wed, 26 Jun 2024 16:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719417642; cv=none; b=sBWPOjfDFTqI3/L24ifT/oOwUfYeDzEjmxv7CKIT03Mzcg0ui+6gLsev/Y8BOn4nP6UloZxBFzNTobt1Uq82qBbmHYMZL1UTezwGH/mm/KAYPCSsXMVi4gGCCelyLZRFyx/iz/Op41MsY2x3k+nzyzHADDk6cjmjYlZnD1Z7p3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719417642; c=relaxed/simple;
	bh=mlZSelBVvZtwuU/2C3qMj1tJdoE+0Svue0obmtqn07c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gwxB4Pv6YeBuXg1Q8tuPjGPPuObSYvxEG+BMJCsVuabql4FsOjeOL6rsJ6JaDsEqxDy0peLhhKxYFPa5+QMHCJj1mQ9LPr+KSsHYDz/ooxLdyBfLO0XYMw1vTdVSKS+7Su4tZwcALx7ehUBNbURDR/MHpJ0q1Yo4QBebFn5s4xs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OqLjhMzN; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3608e6d14b6so4365075f8f.0;
        Wed, 26 Jun 2024 09:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719417639; x=1720022439; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jHse+1T6WeaJG4+3neoshaVfJI4hAbZOvD4R8BooVmQ=;
        b=OqLjhMzNzQeFRdp7jrCr7yVQp9B7X49glrPlAr/WYZXofqoToOfSfL0Ukrjhcm0g7S
         eC3nRUt7+MR/ph0vsw1wJGy8+yKElMTjuIAk9E0MHBzcnG8J1J8G4ZjcP+aNcY8O0MGo
         3lFqebhxF/Lir0ig+gZwlBp5qBSt4ZHfKPrDyKhTlAiTVO0ztrgldt+5PF5QHl210S1v
         l/BAubMo7+2Y6ap0eJmvWDKDSWupKuxZK/slgadjAxoAy+wjS3yL6lMo4SAE8shqwOI6
         eJlIkGornzcFiNpdE5iXBeA8X3vJ5qfDpvpbXhU8NP8rhFuIsQ4F09zQwL8dR4cTdxT8
         4+1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719417639; x=1720022439;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jHse+1T6WeaJG4+3neoshaVfJI4hAbZOvD4R8BooVmQ=;
        b=pzm5/9fMGtrgN81mfSuxTed2Xncz2FOZctrt8Ft6CKvnb6z9xRWEEe/R564F8Xc7jA
         J0AgUmLSwHcvT3w9ckASq5mWG4g2iQRbYbZTzthvBs7aHlBt1hXEN0/xjWO4GKCK6bDa
         +pPcMlRJDrYEvsITKm+AEkkzWqEsv6Je06EKCiTOFnT6N0T5MUWpufYM8UoSYqx2T3LH
         /h47EPrOleWCL6ZuvqDhmh77cT915H2ftH+9J5CFHZWJOfdbQwjB9Z9vjSGF/ZxptHOH
         K4R5g3xxBsSWNyvDIvyKRIYZ8w3c49Ng5j+2/N1dLdYJ4ruBic78GujESz4ldJ84wkgb
         wcQQ==
X-Forwarded-Encrypted: i=1; AJvYcCWLof18n4+GAkaqjHl2b+mDRJ0gm+I8lPxhpVi0pX3MBeDit4NpGIEo6DvZ0Tb2mRqHm+QQAbkKL8Dj4OBu8CgHX7kuQYYu2GENCn30vwacRPvHtpqjI4ZI7D12T8hqaiNJaUEL7qQ1LK/cd8njUNCSeYQEo7Jqpe5tUp367+Yy6nySL48=
X-Gm-Message-State: AOJu0YyXOQqJEt5LZ7yQu5V220PBqcHC0ES7UgwHm6nEBimjwDibkKjO
	yI28TZk+jJARAxyX2wZNgF4ud2Xyp435fADthMs0/g4BH95I7dIp
X-Google-Smtp-Source: AGHT+IE91jqVp46XDBS8xQ0VbFaAg8HSviWji337h8qckIEBKun9GnAWlf8UK9Qru8ZqmXYQrOni0A==
X-Received: by 2002:adf:e649:0:b0:35f:119a:14c7 with SMTP id ffacd0b85a97d-366e965ff49mr6609121f8f.69.1719417638512;
        Wed, 26 Jun 2024 09:00:38 -0700 (PDT)
Received: from localhost.localdomain (93-34-90-105.ip49.fastwebnet.it. [93.34.90.105])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-366389b88easm16180589f8f.39.2024.06.26.09.00.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 09:00:38 -0700 (PDT)
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
Subject: [PATCH v8 08/20] leds: leds-lp55xx: Generalize update_program_memory function
Date: Wed, 26 Jun 2024 18:00:13 +0200
Message-ID: <20240626160027.19703-9-ansuelsmth@gmail.com>
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

LED Driver based on lp55xx all use the same logic to write memory in
SMEM. The only difference is that legacy chip doesn't support pages and
have the engine regs one after another.

To handle this apply the same logic used for load_engine also for
update_program_memory.

Introduce a new config in device_config, base_prog. For LED chip
that doesn't support pages, offset this values of 32 for each engine.

Update all lp55xx based LED driver to use this new function and define
all the required bits.

Suggested-by: Lee Jones <lee@kernel.org>
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/leds/leds-lp5521.c        | 56 +++--------------------------
 drivers/leds/leds-lp5523.c        | 50 +++-----------------------
 drivers/leds/leds-lp5562.c        | 58 +++----------------------------
 drivers/leds/leds-lp55xx-common.c | 57 ++++++++++++++++++++++++++++++
 drivers/leds/leds-lp55xx-common.h |  4 +++
 drivers/leds/leds-lp8501.c        | 52 +++------------------------
 6 files changed, 79 insertions(+), 198 deletions(-)

diff --git a/drivers/leds/leds-lp5521.c b/drivers/leds/leds-lp5521.c
index 0b9f99f4fff2..7ea3e5715f59 100644
--- a/drivers/leds/leds-lp5521.c
+++ b/drivers/leds/leds-lp5521.c
@@ -146,55 +146,6 @@ static void lp5521_run_engine(struct lp55xx_chip *chip, bool start)
 		lp5521_wait_enable_done();
 }
 
-static int lp5521_update_program_memory(struct lp55xx_chip *chip,
-					const u8 *data, size_t size)
-{
-	enum lp55xx_engine_index idx = chip->engine_idx;
-	u8 pattern[LP5521_PROGRAM_LENGTH] = {0};
-	static const u8 addr[] = {
-		[LP55XX_ENGINE_1] = LP5521_REG_R_PROG_MEM,
-		[LP55XX_ENGINE_2] = LP5521_REG_G_PROG_MEM,
-		[LP55XX_ENGINE_3] = LP5521_REG_B_PROG_MEM,
-	};
-	unsigned cmd;
-	char c[3];
-	int nrchars;
-	int ret;
-	int offset = 0;
-	int i = 0;
-
-	while ((offset < size - 1) && (i < LP5521_PROGRAM_LENGTH)) {
-		/* separate sscanfs because length is working only for %s */
-		ret = sscanf(data + offset, "%2s%n ", c, &nrchars);
-		if (ret != 1)
-			goto err;
-
-		ret = sscanf(c, "%2x", &cmd);
-		if (ret != 1)
-			goto err;
-
-		pattern[i] = (u8)cmd;
-		offset += nrchars;
-		i++;
-	}
-
-	/* Each instruction is 16bit long. Check that length is even */
-	if (i % 2)
-		goto err;
-
-	for (i = 0; i < LP5521_PROGRAM_LENGTH; i++) {
-		ret = lp55xx_write(chip, addr[idx] + i, pattern[i]);
-		if (ret)
-			return -EINVAL;
-	}
-
-	return size;
-
-err:
-	dev_err(&chip->cl->dev, "wrong pattern format\n");
-	return -EINVAL;
-}
-
 static void lp5521_firmware_loaded(struct lp55xx_chip *chip)
 {
 	const struct firmware *fw = chip->fw;
@@ -212,7 +163,7 @@ static void lp5521_firmware_loaded(struct lp55xx_chip *chip)
 	 */
 
 	lp55xx_load_engine(chip);
-	lp5521_update_program_memory(chip, fw->data, fw->size);
+	lp55xx_update_program_memory(chip, fw->data, fw->size);
 }
 
 static int lp5521_post_init_device(struct lp55xx_chip *chip)
@@ -389,7 +340,7 @@ static ssize_t store_engine_load(struct device *dev,
 
 	chip->engine_idx = nr;
 	lp55xx_load_engine(chip);
-	ret = lp5521_update_program_memory(chip, buf, len);
+	ret = lp55xx_update_program_memory(chip, buf, len);
 
 	mutex_unlock(&chip->lock);
 
@@ -454,6 +405,9 @@ static struct lp55xx_device_config lp5521_cfg = {
 		.addr = LP5521_REG_ENABLE,
 		.val  = LP5521_ENABLE_DEFAULT,
 	},
+	.prog_mem_base = {
+		.addr = LP5521_REG_R_PROG_MEM,
+	},
 	.max_channel  = LP5521_MAX_LEDS,
 	.post_init_device   = lp5521_post_init_device,
 	.brightness_fn      = lp5521_led_brightness,
diff --git a/drivers/leds/leds-lp5523.c b/drivers/leds/leds-lp5523.c
index b28955b72189..395c57330484 100644
--- a/drivers/leds/leds-lp5523.c
+++ b/drivers/leds/leds-lp5523.c
@@ -254,49 +254,6 @@ static int lp5523_init_program_engine(struct lp55xx_chip *chip)
 	return ret;
 }
 
-static int lp5523_update_program_memory(struct lp55xx_chip *chip,
-					const u8 *data, size_t size)
-{
-	u8 pattern[LP5523_PROGRAM_LENGTH] = {0};
-	unsigned int cmd;
-	char c[3];
-	int nrchars;
-	int ret;
-	int offset = 0;
-	int i = 0;
-
-	while ((offset < size - 1) && (i < LP5523_PROGRAM_LENGTH)) {
-		/* separate sscanfs because length is working only for %s */
-		ret = sscanf(data + offset, "%2s%n ", c, &nrchars);
-		if (ret != 1)
-			goto err;
-
-		ret = sscanf(c, "%2x", &cmd);
-		if (ret != 1)
-			goto err;
-
-		pattern[i] = (u8)cmd;
-		offset += nrchars;
-		i++;
-	}
-
-	/* Each instruction is 16bit long. Check that length is even */
-	if (i % 2)
-		goto err;
-
-	for (i = 0; i < LP5523_PROGRAM_LENGTH; i++) {
-		ret = lp55xx_write(chip, LP5523_REG_PROG_MEM + i, pattern[i]);
-		if (ret)
-			return -EINVAL;
-	}
-
-	return size;
-
-err:
-	dev_err(&chip->cl->dev, "wrong pattern format\n");
-	return -EINVAL;
-}
-
 static void lp5523_firmware_loaded(struct lp55xx_chip *chip)
 {
 	const struct firmware *fw = chip->fw;
@@ -314,7 +271,7 @@ static void lp5523_firmware_loaded(struct lp55xx_chip *chip)
 	 */
 
 	lp55xx_load_engine(chip);
-	lp5523_update_program_memory(chip, fw->data, fw->size);
+	lp55xx_update_program_memory(chip, fw->data, fw->size);
 }
 
 static ssize_t show_engine_mode(struct device *dev,
@@ -496,7 +453,7 @@ static ssize_t store_engine_load(struct device *dev,
 
 	chip->engine_idx = nr;
 	lp55xx_load_engine(chip);
-	ret = lp5523_update_program_memory(chip, buf, len);
+	ret = lp55xx_update_program_memory(chip, buf, len);
 
 	mutex_unlock(&chip->lock);
 
@@ -819,6 +776,9 @@ static struct lp55xx_device_config lp5523_cfg = {
 		.addr = LP5523_REG_ENABLE,
 		.val  = LP5523_ENABLE,
 	},
+	.prog_mem_base = {
+		.addr = LP5523_REG_PROG_MEM,
+	},
 	.pages_per_engine   = LP5523_PAGES_PER_ENGINE,
 	.max_channel  = LP5523_MAX_LEDS,
 	.post_init_device   = lp5523_post_init_device,
diff --git a/drivers/leds/leds-lp5562.c b/drivers/leds/leds-lp5562.c
index fb05439576c3..7f3733fc446e 100644
--- a/drivers/leds/leds-lp5562.c
+++ b/drivers/leds/leds-lp5562.c
@@ -144,59 +144,6 @@ static void lp5562_run_engine(struct lp55xx_chip *chip, bool start)
 		lp5562_wait_enable_done();
 }
 
-static int lp5562_update_firmware(struct lp55xx_chip *chip,
-					const u8 *data, size_t size)
-{
-	enum lp55xx_engine_index idx = chip->engine_idx;
-	u8 pattern[LP5562_PROGRAM_LENGTH] = {0};
-	static const u8 addr[] = {
-		[LP55XX_ENGINE_1] = LP5562_REG_PROG_MEM_ENG1,
-		[LP55XX_ENGINE_2] = LP5562_REG_PROG_MEM_ENG2,
-		[LP55XX_ENGINE_3] = LP5562_REG_PROG_MEM_ENG3,
-	};
-	unsigned cmd;
-	char c[3];
-	int program_size;
-	int nrchars;
-	int offset = 0;
-	int ret;
-	int i;
-
-	/* clear program memory before updating */
-	for (i = 0; i < LP5562_PROGRAM_LENGTH; i++)
-		lp55xx_write(chip, addr[idx] + i, 0);
-
-	i = 0;
-	while ((offset < size - 1) && (i < LP5562_PROGRAM_LENGTH)) {
-		/* separate sscanfs because length is working only for %s */
-		ret = sscanf(data + offset, "%2s%n ", c, &nrchars);
-		if (ret != 1)
-			goto err;
-
-		ret = sscanf(c, "%2x", &cmd);
-		if (ret != 1)
-			goto err;
-
-		pattern[i] = (u8)cmd;
-		offset += nrchars;
-		i++;
-	}
-
-	/* Each instruction is 16bit long. Check that length is even */
-	if (i % 2)
-		goto err;
-
-	program_size = i;
-	for (i = 0; i < program_size; i++)
-		lp55xx_write(chip, addr[idx] + i, pattern[i]);
-
-	return 0;
-
-err:
-	dev_err(&chip->cl->dev, "wrong pattern format\n");
-	return -EINVAL;
-}
-
 static void lp5562_firmware_loaded(struct lp55xx_chip *chip)
 {
 	const struct firmware *fw = chip->fw;
@@ -218,7 +165,7 @@ static void lp5562_firmware_loaded(struct lp55xx_chip *chip)
 	 */
 
 	lp55xx_load_engine(chip);
-	lp5562_update_firmware(chip, fw->data, fw->size);
+	lp55xx_update_program_memory(chip, fw->data, fw->size);
 }
 
 static int lp5562_post_init_device(struct lp55xx_chip *chip)
@@ -450,6 +397,9 @@ static struct lp55xx_device_config lp5562_cfg = {
 		.addr = LP5562_REG_ENABLE,
 		.val  = LP5562_ENABLE_DEFAULT,
 	},
+	.prog_mem_base = {
+		.addr = LP5562_REG_PROG_MEM_ENG1,
+	},
 	.post_init_device   = lp5562_post_init_device,
 	.set_led_current    = lp5562_set_led_current,
 	.brightness_fn      = lp5562_led_brightness,
diff --git a/drivers/leds/leds-lp55xx-common.c b/drivers/leds/leds-lp55xx-common.c
index 9830df285b96..8c20d7b4bc82 100644
--- a/drivers/leds/leds-lp55xx-common.c
+++ b/drivers/leds/leds-lp55xx-common.c
@@ -27,6 +27,8 @@
 /* OP MODE require at least 153 us to clear regs */
 #define LP55XX_CMD_SLEEP		200
 
+#define LP55xx_PROGRAM_LENGTH		32
+
 /*
  * Program Memory Operations
  * Same Mask for each engine for both mode and exec
@@ -160,6 +162,61 @@ int lp55xx_run_engine_common(struct lp55xx_chip *chip)
 }
 EXPORT_SYMBOL_GPL(lp55xx_run_engine_common);
 
+int lp55xx_update_program_memory(struct lp55xx_chip *chip,
+				 const u8 *data, size_t size)
+{
+	enum lp55xx_engine_index idx = chip->engine_idx;
+	const struct lp55xx_device_config *cfg = chip->cfg;
+	u8 pattern[LP55xx_PROGRAM_LENGTH] = { };
+	u8 start_addr = cfg->prog_mem_base.addr;
+	int i = 0, offset = 0;
+	int ret;
+
+	while ((offset < size - 1) && (i < LP55xx_PROGRAM_LENGTH)) {
+		unsigned int cmd;
+		int nrchars;
+		char c[3];
+
+		/* separate sscanfs because length is working only for %s */
+		ret = sscanf(data + offset, "%2s%n ", c, &nrchars);
+		if (ret != 1)
+			goto err;
+
+		ret = sscanf(c, "%2x", &cmd);
+		if (ret != 1)
+			goto err;
+
+		pattern[i] = (u8)cmd;
+		offset += nrchars;
+		i++;
+	}
+
+	/* Each instruction is 16bit long. Check that length is even */
+	if (i % 2)
+		goto err;
+
+	/*
+	 * For legacy LED chip with no page support, engine base address are
+	 * one after another at offset of 32.
+	 * For LED chip that support page, PAGE is already set in load_engine.
+	 */
+	if (!cfg->pages_per_engine)
+		start_addr += LP55xx_PROGRAM_LENGTH * idx;
+
+	for (i = 0; i < LP55xx_PROGRAM_LENGTH; i++) {
+		ret = lp55xx_write(chip, start_addr + i, pattern[i]);
+		if (ret)
+			return -EINVAL;
+	}
+
+	return size;
+
+err:
+	dev_err(&chip->cl->dev, "wrong pattern format\n");
+	return -EINVAL;
+}
+EXPORT_SYMBOL_GPL(lp55xx_update_program_memory);
+
 static void lp55xx_reset_device(struct lp55xx_chip *chip)
 {
 	const struct lp55xx_device_config *cfg = chip->cfg;
diff --git a/drivers/leds/leds-lp55xx-common.h b/drivers/leds/leds-lp55xx-common.h
index dd74b214ec74..f0bbd41fdab3 100644
--- a/drivers/leds/leds-lp55xx-common.h
+++ b/drivers/leds/leds-lp55xx-common.h
@@ -99,6 +99,7 @@ struct lp55xx_reg {
  *			 (if not supported 153 us sleep)
  * @reset              : Chip specific reset command
  * @enable             : Chip specific enable command
+ * @prog_mem_base      : Chip specific base reg address for chip SMEM programming
  * @pages_per_engine   : Assigned pages for each engine
  *                       (if not set chip doesn't support pages)
  * @max_channel        : Maximum number of channels
@@ -116,6 +117,7 @@ struct lp55xx_device_config {
 	const struct lp55xx_reg engine_busy; /* addr, mask */
 	const struct lp55xx_reg reset;
 	const struct lp55xx_reg enable;
+	const struct lp55xx_reg prog_mem_base;
 	const int pages_per_engine;
 	const int max_channel;
 
@@ -208,6 +210,8 @@ extern bool lp55xx_is_extclk_used(struct lp55xx_chip *chip);
 extern void lp55xx_stop_all_engine(struct lp55xx_chip *chip);
 extern void lp55xx_load_engine(struct lp55xx_chip *chip);
 extern int lp55xx_run_engine_common(struct lp55xx_chip *chip);
+extern int lp55xx_update_program_memory(struct lp55xx_chip *chip,
+					const u8 *data, size_t size);
 
 /* common probe/remove function */
 extern int lp55xx_probe(struct i2c_client *client);
diff --git a/drivers/leds/leds-lp8501.c b/drivers/leds/leds-lp8501.c
index 47b30e9d04a2..d4094d20bdc1 100644
--- a/drivers/leds/leds-lp8501.c
+++ b/drivers/leds/leds-lp8501.c
@@ -137,53 +137,6 @@ static void lp8501_run_engine(struct lp55xx_chip *chip, bool start)
 	lp55xx_run_engine_common(chip);
 }
 
-static int lp8501_update_program_memory(struct lp55xx_chip *chip,
-					const u8 *data, size_t size)
-{
-	u8 pattern[LP8501_PROGRAM_LENGTH] = {0};
-	unsigned cmd;
-	char c[3];
-	int update_size;
-	int nrchars;
-	int offset = 0;
-	int ret;
-	int i;
-
-	/* clear program memory before updating */
-	for (i = 0; i < LP8501_PROGRAM_LENGTH; i++)
-		lp55xx_write(chip, LP8501_REG_PROG_MEM + i, 0);
-
-	i = 0;
-	while ((offset < size - 1) && (i < LP8501_PROGRAM_LENGTH)) {
-		/* separate sscanfs because length is working only for %s */
-		ret = sscanf(data + offset, "%2s%n ", c, &nrchars);
-		if (ret != 1)
-			goto err;
-
-		ret = sscanf(c, "%2x", &cmd);
-		if (ret != 1)
-			goto err;
-
-		pattern[i] = (u8)cmd;
-		offset += nrchars;
-		i++;
-	}
-
-	/* Each instruction is 16bit long. Check that length is even */
-	if (i % 2)
-		goto err;
-
-	update_size = i;
-	for (i = 0; i < update_size; i++)
-		lp55xx_write(chip, LP8501_REG_PROG_MEM + i, pattern[i]);
-
-	return 0;
-
-err:
-	dev_err(&chip->cl->dev, "wrong pattern format\n");
-	return -EINVAL;
-}
-
 static void lp8501_firmware_loaded(struct lp55xx_chip *chip)
 {
 	const struct firmware *fw = chip->fw;
@@ -201,7 +154,7 @@ static void lp8501_firmware_loaded(struct lp55xx_chip *chip)
 	 */
 
 	lp55xx_load_engine(chip);
-	lp8501_update_program_memory(chip, fw->data, fw->size);
+	lp55xx_update_program_memory(chip, fw->data, fw->size);
 }
 
 static int lp8501_led_brightness(struct lp55xx_led *led)
@@ -237,6 +190,9 @@ static struct lp55xx_device_config lp8501_cfg = {
 		.addr = LP8501_REG_ENABLE,
 		.val  = LP8501_ENABLE,
 	},
+	.prog_mem_base = {
+		.addr = LP8501_REG_PROG_MEM,
+	},
 	.pages_per_engine   = LP8501_PAGES_PER_ENGINE,
 	.max_channel  = LP8501_MAX_LEDS,
 	.post_init_device   = lp8501_post_init_device,
-- 
2.45.1


