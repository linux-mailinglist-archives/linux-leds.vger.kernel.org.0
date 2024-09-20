Return-Path: <linux-leds+bounces-2788-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 60DDF97DA5C
	for <lists+linux-leds@lfdr.de>; Fri, 20 Sep 2024 23:59:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1F61E2840DA
	for <lists+linux-leds@lfdr.de>; Fri, 20 Sep 2024 21:59:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F948186E42;
	Fri, 20 Sep 2024 21:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tuSEMe9i"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EB931862B3
	for <linux-leds@vger.kernel.org>; Fri, 20 Sep 2024 21:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726869558; cv=none; b=IdFiH/ctfRuSh4QNka8zCQlKXUMz5ejngMxDGF+R01Arax/lcKdRNzcvzfyFFo4WTI71fQ2j4CLj4a4+84+H0d80Mg/8NzIcXcyQQ5f8KnY89v0L6ucQVRR0Djk0uHwO+sHmy/5B0EpyNsOivyGEcPlm6DNeouV5Np6JjHU22wk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726869558; c=relaxed/simple;
	bh=gXl6DeY/9dMT9uXw7AqViTblnZhMwQSRd5v3XKQfaTU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NC4LC051am3BvqSPYxCr2PY9MotlKoJBtl/VKpNjP81WLxPCwf2tJRYwPjtrGdXjFI0G9D9l2EChS8wrByvRjwHZ5VMMRPJ5zAQitRhvp2dl7ZwKy98WNGP6SHTYFrlG36Yn7YBG5bc6HPtnTwmFeyj3ia3kzVtpbUsybaLc3NE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tuSEMe9i; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a8d2b4a5bf1so324909166b.2
        for <linux-leds@vger.kernel.org>; Fri, 20 Sep 2024 14:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726869554; x=1727474354; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8/JfYrX/aNtfPTLK68m0sSubqj4AyYAOoUh1lb0Sm34=;
        b=tuSEMe9ijExJCjnQWwZfrB2hsuaxZZsBD+X/HJow6BosrQjVae+CWAYTV/2eh6p3ld
         m4wNBB3r2Jnug+HwGhiSnwAdN7d1VvlqdBy7HE5X5BvoaJa8ZnVK4qTD4Two1RY9/4+B
         33TAno44QMMffgHQ00/OHaLJhdls9ebRTef9TQMhRWJoBvyAndNtYOFjuhbflLmMh1Gw
         RyRT4cbaVLiUNPo62WT0xSVwEoesy7ss0tTyCylWp0UIAicW2yZ13PwBBUJ93mqySTUX
         fImNtGQyt1hXdCTmbREiDUyCYVMYW24MCUb5diOpZK/1B0wNVIEZlbrUEVHgRpYdkP/k
         m0+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726869554; x=1727474354;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8/JfYrX/aNtfPTLK68m0sSubqj4AyYAOoUh1lb0Sm34=;
        b=lZ9CZaY9b6L6CYEkJ8iL+UAta4M07KPpBMBtlrLesqUMIhEQvCZw2oAMEogg3VM4E0
         5IwAp+0l+tmnLoKK1MWKHtfufwWtdcStAv53yE09foTydPsqyA5Nl0+p1rJrSFEKkwb7
         95zZQXK+a5jPBgLtIyCyfgCFRZqrAqJ0X1sLs5u3t+WvR7FrrEN6pbd4R1ohaOIBMye7
         CvH3Gr9GWVMfJKNYgXcOL1baLyXv/dOHP8coOqiAWZj3/1IgqDFIt9N5OyV3x019BVOL
         eTHIp1NP9CBMlM8ChHVJzfWMr6fhe7xw+TN7ezk6kuWTjktKX2YDvzBKeKJPtbEeelkF
         j3GA==
X-Gm-Message-State: AOJu0YzN1imLcw0yXqjTl87wkSo0xaDbzaDPc0c2W/JmxyIKfYrz6eac
	Hc2YuE59Jjjf8pWy3LXSOJofXB9cWVBuZ8qLpThKcmkrDKYXYjG4ErfXJzc++8k=
X-Google-Smtp-Source: AGHT+IFXdJ1xKzR//xbZgTZ9zcz2hn5EODZNg6u+Uq6l4/z6nZspAes4iJST+Pb1cPbW+dldhb7xAg==
X-Received: by 2002:a17:906:d261:b0:a86:80b7:4743 with SMTP id a640c23a62f3a-a90d4ffddf4mr353840066b.24.1726869554350;
        Fri, 20 Sep 2024 14:59:14 -0700 (PDT)
