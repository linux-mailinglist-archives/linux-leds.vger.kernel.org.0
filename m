Return-Path: <linux-leds+bounces-2089-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E0899114FF
	for <lists+linux-leds@lfdr.de>; Thu, 20 Jun 2024 23:44:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B17CA1C225CE
	for <lists+linux-leds@lfdr.de>; Thu, 20 Jun 2024 21:44:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A112415538A;
	Thu, 20 Jun 2024 21:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FNVHmV6M"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8918153BF9;
	Thu, 20 Jun 2024 21:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718919711; cv=none; b=fcTWhMBz9MN2a7o2TPhWbvwKLdzOZS2bFtR45/+ccLw4p2F4pHoUWZ6zYvbCYyZyESFeCx8t5sUNVtP8N3ae3+D1+Ukg41K5SMI9RtNWqXp55sIYDyDvB+rS3snpyi1lODh7xYIWBZ3IdFwla4MHsn9rR6Mwd/+4Wv+XrUvROxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718919711; c=relaxed/simple;
	bh=WYfEnqGU/jttnGRW1Dl3AAXqGn8PsUodgf/YFXg4lD0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HF7UD/BVPDcxkPrYoKlgyQO6V2FsrRhmqoIcnRbdoLlf9g5uLqYzlvAu2YcSq8cqGnyv+Poy7471sE1H3hLB9Iqj/BiyZOKRDRtDsl3+8lz8609VjqYQqX9Rqq8U7vqIt+jIZmYPKBoDDy6wjjDmL+US+s/j9GO8Fvx1EyeNPTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FNVHmV6M; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-42172ed3487so11049685e9.0;
        Thu, 20 Jun 2024 14:41:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718919708; x=1719524508; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gKKOM38AF+UhyCgTW0uK8yuV/Hf10uvfG1nRgbJlZYo=;
        b=FNVHmV6MlHzr3OuUp9ocEczGFrXe3OsxbuRf4onxFl1VyJt/wmuV7xSQyk29170d4y
         I8i8Gb/xhm/C1bRnmB2iB4l2qOc6hMDrrZQ6YECehGHO9zsn/tiKMzfS6Ksp1Brrx2Sc
         aUufs/7zUOpSowJGJO9550hr3dREbGEwni2d8bUrOyLbPtF+D/xJHO5wy4NdxQcfLA4E
         SN8vpJeWLAtoDuu73P+lq/QMxjTHMUZA1G7ve9KqQgEhINRN21Vu5GtAKbe4MxWC3frr
         6ypfDR7kZpY1hSB+QlfO1jlqUEfrkUrWBFJYWrJXfGqaVlcc7nzao7JqZ3gxVNJdKxNU
         tQLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718919708; x=1719524508;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gKKOM38AF+UhyCgTW0uK8yuV/Hf10uvfG1nRgbJlZYo=;
        b=pQvj238w/86UjowDkQRvRZtyIk6Lv2LmmD6nFIlBiqfleCO/RfjCDu83jpLMDiE78X
         ESLg+NSpmF2CMr6W4C84m/ZFoBjSPTD6q6eLKhxtIRZFaD1j56DtBbG00uW9hJagFWx0
         ljAC2kJVV68DWUJoB01d0aUQlqgeTvz8JGFxCFjP+XgHTA1ayPw/P9UanQ4G3WQyQk3y
         uEdtffqVoFuiv+N0k63pOjqIFBOEGG/m4MfsufRyiitspSy3fal/oO6m72FfUsooNo/G
         2sgd3OZSnr5LlPJIvDLHjSFcWLrZqhdQh8me2C36HTK5k7oy0YXMOkTse+irRvYFDnCY
         dUuw==
X-Forwarded-Encrypted: i=1; AJvYcCVMNo4InjEKkKP3c0hlg+nitManM1N5n/7VHRhd/EIagTc0PJH5Rp52g3Uxxo1XgqPzgGTBAy14talZzkX1EGbAHai7RFp7VH+oy1i8gr4prqFiJFXcXikFcR7j3Hd+pO4lC5yCqxPIrBUA9COGTB1BQcmmTSInrNXNu4GLMyxunDzQjjU=
X-Gm-Message-State: AOJu0YwgqWlVopQGiakzgVpsq0ak0V66M/f/oD3PypYkfaNb2IGYwCkS
	V7Uvli0c+IE6gGohXf0x8vHUTQ/VIP8z/5TfT+9L/qb+SsNvIEpf+a5FgQ==
X-Google-Smtp-Source: AGHT+IE5SXGll+857JotNm7EnE6f284l4CEv18cEuilWB+T2YFyLxi+CVXAz+u8M9EM74+BgJWc5hA==
X-Received: by 2002:a05:600c:5123:b0:424:7543:863e with SMTP id 5b1f17b1804b1-42475438771mr49736835e9.6.1718919707928;
        Thu, 20 Jun 2024 14:41:47 -0700 (PDT)
