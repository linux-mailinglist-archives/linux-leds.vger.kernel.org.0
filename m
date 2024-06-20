Return-Path: <linux-leds+bounces-2083-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 779A79114EF
	for <lists+linux-leds@lfdr.de>; Thu, 20 Jun 2024 23:43:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9AA461C2231A
	for <lists+linux-leds@lfdr.de>; Thu, 20 Jun 2024 21:43:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C13AA150991;
	Thu, 20 Jun 2024 21:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jK8cV8OD"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C84614D45A;
	Thu, 20 Jun 2024 21:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718919705; cv=none; b=hkIUjtFOln/0xpa3AwtHxyreNOkems/MvxtMF4Lv6jezFE2V30nRzC8EBS8CAkUFyFqT1IJDlaXEdYgHhViXm2MabWfw8dzJdzlQVxr4EODImDqOn8MbSpqOYbnGu8ctENT4V5FLOWUbyghT+L4N2VTVg1l3N+hG3bQhqzcWLtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718919705; c=relaxed/simple;
	bh=vSqdD0lB+GHwFfN2RL+57FqEEEIb8AoA7CDQH3bU0ZY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=R/TO+V26FpA1c9T4SLU/bLR32oGr27vLaU1XuS/8Eq4ftyMon+m59hEQJ6MZypk9zjAcL8gYgxh0yzGtZTo5qC9R+hbDLY+m9823njt8qDAoo9sQC7o33uTN/gV1QiwESpFT3qpvjEZnIHQCZl1BKcGg83mvccbRx3HlSb+f53I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jK8cV8OD; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-365663f51adso643620f8f.1;
        Thu, 20 Jun 2024 14:41:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718919702; x=1719524502; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FrbReal7lMIAAtnYiQ/ZH8usDjXZPMQ9YxNeEJWEqEw=;
        b=jK8cV8ODbEX0HzHA0MkYBhTZPTwM+zpDA/Ig6p1QQkVzRmN3BT64iOzzbdwuULsP2S
         NBGzAAnwnZBs7dJtbQe2xYx1c0lA0ntMg4iOMy9zPEXyTEF9MJ0wiLyq6YkJy8inWxUH
         1oU3wNyO6XMo9BRz13rM4U5LLRxbXjQtOCrYIS8XOVES7Jr8ncyaOLA5CM1u5Om3j+wU
         H/y2cNQOsBHfoKE8BkvwEfqKYcrlmPWAMJ/N+SpyGZCk/g5Ig9cIMXIlfioKl6Tr/AAA
         rlbL6DNgOkgZ9t53/pbzTC+/5aYzhAHVZI4NjABM0zycw6L9Pi/Cw0hkPXQyhaaBRheD
         VOGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718919702; x=1719524502;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FrbReal7lMIAAtnYiQ/ZH8usDjXZPMQ9YxNeEJWEqEw=;
        b=tvkVf1db8YLOZZG8Z/SmRQ+iCNRZ2GYuSyAXbzO9iqJ0chZs6O/VhIx51D9+vWbw7q
         5gpweQkxis/3GEXjimxAm6TdiqFBIwRezA9elT738GyYG7Gy+JW+hMpXKEBvPVUXPqbZ
         y6nqnq+1z3qNmc5V0jFDJm2KnRR1WcEdxsoBS+zC7fnfsxHzCN7o0DCTUxwW/mck7m//
         UuQW4HZHH3GvR22cZFdWKiIQeE0XeTM9ViXDhB5CPQsBujqLcJSz0+eWyv5sS+ktMuZX
         antPC9vfZnMsyF3Zm3iSBYDEfD/j9FsDK26zAuPaT8SvKLo1wX7hahj01QCVtyjy1e4H
         Vi0A==
X-Forwarded-Encrypted: i=1; AJvYcCUglYkNIkj/z2B1I7uPXd7uV23OMvY6uiMwJWmTCRkhlPILkT9IkNNguQuHYpdoG8WqMXZBPoGREP+FPURphAxxGfYMa6430xpSiyJwq3UwmmCuhw8eU5HZ9bwQUKLrN1kty9rpucLo2QHMD7Rw5PeT9Uibml3JwYjSu+ZPKHB80oyzBsI=
X-Gm-Message-State: AOJu0YymQ4bMkobO0nIL73sWSMXnaYTB4B/R1/68xnEQ+fe4Mi0ETQOp
	l9WYB0F9tJQgb0CcI1XdMwHuEWgOHIpRu391J0l5fCzbwrk14zAe
