Return-Path: <linux-leds+bounces-2136-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 30F20918690
	for <lists+linux-leds@lfdr.de>; Wed, 26 Jun 2024 18:02:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D912028326A
	for <lists+linux-leds@lfdr.de>; Wed, 26 Jun 2024 16:02:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B14B18FDCE;
	Wed, 26 Jun 2024 16:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kNsR7JYE"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 553E718FC94;
	Wed, 26 Jun 2024 16:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719417643; cv=none; b=HCf1PwPQMUT9f9nzSJjMnERrvdrR60Md0y7pZwjGEvAg9KqUHEmU5EiMpiQA3XcIWLGsv0nBwQlD0OGSE9p7ar+ab2A6NOzgNIHrkf2v4IYXT8eAZ2+MjQTA/uCTaO/ZooQJcem3Inj5R3CTzea0VV6nAp9kYz59zn3uq4swP54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719417643; c=relaxed/simple;
	bh=mzUPFIIxdCJwxUOnfqzZylBnwNQvZ6vmXNHDWnXpbf4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fCWyasWQ+OFyQwNl+Wsre2VfF1usTaCTRB4VfhViqyvFB8F9KOi+o2B5+SNr9ri4hdEBuWhgb2ljHiQJfj6yfB30KXuk7DGw360p/obDLJdJ4j7Nngfas61/IrrmiGXMd9WsWfEXLoScl308mY0ODD6OFZbezsEiUTx7zQNXAE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kNsR7JYE; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-356c4e926a3so6224198f8f.1;
        Wed, 26 Jun 2024 09:00:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719417640; x=1720022440; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G42UoLjDGP8cncbUgriha0bkzwbPhVTETU0H4hWp8b8=;
        b=kNsR7JYEIgSCvYq6RBzladh7y5fId6eFIS6c/Z9i4kZOljX/QmDGs/wGLJ9M+jkCbL
         ix2KrywGDCwQ3rCiQMdKAwwJlX0KHzSoMyHQ+pG490qgVjoPrYWKW2zu1x38FrMd3OMS
         6dKmuFhKXkg0t/lv8RceV3x3ILRCh80pbILp7PB3TAqx8DCtnmnH9/D0hblFw8k8GNzs
         qBCdjgJwKKVCvZ86rp+uu0aYQ2YKgUCfaeZk8nxWwEqh7l7BhlZ8PASMZGDn6KWZf8DW
         ZmmXCdfLfahyNxm66T11fdojYTIEdpL9At0hEm4CzI1abotlDFPW1nK/rnY8vGDrM417
         nFUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719417640; x=1720022440;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G42UoLjDGP8cncbUgriha0bkzwbPhVTETU0H4hWp8b8=;
        b=HixQTj3t7e+GW5NF7rezOEXYlYo1ArMGFKNB2257mp1ry8LkmToRImtqiJIzgHtunE
         TQ357N5MjP7CsyPmkKf2LvQDIYMbjPPpvIp9DSAbR/oyZKQ0daNzRujjbD0ce+louuvr
         EKersbcHFxZ3yWQB2lu8H7uOxYPzfoKsyIxDCV38kFnUHzTw1sHtriXHNZ8/M/qQQjQP
         X3B9eg6GiKaSWIH7yY6w7sGI0isf4GN1B35w/u89f2j0OsP157aRCeAqgBotiEg9HRe7
         TFFpSbKTVp4+Q492AJRebNAuCZAB1ZbRvpO/am0Om/89BT8CeHd6xqjfWML67O1UcyuT
         oEgQ==
X-Forwarded-Encrypted: i=1; AJvYcCVarl1l3liIDE5WvWtOPcbQJjUKkUw7V2IP7u+xzCKnc+Pn5ZRy4KaXLND7XjYPs4VWq0yKA5nwa16yjDm8+M0OIdDhQVJh+uk9OklYDic0E5wTTZVFW2VTjyHcW9nZmzGC5jv3onSGUlThEnX4bYlrsIHpvdhf1mw3AmcoHHcy0e8jBMc=
X-Gm-Message-State: AOJu0YyCkzZ4LJH5J4lts2+m7zgjSxJQEPbeF7FpOnUWFVAX5n7ZiSyY
	rp5XOxgqYYFfvCtyz/6ZVXkQ3UEtBU4k+Cy8qZ27y0KjfFtYJlo2
X-Google-Smtp-Source: AGHT+IF3UpRLShe0bsZM271x+WqCy2FSI3E8Gz2P9cSVnm0yh0s67Pb5MkN1h1jssTX7y/rbPo5UtA==
X-Received: by 2002:a5d:58f8:0:b0:35f:302e:a0d6 with SMTP id ffacd0b85a97d-366e948e8f3mr6487544f8f.18.1719417639523;
        Wed, 26 Jun 2024 09:00:39 -0700 (PDT)
Received: from localhost.localdomain (93-34-90-105.ip49.fastwebnet.it. [93.34.90.105])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-366389b88easm16180589f8f.39.2024.06.26.09.00.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 09:00:39 -0700 (PDT)
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
Subject: [PATCH v8 09/20] leds: leds-lp55xx: Generalize firmware_loaded function
Date: Wed, 26 Jun 2024 18:00:14 +0200
Message-ID: <20240626160027.19703-10-ansuelsmth@gmail.com>
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


