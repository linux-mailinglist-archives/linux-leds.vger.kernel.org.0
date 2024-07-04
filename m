Return-Path: <linux-leds+bounces-2187-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 37449927B77
	for <lists+linux-leds@lfdr.de>; Thu,  4 Jul 2024 18:50:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5A5511C216E9
	for <lists+linux-leds@lfdr.de>; Thu,  4 Jul 2024 16:50:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C8861B29CE;
	Thu,  4 Jul 2024 16:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qR2Q1RE2"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 554FF1B29C0;
	Thu,  4 Jul 2024 16:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720111805; cv=none; b=mWaBHUcBldOZ8Cv0yNM1YHkjsepqw/2WRJFhyGnBH9zzsxNObb3LAQ9kF+vgUE5+4Y+h+lBdJ1rdfsqZYInTKATqYxhP1B2IJgtkCrXHwwiLwlAZ5+0qD1s7DeqIGwBMpoJocxKXKTrh2V+yPlwRQ7rEjbvzZSh8s3EGJPHS9go=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720111805; c=relaxed/simple;
	bh=M32rWEsF2jgLzr9GzWVSV/ALWkQHAj71fx8QBNAzwjs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r2v+B24id9hxrQFbwz90ZR8dpCRtZe6v17nzC07HJeHVMBc0lGc8wG3dKhcMomcztlgKO7/PKiAqshAOzOQ/VQXFcsvp8SHJm2I7UuvTRfIN8bbIjYfc3JDxUHDo85H5bAyXFmHa2xOJuIBo8lkYqzJV6GOg5Mlr/Kd5KxPo3D0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qR2Q1RE2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 517E2C3277B;
	Thu,  4 Jul 2024 16:50:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720111804;
	bh=M32rWEsF2jgLzr9GzWVSV/ALWkQHAj71fx8QBNAzwjs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qR2Q1RE29nfcHw3C8czz56kPt2ywRb2DG1mAsJlLWuwjC2byn+qF1fbUTiF1YW2/R
	 yhI4/CTfdYSEhIjZRVgRamv5MCl9Xfd3mokI968dpxtjojg1NajzsddkguOJYErYSU
	 Qq7t/6XwLbj93nbXbEVnP+FA/uw46x8+Pqowjo37VLPdZsDaSIsRDbXjkKvvGZtIib
	 UmbdjtWx1s70Bb9TnblkAiHvww/PNiOmb1IDjaymEp5nuhx2fmn+n/aoFARlF/B78O
	 6Y+OLh8tTBgzCzXhTXS9u4mgi7C9lR/mXTm4m+f9VCNFYUQa0jVmkL/LlxBBg3D0D/
	 nit4kYLgT6O7w==
Date: Thu, 4 Jul 2024 17:50:00 +0100
From: Lee Jones <lee@kernel.org>
To: Jack Chen <zenghuchen@google.com>
Cc: Pavel Machek <pavel@ucw.cz>, Mark Brown <broonie@kernel.org>,
	Vadim Pasternak <vadimp@nvidia.com>,
	Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org
Subject: Re: [PATCH] leds:lm3601x:calculate max_brightness and brightness
 properly
Message-ID: <20240704165000.GA501857@google.com>
References: <20240703164635.221203-1-zenghuchen@google.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240703164635.221203-1-zenghuchen@google.com>

Subject line needs fixing.

`git log --oneline -- drivers/<subsystem>` is your friend.

> 1) check the range of torch_current_max,
> 2) calcualtes max_brightness precisely,
> 3) lm3601x torch brightness register starts from 0 (2.4 mA).

Please write this out as a proper paragraph.

This isn't really a numbered list type situation.

> Tested: tested with a lm36011 and it can set its brightness to lowest
> value (2.4 mA)

What is the Tested: trailer?  Again, please write this out properly.

> Signed-off-by: Jack Chen <zenghuchen@google.com>
> ---
>  drivers/leds/flash/leds-lm3601x.c | 15 ++++++++++++---
>  1 file changed, 12 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/leds/flash/leds-lm3601x.c b/drivers/leds/flash/leds-lm3601x.c
> index 7e93c447fec5..fc4df904ea90 100644
> --- a/drivers/leds/flash/leds-lm3601x.c
> +++ b/drivers/leds/flash/leds-lm3601x.c
> @@ -190,7 +190,7 @@ static int lm3601x_brightness_set(struct led_classdev *cdev,
>  		goto out;
>  	}
>  
> -	ret = regmap_write(led->regmap, LM3601X_LED_TORCH_REG, brightness);
> +	ret = regmap_write(led->regmap, LM3601X_LED_TORCH_REG, brightness - 1);

Why is there now a need to start adding/subtracting 1s to make the maths work?

>  	if (ret < 0)
>  		goto out;
>  
> @@ -341,8 +341,9 @@ static int lm3601x_register_leds(struct lm3601x_led *led,
>  
>  	led_cdev = &led->fled_cdev.led_cdev;
>  	led_cdev->brightness_set_blocking = lm3601x_brightness_set;
> -	led_cdev->max_brightness = DIV_ROUND_UP(led->torch_current_max,
> -						LM3601X_TORCH_REG_DIV);
> +	led_cdev->max_brightness = DIV_ROUND_UP(

This is no place to break a line.

Break after the '=' and wrap at 100-chars instead.

> +			led->torch_current_max - LM3601X_MIN_TORCH_I_UA + 1,
> +			LM3601X_TORCH_REG_DIV);
>  	led_cdev->flags |= LED_DEV_CAP_FLASH;
>  
>  	init_data.fwnode = fwnode;
> @@ -386,6 +387,14 @@ static int lm3601x_parse_node(struct lm3601x_led *led,
>  		goto out_err;
>  	}
>  
> +	if (led->torch_current_max > LM3601X_MAX_TORCH_I_UA) {
> +		dev_warn(&led->client->dev,
> +			 "led-max-microamp cannot be higher than %d\n",
> +			 LM3601X_MAX_TORCH_I_UA);

"Max torch current set too high (%d vs %d)"

> +		led->torch_current_max = LM3601X_MAX_TORCH_I_UA;
> +	}
> +
> +

2 lines?

>  	ret = fwnode_property_read_u32(child, "flash-max-microamp",
>  				&led->flash_current_max);
>  	if (ret) {
> -- 
> 2.45.2.803.g4e1b14247a-goog
> 

-- 
Lee Jones [李琼斯]

