Return-Path: <linux-leds+bounces-2130-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1452491867B
	for <lists+linux-leds@lfdr.de>; Wed, 26 Jun 2024 18:01:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8BF541F2347F
	for <lists+linux-leds@lfdr.de>; Wed, 26 Jun 2024 16:01:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CF3718F2E1;
	Wed, 26 Jun 2024 16:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gePUAZ3l"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D75918EFDD;
	Wed, 26 Jun 2024 16:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719417637; cv=none; b=fIY0FrWWAHUULDQnH8eetwmoVOg48+nKxSWwqgkopCEpi/Q8JazCglo70pN32H+SfptfmuYbyebmucjdIwXJizgVbqoUfowDXW3ITi0TEyTQ9C51wMWXCWPiIVML59Hl3pEwMAgeadcggccG9pbbftrmdSgYTPaRv2nXaza5sKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719417637; c=relaxed/simple;
	bh=cJY2A4iwCD2H2HGn2xCrNow6WHZ3DGe15RoL6M7ieXs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ndTmQpkBfdRx6HD9ZSEc6p04QxRpIY1XgkU1O7BTAyMyOLAA6b+zxnYyIkUj9bEvJBsZ07FWXR3rHauIcG+47ALE2saQ26g5r18BegDvXoa8cD0bXgMrpxZkhUAGMXhKkrD1s+QJ3HMX7gv/xRQdzGidfJey/8kNj6C8cv4EHxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gePUAZ3l; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-42561c16ffeso3016325e9.3;
        Wed, 26 Jun 2024 09:00:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719417633; x=1720022433; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CNCxnfRQPf3DBQ/HLPJw4xF+BwLUh9SE1Sc3HbnI/v8=;
        b=gePUAZ3lCK+V4vmEMmKcxLADF7F6eyl56TYwMQSbGwSQMJpDXaTwDT9cKl/YLmM6WB
         KQgVvTmAKvGmTYmfJL2VTH1lEe86D90Q4Jaj9KSYGkaNaWS0ukrrao4MwXRSXZVgqXvO
         0p/AnIewGm7r1Tx4LFYVQqbSX7E8u3hk+MeaOALK+7zP7EQ7YCxmFCZajtVmksmuiWm0
         3rBR/U0kbPReifROd6LmTg/IXmnKoyScLr6Kbx8RfrQn/sKnLl+6/MF7ETN/BkF1iTvz
         GLx0/aYtfB90/8SxuqBC72gacl+P2IkJOUaTEXj0KSI/K4vvrIBiu0tJvsmnKoNDe/lW
         TrnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719417633; x=1720022433;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CNCxnfRQPf3DBQ/HLPJw4xF+BwLUh9SE1Sc3HbnI/v8=;
        b=AOr7YdyTkB2nxoBjT14AAXGPaNSRzVttPe2LnxaojdjsaAHtyW4cF33gA8IN1Y2YTD
         eiiOV4eOCczFtxqbJ5HHjtLwwyjYD7WX37viyd7QpVVF3/cgdiGh3mHPwRpxx+ZuYiYZ
         YU7OnQ0ExKjYrmR4uniHhuz0LxCf4W0pApGrUDtgPTkV22uARJVJWhFAUbdevOFOC+jf
         TnVlqGzzzVe/sDKL1TguZ+84t74YnosDFtPw8TxijQgOpNFWC0kkEf9cmjdrGdosjXR3
         2oFdoI56jTdO1fWqy8Gs4fbnSrmDjZPrC5Xl1SIRe/CeSpvg8xmbnTVnrgml14gLGDZR
         Hcbw==
X-Forwarded-Encrypted: i=1; AJvYcCXb3a86wLvIzmZsNkb4FyLMAmkYls2cQOIVDwo7Q7uVZPKUVYzmQHHtLgx2XtHLUw5yeHGzdEcUzREkTLgOIsfMCRNvVSZtaVc2dImgtpOeTJRdTgMEa2cvAEIomB7inwnTY+lVHWgFrw4xxkuB1T9kXScthYQVZVhnwD5S7++jQgdJ+zg=
X-Gm-Message-State: AOJu0YyK3H1oTUKTgkR37hP2Mxm63Ww7MOF7snkqF63dJ4UkDJIi+WD9
	JiBbXMb6fIyYWNDdi7aEaXYkKBbwGA47wFfEzmYyOANqwfE8m3fA
