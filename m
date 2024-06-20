Return-Path: <linux-leds+bounces-2085-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 457899114F3
	for <lists+linux-leds@lfdr.de>; Thu, 20 Jun 2024 23:43:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EF8DC281BA7
	for <lists+linux-leds@lfdr.de>; Thu, 20 Jun 2024 21:43:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A68C152515;
	Thu, 20 Jun 2024 21:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TRuPiIJ3"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DE1014F9F5;
	Thu, 20 Jun 2024 21:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718919707; cv=none; b=GCMp/243KhzpiGiQ45DCzIiQjn9+bj/anOG1PtSHhw4Nb5xBZ0m5C5+sjOOLDSGq7juXm0ZeLGdPq/xQ3Qs3rtbYZ0Ud1M3zsKKolH4FdxVPhOayerxTu8G/xxOlgqfRT7OBPnlBN33Ro7vdIUTzn4XL96usXbSpq+0C8CWBOJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718919707; c=relaxed/simple;
	bh=mzUPFIIxdCJwxUOnfqzZylBnwNQvZ6vmXNHDWnXpbf4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jTcW/ev6g8tYc4Sx5E5fUmhsJgMFfmkPsOw7J+mn5blBLTV/TNYHFRL7z7WMqcvpJe/cu+1U8cOJN8byOuPc7wqBw1kjpO+EhE0sGBAeEhOLbwrwSX/7Av/23ZFJTSTL250WX8Id8nGx3Fy/q6yTny6Zyn+sSbPkbvt6dYJr6OI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TRuPiIJ3; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-421bb51d81aso13089875e9.3;
        Thu, 20 Jun 2024 14:41:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718919704; x=1719524504; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G42UoLjDGP8cncbUgriha0bkzwbPhVTETU0H4hWp8b8=;
        b=TRuPiIJ3UJQ9LTgtIKYUMbBVS72yDJsSKdJyNO2KfQcD+TQ9gbpZJOkTEs1+0LnA/y
         GYZr7oyLLNhJyjCWJly5lVpmXRJ4ptpPI8nX6lXvov3yWxL+pDW4NSd/atRBkUq+bJ/O
         yjnKwrCkcSHXmU5KX+d/3RL3SIgERxF8HZNEbnaK8SmYziIAAVfYMUoedyfl6xmkwA0v
         DU3PO9mJGEtJXSclPb5ppkuA51MXmlk5CWSDlGGe+xH42iGcLCXfcTZwoK3UFBat1I3S
         BjReYuyvGdOPFDEI2opHEaJAqPYTxITY0PYHmpjnAhg/g8ndlnSuQmKf9RGWWE+1Xp4q
         gQfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718919704; x=1719524504;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G42UoLjDGP8cncbUgriha0bkzwbPhVTETU0H4hWp8b8=;
        b=FOC3hCp2AxpNnWsriumgt/kZ3SL8vrbGApfXyeozxgDyWj2K2+sZb+bi4vLGwW4Oae
         pLATpGZnJCeGIxcuHhbcO6u/WJcxw69ISdRQ/Jrscc6ezniZqxtyWZgDosi0vvqpGrDs
         stuNj4HCoZ0RCQkMvtKc7f1Dt3ZLeKuEQ0Hz4sHy8/E49vVYBvVsbLPSf3fCj0ZNqt2l
         VkmXBCCn0XmlLkiWmf7lLUsXhqxv8YaKQi/iEv7WzGM5pxFpV4twqvG3e+1PPJzSCRAE
         77jMHHrjlBm5VEhi+wBsumctMCWu3Bq9awllMSMax9tHZ7UmuEpSyW19+5GMQjHc0fcC
         gZig==
X-Forwarded-Encrypted: i=1; AJvYcCXzYnDamX1ER3WxUoqnGgCEKsyoJecwe4c0/O/Z03LualyiDqcL4CNtt4aQREamrl9GpabJUFAkmu0PVxXHYxrfMPIdTVCxGJL7QoQbUXaBRmTiVKtXdQ3iGg+RATGrvgFOf1EnGz4rIbQUNczOXmMpKHW4dpMKVY4vhqZgkc2Bu9frceA=
X-Gm-Message-State: AOJu0YyrDhHo88iHjXgOghh3IZMvpSFwTQ0l8S3Gl6BtR3E4LBn6dpk0
	dVkm8AeUhVQVmOndUnXgqRmTlMBL4EZ3qJ5VlIVzej59AYDHm9AX
X-Google-Smtp-Source: AGHT+IGdcoZqvlv52iXsCp+2DvdDihH7FiIQztaQbnfKOkgP5kW4Lz3Kepk8hiQe7C9b9WP+77gkuA==
X-Received: by 2002:a05:600c:63c4:b0:41e:db33:9a4e with SMTP id 5b1f17b1804b1-4247529d538mr46815315e9.39.1718919703795;
        Thu, 20 Jun 2024 14:41:43 -0700 (PDT)
Received: from localhost.localdomain (93-34-90-105.ip49.fastwebnet.it. [93.34.90.105])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-366383f68acsm48866f8f.2.2024.06.20.14.41.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 14:41:43 -0700 (PDT)
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
Subject: [PATCH v7 09/20] leds: leds-lp55xx: Generalize firmware_loaded function
Date: Thu, 20 Jun 2024 23:03:25 +0200
Message-ID: <20240620210401.22053-10-ansuelsmth@gmail.com>
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

Generalize firmware_loaded function as lp55xx based LED driver all share
the same logic.

Suggested-by: Lee Jones <lee@kernel.org>
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
index 8c20d7b4bc82..1c9348ed3edc 100644
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
2.45.1


