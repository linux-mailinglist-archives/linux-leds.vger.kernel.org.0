Return-Path: <linux-leds+bounces-1969-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 95F6790A029
	for <lists+linux-leds@lfdr.de>; Sun, 16 Jun 2024 23:57:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E7A5EB20E16
	for <lists+linux-leds@lfdr.de>; Sun, 16 Jun 2024 21:57:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B4CF132464;
	Sun, 16 Jun 2024 21:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fGgHFdiV"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 277DB823B8;
	Sun, 16 Jun 2024 21:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718574960; cv=none; b=uaVxDBAQ2bXKD9cBftVp7uWtHMCj7tACMGWHBpMO01U9uf3mZAyzvVH5APNlroyFX+w0dJecZ2Pafbbc5nIxrE7cUsn5mCONeK9D7DUJox6IOvnLPyp+YiQA/fkBCb9LSng1wNjhWmM6CX4lWJGq9VHb9q4ajFUSJg1/g0raL1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718574960; c=relaxed/simple;
	bh=bnl290XGZYqO8ztY5+G526Zwykn8scPJDBZ0edmP3ZE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mYIvtMb9g/UXshT7878bk9VKPYbhpcxKaxnPbkuLAWYku3JF638sSP961P+lAyu8UZGcYX57E5YH8o6uRWlMs/nB34Nvt2B0NVAzVNxdHFSG8M3j/wVj7RjDqMcIZHkC0PY77SGaGOS+jm0ixuBkzRh04UDNWgqmSjtKFVq7H/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fGgHFdiV; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-421757d217aso39742165e9.3;
        Sun, 16 Jun 2024 14:55:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718574956; x=1719179756; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cEvkLcIYgsDALWTdvTjXUcvNQL2R6iR0aKcWCRBg8Pc=;
        b=fGgHFdiVWHYjkMQW7T5qgy/TEVG4F+hkVp5JtY249xtgzOBrK/UKUaMBmsuAtNDeNN
         bVbXhXQUpn73o56m57jmEcVthHemRJmo3/raSWPtZZwNgrRTG+rolw1oBakNXiX4mjCA
         Qsh6SyHkxOgl5DdeRxH1xZInn0XGRhq/VgHqeb5Q5iP+O7ut2zfIc0j4zLrGUbmZUj02
         TfpUdPUF3ZcETpuYyh8/Ku94ffAp7RxQf5d1sMXCwgWNOkdWO0IdDGCJxevCtjoNsjw+
         ldvD1rPUByXphp+H+LTy5EVrbveQC4gU5MFZf/GBPZ1QhGtYcvDO2pvKQBDbz9/Rp3wb
         Kl+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718574956; x=1719179756;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cEvkLcIYgsDALWTdvTjXUcvNQL2R6iR0aKcWCRBg8Pc=;
        b=PsX+BXfSjWNcLaqGG7nQGoUgy4bErKxnQowK5nwJcNcd+KAmttulKmULpdA8IpzPyT
         e8is0IWb4C8SBStCAWve5zP9Tz2rwHSHWwK7lYK0h5f31stkPvqYFxj5Pcm0OPV9s7dM
         hDh+FXHE3rpxgSXStV+R56At4CQEHxwiBmeKdB4bnoaDSkWU6mTYdkiMRSZpzLsUl1TU
         LDA+Ergbzye86i6e2iyK093YDGAvqNUrYPBoMKO7TusInAMVkEJM2ijs3xU8pAeg1ljm
         2jdmWhBJFuYpZYT5T/zeMkV0KOgVni4WHgqS1uGVqRoZr2sYhaAmnx9cdkpB8rXezfzZ
         P6Tg==
X-Forwarded-Encrypted: i=1; AJvYcCXjEyJdyC1YTLQuEwrEqvlSXWHD5ojrp87RETwjLFiAv5e2fOegRPjjABXiTHZ108OG/0kSs/T+4EiL5AWr/hyxhT/KvhjJWAPR6G5zuAXt/a2oQKqathPQy8YTSrZxkI3qKXMI0HXTj6SfyI06lOHwHOd1POIrcidMk3X07bqh9nCbm80=
X-Gm-Message-State: AOJu0YxA5Rs1dNfej3VaG0j+wd5SOHtkkg3EnaGXApp5Zd7tvVX60MNg
	1MbvC9VI9csLRNKljvzlWxdTXiVXv4zFerDrpG4sI4hdotNtJYhh
X-Google-Smtp-Source: AGHT+IGdcPPEFyQw170Ym8E0ZHh2zjgUxn3FyqBDh7U8AKTyX0dwD3B/fmNxmkhQCdKd3AM6KpL/3g==
X-Received: by 2002:a05:600c:5250:b0:421:dd8c:35a3 with SMTP id 5b1f17b1804b1-42304844c00mr94336475e9.26.1718574956520;
        Sun, 16 Jun 2024 14:55:56 -0700 (PDT)
