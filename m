Return-Path: <linux-leds+bounces-1913-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9269F9078CA
	for <lists+linux-leds@lfdr.de>; Thu, 13 Jun 2024 18:53:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E790CB21304
	for <lists+linux-leds@lfdr.de>; Thu, 13 Jun 2024 16:53:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D42113D63D;
	Thu, 13 Jun 2024 16:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L4MGqO1D"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E449C132124;
	Thu, 13 Jun 2024 16:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718297615; cv=none; b=QzgUI+OwUjs9ZmSurU7n8E5A+sdbctnKbgZXCsWM1vppd4k03irvMjtv5MfbGgPDN0euWmoP8+rWcI5HlpIdt/D+qp8Fm6SzPGHOsvnj0JcA5Hw1CPX+koZ7z+R0sc2sEEVoZDvh5XALQXQ2MYMFpkFzPJCnZDucIvAasTWOO8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718297615; c=relaxed/simple;
	bh=qsCzOIKZDVpVFgr7usAGnRf033LNJuB/tQRDt1YJFq4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qz0xtuEH28wWWLYi+DzjOanfiOkrsef48sEB45+sWdonniUXDZ5/HM9OTMsaeBZrdRwbQI7KCGRvHw7Di7VlQWyL2oB0pkVkaOKfEdNLSBuijCm9zCnsIWyOViml5EKavkVH1gRF5O0ySejetWr5Z26eG/dQcF5Lr7aUThNLZIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L4MGqO1D; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 015DCC2BBFC;
	Thu, 13 Jun 2024 16:53:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718297614;
	bh=qsCzOIKZDVpVFgr7usAGnRf033LNJuB/tQRDt1YJFq4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=L4MGqO1DaCRRdOKauIlSwN2J7OtN0VxnhjExMt7ciaqVHpmcjkG30ZOQMhh1+v78S
	 SgbjnDH13DRV8bT4ZCQCKO3HXPZ1Rc6P+LagK8ng5NQmGUwSCliBV6KJNW4RgPyGWX
	 v7BBnP5uFF2bKG5vk1F17k7a5r4NKD4rMLFkdr1lqaYZNkyNuydR2ia7uf+HzNH5uT
	 u8+tgMpqgBUIecMNA+n2MhF34L5Ieu6NNVt8W24LzDn7wujUpKI62Q2BNxkTIs98hP
	 hzx0c77SOzhHDEDj52IQsAYNSjNRHz/eOADCOoPi5/e1AefasnvWB6HxHab45IGWkX
	 yNiEy0bB2GQ1g==
Date: Thu, 13 Jun 2024 17:53:29 +0100
From: Lee Jones <lee@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Anjelique Melendez <quic_amelende@quicinc.com>, pavel@ucw.cz,
	robh@kernel.org, u.kleine-koenig@pengutronix.de,
	marijn.suijten@somainline.org, kees@kernel.org, morf3089@gmail.com,
	quic_gurus@quicinc.com, quic_subbaram@quicinc.com,
	linux-arm-msm@vger.kernel.org, linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] leds: rgb: leds-qcom-lpg: Fix line wrapping style
 issues
Message-ID: <20240613165329.GP2561462@google.com>
References: <20240607005250.4047135-1-quic_amelende@quicinc.com>
 <20240607005250.4047135-2-quic_amelende@quicinc.com>
 <mummt6hl5c4iih6dvc5qcg6uijkluareqmjbxcfyfyzvhadpcd@oswmwaecv5ic>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <mummt6hl5c4iih6dvc5qcg6uijkluareqmjbxcfyfyzvhadpcd@oswmwaecv5ic>

On Fri, 07 Jun 2024, Bjorn Andersson wrote:

> On Thu, Jun 06, 2024 at 05:52:52PM GMT, Anjelique Melendez wrote:
> > Fix line wrapping style issues introduced in previous patches.
> 
> Bending the line length guidelines is okay when it results in easier to
> read code. I find the existing code easier to read...