X-Google-Smtp-Source: AGHT+IHkxXiYUY4OUlcuibf2iOS73Ks7WqypO/UENCk3K49BCq8itEffCUwnXRS84RiFyCA7IzZ7vA==
X-Received: by 2002:a5d:4392:0:b0:35f:1d10:18f0 with SMTP id ffacd0b85a97d-36319a85fadmr5144982f8f.64.1718919701736;
        Thu, 20 Jun 2024 14:41:41 -0700 (PDT)
Received: from localhost.localdomain (93-34-90-105.ip49.fastwebnet.it. [93.34.90.105])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-366383f68acsm48866f8f.2.2024.06.20.14.41.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 14:41:41 -0700 (PDT)
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
Subject: [PATCH v7 07/20] leds: leds-lp55xx: Generalize run_engine function
Date: Thu, 20 Jun 2024 23:03:23 +0200
Message-ID: <20240620210401.22053-8-ansuelsmth@gmail.com>
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

Generalize run_engine function for lp55xx based LED driver. The logic is
similar to every LED driver, rework it with more macro magic and account
for LED model that might have OP MODE and EXEC at base offset in the
reg.

Update any lp55xx based LED driver to use this generalized function and
declare required bits.

Suggested-by: Lee Jones <lee@kernel.org>
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/leds/leds-lp5521.c        | 42 +++++-------------------------
 drivers/leds/leds-lp5523.c        | 41 +++--------------------------
 drivers/leds/leds-lp5562.c        | 42 +++++-------------------------
 drivers/leds/leds-lp55xx-common.c | 43 +++++++++++++++++++++++++++++++
 drivers/leds/leds-lp55xx-common.h |  2 ++
 drivers/leds/leds-lp8501.c        | 41 +++--------------------------
 6 files changed, 65 insertions(+), 146 deletions(-)

