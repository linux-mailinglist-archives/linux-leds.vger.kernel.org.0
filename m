Return-Path: <linux-leds+bounces-2872-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 506E8988C7C
	for <lists+linux-leds@lfdr.de>; Sat, 28 Sep 2024 00:30:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ADB4728369C
	for <lists+linux-leds@lfdr.de>; Fri, 27 Sep 2024 22:30:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD50A1AD3F8;
	Fri, 27 Sep 2024 22:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="g+ggPMjk"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28071195FFA
	for <linux-leds@vger.kernel.org>; Fri, 27 Sep 2024 22:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727476202; cv=none; b=oFClVnGgL169D09YxnDX46z+XewU9ihYk6Poikwvqp/E+PhuIVwh4OHgKZH88sj8Pg+q0TbPl7H32dSNfoOdyJmP1uVpUd/vtZAW55rJyh3U+tgGFdoDojcE24p//Ys3VLlhdRF/Bz4LrfUxejNpg0TjCGUR7e6et1nQMVVrYNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727476202; c=relaxed/simple;
	bh=VzOZ0OjBtRVKiOzN7FNFk/cdUjMZXgMfwiyK8St+tx4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=c0l7vuQ9P3CMMQLCKsx2T1GnZjUhhLgqHQkCMsHMWhwVz11plujuhZ4LWm76AdvEUQ6KFJ44OCio1j19piL2281rX7NUemk8PnDG94Oh4p9O2wJzAhxKGys+K+ddBON3mCj1n07bA01pLDSkCMw1Ay3aJAqAA1JetD24y5pTbq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=g+ggPMjk; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a8d0d82e76aso375667166b.3
        for <linux-leds@vger.kernel.org>; Fri, 27 Sep 2024 15:30:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727476199; x=1728080999; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ch6AGylS4Nguwv4PhgtiCfmSrgOswaxxBAnBe3xKbKw=;
        b=g+ggPMjkU3RL8s+MhAUmRxYT6FvZacaAdTcd4PXtoWPsW6raWyJTVz6ff9+dX7Av5n
         UbrYvE0iTYwW9Fj0E+ROQ3+WXNj0zHWoZ7CriVSIAKgPaOaI/emRHjdwnrQ1e9E2ufWS
         OjkHrGLIXHDx1GSrUTVhB60nymzk4zRrvqh8/p4cT6trrqRfmsJ2k5NHxpJCKkR55H/h
         8Zv6RlUUZZ5KxfmYh8IZ3NsUFEiRNnCKnmaT5Pz3cQrFAJ2ASsHNXhoP5iZjYLaRKjaH
         Iwz0FSJOQtaEog3dpayFpLdDXU0e/KaV2MMPh241K5NERwxi6USLnZ5+viuJTJGO0WY5
         fPUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727476199; x=1728080999;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ch6AGylS4Nguwv4PhgtiCfmSrgOswaxxBAnBe3xKbKw=;
        b=GkhB0Rx7i3p6En80M8N10ieeXi4/hoB+r6dPxzuHkU665M9OaF/yk1TDQJ0kSfI+zD
         DbEgA+UvND2+sOl7X1Kl30bO+ETz7utMAf5cga+OMgMmKuU7n5tu/VJCWslwx37Wnqta
         SOCgqUpvD/nXFbrXC9t9/n4y81m3RUk0m3TwsDYWnFVtwo796O3QwBbI/Att2TdQ9vOd
         JKwtFkWeBn7uyTxZanSg4b8uTurbvo0+NszD5DLJR74TzWg3uTayyeZGYHGpKluC5Umg
         QIpoYFxiilxc+uV/zO99CPGnoPZrWeBlXKTZgiu+UPpGVRx4ySJpxnCQxyh1XQYOvmv7
         IIeA==
X-Gm-Message-State: AOJu0Yzl/3JaNf0nAHKd64Y/1DLKM3Cq0cULk/1yuMTw24JmaTFpgHi3
	lrJ73y5xGHQDcpXKrcxH1SehIO+IkuNfnMz5uavxWZeZ7Wtcx4RAwo8Y3Re6wgQ=
X-Google-Smtp-Source: AGHT+IHv4uMBRChUtKmto4PiKOdp1c4MseKfg6DWruwE+gJLuyChTJZenIMzqOsEUsbfKWPmZB7EGg==
X-Received: by 2002:a17:906:4788:b0:a86:9e84:dddc with SMTP id a640c23a62f3a-a93c4a98dd7mr452734866b.61.1727476199423;
        Fri, 27 Sep 2024 15:29:59 -0700 (PDT)
Received: from lino.lan ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93c29460eesm179504066b.119.2024.09.27.15.29.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Sep 2024 15:29:57 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 28 Sep 2024 00:29:50 +0200
Subject: [PATCH v2 4/4] leds: bcm63138: Add some register defines
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240928-bcm63138-leds-v2-4-f6aa4d4d6ef2@linaro.org>
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

The Power LUT (Look-up Table) register base was missing, also
add the bit define for sending serial LED data in reverse order,
and use the BIT() macro to define the bits in the control
register.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/leds/blink/leds-bcm63138.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/leds/blink/leds-bcm63138.c b/drivers/leds/blink/leds-bcm63138.c
index 9fe1af156c80..190d9774164b 100644
--- a/drivers/leds/blink/leds-bcm63138.c
+++ b/drivers/leds/blink/leds-bcm63138.c
@@ -21,8 +21,9 @@
 #define BCM63138_LEDS_PER_REG				(32 / BCM63138_LED_BITS)	/* 8 */
 
 #define BCM63138_GLB_CTRL				0x00
-#define  BCM63138_GLB_CTRL_SERIAL_LED_DATA_PPOL		0x00000002
-#define  BCM63138_GLB_CTRL_SERIAL_LED_EN_POL		0x00000008
+#define  BCM63138_GLB_CTRL_SERIAL_LED_DATA_PPOL		BIT(1)
+#define  BCM63138_GLB_CTRL_SERIAL_LED_EN_POL		BIT(3)
+#define  BCM63138_GLB_CTRL_SERIAL_LED_MSB_FIRST		BIT(4)
 #define BCM63138_MASK					0x04
 #define BCM63138_HW_LED_EN				0x08
 #define BCM63138_SERIAL_LED_SHIFT_SEL			0x0c
@@ -35,6 +36,7 @@
 #define BCM63138_BRIGHT_CTRL3				0x28
 #define BCM63138_BRIGHT_CTRL4				0x2c
 #define BCM63138_POWER_LED_CFG				0x30
+#define BCM63138_POWER_LUT				0x34 /* -> b0 */
 #define BCM63138_HW_POLARITY				0xb4
 #define BCM63138_SW_DATA				0xb8
 #define BCM63138_SW_POLARITY				0xbc

-- 
2.46.1


