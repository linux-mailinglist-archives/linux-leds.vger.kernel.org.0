Return-Path: <linux-leds+bounces-2090-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 844EB911503
	for <lists+linux-leds@lfdr.de>; Thu, 20 Jun 2024 23:45:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 393C9281A62
	for <lists+linux-leds@lfdr.de>; Thu, 20 Jun 2024 21:45:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A12BA155C86;
	Thu, 20 Jun 2024 21:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D1OVqfJ6"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EA20154C08;
	Thu, 20 Jun 2024 21:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718919712; cv=none; b=USiIxpB32GITlnBa0YezzWoJcWlaqVxpG0hjWaHeCO7oZZHcf2EYKE0qBy6XDF0rtESD6918zs4c8t+nFynav8VyFfkl9SNdXg91EvWwourrdDJnvwIHkIxrGFXRbZ6v+ZsYTZ0aJhvRx8DHsjCYTZ0UAu23jk8HKpl/jv8h5Wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718919712; c=relaxed/simple;
	bh=qRBtdteaTcYg4FIgeWPA5RcNj/YAZq33i0IGtnVaMP4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GhUb7wf1P6EnOnW/yL3VbS7pJTFAvA89BsIlVXgeo1pzQT4DcCyXH1hXCNw8TQAJzHsfGnZDaijgtDyJejnlbWlKVcjrjL3YO4gQeqMqXLpbnQLJStSpFqpdaL2MwCvoDb+K0Nwo/Td0yK+pcjaSMOBp5SDr8OpQuvzWZbkp6C8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D1OVqfJ6; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-42172ab4b60so14068625e9.0;
        Thu, 20 Jun 2024 14:41:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718919709; x=1719524509; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e73alUsXrK9XDxh1X7OdUWZvWORqfMxB50eGvz/bNmU=;
        b=D1OVqfJ6lytZMvcHZcMK5osc2QY/b7zYtRBtIIPnifO39tP2a8zecftr0UF8NPhCOm
         kfM3LgIsAf80EquJXZBENOXEAQDLwAiOku5phiuiCeOBJabWZDepOhviY6+U4yQ5+9jV
         CUbBBWWcIEVDllQK++sABpYLDNOgmks29BAbDO1X4IcZBSlVK3AVMjg6SnesQR4880P3
         F2CQ7TDGb56RTHacH7t3PM7QArXZ5QPhb6/j5g22BlQ25J1vBTZKoFF3U9iEVc8MOTrS
         TgPRSIHafO6oUpB4uMFOTK7MPTZ1rwTqamRXujAxrh8WEwDeO33Lyf/NkAa8zcExfdT1
         qzcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718919709; x=1719524509;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e73alUsXrK9XDxh1X7OdUWZvWORqfMxB50eGvz/bNmU=;
        b=duWEi16P5G1V+XyqyDofoJJACRZGhuTPZ4lEIDg4gSvkYRhcYjm12LoK68a4VlGZdr
         T+9CDCGmwgbuLvuDonDYmZh1R0yRS6rHxlvTzopIA+eooywICQKQN5VQPSfVCvI3u/V5
         8JIvAv/YFBZSBf9qEEBdCff2Ms8LyJY+aNE3JHJLcSTQGMJj9AajG7vWQ/Dn/qv2oIR9
         Iv188V2VpGXRqzHnJWqyyt/heblHHw9bQ1SzCVvmOlXR5ld9C27vunFBXonvoADuomq+
         xKIw3aF+tXe6DMTziea8OlXFqy3DxZI7H54JAu+qetVKvRcbREu135I55FCFx0jcpr9o
         vkjg==
X-Forwarded-Encrypted: i=1; AJvYcCW9mcdY3eIqxgyAJu0Z5fHIcd4MZi9bq3Ke3Cs87qkcYXA9KeQLqV0My4pw5uKvtC+POOgKlmvrafcN7q2QWwOTZ1iEVWem7lVuZjat71xIqsJpt6y6L9ZCaHIwA3tS4Ay/pPpBxn2B/UOtBO/kGlhqyERIuT8ki4dMG07e2dBfAmO6+Hk=
X-Gm-Message-State: AOJu0YzwtY9pQoJqMlj2RHf18MePNbi1sULAF4Qp6sXenc9mItnZG2n5
	0bB3/rN1glpjAJsOEVY3vIO7s/B0DcDkNlNvayas3pF2YELymrkTo6WZGw==
X-Google-Smtp-Source: AGHT+IER4ynEAoINSHQbQlylmfWpT+L++crRpnhYQj9wf4vIE1iytfKHF4mucaedDIXmbjE6GY3sGw==
X-Received: by 2002:a05:600c:b4b:b0:41f:ed4b:93f9 with SMTP id 5b1f17b1804b1-42475182a65mr47724925e9.19.1718919708943;
        Thu, 20 Jun 2024 14:41:48 -0700 (PDT)
Received: from localhost.localdomain (93-34-90-105.ip49.fastwebnet.it. [93.34.90.105])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-366383f68acsm48866f8f.2.2024.06.20.14.41.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 14:41:48 -0700 (PDT)
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
Subject: [PATCH v7 14/20] leds: leds-lp55xx: Generalize stop_engine function
Date: Thu, 20 Jun 2024 23:03:30 +0200
Message-ID: <20240620210401.22053-15-ansuelsmth@gmail.com>
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


