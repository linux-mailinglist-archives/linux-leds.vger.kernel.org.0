Return-Path: <linux-leds+bounces-7486-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GLXKMFMDxGnOvQQAu9opvQ
	(envelope-from <linux-leds+bounces-7486-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 25 Mar 2026 16:46:27 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ECA33285AA
	for <lists+linux-leds@lfdr.de>; Wed, 25 Mar 2026 16:46:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B8BAA300BBAB
	for <lists+linux-leds@lfdr.de>; Wed, 25 Mar 2026 15:40:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3781B3E3153;
	Wed, 25 Mar 2026 15:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Rm9zBJFp"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14C503E2759;
	Wed, 25 Mar 2026 15:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774453222; cv=none; b=JeAZ07UnJY6QkZ7cmuFJwJwCidmpSZSl/7MWj8Ps2Gavd48vghvFbd3/1KFR4lE1o1X/hl+rIfOVSwcrgLBBaGIQHj7p6wsQjBNWC+9aBREQRZ2aZul9jrB0y128QjPmuT47jZ4SPMJpJaBFp6UG2GB/uRkiT42AEC569s9l4Z4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774453222; c=relaxed/simple;
	bh=5A2yB4l43K0kQ4xnty8mplXUWH9hSNxUCp3PzG5JDjc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b7TizXAnRLSp/n7cONJB+3/KLt+cIeGBOIylrs/IdXl36xiOMF1Nn6rQoWSJBZy9rqGgW33Py+fClFfBm5fJbZBoRNfHftOoAHV0S61YyUX7Xj7PQrHTiJnaSZs9fF7qjunIVp1jr5IOw+AATajtswsmH5emRI1stIG8N5TWfFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Rm9zBJFp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A4F8C4CEF7;
	Wed, 25 Mar 2026 15:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774453221;
	bh=5A2yB4l43K0kQ4xnty8mplXUWH9hSNxUCp3PzG5JDjc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Rm9zBJFpB1ZpcGKantxT/MKl2srtEMh3+jwhB2SnW09N/F6tfe+gOuISPxsRArTKk
	 GcPEvf5lt53oSZtdEpa2J70sPC3JvyzdTsJu691zqImbqFVfDDQSMTIn8bHNmpXStz
	 CEr/aEd9EY4fOmp/r508wXkXr7LjAspEaS+dDiETXvlJNMU8+PJYCaZlxZGsvkpZiG
	 lMvB7IjGr+dj9IM56TyFq+/1kAW2yTSQeuAxSODIVuN8EVqUXIgSAqFaGefPztdyW/
	 qY2L+pETIDKz7HygByWQ0YTTpAkUia1KVFGuRKXDQbka/kVCLLZTGMcfH9ogoXpQYg
	 Tq4Ml2IbaZM8w==
Date: Wed, 25 Mar 2026 15:40:17 +0000
From: Lee Jones <lee@kernel.org>
To: Martijn de Gouw <martijn.de.gouw@prodrive-technologies.com>
Cc: Jean-Jacques Hiblot <jjhiblot@traphandler.com>,
	Pavel Machek <pavel@kernel.org>, linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] leds: group-multicolor: Add support for initial value.
Message-ID: <20260325154017.GE1141718@google.com>
References: <20260316201321.2789158-1-martijn.de.gouw@prodrive-technologies.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260316201321.2789158-1-martijn.de.gouw@prodrive-technologies.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7486-lists,linux-leds=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lee@kernel.org,linux-leds@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,prodrive-technologies.com:email]
X-Rspamd-Queue-Id: 6ECA33285AA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, 16 Mar 2026, Martijn de Gouw wrote:

> When the driver is loaded, it turned off all LEDs in the group. This
> patch changes the driver to take over existing LED states and set
> the brighness and intensity in the group accordingly.
> 
> Signed-off-by: Martijn de Gouw <martijn.de.gouw@prodrive-technologies.com>
> ---
> Changes in v3:
> - Use is_on boolean instead of storing the max_brightness twice
> - Link to v2: https://lore.kernel.org/linux-leds/20251124210521.2064660-1-martijn.de.gouw@prodrive-technologies.com/
> 
> Changes in v2:
> - Fix multiline comments
> - Improve comments
> - Link to v1: https://lore.kernel.org/linux-leds/20251111204556.2803878-1-martijn.de.gouw@prodrive-technologies.com/
> 
> ---
>  drivers/leds/rgb/leds-group-multicolor.c | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)
> 
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

There are a couple of potential issues on this line.

'led_cdev->max_brightness' could theoretically be zero, which would
cause a division-by-zero fault.  While the core tries to prevent this, a
defensive check might be worth while.

The multiplication 'led_cdev->brightness * max_brightness' could overflow
if both values are large.  It would be safer to cast the multiplication
to u64, like: (u64)led_cdev->brightness

Finally, and this applies to the read in the first loop as well, the
brightness field of a led_classdev is protected by 'led_sem'. To avoid a
race condition with userspace (e.g., writing to the brightness via
sysfs), we should acquire this lock before reading 'led_cdev->brightness'.

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

