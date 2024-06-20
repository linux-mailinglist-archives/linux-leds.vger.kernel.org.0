Return-Path: <linux-leds+bounces-2084-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C45889114F0
	for <lists+linux-leds@lfdr.de>; Thu, 20 Jun 2024 23:43:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 79BE9281BFD
	for <lists+linux-leds@lfdr.de>; Thu, 20 Jun 2024 21:43:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAE6D1514F5;
	Thu, 20 Jun 2024 21:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cO1NcIZJ"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6108614E2E8;
	Thu, 20 Jun 2024 21:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718919706; cv=none; b=Yv69B+EPVmpzHTpEhnVgo+w8n2MVQ2hebBChmVN8H2CT8PE9KSg2dbKxTjxWZoRWnMJXTIkWh/u5bTQYfgiue1UUILWkzW0AbJcBMU+UUgV8zoGYEO6FQcOtdo/AJStLg42G78ko4Wo/1D3TjJPM2lBQ+L0bcjtyGnLxYYLzDmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718919706; c=relaxed/simple;
	bh=mlZSelBVvZtwuU/2C3qMj1tJdoE+0Svue0obmtqn07c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K6Nk2bGphSGWWrR9Vh3IxZCuE7ZQ/RweB7YP/OQRuMUSbZMBXZ8GNf2W8klc/UDbH+F4ntFg0TlBAfsHznqVNikqrxOYwmo+SoW7K15I0qvzsvsC46nz8gnhRQ5pCoI3cauaEiPY+fgggjvIvRSNcjvgSLw3nck6sfv0+oFhuyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cO1NcIZJ; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-364ff42999eso1007111f8f.3;
        Thu, 20 Jun 2024 14:41:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718919703; x=1719524503; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jHse+1T6WeaJG4+3neoshaVfJI4hAbZOvD4R8BooVmQ=;
        b=cO1NcIZJweBwlwej89S6+pn+Jcs4GgRwbHCQCYyMWy3/lGAhoE/PkktUdW5qNqA4mq
         O9nQWGxd8GVAUuwxVrV16NERdBf6o+TAt1RXjmXLXbSq+TgPhMLCJpzq54pL2IwN8Pvj
         vLSy9xuqyMKcDoXtNadU+PAAbcplnE6DHToZy75LSOKHbG3KUryWqWFFkab1M1zpOHa7
         Olc/Zv33iY3SZxTXBwWHk8K0NjFSD7MkesKZg8d2Htn2ukMGBK0RlZ2CzW7LEuUpObch
         vz0XJ5WLQEe8cR6kPg0havDbOJ9r9wsKIY5CWo1AXDniqG7fi+9rRzSj7lwoR/UEOhZB
         YwRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718919703; x=1719524503;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jHse+1T6WeaJG4+3neoshaVfJI4hAbZOvD4R8BooVmQ=;
        b=f89B9CZoIGl7HUuE/NZYoyBsdVc47R6fl5/T4dAAshnZ1+x1D6WP65NW+UV/fYTCUe
         ZAe+Vl1vgSJBtbSRoGBodQ+115Xj9SOO/yb0CwL099/iQuZz7Mc9WY7Qq33DQqxE0WRK
         4MHewmYKT6zQqvE9UfWUM/8rjoooERD0ESeLScHbXO33P63HpWjg91zMBI5e2w5yxdgi
         YfZsqDlCAy1h2aPOt2hVhe2gDRQTHJahZqzRsVGi3adRIEz9SFlwWZ2qToK8kPVt1qNv
         0XGc8e9nwBQO/dG+1t9UkvqeGn9M493PoZt4kNOljPNQk+AcW/3QolP2WLfZmAMVspyM
         IQIA==
X-Forwarded-Encrypted: i=1; AJvYcCVxUpsz8pFWb7qC5/uvPhYLEWDJQlelwRIp1gla9NCHiAhlvcd7R3BdQGCmv/o7Eb3yQ5bi2/VxELW0DuHhRN/LntGR8Ub/X9h9/t5ym5m7yJE0rfzEbrU6oNznbWvN8NKQHim3yhrFve112tIW9IfhywC7+ikfBQKqzDtl5WWuMkCAzjk=
X-Gm-Message-State: AOJu0YybdfVixGraw2WwQLgKR+Bhf15f5M+TOBpV5EuqA+G8czSd+4xs
	kgzZzpjYCKfT3O8WV3fKvd0RxdH0lr/4Jdw4S3BfNU6+KGABF0Fy
X-Google-Smtp-Source: AGHT+IED8g6wNWdLSHX50sDChtCdEi8LkIpkUVUHTE0ZTyTWvEgWeTNOWV0MCtxc2ps7Yb1xlLkamg==
X-Received: by 2002:a05:6000:12d0:b0:362:721a:fa2 with SMTP id ffacd0b85a97d-36317b83131mr5316479f8f.30.1718919702723;
        Thu, 20 Jun 2024 14:41:42 -0700 (PDT)
Received: from localhost.localdomain (93-34-90-105.ip49.fastwebnet.it. [93.34.90.105])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-366383f68acsm48866f8f.2.2024.06.20.14.41.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 14:41:42 -0700 (PDT)
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
Subject: [PATCH v7 08/20] leds: leds-lp55xx: Generalize update_program_memory function
Date: Thu, 20 Jun 2024 23:03:24 +0200
Message-ID: <20240620210401.22053-9-ansuelsmth@gmail.com>
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


