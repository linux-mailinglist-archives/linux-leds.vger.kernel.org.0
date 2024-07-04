Return-Path: <linux-leds+bounces-2191-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 73A3E927DA6
	for <lists+linux-leds@lfdr.de>; Thu,  4 Jul 2024 21:15:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9B07F1C2356A
	for <lists+linux-leds@lfdr.de>; Thu,  4 Jul 2024 19:15:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADAEE137C2A;
	Thu,  4 Jul 2024 19:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="EGqONJEJ"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DFA6137C36
	for <linux-leds@vger.kernel.org>; Thu,  4 Jul 2024 19:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720120506; cv=none; b=QaAYazaZFG9kWa+c48gqMqjob5G9sh26Y5aGrpiUSls4E/x8U7M40HwBhSUr5MvfR9/j8bhvqZptiY4UvPB/bjhg5aC5aBizBprqNeB8xg0qKeqXHDWv0zj311Y9plT0mQmqH028R4JZFahkNhesziXr72C1T9cngTE8++BMkMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720120506; c=relaxed/simple;
	bh=UBrj0apH+HQSLddbFx/5OxnKoZB9AnNCZZsQ+0n+gjw=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=k5sH3qMml3oefy8bz7gqNXefu6TSVrKRxOSNbdE6/iHidqDwElnErHqbhTIGZXbdq4Q4AYgXX3lSD8BkF7UxYWi1Fj/LdjFwbnvGDPKS7wW15DZlviP28cxtOwhqWwr5QA6aqsTbaCpbSLvKq9P3YJZlxqYh0hTKTudyszgxEpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--zenghuchen.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=EGqONJEJ; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--zenghuchen.bounces.google.com
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-64c3f08ca52so15326617b3.3
        for <linux-leds@vger.kernel.org>; Thu, 04 Jul 2024 12:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1720120503; x=1720725303; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=i80ZUBWAx84nOrbGT0/9WVkfDYOHwt33QWZ6oeCQ+nI=;
        b=EGqONJEJnxbYB4+DLthVwxZ/Ada30iTXJanZa7gixEAeX/MogBOKGr+E9iD4uwAKyx
         X6XgBrun30L3nLH0b0vs5TzeF6BTmHplEYhJ+WSVWKriQwjHq0DXRBlZlW7NbC2ElwyJ
         Y5ZZYf6a0OGJpsqd59S1SRE9na+Xp4a6DmTgSGYoX55442LL7crlqWyI6etEnKWpGrDK
         a11wAwLRskFs0vTsKirTvML+dBnUT8+GSfjhV20v2PuCDKwDcwvQ3Tv4VzjVDAKI+FeW
         zmCuqED6w/WO33TEqcPncOTUVp5d9QanZHUGt6oX7yLPnlSD9ldWwjB7zz8H57r5qXKu
         JJkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720120503; x=1720725303;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=i80ZUBWAx84nOrbGT0/9WVkfDYOHwt33QWZ6oeCQ+nI=;
        b=L5FBSzeor+1PBIPNtZo6G7PfQuMN7BYBZ1GBAAUXLkEzRh+v+b17yLRwnhQghzPoGD
         0cc5FPafeL9GL8uoAk6yWEXGgkK4+bMsx35GLxZaxIZXxmu3seK8X7dhjV+Ymq/H0LcJ
         H0ZjcbOPJbzUrqlnkBnvv2/DrhDbjZmMFKZ22MldI0duh/cAJdGZv4OkIiKbBdZD6Bbf
         PJizzjHS6CondpYNEIk/S5YROAZq/D5QGPofTk/CC09QFNAhCb5thVtVqtJq3uJKVUWJ
         vP+76o1ZyqdDDR/R7j293dHZUPrkjvqP4yVW363gjleXafbuhYH5EDR5bJe1XwS0ihmM
         FLkw==
X-Forwarded-Encrypted: i=1; AJvYcCUnijdJJiVIWxI9UsX0+6EyW3zzzD3h/f5y3xdMQEbZ4Y2HznX8BdM7tVTnM2lT1j29myzxctPyXGiWRuNjhEtmLfiBwicpd4iWsA==
X-Gm-Message-State: AOJu0YzqM6TKJI/td2bek6VCBK+Nbz4cOz/NF97k4HTvJ6Rh2weQ0hyl
	qaZYDwxCxehaBymh65iDRcrck0tUgAvcbgTuU/XAksDjBX2gn0U2XwbTqdle+yeulS/plVGovdz
	7XMVDO6eJha0KVpDCKw==
X-Google-Smtp-Source: AGHT+IEFo7twwokc7q361Gzc055ltY960yY6+o9Hm6sqtfHJ+rYNiyNteCDo92gvoK4d/xqYoU0bNAJTduQOEDwz
X-Received: from zenghuchen.c.googlers.com ([fda3:e722:ac3:cc00:2b:7d90:c0a8:2448])
 (user=zenghuchen job=sendgmr) by 2002:a05:6902:1002:b0:e03:b3e8:f9a1 with
 SMTP id 3f1490d57ef6-e03c192c3b3mr153902276.2.1720120503461; Thu, 04 Jul 2024
 12:15:03 -0700 (PDT)
Date: Thu,  4 Jul 2024 15:15:00 -0400
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.45.2.803.g4e1b14247a-goog
Message-ID: <20240704191500.766846-1-zenghuchen@google.com>
Subject: [PATCH v2] leds: lm3601x: Calculate max_brightness and brightness properly
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
index 7e93c447fec5..1a6b9ee9e582 100644
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
+	led_cdev->max_brightness =
+			DIV_ROUND_UP(led->torch_current_max - LM3601X_MIN_TORCH_I_UA + 1,
+				     LM3601X_TORCH_REG_DIV);
 	led_cdev->flags |= LED_DEV_CAP_FLASH;
 
 	init_data.fwnode = fwnode;
@@ -386,6 +387,14 @@ static int lm3601x_parse_node(struct lm3601x_led *led,
 		goto out_err;
 	}
 
+	if (led->torch_current_max > LM3601X_MAX_TORCH_I_UA) {
+		dev_warn(&led->client->dev,
+			 "Max torch current set too high (%d vs %d)\n",
+			 led->torch_current_max,
+			 LM3601X_MAX_TORCH_I_UA);
+		led->torch_current_max = LM3601X_MAX_TORCH_I_UA;
+	}
+
 	ret = fwnode_property_read_u32(child, "flash-max-microamp",
 				&led->flash_current_max);
 	if (ret) {
-- 
2.45.2.803.g4e1b14247a-goog


