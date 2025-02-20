Return-Path: <linux-leds+bounces-4025-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F39B5A3DD67
	for <lists+linux-leds@lfdr.de>; Thu, 20 Feb 2025 15:55:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AD61D3A8B91
	for <lists+linux-leds@lfdr.de>; Thu, 20 Feb 2025 14:55:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FE2A1D47C3;
	Thu, 20 Feb 2025 14:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MzFDF3q+"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F32361AF0AF;
	Thu, 20 Feb 2025 14:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740063328; cv=none; b=A6J3otliAUmnvLn7/Gkta/hrpPZXN48XqtPsOz9mRyjg1l8EF9PZWSF4AC3Go4bni3DyV2FOgPWbqwy2yheZcPUOYk3hq4ltN72Lee91AoLyhoPDScPblnXti2zUHbh02SPUinIkSv+aWROJpUX2CMOmaZnhdt+2XqVOlIv8tcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740063328; c=relaxed/simple;
	bh=x7a7QgwEQ8Ok2FjIVJZ6GJRoCewQcZ4Bi/rQyvwyGYg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R2ls5XZ61ixQzChJonYF/axxBhQ1K9KTDcM0qzK5HX5itOspZ48SpBa1WcdcUAy3BkTkAGOygZoaIVaE+yZ66oQQvboVF3PcvSvx7x9++KTVtI2J52NRASVKLwCqx+kU4fgl7ZtusKP1tNU2hJQdXmsrYlEu2cnMNil7lXXH7TU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MzFDF3q+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B178C4CED1;
	Thu, 20 Feb 2025 14:55:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740063327;
	bh=x7a7QgwEQ8Ok2FjIVJZ6GJRoCewQcZ4Bi/rQyvwyGYg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MzFDF3q+fUoguQu7juLzjBlqSOY3A35Je9kgKU0yqmo7FJv4VikgzoUEltyL4Zk/i
	 O1iTW09NoVBBxXvKJgx/mgWo7fsdfW3afCl5iV/VACxdwYzv5bEqxdir01tvEAidY1
	 SMTsMTFmUUKZum38H/myeBg7STtZda9z8oo30RTrtweKXnkfpLos9vTUll+c9OBI5d
	 F4lnkh9i5PTZ+e0GvYl/BXU3tiEE3AFF5N5jMUopIyR5DcPgRvY251bveBSmpoiGRy
	 tXV7ewJWpEHWQX0P37OUqIUQuz5fZlN7qVB72sKhkhoeNMx/wr0p2AE67zj3PHEA/g
	 A/Guz0t0e54Sw==
Date: Thu, 20 Feb 2025 14:55:22 +0000
From: Lee Jones <lee@kernel.org>
To: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
Cc: pavel@kernel.org, andersson@kernel.org, krzysztof.kozlowski@linaro.org,
	morf3089@gmail.com, u.kleine-koenig@pengutronix.de,
	marijn.suijten@somainline.org, linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	Zejiong Huang <zejiongh@qti.qualcomm.com>
Subject: Re: [PATCH] leds: rgb: leds-qcom-lpg: Add support for 6-bit PWM
 resolution
Message-ID: <20250220145522.GA778229@google.com>
References: <20250213003533.1684131-1-anjelique.melendez@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250213003533.1684131-1-anjelique.melendez@oss.qualcomm.com>

On Wed, 12 Feb 2025, Anjelique Melendez wrote:

