Return-Path: <linux-leds+bounces-6412-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F1CC2CBBC70
	for <lists+linux-leds@lfdr.de>; Sun, 14 Dec 2025 16:21:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7A0033003143
	for <lists+linux-leds@lfdr.de>; Sun, 14 Dec 2025 15:21:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEAFD29E0F8;
	Sun, 14 Dec 2025 15:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k1uxk+3Z"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96D162853EE;
	Sun, 14 Dec 2025 15:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765725681; cv=none; b=qiGSWYjACdJHrQwmRkrpaXuNmDa8qLtg3ZY/AJAKbFBxoibkNe5WYUCaCLheukO5ECVRSDJWJEjs1Fecrr358VIIXgg9Ccd/BwT1oiRsxH9FXaVq0kjVSv4EhrIO+skclrsyKU2V5ErxPjhIzZgdvUeFmJTKmOPyQA03GY6tV6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765725681; c=relaxed/simple;
	bh=KBeJ+CgSGAIHFdsSI7QmsuNMFL/7ancFHxMcD/qdAi8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZXwR83NYvYCbdfqoZD9586QWD0gM2bfulDoLIqXifHsurdSL3EXti46+AspWpk+5JS0ZCH1/OjvdhBlAGEb9XUA6xabLl296En7UTscwBzp2ROamaF8cvmpByNMoYwKbEWqBbMrrnBNcoi5FHIrj1EYANgFDwv5X34JOmu8l5DE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k1uxk+3Z; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB725C4CEF1;
	Sun, 14 Dec 2025 15:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765725681;
	bh=KBeJ+CgSGAIHFdsSI7QmsuNMFL/7ancFHxMcD/qdAi8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=k1uxk+3ZTjZafq5cfO1lZt5MSaf9MO7lFhY47C1esaP9aYEGN3djE7XhAsrk4Fj/L
	 QcMnuJrS9qyvI3Elmw5rgrbzKlMnYaWE5nbl8+Fu7KGPp809K8+F/E5AnsbHZjjVII
	 Zp9aDPxBaFSCDWN411CLGgDVjSmThc4QrxwD5P4lJRaWniJcIsbqkmRAyP/OKa+xfQ
	 1fKf+TJkJWWTve+jl8MZdvTDJwqU4RPYYfrqwmr7/FPGON93zOS3jL2HBLJVeJORD3
	 wEB6Qow5kT/9Y1ivbBef346VYtv4d9Kl6lMWqBsNuGWGhDmG70mKaTZmd6E3POaqJH
	 +aG6MX+8pkOiw==
Date: Sun, 14 Dec 2025 15:21:16 +0000
From: Lee Jones <lee@kernel.org>
To: Martijn de Gouw <martijn.de.gouw@prodrive-technologies.com>,
	Jean-Jacques Hiblot <jjhiblot@traphandler.com>
Cc: Pavel Machek <pavel@kernel.org>, linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] leds: group-multicolor: Add support for initial value.
Message-ID: <20251214152116.GC9275@google.com>
References: <20251124210521.2064660-1-martijn.de.gouw@prodrive-technologies.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251124210521.2064660-1-martijn.de.gouw@prodrive-technologies.com>

INTENTIONAL TOP POST: I think the original author should have been on Cc.

Adding: Jean-Jacques Hiblot <jjhiblot@traphandler.com>

> When the driver is loaded, it turned off all LEDs in the group. This
> patch changes the driver to take over existing LED states and set
> the brighness and intensity in the group accordingly.
> 
> Signed-off-by: Martijn de Gouw <martijn.de.gouw@prodrive-technologies.com>
> ---
>  drivers/leds/rgb/leds-group-multicolor.c | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/leds/rgb/leds-group-multicolor.c b/drivers/leds/rgb/leds-group-multicolor.c
> index 548c7dd63ba1e..a12720d73f188 100644
> --- a/drivers/leds/rgb/leds-group-multicolor.c
> +++ b/drivers/leds/rgb/leds-group-multicolor.c
> @@ -69,6 +69,7 @@ static int leds_gmc_probe(struct platform_device *pdev)
>  	struct mc_subled *subled;
>  	struct leds_multicolor *priv;
>  	unsigned int max_brightness = 0;
> +	unsigned int default_brightness = 0;
>  	int i, ret, count = 0, common_flags = 0;
>  
>  	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> @@ -96,6 +97,13 @@ static int leds_gmc_probe(struct platform_device *pdev)
>  
>  		max_brightness = max(max_brightness, led_cdev->max_brightness);
>  
> +		/*
> +		 * If any LED is on, set brightness to the max brightness.
> +		 * The actual brightness of the LED is set as intensity value.
> +		 */
> +		if (led_cdev->brightness)
> +			default_brightness = max_brightness;
> +
>  		count++;
>  	}
>  
> @@ -109,14 +117,16 @@ static int leds_gmc_probe(struct platform_device *pdev)
>  
>  		subled[i].color_index = led_cdev->color;
>  
> -		/* Configure the LED intensity to its maximum */
> -		subled[i].intensity = max_brightness;
> +		/* Configure the LED intensity to its current brightness */
> +		subled[i].intensity = DIV_ROUND_CLOSEST(led_cdev->brightness * max_brightness,
> +							led_cdev->max_brightness);
>  	}
>  
>  	/* Initialise the multicolor's LED class device */
>  	cdev = &priv->mc_cdev.led_cdev;
>  	cdev->brightness_set_blocking = leds_gmc_set;
>  	cdev->max_brightness = max_brightness;
> +	cdev->brightness = default_brightness;
>  	cdev->color = LED_COLOR_ID_MULTI;
>  	priv->mc_cdev.num_colors = count;
>  
> -- 
> 2.39.2
> 

-- 
Lee Jones [李琼斯]

