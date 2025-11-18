Return-Path: <linux-leds+bounces-6185-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id F2DA9C6AA50
	for <lists+linux-leds@lfdr.de>; Tue, 18 Nov 2025 17:32:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 58316350805
	for <lists+linux-leds@lfdr.de>; Tue, 18 Nov 2025 16:24:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46AE5393DEE;
	Tue, 18 Nov 2025 16:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WYZUtCpS"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AE0C393DE9;
	Tue, 18 Nov 2025 16:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763482935; cv=none; b=MrPPt1ulIdENlGq4ZeX+MhZCal4T+Zm79M6iYg8dHoYeY6pNT+huUZ41Umqhc+xgLEW0TnPyboUhcoZPWYz5z9dnHN+6QUrNUWl5NRiS/oEkpAXYbkRpQ8tlguco8eH/JxRBj3dwLCZg/ig5uNnWNaboxPeB2OOCgaw9y1xlp7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763482935; c=relaxed/simple;
	bh=X6wNdCD2qWf31/WsJQ72Y8vG+j73axbeDCTHyLIrzD4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e+zjaEOSJxOeVNBjzRxoTUUm2rz2N8r8PrpwBCM1wMnRVDgX2ifxaD37PNfdzqNp/kvQrGb7pSheJzrgl8mp1Jx5LKBAebjEcZQnoVEWojiBUaVXxe6/Wuu6nPAoZQTpMOu/a4Ac2W4qK9gGuqpulATRE/U0FXgCq1+7FVcBK98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WYZUtCpS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 661E1C2BCC9;
	Tue, 18 Nov 2025 16:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763482934;
	bh=X6wNdCD2qWf31/WsJQ72Y8vG+j73axbeDCTHyLIrzD4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WYZUtCpScbpRExdQHyDBXR1YeDnFcIU3t4sCCskEr+xMSAZqv4+E6Sc6n7zsP7XEo
	 tJxlSfA5B2XJE0xvt1hIJ+ZuJG10/c5/G2Yv8pPhL2R+YnzFYp7NnnaxIFRAGo31TS
	 pha7H+0BSDjFtfc+ke5cef1MSHXBG6yih2Qo9MPC2KX5zoTxt1DTbsyHnRDPODvpj+
	 EzA6HVpM0r5dl1R9UKwetyI2ELV4Q1CoO+km7nMWI0wDoakH4iHgBQhYLo02XmQ8Tv
	 9Zm7tuz/QhBbQI5lWVvfQdWl4rEjYrR82ijoB71j2Q6lebr2R1zFgmOOO/xu5yay9S
	 kAQViPLMU+etg==
Date: Tue, 18 Nov 2025 10:27:02 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: fenglin.wu@oss.qualcomm.com
Cc: kernel@oss.qualcomm.com, Lee Jones <lee@kernel.org>, 
	Pavel Machek <pavel@kernel.org>, Marijn Suijten <marijn.suijten@somainline.org>, 
	linux-arm-msm@vger.kernel.org, 
	Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>, Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] leds: rgb: leds-qcom-lpg: Don't enable TRILED when
 configuring PWM
Message-ID: <7d46k5kmygmgjje3pc3jfebestkksbnq55q44urljkrmtrvwa7@6mxkt7zlmoid>
References: <20251118-lpg_triled_fix-v2-1-6d1e5831333f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251118-lpg_triled_fix-v2-1-6d1e5831333f@oss.qualcomm.com>

On Tue, Nov 18, 2025 at 10:48:03AM +0800, Fenglin Wu via B4 Relay wrote:
> From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
> 

Sorry, I didn't find the chance to answer your reply yesterday, and then
you sent v2, so I'll have to continue the discussion here.

> The PWM signal from the LPG channel can be routed to PMIC GPIOs with
> proper GPIO configuration, and it is not necessary to enable the
> TRILED channel in that case. This also applies to the LPG channels
> that mapped to TRILED channels. Additionally, enabling the TRILED
> channel unnecessarily would cause a voltage increase in its power
> supply. Hence remove it.
> 
> Fixes: 24e2d05d1b68 ("leds: Add driver for Qualcomm LPG")
> Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
> ---
> Changes in v2:
> - Check "chan->in_use" flag in lpg_pwm_apply() is not correct, as it
>   indicates the channel is being used as a LED and this PWM API would
>   never get called. Instead, remove the code line which enables TRILED
>   in lpg_pwm_apply() and update the commit text to explain it clearly.
> 

I understand that in your case you're routing the PWM signal to a GPIO,
and in that case the TRILED output should be kept disabled.

But what if I have my load connected to the TRILED and I describe my LPG
channel as a PWM channel? Is this an invalid use case? With this patch,
everything will look like it's working, except silently my signal won't
come out.

I presume there's no additional configuration on the LPG-side for your
use case. We just configure the GPIO to tap into the PWM-signal through
the pinmux settings?


Also, if for some reason the triled was enabled by bootloader, you will
now leave it enabled forever. This perhaps isn't a big issue though...


Perhaps none of this matters in practice, and we should just proceed
with your approach. If that's the case, then we should at least document
the behavior.

Regards,
Bjorn

> - Link to v1: https://lore.kernel.org/r/20251114-lpg_triled_fix-v1-1-9b239832c53c@oss.qualcomm.com
> ---
>  drivers/leds/rgb/leds-qcom-lpg.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/leds/rgb/leds-qcom-lpg.c b/drivers/leds/rgb/leds-qcom-lpg.c
> index 4f2a178e3d265a2cc88e651d3e2ca6ae3dfac2e2..e197f548cddb03d079c54c4a0f402402c5d047e2 100644
> --- a/drivers/leds/rgb/leds-qcom-lpg.c
> +++ b/drivers/leds/rgb/leds-qcom-lpg.c
> @@ -2,7 +2,7 @@
>  /*
>   * Copyright (c) 2017-2022 Linaro Ltd
>   * Copyright (c) 2010-2012, The Linux Foundation. All rights reserved.
> - * Copyright (c) 2023-2024, Qualcomm Innovation Center, Inc. All rights reserved.
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>   */
>  #include <linux/bits.h>
>  #include <linux/bitfield.h>
> @@ -1247,8 +1247,6 @@ static int lpg_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
>  
>  	lpg_apply(chan);
>  
> -	triled_set(lpg, chan->triled_mask, chan->enabled ? chan->triled_mask : 0);
> -
>  out_unlock:
>  	mutex_unlock(&lpg->lock);
>  
> 
> ---
> base-commit: ea1c4c7e648d1ca91577071fc42fdc219521098c
> change-id: 20251114-lpg_triled_fix-44491b49b340
> 
> Best regards,
> -- 
> Fenglin Wu <fenglin.wu@oss.qualcomm.com>
> 
> 