Received: from localhost.localdomain (93-34-90-105.ip49.fastwebnet.it. [93.34.90.105])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-366383f68acsm48866f8f.2.2024.06.20.14.41.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 14:41:47 -0700 (PDT)
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
Subject: [PATCH v7 13/20] leds: leds-lp55xx: Generalize turn_off_channels function
Date: Thu, 20 Jun 2024 23:03:29 +0200
Message-ID: <20240620210401.22053-14-ansuelsmth@gmail.com>
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

Generalize turn_off_channels function as the implementation is the same for
most of the lp55xx based LED driver.

Suggested-by: Lee Jones <lee@kernel.org>
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/leds/leds-lp5523.c        | 10 +---------
 drivers/leds/leds-lp55xx-common.c | 10 ++++++++++
 drivers/leds/leds-lp55xx-common.h |  1 +
 drivers/leds/leds-lp8501.c        | 10 +---------
 4 files changed, 13 insertions(+), 18 deletions(-)

diff --git a/drivers/leds/leds-lp5523.c b/drivers/leds/leds-lp5523.c
index 3030a4495808..4a4463cb44a4 100644
--- a/drivers/leds/leds-lp5523.c
+++ b/drivers/leds/leds-lp5523.c
@@ -167,20 +167,12 @@ static void lp5523_stop_engine(struct lp55xx_chip *chip)
 	lp5523_wait_opmode_done();
 }
 
-static void lp5523_turn_off_channels(struct lp55xx_chip *chip)
-{
-	int i;
-
-	for (i = 0; i < LP5523_MAX_LEDS; i++)
-		lp55xx_write(chip, LP5523_REG_LED_PWM_BASE + i, 0);
-}
-
 static void lp5523_run_engine(struct lp55xx_chip *chip, bool start)
 {
 	/* stop engine */
 	if (!start) {
 		lp5523_stop_engine(chip);
-		lp5523_turn_off_channels(chip);
+		lp55xx_turn_off_channels(chip);
 		return;
 	}
 
diff --git a/drivers/leds/leds-lp55xx-common.c b/drivers/leds/leds-lp55xx-common.c
index d17538ebfcf9..58121f27f17b 100644
--- a/drivers/leds/leds-lp55xx-common.c
+++ b/drivers/leds/leds-lp55xx-common.c
@@ -288,6 +288,16 @@ void lp55xx_set_led_current(struct lp55xx_led *led, u8 led_current)
 }
 EXPORT_SYMBOL_GPL(lp55xx_set_led_current);
 
+void lp55xx_turn_off_channels(struct lp55xx_chip *chip)
+{
+	const struct lp55xx_device_config *cfg = chip->cfg;
+	int i;
+
+	for (i = 0; i < cfg->max_channel; i++)
+		lp55xx_write(chip, cfg->reg_led_pwm_base.addr + i, 0);
+}
+EXPORT_SYMBOL_GPL(lp55xx_turn_off_channels);
+
 static void lp55xx_reset_device(struct lp55xx_chip *chip)
 {
 	const struct lp55xx_device_config *cfg = chip->cfg;
diff --git a/drivers/leds/leds-lp55xx-common.h b/drivers/leds/leds-lp55xx-common.h
index e638049d9297..531fbb0acb2e 100644
--- a/drivers/leds/leds-lp55xx-common.h
+++ b/drivers/leds/leds-lp55xx-common.h
@@ -220,6 +220,7 @@ extern void lp55xx_firmware_loaded_cb(struct lp55xx_chip *chip);
 extern int lp55xx_led_brightness(struct lp55xx_led *led);
 extern int lp55xx_multicolor_brightness(struct lp55xx_led *led);
 extern void lp55xx_set_led_current(struct lp55xx_led *led, u8 led_current);
+extern void lp55xx_turn_off_channels(struct lp55xx_chip *chip);
 
 /* common probe/remove function */
 extern int lp55xx_probe(struct i2c_client *client);
diff --git a/drivers/leds/leds-lp8501.c b/drivers/leds/leds-lp8501.c
index d924572e4533..1fb876f64cb7 100644
--- a/drivers/leds/leds-lp8501.c
+++ b/drivers/leds/leds-lp8501.c
@@ -110,20 +110,12 @@ static int lp8501_post_init_device(struct lp55xx_chip *chip)
 				LP8501_PWR_CONFIG_M, chip->pdata->pwr_sel);
 }
 
-static void lp8501_turn_off_channels(struct lp55xx_chip *chip)
-{
-	int i;
-
-	for (i = 0; i < LP8501_MAX_LEDS; i++)
-		lp55xx_write(chip, LP8501_REG_LED_PWM_BASE + i, 0);
-}
-
 static void lp8501_run_engine(struct lp55xx_chip *chip, bool start)
 {
 	/* stop engine */
 	if (!start) {
 		lp55xx_stop_all_engine(chip);
-		lp8501_turn_off_channels(chip);
+		lp55xx_turn_off_channels(chip);
 		return;
 	}
 
-- 
2.45.1


