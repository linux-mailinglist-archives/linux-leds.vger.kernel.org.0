Return-Path: <linux-leds+bounces-3044-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C23469988DB
	for <lists+linux-leds@lfdr.de>; Thu, 10 Oct 2024 16:11:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 756902826DD
	for <lists+linux-leds@lfdr.de>; Thu, 10 Oct 2024 14:11:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B54B81CB31C;
	Thu, 10 Oct 2024 14:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Yb856gu4"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01E2A1CB324
	for <linux-leds@vger.kernel.org>; Thu, 10 Oct 2024 14:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728569462; cv=none; b=OwaYQEnSwSJ43RG81zmL7axuBhBpe2kOIV+ESMqSGa3stiJHS6dTKaadI+U3sgcurmmdeL2+Ddo05coAgF32snDiw3X36iPCMemFrtVaQSLrHDbAEMpxLVPVxiXgR+UsEvv4o1+4ofTv4tdK9VTdRA5kwuqMNhYsT+WOU788430=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728569462; c=relaxed/simple;
	bh=gvBNRxgBPZ2zeZFI0slr0ZK/bibGW/1MvVv3P+uNb5g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Hz2ZXQj/ADJRU1YIGI8ysGtKXRU2uY+deMa4HJKALUkn5RSpEsd2HqgbQm3v3jpcM7PHKmmChhaNUl0oy89X6UTc273G4Gir+Vny8YySP4F4ZklsWk7yYEgJ41inatI/shfpeFnnoO6rNukr8rNmUL4ngr0GhWeq7Ux5FP9IEGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Yb856gu4; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a999521d0c3so164660066b.1
        for <linux-leds@vger.kernel.org>; Thu, 10 Oct 2024 07:11:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728569459; x=1729174259; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z7sMROkRKGoFLIFPCxBzcqqWuegoZL694cLilxCXEAc=;
        b=Yb856gu4ZYUWe+KIhYVGbfzm8taZbaUSjxjckHrhvds8swO2sND9nCYyPbYePnMwis
         Ifs9oTCvoxoHOSLMq0msO3BA+KwvyhY0mhQK6lrD9yZASCsZyYhIVaOlNKX5GwUiIhRY
         we5jMey6TOqDBnopdHPefomtxwxQNnGTowpmaNCqyueAjKm6oYTK9nAkMg3SUE3Hzm3k
         0Rie68VkhzKZRsUnDXYZBgRZ58eu9WMMRgwsJ8Nw/ZRFzKnLmp1DwJeRbhzmfFE9Cg65
         wf/VCUCNTKu0Ki645NW8yy0BGSdus0Un6PL3cS26QjXYPNo8zooJxmcxVTLroIP8U4zt
         efgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728569459; x=1729174259;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z7sMROkRKGoFLIFPCxBzcqqWuegoZL694cLilxCXEAc=;
        b=UZM0V7MIV1AxEFjTg15vKuzr/KOHrbguvrV2WnVtIjepMrY8WlYVKiaRhtMRzY4TYE
         qu+cdQhcYfhv50xaEODBT/2xoBFZnS8YycI6W2/jzdj50mJJOsXNfkG5p7LtWNKFLJ+U
         woLxG+rwGWqOZ5+O912VCdAVx4ZWc2gSCl9IYQAfvjnM4hc32BL36PxKvceIiy6iFc1V
         YGJR4pailHSUDdHH46iLFoSs1xAzDl1tlALSPq1Y5k5DaUv2bDiE61Tot+J6BZiK3UnB
         xBqtZ+DXA1C4rYceGGx4ircwvlCrjhqPXU6lmY0lamjVbyyWb3IdMUPtyEQJ/qvm9I+p
         BrrA==
X-Gm-Message-State: AOJu0YxY36P8sknigNsVCxe4zF3TNGbKkl9YLDyTmS+A56rBfeBl1GWa
	/XmqIS6rvbRHq5T0Jf0UN7e8YuJcL328pr9hWYm7QNskT+ZuxRzqfUNDg1KWZKQ=
X-Google-Smtp-Source: AGHT+IEuuUbomch6k13XEw7+i2ujQMHPYDCYT4xRgwBH/IsoA7Ire1rPyJAiOKaWwFy0P328wZMOVA==
X-Received: by 2002:a17:907:1ca5:b0:a99:40e3:23e8 with SMTP id a640c23a62f3a-a998d32d757mr457102466b.51.1728569459248;
        Thu, 10 Oct 2024 07:10:59 -0700 (PDT)
Received: from lino.lan ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a99a7ec5704sm94540866b.23.2024.10.10.07.10.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2024 07:10:57 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 10 Oct 2024 16:10:51 +0200
Subject: [PATCH v4 2/4] leds: bcm63138: Use scopes and guards
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241010-bcm63138-leds-v4-2-cdb80780a555@linaro.org>
References: <20241010-bcm63138-leds-v4-0-cdb80780a555@linaro.org>
In-Reply-To: <20241010-bcm63138-leds-v4-0-cdb80780a555@linaro.org>
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
2.46.2


