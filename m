Return-Path: <linux-leds+bounces-6224-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ECE1C712EA
	for <lists+linux-leds@lfdr.de>; Wed, 19 Nov 2025 22:47:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 4D6E14E1503
	for <lists+linux-leds@lfdr.de>; Wed, 19 Nov 2025 21:47:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 497D7302759;
	Wed, 19 Nov 2025 21:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lTfGPOZP"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1693E244660;
	Wed, 19 Nov 2025 21:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763588846; cv=none; b=E5yxERbI/d8WSjY28r+MVI2GV9fyhBkIyK22GX55VzT4T7V19plloltIERuqTE8O6is3F4ZL3k7y5d/VEWK3Us+IG5CbLHdwAQt+m/mscwJeCSphTLsljm8Y2G6l+0gMz7euM4sVRXUrv2+YjoQ6PEHjBHtmbZsTYXqloPePThU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763588846; c=relaxed/simple;
	bh=1S87CsHDgrNyu7M/zDisuHV2BZcJE4D9EKxcIIqJvBA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e5OUHgvEYcEEweiCWT0RqZV8ifBhYX1RcxTkgXQfYUrXY+TCl0GEdHRgRF0i9i/3lnD0/BG6QOOuxv4mcdEH1/7cRim/jziS7lZVf64JxeUt8t0WTpwJrzMcczDFwZEuiYaa2qb7bb15EBNMtKfjVCSW9Ud60kEd1NUjXlm1YvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lTfGPOZP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B232BC4CEF5;
	Wed, 19 Nov 2025 21:47:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763588845;
	bh=1S87CsHDgrNyu7M/zDisuHV2BZcJE4D9EKxcIIqJvBA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lTfGPOZPlWNjHVhsjLdoMLPOGDNmw2IILNmbjgBc9ywj5LsP9HyD3jKMWq5hhy3nC
	 Dz1LhSd5xXd0xaBjw51xUWme64KPfsGtAAHFb+p2sFMPXE1K+WDc2naCyzBPhSuswe
	 fooI0hZB7muHGc4NM4Sm2LykOArVm148YSNSmUyFbJXabTZXgYx1xijenj9L6l/vuS
	 rDA7cawiZYceK8MhWEtyQNLrsnanH4HQFDZf9dhceRQbgJVXr66bFq+EwIKsYcsntS
	 qs2KlAHtjioDRwFjucySp/UEq5AD1Cg8EamPyMI9J+N+qCZlQ48uX5YI0kqAtI2AJY
	 cG1OC/5Z8MJYg==
Date: Wed, 19 Nov 2025 15:52:20 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: fenglin.wu@oss.qualcomm.com
Cc: kernel@oss.qualcomm.com, Lee Jones <lee@kernel.org>, 
	Pavel Machek <pavel@kernel.org>, Marijn Suijten <marijn.suijten@somainline.org>, 
	linux-arm-msm@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>, Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 2/2] leds: rgb: leds-qcom-lpg: Don't enable TRILED
 when configuring PWM
Message-ID: <aeborccfbf6hgu5m6ilfkdxjukmkvzp77j2n7lkehtpxhdjxgs@gkdelpxkapvw>
References: <20251119-lpg_triled_fix-v3-0-84b6dbdc774a@oss.qualcomm.com>
 <20251119-lpg_triled_fix-v3-2-84b6dbdc774a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251119-lpg_triled_fix-v3-2-84b6dbdc774a@oss.qualcomm.com>

On Wed, Nov 19, 2025 at 02:06:43PM +0800, Fenglin Wu via B4 Relay wrote:
> From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
> 
> The PWM signal from the LPG channel can be routed to PMIC GPIOs with
> proper GPIO configuration, and it is not necessary to enable the
> TRILED channel in that case. This also applies to the LPG channels
> that mapped to TRILED channels. Additionally, enabling the TRILED
> channel unnecessarily would cause a voltage increase in its power
> supply. Hence remove it.
> 

Reviewed-by: Bjorn Andersson <andersson@kernel.org>

> Fixes: 24e2d05d1b68 ("leds: Add driver for Qualcomm LPG")
> Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
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
> -- 
> 2.34.1
> 
> 

