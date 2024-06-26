Return-Path: <linux-leds+bounces-2145-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 13B929186B5
	for <lists+linux-leds@lfdr.de>; Wed, 26 Jun 2024 18:06:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 92EC6B284F1
	for <lists+linux-leds@lfdr.de>; Wed, 26 Jun 2024 16:04:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8152A1922EB;
	Wed, 26 Jun 2024 16:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BbjV9XuF"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 832721922C4;
	Wed, 26 Jun 2024 16:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719417653; cv=none; b=uvllivE1oGzI/rVJg6UWHfiGUfG6ikooEmxlhLjlO5eql19+fYsLSFzWJW6wC6KoJDfTx2DPKX8SVqXFvFB8ZY58aQBAjRR6jE15f0/SUZntzyRo9pMF+8aBUbDnNvAfjcxrQtv+hKCrEikVhbdniBaHz4ZFij2wVhbisXsfTfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719417653; c=relaxed/simple;
	bh=om+AGcMqGqbbvVEm3jP/AcMHWRQ189MNta7RWJNBdAE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mYFQHuBbq+PFUqcwtXrbOtt0lat9xxuuzya4fzUn6VWy3wr8V9o5tCL7IdJ/WXHBBVPQGYyLSnKiEnIvK02F4b6+CzUha4gxvHs6kuW7UBSzwhuzPXchRkJG/35sjFEaZGbeT9NDFiizCSi9qZR6t1IkdmYXE5evBerR0E9M6aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BbjV9XuF; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-52cf4ca8904so2313936e87.3;
        Wed, 26 Jun 2024 09:00:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719417650; x=1720022450; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o1OuxhTObrcU5gxabuse02Wd0S4fCa29l4HMpyoKad4=;
        b=BbjV9XuFKfbHZGUSNFaLYx9ci17ex9OQbRZ1AVqdYC4oafygmJsR+If/R+QGWs/J2+
         KTe2dgYjw40bR6UFelzRFXTi9vzKyuqukutHkwUr4Jn3EoWIslA77sUKLMx8vexTm97G
         4YA9hkqzDEjio/QZWdDKBDsuLWNTnuMKZmKpAA7UKot3QwqTIcVUsW3jwrCBi7L9v7su
         atDdVWdRMroNaFmPppkMpwCpUfsQFR7EmUgdsv+xIrcEh68A2n5ZA66GJaBhvopq+sND
         gZ9iIkdnsx0bSeRJeG8gfcqWH1tsux5imzOOnZotW7aDFHE/IC7g+Wr9DtEgmgN6tMwd
         yCCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719417650; x=1720022450;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o1OuxhTObrcU5gxabuse02Wd0S4fCa29l4HMpyoKad4=;
        b=d0obkhH17w6Uf/YCNnbVvwQ/KjdJWEspqYFbp8DCqxN1yblHPbF2zRrB4PWTU6NflM
         Pe4FhINwkBD2PBeEVG9e190XCKw8hCKOoUHSaQ6zBbgdJrROAV2HttWlbZZnlcEAv2nd
         rafn3vqZ4wV4eXdBgKUSbRDuFXrhV5VfPwY1IRUFHqXT58teUKQyDrRAy3W+byMmCty4
         TIbafcUeJJtd76050U2hp4HAmr5SoDRaYD/U8YYp7xPy2pXqZhXH6OfwjPfwPeuNAVev
         3dJvljrfxeNqnx4BwKiwiWOW6dy7iGQAanebr7mzztmo9xHEER+W+mUqV/aMhfnV1vaZ
         OTKg==
X-Forwarded-Encrypted: i=1; AJvYcCVdify/k8MgdmWRI8A07E/5HElxygganHVplbJrkJfG6/nd5EVsQDrruvcpKXsBJ2hc/OfVUSEYlbNnMlzpcz7LzeJgczJFg8eY3SP14a3JX+Pbbbgzx+a2OJgmeu2VTtfJeQsT0jycuKI0iuMCJntVQykeIQqEDw1z9ddxiwyHMFttwJA=
X-Gm-Message-State: AOJu0YzjoeB9hrqkzYejMX9Ph0HAHRZcEhWobSy3/jZe42FzOJ4KGrjy
	ZKp+Tp5j2mk2wLfDUT0SgJVVPmjNme7+KRndQepcQJX+lhkxOczO
X-Google-Smtp-Source: AGHT+IE6tk4395pRdXcQaupLCKIPMQAaZJc7FOSlaqybZ6YzV5xfs1PKqdDjefjyC/w9Yw3IQKDIOQ==
X-Received: by 2002:a05:6512:5cf:b0:52c:cb8d:6381 with SMTP id 2adb3069b0e04-52ce063e3f0mr7132251e87.13.1719417649291;
        Wed, 26 Jun 2024 09:00:49 -0700 (PDT)
