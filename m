Return-Path: <linux-leds+bounces-4129-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C0827A49E33
	for <lists+linux-leds@lfdr.de>; Fri, 28 Feb 2025 17:01:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 552FB3B0DAD
	for <lists+linux-leds@lfdr.de>; Fri, 28 Feb 2025 16:00:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96CB513213E;
	Fri, 28 Feb 2025 16:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DtLnVY4+"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B39B1EF37E;
	Fri, 28 Feb 2025 16:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740758447; cv=none; b=Wg4iOzI9OXOKJrD32EVh099poTDgZHXh39pJk+jQa0nh+bQDrL75yNk6+k/+JctZH456Sron5IDIUmsUML3eCThNfoR14YSAOY122S+T8ZSEVuFBtJ5Re56++TRuJX13NAlAA9zwGgdKCrwD40ujgVMQ3O1IDQc2XyO7YM9Cb9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740758447; c=relaxed/simple;
	bh=s8EVLeL9JkpXmrQAJgfJcM2yO6cO/2irxrxpAKm2B8A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pexp2OL/e7bQEuFGWa9UqdQywkhevxGPQKti9YWLq7KPEoFAo1AfBh7kYlOtkx7B8/Orl+pP/2R1m6wLsCFJp2Nbzm1gWXQrPy9dP+nr5QWdCSrwYB7wPP+axz3XOaALAv5PI5Bt8BlSZDfdEypVHo9JBJp3iS1xm2BGSGnx2x4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DtLnVY4+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5CBCC4CED6;
	Fri, 28 Feb 2025 16:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740758446;
	bh=s8EVLeL9JkpXmrQAJgfJcM2yO6cO/2irxrxpAKm2B8A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DtLnVY4+AFU9mbqdGDbYmSD81Nn9n6Y0WZWO4H3BP5UqoUDTed3cCG3z3fAw0G0GQ
	 KtCwUXaspFtL7w3cWTtVGvlfxODOvzCNfK3Lehuzy845TyJ8/2AEqCpGPJAjNXgxuJ
	 6B/NnLYFZ4tk50WBe3zEjwYcA2NRcrk/FpqcwIsgG6b+jhVTVBsZMSNcD37YqBsksx
	 7qU+gkSfrit1iagBMUMPAECewN9p/KRvA7yvX9Mrem1eeqkv1X0sGZnH7dGNiX7LxX
	 84OzimCOnXDOc4j53No9Nn1WzK8tSkjZ3qEkWodBEHc6mL6hAY+kaed6ecp3FHDKNE
	 UXOqwurON6AcA==
Date: Fri, 28 Feb 2025 10:00:43 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Anjelique Melendez <quic_amelende@quicinc.com>, Kamal Wadhwa <quic_kamalw@quicinc.com>, 
	Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>, Konrad Dybcio <konradybcio@kernel.org>, 
	Johan Hovold <johan@kernel.org>, Sebastian Reichel <sre@kernel.org>, Pavel Machek <pavel@ucw.cz>, 
	linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] leds: rgb: leds-qcom-lpg: Fix pwm resolution for Hi-Res
 PWMs
Message-ID: <gkqghs2xmmepk67oeey2zmgxmqbq7n5xn5577ai6n3kke6y7bv@sxshxrj42ny2>
References: <20250220-leds-qcom-lpg-fix-max-pwm-on-hi-res-v1-1-a161ec670ea5@linaro.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250220-leds-qcom-lpg-fix-max-pwm-on-hi-res-v1-1-a161ec670ea5@linaro.org>

On Thu, Feb 20, 2025 at 12:31:00PM +0200, Abel Vesa wrote:
> Currently, for the high resolution PWMs, the resolution, clock,
> pre-divider and exponent are being selected based on period. Basically,

Is this problem really limited to the high resolution channels?