Received: from lino.lan ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a90612b3a04sm900617766b.125.2024.09.20.14.59.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Sep 2024 14:59:13 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 20 Sep 2024 23:59:04 +0200
Subject: [PATCH 2/4] leds: bcm63138: Use scopes and guards
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240920-bcm63138-leds-v1-2-c150871324a0@linaro.org>
References: <20240920-bcm63138-leds-v1-0-c150871324a0@linaro.org>
In-Reply-To: <20240920-bcm63138-leds-v1-0-c150871324a0@linaro.org>
To: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 William Zhang <william.zhang@broadcom.com>, 
 Anand Gore <anand.gore@broadcom.com>, 
 Kursad Oney <kursad.oney@broadcom.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.14.0

Use scoped helpers and guards to handle DT node iterations
and spinlocks. This cuts some lines of code and eliminates
common mistakes (such as the missing of_node_put()).

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/leds/blink/leds-bcm63138.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/drivers/leds/blink/leds-bcm63138.c b/drivers/leds/blink/leds-bcm63138.c
index 3a5e0b98bfbc..374f68f4f277 100644
--- a/drivers/leds/blink/leds-bcm63138.c
+++ b/drivers/leds/blink/leds-bcm63138.c
@@ -2,6 +2,7 @@
 /*
  * Copyright (C) 2021 Rafał Miłecki <rafal@milecki.pl>
  */
+#include <linux/cleanup.h>
 #include <linux/delay.h>
 #include <linux/io.h>
 #include <linux/leds.h>
@@ -125,17 +126,14 @@ static void bcm63138_leds_brightness_set(struct led_classdev *led_cdev,
 {
 	struct bcm63138_led *led = container_of(led_cdev, struct bcm63138_led, cdev);
 	struct bcm63138_leds *leds = led->leds;
-	unsigned long flags;
 
-	spin_lock_irqsave(&leds->lock, flags);
+	guard(spinlock_irqsave)(&leds->lock);
 
 	bcm63138_leds_enable_led(leds, led, value);
 	if (!value)
 		bcm63138_leds_set_flash_rate(leds, led, 0);
 	else
 		bcm63138_leds_set_bright(leds, led, value);
-
-	spin_unlock_irqrestore(&leds->lock, flags);
 }
 
 static int bcm63138_leds_blink_set(struct led_classdev *led_cdev,
@@ -144,7 +142,6 @@ static int bcm63138_leds_blink_set(struct led_classdev *led_cdev,
 {
 	struct bcm63138_led *led = container_of(led_cdev, struct bcm63138_led, cdev);
 	struct bcm63138_leds *leds = led->leds;
-	unsigned long flags;
 	u8 value;
 
 	if (!*delay_on && !*delay_off) {
@@ -179,13 +176,11 @@ static int bcm63138_leds_blink_set(struct led_classdev *led_cdev,
 		return -EINVAL;
 	}
 
-	spin_lock_irqsave(&leds->lock, flags);
+	guard(spinlock_irqsave)(&leds->lock);
 
 	bcm63138_leds_enable_led(leds, led, BCM63138_MAX_BRIGHTNESS);
 	bcm63138_leds_set_flash_rate(leds, led, value);
 
-	spin_unlock_irqrestore(&leds->lock, flags);
-
 	return 0;
 }
 
@@ -259,7 +254,6 @@ static int bcm63138_leds_probe(struct platform_device *pdev)
 	struct device_node *np = dev_of_node(&pdev->dev);
 	struct device *dev = &pdev->dev;
 	struct bcm63138_leds *leds;
-	struct device_node *child;
 
 	leds = devm_kzalloc(dev, sizeof(*leds), GFP_KERNEL);
 	if (!leds)
@@ -280,7 +274,7 @@ static int bcm63138_leds_probe(struct platform_device *pdev)
 	bcm63138_leds_write(leds, BCM63138_SERIAL_LED_POLARITY, 0);
 	bcm63138_leds_write(leds, BCM63138_PARALLEL_LED_POLARITY, 0);
 
-	for_each_available_child_of_node(np, child) {
+	for_each_available_child_of_node_scoped(np, child) {
 		bcm63138_leds_create_led(leds, child);
 	}
 

-- 
2.46.0


