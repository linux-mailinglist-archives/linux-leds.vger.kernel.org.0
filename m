Return-Path: <linux-leds+bounces-1939-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7624D909A70
	for <lists+linux-leds@lfdr.de>; Sun, 16 Jun 2024 01:14:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7D87D1C20856
	for <lists+linux-leds@lfdr.de>; Sat, 15 Jun 2024 23:14:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F1AF12FF76;
	Sat, 15 Jun 2024 23:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b/hDVBhR"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21AC477624;
	Sat, 15 Jun 2024 23:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718493182; cv=none; b=c0aLggErBbGtbqqr4ciIVqAWFPPZ6Dmk0mQjILMiWnAJjLfLwVnlXOVi5nJ+/CpTJbRWyWuROEcH5/KJWWWGm9YgFspx99+ZmRBizw7JwayWU88JZ6nGiY72oYvC9kl6jw/jjlNH55m3KwGcuCC80yjCtC2XQmdFRMUmr5tS1L0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718493182; c=relaxed/simple;
	bh=apm5rwcCzjeljGR2q/A/ytEBR6gnOCuyH5llSEY300g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ipxLWDnnrj44mIQ/UyUu7zOVbX8ZnIIwOtiXKW/k2JYi9BWSgk6LB3o4tDlJpKyCr1SOwqaNj5RWjWo1/ImCluHkaWAc4vfWoLXJHSH2tk8aNELArIEfLTR1EneaLFaywplLVOBifFcQ4mh7LXHNTYcL+KcP7LnQuqHKK0syMAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b/hDVBhR; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-35f275c7286so2952895f8f.2;
        Sat, 15 Jun 2024 16:12:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718493178; x=1719097978; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jA3gS4eCwa1PxS2bZ3pvhQoaJRFYvkm+SPUckuQyVmw=;
        b=b/hDVBhRk8HK9meOqt4XkG9FxRuTSRPQTUzgRKrm3V255uZKmcmmolmsfoBYcfzmRD
         vkrpPujHZssIKqzB6JGqQd7lSIRx2WTyq385Us1f5lrcg3GHVZpGY3OHuG1s6DrZQSZx
         S0KYx7Hl1DlbSrLdsYE6sYt+y2Ugq1CQPjwxIOv5fPaLtKUlYSbs4q5jYQjacmsIss2Z
         UtbRXs2XyWtxktsyj4xI5C6Fqq9DVmnWV9ZR/LiY6eFgRd8Zz4/KRXpx8vsEFc+q+mf3
         36oyLdR3DCUDxrL4iYfTmzT+TDCon7ABX7JIFMx5vo566HW48A8yxXvpDAxcGAEBFWy+
         9bkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718493178; x=1719097978;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jA3gS4eCwa1PxS2bZ3pvhQoaJRFYvkm+SPUckuQyVmw=;
        b=MDoA4Xtau2AmlZyBbyxubdH4hNZ6XlC06L9/V9iDDOb/3+5LMHxLFZ0+K0G08Rq3Bf
         74Ox5dUkMk5CTdkv3O2L2PYKGor6hQBk0N8ko3uC/Sp3xHQuIVnbaeLfBxw6y8VxGE2r
         5LmqyYOJCCyGYBVyeotMWn693cwUcq78OvWBAN8oujKu+uQktI7yBmKwtUUyElmSvEJa
         SL6QfhCIFP+CWPmybz3ZF9XSmdEXDxcEzLrBQLjMTsgZwlsA8KG6QfdsbbI1whCEsh18
         9LL1mIWj9W4DMLNDX/5PXb1xT9ZX3cR+ta43WQYldl6d8Nl5cz5/C9/QweWnPk2l7GRW
         xTag==
X-Forwarded-Encrypted: i=1; AJvYcCXMHFVzZX0jlreVNfMr9Eg/ryKd5BNof3FTe8ajtMhrHVam9fi6HW1D1RpwlC7Pug0BN5WRhnfkKdBPCbN/pNRv398DQTjVIctS8zgm5+4GkY5AzR5GAtI+ZS0FbI74cw0t9GApB6bhJDWNztPj3jtAjmvQ4NTKLJPt2Ghy7daA8lKNEi0=
X-Gm-Message-State: AOJu0YxnlKG9aPK21B6OkPwDgHTOUHngwrt435Nu/5JCsFYrVgRDpoGm
	NpTbqeVe359BU78p4sgPXXjpHGp1uT390fVynyFa4YmvRzsBP3sU
X-Google-Smtp-Source: AGHT+IH5IEes8KcTT4kLIz0dO8JavcqR2prjRLWGwfj6nYoOrkQvq6G2iaGk3BKe8v4CrNUNr7Bjkw==
X-Received: by 2002:a05:6000:1564:b0:357:73ca:9c00 with SMTP id ffacd0b85a97d-3607a7660fbmr4808861f8f.32.1718493178496;
        Sat, 15 Jun 2024 16:12:58 -0700 (PDT)
Received: from localhost.localdomain (93-34-90-105.ip49.fastwebnet.it. [93.34.90.105])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3607509355dsm8145532f8f.13.2024.06.15.16.12.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Jun 2024 16:12:58 -0700 (PDT)
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
Subject: [PATCH v5 09/20] leds: leds-lp55xx: generalize firmware_loaded function
Date: Sun, 16 Jun 2024 01:11:39 +0200
Message-ID: <20240615231152.28201-10-ansuelsmth@gmail.com>
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
index 9f060b412435..51bbe91cc7f2 100644
--- a/drivers/leds/leds-lp55xx-common.c
+++ b/drivers/leds/leds-lp55xx-common.c
@@ -217,6 +217,31 @@ int lp55xx_update_program_memory(struct lp55xx_chip *chip,
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


