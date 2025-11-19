Return-Path: <linux-leds+bounces-6209-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id DA587C7052B
	for <lists+linux-leds@lfdr.de>; Wed, 19 Nov 2025 18:08:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 8B6C14FF2AC
	for <lists+linux-leds@lfdr.de>; Wed, 19 Nov 2025 16:52:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AC792FDC55;
	Wed, 19 Nov 2025 16:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eJ5R4CUf"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B8E52F90C9;
	Wed, 19 Nov 2025 16:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763571074; cv=none; b=O+v5rRKXbz5gc7JjGSD6OCqU+KhXFsNlzHtqOZv3oWg4VpdBps/G9UrUyiVn/BNqzpoABYdRWNP/b6b65yZpRQefKRVCQXXfQhmJmwtDQmnAZVc9Lt3DLyhknUsyXrHggqZPi5qHkAaSo7VI1CH7dTPP+ZVXBHlYhuNnUZ8BsS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763571074; c=relaxed/simple;
	bh=Jf3QOMsv/yFxFhNTxVO+z5AEA7wgqqdFKXXjyigJjN4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AxbPy1yaV6dyLMTSy85n/pdPRkwa+xfe6kRTXUORg+LbOJ81mIN6tlS7egNs26yZBbMfauOOAvNMeifVJgtaML1AKiRPXHxn47f4IZ8UVgmFEwrnl3HD+AAEpNMKT063eOlwFOfulTlp8F7ffVvnBWkCsC8+IdtfMkUd83e2VKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eJ5R4CUf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AEC5C4CEF5;
	Wed, 19 Nov 2025 16:51:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763571073;
	bh=Jf3QOMsv/yFxFhNTxVO+z5AEA7wgqqdFKXXjyigJjN4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eJ5R4CUfLVuK/r0CpMTHHYF3mBCKmKikO3mVN7rd8F81SURBi6VxM53JcQcn7RRiZ
	 1Wz03gVr3Ef/AXwoKsfYi5hvunWXFrCfvGVd2L9mQYzf0VqAcqFcRoAbqCAaYqno4L
	 ZUz1/LPTv+2kmLNR7pAmguPwBFyrTnK8n9R6za5mF9LXqE6JJIJPZGBQTFqihcu5wC
	 UuTulxWdoUOLP1FMAvL+Z9bbm0QI9wzIKXIhIerdLSDu1P5DEfZVo+etRe/qBAwaD5
	 FkIPtSCPh6j6jHypy2Zby3nea077WCcGow64UOB7aKYo2Dg932gh90dHus/vWndgRs
	 zBE6cGbRJrqpg==
Date: Wed, 19 Nov 2025 16:51:09 +0000
From: Lee Jones <lee@kernel.org>
To: Martijn de Gouw <martijn.de.gouw@prodrive-technologies.com>
Cc: Pavel Machek <pavel@kernel.org>, linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] leds: group-multicolor: Add support for initial value.
Message-ID: <20251119165109.GV1949330@google.com>
References: <20251111204556.2803878-1-martijn.de.gouw@prodrive-technologies.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251111204556.2803878-1-martijn.de.gouw@prodrive-technologies.com>

On Tue, 11 Nov 2025, Martijn de Gouw wrote:

> It's possible to set a default state for leds in the dts with
> 'default-state', but this was not reflected when the LEDs are grouped.
> This patch adds support for keeping the default-state value.
> 
> Signed-off-by: Martijn de Gouw <martijn.de.gouw@prodrive-technologies.com>
> ---
>  drivers/leds/rgb/leds-group-multicolor.c | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/leds/rgb/leds-group-multicolor.c b/drivers/leds/rgb/leds-group-multicolor.c
> index 548c7dd63ba1e..b3e46a51dfbc7 100644
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
> @@ -96,6 +97,12 @@ static int leds_gmc_probe(struct platform_device *pdev)
>  
>  		max_brightness = max(max_brightness, led_cdev->max_brightness);
>  
> +		/* If any LED is on, set brightness to the max brightness.
> +		 * The actual brightness of the LED is set as intensity value.
> +		 */

I don't know this code well, but if no one complains, I can take your
word for this.

However, the comment needs changing to proper multi-line format.

        /*
         * This is the preferred style for multi-line
         * comments in the Linux kernel source code.
         * Please use it consistently.
         *
         * Description:  A column of asterisks on the left side,
         * with beginning and ending almost-blank lines.
         */

> +		if (led_cdev->brightness)
> +			default_brightness = max_brightness;
> +
>  		count++;
>  	}
>  
> @@ -109,14 +116,16 @@ static int leds_gmc_probe(struct platform_device *pdev)
>  
>  		subled[i].color_index = led_cdev->color;
>  
> -		/* Configure the LED intensity to its maximum */
> -		subled[i].intensity = max_brightness;
> +		/* Configure the LED intensity to its current brightness */
> +		subled[i].intensity = DIV_ROUND_CLOSEST(led_cdev->brightness * max_brightness,

How does this work?  Won't this value be huge?

> +							led_cdev->max_brightness);

Also we said we were going to set actual brightness with the intensity
in the comment above, but we appear to be using max_brightness again?

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

