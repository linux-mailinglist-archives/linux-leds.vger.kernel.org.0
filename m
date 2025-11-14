Return-Path: <linux-leds+bounces-6129-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 788F6C5B586
	for <lists+linux-leds@lfdr.de>; Fri, 14 Nov 2025 05:54:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 659A74E284E
	for <lists+linux-leds@lfdr.de>; Fri, 14 Nov 2025 04:54:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B939827F010;
	Fri, 14 Nov 2025 04:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UM4ggq8C"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EABB25485A;
	Fri, 14 Nov 2025 04:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763096050; cv=none; b=bzDgqhhxZLdBHR4tMZnZeR9w9mFVCuReRdyOj6jEbJGKIZVPpycZC3TFFSSTtAss73KMMEmkhUSm9pccc2GrWsHIzUMDCXnGSUJDmkabhmVr4g76QswyyCUpgLmQMs/76ANsNcIGUwFtSQwSpnNreIW82sin93Dokt/e80261C0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763096050; c=relaxed/simple;
	bh=9MnT8dCDDGwhTWhLfZRsdsghFfGzJbTGtRtzAMfDthE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dsFoXC5ntqU+/C3mwaoUwplrvzbrSRdXyCC9aaGpYgOVc+tcP8uqdxOu9iQWTjgITGnRNCa9VegkLKQ392GF5CORt8FtZ6zbEaZwMhu3d0n2YE1TA5HdkM8qKPsjlCMbcnwg+3Iax9O5RmSoyRBIsrJFoBp9KekLx2UDJGYMsdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UM4ggq8C; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65638C4CEF5;
	Fri, 14 Nov 2025 04:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763096050;
	bh=9MnT8dCDDGwhTWhLfZRsdsghFfGzJbTGtRtzAMfDthE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UM4ggq8CzcBT/7Ryv4S6p8UJcWGwkYawt9Z3UOC6PKdpQaMy6gLNW1k+k4m5PJ6/m
	 +0ZEtN9mdCY8CYa2CJpYOHapbrJJvBPbgNrel6LvKaJJBRWJdU0/jthJWO7yu6RNHF
	 N70LeYcNCKdvKGp86rMWXbmtW4QWj6dzIlfu/RIvXuC3qpi7CchNVXiiijyOe3KR5r
	 aarO1jez+2hI4jjPIaBJmcZUU029dT8va8xJFxcMH3TcO7wJPwCTyDnCDXav96980t
	 oAnDcA3u0gUIIGTYTSo7L6JuH2Dcwd8oAB8uRIlRjcqMrhEglpBSMR2XNIHZX2WiuN
	 Um5j8hL4CqDLA==
Date: Thu, 13 Nov 2025 22:58:35 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: fenglin.wu@oss.qualcomm.com
Cc: kernel@oss.qualcomm.com, Lee Jones <lee@kernel.org>, 
	Pavel Machek <pavel@kernel.org>, Marijn Suijten <marijn.suijten@somainline.org>, 
	Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>, Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] leds: rgb: leds-qcom-lpg: Only enable TRILED when LPG is
 used by LED
Message-ID: <7jf4xvqmlymwkyrdp2ulpazfwmhdmfegzigewc5esk2sj323a5@72skiavskrqt>
References: <20251114-lpg_triled_fix-v1-1-9b239832c53c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251114-lpg_triled_fix-v1-1-9b239832c53c@oss.qualcomm.com>

On Fri, Nov 14, 2025 at 09:11:17AM +0800, Fenglin Wu via B4 Relay wrote:
> From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
> 
> Enabling the TRILED channel will cause a voltage increase on its power
> supply, which is unnecessary if the LPG channel is not being used to
> control an LED.
> 
> Fixes: 24e2d05d1b68 ("leds: Add driver for Qualcomm LPG")
> Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
> ---
>  drivers/leds/rgb/leds-qcom-lpg.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/leds/rgb/leds-qcom-lpg.c b/drivers/leds/rgb/leds-qcom-lpg.c
> index 4f2a178e3d265a2cc88e651d3e2ca6ae3dfac2e2..234059b4c0f49d0398030ae5f86967fc1905206d 100644
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
> @@ -1247,7 +1247,9 @@ static int lpg_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
>  
>  	lpg_apply(chan);
>  
> -	triled_set(lpg, chan->triled_mask, chan->enabled ? chan->triled_mask : 0);
> +	/* Only control TRILED if the LPG channel is used by TRILED */
> +	if (chan->in_use && chan->triled_mask)

How is this possible?

If chan->in_use, then the channel is exposed as a LED and
lpg_pwm_request() should have returned -EBUSY, so we should never reach
lpg_pwm_apply()?


Why do you check chan->triled_mask? I guess we will still read/write the
triled regiter, but don't make any changes if this is 0?

Or is this the actual issue that you're fixing, that we read/write the
registers when we shouldn't? If so this should be clarified in the
commit message.

Regards,
Bjorn

> +		triled_set(lpg, chan->triled_mask, chan->enabled ? chan->triled_mask : 0);
>  
>  out_unlock:
>  	mutex_unlock(&lpg->lock);
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

