Return-Path: <linux-leds+bounces-2952-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E957F98FE4B
	for <lists+linux-leds@lfdr.de>; Fri,  4 Oct 2024 09:59:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 49746B21AD6
	for <lists+linux-leds@lfdr.de>; Fri,  4 Oct 2024 07:59:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9635413B5AF;
	Fri,  4 Oct 2024 07:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="F6tXpt2H"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4DC413B588
	for <linux-leds@vger.kernel.org>; Fri,  4 Oct 2024 07:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728028771; cv=none; b=tOwcmlsZwTCmk0Q0YmA51OdVFET2g6ZJilVxtXrsmeqcBDkxnP31QIeakN7OKwHNFkELSdESzb/e3DqfirQjHNdyzL3eqyNL+zIbJniU5aipdLwC+SI4tgmAVz9biAexGDinWWUUR1nPxdBuTPGozKQfhj6AtPk/TcpuX2zS4s0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728028771; c=relaxed/simple;
	bh=Xtn246ffe+DO8hn0Ugf8AMOw+Lw1qO4c2sSOIr/ZryM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GxK0qsb0xOJI+lWn26y0HGMnpp/l8d1CxlpzuaT0hatUs9nq55LVSmwJZFxWfjm6Fe+JQ8dXGvfAZlSwJqvO2JZdoIe0UCzx6qEoizZKL0RXGRULGN5EM9ALkK/jtTfCEompU8LjdRdRAc93Btny/CiFjPD6aUZ4gxn4ZfdshLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=F6tXpt2H; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5c89f3e8a74so2382443a12.0
        for <linux-leds@vger.kernel.org>; Fri, 04 Oct 2024 00:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728028768; x=1728633568; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sWnKbsxefkmEHGrZFlS1qac5gpq5RncaWSP6AZtVnA0=;
        b=F6tXpt2HE9fK4R4+0vYxWEj9iatfLtk4Cu+j3Anp/YBgcq9Hnt8hiZJzG+GTbrpDMV
         PBMKvca0NkZ6ViK1BYSzf09q/G4MtOBnb6Bw719WeGnU+d9jKyG8RF0yYB7KLp/dKvQu
         ECHh/61h02I657eOqyTTdYpkn1E4doQW0oo60CdRns7wyAcQ1odQh4EiFuiAEMrIwyRu
         OsjQ5kWgY8SIckUtt7zLsuWzK4nJLlHn/I0W45Lmba326Ia/9pAmF+8bzol0foTiPoSX
         ELS9+G4n/oW3VVlyxkr5tfxqntmD+NB7j7VqSiAsPyMI3gcZ4JFyLV7k5H/h5wSdRsAs
         9msA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728028768; x=1728633568;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sWnKbsxefkmEHGrZFlS1qac5gpq5RncaWSP6AZtVnA0=;
        b=qwqIixnwUf6HmWaXhV5VQJaqDgBlPL7BLiuTKlIl+sYToKiVE7L32LayEIVb4QL5Wu
         wKg3ae34n7UtEu9StFZPEFBbGn092XlQsHkCU2WYSmYU2uZjAIsYIUnd+THqrtyVWzPT
         3PDzo+XIWNM16rabraex0iv7uhXe2rtp70AmXmqqTD/66NXkFZ2RudlAVweurm3jFqo7
         uZct4jugqL8WX8f66zPASdIUHNMDG6neWwCYgPq5NjXHVmfbzirhM9zCkzFvC5NA+FW3
         GA4Y5rSyh+GbZ/hnimpNMti8b4PGBQA1wQ9hLdejjY0HafO8Bfb/Cb7n2pn8KdTximyi
         pH0w==
X-Gm-Message-State: AOJu0YwsmlMDLTjz3HQDvSH00bpx7GiAx12rXN3tdqx6/AXK+XPzutsT
	mJlM8BOjT9GGKFcwBIynLbyDjRef2sQsawyZIESa0WJup3FC7enXtqBoOoYLTZ8=
X-Google-Smtp-Source: AGHT+IGA5Ox4gRvEWgf09rSR5vtT92J9X4wPbwajC5sUJaKMi8fSxnJy+MydmrUompVYu/nn+DfJjQ==
X-Received: by 2002:a17:907:36c4:b0:a8d:1303:2283 with SMTP id a640c23a62f3a-a991bd7a123mr181277966b.30.1728028767922;
        Fri, 04 Oct 2024 00:59:27 -0700 (PDT)
Received: from lino.lan ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9910286fd8sm187266366b.27.2024.10.04.00.59.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Oct 2024 00:59:27 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 04 Oct 2024 09:59:23 +0200
Subject: [PATCH v3 2/4] leds: bcm63138: Use scopes and guards
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241004-bcm63138-leds-v3-2-ba99a8e464b9@linaro.org>
References: <20241004-bcm63138-leds-v3-0-ba99a8e464b9@linaro.org>
In-Reply-To: <20241004-bcm63138-leds-v3-0-ba99a8e464b9@linaro.org>
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


