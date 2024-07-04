Return-Path: <linux-leds+bounces-2190-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 81FF1927D73
	for <lists+linux-leds@lfdr.de>; Thu,  4 Jul 2024 21:02:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 386381F24CBD
	for <lists+linux-leds@lfdr.de>; Thu,  4 Jul 2024 19:02:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6B6E136E1B;
	Thu,  4 Jul 2024 19:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VUZ12dwo"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F15213AD03
	for <linux-leds@vger.kernel.org>; Thu,  4 Jul 2024 19:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720119722; cv=none; b=MFDNqkdDsilGLq7L3nbvYXNxfHQy+jLnIvzU/XpropfPfgGcB8LmAaQqP1tGDrEXTT5YN6u2te9QEdAqik68GFVryYWp3gL74ck5OkEW8VGkVLxeGALiE7M1uSu362MebIDWk6vx53ztQCrYFSDtGWH28DNRj7lDui/iXHBiL30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720119722; c=relaxed/simple;
	bh=2UKYq5bhPsPv12mO8kx6pTkKpzG9k1rkOi+Jc8rQ//g=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=FkNlm4E2e+VlcXF+xBX+nqN08Vqjf/tAFmp1I4n80NmYvaLqpJc/jIflMEjR6V6DtCzRLiRP/kfXirgmxrESx+zhHGagiZnNpbs7w78PZ7jOT5AjwAEKLYDXY3cssYIT2BIRnJbz+hs6GG2NwJPg4PNAAYylNXaGbUmL3PgejUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--zenghuchen.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VUZ12dwo; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--zenghuchen.bounces.google.com
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-e039b77a040so1453159276.2
        for <linux-leds@vger.kernel.org>; Thu, 04 Jul 2024 12:02:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1720119720; x=1720724520; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=o9G8g66vcUfsbATIp2mXIZzia2L3xSDwYH8ppQZgSmM=;
        b=VUZ12dwo+udhtJLAc4eY17apeKP3vP4W3sxqs0/CGQ5L12AmNEUgG/eF/1jeoKw4cy
         i6Nbf7+v7o+ou37PtDaj+eCQ9s3rSI+MwzaqTQIY2ghIZX8vV4EMrQd1rdWdH7/eFPuL
         thxaz1RFXaTnCJ+ZsZts1sfBSw/n5o8riQKFggonFpGgJS/AdtQrg8I+oC8rMmTe8vK/
         /979bwBy22beXy/ThaAE1+DAk0TxlDhZnRu3VFFneyrVc58CC5vMTimanap3aCDe5p/U
         eGWez35PWt8nYBmzSRX6Bz7E6rkHY8kCPCu3gzdyzQWPbGeVCgjYfxUY3sT44Wa9NJSJ
         CIOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720119720; x=1720724520;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=o9G8g66vcUfsbATIp2mXIZzia2L3xSDwYH8ppQZgSmM=;
        b=prg65qX1GAWfqyQt7VxTKzVRetQUjRpp53R7MNQOgi+HMjiTvbBQkW/poekj1kzBJS
         6LNCsGoN+Owqy9aWhvnFUNPRyrqKzTEiUjeZ4Q//yMaiEIaOdtztM+f84yWDCJpwCoYG
         VIMnanGu+1o8MflU6BEj+D/jvlF6d/Ejii0x3QjTFgx+XNT7+xSZDj27UK2B9y3g9e5Y
         6/lQPIcwxzh85JuEQIPE2DTUlbqbJqQHCBln+YD0H260NEuRlAFcAdf8DyCYJutmZR3g
         kvKH+RamxZAFS16zCu0wHGch6pu6BgQuUE83uZfUG+YZYVzeq7UEDXw3/NOk/aKNRqJ8
         sRaA==
X-Forwarded-Encrypted: i=1; AJvYcCVNsyLcBmlDVrsHvSiSTi/FZ3WibpVDw+5O7c0mADSX1NJLW2WcOhPLPQ3/RaPtooAFfxoDe+RlqByqOwxN+ToXdQ12q3jY+xKaYg==
X-Gm-Message-State: AOJu0YxrlNDSy4lnO7f9Yl/U7NKuGDts63zVlKVyWtpjDpLOHv0GEsnN
	424Z/aEEvF8d9knCNmm46Z/nVS/8hQFlkmUcGVWa4plM0DVyahm+mbH0GBCSPLkWJKtCFs2mAvH
	dFz7aihHBEQddJC41Yg==
