Return-Path: <linux-leds+bounces-7106-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KL0bE2bHqWmcEgEAu9opvQ
	(envelope-from <linux-leds+bounces-7106-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 05 Mar 2026 19:11:50 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EC18216E03
	for <lists+linux-leds@lfdr.de>; Thu, 05 Mar 2026 19:11:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1AEB43004632
	for <lists+linux-leds@lfdr.de>; Thu,  5 Mar 2026 18:11:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13190366804;
	Thu,  5 Mar 2026 18:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BHVHo6Cy"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E32C526CE1E;
	Thu,  5 Mar 2026 18:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772734285; cv=none; b=jcV4PeqnljhROA3hdJ5i+nVE+cR2lv3B2TEr4eJEtR8vDDWiI/NicC6dikxbhmUNLyZ1wYp31WKg/5tWKF6ADp5bUrzeyEeBHrS60AFNjaFAOoxCJtTi0k2V27PKYD7UKPDJfqNZTFQOimMZIsnvSsskImPM7a6n6pv0bBxIpwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772734285; c=relaxed/simple;
	bh=cz65efVedRk7ZxsEk5FwyKMmaHIsAuAab6dTf+REeUY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qT/LIeVShVy7ohHqEyD2ZvwkaAGU+vIvj/+Lf/9+Pe9L0+EswGD/hy5y52PFGljA+YR1EhgwhwiiwfV3Z5HIiyAJ0gC5pfHeVUDTQ228bC3emm0l3RLE8Dmw4RPcviWJnKWnUxg0HmK4TtrUvYsNgxEJM2sh5ThSHUbTevTkaW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BHVHo6Cy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48A04C116C6;
	Thu,  5 Mar 2026 18:11:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772734284;
	bh=cz65efVedRk7ZxsEk5FwyKMmaHIsAuAab6dTf+REeUY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BHVHo6CyFakfIKmdIe9WafGj5UJGY/AMB/Nd2IOPqooIJmkk+mXp63wxsE06cJWa0
	 x1UFofP1bylwMz023kOFfHkOvx1bihiBer6Qa7sPNz+u8aV5VZl8Kf71eu28He0yZS
	 kZImuFaF2cr1Z7WwRPBXdsw+x4DdDavfTX4EEycAPTsaJjQe/lMCwV9F5BAUHdqjaf
	 RAdVQTsH97vL6G1V+tCJzGeYY4nBLW1jHfaHiKcPI8tJuoP9/LFrfWh/MF/T8Qtr4t
	 OaPT6H1r+wUpp7HpQujj7fXAwWFyJlkl6zPfrwLlLzpz9qhjndCVvJYjbBifAnjvVy
	 hS241wYAN2yKg==
Date: Thu, 5 Mar 2026 18:11:20 +0000
From: Lee Jones <lee@kernel.org>
To: Martijn de Gouw <martijn.de.gouw@prodrive-technologies.com>
Cc: Pavel Machek <pavel@kernel.org>, linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] leds: group-multicolor: Add support for initial value.
Message-ID: <20260305181120.GB183676@google.com>
References: <20260209171514.3378893-1-martijn.de.gouw@prodrive-technologies.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260209171514.3378893-1-martijn.de.gouw@prodrive-technologies.com>
X-Rspamd-Queue-Id: 4EC18216E03
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_FROM(0.00)[bounces-7106-lists,linux-leds=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lee@kernel.org,linux-leds@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

On Mon, 09 Feb 2026, Martijn de Gouw wrote:

> When the driver is loaded, it turned off all LEDs in the group. This
> patch changes the driver to take over existing LED states and set
> the brighness and intensity in the group accordingly.
> 
> Signed-off-by: Martijn de Gouw <martijn.de.gouw@prodrive-technologies.com>
> ---
>  drivers/leds/rgb/leds-group-multicolor.c | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)

You forgot to add a change log and a version to the subject line.

You also forgot to add Jean again.

Please resubmit.

> diff --git a/drivers/leds/rgb/leds-group-multicolor.c b/drivers/leds/rgb/leds-group-multicolor.c
> index 548c7dd63ba1e..ab46537697d76 100644
> --- a/drivers/leds/rgb/leds-group-multicolor.c
> +++ b/drivers/leds/rgb/leds-group-multicolor.c
> @@ -69,6 +69,7 @@ static int leds_gmc_probe(struct platform_device *pdev)
>  	struct mc_subled *subled;
>  	struct leds_multicolor *priv;
>  	unsigned int max_brightness = 0;
> +	bool is_on = false;
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
> +			is_on = true;
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
> +	cdev->brightness = is_on ? max_brightness : 0;
>  	cdev->color = LED_COLOR_ID_MULTI;
>  	priv->mc_cdev.num_colors = count;
>  
> -- 
> 2.39.2
> 
> 

-- 
Lee Jones [李琼斯]

