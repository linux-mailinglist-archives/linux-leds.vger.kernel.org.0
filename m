Return-Path: <linux-leds+bounces-2133-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 39CF9918682
	for <lists+linux-leds@lfdr.de>; Wed, 26 Jun 2024 18:01:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E2852286EEC
	for <lists+linux-leds@lfdr.de>; Wed, 26 Jun 2024 16:01:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1283118FC7C;
	Wed, 26 Jun 2024 16:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rv/UjIw4"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24C8618F2F5;
	Wed, 26 Jun 2024 16:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719417640; cv=none; b=NnaDnGLJDTCqQ/auD7cLClKr7HuEjzff7xGBSgm0A1rpAW3e2bjCXGuHQma4zfPVR2kUArvFU6QtFfG8z+M0CE2YnNHkchCA445wDyNlU3+U8D+MmhNWhbOUtxarMy/9pDKstiZBfx+tDWglVgCRPbZ2avYitq7llTQXWmtEgRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719417640; c=relaxed/simple;
	bh=93mLiP28wcMMSQVfz1jQoVHsOuQ4sq2xtPfGbLAzlCA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GIcL1UaobKa++9a5UZ41VLhwu5oQcLOh15XxBwwFgm4F/FfOl8fhpKf4DYzp/+OZuNX1y0UyH9KRvfnHPp2tI/aqg9SlDpQI6CAmOHVXhpOFszEh0eOFDDd7MZHiZjzsz8b3MQ4SsNXaGkW+KyZomK7equU2cwkovZ+OWuCyiy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rv/UjIw4; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3626c29d3f0so3703074f8f.1;
        Wed, 26 Jun 2024 09:00:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719417636; x=1720022436; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Geth/2KKrcJZcCPnaOdrUx/dTUWfUCygBMVeN3xinMk=;
        b=Rv/UjIw4XUC3JQkWMnIJkSOuczwH1UC5t3Z6j80IIpVCAe2NhuGdK6srCV5ClVi6r8
         fZuBhIcqTBIdm74G+WWWB2Kyk1T0aaIsREVRDwc7e6kOcn4KHJPImfFeI7Heea+edAKY
         2ruVIklQgq2i2nIT5KVcdGA/C6nv/ptscVgjmO1SfIsRTB+lyBnbv9x79C7XK/GGTXNA
         dg6cuNg8C5lbrJUhgt3lJ3d/Bz0G+rkkeJTvg8jaidVRAfpDamBP9Mrta3HiUsHEvL5f
         /kyD0GN025Jc04GwS+xI7nTZQkweS3aS6VrwZRbOc0surHH858BHHTdkZraWbE6nK0t9
         MW2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719417636; x=1720022436;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Geth/2KKrcJZcCPnaOdrUx/dTUWfUCygBMVeN3xinMk=;
        b=SHZ6t/zk4LoahNJCwnZuTPUBm3RHvmQAyEOYcsEFSV6vrTjscVted100OmYCnIL3gf
         5ttZon+uGtVh1n0iIgvrTNqy7LNH4q5fsrx36CFe5FKqgYSVEikAEm05I6BlSXrSAlfm
         NB8dIHEiCTP8lZ0GRt3j2qhvbzPGOcRMYIKsk21pmdcFNkhToQIav/JAiNwAARSwazZf
         6xjH8IW8iBLooPrcH4Pk+e1uH5bP867D7mWQxKeBfQmqqCiXikNwqOujCS0P4QssJvwf
         hed58R+G43aJUEZ7AtPuXCCRdK+HPsz4Jat7w31reszRx2uHGEv47YQf/fourvjS/TSo
         /yBQ==
X-Forwarded-Encrypted: i=1; AJvYcCVWxCJm8S1wbPnj7++n9Qwe4uaVWyDCbJ6cJKvMIgDBNqat9yzo0k7TwZuxniG/AMUKF9i2otYPLFvKZl0kg7SFKHRa2OP+elM4vgEH9kQMh/FtAKVnBxsHdGUm2HlrNYDq5xnSxRP/TlPyOBpZAqTI6a0uid472bgIHWcUmK9BGTqTJAI=
X-Gm-Message-State: AOJu0YxJp6zRB3X6K3j82hLM/L7SsNdnSR/Y0mxEeZAPgaoupcHfSDbr
	7DJzHAUox9LluCpp2UwyapDhUoEctWsBnpRBK/NFdPDvVXNY6jWC
X-Google-Smtp-Source: AGHT+IEO3XqoBn4qLAT1rydr2NcHg2NSrrAfk/ZvMNV405h+lIxhGxJchxJgrJDJcuOR/CtZ7ABlfA==
X-Received: by 2002:a05:6000:4026:b0:361:fd04:95ed with SMTP id ffacd0b85a97d-366e948b84bmr8812852f8f.15.1719417636403;
        Wed, 26 Jun 2024 09:00:36 -0700 (PDT)
