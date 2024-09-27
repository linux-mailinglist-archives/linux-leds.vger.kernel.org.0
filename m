Return-Path: <linux-leds+bounces-2870-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D4914988C76
	for <lists+linux-leds@lfdr.de>; Sat, 28 Sep 2024 00:30:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E05211C2180A
	for <lists+linux-leds@lfdr.de>; Fri, 27 Sep 2024 22:29:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA66419E7D8;
	Fri, 27 Sep 2024 22:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WDOFKvIv"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9E3F188CA9
	for <linux-leds@vger.kernel.org>; Fri, 27 Sep 2024 22:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727476198; cv=none; b=oC6lnj31a1yJpKmQPDSkRKVWnXYGjL+sTHt/NKR50gChU0WejuqZWdd7/jNK3i3nPsvm5bKs3R/7oHGr4TVi/7SejrJbWqKFfon6kBll4qL1boDqOSLE5dMDF0/dIoVubnfXS/TBl6aqTxaFmEHbFDbRnqQxeGkQrlJ95sOXejk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727476198; c=relaxed/simple;
	bh=Xtn246ffe+DO8hn0Ugf8AMOw+Lw1qO4c2sSOIr/ZryM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QIsnmiLqF5pPcm6xBgZ4F8tFZrVcQ3Es8S5uaU0OUBBbT/dtYrhasi8JhAr9TRqGs3ZRInfj30iTMGzFkRi2/Ho2XXUZj9AuWXg4ZHR0Y0dTI+YDJwTwHO+IU1HJq/qd5DRYHA8P7f8oAfQ9rToJ3zJlCFKzMMgvz31674bJ4Ug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WDOFKvIv; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a8d60e23b33so350775266b.0
        for <linux-leds@vger.kernel.org>; Fri, 27 Sep 2024 15:29:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727476195; x=1728080995; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sWnKbsxefkmEHGrZFlS1qac5gpq5RncaWSP6AZtVnA0=;
        b=WDOFKvIv4neao9vZQtslmU4Jlvl+KVpFCpzKYIfNTWALJjr6ay1cacMNTQiL4yaImn
         HoqX+qUzps9dfLlJzpeo7ksl7iPi7lOxbN+QDL8vBTfvD+DxZSniMhHc0ONULAG/yfxE
         1ROCQJYMSI7uQF9HpeqQVUY8ZReQ3CfIeLtG/Uv3jl2hxYgmEWHp7QV/CQyjRtKYfKAw
         NhXI//yAhjkDzJpapZ5osV/MLjWnejncgti+JBqoHN6FeIldc3VrrJJSkxFO6JWoiaPi
         tiTj2HD6MH7ZZhTlEPH2UeJa3iLsYEHKQ3PdI+Q5nCCuzYbkIO+VLpSxKliVru0WFdRb
         O+Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727476195; x=1728080995;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sWnKbsxefkmEHGrZFlS1qac5gpq5RncaWSP6AZtVnA0=;
        b=GGhEo1MmAPFcRF7EMAI21fnU7wstOaJMslD7wUwDNUkfCUuXZ+vQTThoEjJ5rfX5dh
         cXuXCB2/TxdK91mIPNEzyHFu8la/igNHo8CJSpxeVs5qva1p5CaG5sCfeoZ/0wE8bsTe
         VywwZzODz8YbFSEryn3wRq5PPy1wxx0aITVnqRzn3Hk/XFObvPaL/fuVFwQV8GLlamjI
         V4DdxfAa0IuNv54w1U7g8Gs0m+Y6aHqlb+ZZ6y/WaGQZ6gc+XgBj1xXQoPNKXqjlEApu
         x+3W42UR1riE5r2bl7mDjfTVTw0m2/1TF+zJkE64FWAkICO/X1qtx134hnBhLysrdLo/
         izFg==
X-Gm-Message-State: AOJu0YwBgHAN0p8HThyD/dffkcsq5HEpuSpZqMJWrSo0jbq4FD5AASdO
	udE4XEnvsJrxDaZB5Q3VDzW/s+wX6FGgNk0sgZbWu2vKMGCG/JWc30iehivovOw=
X-Google-Smtp-Source: AGHT+IEOTcEGxxl1GF0PinK1NeaeqxJkKelV79iOWepyZC9Lm/huNFkmzogsSUwTSIpX/ag79RoKAg==
X-Received: by 2002:a17:907:25c3:b0:a91:158b:122c with SMTP id a640c23a62f3a-a93c496952emr400472466b.38.1727476195059;
        Fri, 27 Sep 2024 15:29:55 -0700 (PDT)
Received: from lino.lan ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93c29460eesm179504066b.119.2024.09.27.15.29.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Sep 2024 15:29:54 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 28 Sep 2024 00:29:48 +0200
Subject: [PATCH v2 2/4] leds: bcm63138: Use scopes and guards
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240928-bcm63138-leds-v2-2-f6aa4d4d6ef2@linaro.org>
References: <20240928-bcm63138-leds-v2-0-f6aa4d4d6ef2@linaro.org>
In-Reply-To: <20240928-bcm63138-leds-v2-0-f6aa4d4d6ef2@linaro.org>
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

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
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
2.46.1


