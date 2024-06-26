Return-Path: <linux-leds+bounces-2141-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C007B9186A2
	for <lists+linux-leds@lfdr.de>; Wed, 26 Jun 2024 18:03:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 03A041F24345
	for <lists+linux-leds@lfdr.de>; Wed, 26 Jun 2024 16:03:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5371190687;
	Wed, 26 Jun 2024 16:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZIXUF3N3"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 007F9190478;
	Wed, 26 Jun 2024 16:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719417648; cv=none; b=Z4JUofqgu+EL0yd/x10GaB+sQsv+Gae9C3oiV6/vAjiwHkoiLr6G5MXR2Yqpm2zpjEHmjr8MVspu1B1H1JemDFLWV3nzBBUKNiip7vhnYvatMHF769vmXG6RCmlCZY3TiIzhe7FUNUcxMg4rz/79vXebhu2ZT6e9BCAuq2QF+Jk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719417648; c=relaxed/simple;
	bh=qRBtdteaTcYg4FIgeWPA5RcNj/YAZq33i0IGtnVaMP4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hgo0XVjaezw9PaQoB1wEwpW0lp+xbIbF484k7xLurH+7bbYyF/OmhYNws5hWH9udfCxqkvjvFjCvxiw9rOqt7fwTl8L51ERY0Puwpdz2dm6WGC6PFZJ5S6elJBmdih2UgWM6TvDsMaRm4BStu+c9PP9iAkYuqWLuN4kLyx0X1MI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZIXUF3N3; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-424798859dfso55930185e9.0;
        Wed, 26 Jun 2024 09:00:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719417645; x=1720022445; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e73alUsXrK9XDxh1X7OdUWZvWORqfMxB50eGvz/bNmU=;
        b=ZIXUF3N3VIlGIB4X0Yrdx2Fqx7AFTGV011VXSbgLizGiP0ALFSReiX+ls9bYwfRlMd
         mJ9ncJPF41Bm0TgBPxpfNw85/wTcLaGLBF5XvNacME9U90JrbAvLAJfT0pO6+L+j2XdC
         K6JW/TBYllDYZgNUrmMNVAeU1axDtWq5D3oUNb8eLGEeWMydGf4g383JssRFIfdm1zpx
         Fkszvvc8+0a9VdnA3A065dPl3q0Pm7HAumfPlSbUb8StVt2QlOnpRdPDiCi/ZgmuyHDs
         E9KIIdMBD02Dkm3Y/prYq568DP/RykOQ0QZdDcIIE/kFTpoMlOo0zZBNFS3gLk4shCxI
         SU2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719417645; x=1720022445;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e73alUsXrK9XDxh1X7OdUWZvWORqfMxB50eGvz/bNmU=;
        b=el5rcu/LOIAmJlovW0m7bSPjU+7OluOFZAfPrituktLaQ3NQhzAozDqdP9MUDUYMXh
         ERst2708uLfKSVgM+tPI3g3N4cR2vA5x7i4aEdDX0wFeGoOpNdp88iF0x16h2QSuGkwA
         s4vfk/D138Sb2aiLfeH1ZUiWdTtZVVq864b0U4UybzJJI8z30zRQywuQGhWbdrlr7sNK
         NynGcVR7iHwmhLSDh3SFuvw9dK2FO/zzFIc9iYohV5bjX4dQoneGCzk9l2JAixp+r/SH
         x7hnuE3cxb/EKyD9CI7ejjGuelIlHGz7Rkvw5p7IWDYOZgOY1ZU4zqL2mqIyuvFvIDkB
         hFxQ==
X-Forwarded-Encrypted: i=1; AJvYcCVklibkmt5hi0qoyJBCpgh9WhZBN4RkgsvRA1c4tmXVFg7KpSwwhWw3xyIXjSJrfAaZNHT22T+hDrv6T15N4DeaWiQOfuFrXWqXlMbz35/u0obISkZu8nVuvaY+Wq8zMVOuYom0gYhVilbwGw67cKQECAkyqp3a5qjH9fkt0h9g0S9F4+Y=
X-Gm-Message-State: AOJu0YyuH2GY++E/0Ez00a+vpNtmXEZkPMr+TzOapswrJHhfqEw6eZLf
	jCi8B2YYnuRALxenkE+lPbp8yBHjsXu6eUvGVhDMVEU89EI57HCw
