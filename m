Return-Path: <linux-leds+bounces-4390-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 69507A796E3
	for <lists+linux-leds@lfdr.de>; Wed,  2 Apr 2025 22:53:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F214F7A4628
	for <lists+linux-leds@lfdr.de>; Wed,  2 Apr 2025 20:52:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F1BD1EBFF9;
	Wed,  2 Apr 2025 20:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="vDllKtZD";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="oqQFri5k"
X-Original-To: linux-leds@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0FD1193436
	for <linux-leds@vger.kernel.org>; Wed,  2 Apr 2025 20:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743627224; cv=none; b=qkyAMX6vsC/upMRkqWicNWIPjKoGwm/+eggqooNQdLYBL+ZrJ8uqGfFHlBURS3AU1XDeC4Lua3p8ZORiDvElWAsNHO0oJrINuJrBsveHP+LNyN7j9dIgphqeQ6sYK4ev5CPFTTvRBo2DKQZAB+1lVV+tmX4dKkUdsmdQFw0Ov7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743627224; c=relaxed/simple;
	bh=jJxHD201EE1bxlVicENB1R66Qenyltkn7Hq2jmpLLlc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PauIraLvGADb02Y2/+glidiUuoEjAUHbyiEWXhemq7DQaWDtCl7ZomZbmlwV4EIwIsCyBvVE25wldZpRl4GB6c8fa8EaGdfEiK01qkwsZqO4bNYzbsvjivvr2dekqR6NKR68TKOoYhgdFA0l7yf58tz6Fz502JNxipa9dq0SkIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=vDllKtZD; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=oqQFri5k; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Date: Wed, 2 Apr 2025 22:53:40 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1743627221;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=S3h2RNZEtD5JtVHuyXHQPw7Z9/ejcfthHJuF+NPPd30=;
	b=vDllKtZDLOorzh4AIZmjK+zIV9/Mm3L0/wEBJGxpNrwjr/Kl3n8Ove/cCyRijhFMURPnJ8
	9PHUv2FsfxqlK9aRXbvqnCD7Hyx+I20xn40KsWGfmB3mTSFaRTfshqdtoVfaBGHEBRoN6D
	RnQuYKQR3rFV54Kq3WiqTxJKW6nC/nLIxiD1FDQ5DPtA7WF6vsGyUAk6fxP23yZRBLYq5U
	K8UTR0UUQO8G9TIprEpFMGDSIlbe5NThjfjMj6T/jq4MH+JXo26DT5bYL4VwEijl4tjvtf
	7vDeunOVD440jt3QTRMaLuHHS7Ht+ajy/fNnaxUywh6A1VuyKTFtrxaovAQ7sw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1743627221;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=S3h2RNZEtD5JtVHuyXHQPw7Z9/ejcfthHJuF+NPPd30=;
	b=oqQFri5kYPnLGjxyXMgTwiW31B9iPbyKPRZF3wyCZsiJioVYXU8RMmRgB4NYum7tZ7b1ts
	BZrb05R6JDXkdVDw==
From: Tobias Deiminger <tobias.deiminger@linutronix.de>
To: linux-leds@vger.kernel.org
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>,
	Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Sven Schwermer <sven.schwermer@disruptive-technologies.com>
Subject: Re: [PATCH RESEND v2] led: multicolor: Fix intensity setting while
 SW blinking
Message-ID: <20250402205340.qdp5dw3p2cxv2pvq@schlupp.tec.linutronix.de>
Mail-Followup-To: linux-leds@vger.kernel.org,
	Jacek Anaszewski <jacek.anaszewski@gmail.com>,
	Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Sven Schwermer <sven.schwermer@disruptive-technologies.com>
References: <20220627133110.271455-1-sven@svenschwermer.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220627133110.271455-1-sven@svenschwermer.de>

Hi Lee and Pavel,

this is still an issue. Sven's patch still applies and fixes the bug.
Would you mind having another look?

Minimal reproducer:

 echo timer > trigger
 echo 255 > brightness
 echo 255 255 255 > multi_intensity  # stops blinking with 50% probability

I encountered this independently and found the thread in hindsight. See review
comments below.

Am Mo, 27. Jun 22 15:31 schrieb Sven Schwermer <sven@svenschwermer.de>:
> From: Sven Schwermer <sven.schwermer@disruptive-technologies.com>
> 
> When writing to the multi_intensity file, don't unconditionally call
> led_set_brightness. By only doing this if blinking is inactive we
> prevent blinking from stopping if the blinking is in its off phase while
> the file is written.
> 
> Instead, if blinking is active, the changed intensity values are applied
> upon the next blink. This is consistent with changing the brightness on
> monochrome LEDs with active blinking.
> 
> Suggested-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
> Tested-by: Sven Schuchmann <schuchmann@schleissheimer.de>
> Acked-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
> Signed-off-by: Sven Schwermer <sven.schwermer@disruptive-technologies.com>
> ---
> 
> Notes:
>     V1->V2: Change title, add tags
> 
>  drivers/leds/led-class-multicolor.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/leds/led-class-multicolor.c b/drivers/leds/led-class-multicolor.c
> index e317408583df..5b1479b5d32c 100644
> --- a/drivers/leds/led-class-multicolor.c
> +++ b/drivers/leds/led-class-multicolor.c
> @@ -59,7 +59,8 @@ static ssize_t multi_intensity_store(struct device *dev,
>  	for (i = 0; i < mcled_cdev->num_colors; i++)
>  		mcled_cdev->subled_info[i].intensity = intensity_value[i];
>  
> -	led_set_brightness(led_cdev, led_cdev->brightness);
> +	if (!test_bit(LED_BLINK_SW, &led_cdev->work_flags))
> +		led_set_brightness(led_cdev, led_cdev->brightness);

Had my own debugging session and ended up with the very same conclusion. Seems
solid and consistent.

Reviewed-by: Tobias Deiminger <tobias.deiminger@linutronix.de>

Btw, my initial attempt to fix it was to have two led_get_brightness variants.
The existing variant gets the timer-aware momentary brightness, and a new one
would get the timer-agnostic on-value. The latter variant could then be used to
call led_set_brightness without the risk of resetting blinking. Worked, but got
overly complicated.

Best regards
Tobias

>  	ret = size;
>  err_out:
>  	mutex_unlock(&led_cdev->led_access);
> 
> base-commit: 210e04ff768142b96452030c4c2627512b30ad95
> -- 
> 2.36.1
> 

