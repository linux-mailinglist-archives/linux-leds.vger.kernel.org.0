Return-Path: <linux-leds+bounces-1974-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FB6590A037
	for <lists+linux-leds@lfdr.de>; Sun, 16 Jun 2024 23:58:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 28B321C212D7
	for <lists+linux-leds@lfdr.de>; Sun, 16 Jun 2024 21:58:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7156413AA41;
	Sun, 16 Jun 2024 21:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J/bpdE3i"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 613926F099;
	Sun, 16 Jun 2024 21:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718574965; cv=none; b=fyMkwfnzJYlq3biAE9n29ipFOl7GAhJs5f61dJBTpm8jzyeR0fEQ+6Iq4qKgaoVd/6PKWFYoISaV/J7oornvvN0ojrKMHPhCbXVrWQCX02v2QnhnqYjm4NuqMzGqynvs9smYGERdkh7/MVfQOuQKhJqqVtRtnmYsbe6emT72e/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718574965; c=relaxed/simple;
	bh=u9LqyGK4M8AuebtBqAqjSHIno9Q8tI1IpOGZVec9b38=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mab6VMdMhB3WSR0WefVK+GthWh6nB0wxn63Wz/jOdFn8aE9NjkJ0gO/jmL27qMsazDQSx5S8KyZ0AGuYkWDLjMwERe5uV1sjPB5NdZLDKiqmS24oG/I7xAbL8GeyEB1zO2lnzRkbzculLCS3iyfvWjKc+budLXg5TlKsSXqhgFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J/bpdE3i; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-35f2c0b7701so2148020f8f.0;
        Sun, 16 Jun 2024 14:56:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718574962; x=1719179762; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fKvoQnyg9GY2ofJkbYZwufhkyLyYoaj7gwKUZpBKT6A=;
        b=J/bpdE3ii+cm0nKPHXO++y0KpGefCW3I2tNBUobSOHIPQoTQNVo76a6cOuZplzSrav
         xVOcLqpiWYtPwsCB17xephwk3Xpd7wHifo+UyFUNLhrlOJcha+KsqsWnNAtYEHgWY0u/
         dvv0fN+9HuP+AlfZ6SJDAkbkkPQGTM0mbeziY3IhoUgOpS7p0Nq/qd+i53Pk/VLdiXKl
         MnujNQ27psjxTruV3XEOsmMYS7+brHh0QfyPDERm/Gen3ngGHvaZtSUPPxFCktpA68Qs
         jC8UdX1BT1UrZIcGBdVM4WVdd95G6ItmNrFw8aerU47flM7pZq8fuNhmtcRmrlJZKSme
         yrvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718574962; x=1719179762;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fKvoQnyg9GY2ofJkbYZwufhkyLyYoaj7gwKUZpBKT6A=;
        b=B9vYSUBvA0QxCiWaSwZ/Mw9T6Gqg0WvmCGn0t6hdaDODOa+bjRtYS/G06Hxx7yXh+v
         7630vkOg8l2xKnTOpw6My8AByybpjxR+rt3oniwfK+eT6Z0gv4PP6UBw24gGamlw0vRv
         bNiSd8YDAp8PERHEwwc729NYS4gNk98nFgwSDQwi92q67BDz9LV4Yl4ojXPEcx46WMJ4
         4tVX/7hzkLDsbDzs2coWA6b/BrKZi/sLSZwQZW7ShCVIEGQOK3nY9iaotBcXjBPQxvB1
         iJmKXQTku5tf2XY0bR2MdRacPlhDkStSYJJ0pc3StHbuUYlAnFcbVg4W1TwcCn3NwjC4
         gBeQ==
X-Forwarded-Encrypted: i=1; AJvYcCVU5eP4IOGzjr22/D0xNpOQVri7g5NOerlo2mk0btdqzVfUpE1fB6FhMCYEAxie1bbXA6Nom7NcAMfVUIdcAAoSQiEf35DNL6x+gmTfAX4zzKaEFf1zL5xfhO/BgJo8cKjqkr5rbyBat2kj7q7k5EPer1ss/E5tbzsw4/w6FQq4UJfE3rg=
X-Gm-Message-State: AOJu0Yx0V1Mzm9AW54SK4p4eeAiw1Nf1kIgOJ4hk4uh4813G2y6bNJNf
	TO8ca2pZm6ZbCIBuHXUj2YN95E0nMw8eTeAJIJaPioc3N14YNPfo
X-Google-Smtp-Source: AGHT+IEWK+0l6NwT5ms/nOdj9u8zDR3ULI0oUIx2mGbqXx49pkKUoy02J8uly+oPf4NGy7PTUjKbBw==
X-Received: by 2002:adf:e608:0:b0:360:866f:5083 with SMTP id ffacd0b85a97d-360866f522cmr5709768f8f.32.1718574961758;
        Sun, 16 Jun 2024 14:56:01 -0700 (PDT)
Received: from localhost.localdomain (93-34-90-105.ip49.fastwebnet.it. [93.34.90.105])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-36075104b74sm10362879f8f.107.2024.06.16.14.56.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Jun 2024 14:56:01 -0700 (PDT)
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
Subject: [PATCH v6 14/20] leds: leds-lp55xx: generalize stop_engine function
Date: Sun, 16 Jun 2024 23:52:13 +0200
Message-ID: <20240616215226.2112-15-ansuelsmth@gmail.com>
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

Generalize stop_engine function as the implementation is the same for
most of the lp55xx based LED driver.

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
index 202b598dd177..09a81476c4ce 100644
--- a/drivers/leds/leds-lp55xx-common.c
+++ b/drivers/leds/leds-lp55xx-common.c
@@ -300,6 +300,19 @@ void lp55xx_turn_off_channels(struct lp55xx_chip *chip)
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
2.43.0


