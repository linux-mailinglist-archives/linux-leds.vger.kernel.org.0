Return-Path: <linux-leds+bounces-1865-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DE412900C28
	for <lists+linux-leds@lfdr.de>; Fri,  7 Jun 2024 20:57:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DF2801C2184C
	for <lists+linux-leds@lfdr.de>; Fri,  7 Jun 2024 18:57:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5CE51482F9;
	Fri,  7 Jun 2024 18:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HpvV00kS"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78B1210A24;
	Fri,  7 Jun 2024 18:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717786611; cv=none; b=EXuoYGBQPKbCcxiAv4FGzcmQONcMfqI/jm76v2YZO4yuagNHDhsg1YR5FVUyyRtTBaYYxBafYn8bBs5HJ+S0fGuJThNLwuOQ0bcz8qELJJn54mO/CoD6ZoG7Riozk3pws5voj8qZo6bUToDIKSdQ0+qsXcLXvj+nZ5MB3+wTTrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717786611; c=relaxed/simple;
	bh=41IstQhdcJ/CO6qLA0Pt3uJNJsWcjN/+4QzXDnL5O5o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j/4iwNfS4UzHCCkhZtRxprGif8cA4oeAHH2Lj96PWZlbgeIUf8A82ym/xpIvRt0rgmPdgdcth2X3RV+IMAady9aM8/Pr2ULGSkJ32JC02YLnFBf9FlDcTbKv9SDF0ABiRO0kHcV3PPikO/JP0WS4vnFrkQxsumeizGCnoLQ5BtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HpvV00kS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36941C2BBFC;
	Fri,  7 Jun 2024 18:56:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717786611;
	bh=41IstQhdcJ/CO6qLA0Pt3uJNJsWcjN/+4QzXDnL5O5o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HpvV00kSl8s9vfARlmVxjxrgpaEHv60+3J6UWUibhgMNVrqp2C5sTpK45qL1nNkfz
	 Vys2ef5PLRuKw3YTU6SlJg9YGbkZjhRBfszBCoG797zVVV2bn6lHu8j6gksma1XqXJ
	 dDlwWXeIW7lumMaeQ+EmZDx9W3wSWPTmw861x0+UlP95BGXJYosJX+ak2XH3vsY0GX
	 t8HqM2YeCLUTjyKk9IxpD4+4kdPwsVdVYIxmhjF4msOqbscf7eGI16XkmPamrQnkon
	 Xh78tAkmv8KEc+JBVJYr9RlW2J/RKJd052x62m4h63LSNsT8J45t8j3EX3kbOKuRpo
	 rrOJ6RMEnSPxQ==
Date: Fri, 7 Jun 2024 13:56:48 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Anjelique Melendez <quic_amelende@quicinc.com>
Cc: pavel@ucw.cz, lee@kernel.org, robh@kernel.org, 
	u.kleine-koenig@pengutronix.de, marijn.suijten@somainline.org, kees@kernel.org, 
	morf3089@gmail.com, quic_gurus@quicinc.com, quic_subbaram@quicinc.com, 
	linux-arm-msm@vger.kernel.org, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] leds: rgb: leds-qcom-lpg: Fix line wrapping style
 issues
Message-ID: <mummt6hl5c4iih6dvc5qcg6uijkluareqmjbxcfyfyzvhadpcd@oswmwaecv5ic>
References: <20240607005250.4047135-1-quic_amelende@quicinc.com>
 <20240607005250.4047135-2-quic_amelende@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240607005250.4047135-2-quic_amelende@quicinc.com>

On Thu, Jun 06, 2024 at 05:52:52PM GMT, Anjelique Melendez wrote:
> Fix line wrapping style issues introduced in previous patches.

Bending the line length guidelines is okay when it results in easier to
read code. I find the existing code easier to read...

Regards,
Bjorn

> 
> Signed-off-by: Anjelique Melendez <quic_amelende@quicinc.com>
> ---
>  drivers/leds/rgb/leds-qcom-lpg.c | 19 +++++++++++++------
>  1 file changed, 13 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/leds/rgb/leds-qcom-lpg.c b/drivers/leds/rgb/leds-qcom-lpg.c
> index e74b2ceed1c2..7c35b3ba09a3 100644
> --- a/drivers/leds/rgb/leds-qcom-lpg.c
> +++ b/drivers/leds/rgb/leds-qcom-lpg.c
> @@ -620,6 +620,7 @@ static void lpg_sdam_apply_lut_control(struct lpg_channel *chan)
>  	u8 val = 0, conf = 0, lut_offset = 0;
>  	unsigned int hi_pause, lo_pause;
>  	struct lpg *lpg = chan->lpg;
> +	u16 addr;
>  
>  	if (!chan->ramp_enabled || chan->pattern_lo_idx == chan->pattern_hi_idx)
>  		return;
> @@ -640,17 +641,23 @@ static void lpg_sdam_apply_lut_control(struct lpg_channel *chan)
>  		lo_idx += lut_offset;
>  	}
>  
> -	nvmem_device_write(lpg_chan_sdam, SDAM_PBS_SCRATCH_LUT_COUNTER_OFFSET + chan->sdam_offset, 1, &val);
> -	nvmem_device_write(lpg_chan_sdam, SDAM_PATTERN_CONFIG_OFFSET + chan->sdam_offset, 1, &conf);
> -	nvmem_device_write(lpg_chan_sdam, SDAM_END_INDEX_OFFSET + chan->sdam_offset, 1, &hi_idx);
> -	nvmem_device_write(lpg_chan_sdam, SDAM_START_INDEX_OFFSET + chan->sdam_offset, 1, &lo_idx);
> +	addr = SDAM_PBS_SCRATCH_LUT_COUNTER_OFFSET + chan->sdam_offset;
> +	nvmem_device_write(lpg_chan_sdam, addr, 1, &val);
> +	addr = SDAM_PATTERN_CONFIG_OFFSET + chan->sdam_offset;
> +	nvmem_device_write(lpg_chan_sdam, addr, 1, &conf);
> +	addr = SDAM_END_INDEX_OFFSET + chan->sdam_offset;
> +	nvmem_device_write(lpg_chan_sdam, addr, 1, &hi_idx);
> +	addr = SDAM_START_INDEX_OFFSET + chan->sdam_offset;
> +	nvmem_device_write(lpg_chan_sdam, addr, 1, &lo_idx);
>  
>  	val = RAMP_STEP_DURATION(chan->ramp_tick_ms);
>  	nvmem_device_write(lpg_chan_sdam, SDAM_REG_RAMP_STEP_DURATION, 1, &val);
>  
>  	if (lpg->lut_sdam) {
> -		nvmem_device_write(lpg_chan_sdam, SDAM_PAUSE_HI_MULTIPLIER_OFFSET + chan->sdam_offset, 1, &hi_pause);
> -		nvmem_device_write(lpg_chan_sdam, SDAM_PAUSE_LO_MULTIPLIER_OFFSET + chan->sdam_offset, 1, &lo_pause);
> +		addr = SDAM_PAUSE_HI_MULTIPLIER_OFFSET + chan->sdam_offset;
> +		nvmem_device_write(lpg_chan_sdam, addr, 1, &hi_pause);
> +		addr = SDAM_PAUSE_LO_MULTIPLIER_OFFSET + chan->sdam_offset;
> +		nvmem_device_write(lpg_chan_sdam, addr, 1, &lo_pause);
>  	}
>  
>  }
> -- 
> 2.34.1
> 

