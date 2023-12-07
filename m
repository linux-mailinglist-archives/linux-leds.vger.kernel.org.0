Return-Path: <linux-leds+bounces-308-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D6B1F808E2E
	for <lists+linux-leds@lfdr.de>; Thu,  7 Dec 2023 18:05:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 133D01C208ED
	for <lists+linux-leds@lfdr.de>; Thu,  7 Dec 2023 17:05:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7640481C2;
	Thu,  7 Dec 2023 17:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P7sRUUna"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBE803D0D4
	for <linux-leds@vger.kernel.org>; Thu,  7 Dec 2023 17:05:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94898C433C7;
	Thu,  7 Dec 2023 17:05:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701968745;
	bh=9YvdLV1NDWS8J0/ImkhGuOVRA3mKdgMfsp8KyYdFGhI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=P7sRUUnagzllLZQH202htnHXX3Fi13RgW7A6CMOmOJVebfbEJnFZroWLB46TmxHWi
	 kGzkJKKdekeED7A9D8HcrubI87KZHy1TmCtnecwGrSxcklITSCJdp3sjwswr1G359z
	 k7RFrpHXvyNp5CnmunFmbdf7Z35oVSzcTdr4Fp/1YV7tH+FOZF3mkFeUYyyIO76IUu
	 GXOfdCro3qm5LBbi51aZfTzig1buQtuSz4aNb6+S9hsOAE0c3CJfGmovfkfARlAxia
	 1JFpZaAcZ8XjyBiuVfgmZz4wVBzxqtPZVg1LzR/edzg+N1TaXgJEMx3fOOvt729c9P
	 /Psp4UxtpT/cA==
Date: Thu, 7 Dec 2023 17:05:40 +0000
From: Lee Jones <lee@kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Thierry Reding <thierry.reding@gmail.com>, kernel@pengutronix.de,
	Pavel Machek <pavel@ucw.cz>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Anjelique Melendez <quic_amelende@quicinc.com>,
	Luca Weiss <luca@z3ntu.xyz>, Lu Hongfei <luhongfei@vivo.com>,
	Kees Cook <keescook@chromium.org>, linux-leds@vger.kernel.org
Subject: Re: [PATCH v4 005/115] leds: qcom-lpg: Introduce a wrapper for
 getting driver data from a pwm chip
Message-ID: <20231207170540.GD111411@google.com>
References: <cover.1701860672.git.u.kleine-koenig@pengutronix.de>
 <4785982785812615d15c7dd6d2755270bd8670b2.1701860672.git.u.kleine-koenig@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4785982785812615d15c7dd6d2755270bd8670b2.1701860672.git.u.kleine-koenig@pengutronix.de>

On Wed, 06 Dec 2023, Uwe Kleine-König wrote:

> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---
> Note this patch was already sent out individually, find it at
> https://lore.kernel.org/linux-leds/20231124215208.616551-3-u.kleine-koenig@pengutronix.de
> 
>  drivers/leds/rgb/leds-qcom-lpg.c | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)

Acked-by: Lee Jones <lee@kernel.org>

> diff --git a/drivers/leds/rgb/leds-qcom-lpg.c b/drivers/leds/rgb/leds-qcom-lpg.c
> index 54c90ee43ef8..156b73d1f4a2 100644
> --- a/drivers/leds/rgb/leds-qcom-lpg.c
> +++ b/drivers/leds/rgb/leds-qcom-lpg.c
> @@ -976,9 +976,14 @@ static int lpg_pattern_mc_clear(struct led_classdev *cdev)
>  	return lpg_pattern_clear(led);
>  }
>  
> +static inline struct lpg *lpg_pwm_from_chip(struct pwm_chip *chip)
> +{
> +	return container_of(chip, struct lpg, pwm);
> +}
> +
>  static int lpg_pwm_request(struct pwm_chip *chip, struct pwm_device *pwm)
>  {
> -	struct lpg *lpg = container_of(chip, struct lpg, pwm);
> +	struct lpg *lpg = lpg_pwm_from_chip(chip);
>  	struct lpg_channel *chan = &lpg->channels[pwm->hwpwm];
>  
>  	return chan->in_use ? -EBUSY : 0;
> @@ -994,7 +999,7 @@ static int lpg_pwm_request(struct pwm_chip *chip, struct pwm_device *pwm)
>  static int lpg_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
>  			 const struct pwm_state *state)
>  {
> -	struct lpg *lpg = container_of(chip, struct lpg, pwm);
> +	struct lpg *lpg = lpg_pwm_from_chip(chip);
>  	struct lpg_channel *chan = &lpg->channels[pwm->hwpwm];
>  	int ret = 0;
>  
> @@ -1025,7 +1030,7 @@ static int lpg_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
>  static int lpg_pwm_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
>  			     struct pwm_state *state)
>  {
> -	struct lpg *lpg = container_of(chip, struct lpg, pwm);
> +	struct lpg *lpg = lpg_pwm_from_chip(chip);
>  	struct lpg_channel *chan = &lpg->channels[pwm->hwpwm];
>  	unsigned int resolution;
>  	unsigned int pre_div;
> -- 
> 2.42.0
> 

-- 
Lee Jones [李琼斯]

