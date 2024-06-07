Return-Path: <linux-leds+bounces-1862-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BE319002BF
	for <lists+linux-leds@lfdr.de>; Fri,  7 Jun 2024 13:55:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EBC3B2842E2
	for <lists+linux-leds@lfdr.de>; Fri,  7 Jun 2024 11:55:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 594C81847;
	Fri,  7 Jun 2024 11:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WR1CkN3d"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F4D215A4A2
	for <linux-leds@vger.kernel.org>; Fri,  7 Jun 2024 11:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717761322; cv=none; b=ElMzAVRdHMjzCVJKITfTtpXwp2Ot86nM0CcfjUBtkxUBwnDzw8d5PLE13a8V6K8lML/RDOupqMRS/S7DS5oucpuB6rZZzPyhpR0VeBT/zzD93rSeRL3W5IjnW3dRBQJ3RcRo2XOEliW+y6A2jnf4uCq9Q8AmS4HHPnNdU5aRYgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717761322; c=relaxed/simple;
	bh=WnMWdtBFTyx8UVC9VEwmi4gKVXZmsQitGSiHRvjEblQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CX5+FMpyZp2tYet/OvLxWdYXWFnRJzT3HZQW36ZNJwZOds+NfK0y6U3YdS1jXqlnYcBMSsSuSVJIMOonpChiVVtnEfUKZ1RdDQGtyFuxEMzoYFRBkHjB+WcYNRk/TBoelK3Cr/cfL4+M6XnCh4iJNX2pXRy4ujteBFnCp2CuaZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WR1CkN3d; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-52bd48cf36bso5440e87.3
        for <linux-leds@vger.kernel.org>; Fri, 07 Jun 2024 04:55:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717761319; x=1718366119; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rtyZHfNHLIEk1etQ5taXU35Apq3XiT3tieFHZcsuRNc=;
        b=WR1CkN3dQ9f9QKMF8eDG297MzzoS1XruPsezqIPuO3VFE91Nxxcne319IonTzl8C5P
         P8J+6zmsRwQd3jNTwjEPV8r0SY81kRuUwEofq+fSpV0YW6KjVhDIImqQwZvaqmAhDrw4
         APEmI3sdToLTUBjkd2cQsVzKAXag+beQ0MbgXOXRu32lOvFbGlDABVB/Cvh7I1hc4MPO
         UH7O0pIh3Fi8yCSHC4rRsBwf9rJ2UF2rHX4sHEYDQ4YdfpYfEuTbl34grvitRGfCEcul
         XO6rvJm/UrEUOzbkE3tckiIrFij3y5a0J1Z0AOE0lMi7jb1SXpvsvmWMYIfkKl9dG4P2
         7fXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717761319; x=1718366119;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rtyZHfNHLIEk1etQ5taXU35Apq3XiT3tieFHZcsuRNc=;
        b=XsAG754XqbiTF68GVilM150NlUN2jbuYZOcmSfJWEkBpnKqnoBjlY2Q8UToIveX1Rt
         jswUSkVmHUUnj91DueZrgr3I8mYAAq8G8hNzsCl2NIaD6RW6BAdl0oWLvh8MrmPBIHQA
         QI7MvAO3j1PBzo4Kuf5dmX5EZ157AkLiU6VlCiEn/vu3wA8xotEddEtiaJR/fxNJLwsr
         Li/7p7vAs+1GiH0MgG+elQg4Osw+4IsCLsSvNEKhF2Tq/v+PYv/UaYMI7Ut8wpUOzWU7
         WWAyK0ILRiJKbMEn59fEt4elVPGFDNCGzqJx8O/94k+RZqgD57CzNhlCk5qKXorQcVT3
         vtSg==
X-Forwarded-Encrypted: i=1; AJvYcCVt2DdUxZJyI6yT8kmscf3mIwOgQsmo65o4lkpWjfypch68Jv5PKciO4H0cIv2UroSYc8ErNGqJl5vT7O+4MifY6/qBjHLmazWgTg==
X-Gm-Message-State: AOJu0YwJXeTyUGMi+MepjqbFfT2miu6pZlahbXZkdt8ie9AWzuG8YJe1
	HqH4JwgJIsKr2UkXNCSRQKSNg/Zc9pVL/ThC/AabCkCLa+1v1aGUcwzYijUGMiU=
X-Google-Smtp-Source: AGHT+IFZryRxC0BhWiOquj5KZSfTn9zk4hCxFBMrnAoLuegJZAi4WsqPCpzpO29RHzmBaAP1zbsjYQ==
X-Received: by 2002:ac2:55a2:0:b0:52a:feb2:72ea with SMTP id 2adb3069b0e04-52bb9fcc344mr1550402e87.55.1717761318824;
        Fri, 07 Jun 2024 04:55:18 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52bb423d51dsm511157e87.199.2024.06.07.04.55.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jun 2024 04:55:18 -0700 (PDT)
Date: Fri, 7 Jun 2024 14:55:16 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Anjelique Melendez <quic_amelende@quicinc.com>
Cc: pavel@ucw.cz, lee@kernel.org, robh@kernel.org, andersson@kernel.org, 
	u.kleine-koenig@pengutronix.de, marijn.suijten@somainline.org, kees@kernel.org, 
	morf3089@gmail.com, quic_gurus@quicinc.com, quic_subbaram@quicinc.com, 
	linux-arm-msm@vger.kernel.org, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] leds: rgb: leds-qcom-lpg: Fix line wrapping style
 issues
Message-ID: <75npm63xd4pf2l3olin36xal4ctyh56vpjhy3xeegurez3gnp3@kt7tmgm3osyr>
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

On Thu, Jun 06, 2024 at 05:52:52PM -0700, Anjelique Melendez wrote:
> Fix line wrapping style issues introduced in previous patches.

I'd say this reduces readability of the patch.

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

-- 
With best wishes
Dmitry

