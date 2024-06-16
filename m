Return-Path: <linux-leds+bounces-1978-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FB1F90A044
	for <lists+linux-leds@lfdr.de>; Sun, 16 Jun 2024 23:59:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 15B8AB202DC
	for <lists+linux-leds@lfdr.de>; Sun, 16 Jun 2024 21:59:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6916313BAC7;
	Sun, 16 Jun 2024 21:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OD8fCRSD"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74F2A13B286;
	Sun, 16 Jun 2024 21:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718574969; cv=none; b=JGKH2a34xEHbC8u1JYSWeoeQAwXYfabaDL4HEVlHFPsgy2dQ1RkXpDkOVbNqV3Wusfgfz+AHrGjupt2w8bKvgJwcV3uDtavRelXKIOvro/ZMJQixj90Op+6heQqw9EWESD5Vzd8VPtphWfRPyLmiHnaQGQDtSsZX5YOiQ4YiSYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718574969; c=relaxed/simple;
	bh=LonxFkH0V4IOHqEQzVqa6HM0cP4Auu668cvEJc/7inw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DR7C2X+jYTEAlIj70OuCvGV0e6NiG8ziJ7Co5Y1tRg+4Rm7VqrtaWnoY6X3Ox0GASfzh3aEHretvD36AvIx4+QZUJfDEANXngTY0kRyQ6fPJQ9gdnayVnkRFRMJEUUH0f6bNWKh7rfft45CWsOWGj1cDmWsS8bhJTYoz7t901V4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OD8fCRSD; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3608e6d14b6so806774f8f.0;
        Sun, 16 Jun 2024 14:56:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718574966; x=1719179766; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ryp4FYkpPGDa+jVapaf05jxp9BKNLD0q4vcW+Q2o9Wc=;
        b=OD8fCRSDiR3Vi0f4tBiqqeKyfIIhQomsWlTKSjIVhFrW3EfPFhE899XQMfNgD/jPzC
         yOGXAVu5Q52TxNJ1cgrozfvgq5H1C5oLS5aAsajvjCPXT0N75ogGtLikqZHlBwA3rOez
         ljynsS1QpF/anzpam1rhYxCctszOpxfoq5LUPeBaHSaHR6FEi5aT/RwnI/z9IVnZ11lr
         NRzK3GLe2LSyVr1Hfux+/3Z0s0uCN/YGlJJYjDjkc2GY9Rh/rNbxL5IpeGEnfSGNddzr
         WM/jN6e/jT7QfnOYB0i5QC5TnHUcl4mk3dU9L0egfLrMUz8279WX/lN+Z0OBHRruP6vt
         RDBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718574966; x=1719179766;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ryp4FYkpPGDa+jVapaf05jxp9BKNLD0q4vcW+Q2o9Wc=;
        b=xTA/0vbAOG3KC4xctavvSieZGdT+sf3yJFrJaNuBwi9/NxyMzbWzrmyOhIHS+s+xmd
         Gy00PY2qHXA48jsBhJ7H06B7dsQZcIz4mDEyHSInLoXQpavm9ZTLA8zsrBw3nUR2+hqu
         FjqV4Cp/G4ypOxjV+hCIIEnRSrCh05UK4RGbERfxBpEVoRlw2MM3qAw9LewV+IlWLvoP
         fJ20Dqdck6XckxV/EZbHqtxeb6PPJCEfNyyfB1pFh9gWJM90Bj3wS8icquTiQcR4wpQK
         RxCLPcvJwb5TqgcT4Owo9B3Ek3cDo503f1lYe/YLsoBfATM250Hztn2aHivE7dKKjEY6
         XL4Q==
X-Forwarded-Encrypted: i=1; AJvYcCXaMs8P1HluK7CLKDOT3R1OJhW9Xh6K+42mFMKqV5oC6Kf7XUSayqzHagxT7CSzIvy+Fn3tJsW4SZIqDIBORYHdVDuRGdX2RsO9yeG0QeY+FloJb0T4EuydeDvncw1YwainzwrHcPxRvVVYCjKnRIZjQrZLVLAQI4RPIbHicPz0yeiO45M=
X-Gm-Message-State: AOJu0Yw2ChWeKsk7iL5i9B4vhEw9DG5yakLTpHAm4WcKXLy3zFSqZae3
	zfhWM2XlkQK7xKedl8g6sCUWOGS8pMGM+1BklMTocW0GlDH/c4Ca9lJunw==
X-Google-Smtp-Source: AGHT+IGlWxfUQqryeTKs/UKTuudEVDA0K4Ugx6f7fU01kDvjMlzlzweZVyQFD33iki78O+LQpZ0xxQ==
X-Received: by 2002:a05:6000:bcf:b0:360:86ad:7a6f with SMTP id ffacd0b85a97d-36086ad7acamr4741742f8f.48.1718574965766;
        Sun, 16 Jun 2024 14:56:05 -0700 (PDT)
Received: from localhost.localdomain (93-34-90-105.ip49.fastwebnet.it. [93.34.90.105])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-36075104b74sm10362879f8f.107.2024.06.16.14.56.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Jun 2024 14:56:05 -0700 (PDT)
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
Subject: [PATCH v6 18/20] leds: leds-lp55xx: support ENGINE program up to 128 bytes
Date: Sun, 16 Jun 2024 23:52:17 +0200
Message-ID: <20240616215226.2112-19-ansuelsmth@gmail.com>
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
index 6f25a6c32869..1d00c6cc4174 100644
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
index 62f5d6e8087c..04c713e7fb00 100644
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
@@ -174,12 +175,16 @@ int lp55xx_update_program_memory(struct lp55xx_chip *chip,
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
@@ -208,12 +213,20 @@ int lp55xx_update_program_memory(struct lp55xx_chip *chip,
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
@@ -226,13 +239,19 @@ EXPORT_SYMBOL_GPL(lp55xx_update_program_memory);
 
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
@@ -1283,7 +1302,7 @@ static struct lp55xx_platform_data *lp55xx_of_populate_pdata(struct device *dev,
 int lp55xx_probe(struct i2c_client *client)
 {
 	const struct i2c_device_id *id = i2c_client_get_device_id(client);
-	int ret;
+	int program_length, ret;
 	struct lp55xx_chip *chip;
 	struct lp55xx_led *led;
 	struct lp55xx_platform_data *pdata = dev_get_platdata(&client->dev);
@@ -1307,6 +1326,17 @@ int lp55xx_probe(struct i2c_client *client)
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
index 063d7392b6a2..5e1f7fea5985 100644
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
2.43.0


