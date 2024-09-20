Return-Path: <linux-leds+bounces-2789-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DD6C397DA5D
	for <lists+linux-leds@lfdr.de>; Fri, 20 Sep 2024 23:59:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1A0CB1C20F3C
	for <lists+linux-leds@lfdr.de>; Fri, 20 Sep 2024 21:59:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1ACC1187328;
	Fri, 20 Sep 2024 21:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xbxtvfyw"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D9FE1420B6
	for <linux-leds@vger.kernel.org>; Fri, 20 Sep 2024 21:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726869560; cv=none; b=Pe+t9nn0tBOkJs5Rl7SBZwgzMAtocTxnrPGkD0FWgxyzaa/oIkoNKY9Ij7Xe+hl6k2TLEQKhqcQZge/A0iwKdHWJCMDHwcjy1wjZ28nw/nu/Ihoeza07QUTHbTqowWy1xgoisF5py/5vPcbiXtHMYquvJFayY/vJtAsFOlqh0ZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726869560; c=relaxed/simple;
	bh=pzwKpebvYVuzFkHtfWxT2dIgxpG/NhoiTFU5g0KtTr8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SM57QUlktvgCF8paYW+rolt+Xqmn0vhhPpJGTKRwDK5BC7hsIDySpxUn7jGj/B3qrE495oTn3YVTxmO8N/7WMNDhJziJ4TQw8jUiiIUvJEWFAcVMjwh9jhAU0FasyeFBxZCAuj5BqOMp0CSSUuVUcR3B0hZaFmgnBMGcgyUXouI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xbxtvfyw; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-42bb7298bdeso29957395e9.1
        for <linux-leds@vger.kernel.org>; Fri, 20 Sep 2024 14:59:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726869556; x=1727474356; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QhUCILeSXAkUcmBh/Q/38AfnCBVEM+/ogGyjiE56sKs=;
        b=xbxtvfywujr+bqkRMHHKHf+0d5d7Ij8Vg4AQ/0m27pXOkHYRE/11Bowp9GM3L1cATj
         uPtOF1Hs+kQSjhYlSQMyQslddc2BrlUkdl2fshncZa3wmmG9hBkUkj1zzjOJNBsy6aDG
         JrGeRDVEo6Ia346ey3IuEH5ehMTkMR4a8bZshbEXIBREg5w0hAkfhF73csTLcFjFH5HN
         pcgi4bX4mbXWxjgYtCPgzjXsL1+fgUqo816MbCyI8G2QfymQ2ho5dkr013nh+TZeh9Hp
         b1UmfilHpFuko2u/C/GcLp6YLfOWD00jXUOYgp/lfnWwAimsMCrK3t41+GD2Ft2JKqlF
         uCjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726869556; x=1727474356;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QhUCILeSXAkUcmBh/Q/38AfnCBVEM+/ogGyjiE56sKs=;
        b=lG4vhv8AIz8bpyTd8KhPfpApKcBVNROJ6wVlGf7G+JqP5SqnUF/CSlLwryXqavae70
         YJSY739gmQ6Mq+iqt6En3jufnRuaOMmz60icdpO6p3oUJMhNWiv8MRj2WgX8quxOWBxi
         S5yMZ29fMpX8Uce00on9J/h12BRY/GpwccSvmQcFXCtTqEVv40w9SeKOBexmGlGGPPTv
         zQdwDn4bsLFaBANo+j4jX0XTV1nO160y+Tyl1p8QV+urovvidY1AvaY6PASR+ImKg4q9
         CXRMV3Yp0Cp8ZGFIK/WmoZlIpZKpVpurOFPkP2xl+BBGIopqoyY98pf9tEDcTBZ0tLv6
         MbdQ==
X-Gm-Message-State: AOJu0YwR8MLPXiXr3ZrTfd/UuWDx377r6r4Bi3KsHYJLDlBu8mLp8qWi
	USgkhZij5iC/NVuJNVsICYBEBnd39xj4QUc3sY9hlAo/70CxMiiYIX8U6iIWixg=
X-Google-Smtp-Source: AGHT+IEn3IcFD2Fbyv6iaMwKQbdR/rjcEenFHfFt8cMW2+izbedffoWXjkJwz6Z8qL+HOX996ORtHw==
X-Received: by 2002:a5d:452e:0:b0:374:c847:867 with SMTP id ffacd0b85a97d-37a42367b0fmr3322120f8f.47.1726869556517;
        Fri, 20 Sep 2024 14:59:16 -0700 (PDT)
Received: from lino.lan ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a90612b3a04sm900617766b.125.2024.09.20.14.59.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Sep 2024 14:59:15 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 20 Sep 2024 23:59:05 +0200
Subject: [PATCH 3/4] leds: bcm63128: Handle shift register config
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240920-bcm63138-leds-v1-3-c150871324a0@linaro.org>
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
index 374f68f4f277..bf170a5bb12a 100644
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
+				    GENMASK(32 - shift_bits - 1, 0));
+	}
+
 	bcm63138_leds_write(leds, BCM63138_GLB_CTRL,
 			    BCM63138_GLB_CTRL_SERIAL_LED_DATA_PPOL |
 			    BCM63138_GLB_CTRL_SERIAL_LED_EN_POL);

-- 
2.46.0