diff --git a/drivers/leds/leds-lp5521.c b/drivers/leds/leds-lp5521.c
index 08db470fff6c..0b9f99f4fff2 100644
--- a/drivers/leds/leds-lp5521.c
+++ b/drivers/leds/leds-lp5521.c
@@ -132,8 +132,6 @@ static void lp5521_stop_engine(struct lp55xx_chip *chip)
 static void lp5521_run_engine(struct lp55xx_chip *chip, bool start)
 {
 	int ret;
-	u8 mode;
-	u8 exec;
 
 	/* stop engine */
 	if (!start) {
@@ -143,40 +141,9 @@ static void lp5521_run_engine(struct lp55xx_chip *chip, bool start)
 		return;
 	}
 
-	/*
-	 * To run the engine,
-	 * operation mode and enable register should updated at the same time
-	 */
-
-	ret = lp55xx_read(chip, LP5521_REG_OP_MODE, &mode);
-	if (ret)
-		return;
-
-	ret = lp55xx_read(chip, LP5521_REG_ENABLE, &exec);
-	if (ret)
-		return;
-
-	/* change operation mode to RUN only when each engine is loading */
-	if (LP5521_R_IS_LOADING(mode)) {
-		mode = (mode & ~LP5521_MODE_R_M) | LP5521_RUN_R;
-		exec = (exec & ~LP5521_EXEC_R_M) | LP5521_RUN_R;
-	}
-
-	if (LP5521_G_IS_LOADING(mode)) {
-		mode = (mode & ~LP5521_MODE_G_M) | LP5521_RUN_G;
-		exec = (exec & ~LP5521_EXEC_G_M) | LP5521_RUN_G;
-	}
-
-	if (LP5521_B_IS_LOADING(mode)) {
-		mode = (mode & ~LP5521_MODE_B_M) | LP5521_RUN_B;
-		exec = (exec & ~LP5521_EXEC_B_M) | LP5521_RUN_B;
-	}
-
-	lp55xx_write(chip, LP5521_REG_OP_MODE, mode);
-	lp5521_wait_opmode_done();
-
-	lp55xx_update_bits(chip, LP5521_REG_ENABLE, LP5521_EXEC_M, exec);
-	lp5521_wait_enable_done();
+	ret = lp55xx_run_engine_common(chip);
+	if (!ret)
+		lp5521_wait_enable_done();
 }
 
 static int lp5521_update_program_memory(struct lp55xx_chip *chip,
@@ -476,6 +443,9 @@ static struct lp55xx_device_config lp5521_cfg = {
 	.reg_op_mode = {
 		.addr = LP5521_REG_OP_MODE,
 	},
+	.reg_exec = {
+		.addr = LP5521_REG_ENABLE,
+	},
 	.reset = {
 		.addr = LP5521_REG_RESET,
 		.val  = LP5521_RESET,
diff --git a/drivers/leds/leds-lp5523.c b/drivers/leds/leds-lp5523.c
index 8dabd5814110..b28955b72189 100644
--- a/drivers/leds/leds-lp5523.c
+++ b/drivers/leds/leds-lp5523.c
@@ -184,10 +184,6 @@ static void lp5523_turn_off_channels(struct lp55xx_chip *chip)
 
 static void lp5523_run_engine(struct lp55xx_chip *chip, bool start)
 {
-	int ret;
-	u8 mode;
-	u8 exec;
-
 	/* stop engine */
 	if (!start) {
 		lp5523_stop_engine(chip);
@@ -195,39 +191,7 @@ static void lp5523_run_engine(struct lp55xx_chip *chip, bool start)
 		return;
 	}
 
-	/*
-	 * To run the engine,
-	 * operation mode and enable register should updated at the same time
-	 */
-
-	ret = lp55xx_read(chip, LP5523_REG_OP_MODE, &mode);
-	if (ret)
-		return;
-
-	ret = lp55xx_read(chip, LP5523_REG_ENABLE, &exec);
-	if (ret)
-		return;
-
-	/* change operation mode to RUN only when each engine is loading */
-	if (LP5523_ENG1_IS_LOADING(mode)) {
-		mode = (mode & ~LP5523_MODE_ENG1_M) | LP5523_RUN_ENG1;
-		exec = (exec & ~LP5523_EXEC_ENG1_M) | LP5523_RUN_ENG1;
-	}
-
-	if (LP5523_ENG2_IS_LOADING(mode)) {
-		mode = (mode & ~LP5523_MODE_ENG2_M) | LP5523_RUN_ENG2;
-		exec = (exec & ~LP5523_EXEC_ENG2_M) | LP5523_RUN_ENG2;
-	}
-
-	if (LP5523_ENG3_IS_LOADING(mode)) {
-		mode = (mode & ~LP5523_MODE_ENG3_M) | LP5523_RUN_ENG3;
-		exec = (exec & ~LP5523_EXEC_ENG3_M) | LP5523_RUN_ENG3;
-	}
-
-	lp55xx_write(chip, LP5523_REG_OP_MODE, mode);
-	lp5523_wait_opmode_done();
-
-	lp55xx_update_bits(chip, LP5523_REG_ENABLE, LP5523_EXEC_M, exec);
+	lp55xx_run_engine_common(chip);
 }
 
 static int lp5523_init_program_engine(struct lp55xx_chip *chip)
@@ -840,6 +804,9 @@ static struct lp55xx_device_config lp5523_cfg = {
 	.reg_op_mode = {
 		.addr = LP5523_REG_OP_MODE,
 	},
+	.reg_exec = {
+		.addr = LP5523_REG_ENABLE,
+	},
 	.engine_busy = {
 		.addr = LP5523_REG_STATUS,
 		.mask  = LP5523_ENGINE_BUSY,
diff --git a/drivers/leds/leds-lp5562.c b/drivers/leds/leds-lp5562.c
index 5e26a52f534f..fb05439576c3 100644
--- a/drivers/leds/leds-lp5562.c
+++ b/drivers/leds/leds-lp5562.c
@@ -127,8 +127,6 @@ static void lp5562_set_led_current(struct lp55xx_led *led, u8 led_current)
 static void lp5562_run_engine(struct lp55xx_chip *chip, bool start)
 {
 	int ret;
-	u8 mode;
-	u8 exec;
 
 	/* stop engine */
 	if (!start) {
@@ -141,40 +139,9 @@ static void lp5562_run_engine(struct lp55xx_chip *chip, bool start)
 		return;
 	}
 
-	/*
-	 * To run the engine,
-	 * operation mode and enable register should updated at the same time
-	 */
-
-	ret = lp55xx_read(chip, LP5562_REG_OP_MODE, &mode);
-	if (ret)
-		return;
-
-	ret = lp55xx_read(chip, LP5562_REG_ENABLE, &exec);
-	if (ret)
-		return;
-
-	/* change operation mode to RUN only when each engine is loading */
-	if (LP5562_ENG1_IS_LOADING(mode)) {
-		mode = (mode & ~LP5562_MODE_ENG1_M) | LP5562_RUN_ENG1;
-		exec = (exec & ~LP5562_EXEC_ENG1_M) | LP5562_RUN_ENG1;
-	}
-
-	if (LP5562_ENG2_IS_LOADING(mode)) {
-		mode = (mode & ~LP5562_MODE_ENG2_M) | LP5562_RUN_ENG2;
-		exec = (exec & ~LP5562_EXEC_ENG2_M) | LP5562_RUN_ENG2;
-	}
-
-	if (LP5562_ENG3_IS_LOADING(mode)) {
-		mode = (mode & ~LP5562_MODE_ENG3_M) | LP5562_RUN_ENG3;
-		exec = (exec & ~LP5562_EXEC_ENG3_M) | LP5562_RUN_ENG3;
-	}
-
-	lp55xx_write(chip, LP5562_REG_OP_MODE, mode);
-	lp5562_wait_opmode_done();
-
-	lp55xx_update_bits(chip, LP5562_REG_ENABLE, LP5562_EXEC_M, exec);
-	lp5562_wait_enable_done();
+	ret = lp55xx_run_engine_common(chip);
+	if (!ret)
+		lp5562_wait_enable_done();
 }
 
 static int lp5562_update_firmware(struct lp55xx_chip *chip,
@@ -472,6 +439,9 @@ static struct lp55xx_device_config lp5562_cfg = {
 	.reg_op_mode = {
 		.addr = LP5562_REG_OP_MODE,
 	},
+	.reg_exec = {
+		.addr = LP5562_REG_ENABLE,
+	},
 	.reset = {
 		.addr = LP5562_REG_RESET,
 		.val  = LP5562_RESET,
diff --git a/drivers/leds/leds-lp55xx-common.c b/drivers/leds/leds-lp55xx-common.c
index 38564b9cda0d..9830df285b96 100644
--- a/drivers/leds/leds-lp55xx-common.c
+++ b/drivers/leds/leds-lp55xx-common.c
@@ -46,6 +46,15 @@
 #define   LP55xx_MODE_ENGn_GET(n, mode, shift)        \
 	(((mode) >> LP55xx_MODE_ENGn_SHIFT(n, shift)) & LP55xx_MODE_ENG_MASK)
 
+#define   LP55xx_EXEC_ENG_MASK         GENMASK(1, 0)
+#define   LP55xx_EXEC_HOLD_ENG         FIELD_PREP_CONST(LP55xx_EXEC_ENG_MASK, 0x0)
+#define   LP55xx_EXEC_STEP_ENG         FIELD_PREP_CONST(LP55xx_EXEC_ENG_MASK, 0x1)
+#define   LP55xx_EXEC_RUN_ENG          FIELD_PREP_CONST(LP55xx_EXEC_ENG_MASK, 0x2)
+#define   LP55xx_EXEC_ONCE_ENG         FIELD_PREP_CONST(LP55xx_EXEC_ENG_MASK, 0x3)
+
+#define   LP55xx_EXEC_ENGn_SHIFT(n, shift)    ((shift) + (2 * (3 - (n))))
+#define   LP55xx_EXEC_ENGn_MASK(n, shift)     (LP55xx_EXEC_ENG_MASK << LP55xx_EXEC_ENGn_SHIFT(n, shift))
+
 /* Memory Page Selection */
 #define LP55xx_REG_PROG_PAGE_SEL	0x4f
 /* If supported, each ENGINE have an equal amount of pages offset from page 0 */
@@ -117,6 +126,40 @@ void lp55xx_load_engine(struct lp55xx_chip *chip)
 }
 EXPORT_SYMBOL_GPL(lp55xx_load_engine);
 
+int lp55xx_run_engine_common(struct lp55xx_chip *chip)
+{
+	const struct lp55xx_device_config *cfg = chip->cfg;
+	u8 mode, exec;
+	int i, ret;
+
+	/* To run the engine, both OP MODE and EXEC needs to be put in RUN mode */
+	ret = lp55xx_read(chip, cfg->reg_op_mode.addr, &mode);
+	if (ret)
+		return ret;
+
+	ret = lp55xx_read(chip, cfg->reg_exec.addr, &exec);
+	if (ret)
+		return ret;
+
+	/* Switch to RUN only for engine that were put in LOAD previously */
+	for (i = LP55XX_ENGINE_1; i <= LP55XX_ENGINE_3; i++) {
+		if (LP55xx_MODE_ENGn_GET(i, mode, cfg->reg_op_mode.shift) != LP55xx_MODE_LOAD_ENG)
+			continue;
+
+		mode &= ~LP55xx_MODE_ENGn_MASK(i, cfg->reg_op_mode.shift);
+		mode |= LP55xx_MODE_RUN_ENG << LP55xx_MODE_ENGn_SHIFT(i, cfg->reg_op_mode.shift);
+		exec &= ~LP55xx_EXEC_ENGn_MASK(i, cfg->reg_exec.shift);
+		exec |= LP55xx_EXEC_RUN_ENG << LP55xx_EXEC_ENGn_SHIFT(i, cfg->reg_exec.shift);
+	}
+
+	lp55xx_write(chip, cfg->reg_op_mode.addr, mode);
+	lp55xx_wait_opmode_done(chip);
+	lp55xx_write(chip, cfg->reg_exec.addr, exec);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(lp55xx_run_engine_common);
+
 static void lp55xx_reset_device(struct lp55xx_chip *chip)
 {
 	const struct lp55xx_device_config *cfg = chip->cfg;
diff --git a/drivers/leds/leds-lp55xx-common.h b/drivers/leds/leds-lp55xx-common.h
index 015ac2ef4e4d..dd74b214ec74 100644
--- a/drivers/leds/leds-lp55xx-common.h
+++ b/drivers/leds/leds-lp55xx-common.h
@@ -112,6 +112,7 @@ struct lp55xx_reg {
  */
 struct lp55xx_device_config {
 	const struct lp55xx_reg reg_op_mode; /* addr, shift */
+	const struct lp55xx_reg reg_exec; /* addr, shift */
 	const struct lp55xx_reg engine_busy; /* addr, mask */
 	const struct lp55xx_reg reset;
 	const struct lp55xx_reg enable;
@@ -206,6 +207,7 @@ extern bool lp55xx_is_extclk_used(struct lp55xx_chip *chip);
 /* common chip functions */
 extern void lp55xx_stop_all_engine(struct lp55xx_chip *chip);
 extern void lp55xx_load_engine(struct lp55xx_chip *chip);
+extern int lp55xx_run_engine_common(struct lp55xx_chip *chip);
 
 /* common probe/remove function */
 extern int lp55xx_probe(struct i2c_client *client);
diff --git a/drivers/leds/leds-lp8501.c b/drivers/leds/leds-lp8501.c
index abe2c4b213d7..47b30e9d04a2 100644
--- a/drivers/leds/leds-lp8501.c
+++ b/drivers/leds/leds-lp8501.c
@@ -127,10 +127,6 @@ static void lp8501_turn_off_channels(struct lp55xx_chip *chip)
 
 static void lp8501_run_engine(struct lp55xx_chip *chip, bool start)
 {
-	int ret;
-	u8 mode;
-	u8 exec;
-
 	/* stop engine */
 	if (!start) {
 		lp55xx_stop_all_engine(chip);
@@ -138,39 +134,7 @@ static void lp8501_run_engine(struct lp55xx_chip *chip, bool start)
 		return;
 	}
 
-	/*
-	 * To run the engine,
-	 * operation mode and enable register should updated at the same time
-	 */
-
-	ret = lp55xx_read(chip, LP8501_REG_OP_MODE, &mode);
-	if (ret)
-		return;
-
-	ret = lp55xx_read(chip, LP8501_REG_ENABLE, &exec);
-	if (ret)
-		return;
-
-	/* change operation mode to RUN only when each engine is loading */
-	if (LP8501_ENG1_IS_LOADING(mode)) {
-		mode = (mode & ~LP8501_MODE_ENG1_M) | LP8501_RUN_ENG1;
-		exec = (exec & ~LP8501_EXEC_ENG1_M) | LP8501_RUN_ENG1;
-	}
-
-	if (LP8501_ENG2_IS_LOADING(mode)) {
-		mode = (mode & ~LP8501_MODE_ENG2_M) | LP8501_RUN_ENG2;
-		exec = (exec & ~LP8501_EXEC_ENG2_M) | LP8501_RUN_ENG2;
-	}
-
-	if (LP8501_ENG3_IS_LOADING(mode)) {
-		mode = (mode & ~LP8501_MODE_ENG3_M) | LP8501_RUN_ENG3;
-		exec = (exec & ~LP8501_EXEC_ENG3_M) | LP8501_RUN_ENG3;
-	}
-
-	lp55xx_write(chip, LP8501_REG_OP_MODE, mode);
-	lp8501_wait_opmode_done();
-
-	lp55xx_update_bits(chip, LP8501_REG_ENABLE, LP8501_EXEC_M, exec);
+	lp55xx_run_engine_common(chip);
 }
 
 static int lp8501_update_program_memory(struct lp55xx_chip *chip,
@@ -258,6 +222,9 @@ static struct lp55xx_device_config lp8501_cfg = {
 	.reg_op_mode = {
 		.addr = LP8501_REG_OP_MODE,
 	},
+	.reg_exec = {
+		.addr = LP8501_REG_ENABLE,
+	},
 	.engine_busy = {
 		.addr = LP8501_REG_STATUS,
 		.mask = LP8501_ENGINE_BUSY,
-- 
2.45.1


