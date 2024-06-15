Return-Path: <linux-leds+bounces-1938-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 34632909A6E
	for <lists+linux-leds@lfdr.de>; Sun, 16 Jun 2024 01:14:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A25B9282851
	for <lists+linux-leds@lfdr.de>; Sat, 15 Jun 2024 23:14:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9EAC12B143;
	Sat, 15 Jun 2024 23:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vn15l0Iv"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60E43757F0;
	Sat, 15 Jun 2024 23:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718493181; cv=none; b=DKNPqmHyTJxELc/TiGVQJorQLzZDyQtbvTEeFh2ZJbvn9t3k6012esvjFVaE7jATRpIPyfXs20z/hBZxrMTnpEXzGM47jVfUwDkrbMgntlMGhycQs9OBbYc5yLDNz6sh04DaxiP1aLu32ND25oZmIQkpQafBq1VL/wAURfN438E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718493181; c=relaxed/simple;
	bh=jpvVBinjL8elz0QeGVnppBN3OzVoAOQIVXhAfL4l4Ps=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gW9T682rIamn3X2awHyOcZqkRhCYXm+v9wgvQphuR1gqAIuQudkLpQdPK3srec2OKwIw3JnTtxUGTSu/2neZpaPz0SMC4sFgdRIpRYlz9bwj67RayPFvFE5loV/XgO5JnaN6u0uT80Kkvm+aYezYL069XyX8NnHWLrjcijOy0DY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vn15l0Iv; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-35f27eed98aso2722433f8f.2;
        Sat, 15 Jun 2024 16:12:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718493178; x=1719097978; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vMFwm7/QZL9Sy2AQL6wNOzbSx3Ekmm89kZ4tXsz7YGs=;
        b=Vn15l0Iv+u/vO0NbhEdWDdpxNM5lPEgMjFu4dtxNQ9CXOiNROfOmyIHK13vRBbgf4H
         q0P8HIjUdz0ylCc08gcgi7zj8wtOafuhjsYuffg/8SM4h8Y78bNOm09sFYT0U+96ageB
         RJsO2BoLm0yUVhQu9wKUEBhqOslo+lPl5wBdD4miChAe9qx4edZz6LLQ8VSXimezI5Nm
         3zSKMOLLy208sTjo3zTo//ajVi1R1KWzwuA3D4aTOSv2i9nyITxXx+3pFx39UCq8hf2a
         VhlPIB+QMYj+ScX3UnpFvudoeadaxIheYeB1Fh3W2UPoZPEJOlvYyucr20miDPyOgY4q
         pCvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718493178; x=1719097978;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vMFwm7/QZL9Sy2AQL6wNOzbSx3Ekmm89kZ4tXsz7YGs=;
        b=eno2UswUO1J5aLNMi+RvLSQEm0+s+2gFxw32SYINIheIA/vRVH5MBtyyJLziZM5JwQ
         QoSV+cyO2nLd5AbrrjbDAXmJwrFQsxAdh7iHoLjKNY6OS4PyHvhTi8Z90l8DFiOi/SoE
         0rkl9DVwxvW97nWwVVMACGQ1qSd4ECAMRfKYAOT3Q1+vGf9GuhbPhoPXYTCd+jZxjuxv
         gcJCA7WjYxggU30Iv6xghzFI1mUsLFWRHk05q0x7/hddJ3OELw2Smj/atQn4/DGkqnpi
         rDxUSaEF+xFTL+px0SqZ4DDuMWjzh38wxA5OPLHI2fqfAAbYCpaIp3yJxW4MO+av+cL7
         8R0g==
X-Forwarded-Encrypted: i=1; AJvYcCV2V/oEtpzji4G+CWNCf1Czjprs5+0Hlm1tLmPZNhBMfK10kvuvQhpl6buL6xb+imNvtMh/IGBEbylN97fxAGVqbU1NYc2AzvDsg3gLr2IkOxvjZQ8l0eP0gdMl+Qr1GyKbrBUknLWTxl7eQ+tghGyJljMrAMVdKplmxODso2eqbnwZPqQ=
X-Gm-Message-State: AOJu0Yxxx60gVlPlISaS/3rMELxU0dHk3aXjd1/dNVsUpNG9ouwZXs3i
	2eZtgCV9Zj5VvhJ1MQdDlHJTts1CJTpVGXyt9EUPCsYlwl2eEG/u
X-Google-Smtp-Source: AGHT+IEd3fJu/LlQEoPSSPQFqcWODjkaR43WHJ+V4HOU1ONSOFkHGm/XUFcw85oxFMIjG9YOObLu6A==
X-Received: by 2002:a05:6000:188d:b0:360:82c7:f07f with SMTP id ffacd0b85a97d-36082c7f5dbmr3254125f8f.57.1718493177610;
        Sat, 15 Jun 2024 16:12:57 -0700 (PDT)
Received: from localhost.localdomain (93-34-90-105.ip49.fastwebnet.it. [93.34.90.105])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3607509355dsm8145532f8f.13.2024.06.15.16.12.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Jun 2024 16:12:57 -0700 (PDT)
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
Subject: [PATCH v5 08/20] leds: leds-lp55xx: generalize update_program_memory function
Date: Sun, 16 Jun 2024 01:11:38 +0200
Message-ID: <20240615231152.28201-9-ansuelsmth@gmail.com>
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

LED Driver based on lp55xx all use the same logic to write memory in
SMEM. The only difference is that legacy chip doesn't support pages and
have the engine regs one after another.

To handle this apply the same logic used for load_engine also for
update_program_memory.

Introduce a new config in device_config, base_prog. For LED chip
that doesn't support pages, offset this values of 32 for each engine.

Update all lp55xx based LED driver to use this new function and define
all the required bits.

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
index 9c2e3b2c72fb..9f060b412435 100644
--- a/drivers/leds/leds-lp55xx-common.c
+++ b/drivers/leds/leds-lp55xx-common.c
@@ -26,6 +26,8 @@
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
2.43.0