Agree.  This patch is not going to be accepted.

> > Signed-off-by: Anjelique Melendez <quic_amelende@quicinc.com>
> > ---
> >  drivers/leds/rgb/leds-qcom-lpg.c | 19 +++++++++++++------
> >  1 file changed, 13 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/leds/rgb/leds-qcom-lpg.c b/drivers/leds/rgb/leds-qcom-lpg.c
> > index e74b2ceed1c2..7c35b3ba09a3 100644
> > --- a/drivers/leds/rgb/leds-qcom-lpg.c
> > +++ b/drivers/leds/rgb/leds-qcom-lpg.c
> > @@ -620,6 +620,7 @@ static void lpg_sdam_apply_lut_control(struct lpg_channel *chan)
> >  	u8 val = 0, conf = 0, lut_offset = 0;
> >  	unsigned int hi_pause, lo_pause;
> >  	struct lpg *lpg = chan->lpg;
> > +	u16 addr;
> >  
> >  	if (!chan->ramp_enabled || chan->pattern_lo_idx == chan->pattern_hi_idx)
> >  		return;
> > @@ -640,17 +641,23 @@ static void lpg_sdam_apply_lut_control(struct lpg_channel *chan)
> >  		lo_idx += lut_offset;
> >  	}
> >  
> > -	nvmem_device_write(lpg_chan_sdam, SDAM_PBS_SCRATCH_LUT_COUNTER_OFFSET + chan->sdam_offset, 1, &val);
> > -	nvmem_device_write(lpg_chan_sdam, SDAM_PATTERN_CONFIG_OFFSET + chan->sdam_offset, 1, &conf);
> > -	nvmem_device_write(lpg_chan_sdam, SDAM_END_INDEX_OFFSET + chan->sdam_offset, 1, &hi_idx);
> > -	nvmem_device_write(lpg_chan_sdam, SDAM_START_INDEX_OFFSET + chan->sdam_offset, 1, &lo_idx);
> > +	addr = SDAM_PBS_SCRATCH_LUT_COUNTER_OFFSET + chan->sdam_offset;
> > +	nvmem_device_write(lpg_chan_sdam, addr, 1, &val);
> > +	addr = SDAM_PATTERN_CONFIG_OFFSET + chan->sdam_offset;
> > +	nvmem_device_write(lpg_chan_sdam, addr, 1, &conf);
> > +	addr = SDAM_END_INDEX_OFFSET + chan->sdam_offset;
> > +	nvmem_device_write(lpg_chan_sdam, addr, 1, &hi_idx);
> > +	addr = SDAM_START_INDEX_OFFSET + chan->sdam_offset;
> > +	nvmem_device_write(lpg_chan_sdam, addr, 1, &lo_idx);
> >  
> >  	val = RAMP_STEP_DURATION(chan->ramp_tick_ms);
> >  	nvmem_device_write(lpg_chan_sdam, SDAM_REG_RAMP_STEP_DURATION, 1, &val);
> >  
> >  	if (lpg->lut_sdam) {
> > -		nvmem_device_write(lpg_chan_sdam, SDAM_PAUSE_HI_MULTIPLIER_OFFSET + chan->sdam_offset, 1, &hi_pause);
> > -		nvmem_device_write(lpg_chan_sdam, SDAM_PAUSE_LO_MULTIPLIER_OFFSET + chan->sdam_offset, 1, &lo_pause);
> > +		addr = SDAM_PAUSE_HI_MULTIPLIER_OFFSET + chan->sdam_offset;
> > +		nvmem_device_write(lpg_chan_sdam, addr, 1, &hi_pause);
> > +		addr = SDAM_PAUSE_LO_MULTIPLIER_OFFSET + chan->sdam_offset;
> > +		nvmem_device_write(lpg_chan_sdam, addr, 1, &lo_pause);
> >  	}
> >  
> >  }
> > -- 
> > 2.34.1
> > 

-- 
Lee Jones [李琼斯]

