Return-Path: <linux-leds+bounces-2953-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D360C98FE49
	for <lists+linux-leds@lfdr.de>; Fri,  4 Oct 2024 09:59:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F3E341C23271
	for <lists+linux-leds@lfdr.de>; Fri,  4 Oct 2024 07:59:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB8751311B5;
	Fri,  4 Oct 2024 07:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Hs3Nc6Wz"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6AC713AD2F
	for <linux-leds@vger.kernel.org>; Fri,  4 Oct 2024 07:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728028773; cv=none; b=cA9aZQnexUkqN60Grs6oHpas+kRNLpowiPI2mrvXRVaebQSV8Vh9DA9sX47ZpHirWqaCkfjWsnW+M2vA2zf3gb1cWy8sA5IjGDKWOaWpBVxtUe5eMLJOK7qB/6jff01CX4Om9MkYueIeC9wcmi3Z4iW5EKiyv8hgMasRFdXUuXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728028773; c=relaxed/simple;
	bh=FnmLOeDSpJX+e4oZfKM4ssmMezMCZY+ZhBPl8+fQFa0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hKLM8+5cvrsmYj1iWTc6GcAO12kRpI28sOsOn8Nq6IJc0ryRU90vjagV+a4AFfGODf/lqxZQ9Z5hYFLbxjTI/seq82xbQS7xMWBJt8fJiJfs4llTPp3aniBBu/f4qQUzMaGYvqwcRE7OrnQuy5DIoRdJbDeo10fH3aR3+0RvBXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Hs3Nc6Wz; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a93b2070e0cso203413466b.3
        for <linux-leds@vger.kernel.org>; Fri, 04 Oct 2024 00:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728028770; x=1728633570; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q0Xo7lyATMDsOi/JTMW6RiHHyZurrxixH5uKKnJ9YLk=;
        b=Hs3Nc6WzcqmZqQi3tlvWsLSlTBioMwo6+3kMyKu8nNX1vfg+LeWbiJ3y3GlUWhdkfI
         TEKVbEJutoFJYnPselCUy+z33A5Pm2Wiu1lAC/3dP4aDsv7W8YRn1DOEJENqRyPiRBqc
         lxWlNfr/uXliHQj30WCVwBupYbVDG9BXd6jLsBm8J+W9FMAbFUglcKv3kjf6XV5VwrLZ
         VuF3H6eI9fWbcyMQsBOj5WFf2vVPDGjkSBj3NLqVvHOdbBwZ0rYcPeQhzV7M8NrgqkKi
         AJpSs+gLsv6h2xTghGI2a4IXYP2TmFVU6Xbmh1F8VDwLk6diMYKgiOCF2hJ9fYT+Rfv5
         EyEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728028770; x=1728633570;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q0Xo7lyATMDsOi/JTMW6RiHHyZurrxixH5uKKnJ9YLk=;
        b=jJSH342Uj6+KGCy36K9StHvx5roRmrMLAunR5XraadwkKikBaEQB79VIUIlCELJpSd
         0S628aQCW2IRlalDB2yEvzTDkTVB4NjckoJCk5GWKEdDgANQrvPdhFpjX3FVm8QFhykb
         jN0EKfvR+HRM7d/wdAjsNcCdSo4Lopb9cWUdt2OB11JebQ/CiMFAUM6jAT9mtpAYIk41
         Rohr0xuhfDy+Iw4qR4PJQ3o2OptStZKPvfDqPs6liiLDcGMK/kZv9BwZMCOD8bxHnYs8
         hu21E9KApSjcqwwCYt4ekUHTPTKUmZscaGu+RKK38t46jd2c8MpiOyBFzgNQrgUNQKkW
         S+xQ==
X-Gm-Message-State: AOJu0YxhseWjWcX+hQ7lsmce5fsz+9CDVkFJqpuQ3jeT7Hphi1nhv3Zj
	4KpBBrC4KcraHvhmmw4D4JpPPAE9OaTRTi/7THdih7lwWNY/VgbT57eVoglGITw=
X-Google-Smtp-Source: AGHT+IE7MV8JyFfIszGHwPZJa9aOyZZIQ0GuHo4UCGz5I4KY1Z5YQgjIBnAkIIBwmrzyLlDj1gbyZA==
X-Received: by 2002:a17:907:9289:b0:a8d:2faf:d33d with SMTP id a640c23a62f3a-a991bd05798mr178258566b.9.1728028770068;
        Fri, 04 Oct 2024 00:59:30 -0700 (PDT)
Received: from lino.lan ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9910286fd8sm187266366b.27.2024.10.04.00.59.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Oct 2024 00:59:28 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 04 Oct 2024 09:59:24 +0200
Subject: [PATCH v3 3/4] leds: bcm63138: Handle shift register config
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241004-bcm63138-leds-v3-3-ba99a8e464b9@linaro.org>
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

This adds code to optionally read the width of the shift register
chain from the device tree and use it to set up the register
controlling the shifter hardware.

If the property is not present, the boot-time default is used so
existing device trees keep working as this is what they assume.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/leds/blink/leds-bcm63138.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/leds/blink/leds-bcm63138.c b/drivers/leds/blink/leds-bcm63138.c
index 374f68f4f277..9fe1af156c80 100644
--- a/drivers/leds/blink/leds-bcm63138.c
+++ b/drivers/leds/blink/leds-bcm63138.c
@@ -2,6 +2,7 @@
 /*
  * Copyright (C) 2021 Rafał Miłecki <rafal@milecki.pl>
  */
+#include <linux/bits.h>
 #include <linux/cleanup.h>
 #include <linux/delay.h>
 #include <linux/io.h>
@@ -254,6 +255,7 @@ static int bcm63138_leds_probe(struct platform_device *pdev)
 	struct device_node *np = dev_of_node(&pdev->dev);
 	struct device *dev = &pdev->dev;
 	struct bcm63138_leds *leds;
+	u32 shift_bits;
 
 	leds = devm_kzalloc(dev, sizeof(*leds), GFP_KERNEL);
 	if (!leds)
@@ -267,6 +269,12 @@ static int bcm63138_leds_probe(struct platform_device *pdev)
 
 	spin_lock_init(&leds->lock);
 
+	/* If this property is not present, we use boot defaults */
+	if (!of_property_read_u32(np, "brcm,serial-shift-bits", &shift_bits)) {
+		bcm63138_leds_write(leds, BCM63138_SERIAL_LED_SHIFT_SEL,
+				    GENMASK(shift_bits - 1, 0));
+	}
+
 	bcm63138_leds_write(leds, BCM63138_GLB_CTRL,
 			    BCM63138_GLB_CTRL_SERIAL_LED_DATA_PPOL |
 			    BCM63138_GLB_CTRL_SERIAL_LED_EN_POL);

-- 
2.46.1


