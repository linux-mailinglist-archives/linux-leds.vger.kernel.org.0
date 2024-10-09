Return-Path: <linux-leds+bounces-3012-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A86CE996638
	for <lists+linux-leds@lfdr.de>; Wed,  9 Oct 2024 11:57:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 611611F270EF
	for <lists+linux-leds@lfdr.de>; Wed,  9 Oct 2024 09:57:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CA2418F2E3;
	Wed,  9 Oct 2024 09:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ysoft.com header.i=@ysoft.com header.b="XozO5Nkd"
X-Original-To: linux-leds@vger.kernel.org
Received: from uho.ysoft.cz (uho.ysoft.cz [81.19.3.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A510918E37A;
	Wed,  9 Oct 2024 09:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=81.19.3.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728467802; cv=none; b=U6SOrPXXtvnbsOOKpmmHpK0/OJPCoEadEAZfqJDD+6NKv7SzeG70G8hnjDJ+Xr96ogTx/K/HzULtj1mJzdSGTW5aUGHFFYZ5jmCW7eX9XsbqetNGe7PWMVjpliNkfdy/P8j8Fri6rYyjC/dAk+JuSMGIBNzgjIiWowp8UZXxvrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728467802; c=relaxed/simple;
	bh=bVfK+k6Rj9bACFwnQCtvMMSrQblXycclxbPPTsGc69M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=iXvNxCrfUQ5u62d/8NMcewbuoQ+mseYjtjdqA9EpNZM4+vBjfNiCB7L+yBp0Qau0AFomFJAtOhvdYPUBHKme9A23xCevU62nKG6K+7U0Jae44QfaIqJaK+HBs3Xqbac+YIPYVK3tXu7yElOoQWTz710iKEexOa5m+tNOoh/Mvlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ysoft.com; spf=pass smtp.mailfrom=ysoft.com; dkim=pass (1024-bit key) header.d=ysoft.com header.i=@ysoft.com header.b=XozO5Nkd; arc=none smtp.client-ip=81.19.3.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ysoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ysoft.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ysoft.com;
	s=20160406-ysoft-com; t=1728467798;
	bh=rUewkbwyzSI6oMmlCe/UtDapHFjvuIQTH5uGojU1xy4=;
	h=From:To:Cc:Subject:Date:From;
	b=XozO5NkddKT/Dg6EFafWtG8VsGjkmns5deEZTi1Z7afnmbpTlkJYWH1rJtPj1mg5m
	 9gAoMX5D+I7Qx/74yced7Q5PIexlkE5pFxCsl/ttGmNT3oOpEWUOSpYPJqUis6IuJp
	 4pcGwYo/49nbHEUrM/LLZBcVHHybfGMGImY2GlZY=
Received: from vokac-nb.ysoft.local (unknown [10.1.8.111])
	by uho.ysoft.cz (Postfix) with ESMTP id 19893A05D4;
	Wed,  9 Oct 2024 11:56:38 +0200 (CEST)
From: =?UTF-8?q?Michal=20Vok=C3=A1=C4=8D?= <michal.vokac@ysoft.com>
To: Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee@kernel.org>
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Christian Marangi <ansuelsmth@gmail.com>,
	=?UTF-8?q?Michal=20Vok=C3=A1=C4=8D?= <michal.vokac@ysoft.com>
Subject: [PATCH v2] leds: lp5562: Add multicolor brightness control
Date: Wed,  9 Oct 2024 11:56:35 +0200
Message-ID: <20241009095635.2790613-1-michal.vokac@ysoft.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The framework for multicolor brightness control is already in place
in the lp55xx-common code but the function to control the multicolor
brightness for this particular chip is still missing.

Implement the multicolor_brightness_fn function to allow multicolor
brightness control of LEDs connected to the LP5562 LED driver.

Signed-off-by: Michal Vokáč <michal.vokac@ysoft.com>
---
v2:
- rebase on top of latest linux v6.12-rc
- use guard API instead of mutex lock/unlock

This was tested on the imx6dl-yapp43-pegasus board (in tree) that uses
this LED driver. There is only an RGB LED on the board so I could not
test the white channel.

 drivers/leds/leds-lp5562.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/leds/leds-lp5562.c b/drivers/leds/leds-lp5562.c
index b26bcc81d079..14a4af361b26 100644
--- a/drivers/leds/leds-lp5562.c
+++ b/drivers/leds/leds-lp5562.c
@@ -161,6 +161,30 @@ static int lp5562_post_init_device(struct lp55xx_chip *chip)
 	return 0;
 }
 
+static int lp5562_multicolor_brightness(struct lp55xx_led *led)
+{
+	struct lp55xx_chip *chip = led->chip;
+	static const u8 addr[] = {
+		LP5562_REG_R_PWM,
+		LP5562_REG_G_PWM,
+		LP5562_REG_B_PWM,
+		LP5562_REG_W_PWM,
+	};
+	int ret;
+	int i;
+
+	guard(mutex)(&chip->lock);
+	for (i = 0; i < led->mc_cdev.num_colors; i++) {
+		ret = lp55xx_write(chip,
+				   addr[led->mc_cdev.subled_info[i].channel],
+				   led->mc_cdev.subled_info[i].brightness);
+		if (ret)
+			break;
+	}
+
+	return ret;
+}
+
 static int lp5562_led_brightness(struct lp55xx_led *led)
 {
 	struct lp55xx_chip *chip = led->chip;
@@ -364,6 +388,7 @@ static struct lp55xx_device_config lp5562_cfg = {
 	.post_init_device   = lp5562_post_init_device,
 	.set_led_current    = lp5562_set_led_current,
 	.brightness_fn      = lp5562_led_brightness,
+	.multicolor_brightness_fn = lp5562_multicolor_brightness,
 	.run_engine         = lp5562_run_engine,
 	.firmware_cb        = lp55xx_firmware_loaded_cb,
 	.dev_attr_group     = &lp5562_group,
-- 
2.43.0