Received: from localhost.localdomain (93-34-90-105.ip49.fastwebnet.it. [93.34.90.105])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-366389b88easm16180589f8f.39.2024.06.26.09.00.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 09:00:48 -0700 (PDT)
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
Subject: [PATCH v8 18/20] leds: leds-lp55xx: Support ENGINE program up to 128 bytes
Date: Wed, 26 Jun 2024 18:00:23 +0200
Message-ID: <20240626160027.19703-19-ansuelsmth@gmail.com>
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

Some LED chip supports up to 16 pages and with some magic they can be
divided in 4 page for each ENGINE + 1 for each MUX. Following this we
can support bigger programs up to 128 bytes.

Rework the update_program_memory function to support program of multiple
pages instead of hardcoding it to one page per programs.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/leds/leds-lp5523.c        |  5 ++-
 drivers/leds/leds-lp5562.c        |  7 ++--
 drivers/leds/leds-lp55xx-common.c | 54 ++++++++++++++++++++++++-------
 drivers/leds/leds-lp55xx-common.h |  2 ++
 4 files changed, 49 insertions(+), 19 deletions(-)

diff --git a/drivers/leds/leds-lp5523.c b/drivers/leds/leds-lp5523.c
index 1b3ffdc3dfa3..54ead09488a5 100644
--- a/drivers/leds/leds-lp5523.c
+++ b/drivers/leds/leds-lp5523.c
@@ -21,7 +21,6 @@
 
 #include "leds-lp55xx-common.h"
 
-#define LP5523_PROGRAM_LENGTH		32	/* bytes */
 /* Memory is used like this:
  * 0x00 engine 1 program
  * 0x10 engine 2 program
@@ -172,7 +171,7 @@ static int lp5523_init_program_engine(struct lp55xx_chip *chip)
 	int ret;
 	u8 status;
 	/* one pattern per engine setting LED MUX start and stop addresses */
