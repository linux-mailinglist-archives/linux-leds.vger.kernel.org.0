Return-Path: <linux-leds+bounces-3018-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D976996C53
	for <lists+linux-leds@lfdr.de>; Wed,  9 Oct 2024 15:38:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B33641F225AF
	for <lists+linux-leds@lfdr.de>; Wed,  9 Oct 2024 13:38:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5370E19925B;
	Wed,  9 Oct 2024 13:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ji5edDWZ"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2881D1991A5;
	Wed,  9 Oct 2024 13:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728481077; cv=none; b=oXQ+6X14at1IKipL7lxSwftQt+HQ16rWmedbqAg/j8MfVHkngXajLaIGRZPxFegK4wUCZFpK2eAiQuE/TYe0c5aTPme9Xs9R47ECE//+nTtzRiVBauP8jbkqLnSASgcPTGUoZ7iuh+Uo6uJKQ79AIurh1fwMnEgMX9gCErDM4U0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728481077; c=relaxed/simple;
	bh=inqUPwZrCwgQ0WwB63ubH2s8Z1BG2g5wB8rNGIfOqew=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RVdG/DA38s2wnwlulIUGelXotXfl9ZoOHjbaD6ocutqVUsnwyOJJ1+8gnxTfK3JXicNrdqcA8SeROP9CaAcoJnJtD0BM535vxQFREd3pFxSj7oIj4yZLtjNzmAzlcg0+qQpa6g3HS4ZEkyLDJ5cMBbE+xyevAdUE1aEax9PHgzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ji5edDWZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADA7CC4CED1;
	Wed,  9 Oct 2024 13:37:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728481077;
	bh=inqUPwZrCwgQ0WwB63ubH2s8Z1BG2g5wB8rNGIfOqew=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ji5edDWZ4qxDrXTD1PWyWgdqj3onWa6afzPIJcunhsh8tuIhGo7qjAP7/Hn0ZRNuB
	 rzDCLXx0ZoLKsc8MkQDVqSLIeAKXxxPJ6GBKg6HcDazkSNVKDuYPqJdkuC2Wc+NwOd
	 vV2KqojpkOKY3fEOcMh+wiVK5khghqn4easGo9Quyhe26c3WkQLzwuYfRSjUaAbkCg
	 RZv4Jq8GeSm3poAgn49Ey9wnOgbLqHL1VmBJQiLfj/kBrwnOAdNjHkVNW52GPtRBuV
	 GuNB1P/IGQsoGfFcaJNuHssY5q2x5SXi5PXxwWUWmzebicw8PgeFdheu7x5pj+POtK
	 Rp2Y+yGJ2XrGQ==
Date: Wed, 9 Oct 2024 14:37:52 +0100
From: Lee Jones <lee@kernel.org>
To: Dipendra Khadka <kdipendra88@gmail.com>
Cc: avel@ucw.cz, lee@kernel.org, linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Staging: leds: replace divide condition 'shift / 16'
 with 'shift >= 16'
Message-ID: <20241009133643.GI276481@google.com>
References: <20240922174020.49856-1-kdipendra88@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240922174020.49856-1-kdipendra88@gmail.com>

Staging!  Why Staging?

On Sun, 22 Sep 2024, Dipendra Khadka wrote:

> Smatch reported following:
> '''
> drivers/leds/leds-bcm6328.c:116 bcm6328_led_mode() warn: replace divide condition 'shift / 16' with 'shift >= 16'
> drivers/leds/leds-bcm6328.c:360 bcm6328_led() warn: replace divide condition 'shift / 16' with 'shift >= 16'
> '''
> Replacing 'shift / 16' with 'shift >= 16'.

More info please.

- What is the current problem you're attempting to solve?
- How does this patch help with that?
- What are the consequences for not applying this fix?

> Signed-off-by: Dipendra Khadka <kdipendra88@gmail.com>
> ---
>  drivers/leds/leds-bcm6328.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/leds/leds-bcm6328.c b/drivers/leds/leds-bcm6328.c
> index 246f1296ab09..13f535ccba0b 100644
> --- a/drivers/leds/leds-bcm6328.c
> +++ b/drivers/leds/leds-bcm6328.c
> @@ -113,7 +113,7 @@ static void bcm6328_led_mode(struct bcm6328_led *led, unsigned long value)
>  	unsigned long val, shift;
>  
>  	shift = bcm6328_pin2shift(led->pin);
> -	if (shift / 16)
> +	if (shift >= 16)
>  		mode = led->mem + BCM6328_REG_MODE_HI;
>  	else
>  		mode = led->mem + BCM6328_REG_MODE_LO;
> @@ -357,7 +357,7 @@ static int bcm6328_led(struct device *dev, struct device_node *nc, u32 reg,
>  		break;
>  	case LEDS_DEFSTATE_KEEP:
>  		shift = bcm6328_pin2shift(led->pin);
> -		if (shift / 16)
> +		if (shift >= 16)
>  			mode = mem + BCM6328_REG_MODE_HI;
>  		else
>  			mode = mem + BCM6328_REG_MODE_LO;
> -- 
> 2.43.0
> 
> 

-- 
Lee Jones [李琼斯]

