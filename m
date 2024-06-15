Return-Path: <linux-leds+bounces-1936-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D1946909A67
	for <lists+linux-leds@lfdr.de>; Sun, 16 Jun 2024 01:13:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AC5C5B21B10
	for <lists+linux-leds@lfdr.de>; Sat, 15 Jun 2024 23:13:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70421763E7;
	Sat, 15 Jun 2024 23:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MaW+B6Nb"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 752227345F;
	Sat, 15 Jun 2024 23:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718493179; cv=none; b=O9LBujSFfoNfnJIuUfmPq+PjqQPjQkfbCYnVma+eRyySD6SVra7v9UR9ZYsfmUQey2sriXh3+UW2yUTA96QZ/hFMFhxQqxvbD8AJLAV1jm2OHH5bLbb8eeIGYPkxrxTHyW6TKnsx5WQarvDtwiDw+g5WXhzXIzvo4p9eTbeJN94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718493179; c=relaxed/simple;
	bh=Ub55otHmmC1QQ5xAyYlayyWLB0FlRN7yWkd2deY5BeQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GhDQXf7/FC7DZfVzwDqhfRASUwqWATn1S0Ki34qItruUAg57HKAOh/82bp/mEwvIuoHG3kpn9RxQ2dGb0ZpoMZIr60lAvN0KLanY+CJxMtInd5tHRTaZS7rSiEG5L34gm+ZsHqXnvCkXMqgyltxdnrVwqZJ7psXTv6t415Gc8Cg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MaW+B6Nb; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-35e1fcd0c0fso2558353f8f.0;
        Sat, 15 Jun 2024 16:12:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718493176; x=1719097976; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T4qut46IlBJ6FtNVM5MuTrqvuDmUzrni7QhOXs9dZ4Q=;
        b=MaW+B6Nb68/oLWrZNU46jj/wATEEcZsySE1al+5cGkLwsiEUutd3Z01wZTkcOF8axb
         tlvuCAeD1UHCpTiUHbl/Wpq1TWVLiniBmHU+IPJFaYK+HmetZc1npWCnSmI8Z8XmOrtD
         007akX1EDeKCYj0bWqA6OL6AIRPvyGqPgfHHxIJaHTR3N78LCXyDMOw74Epq2piIy+Lq
         0j4FUF5Nqe79BbPET9lKZ6S0Nl6jxlun2ZbcceuHmbiX/8l2OAfrZ7EMHKYKW50m5dLk
         cAUBjyO6QUwM3avWON4tfjICnhOOgNcAZ3bixYgC3YFV5mYFmXFp83bgcCkfkHNQyWmS
         5rOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718493176; x=1719097976;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T4qut46IlBJ6FtNVM5MuTrqvuDmUzrni7QhOXs9dZ4Q=;
        b=pDxqOkLCFIQXIt4E1sUAsQ/arlJIs04WDxKafuzHh9VaNgY++x9BtOZjVbAemcTlKQ
         nz3iPH4Lv/wRO06Ue4Fg6mkl2w9OyUzn7VK8vyjKSdhBIHOQTlFFS2/tPnp7Cd+HRH8F
         3qxdHochYrdG4HxQOOpkRdExsRnYCr8gf39OqfkMk9cZbas/rZrQdep3IEi70s6jmHV0
         JGF9V5RZgceKMoOp5bnaaIZ97gjxu9z33tIhh8XduXoso8uf5apj7Na2+n5VzoQ6UTiG
         CVDITUifwUWooFCX3hceD0OjCUyILBhxOowetwtO5KxfubcsSZsjdpXdxCiRQ1zP6khS
         TYrg==
X-Forwarded-Encrypted: i=1; AJvYcCX40cs+9vAWGKlL1bC5VIJq0pk4+t+Y1bnBdYZODJ5F6anVj/O2I/IZUNoI7+VuwWLFldBtxhMQycVrjwPvTagidPbQwqQXBfeFOZ6FeezCRXRk2IdWfbu7y8lkByjqCVGpN/5IBAqhRmnMQF6aoZO+sxQyx6/xxBW9N5wo0JSIZXlep50=
X-Gm-Message-State: AOJu0Ywvu5pLGN0usR0nl2dgIrbmJQVKpXT1WmCKhPg+gzIMPufzncxi
	MRzsYb8bd28LuWt4HhIGAnRvSFiauinR+JFZZwRuoW6pWuBaCtV1
X-Google-Smtp-Source: AGHT+IETCd31gyHMtr+vUX5/5+3MJB86kMdjW/xPPt5/fu7Fy3MUlfy0e7GmWRAkiFDisDoC++7ePA==
X-Received: by 2002:a5d:4b8d:0:b0:35e:8364:f4d4 with SMTP id ffacd0b85a97d-3607a788853mr3876514f8f.58.1718493175788;
        Sat, 15 Jun 2024 16:12:55 -0700 (PDT)
Received: from localhost.localdomain (93-34-90-105.ip49.fastwebnet.it. [93.34.90.105])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3607509355dsm8145532f8f.13.2024.06.15.16.12.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Jun 2024 16:12:55 -0700 (PDT)
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
Subject: [PATCH v5 06/20] leds: leds-lp55xx: generalize load_engine_and_select_page function
Date: Sun, 16 Jun 2024 01:11:36 +0200
Message-ID: <20240615231152.28201-7-ansuelsmth@gmail.com>
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

Generalize load_engine_and_select_page by reworking the implementation
and making it part of the generic load_engine function.

Add a new option in device_config, pages_per_engine used to define pages
assigned to each engine. With this option set, it's assumed LED chip
supports pages and load_engine will correctly setup the write page.

An equal amount of pages is assigned to each engine and they are
assigned from page 0.

Update any lp55xx based LED driver to define the option and use the new
function.

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
index 06cbdef70f9a..636e3ca0bb87 100644
--- a/drivers/leds/leds-lp55xx-common.c
+++ b/drivers/leds/leds-lp55xx-common.c
@@ -45,6 +45,11 @@
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
2.43.0


