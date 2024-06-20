Return-Path: <linux-leds+bounces-2094-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3478C911512
	for <lists+linux-leds@lfdr.de>; Thu, 20 Jun 2024 23:46:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 723ECB24C5D
	for <lists+linux-leds@lfdr.de>; Thu, 20 Jun 2024 21:46:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA3B315B0F6;
	Thu, 20 Jun 2024 21:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XK17Sa+K"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2B0D158A0E;
	Thu, 20 Jun 2024 21:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718919716; cv=none; b=RQSJJxRV1exZB46h6EDQ2/OCCeaRfjBS60N3FcoRs7uELyj5f4s8AsvbQSCtAwn+um26/lfFW5qBHpxXRfKtnYvC/Tlr57BXY0QGZO/94Lv3ncRjqgSvlLIG5mN3IWGdwInwUZGMz2DU4PlQIvL41H4fdmk54TvyRTmet6SjrtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718919716; c=relaxed/simple;
	bh=om+AGcMqGqbbvVEm3jP/AcMHWRQ189MNta7RWJNBdAE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JSeN2pHGgxuGp2q5znbgx5VdoaIU5XoZRqJ6O2XKH/VIm55kz3m7IS13cDZqkYgEm0yeQmVRq5YyRPWmLMpzfg2+zsrChP5R3lJjo+jSut/FuL9AuKmKWrqBJMSWMQ5k1zA/eAq5eAIQzPvYSNnqhbmnGYhilhf7WLaVVQnswdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XK17Sa+K; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4218008c613so13102805e9.2;
        Thu, 20 Jun 2024 14:41:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718919713; x=1719524513; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o1OuxhTObrcU5gxabuse02Wd0S4fCa29l4HMpyoKad4=;
        b=XK17Sa+K0cSHcLUpWUXW2SVe5d4VC+cgeEd6m8DzS+Vh7MBBJNTlQTYoQ8LIJA7bf1
         TRKVevExsf6VS3BF21TQK1bEamem1Z9wU3uqgEUATfMEDMHTKmECVwOWJQE2nyW/YDLb
         7r7Q9Sri0vPAcDxRADlWDqN85o4MqIBM4XdSs5VEn6JdXOr/HpCrMZGFjBzNeheVoLTv
         2oJEXFYyxshigQZIY6ymgpcZ+wPdG8kcqZBmTOtHMbiMjIRT/fba7lo5ZTavhvTRb9sY
         gjEcLiCMHs99kxlT4WE/d7FeSDaFur2RCSZkWg+PTV70U2ujD9Kvkz/fDLcA3UDGoP3a
         y5Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718919713; x=1719524513;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o1OuxhTObrcU5gxabuse02Wd0S4fCa29l4HMpyoKad4=;
        b=tGgpf+h2D5gtCMpNmamxT4EDAw8acROnV2bLgGhqCtD+kRb0k4DAbqHOVFsSG71lM0
         PLxNbRLiG13WB9RHMFxxCDnfDsOlHqYWL9Ih819qAVq3HcF2dgm97+Q/b7GP6VDG1ncI
         FOd/Penuo+CaJIM92G5s0SqIK0BiLpkScPzbxzAMk4zcwwTYJePmdQ9EK4zUtbE6tBMG
         6wP12PywV/ThKNBT0EM5d78XNgdWUbFDJnzvQdQYShnhC/V9+Mdnd+qYvw3ChkO1GRBm
         68O7OGsGzNC+TcLTGu1sUHHFzY/POp2NWf+E/b2u3+XdiPn+CxgrHf1Ed+IPumBwjTdG
         FPpA==
X-Forwarded-Encrypted: i=1; AJvYcCWvHZ/X9jGUt4uDigD2zTG1dJw6YC/aIC7CZ2QXSq1IiMuaxstGcjbJgz9gUF+fLKy4rR8+JxVUaoel9WCiZMESAGktlfFwINWjlcmx32DDLDt6ZVejIfZxYxENQqe6TAV6RIwGyBBQD9XCz2xZ16WY8MnzJ8SQMGklrM4cgZ0tSFOWN8k=
X-Gm-Message-State: AOJu0Ywfus76g1NcC8wGgHojrC97VhuPuxJNLKNBC652IsgJ9Jv5H16N
	263mmfPJVW7o5g9cQWb+BKV9JqyB5C9rTcMRVlE1oXc6nEEQeH4x
X-Google-Smtp-Source: AGHT+IEASjCKXAJxibFoOHruCEMKhms/BaRjSGO1VC+A28yrsJaHqq4tCIyjB66a6lZsDL38xBfxnA==
X-Received: by 2002:adf:ce83:0:b0:35f:48e:fe59 with SMTP id ffacd0b85a97d-36319990f66mr4607369f8f.66.1718919713017;
        Thu, 20 Jun 2024 14:41:53 -0700 (PDT)
Received: from localhost.localdomain (93-34-90-105.ip49.fastwebnet.it. [93.34.90.105])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-366383f68acsm48866f8f.2.2024.06.20.14.41.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 14:41:52 -0700 (PDT)
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
Subject: [PATCH v7 18/20] leds: leds-lp55xx: Support ENGINE program up to 128 bytes
Date: Thu, 20 Jun 2024 23:03:34 +0200
Message-ID: <20240620210401.22053-19-ansuelsmth@gmail.com>
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