X-Google-Smtp-Source: AGHT+IGKlUQ0UPyTqub9i9vt+OGJA5Ys/6xr3OtS7RcyTnEAky7OPp/BWLiMwIAdNqU90IW4m6vBjJ5IWXeUaDHs
X-Received: from zenghuchen.c.googlers.com ([fda3:e722:ac3:cc00:2b:7d90:c0a8:2448])
 (user=zenghuchen job=sendgmr) by 2002:a25:6941:0:b0:e03:5050:acc5 with SMTP
 id 3f1490d57ef6-e03c19b030bmr51437276.7.1720119720128; Thu, 04 Jul 2024
 12:02:00 -0700 (PDT)
Date: Thu,  4 Jul 2024 15:01:57 -0400
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.45.2.803.g4e1b14247a-goog
Message-ID: <20240704190157.712590-1-zenghuchen@google.com>
Subject: [PATCH] leds: lm3601x: Calculate max_brightness and brightness properly
From: Jack Chen <zenghuchen@google.com>
To: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Vadim Pasternak <vadimp@nvidia.com>, 
	Randy Dunlap <rdunlap@infradead.org>, Jack Chen <zenghuchen@google.com>, 
	linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

The torch_current_max should be checked not exceeding the upper bound.
If it does, throw a warning message and set to LM3601X_MAX_TORCH_I_UA.

LM3601x torch brigthness register (LM3601X_LED_TORCH_REG) takes 0 as the
minimum output (2.4 mA). However, 0 of led_brightness means LED_OFF.
Adding a -1 offset to brightness before writing to brightness
register, so when users write minimum brightness (1), it sets lm3601x
output the minimum.

Signed-off-by: Jack Chen <zenghuchen@google.com>
---
 drivers/leds/flash/leds-lm3601x.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/leds/flash/leds-lm3601x.c b/drivers/leds/flash/leds-lm3601x.c
index 7e93c447fec5..fc4df904ea90 100644
--- a/drivers/leds/flash/leds-lm3601x.c
+++ b/drivers/leds/flash/leds-lm3601x.c
@@ -190,7 +190,7 @@ static int lm3601x_brightness_set(struct led_classdev *cdev,
 		goto out;
 	}
 
-	ret = regmap_write(led->regmap, LM3601X_LED_TORCH_REG, brightness);
+	ret = regmap_write(led->regmap, LM3601X_LED_TORCH_REG, brightness - 1);
 	if (ret < 0)
 		goto out;
 
@@ -341,8 +341,9 @@ static int lm3601x_register_leds(struct lm3601x_led *led,
 
 	led_cdev = &led->fled_cdev.led_cdev;
 	led_cdev->brightness_set_blocking = lm3601x_brightness_set;
-	led_cdev->max_brightness = DIV_ROUND_UP(led->torch_current_max,
-						LM3601X_TORCH_REG_DIV);
+	led_cdev->max_brightness = DIV_ROUND_UP(
+			led->torch_current_max - LM3601X_MIN_TORCH_I_UA + 1,
+			LM3601X_TORCH_REG_DIV);
 	led_cdev->flags |= LED_DEV_CAP_FLASH;
 
 	init_data.fwnode = fwnode;
@@ -386,6 +387,14 @@ static int lm3601x_parse_node(struct lm3601x_led *led,
 		goto out_err;
 	}
 
+	if (led->torch_current_max > LM3601X_MAX_TORCH_I_UA) {
+		dev_warn(&led->client->dev,
+			 "led-max-microamp cannot be higher than %d\n",
+			 LM3601X_MAX_TORCH_I_UA);
+		led->torch_current_max = LM3601X_MAX_TORCH_I_UA;
+	}
+
+
 	ret = fwnode_property_read_u32(child, "flash-max-microamp",
 				&led->flash_current_max);
 	if (ret) {
-- 
2.45.2.803.g4e1b14247a-goog