Received: from localhost.localdomain (93-34-90-105.ip49.fastwebnet.it. [93.34.90.105])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-36075104b74sm10362879f8f.107.2024.06.16.14.55.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Jun 2024 14:55:56 -0700 (PDT)
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
Subject: [PATCH v6 09/20] leds: leds-lp55xx: generalize firmware_loaded function
Date: Sun, 16 Jun 2024 23:52:08 +0200
Message-ID: <20240616215226.2112-10-ansuelsmth@gmail.com>
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

Generalize firmware_loaded function as lp55xx based LED driver all share
the same logic.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/leds/leds-lp5521.c        | 22 +---------------------
 drivers/leds/leds-lp5523.c        | 22 +---------------------
 drivers/leds/leds-lp5562.c        | 26 +-------------------------
 drivers/leds/leds-lp55xx-common.c | 25 +++++++++++++++++++++++++
 drivers/leds/leds-lp55xx-common.h |  1 +
 drivers/leds/leds-lp8501.c        | 22 +---------------------
 6 files changed, 30 insertions(+), 88 deletions(-)

diff --git a/drivers/leds/leds-lp5521.c b/drivers/leds/leds-lp5521.c
index 7ea3e5715f59..722b5cd9236e 100644
--- a/drivers/leds/leds-lp5521.c
+++ b/drivers/leds/leds-lp5521.c
@@ -146,26 +146,6 @@ static void lp5521_run_engine(struct lp55xx_chip *chip, bool start)
 		lp5521_wait_enable_done();
 }
 
-static void lp5521_firmware_loaded(struct lp55xx_chip *chip)
-{
-	const struct firmware *fw = chip->fw;
-
-	if (fw->size > LP5521_PROGRAM_LENGTH) {
-		dev_err(&chip->cl->dev, "firmware data size overflow: %zu\n",
-			fw->size);
-		return;
-	}
-
-	/*
-	 * Program memory sequence
-	 *  1) set engine mode to "LOAD"
-	 *  2) write firmware data into program memory
-	 */
-
-	lp55xx_load_engine(chip);
-	lp55xx_update_program_memory(chip, fw->data, fw->size);
-}
-
 static int lp5521_post_init_device(struct lp55xx_chip *chip)
 {
 	int ret;
@@ -413,7 +393,7 @@ static struct lp55xx_device_config lp5521_cfg = {
 	.brightness_fn      = lp5521_led_brightness,
 	.multicolor_brightness_fn = lp5521_multicolor_brightness,
 	.set_led_current    = lp5521_set_led_current,
-	.firmware_cb        = lp5521_firmware_loaded,
+	.firmware_cb        = lp55xx_firmware_loaded_cb,
 	.run_engine         = lp5521_run_engine,
 	.dev_attr_group     = &lp5521_group,
 };
diff --git a/drivers/leds/leds-lp5523.c b/drivers/leds/leds-lp5523.c
index 395c57330484..5525d60c342c 100644
--- a/drivers/leds/leds-lp5523.c
+++ b/drivers/leds/leds-lp5523.c
@@ -254,26 +254,6 @@ static int lp5523_init_program_engine(struct lp55xx_chip *chip)
 	return ret;
 }
 
-static void lp5523_firmware_loaded(struct lp55xx_chip *chip)
-{
-	const struct firmware *fw = chip->fw;
-
-	if (fw->size > LP5523_PROGRAM_LENGTH) {
-		dev_err(&chip->cl->dev, "firmware data size overflow: %zu\n",
-			fw->size);
-		return;
-	}
-
-	/*
-	 * Program memory sequence
-	 *  1) set engine mode to "LOAD"
-	 *  2) write firmware data into program memory
-	 */
-
-	lp55xx_load_engine(chip);
-	lp55xx_update_program_memory(chip, fw->data, fw->size);
-}
-
 static ssize_t show_engine_mode(struct device *dev,
 				struct device_attribute *attr,
 				char *buf, int nr)
@@ -785,7 +765,7 @@ static struct lp55xx_device_config lp5523_cfg = {
 	.brightness_fn      = lp5523_led_brightness,
 	.multicolor_brightness_fn = lp5523_multicolor_brightness,
 	.set_led_current    = lp5523_set_led_current,
-	.firmware_cb        = lp5523_firmware_loaded,
+	.firmware_cb        = lp55xx_firmware_loaded_cb,
 	.run_engine         = lp5523_run_engine,
 	.dev_attr_group     = &lp5523_group,
 };
diff --git a/drivers/leds/leds-lp5562.c b/drivers/leds/leds-lp5562.c
index 7f3733fc446e..e50b68c9ccf3 100644
--- a/drivers/leds/leds-lp5562.c
+++ b/drivers/leds/leds-lp5562.c
@@ -144,30 +144,6 @@ static void lp5562_run_engine(struct lp55xx_chip *chip, bool start)
 		lp5562_wait_enable_done();
 }
 