> Currently, driver only allows for PWM modules to use 9-bit resolution.
> However, PWM modules can support 6-bit and 9-bit resolution. Add support
> for 6-bit resolution.
> 
> Suggested-by: Zejiong Huang <zejiongh@qti.qualcomm.com>
> Signed-off-by: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
> ---
>  drivers/leds/rgb/leds-qcom-lpg.c | 13 +++++++------
>  1 file changed, 7 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/leds/rgb/leds-qcom-lpg.c b/drivers/leds/rgb/leds-qcom-lpg.c
> index f3c9ef2bfa57..4e5c56ded1f0 100644
> --- a/drivers/leds/rgb/leds-qcom-lpg.c
> +++ b/drivers/leds/rgb/leds-qcom-lpg.c
> @@ -24,6 +24,7 @@
>  #define LPG_PATTERN_CONFIG_REG	0x40
>  #define LPG_SIZE_CLK_REG	0x41
>  #define  PWM_CLK_SELECT_MASK	GENMASK(1, 0)
> +#define  PWM_SIZE_SELECT_MASK	BIT(2)

Are you sure you want to shove this between 2 seemingly related defines?

>  #define  PWM_CLK_SELECT_HI_RES_MASK	GENMASK(2, 0)
>  #define  PWM_SIZE_HI_RES_MASK	GENMASK(6, 4)
>  #define LPG_PREDIV_CLK_REG	0x42
> @@ -412,8 +413,8 @@ static int lpg_lut_sync(struct lpg *lpg, unsigned int mask)
>  static const unsigned int lpg_clk_rates[] = {0, 1024, 32768, 19200000};
>  static const unsigned int lpg_clk_rates_hi_res[] = {0, 1024, 32768, 19200000, 76800000};
>  static const unsigned int lpg_pre_divs[] = {1, 3, 5, 6};
> -static const unsigned int lpg_pwm_resolution[] =  {9};
> -static const unsigned int lpg_pwm_resolution_hi_res[] =  {8, 9, 10, 11, 12, 13, 14, 15};
> +static const unsigned int lpg_pwm_resolution[] = {6, 9};
> +static const unsigned int lpg_pwm_resolution_hi_res[] = {8, 9, 10, 11, 12, 13, 14, 15};
>  
>  static int lpg_calc_freq(struct lpg_channel *chan, uint64_t period)
>  {
> @@ -436,12 +437,12 @@ static int lpg_calc_freq(struct lpg_channel *chan, uint64_t period)
>  	 * period = --------------------------
>  	 *                   refclk
>  	 *
> -	 * Resolution = 2^9 bits for PWM or
> +	 * Resolution = 2^{6 or 9} bits for PWM or
>  	 *              2^{8, 9, 10, 11, 12, 13, 14, 15} bits for high resolution PWM
>  	 * pre_div = {1, 3, 5, 6} and
>  	 * M = [0..7].
>  	 *
> -	 * This allows for periods between 27uS and 384s for PWM channels and periods between
> +	 * This allows for periods between 3uS and 384s for PWM channels and periods between
>  	 * 3uS and 24576s for high resolution PWMs.
>  	 * The PWM framework wants a period of equal or lower length than requested,
>  	 * reject anything below minimum period.
> @@ -558,7 +559,7 @@ static void lpg_apply_freq(struct lpg_channel *chan)
>  		val |= GENMASK(5, 4);
>  		break;
>  	case LPG_SUBTYPE_PWM:
> -		val |= BIT(2);
> +		val |= FIELD_PREP(PWM_SIZE_SELECT_MASK, chan->pwm_resolution_sel);
>  		break;
>  	case LPG_SUBTYPE_HI_RES_PWM:
>  		val |= FIELD_PREP(PWM_SIZE_HI_RES_MASK, chan->pwm_resolution_sel);
> @@ -1276,7 +1277,7 @@ static int lpg_pwm_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
>  		resolution = lpg_pwm_resolution_hi_res[FIELD_GET(PWM_SIZE_HI_RES_MASK, val)];
>  	} else {
>  		refclk = lpg_clk_rates[FIELD_GET(PWM_CLK_SELECT_MASK, val)];
> -		resolution = 9;
> +		resolution = lpg_pwm_resolution[FIELD_GET(PWM_SIZE_SELECT_MASK, val)];
>  	}
>  
>  	if (refclk) {
> -- 
> 2.34.1
> 
> 

-- 
Lee Jones [李琼斯]