> the implementation loops over each one of these and tries to find the
> closest (higher) period based on the following formula:
> 
>                           period * refclk
> prediv_exp = log2 -------------------------------------
>                     NSEC_PER_SEC * pre_div * resolution
> 
> Since the resolution is power of 2, the actual period resulting is
> usually higher than what the resolution allows. That's why the duty
> cycle requested needs to be capped to the maximum value allowed by the
> resolution (known as PWM size).
> 
> Here is an example of how this can happen:
> 
> For a requested period of 5000000, the best clock is 19.2MHz, the best
> prediv is 5, the best exponent is 6 and the best resolution is 256.
> 
> Then, the pwm value is determined based on requested period and duty
> cycle, best prediv, best exponent and best clock, using the following
> formula:
> 
>                             duty * refclk
> pwm_value = ----------------------------------------------
>                 NSEC_PER_SEC * prediv * (1 << prediv_exp)
> 
> So in this specific scenario:
> 
> (5000000 * 19200000) / (1000000000 * 5 * (1 << 64)) = 300
> 
> With a resolution of 8 bits, this pwm value obviously goes over.
> 
> Therefore, the max pwm value allowed needs to be 255.
> 
> If not, the PMIC internal logic will only value that is under the set PWM
> size, resulting in a wrapped around PWM value.
> 
> This has been observed on Lenovo Thinkpad T14s Gen6 (LCD panel version)
> which uses one of the PMK8550 to control the LCD backlight.
> 
> Fix the value of the PWM by capping to a max based on the chosen
> resolution (PWM size).
> 

I think you should be able to write this more succinct.

The important part of the problem description is that the requested
period will be rounded down to a possible hardware configuration, while
the duty cycle isn't. The calculated PWM_VALUE might therefor exceed the
calculated resolution, but the value is only capped to 15 bits for high
resolution channels.


Unless I'm misunderstanding Uwe's comment, this is how the API is
expected to work (although I was under the impression that we rounded
the period up, rather than down...)


Worth pointing out then is that, as there's a finite number of possible
periods that the hardware can operate at, you might want to tweak the
period given in the Devicetree to best facilitate the expected
brightness range.

And the same would go for my choice of NSEC_PER_MSEC for the non-PWM
code paths... I can't explain that choice...

> Cc: stable@vger.kernel.org    # 6.4

v6.4 is when b00d2ed37617 was introduced, so that's a given...

> Fixes: b00d2ed37617 ("leds: rgb: leds-qcom-lpg: Add support for high resolution PWM")
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
> Note: This fix is blocking backlight support on Lenovo Thinkpad T14s
> Gen6 (LCD version), for which I have patches ready to send once this
> patch is agreed on (review) and merged.
> ---
>  drivers/leds/rgb/leds-qcom-lpg.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/leds/rgb/leds-qcom-lpg.c b/drivers/leds/rgb/leds-qcom-lpg.c
> index f3c9ef2bfa572f9ee86c8b8aa37deb8231965490..146cd9b447787bf170310321e939022dfb176e9f 100644
> --- a/drivers/leds/rgb/leds-qcom-lpg.c
> +++ b/drivers/leds/rgb/leds-qcom-lpg.c
> @@ -529,7 +529,7 @@ static void lpg_calc_duty(struct lpg_channel *chan, uint64_t duty)
>  	unsigned int clk_rate;
>  
>  	if (chan->subtype == LPG_SUBTYPE_HI_RES_PWM) {
> -		max = LPG_RESOLUTION_15BIT - 1;
> +		max = BIT(lpg_pwm_resolution_hi_res[chan->pwm_resolution_sel]) - 1;

This looks correct!

Regards,
Bjorn

>  		clk_rate = lpg_clk_rates_hi_res[chan->clk_sel];
>  	} else {
>  		max = LPG_RESOLUTION_9BIT - 1;
> 
> ---
> base-commit: 50a0c754714aa3ea0b0e62f3765eb666a1579f24
> change-id: 20250220-leds-qcom-lpg-fix-max-pwm-on-hi-res-067e8782a79b
> 
> Best regards,
> -- 
> Abel Vesa <abel.vesa@linaro.org>
> 

