Return-Path: <linux-leds+bounces-2954-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D778398FE4D
	for <lists+linux-leds@lfdr.de>; Fri,  4 Oct 2024 09:59:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2A2EDB218CE
	for <lists+linux-leds@lfdr.de>; Fri,  4 Oct 2024 07:59:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB58313B58F;
	Fri,  4 Oct 2024 07:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ofvKIGbb"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0492D13A884
	for <linux-leds@vger.kernel.org>; Fri,  4 Oct 2024 07:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728028775; cv=none; b=bfgxsKSXV+x3/vDyg/EsKnxNdZjdUfcyd3vphb59feGChsLKBQq2jK0M32MPQA+eS/qORcM7nBGUtFAhZQecJBpORqxiaaudA2Bjqg662S0eS23okAIYZDohkpEkKSojYQkGKdbtejAR7tR5HXTULM7p0TMgNWHVSi8w1VdEmjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728028775; c=relaxed/simple;
	bh=VzOZ0OjBtRVKiOzN7FNFk/cdUjMZXgMfwiyK8St+tx4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KCcCT+mO+Rzb7+z7SIizlA+o2ioYc+akDRJSh8xY+msM9G+iuXykODIngsv4pc/2v/9uayVAP5M0/+aJuj+ym7TIAqO9ggOy7ipQlclAyBaMpL0RLiNqg/g5MJ2NSfJO9HIIsh9wqQXiEcYEiZ6qKXTT7mrSyKNzM4pVNpPMlZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ofvKIGbb; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5c88e6926e5so1863325a12.3
        for <linux-leds@vger.kernel.org>; Fri, 04 Oct 2024 00:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728028772; x=1728633572; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ch6AGylS4Nguwv4PhgtiCfmSrgOswaxxBAnBe3xKbKw=;
        b=ofvKIGbbACCccnR5Tz1DZq3P8jOBl1kYNrDE3Pg1H4YkBQ5a+HfpfQFAvtTXC2QA8s
         EjUiLMwwyhKJ9CXQAhSQwlzCXRIIugGox0xVP+HrASRlM9vjXqCqsXkIRXVhaXzViW/f
         683V7KeMdurZaAVyXjljHL7/53tRQrDbkED7k3HYkhAE48Q4jVfJST+PpwdqTXipMjUw
         WRZqZaOEVRYQD5qCoFwqyZtYKTTVgRq88Uczl40kqSJ1dqLWzNXlhq6fam5lPmvGizdX
         gDxJ8dnb/UXT85/MJvk8zC2kCcXWXHe6c0nT9b8RuKwcze19L5dZp/lacKVAyCyCXZve
         8CzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728028772; x=1728633572;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ch6AGylS4Nguwv4PhgtiCfmSrgOswaxxBAnBe3xKbKw=;
        b=Zj2Pp7PA6oF200Q7tLezyxbL5zjA0PHrh9nuqdQ/N4jOKahySqqu2JsjpNz/m6sy6e
         OQdkf56KsPRxwKvdNm7DM7IUEOJJkARW6CXPC/3RPlZ9OFXFXD4C7JACLJc1cBUHgQpY
         d4uvRKwx3PTwd4cJqhvpPiS6Y8staG4oUCjv1hSLpiyueGnxiLcZLb4ReSyU7SjzsLgW
         1zZFf9O6KF5dpOza9d/ZNH0a0yaxWaJKeGjNZnfuySBu6dufcG/DrdxYmcbtbEvTtprQ
         E/feB0050AjsoX3K2HeE7+ehT2okzycWLfZ1D0+Id3kSVgB8q9CYDGO19vXP2gZVkVYu
         Vv1Q==
X-Gm-Message-State: AOJu0YybN3u7Uitug+Ib/j2uMdOb06kXziPX+tE7WRJ2pdynTtXGrpnD
	vBzBwuhf4y30zJM7ello1+Zmay+dZaFaIYj4CC7dplxAgAuZep4svAnHOpV1D+7f0uh7l2sE2QJ
	E
X-Google-Smtp-Source: AGHT+IGvVoh5XQ5IrzDQMxGpHM2dSZdCJZch5fU7dbwV3pJqUdaqgSt6Lrr8I7RMDira65WywpUZfg==
X-Received: by 2002:a17:907:f701:b0:a8d:3705:4115 with SMTP id a640c23a62f3a-a991bd72a7fmr141705866b.32.1728028772223;
        Fri, 04 Oct 2024 00:59:32 -0700 (PDT)
Received: from lino.lan ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9910286fd8sm187266366b.27.2024.10.04.00.59.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Oct 2024 00:59:30 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 04 Oct 2024 09:59:25 +0200
Subject: [PATCH v3 4/4] leds: bcm63138: Add some register defines
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241004-bcm63138-leds-v3-4-ba99a8e464b9@linaro.org>
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