X-Google-Smtp-Source: AGHT+IFWM2zryxiPu6aQVHfJ+U2Lf2E1F/vKFONiKBtER6oUBj+Gm4fGZWO//7Wg+gKKV6WcuzTsLg==
X-Received: by 2002:a5d:6dac:0:b0:35f:283e:dae2 with SMTP id ffacd0b85a97d-366e95d93a7mr8304523f8f.48.1719417633425;
        Wed, 26 Jun 2024 09:00:33 -0700 (PDT)
Received: from localhost.localdomain (93-34-90-105.ip49.fastwebnet.it. [93.34.90.105])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-366389b88easm16180589f8f.39.2024.06.26.09.00.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 09:00:33 -0700 (PDT)
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
Subject: [PATCH v8 03/20] leds: leds-lp55xx: Generalize stop_all_engine OP
Date: Wed, 26 Jun 2024 18:00:08 +0200
Message-ID: <20240626160027.19703-4-ansuelsmth@gmail.com>
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

In all the lp55xx based driver, we have a similar implementation of the
stop_all_engine function with the only difference of the required sleep
for the OP MODE change.

The main difference is legacy LEDs require a min of 152 us while new one
use a generic 1-2ms. The new one use a 1-2ms sleep as suggested in the
datasheet IN ALTERNATIVE to a much more robust approach by using the
newly introduced ENGINE_BUSY bit in the STATUS reg.

To better handle sleep after OP MODE change, add support for polling the
ENGINE_BUSY bit and use the legacy sleep for old LEDs.

With this change, stop_all_engine can be generalized and moved to
lp55xx-common.

To make more clear the double usage of lp55xx_reg, define a union for
additional scope of mask and shift.

Update all lp55xx based driver to use the new generalized function and
define the required bits in the device_config struct.

Suggested-by: Lee Jones <lee@kernel.org>
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/leds/leds-lp5521.c        | 11 ++++------
 drivers/leds/leds-lp5523.c        | 20 ++++++++++-------
 drivers/leds/leds-lp5562.c        | 15 ++++++-------
 drivers/leds/leds-lp55xx-common.c | 36 +++++++++++++++++++++++++++++++
 drivers/leds/leds-lp55xx-common.h | 16 ++++++++++++--
 drivers/leds/leds-lp8501.c        | 20 ++++++++++-------
 6 files changed, 84 insertions(+), 34 deletions(-)

diff --git a/drivers/leds/leds-lp5521.c b/drivers/leds/leds-lp5521.c
index d242c12e7569..8b006de400fd 100644
--- a/drivers/leds/leds-lp5521.c
+++ b/drivers/leds/leds-lp5521.c
@@ -135,12 +135,6 @@ static void lp5521_load_engine(struct lp55xx_chip *chip)
 	lp5521_wait_opmode_done();
 }
 