X-Google-Smtp-Source: AGHT+IHQhd8I1Usgn0dNhY/opxHr9AGB/UVTool+LffN+0UdrNLCO2Ijyuk0NATNxeLbTYU6QZqSKA==
X-Received: by 2002:a05:6000:12c3:b0:35f:218a:ea60 with SMTP id ffacd0b85a97d-366e948fa7fmr7150843f8f.19.1719417645199;
        Wed, 26 Jun 2024 09:00:45 -0700 (PDT)
Received: from localhost.localdomain (93-34-90-105.ip49.fastwebnet.it. [93.34.90.105])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-366389b88easm16180589f8f.39.2024.06.26.09.00.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 09:00:44 -0700 (PDT)
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
Subject: [PATCH v8 14/20] leds: leds-lp55xx: Generalize stop_engine function
Date: Wed, 26 Jun 2024 18:00:19 +0200
Message-ID: <20240626160027.19703-15-ansuelsmth@gmail.com>
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

Generalize stop_engine function as the implementation is the same for
most of the lp55xx based LED driver.

Suggested-by: Lee Jones <lee@kernel.org>
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/leds/leds-lp5521.c        | 20 +++-----------------
 drivers/leds/leds-lp5523.c        | 20 +++-----------------
 drivers/leds/leds-lp55xx-common.c | 13 +++++++++++++
 drivers/leds/leds-lp55xx-common.h |  1 +
 4 files changed, 20 insertions(+), 34 deletions(-)

diff --git a/drivers/leds/leds-lp5521.c b/drivers/leds/leds-lp5521.c
index a1a3bf0ff703..4afae0c70d19 100644
--- a/drivers/leds/leds-lp5521.c
+++ b/drivers/leds/leds-lp5521.c
@@ -108,27 +108,13 @@ static inline void lp5521_wait_enable_done(void)
 	usleep_range(500, 600);
 }
 
