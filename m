Return-Path: <linux-leds+bounces-3045-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E2E1A9988DC
	for <lists+linux-leds@lfdr.de>; Thu, 10 Oct 2024 16:11:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 092B51C2400D
	for <lists+linux-leds@lfdr.de>; Thu, 10 Oct 2024 14:11:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 718D91CB31C;
	Thu, 10 Oct 2024 14:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WfPxYS8x"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1DF91CB31B
	for <linux-leds@vger.kernel.org>; Thu, 10 Oct 2024 14:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728569465; cv=none; b=PqNCFHdVCSikZgPhM3QIZdYJEb3v8absTRQh1yobmrG4eNrPI26oelVoizOhuUh1GNjhjUqmWCkWq0pGtZwQTsIlZVxV/OFHz/9sqyTcSqqansS2fFpZATOy6a9lbyeo7dLY7K0cT1QQvNYi+Kqh+N3EcxfXMb+gFiEWabDHnlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728569465; c=relaxed/simple;
	bh=TTK1NqTwKaAcG1R8Vv5dIM5PCnv14GB/InNEdUbcv4M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TBT8dttrZ6nHXDtmyrf2DMINY6TEN1KQ/J+EeNhxXmKQEyrDUEAQ9vQxzXuo9ic1Z5rPXrqZSkG9sjbUtOE+3kacesP0v76uAFHJiMIxlUYE5GTepFF/tXBjwREAeBWjM7afhskHlAW0q7QSMeg+GbtqISQ7NGpaZmaVXs+5tQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WfPxYS8x; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5398f3be400so1108113e87.0
        for <linux-leds@vger.kernel.org>; Thu, 10 Oct 2024 07:11:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728569462; x=1729174262; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q198k3laC4sYOI7HaGU3RlY+asnk7UU8bvlf4eyLYBM=;
        b=WfPxYS8xrJ3J4+S9SiP12hZ8wtOSx6VGQBsrSR3MI5c2USr/A33aWjX8fOWHLCxcbM
         YVwRT/ysYAfUA5P8pcbjA1oTUVByS/FxQ7C7k2fdkzrHQ8iFSlxi17MC6xYc73Id2kOR
         +DUx5qXnk7t9FxLyre6gRK0Oo6OQsunmW4U906Is7BJXYMx94cquFlUnVlwOPA2aIDKP
         8a7E8UJkeudb4jm7qKylLGEInviuy3GYajwsS4rq6f1C5t05WkWSbbF9XRdJU7S3PQy4
         npzBuNm1CRxjeBaYs2bKLDB2fK1htacan8Uv3ivwukwCSlS7PxPCgcu1NaMvPMyLE0fZ
         BZjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728569462; x=1729174262;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q198k3laC4sYOI7HaGU3RlY+asnk7UU8bvlf4eyLYBM=;
        b=jbm0NESsqoyozG5B64e0a6DyJnG89X0YiFUPsj0NlGtMfZqC1+JT8t6OR7YU1yA55k
         VUEXZyLyJej5HvDlw8H75NwOBY1xjYE1NGj/PV659h4erYcLaW6GIFjZMs45cPcrrk4X
         Xl9h2ZEXYaFQFdC6guxESwvMRLGIDLldDMhGjb5d4qDipPVWtaltSLZxGIfXfWSks0EY
         fO209gduio+6/s3go9mWgNHsknwViJ6UNXuDc0kDVvwFON24ht2ECUA3HWu3DFDScYz0
         4mLqfZkfZlLGH14dDdvzal4Vq+P2I1M0Hxs3Trl1+XgL5PF39neukFMraKzKAqTcKSYj
         ABCw==
X-Gm-Message-State: AOJu0YyQ0afdyqj4ZuhL6uxu68bwdW+ZH2gg9ndR8TBheHR7iUNucl05
	nzS+ZO1DYsuMghD8t/d4uquFLma7KrMmc/UHLhBqdhl2NAP23ufdSckiuI+t2e7j1lpiUopxCfd
	e
X-Google-Smtp-Source: AGHT+IEHbvFN/0c3gTJeqcUxsxwpXpbvXc0bdD+m1MfpXj+Vxw5Z2jBW3d/SwwatThHPBe74AL3ahg==
X-Received: by 2002:a05:6512:12c8:b0:52c:99c9:bef6 with SMTP id 2adb3069b0e04-539c488a4eemr4220783e87.7.1728569461791;
        Thu, 10 Oct 2024 07:11:01 -0700 (PDT)
Received: from lino.lan ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a99a7ec5704sm94540866b.23.2024.10.10.07.10.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2024 07:11:00 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 10 Oct 2024 16:10:52 +0200
Subject: [PATCH v4 3/4] leds: bcm63138: Handle shift register config
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241010-bcm63138-leds-v4-3-cdb80780a555@linaro.org>
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
2.46.2


