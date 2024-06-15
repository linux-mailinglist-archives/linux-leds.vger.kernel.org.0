Return-Path: <linux-leds+bounces-1948-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BFE27909A8D
	for <lists+linux-leds@lfdr.de>; Sun, 16 Jun 2024 01:17:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 89BC6B2155B
	for <lists+linux-leds@lfdr.de>; Sat, 15 Jun 2024 23:16:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5974C13BC26;
	Sat, 15 Jun 2024 23:13:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WCTfEHCC"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 633E113B5A8;
	Sat, 15 Jun 2024 23:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718493191; cv=none; b=RVga1eawU63HOeQUmalrTrZKI3kuvzfTWCkJS6UecqFVwBYCe+kAR9lBJ1VkT/vnf14FScAQNbDoii760hLiueaLKU5awgFusJbgqkvyA8N8j++CVDWiKb4f6mXYDJLN/qBMqKLgnw7zZyN/XvJO5CAXSHLHdYqP+jmiTcxQIwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718493191; c=relaxed/simple;
	bh=LeGY0C+gTRF6uWpv1p5f7568QENp8tJvyJ6FnoORh0Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=buvBeQP3O1+ASkSCKGZ3iN76E+rhHzUQiD0IflnHOIchpSXR55ZX75pt1fJ8JP0yI6in4PZ9o/kE3sHH1S5/hYSayN8JZ5rk2i53bAX0fAStqRR7TPjaWXpzMmhv0aljybneFtzST/WM/VQhqc48tNHCqQsQ6qMxZdRv7s3Z0vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WCTfEHCC; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5295eb47b48so3885660e87.1;
        Sat, 15 Jun 2024 16:13:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718493187; x=1719097987; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BNUCQuNA9inI5/zx15X+ljjMizg9qNzUcqGlCVUVA2I=;
        b=WCTfEHCCKzs/QjqLbXISeef1hJfm+5FykAvO5KN1CqQ4hntzMffbFcaEeNhgJz84ey
         47/VUlSGz8o72ufx9RjYxaY8wWVTlpMkw+HtukXjzW1Gn02QsqW8Qi6ZaHpACOZcdI+b
         M3vMSOCVz2nphZKBp1qVi49M7sGXtfiPAZHN4WRb4DrGlBcknLLKl0lGK6tOApgShJHd
         KfPnQoBeeTDOtmYIZEcdmJWcyJjzKxOTw3FYcStbFwoVuAe058KxeqImSnJso9AriSEE
         JM5OIS5TPil5j+JkqcHm9y75JtUHxmu8u2ouaHqJTNSKV8OUdrGCbij4CcpkDD7bjoeS
         MYcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718493187; x=1719097987;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BNUCQuNA9inI5/zx15X+ljjMizg9qNzUcqGlCVUVA2I=;
        b=qNSs6p0xwPmEIWhftFTgz983oll2vSC0U+qmWycLoevKfeGawR6QCqzGSkOROT5tU1
         b39GVIGZUSR8diplxv12nsiaZoYHILWef0TSIsmMMrf3Vr9HlGrCBlm0APc2jRPrh4YV
         cw+4m0LOfX7QfXVgSL6pYFauhfPkac8JRM3A6S0uQJF/IZGCiHPLKlLVhH2pSXTHn8zd
         /OQRC1fsEvTy10duI82yrNe74+eSvVfO+/OHbjv/M26p16mYC0KLvn8UbIpCWrU75yca
         7m0ofKlxZfAxZ6Mk7WXD4o0VEyK5I3NZXSQzLjmEpPdWCYtXzMgNaNcpB79OzXGetDNC
         pkVw==
X-Forwarded-Encrypted: i=1; AJvYcCV15D/0DjdDNPSRhqfKfwOvqP7G9m2a324gApeIjPh7JCwh5uFNFT5zGswnLyTA/Ij3hEOqWUgLgKKFLvW1lXH4sj6CooE09Bnmi9Ofbes8k5blX1U5C9DWmrHLiP4D/JYRsaSVA07D6yMjBDCYYqVQiWlEOAhYR/jnxWTMqNX0Hz4UOFE=
X-Gm-Message-State: AOJu0Yy4QNrV9NjhSTyqr+iWUujuHxRpmYK1oD7GkqqmiqWT2ngiM+Di
	Too/3zyXH4eBnPPAob6LFbRA3m8xBmmwXDApfJZSsTudsft9NjrT
X-Google-Smtp-Source: AGHT+IGo8LUrFDaG8gHXZ5DI1kJy+ZloRFRLUaIMvPVOPaiVrc+Wf/sn8lHFDuMj0yEEywARCjZ96A==
X-Received: by 2002:a05:6512:3d10:b0:52c:a8c4:4d99 with SMTP id 2adb3069b0e04-52ca8c44ec0mr4614573e87.68.1718493187205;
        Sat, 15 Jun 2024 16:13:07 -0700 (PDT)
Received: from localhost.localdomain (93-34-90-105.ip49.fastwebnet.it. [93.34.90.105])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3607509355dsm8145532f8f.13.2024.06.15.16.13.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Jun 2024 16:13:06 -0700 (PDT)
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
Subject: [PATCH v5 18/20] leds: leds-lp55xx: support ENGINE program up to 128 bytes
Date: Sun, 16 Jun 2024 01:11:48 +0200
Message-ID: <20240615231152.28201-19-ansuelsmth@gmail.com>
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
index ac02ab938dd8..9b03d6596c24 100644
--- a/drivers/leds/leds-lp55xx-common.c
+++ b/drivers/leds/leds-lp55xx-common.c
@@ -26,7 +26,8 @@
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
@@ -1281,7 +1300,7 @@ static struct lp55xx_platform_data *lp55xx_of_populate_pdata(struct device *dev,
 int lp55xx_probe(struct i2c_client *client)
 {
 	const struct i2c_device_id *id = i2c_client_get_device_id(client);
-	int ret;
+	int program_length, ret;
 	struct lp55xx_chip *chip;
 	struct lp55xx_led *led;
 	struct lp55xx_platform_data *pdata = dev_get_platdata(&client->dev);
@@ -1305,6 +1324,17 @@ int lp55xx_probe(struct i2c_client *client)
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