Received: from localhost.localdomain (93-34-90-105.ip49.fastwebnet.it. [93.34.90.105])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-366389b88easm16180589f8f.39.2024.06.26.09.00.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 09:00:36 -0700 (PDT)
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
Subject: [PATCH v8 06/20] leds: leds-lp55xx: Generalize load_engine_and_select_page function
Date: Wed, 26 Jun 2024 18:00:11 +0200
Message-ID: <20240626160027.19703-7-ansuelsmth@gmail.com>
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

Generalize load_engine_and_select_page by reworking the implementation
and making it part of the generic load_engine function.

Add a new option in device_config, pages_per_engine used to define pages
assigned to each engine. With this option set, it's assumed LED chip
supports pages and load_engine will correctly setup the write page.

An equal amount of pages is assigned to each engine and they are
assigned from page 0.

Update any lp55xx based LED driver to define the option and use the new
function.

Suggested-by: Lee Jones <lee@kernel.org>
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/leds/leds-lp5523.c        | 22 +++++-----------------
 drivers/leds/leds-lp55xx-common.c | 10 ++++++++++
 drivers/leds/leds-lp55xx-common.h |  3 +++
 drivers/leds/leds-lp8501.c        | 19 +++----------------
 4 files changed, 21 insertions(+), 33 deletions(-)

diff --git a/drivers/leds/leds-lp5523.c b/drivers/leds/leds-lp5523.c
index 086b4d8975a4..8dabd5814110 100644
--- a/drivers/leds/leds-lp5523.c
+++ b/drivers/leds/leds-lp5523.c
@@ -30,6 +30,7 @@
  * 0x40 engine 2 muxing info
  * 0x50 engine 3 muxing info
  */
+#define LP5523_PAGES_PER_ENGINE		1
 #define LP5523_MAX_LEDS			9
 
 /* Registers */
@@ -159,20 +160,6 @@ static int lp5523_post_init_device(struct lp55xx_chip *chip)
 	return lp5523_init_program_engine(chip);
 }
 
