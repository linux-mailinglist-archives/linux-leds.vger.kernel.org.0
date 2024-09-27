Return-Path: <linux-leds+bounces-2871-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DDB4B988C79
	for <lists+linux-leds@lfdr.de>; Sat, 28 Sep 2024 00:30:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A989EB2129A
	for <lists+linux-leds@lfdr.de>; Fri, 27 Sep 2024 22:30:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B3011A0720;
	Fri, 27 Sep 2024 22:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NP1PZIeP"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A6D219CD18
	for <linux-leds@vger.kernel.org>; Fri, 27 Sep 2024 22:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727476200; cv=none; b=VWGi+6W+ExMFCTPSstRHpGH/JXTQMDaaRWutNGtcSz9mGNETvSJp6/vg8gS+5MN/Snun1+3zGx5JJECxcoLZpRKoJ5oymEqX2OHSN97FaXSa7nVnbfFngV5BTNRb5FJ1IAoQGEk+rNz3ZH+XQid766ttujYCPJ7GeIUUaltxfbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727476200; c=relaxed/simple;
	bh=FnmLOeDSpJX+e4oZfKM4ssmMezMCZY+ZhBPl8+fQFa0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MivOgP51sRtdeIWE6vv+LyJHDiwGo5pHEcq2P0OY0xDKDiR4tNDgkpBBueZggVuxpbrOudTVn0D9Q8gjMWQ/cYB9RS95LHNNXiSrUIQjB5Ix/Bmk1fEpK2Vlm7EvLdpULj0NGWAM9GTwLn18WiP6DnctBTYjA818Jw1S5HfkDws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NP1PZIeP; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a8a789c4fc5so626288966b.0
        for <linux-leds@vger.kernel.org>; Fri, 27 Sep 2024 15:29:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727476197; x=1728080997; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q0Xo7lyATMDsOi/JTMW6RiHHyZurrxixH5uKKnJ9YLk=;
        b=NP1PZIePxhKlGXZGCEbZ0uDBJrpYyypoh0TfXPli6reCRZdqA6J1qU1p5bS4lbkIRM
         Q9h7SPW7kUHyeiQoyAq18ZtIRKJgWfgq00wkuveqRXzQ2EWz+e8pEVyBsWw/FAIL4AZL
         h3y18+gGs/s2SJp4FCOlBhLCK26OdW92xnq9Dyi4Gcc65cyiXvJZ85BoSJ0XwNb8emoI
         y/VoAwFTFc2PHV8LScQKSwyfpk7UF8wlEUAF3K4yu35z0pwfNXpSsHv1P4EQdl8u0l3D
         r/BtLf2lCM7Fd12T8YoAFrIi9uUBSNWEVOaLXxuFbbOdtD2mFLuxJr0aTuIGrhYoCSuE
         5cIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727476197; x=1728080997;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q0Xo7lyATMDsOi/JTMW6RiHHyZurrxixH5uKKnJ9YLk=;
        b=tJnH885XGbhhGmxt4WZHhmNABL8Hd3FwbIrffB6S20y6jop4g4bUcVnQVX/jr368p0
         oqGBB5Wxtkvx5oy9Gj3nQqI6xl8ce4w4Kz9Rdq+S4l6385OohNKgMu02JN4amJQ0FjQD
         HEsTgSLju5h8OPy7jPSWLgtz3S+i8enP2uA1TMsypXxyWsFcfI7lmM1cZnyvdCVJXNtf
         yxRTttSHKErvQkt9tmDP1ex3MEW8EdDLsgwPjulDvgotrfBsaioMIe5YF7xGVvpQWlNZ
         tn9oWN/mI59J+ubbhGkzi0m7k782O6zj63brzqWZUfUXGVOP02DSZXBaBSY06Rz8CJF8
         ykMg==
X-Gm-Message-State: AOJu0YyPV4wPBCdeMthyQsZ2pkJCRQv2Ua74LG+DxgBKuOK+6x/vcQ5X
	872lzVvLCp956glWM8Sd3r8sLlV14xPWgjYi7jh4Ge4vOywG/jJmQprYd57wjoc=
X-Google-Smtp-Source: AGHT+IGBFeYfR6SQYm0jjvz1V3boHDBtBDgmMkB4kB1X48hs2GlTIo+mSgOWRldYWOv3oxGSC9VMDg==
X-Received: by 2002:a17:907:7f17:b0:a8a:9243:486 with SMTP id a640c23a62f3a-a93c318688amr553077966b.21.1727476196623;
        Fri, 27 Sep 2024 15:29:56 -0700 (PDT)
Received: from lino.lan ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93c29460eesm179504066b.119.2024.09.27.15.29.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Sep 2024 15:29:56 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 28 Sep 2024 00:29:49 +0200
Subject: [PATCH v2 3/4] leds: bcm63138: Handle shift register config
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240928-bcm63138-leds-v2-3-f6aa4d4d6ef2@linaro.org>
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


