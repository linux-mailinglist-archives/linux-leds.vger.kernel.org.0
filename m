Return-Path: <linux-leds+bounces-4130-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A8381A49F46
	for <lists+linux-leds@lfdr.de>; Fri, 28 Feb 2025 17:49:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3E4773B3137
	for <lists+linux-leds@lfdr.de>; Fri, 28 Feb 2025 16:49:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B334192B7D;
	Fri, 28 Feb 2025 16:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N+bqpXVd"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E02CE13DDB9;
	Fri, 28 Feb 2025 16:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740761376; cv=none; b=FHIa8YsUR6LIo6WCCmwXs5NmCw1cYqc/RNITcKDOrA4O17uqTKmLmbHuC1Mcgv4nQcImNKMIwAkQAxdpGq5lE7tMqe1cT2YWr58nvzBp3YeTY/mjGKmirzKxICxqXv6kAzrb+gMFxn08Zgbi8IEPgFkcieHux1IbhNPTBA7PK2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740761376; c=relaxed/simple;
	bh=uXDHKUMafhl4hrnqLZc8P2H7ZD5Hipj2GCWZgjO0g6E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LH/5fxwNAOInTzg5Q6cDCX9eR7fX0uIfgFtP6rScH1L98dknV4VC59wphC8TxBaBk2GiuiIknZu44JFiVAKhNGzl4xqBeUyl+I8HVlsLXGzAWGkgkShkkoKgm8WNF4LEF2HUU9rfJc8w7GbN6B1Y/5jMJW88pn1mSfSzJFl/bbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N+bqpXVd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 579B4C4CEE5;
	Fri, 28 Feb 2025 16:49:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740761375;
	bh=uXDHKUMafhl4hrnqLZc8P2H7ZD5Hipj2GCWZgjO0g6E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N+bqpXVdo7EdTEMTpx9nRfaqhDO7Yir6KS2FXXKnm4kp7aC0C78rruHzpU9xyPXTO
	 PE/zsyLCGKInOk0UIguGYxG8gvAXXKbLcAsKbF699h70Zh28DTl9hgkDqMuOJvJO9X
	 c28hqeWyixrRkTqctkV23WyfLt/n2MJNzjX61k/CD3hmN3vVur01oI0WFddU8fHNRJ
	 5zR0Qa6zdofUQ1zWcHEo5SU98fKcjOL5bMVZ64xLIshydedy9O0w2ayBzfVbPADG6u
	 Qx/9f4PLnZiYkut+zJoMBMzeKjLrpd8bkuKTm5FxuJYku4vnIOA8s8QnnTyd637ger
	 N8NpwIZt5zKUA==
Date: Fri, 28 Feb 2025 10:49:32 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Anjelique Melendez <quic_amelende@quicinc.com>, Kamal Wadhwa <quic_kamalw@quicinc.com>, 
	Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>, Konrad Dybcio <konradybcio@kernel.org>, 
	Johan Hovold <johan@kernel.org>, Sebastian Reichel <sre@kernel.org>, Pavel Machek <pavel@ucw.cz>, 
	linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v2 1/2] leds: rgb: leds-qcom-lpg: Fix pwm resolution max
 for Hi-Res PWMs
Message-ID: <knuma4xplv6ipwnqgfvzu3bw5tgbq3qzfasaybjwd7kzpf5ipu@74gqmk5xcr6a>
References: <20250226-leds-qcom-lpg-fix-max-pwm-on-hi-res-v2-0-7af5ef5d220b@linaro.org>
 <20250226-leds-qcom-lpg-fix-max-pwm-on-hi-res-v2-1-7af5ef5d220b@linaro.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250226-leds-qcom-lpg-fix-max-pwm-on-hi-res-v2-1-7af5ef5d220b@linaro.org>

On Wed, Feb 26, 2025 at 03:58:54PM +0200, Abel Vesa wrote:
> Ideally, the requested duty cycle should never translate to a PWM
> value higher than the selected resolution (PWM size), but currently the
> best matched period is never reported back to the PWM consumer, so the
> consumer will still be using the requested period which is higher than
> the best matched one. This will result in PWM consumer requesting
> duty cycle values higher than the allowed PWM value.
> 
> Currently, the consumer driver known to fail this way is the PWM backlight
> (pwm_bl) and should be reworked in such a way that the best matched period
> is used instead.
> 

As you're rebasing the patch (per Anjelique's addition of 6-bit pwm) I
think you should omit this paragraph. Whether we like it or not, this
seems to be the way the PWM api is designed, and there's no need to
promise a redesign of the API in this bug fix.

> As for the current implementation of the duty cycle calculation, it is
> capping the max value, fix that by using the resolution to figure out the
> maximum allowed PWM value.
> 
> Cc: stable@vger.kernel.org    # 6.4
> Fixes: b00d2ed37617 ("leds: rgb: leds-qcom-lpg: Add support for high resolution PWM")
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>

Reviewed-by: Bjorn Andersson <andersson@kernel.org>

Regards,
Bjorn

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
>  		clk_rate = lpg_clk_rates_hi_res[chan->clk_sel];
>  	} else {
>  		max = LPG_RESOLUTION_9BIT - 1;
> 
> -- 
> 2.34.1
> 

