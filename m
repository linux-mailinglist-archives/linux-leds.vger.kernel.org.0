Return-Path: <linux-leds+bounces-2497-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CA0895A27B
	for <lists+linux-leds@lfdr.de>; Wed, 21 Aug 2024 18:11:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 27BC7282397
	for <lists+linux-leds@lfdr.de>; Wed, 21 Aug 2024 16:11:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C55913B28D;
	Wed, 21 Aug 2024 16:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WGsfnMyW"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 481F313AA2F
	for <linux-leds@vger.kernel.org>; Wed, 21 Aug 2024 16:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724256683; cv=none; b=mLDq+CIk7nYcn8Ql43j6aCGP5kigpJcSbUlNYYDcWfzmNIxkB+mNboTNVB3FfE0fzLmOHi0lTq5clLVLH9QL2twdVYF1tiqMjllPp5JDRmC9afwaUHBPqArQ3vikS+gCPbR9uvLXwvo1j4kjU48zFfyJWkjXxsgNBDA0Tsy3Ok0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724256683; c=relaxed/simple;
	bh=7V4SqnOFdOVaPeFhcL+aVXiWOChv0VVj8fzHlspixS0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=swlKg4W4DmjxHFMMWwjabAzbaceEP+0y32xSdOgaT1/CMzpaowOYomKBwf0QWzR9QR60mIE2ys7dv+OPEMB6X0FNAIkVLCSC5oRNjadqhonNwt8h9EcaWo1n/rjxY5ci7/aeYRP6AZOCpodH0GXoWwp6fJCvH9acRVELPslLvyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WGsfnMyW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50668C32781;
	Wed, 21 Aug 2024 16:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724256683;
	bh=7V4SqnOFdOVaPeFhcL+aVXiWOChv0VVj8fzHlspixS0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WGsfnMyW+n4hV9dBxvMxEAQMT6HMEBA0rocZKc3E5RvTkpAayX2LqG6PBZQyGZBrz
	 cMFP2LtMyhipbHfPKWmtKS3V0vV3AXnJuaJcKtFFxHpVFTQrgT0z4ZF2ezLWh8m2VS
	 kuYNLPVZmGXisVO309wcBRcVH2J1Mz5pemf5qOqVPfDgCL9e4Z71t7X9o+MQLVjKX4
	 ZCD1N9TtuZyaHDIJ/C3mFe0Rkv1tLhHTFzuiyqpZUwzJZ19BlL8mq3f9THE+A9js94
	 xaHgKOSZ3TNhE9skB47N1mHF2fKpTBjnhOVGFvpJluJJTqijB3/OUipEqZ4ZEFSSyn
	 YirPACFjixr8w==
Date: Wed, 21 Aug 2024 17:11:19 +0100
From: Lee Jones <lee@kernel.org>
To: FUKAUMI Naoki <naoki@radxa.com>
Cc: linux-leds@vger.kernel.org, pavel@ucw.cz
Subject: Re: [PATCH] leds: pwm-multicolor: fix multicolor PWM LED lights up
 without any setting
Message-ID: <20240821161119.GC6858@google.com>
References: <20240816102626.826-1-naoki@radxa.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240816102626.826-1-naoki@radxa.com>

On Fri, 16 Aug 2024, FUKAUMI Naoki wrote:

> from drivers/leds/leds-pwm.c:led_pwm_set(),
> 
> /*
>  * Disabling a PWM doesn't guarantee that it emits the inactive level.
>  * So keep it on. Only for suspending the PWM should be disabled because
>  * otherwise it refuses to suspend. The possible downside is that the
>  * LED might stay (or even go) on.
>  */
> 
> do the same in led_pwm_mc_set().
> 
> this fixes LEDs light up without any setting (i.e. brightness is 0) on
> Radxa E25.

Please redraft the commit message into proper sentences, complete with
correct grammar.  All sentences should start with an uppercase char.

Copying comment-blocks into commit messages to save authors from writing
one isn't really the done thing.

> Signed-off-by: FUKAUMI Naoki <naoki@radxa.com>
> ---
>  drivers/leds/rgb/leds-pwm-multicolor.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/leds/rgb/leds-pwm-multicolor.c b/drivers/leds/rgb/leds-pwm-multicolor.c
> index e1a81e0109e8..7155339c075e 100644
> --- a/drivers/leds/rgb/leds-pwm-multicolor.c
> +++ b/drivers/leds/rgb/leds-pwm-multicolor.c
> @@ -50,7 +50,7 @@ static int led_pwm_mc_set(struct led_classdev *cdev,
>  			duty = priv->leds[i].state.period - duty;
>  
>  		priv->leds[i].state.duty_cycle = duty;
> -		priv->leds[i].state.enabled = duty > 0;
> +		priv->leds[i].state.enabled = !(cdev->flags & LED_SUSPENDED);
>  		ret = pwm_apply_might_sleep(priv->leds[i].pwm,
>  					    &priv->leds[i].state);
>  		if (ret)
> -- 
> 2.43.0
> 

-- 
Lee Jones [李琼斯]