-	static const u8 pattern[][LP5523_PROGRAM_LENGTH] =  {
+	static const u8 pattern[][LP55xx_BYTES_PER_PAGE] =  {
 		{ 0x9c, 0x30, 0x9c, 0xb0, 0x9d, 0x80, 0xd8, 0x00, 0},
 		{ 0x9c, 0x40, 0x9c, 0xc0, 0x9d, 0x80, 0xd8, 0x00, 0},
 		{ 0x9c, 0x50, 0x9c, 0xd0, 0x9d, 0x80, 0xd8, 0x00, 0},
@@ -196,7 +195,7 @@ static int lp5523_init_program_engine(struct lp55xx_chip *chip)
 		chip->engine_idx = i;
 		lp55xx_load_engine(chip);
 
-		for (j = 0; j < LP5523_PROGRAM_LENGTH; j++) {
+		for (j = 0; j < LP55xx_BYTES_PER_PAGE; j++) {
 			ret = lp55xx_write(chip, LP5523_REG_PROG_MEM + j,
 					pattern[i - 1][j]);
 			if (ret)
diff --git a/drivers/leds/leds-lp5562.c b/drivers/leds/leds-lp5562.c
index e50b68c9ccf3..109162f1720f 100644
--- a/drivers/leds/leds-lp5562.c
+++ b/drivers/leds/leds-lp5562.c
@@ -19,7 +19,6 @@
 
 #include "leds-lp55xx-common.h"
 
-#define LP5562_PROGRAM_LENGTH		32
 #define LP5562_MAX_LEDS			4
 
 /* ENABLE Register 00h */
@@ -212,9 +211,9 @@ static void lp5562_write_program_memory(struct lp55xx_chip *chip,
 /* check the size of program count */
 static inline bool _is_pc_overflow(struct lp55xx_predef_pattern *ptn)
 {
-	return ptn->size_r >= LP5562_PROGRAM_LENGTH ||
-	       ptn->size_g >= LP5562_PROGRAM_LENGTH ||
-	       ptn->size_b >= LP5562_PROGRAM_LENGTH;
+	return ptn->size_r >= LP55xx_BYTES_PER_PAGE ||
+	       ptn->size_g >= LP55xx_BYTES_PER_PAGE ||
+	       ptn->size_b >= LP55xx_BYTES_PER_PAGE;
 }
 
 static int lp5562_run_predef_led_pattern(struct lp55xx_chip *chip, int mode)
diff --git a/drivers/leds/leds-lp55xx-common.c b/drivers/leds/leds-lp55xx-common.c
index dd7630aaa438..1b71f512206d 100644
--- a/drivers/leds/leds-lp55xx-common.c
+++ b/drivers/leds/leds-lp55xx-common.c
@@ -27,7 +27,8 @@
 /* OP MODE require at least 153 us to clear regs */
 #define LP55XX_CMD_SLEEP		200
 
-#define LP55xx_PROGRAM_LENGTH		32
+#define LP55xx_PROGRAM_PAGES		16
+#define LP55xx_MAX_PROGRAM_LENGTH	(LP55xx_BYTES_PER_PAGE * 4) /* 128 bytes (4 pages) */
 
 /*
  * Program Memory Operations
@@ -172,12 +173,16 @@ int lp55xx_update_program_memory(struct lp55xx_chip *chip,
 {
 	enum lp55xx_engine_index idx = chip->engine_idx;
 	const struct lp55xx_device_config *cfg = chip->cfg;
-	u8 pattern[LP55xx_PROGRAM_LENGTH] = { };
+	u8 pattern[LP55xx_MAX_PROGRAM_LENGTH] = { };
 	u8 start_addr = cfg->prog_mem_base.addr;
-	int i = 0, offset = 0;
-	int ret;
+	int page, i = 0, offset = 0;
+	int program_length, ret;
+
+	program_length = LP55xx_BYTES_PER_PAGE;
+	if (cfg->pages_per_engine)
+		program_length *= cfg->pages_per_engine;
 
-	while ((offset < size - 1) && (i < LP55xx_PROGRAM_LENGTH)) {
+	while ((offset < size - 1) && (i < program_length)) {
 		unsigned int cmd;
 		int nrchars;
 		char c[3];
@@ -206,12 +211,20 @@ int lp55xx_update_program_memory(struct lp55xx_chip *chip,
 	 * For LED chip that support page, PAGE is already set in load_engine.
 	 */
 	if (!cfg->pages_per_engine)
-		start_addr += LP55xx_PROGRAM_LENGTH * idx;
+		start_addr += LP55xx_BYTES_PER_PAGE * idx;
 
-	for (i = 0; i < LP55xx_PROGRAM_LENGTH; i++) {
-		ret = lp55xx_write(chip, start_addr + i, pattern[i]);
-		if (ret)
-			return -EINVAL;
+	for (page = 0; page < program_length / LP55xx_BYTES_PER_PAGE; page++) {
+		/* Write to the next page each 32 bytes (if supported) */
+		if (cfg->pages_per_engine)
+			lp55xx_write(chip, LP55xx_REG_PROG_PAGE_SEL,
+				     LP55xx_PAGE_OFFSET(idx, cfg->pages_per_engine) + page);
+
+		for (i = 0; i < LP55xx_BYTES_PER_PAGE; i++) {
+			ret = lp55xx_write(chip, start_addr + i,
+					   pattern[i + (page * LP55xx_BYTES_PER_PAGE)]);
+			if (ret)
+				return -EINVAL;
+		}
 	}
 
 	return size;
@@ -224,13 +237,19 @@ EXPORT_SYMBOL_GPL(lp55xx_update_program_memory);
 
 void lp55xx_firmware_loaded_cb(struct lp55xx_chip *chip)
 {
+	const struct lp55xx_device_config *cfg = chip->cfg;
 	const struct firmware *fw = chip->fw;
+	int program_length;
+
+	program_length = LP55xx_BYTES_PER_PAGE;
+	if (cfg->pages_per_engine)
+		program_length *= cfg->pages_per_engine;
 
 	/*
 	 * the firmware is encoded in ascii hex character, with 2 chars
 	 * per byte
 	 */
-	if (fw->size > LP55xx_PROGRAM_LENGTH * 2) {
+	if (fw->size > program_length * 2) {
 		dev_err(&chip->cl->dev, "firmware data size overflow: %zu\n",
 			fw->size);
 		return;
@@ -1276,7 +1295,7 @@ static struct lp55xx_platform_data *lp55xx_of_populate_pdata(struct device *dev,
 int lp55xx_probe(struct i2c_client *client)
 {
 	const struct i2c_device_id *id = i2c_client_get_device_id(client);
-	int ret;
+	int program_length, ret;
 	struct lp55xx_chip *chip;
 	struct lp55xx_led *led;
 	struct lp55xx_platform_data *pdata = dev_get_platdata(&client->dev);
@@ -1300,6 +1319,17 @@ int lp55xx_probe(struct i2c_client *client)
 		}
 	}
 
+	/* Validate max program page */
+	program_length = LP55xx_BYTES_PER_PAGE;
+	if (chip->cfg->pages_per_engine)
+		program_length *= chip->cfg->pages_per_engine;
+
+	/* support a max of 128bytes */
+	if (program_length > LP55xx_MAX_PROGRAM_LENGTH) {
+		dev_err(&client->dev, "invalid pages_per_engine configured\n");
+		return -EINVAL;
+	}
+
 	led = devm_kcalloc(&client->dev,
 			   pdata->num_channels, sizeof(*led), GFP_KERNEL);
 	if (!led)
diff --git a/drivers/leds/leds-lp55xx-common.h b/drivers/leds/leds-lp55xx-common.h
index 6dcffa0db647..1bb7c559662c 100644
--- a/drivers/leds/leds-lp55xx-common.h
+++ b/drivers/leds/leds-lp55xx-common.h
@@ -14,6 +14,8 @@
 
 #include <linux/led-class-multicolor.h>
 
+#define LP55xx_BYTES_PER_PAGE		32      /* bytes */
+
 enum lp55xx_engine_index {
 	LP55XX_ENGINE_INVALID,
 	LP55XX_ENGINE_1,
-- 
2.45.1