-static void lp5521_stop_engine(struct lp55xx_chip *chip)
-{
-	enum lp55xx_engine_index idx = chip->engine_idx;
-	static const u8 mask[] = {
-		[LP55XX_ENGINE_1] = LP5521_MODE_R_M,
-		[LP55XX_ENGINE_2] = LP5521_MODE_G_M,
-		[LP55XX_ENGINE_3] = LP5521_MODE_B_M,
-	};
-
-	lp55xx_update_bits(chip, LP5521_REG_OP_MODE, mask[idx], 0);
-
-	lp5521_wait_opmode_done();
-}
-
 static void lp5521_run_engine(struct lp55xx_chip *chip, bool start)
 {
 	int ret;
 
 	/* stop engine */
 	if (!start) {
-		lp5521_stop_engine(chip);
+		lp55xx_stop_engine(chip);
 		lp55xx_write(chip, LP5521_REG_OP_MODE, LP5521_CMD_DIRECT);
 		lp5521_wait_opmode_done();
 		return;
@@ -253,11 +239,11 @@ static ssize_t store_engine_mode(struct device *dev,
 		lp5521_run_engine(chip, true);
 		engine->mode = LP55XX_ENGINE_RUN;
 	} else if (!strncmp(buf, "load", 4)) {
-		lp5521_stop_engine(chip);
+		lp55xx_stop_engine(chip);
 		lp55xx_load_engine(chip);
 		engine->mode = LP55XX_ENGINE_LOAD;
 	} else if (!strncmp(buf, "disabled", 8)) {
-		lp5521_stop_engine(chip);
+		lp55xx_stop_engine(chip);
 		engine->mode = LP55XX_ENGINE_DISABLED;
 	}
 
diff --git a/drivers/leds/leds-lp5523.c b/drivers/leds/leds-lp5523.c
index 4a4463cb44a4..1dd909a0fff5 100644
--- a/drivers/leds/leds-lp5523.c
+++ b/drivers/leds/leds-lp5523.c
@@ -153,25 +153,11 @@ static int lp5523_post_init_device(struct lp55xx_chip *chip)
 	return lp5523_init_program_engine(chip);
 }
 
-static void lp5523_stop_engine(struct lp55xx_chip *chip)
-{
-	enum lp55xx_engine_index idx = chip->engine_idx;
-	static const u8 mask[] = {
-		[LP55XX_ENGINE_1] = LP5523_MODE_ENG1_M,
-		[LP55XX_ENGINE_2] = LP5523_MODE_ENG2_M,
-		[LP55XX_ENGINE_3] = LP5523_MODE_ENG3_M,
-	};
-
-	lp55xx_update_bits(chip, LP5523_REG_OP_MODE, mask[idx], 0);
-
-	lp5523_wait_opmode_done();
-}
-
 static void lp5523_run_engine(struct lp55xx_chip *chip, bool start)
 {
 	/* stop engine */
 	if (!start) {
-		lp5523_stop_engine(chip);
+		lp55xx_stop_engine(chip);
 		lp55xx_turn_off_channels(chip);
 		return;
 	}
@@ -277,11 +263,11 @@ static ssize_t store_engine_mode(struct device *dev,
 		lp5523_run_engine(chip, true);
 		engine->mode = LP55XX_ENGINE_RUN;
 	} else if (!strncmp(buf, "load", 4)) {
-		lp5523_stop_engine(chip);
+		lp55xx_stop_engine(chip);
 		lp55xx_load_engine(chip);
 		engine->mode = LP55XX_ENGINE_LOAD;
 	} else if (!strncmp(buf, "disabled", 8)) {
-		lp5523_stop_engine(chip);
+		lp55xx_stop_engine(chip);
 		engine->mode = LP55XX_ENGINE_DISABLED;
 	}
 
diff --git a/drivers/leds/leds-lp55xx-common.c b/drivers/leds/leds-lp55xx-common.c
index 58121f27f17b..cecff34e6e15 100644
--- a/drivers/leds/leds-lp55xx-common.c
+++ b/drivers/leds/leds-lp55xx-common.c
@@ -298,6 +298,19 @@ void lp55xx_turn_off_channels(struct lp55xx_chip *chip)
 }
 EXPORT_SYMBOL_GPL(lp55xx_turn_off_channels);
 
+void lp55xx_stop_engine(struct lp55xx_chip *chip)
+{
+	enum lp55xx_engine_index idx = chip->engine_idx;
+	const struct lp55xx_device_config *cfg = chip->cfg;
+	u8 mask;
+
+	mask = LP55xx_MODE_ENGn_MASK(idx, cfg->reg_op_mode.shift);
+	lp55xx_update_bits(chip, cfg->reg_op_mode.addr, mask, 0);
+
+	lp55xx_wait_opmode_done(chip);
+}
+EXPORT_SYMBOL_GPL(lp55xx_stop_engine);
+
 static void lp55xx_reset_device(struct lp55xx_chip *chip)
 {
 	const struct lp55xx_device_config *cfg = chip->cfg;
diff --git a/drivers/leds/leds-lp55xx-common.h b/drivers/leds/leds-lp55xx-common.h
index 531fbb0acb2e..0aba6955a3af 100644
--- a/drivers/leds/leds-lp55xx-common.h
+++ b/drivers/leds/leds-lp55xx-common.h
@@ -221,6 +221,7 @@ extern int lp55xx_led_brightness(struct lp55xx_led *led);
 extern int lp55xx_multicolor_brightness(struct lp55xx_led *led);
 extern void lp55xx_set_led_current(struct lp55xx_led *led, u8 led_current);
 extern void lp55xx_turn_off_channels(struct lp55xx_chip *chip);
+extern void lp55xx_stop_engine(struct lp55xx_chip *chip);
 
 /* common probe/remove function */
 extern int lp55xx_probe(struct i2c_client *client);
-- 
2.45.1


