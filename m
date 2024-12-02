Return-Path: <linux-leds+bounces-3463-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 040D99E023E
	for <lists+linux-leds@lfdr.de>; Mon,  2 Dec 2024 13:31:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 760AEB3798D
	for <lists+linux-leds@lfdr.de>; Mon,  2 Dec 2024 12:16:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21B1F2036FD;
	Mon,  2 Dec 2024 12:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chaosfield.at header.i=jakob+lkml@chaosfield.at header.b="DQnLpBQM"
X-Original-To: linux-leds@vger.kernel.org
Received: from sender2-op-o11.zoho.eu (sender2-op-o11.zoho.eu [136.143.171.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9A80205AD5;
	Mon,  2 Dec 2024 12:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.171.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733141294; cv=pass; b=ObmTZlBatafvvP0F6IlXAXziIWD0xpw8ZwB/9FN2Cq29VSUb6mhnLEsCA3AGNpEOxNCNDPEJwzlhIMLwFTE7lqngb30Lc+0Ju9j83cAejUc4LQCXbuYeLUKAdU14zgx8MaVPdGXCQTWqnulGNjNoHu9nD5JcA/n/NuaDcwQ9bQk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733141294; c=relaxed/simple;
	bh=hHFka5L2zVORZlNG1xvolgyFI+LGuuqcR6ENNyanQ+U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ngcETZAFyPo551HkIAl7i2kYQpziHyWB7pOipFVGHww4/3sUBMG90nqyXEDhpyoBSu5ebL6Fa9Vxbv5BidEzIeZ3FQIsL0axKuF9bBwAgY5PxjA6YerQL1Qm4CHHIG/+w9Pr5kLFHWvSW7yFYMzWJn1pDzu3xRFvH3cfzUlexvg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chaosfield.at; spf=pass smtp.mailfrom=chaosfield.at; dkim=pass (1024-bit key) header.d=chaosfield.at header.i=jakob+lkml@chaosfield.at header.b=DQnLpBQM; arc=pass smtp.client-ip=136.143.171.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chaosfield.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chaosfield.at
ARC-Seal: i=1; a=rsa-sha256; t=1733141276; cv=none; 
	d=zohomail.eu; s=zohoarc; 
	b=ic9ejCH1Wzo/gP2ZAjrCMCGRn0xNhXMo0F4THnYLAMn261HP6VtLBF4FKRao9MJu93Sqm1L5KstGMhZLZGNzDkSuSw0o2FR1Zg5crYfl2jCOCaQYzuBGlY/6anEsdhTBmLDEeb3Y3mBtp7yrEqic4gEgPitOakXKzuf4JXvG3wE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
	t=1733141276; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=BMV9SMnLebQrEW79GXBEprl8gCg+plSDoj9lVar/fxY=; 
	b=kjTqduZ/huYbM3WO9LEaWjmS0NIGETJZXSon8p2YnWXZjYY9YWXKJ7eFGBKKsYb7sgeW9qC610Y9Zj2D31byXB6PavLiVWw1+yz2F+eY0+T75aKFa0r6QFw8SCeRNTK5mwy0EV/0aJEdXwtiqLYThnQgYSYemH7VDZ9YfLMzFlA=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
	dkim=pass  header.i=chaosfield.at;
	spf=pass  smtp.mailfrom=jakob+lkml@chaosfield.at;
	dmarc=pass header.from=<jakob+lkml@chaosfield.at>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1733141276;
	s=zohoeu1; d=chaosfield.at; i=jakob+lkml@chaosfield.at;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=BMV9SMnLebQrEW79GXBEprl8gCg+plSDoj9lVar/fxY=;
	b=DQnLpBQM/g2VhVYaqcmyN2NN6dhIywA3mLcS2u4yCZvApsby2dNriC8LWKorLnX/
	eCvqon+ZtWmqMMgqJfJQXiVu74e5AHlGM/y5OUESJZsCCWxwWJrw3zr+tR09PgfE4zZ
	PFOcFD7/keDQPOZiLmpAii671VXqwkuAn9fIfHiY=
Received: by mx.zoho.eu with SMTPS id 1733141272255861.7005327403868;
	Mon, 2 Dec 2024 13:07:52 +0100 (CET)
Message-ID: <50bbd767-b0e0-4788-975b-f5d9598208e5@chaosfield.at>
Date: Mon, 2 Dec 2024 13:07:51 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2] leds: pwm-multicolor: Disable PWM when going to suspend
To: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
References: <d7d930bc-4c82-4272-b2c6-88f7cac5a3e1@chaosfield.at>
Content-Language: en-US
From: Jakob Riepler <jakob+lkml@chaosfield.at>
In-Reply-To: <d7d930bc-4c82-4272-b2c6-88f7cac5a3e1@chaosfield.at>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

This fixes suspend on platforms like stm32mp1xx, where the PWM consumer
has to be disabled for the PWM to enter suspend.
Another positive side effect is that active-low LEDs now properly
turn off instead of going back to full brightness when they are set to 0.

Link: https://lore.kernel.org/all/20240417153846.271751-2-u.kleine-koenig@pengutronix.de/
Signed-off-by: Jakob Riepler <jakob+lkml@chaosfield.at>
---
Changes in v2:
 - fix wrong line-breaks in patch

 drivers/leds/rgb/leds-pwm-multicolor.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/leds/rgb/leds-pwm-multicolor.c b/drivers/leds/rgb/leds-pwm-multicolor.c
index e1a81e0109e8..f80a06cc31f8 100644
--- a/drivers/leds/rgb/leds-pwm-multicolor.c
+++ b/drivers/leds/rgb/leds-pwm-multicolor.c
@@ -50,7 +50,13 @@ static int led_pwm_mc_set(struct led_classdev *cdev,
             duty = priv->leds[i].state.period - duty;
 
         priv->leds[i].state.duty_cycle = duty;
-        priv->leds[i].state.enabled = duty > 0;
+        /*
+         * Disabling a PWM doesn't guarantee that it emits the inactive level.
+         * So keep it on. Only for suspending the PWM should be disabled because
+         * otherwise it refuses to suspend. The possible downside is that the
+         * LED might stay (or even go) on.
+         */
+        priv->leds[i].state.enabled = !(cdev->flags & LED_SUSPENDED);
         ret = pwm_apply_might_sleep(priv->leds[i].pwm,
                         &priv->leds[i].state);
         if (ret)
-- 
2.47.0