-static void lp5521_stop_all_engines(struct lp55xx_chip *chip)
-{
-	lp55xx_write(chip, LP5521_REG_OP_MODE, 0);
-	lp5521_wait_opmode_done();
-}
-
 static void lp5521_stop_engine(struct lp55xx_chip *chip)
 {
 	enum lp55xx_engine_index idx = chip->engine_idx;
@@ -499,6 +493,9 @@ static const struct attribute_group lp5521_group = {
 
 /* Chip specific configurations */
 static struct lp55xx_device_config lp5521_cfg = {
+	.reg_op_mode = {
+		.addr = LP5521_REG_OP_MODE,
+	},
 	.reset = {
 		.addr = LP5521_REG_RESET,
 		.val  = LP5521_RESET,
@@ -585,7 +582,7 @@ static void lp5521_remove(struct i2c_client *client)
 	struct lp55xx_led *led = i2c_get_clientdata(client);
 	struct lp55xx_chip *chip = led->chip;
 
-	lp5521_stop_all_engines(chip);
+	lp55xx_stop_all_engine(chip);
 	lp55xx_unregister_sysfs(chip);
 	lp55xx_deinit_device(chip);
 }
diff --git a/drivers/leds/leds-lp5523.c b/drivers/leds/leds-lp5523.c
index 38de853f9939..79931555eddd 100644
--- a/drivers/leds/leds-lp5523.c
+++ b/drivers/leds/leds-lp5523.c
@@ -41,7 +41,10 @@
 #define LP5523_REG_LED_PWM_BASE		0x16
 #define LP5523_REG_LED_CURRENT_BASE	0x26
 #define LP5523_REG_CONFIG		0x36
+
 #define LP5523_REG_STATUS		0x3A
+#define LP5523_ENGINE_BUSY		BIT(4)
+
 #define LP5523_REG_RESET		0x3D
 #define LP5523_REG_LED_TEST_CTRL	0x41
 #define LP5523_REG_LED_TEST_ADC		0x42
@@ -190,12 +193,6 @@ static void lp5523_load_engine_and_select_page(struct lp55xx_chip *chip)
 	lp55xx_write(chip, LP5523_REG_PROG_PAGE_SEL, page_sel[idx]);
 }
 
-static void lp5523_stop_all_engines(struct lp55xx_chip *chip)
-{
-	lp55xx_write(chip, LP5523_REG_OP_MODE, 0);
-	lp5523_wait_opmode_done();
-}
-
 static void lp5523_stop_engine(struct lp55xx_chip *chip)
 {
 	enum lp55xx_engine_index idx = chip->engine_idx;
@@ -322,7 +319,7 @@ static int lp5523_init_program_engine(struct lp55xx_chip *chip)
 	}
 
 out:
-	lp5523_stop_all_engines(chip);
+	lp55xx_stop_all_engine(chip);
 	return ret;
 }
 
@@ -873,6 +870,13 @@ static const struct attribute_group lp5523_group = {
 
 /* Chip specific configurations */
 static struct lp55xx_device_config lp5523_cfg = {
+	.reg_op_mode = {
+		.addr = LP5523_REG_OP_MODE,
+	},
+	.engine_busy = {
+		.addr = LP5523_REG_STATUS,
+		.mask  = LP5523_ENGINE_BUSY,
+	},
 	.reset = {
 		.addr = LP5523_REG_RESET,
 		.val  = LP5523_RESET,
@@ -959,7 +963,7 @@ static void lp5523_remove(struct i2c_client *client)
 	struct lp55xx_led *led = i2c_get_clientdata(client);
 	struct lp55xx_chip *chip = led->chip;
 
-	lp5523_stop_all_engines(chip);
+	lp55xx_stop_all_engine(chip);
 	lp55xx_unregister_sysfs(chip);
 	lp55xx_deinit_device(chip);
 }
diff --git a/drivers/leds/leds-lp5562.c b/drivers/leds/leds-lp5562.c
index e545ca8bd1f6..123abfc7b6c4 100644
--- a/drivers/leds/leds-lp5562.c
+++ b/drivers/leds/leds-lp5562.c
@@ -144,12 +144,6 @@ static void lp5562_load_engine(struct lp55xx_chip *chip)
 	lp5562_wait_opmode_done();
 }
 
-static void lp5562_stop_engine(struct lp55xx_chip *chip)
-{
-	lp55xx_write(chip, LP5562_REG_OP_MODE, LP5562_CMD_DISABLE);
-	lp5562_wait_opmode_done();
-}
-
 static void lp5562_run_engine(struct lp55xx_chip *chip, bool start)
 {
 	int ret;
@@ -160,7 +154,7 @@ static void lp5562_run_engine(struct lp55xx_chip *chip, bool start)
 	if (!start) {
 		lp55xx_write(chip, LP5562_REG_ENABLE, LP5562_ENABLE_DEFAULT);
 		lp5562_wait_enable_done();
-		lp5562_stop_engine(chip);
+		lp55xx_stop_all_engine(chip);
 		lp55xx_write(chip, LP5562_REG_ENG_SEL, LP5562_ENG_SEL_PWM);
 		lp55xx_write(chip, LP5562_REG_OP_MODE, LP5562_CMD_DIRECT);
 		lp5562_wait_opmode_done();
@@ -369,7 +363,7 @@ static int lp5562_run_predef_led_pattern(struct lp55xx_chip *chip, int mode)
 		return -EINVAL;
 	}
 
-	lp5562_stop_engine(chip);
+	lp55xx_stop_all_engine(chip);
 
 	/* Set LED map as RGB */
 	lp55xx_write(chip, LP5562_REG_ENG_SEL, LP5562_ENG_SEL_RGB);
@@ -495,6 +489,9 @@ static const struct attribute_group lp5562_group = {
 /* Chip specific configurations */
 static struct lp55xx_device_config lp5562_cfg = {
 	.max_channel  = LP5562_MAX_LEDS,
+	.reg_op_mode = {
+		.addr = LP5562_REG_OP_MODE,
+	},
 	.reset = {
 		.addr = LP5562_REG_RESET,
 		.val  = LP5562_RESET,
@@ -577,7 +574,7 @@ static void lp5562_remove(struct i2c_client *client)
 	struct lp55xx_led *led = i2c_get_clientdata(client);
 	struct lp55xx_chip *chip = led->chip;
 
-	lp5562_stop_engine(chip);
+	lp55xx_stop_all_engine(chip);
 
 	lp55xx_unregister_sysfs(chip);
 	lp55xx_deinit_device(chip);
diff --git a/drivers/leds/leds-lp55xx-common.c b/drivers/leds/leds-lp55xx-common.c
index 8e7074f0fee0..2cbc5b302fd4 100644
--- a/drivers/leds/leds-lp55xx-common.c
+++ b/drivers/leds/leds-lp55xx-common.c
@@ -13,6 +13,7 @@
 #include <linux/delay.h>
 #include <linux/firmware.h>
 #include <linux/i2c.h>
+#include <linux/iopoll.h>
 #include <linux/leds.h>
 #include <linux/module.h>
 #include <linux/platform_data/leds-lp55xx.h>
@@ -22,6 +23,12 @@
 
 #include "leds-lp55xx-common.h"
 
+/* OP MODE require at least 153 us to clear regs */
+#define LP55XX_CMD_SLEEP		200
+
+/* Program Commands */
+#define LP55xx_MODE_DISABLE_ALL_ENG	0x0
+
 /* External clock rate */
 #define LP55XX_CLK_32K			32768
 
@@ -40,6 +47,35 @@ static struct lp55xx_led *mcled_cdev_to_led(struct led_classdev_mc *mc_cdev)
 	return container_of(mc_cdev, struct lp55xx_led, mc_cdev);
 }
 
+static void lp55xx_wait_opmode_done(struct lp55xx_chip *chip)
+{
+	struct lp55xx_device_config *cfg = chip->cfg;
+	int __always_unused ret;
+	u8 val;
+
+	/*
+	 * Recent chip supports BUSY bit for engine.
+	 * Check support by checking if val is not 0.
+	 * For legacy device, sleep at least 153 us.
+	 */
+	if (cfg->engine_busy.val) {
+		read_poll_timeout(lp55xx_read, ret, !(val & cfg->engine_busy.mask),
+				  LP55XX_CMD_SLEEP, LP55XX_CMD_SLEEP * 10, false,
+				  chip, cfg->engine_busy.addr, &val);
+	} else {
+		usleep_range(LP55XX_CMD_SLEEP, LP55XX_CMD_SLEEP * 2);
+	}
+}
+
+void lp55xx_stop_all_engine(struct lp55xx_chip *chip)
+{
+	struct lp55xx_device_config *cfg = chip->cfg;
+
+	lp55xx_write(chip, cfg->reg_op_mode.addr, LP55xx_MODE_DISABLE_ALL_ENG);
+	lp55xx_wait_opmode_done(chip);
+}
+EXPORT_SYMBOL_GPL(lp55xx_stop_all_engine);
+
 static void lp55xx_reset_device(struct lp55xx_chip *chip)
 {
 	struct lp55xx_device_config *cfg = chip->cfg;
diff --git a/drivers/leds/leds-lp55xx-common.h b/drivers/leds/leds-lp55xx-common.h
index 2f38c5b33830..c7c8a77ddb1a 100644
--- a/drivers/leds/leds-lp55xx-common.h
+++ b/drivers/leds/leds-lp55xx-common.h
@@ -81,15 +81,22 @@ struct lp55xx_chip;
 /*
  * struct lp55xx_reg
  * @addr : Register address
- * @val  : Register value
+ * @val  : Register value (can also used as mask or shift)
  */
 struct lp55xx_reg {
 	u8 addr;
-	u8 val;
+	union {
+		u8 val;
+		u8 mask;
+		u8 shift;
+	};
 };
 
 /*
  * struct lp55xx_device_config
+ * @reg_op_mode        : Chip specific OP MODE reg addr
+ * @engine_busy        : Chip specific engine busy
+ *			 (if not supported 153 us sleep)
  * @reset              : Chip specific reset command
  * @enable             : Chip specific enable command
  * @max_channel        : Maximum number of channels
@@ -102,6 +109,8 @@ struct lp55xx_reg {
  * @dev_attr_group     : Device specific attributes
  */
 struct lp55xx_device_config {
+	const struct lp55xx_reg reg_op_mode; /* addr, shift */
+	const struct lp55xx_reg engine_busy; /* addr, mask */
 	const struct lp55xx_reg reset;
 	const struct lp55xx_reg enable;
 	const int max_channel;
@@ -191,6 +200,9 @@ extern int lp55xx_update_bits(struct lp55xx_chip *chip, u8 reg,
 /* external clock detection */
 extern bool lp55xx_is_extclk_used(struct lp55xx_chip *chip);
 
+/* common chip functions */
+extern void lp55xx_stop_all_engine(struct lp55xx_chip *chip);
+
 /* common device init/deinit functions */
 extern int lp55xx_init_device(struct lp55xx_chip *chip);
 extern void lp55xx_deinit_device(struct lp55xx_chip *chip);
diff --git a/drivers/leds/leds-lp8501.c b/drivers/leds/leds-lp8501.c
index 68b5c7ae31b9..9eaad0c2148f 100644
--- a/drivers/leds/leds-lp8501.c
+++ b/drivers/leds/leds-lp8501.c
@@ -58,6 +58,9 @@
 #define LP8501_INT_CLK			BIT(0)
 #define LP8501_DEFAULT_CFG (LP8501_PWM_PSAVE | LP8501_AUTO_INC | LP8501_PWR_SAVE)
 
+#define LP8501_REG_STATUS		0x3A
+#define LP8501_ENGINE_BUSY		BIT(4)
+
 #define LP8501_REG_RESET		0x3D
 #define LP8501_RESET			0xFF
 
@@ -141,12 +144,6 @@ static void lp8501_load_engine(struct lp55xx_chip *chip)
 	lp55xx_write(chip, LP8501_REG_PROG_PAGE_SEL, page_sel[idx]);
 }
 
-static void lp8501_stop_engine(struct lp55xx_chip *chip)
-{
-	lp55xx_write(chip, LP8501_REG_OP_MODE, 0);
-	lp8501_wait_opmode_done();
-}
-
 static void lp8501_turn_off_channels(struct lp55xx_chip *chip)
 {
 	int i;
@@ -163,7 +160,7 @@ static void lp8501_run_engine(struct lp55xx_chip *chip, bool start)
 
 	/* stop engine */
 	if (!start) {
-		lp8501_stop_engine(chip);
+		lp55xx_stop_all_engine(chip);
 		lp8501_turn_off_channels(chip);
 		return;
 	}
@@ -285,6 +282,13 @@ static int lp8501_led_brightness(struct lp55xx_led *led)
 
 /* Chip specific configurations */
 static struct lp55xx_device_config lp8501_cfg = {
+	.reg_op_mode = {
+		.addr = LP8501_REG_OP_MODE,
+	},
+	.engine_busy = {
+		.addr = LP8501_REG_STATUS,
+		.maks = LP8501_ENGINE_BUSY,
+	},
 	.reset = {
 		.addr = LP8501_REG_RESET,
 		.val  = LP8501_RESET,
@@ -369,7 +373,7 @@ static void lp8501_remove(struct i2c_client *client)
 	struct lp55xx_led *led = i2c_get_clientdata(client);
 	struct lp55xx_chip *chip = led->chip;
 
-	lp8501_stop_engine(chip);
+	lp55xx_stop_all_engine(chip);
 	lp55xx_unregister_sysfs(chip);
 	lp55xx_deinit_device(chip);
 }
-- 
2.45.1