-static void lp5562_firmware_loaded(struct lp55xx_chip *chip)
-{
-	const struct firmware *fw = chip->fw;
-
-	/*
-	 * the firmware is encoded in ascii hex character, with 2 chars
-	 * per byte
-	 */
-	if (fw->size > (LP5562_PROGRAM_LENGTH * 2)) {
-		dev_err(&chip->cl->dev, "firmware data size overflow: %zu\n",
-			fw->size);
-		return;
-	}
-
-	/*
-	 * Program memory sequence
-	 *  1) set engine mode to "LOAD"
-	 *  2) write firmware data into program memory
-	 */
-
-	lp55xx_load_engine(chip);
-	lp55xx_update_program_memory(chip, fw->data, fw->size);
-}
-
 static int lp5562_post_init_device(struct lp55xx_chip *chip)
 {
 	int ret;
@@ -404,7 +380,7 @@ static struct lp55xx_device_config lp5562_cfg = {
 	.set_led_current    = lp5562_set_led_current,
 	.brightness_fn      = lp5562_led_brightness,
 	.run_engine         = lp5562_run_engine,
-	.firmware_cb        = lp5562_firmware_loaded,
+	.firmware_cb        = lp55xx_firmware_loaded_cb,
 	.dev_attr_group     = &lp5562_group,
 };
 
diff --git a/drivers/leds/leds-lp55xx-common.c b/drivers/leds/leds-lp55xx-common.c
index d8614ed973bc..9844823ece63 100644
--- a/drivers/leds/leds-lp55xx-common.c
+++ b/drivers/leds/leds-lp55xx-common.c
@@ -219,6 +219,31 @@ int lp55xx_update_program_memory(struct lp55xx_chip *chip,
 }
 EXPORT_SYMBOL_GPL(lp55xx_update_program_memory);
 
+void lp55xx_firmware_loaded_cb(struct lp55xx_chip *chip)
+{
+	const struct firmware *fw = chip->fw;
+
+	/*
+	 * the firmware is encoded in ascii hex character, with 2 chars
+	 * per byte
+	 */
+	if (fw->size > LP55xx_PROGRAM_LENGTH * 2) {
+		dev_err(&chip->cl->dev, "firmware data size overflow: %zu\n",
+			fw->size);
+		return;
+	}
+
+	/*
+	 * Program memory sequence
+	 *  1) set engine mode to "LOAD"
+	 *  2) write firmware data into program memory
+	 */
+
+	lp55xx_load_engine(chip);
+	lp55xx_update_program_memory(chip, fw->data, fw->size);
+}
+EXPORT_SYMBOL_GPL(lp55xx_firmware_loaded_cb);
+
 static void lp55xx_reset_device(struct lp55xx_chip *chip)
 {
 	const struct lp55xx_device_config *cfg = chip->cfg;
diff --git a/drivers/leds/leds-lp55xx-common.h b/drivers/leds/leds-lp55xx-common.h
index f0bbd41fdab3..cbc122c56828 100644
--- a/drivers/leds/leds-lp55xx-common.h
+++ b/drivers/leds/leds-lp55xx-common.h
@@ -212,6 +212,7 @@ extern void lp55xx_load_engine(struct lp55xx_chip *chip);
 extern int lp55xx_run_engine_common(struct lp55xx_chip *chip);
 extern int lp55xx_update_program_memory(struct lp55xx_chip *chip,
 					const u8 *data, size_t size);
+extern void lp55xx_firmware_loaded_cb(struct lp55xx_chip *chip);
 
 /* common probe/remove function */
 extern int lp55xx_probe(struct i2c_client *client);
diff --git a/drivers/leds/leds-lp8501.c b/drivers/leds/leds-lp8501.c
index d4094d20bdc1..1ea7bb73cd22 100644
--- a/drivers/leds/leds-lp8501.c
+++ b/drivers/leds/leds-lp8501.c
@@ -137,26 +137,6 @@ static void lp8501_run_engine(struct lp55xx_chip *chip, bool start)
 	lp55xx_run_engine_common(chip);
 }
 
-static void lp8501_firmware_loaded(struct lp55xx_chip *chip)
-{
-	const struct firmware *fw = chip->fw;
-
-	if (fw->size > LP8501_PROGRAM_LENGTH) {
-		dev_err(&chip->cl->dev, "firmware data size overflow: %zu\n",
-			fw->size);
-		return;
-	}
-
-	/*
-	 * Program memory sequence
-	 *  1) set engine mode to "LOAD"
-	 *  2) write firmware data into program memory
-	 */
-
-	lp55xx_load_engine(chip);
-	lp55xx_update_program_memory(chip, fw->data, fw->size);
-}
-
 static int lp8501_led_brightness(struct lp55xx_led *led)
 {
 	struct lp55xx_chip *chip = led->chip;
@@ -198,7 +178,7 @@ static struct lp55xx_device_config lp8501_cfg = {
 	.post_init_device   = lp8501_post_init_device,
 	.brightness_fn      = lp8501_led_brightness,
 	.set_led_current    = lp8501_set_led_current,
-	.firmware_cb        = lp8501_firmware_loaded,
+	.firmware_cb        = lp55xx_firmware_loaded_cb,
 	.run_engine         = lp8501_run_engine,
 };
 
-- 
2.43.0