-static void lp5523_load_engine_and_select_page(struct lp55xx_chip *chip)
-{
-	enum lp55xx_engine_index idx = chip->engine_idx;
-	static const u8 page_sel[] = {
-		[LP55XX_ENGINE_1] = LP5523_PAGE_ENG1,
-		[LP55XX_ENGINE_2] = LP5523_PAGE_ENG2,
-		[LP55XX_ENGINE_3] = LP5523_PAGE_ENG3,
-	};
-
-	lp55xx_load_engine(chip);
-
-	lp55xx_write(chip, LP5523_REG_PROG_PAGE_SEL, page_sel[idx]);
-}
-
 static void lp5523_stop_engine(struct lp55xx_chip *chip)
 {
 	enum lp55xx_engine_index idx = chip->engine_idx;
@@ -272,7 +259,7 @@ static int lp5523_init_program_engine(struct lp55xx_chip *chip)
 	/* write LED MUX address space for each engine */
 	for (i = LP55XX_ENGINE_1; i <= LP55XX_ENGINE_3; i++) {
 		chip->engine_idx = i;
-		lp5523_load_engine_and_select_page(chip);
+		lp55xx_load_engine(chip);
 
 		for (j = 0; j < LP5523_PROGRAM_LENGTH; j++) {
 			ret = lp55xx_write(chip, LP5523_REG_PROG_MEM + j,
@@ -362,7 +349,7 @@ static void lp5523_firmware_loaded(struct lp55xx_chip *chip)
 	 *  2) write firmware data into program memory
 	 */
 
-	lp5523_load_engine_and_select_page(chip);
+	lp55xx_load_engine(chip);
 	lp5523_update_program_memory(chip, fw->data, fw->size);
 }
 
@@ -544,7 +531,7 @@ static ssize_t store_engine_load(struct device *dev,
 	mutex_lock(&chip->lock);
 
 	chip->engine_idx = nr;
-	lp5523_load_engine_and_select_page(chip);
+	lp55xx_load_engine(chip);
 	ret = lp5523_update_program_memory(chip, buf, len);
 
 	mutex_unlock(&chip->lock);
@@ -865,6 +852,7 @@ static struct lp55xx_device_config lp5523_cfg = {
 		.addr = LP5523_REG_ENABLE,
 		.val  = LP5523_ENABLE,
 	},
+	.pages_per_engine   = LP5523_PAGES_PER_ENGINE,
 	.max_channel  = LP5523_MAX_LEDS,
 	.post_init_device   = lp5523_post_init_device,
 	.brightness_fn      = lp5523_led_brightness,
diff --git a/drivers/leds/leds-lp55xx-common.c b/drivers/leds/leds-lp55xx-common.c
index 3461158ad372..38564b9cda0d 100644
--- a/drivers/leds/leds-lp55xx-common.c
+++ b/drivers/leds/leds-lp55xx-common.c
@@ -46,6 +46,11 @@
 #define   LP55xx_MODE_ENGn_GET(n, mode, shift)        \
 	(((mode) >> LP55xx_MODE_ENGn_SHIFT(n, shift)) & LP55xx_MODE_ENG_MASK)
 
+/* Memory Page Selection */
+#define LP55xx_REG_PROG_PAGE_SEL	0x4f
+/* If supported, each ENGINE have an equal amount of pages offset from page 0 */
+#define LP55xx_PAGE_OFFSET(n, pages)	(((n) - 1) * (pages))
+
 /* External clock rate */
 #define LP55XX_CLK_32K			32768
 
@@ -104,6 +109,11 @@ void lp55xx_load_engine(struct lp55xx_chip *chip)
 
 	lp55xx_update_bits(chip, cfg->reg_op_mode.addr, mask, val);
 	lp55xx_wait_opmode_done(chip);
+
+	/* Setup PAGE if supported (pages_per_engine not 0)*/
+	if (cfg->pages_per_engine)
+		lp55xx_write(chip, LP55xx_REG_PROG_PAGE_SEL,
+			     LP55xx_PAGE_OFFSET(idx, cfg->pages_per_engine));
 }
 EXPORT_SYMBOL_GPL(lp55xx_load_engine);
 
diff --git a/drivers/leds/leds-lp55xx-common.h b/drivers/leds/leds-lp55xx-common.h
index bb146bcecdcf..015ac2ef4e4d 100644
--- a/drivers/leds/leds-lp55xx-common.h
+++ b/drivers/leds/leds-lp55xx-common.h
@@ -99,6 +99,8 @@ struct lp55xx_reg {
  *			 (if not supported 153 us sleep)
  * @reset              : Chip specific reset command
  * @enable             : Chip specific enable command
+ * @pages_per_engine   : Assigned pages for each engine
+ *                       (if not set chip doesn't support pages)
  * @max_channel        : Maximum number of channels
  * @post_init_device   : Chip specific initialization code
  * @brightness_fn      : Brightness function
@@ -113,6 +115,7 @@ struct lp55xx_device_config {
 	const struct lp55xx_reg engine_busy; /* addr, mask */
 	const struct lp55xx_reg reset;
 	const struct lp55xx_reg enable;
+	const int pages_per_engine;
 	const int max_channel;
 
 	/* define if the device has specific initialization process */
diff --git a/drivers/leds/leds-lp8501.c b/drivers/leds/leds-lp8501.c
index 04173d6875af..abe2c4b213d7 100644
--- a/drivers/leds/leds-lp8501.c
+++ b/drivers/leds/leds-lp8501.c
@@ -21,6 +21,7 @@
 #include "leds-lp55xx-common.h"
 
 #define LP8501_PROGRAM_LENGTH		32
+#define LP8501_PAGES_PER_ENGINE		1
 #define LP8501_MAX_LEDS			9
 
 /* Registers */
@@ -116,21 +117,6 @@ static int lp8501_post_init_device(struct lp55xx_chip *chip)
 				LP8501_PWR_CONFIG_M, chip->pdata->pwr_sel);
 }
 
-static void lp8501_load_engine(struct lp55xx_chip *chip)
-{
-	enum lp55xx_engine_index idx = chip->engine_idx;
-
-	static const u8 page_sel[] = {
-		[LP55XX_ENGINE_1] = LP8501_PAGE_ENG1,
-		[LP55XX_ENGINE_2] = LP8501_PAGE_ENG2,
-		[LP55XX_ENGINE_3] = LP8501_PAGE_ENG3,
-	};
-
-	lp55xx_load_engine(chip);
-
-	lp55xx_write(chip, LP8501_REG_PROG_PAGE_SEL, page_sel[idx]);
-}
-
 static void lp8501_turn_off_channels(struct lp55xx_chip *chip)
 {
 	int i;
@@ -250,7 +236,7 @@ static void lp8501_firmware_loaded(struct lp55xx_chip *chip)
 	 *  2) write firmware data into program memory
 	 */
 
-	lp8501_load_engine(chip);
+	lp55xx_load_engine(chip);
 	lp8501_update_program_memory(chip, fw->data, fw->size);
 }
 
@@ -284,6 +270,7 @@ static struct lp55xx_device_config lp8501_cfg = {
 		.addr = LP8501_REG_ENABLE,
 		.val  = LP8501_ENABLE,
 	},
+	.pages_per_engine   = LP8501_PAGES_PER_ENGINE,
 	.max_channel  = LP8501_MAX_LEDS,
 	.post_init_device   = lp8501_post_init_device,
 	.brightness_fn      = lp8501_led_brightness,
-- 
2.45.1


