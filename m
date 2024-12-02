Return-Path: <linux-leds+bounces-3456-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 70FC09DFDC7
	for <lists+linux-leds@lfdr.de>; Mon,  2 Dec 2024 10:51:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 371C5281E78
	for <lists+linux-leds@lfdr.de>; Mon,  2 Dec 2024 09:51:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 243D01FBC84;
	Mon,  2 Dec 2024 09:49:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chaosfield.at header.i=jakob+lkml@chaosfield.at header.b="a47zapme"
X-Original-To: linux-leds@vger.kernel.org
Received: from sender-op-o11.zoho.eu (sender-op-o11.zoho.eu [136.143.169.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DF951FA827
	for <linux-leds@vger.kernel.org>; Mon,  2 Dec 2024 09:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.169.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733132983; cv=pass; b=WY+DCSM1sHG8+7zLgavtECVclbs12ZCTA4aCqeq0qkqufksXkjKTL0q+Gj3esIPjIHb5n9JINkR7nSSOyMVcb50HPAYo7u7GmsDfSaNaUeWhlKubs4tAGB1yg91DQDgl3WMQ+flgc2aSZQVZuhrCq0skGrjUn7FG50050aFbjog=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733132983; c=relaxed/simple;
	bh=MbICyQsPvJAAo9ILIEbsw6MS55XWr27QBzphMMOFI/A=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=dc8BUruavFzws+440VTRObTwzl2Ym2nd4UfzfxvRkmFSKY4hiQskGg7fNwaTo7Cvkidoz8qHe34pQO7BG9hwiaExiFEmRS2rzlftxCvkHzXjArjm1Lgyug4FISgLIu5R3fsiZYIgYwufTuE2y5NQxCzaZtU29HqdwL1Ro3SuT1k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chaosfield.at; spf=pass smtp.mailfrom=chaosfield.at; dkim=pass (1024-bit key) header.d=chaosfield.at header.i=jakob+lkml@chaosfield.at header.b=a47zapme; arc=pass smtp.client-ip=136.143.169.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chaosfield.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chaosfield.at
ARC-Seal: i=1; a=rsa-sha256; t=1733132039; cv=none; 
	d=zohomail.eu; s=zohoarc; 
	b=K167TZpchs/s6dapR+MVt9oJaj3AB/qXnEloSa8F+hH7tCuF2SmB6PwXJm0W/cNqDedVIDySynOqf6ycDHeXHxdx5pOPm8I96ep3IZGmKZIBs3CQuoOMEVPU9Jov9S64cFJ5QZJsAmIGnYmkwBSIPjvkueLKUS8zGgQcgpz8I0Q=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
	t=1733132039; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=OJAZDsiTKccCTEvgek6N9lxLeLvTd97VAf6qnXrLf58=; 
	b=GTZ5Gynzn4pFDFV0+iDdy3h2IVVpWojT2UkVwWEPCgC0iqAn26YbZ3k11sMQOgEokVi2nRSO4qnAs5qLOTmteSMlOvoKbuvwcPocUF4yqWYhsG/vJzC9RrkIEoh7u18WTq/O3ds14Sl1hRNL4UFXH27JiIrucu+Mg011MUJNRkU=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
	dkim=pass  header.i=chaosfield.at;
	spf=pass  smtp.mailfrom=jakob+lkml@chaosfield.at;
	dmarc=pass header.from=<jakob+lkml@chaosfield.at>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1733132039;
	s=zohoeu1; d=chaosfield.at; i=jakob+lkml@chaosfield.at;
	h=Message-ID:Date:Date:MIME-Version:From:From:Subject:Subject:To:To:Cc:Cc:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=OJAZDsiTKccCTEvgek6N9lxLeLvTd97VAf6qnXrLf58=;
	b=a47zapmepXSbIpXRgJnCgob40bPeaETfBV+ALydtwxbhAShMkT4TgUr5aS9qP9Hy
	6CY0axUA/Ssj0Dbdb4iWh6V1zBPYVRAaN9rQewgWv6f210NPa1M4sdZy9kPh/HVv/ZH
	LGak/ToYPpg8SJKIkowyVbhVw8Sjx5M4baXBW4CY=
Received: by mx.zoho.eu with SMTPS id 1733132035596622.3248648826997;
	Mon, 2 Dec 2024 10:33:55 +0100 (CET)
Message-ID: <d7d930bc-4c82-4272-b2c6-88f7cac5a3e1@chaosfield.at>
Date: Mon, 2 Dec 2024 10:33:54 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Jakob Riepler <jakob+lkml@chaosfield.at>
Subject: [PATCH] leds: pwm-multicolor: Disable PWM when going to suspend
To: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

This fixes suspend on platforms like stm32mp1xx, where the PWM consumer
has to be disabled for the PWM to enter suspend.
Another positive side effect is that active-low LEDs now properly
turn off instead of going back to full brightness when they are set to 0.

Link: 
https://lore.kernel.org/all/20240417153846.271751-2-u.kleine-koenig@pengutronix.de/
Signed-off-by: Jakob Riepler <jakob+lkml@chaosfield.at>
---
  drivers/leds/rgb/leds-pwm-multicolor.c | 8 +++++++-
  1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/leds/rgb/leds-pwm-multicolor.c 
b/drivers/leds/rgb/leds-pwm-multicolor.c
index e1a81e0109e8..f80a06cc31f8 100644
--- a/drivers/leds/rgb/leds-pwm-multicolor.c
+++ b/drivers/leds/rgb/leds-pwm-multicolor.c
@@ -50,7 +50,13 @@ static int led_pwm_mc_set(struct led_classdev *cdev,
              duty = priv->leds[i].state.period - duty;

          priv->leds[i].state.duty_cycle = duty;
-        priv->leds[i].state.enabled = duty > 0;
+        /*
+         * Disabling a PWM doesn't guarantee that it emits the inactive 
level.
+         * So keep it on. Only for suspending the PWM should be 
disabled because
+         * otherwise it refuses to suspend. The possible downside is 
that the
+         * LED might stay (or even go) on.
+         */
+        priv->leds[i].state.enabled = !(cdev->flags & LED_SUSPENDED);
          ret = pwm_apply_might_sleep(priv->leds[i].pwm,
                          &priv->leds[i].state);
          if (ret)
-- 
2.47.0


