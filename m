Return-Path: <linux-leds+bounces-1943-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E4589909A7D
	for <lists+linux-leds@lfdr.de>; Sun, 16 Jun 2024 01:15:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C80171C210A0
	for <lists+linux-leds@lfdr.de>; Sat, 15 Jun 2024 23:15:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC67C13A875;
	Sat, 15 Jun 2024 23:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CiQz/KFH"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA533139D05;
	Sat, 15 Jun 2024 23:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718493185; cv=none; b=rEdLL0WSptWZxb+Q8GjEJjBvkRFpJwVP3CEu8SKM01oWmWyau5Y0pj9CnQ1TK7iCVklbiU9i5l8cPtUDOnHNiwujd8TuGZM1QqasEed05dCO3oDs/aWYN/oHoSxbiH4TESH4MKI/Vhf/feQZFvaxhywVPGPklk9wAhApoF109xM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718493185; c=relaxed/simple;
	bh=jrUwrkPYp4hCHlkd6P6OYbxXe4swsLYG9zbBf4AA20s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mph8baFKeIAKqbGwob6OWlUZjKneh4Jjyd9XXCJ/obmRovCk/i2K/gEPyqM8nAiv2ez3uY9/J0Fsxop0up/UK7C5+QDJpMTTT1m/lHgdRim3cCpvmJUtIMzrLS5PdSDT2Qc3rpIDR2jyi1PFy+q3BCcbThbdXl9Xl2Ts7urt/4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CiQz/KFH; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-35f2c0b7701so1878081f8f.0;
        Sat, 15 Jun 2024 16:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718493182; x=1719097982; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TJT+GSRKfcK8dGlTgwx48L15a3Q2jtdAFK5lJ52goD4=;
        b=CiQz/KFHpvhE2kjEiJcNdSKXlqAS3l1iMWdfX+9t0k00luF3bC2Bu3BhBeBJ78JBdo
         F+g4BIgnGNuBXe41B6VaIOG7tsB69DImW+gjoJWB7x/eBnhr9Jt6BcfRgJnNOqtDMEYF
         Jg7GntwciGaCAD1Tey9n8W/KYa+gLY12aNM1hZ0noavzWb8zgPfUXnAx16B9G+7g1wt9
         5lA93yJ1yQdLrdF/J19N9TuWdddZWH6/EFqpFIp8PO+yYpCHCpZYWDI4ydXWbEQ7/Hbb
         MtNVgP8HBdu0Gdg1I96WMEG/tEnAB22NHe2iMnoE2+HyzOASL4HnkGk7HgAzcYL/WtVl
         GYTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718493182; x=1719097982;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TJT+GSRKfcK8dGlTgwx48L15a3Q2jtdAFK5lJ52goD4=;
        b=aikZR5yWcCXls/BfvpQnVyQnRzjdaRHdeLEs/R4f1F/DljJpCqOs7ctI2VS0qB7C0H
         KKshST/FMSPwqDt2jDxYwAQGwERGYv7hHKVavFfNjsIVEh5lJAIeBoMVQ2DTWUYee3wa
         gski0yk8rA/gjO1NWVotAOOYQtyjnxgBX1z+IL9aNVWjxIZn8RizfF9WdmJW24MaAMwr
         IZqj76pq71KX/dGECJ7Geobajl2Ixm9vxRZbjNVOgAlX2LIeZCWFUx+ewoQIqK+9E6Mp
         xOIhzJzWu7PePv+t6wXlxM7Ms7foqfCmVacGeFSt6nwy1K9qMSWabgg6nZcmvPvXO/gu
         dTMA==
X-Forwarded-Encrypted: i=1; AJvYcCWe1bcSUzIOTIKsGV1DMDrA6r86D5a61Oy19dwLP/CM39gy2Q3581tL9IsafJNa4VZvD4G2szYHigqTYfsH9CNX0CFdjAcaMTi83AiEq5q0JS+kt/PeiD3scpPXXbTwQOc5a32P5+QqrydeA1O9dYN6TBwoFiDLKJ+Z/fjEKPn0xhXqa14=
X-Gm-Message-State: AOJu0YyR/He5xf6rmfZyzooGOXl608EGzQuWU+F4Y5ajjWYnQ4eB/vTR
	oOJFBEnsrXu6A8LL1X0PkL73yI/ev3MzY92k91zqqUFISd+9QQy1
X-Google-Smtp-Source: AGHT+IHOACnByiXh6AMFMUrwSyBl501NtFDMCPKG6jaIGE0uKoJkcJqd3dkgs0PM0w/ZFFMSL0rzHg==
X-Received: by 2002:adf:f14a:0:b0:360:8d70:d368 with SMTP id ffacd0b85a97d-3608d70d391mr2482228f8f.29.1718493182241;
        Sat, 15 Jun 2024 16:13:02 -0700 (PDT)
Received: from localhost.localdomain (93-34-90-105.ip49.fastwebnet.it. [93.34.90.105])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3607509355dsm8145532f8f.13.2024.06.15.16.13.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Jun 2024 16:13:01 -0700 (PDT)
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
Subject: [PATCH v5 13/20] leds: leds-lp55xx: generalize turn_off_channels function
Date: Sun, 16 Jun 2024 01:11:43 +0200
Message-ID: <20240615231152.28201-14-ansuelsmth@gmail.com>
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

Generalize turn_off_channels function as the implementation is the same for
most of the lp55xx based LED driver.

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
index 0d9c2990c335..028a485d3561 100644
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
2.43.0


