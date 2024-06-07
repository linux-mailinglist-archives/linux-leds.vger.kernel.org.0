Return-Path: <linux-leds+bounces-1866-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 78E57900E4A
	for <lists+linux-leds@lfdr.de>; Sat,  8 Jun 2024 01:03:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2D7672837D5
	for <lists+linux-leds@lfdr.de>; Fri,  7 Jun 2024 23:03:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1614762D7;
	Fri,  7 Jun 2024 23:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SZYzWvP6"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7130F73473;
	Fri,  7 Jun 2024 23:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717801392; cv=none; b=Zpv9uaAuZqUJ+n4k8vZLwZ5INvOn+84tt8uRbXbSor9YT7rcc6+TKZjfOkrzxB8280kxN+SB6lwQ17Nqoc6BxgbgZnawR3VuIgcZ+kfc0soDvHQzQcLXJ22+RJ5wgr3rlyX6oJz+/nDGMmBtyh+qGDQIRTl3ubnU7uoV0MpcEt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717801392; c=relaxed/simple;
	bh=Tb0j3EBei+kALnLa+H4KZkSPMvY9CdcHeBoA3BM1ESU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VD26jYBQGmEU3x+lqKcL0hS7glJiNTncfCPiEbXnjhoC+T1gH7bspqRqpIg6DT7e5wST0cUSQpBdBKi2TAqcvuL3z7AHvA0CQbO6wRcW8ktXsg2LbpY2mb3wz3zPGYh+rJCZv3IawuZuUinzfqBQfAJTDjPcuPbsa/ioI2rHdbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SZYzWvP6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3BB5C4AF07;
	Fri,  7 Jun 2024 23:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717801392;
	bh=Tb0j3EBei+kALnLa+H4KZkSPMvY9CdcHeBoA3BM1ESU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SZYzWvP6XmivM98pvEdDsoqEXgz2mOjmHXr/2lntK8ylsw755ibSuK8/pUcJVZCQc
	 oIlWU16e9KqLx6qKtNBcSWqU0/1N1fWgl1Qn79a/BfYFZtMK9v9gblyxVQosjvsvSy
	 btGSCnaVSY3d+n76Nu0YIPRADVAYdtXBE4NF28Fdwh72lcAx40onlQW2izy8AYpZEu
	 yhGQPoNDfDT3ZB/IdwhNFgqg0kMR8gRUBgUsF8BnyCFo/ZFdOKl5yB/pMdIX+WBw2P
	 JTtmacdS71JDsQpRYErolLgYSa/GSpiXfVmtheGnELqHNrHRmBcTnwlTXUT0zoaLkA
	 ep2yVgbWcFMbw==
Date: Fri, 7 Jun 2024 18:03:08 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Anjelique Melendez <quic_amelende@quicinc.com>
Cc: pavel@ucw.cz, lee@kernel.org, robh@kernel.org, 
	u.kleine-koenig@pengutronix.de, marijn.suijten@somainline.org, kees@kernel.org, 
	morf3089@gmail.com, quic_gurus@quicinc.com, quic_subbaram@quicinc.com, 
	linux-arm-msm@vger.kernel.org, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] leds: rgb: leds-qcom-lpg: Add PPG check for
 setting/clearing PBS triggers
Message-ID: <jjkw3hcwxey6kjagkwmr6q2eg2vwpvbewh6ieg3qqhsmoro5dc@7sg7ppeqbn2u>
References: <20240607005250.4047135-1-quic_amelende@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240607005250.4047135-1-quic_amelende@quicinc.com>

On Thu, Jun 06, 2024 at 05:52:50PM GMT, Anjelique Melendez wrote:
> Currently, all LED LPG devices will call lpg_{set,clear}_pbs_trigger()
> when setting brightness regardless of if they support PPG and have PBS
> triggers. Check if device supports PPG before setting/clearing PBS
> triggers.
> 
> Fixes: 6ab1f766a80a ("leds: rgb: leds-qcom-lpg: Add support for PPG through single SDAM")
> Fixes: 5e9ff626861a ("leds: rgb: leds-qcom-lpg: Include support for PPG with dedicated LUT SDAM")
> Signed-off-by: Anjelique Melendez <quic_amelende@quicinc.com>

Looks to align with sdam code paths.

Reviewed-by: Bjorn Andersson <andersson@kernel.org>

Regards,
Bjorn

> ---
>  drivers/leds/rgb/leds-qcom-lpg.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/leds/rgb/leds-qcom-lpg.c b/drivers/leds/rgb/leds-qcom-lpg.c
> index 9467c796bd04..e74b2ceed1c2 100644
> --- a/drivers/leds/rgb/leds-qcom-lpg.c
> +++ b/drivers/leds/rgb/leds-qcom-lpg.c
> @@ -2,7 +2,7 @@
>  /*
>   * Copyright (c) 2017-2022 Linaro Ltd
>   * Copyright (c) 2010-2012, The Linux Foundation. All rights reserved.
> - * Copyright (c) 2023, Qualcomm Innovation Center, Inc. All rights reserved.
> + * Copyright (c) 2023-2024, Qualcomm Innovation Center, Inc. All rights reserved.
>   */
>  #include <linux/bits.h>
>  #include <linux/bitfield.h>
> @@ -254,6 +254,9 @@ static int lpg_clear_pbs_trigger(struct lpg *lpg, unsigned int lut_mask)
>  	u8 val = 0;
>  	int rc;
>  
> +	if (!lpg->lpg_chan_sdam)
> +		return 0;
> +
>  	lpg->pbs_en_bitmap &= (~lut_mask);
>  	if (!lpg->pbs_en_bitmap) {
>  		rc = nvmem_device_write(lpg->lpg_chan_sdam, SDAM_REG_PBS_SEQ_EN, 1, &val);
> @@ -276,6 +279,9 @@ static int lpg_set_pbs_trigger(struct lpg *lpg, unsigned int lut_mask)
>  	u8 val = PBS_SW_TRIG_BIT;
>  	int rc;
>  
> +	if (!lpg->lpg_chan_sdam)
> +		return 0;
> +
>  	if (!lpg->pbs_en_bitmap) {
>  		rc = nvmem_device_write(lpg->lpg_chan_sdam, SDAM_REG_PBS_SEQ_EN, 1, &val);
>  		if (rc < 0)
> -- 
> 2.34.1
> 

