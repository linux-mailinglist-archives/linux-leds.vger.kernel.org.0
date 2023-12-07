Return-Path: <linux-leds+bounces-310-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AE066808E31
	for <lists+linux-leds@lfdr.de>; Thu,  7 Dec 2023 18:06:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4172D281650
	for <lists+linux-leds@lfdr.de>; Thu,  7 Dec 2023 17:06:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8D4044C73;
	Thu,  7 Dec 2023 17:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BqREO88r"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BDE43D0D4
	for <linux-leds@vger.kernel.org>; Thu,  7 Dec 2023 17:06:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2662C433C7;
	Thu,  7 Dec 2023 17:06:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701968787;
	bh=Nlgn6uS1NkQ+flBZHf8r4juaRDubmuNTO3MLX5ozEhc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BqREO88r1NjI9rtF+BZYHL3pACVZwXkz+m/h9sp5gYxF0/Cv5NR/HC2EaGRpiAgGX
	 KuEwvrwqZ5GEEZaV1gFTrwTADhMd23c7kQx5kXj/EDzD6uxGYispjBZJ1055Cg1PdU
	 Sa5zHcFD1Yjzt2AsuUg75h+rq44I0wY4fcKByf/Xqy6nXoS1wH9MW0+7j3oLeew2kv
	 +MVumsLRUpd3o/CIh1CnxzTt654LiJRaf7ar+1+Kj/pVUhCKlm3c7586wx2fY+S+HA
	 lCUga06hXbm3KxDtxiytVha41Ukd13bKCWhQhu5fjSvtaXkWQBCPU/IL3UOAzdw1At
	 9GGWKTKZ594lw==
Date: Thu, 7 Dec 2023 17:06:22 +0000
From: Lee Jones <lee@kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Thierry Reding <thierry.reding@gmail.com>, kernel@pengutronix.de,
	Pavel Machek <pavel@ucw.cz>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Anjelique Melendez <quic_amelende@quicinc.com>,
	Lu Hongfei <luhongfei@vivo.com>,
	Bjorn Andersson <quic_bjorande@quicinc.com>,
	Luca Weiss <luca@z3ntu.xyz>, linux-leds@vger.kernel.org
Subject: Re: [PATCH v4 003/115] leds: qcom-lpg: Use devm_pwmchip_add()
 simplifying driver removal
Message-ID: <20231207170622.GF111411@google.com>
References: <cover.1701860672.git.u.kleine-koenig@pengutronix.de>
 <631d24f0edaa7ac8ebeb22bb66260db8d8823aff.1701860672.git.u.kleine-koenig@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <631d24f0edaa7ac8ebeb22bb66260db8d8823aff.1701860672.git.u.kleine-koenig@pengutronix.de>

On Wed, 06 Dec 2023, Uwe Kleine-König wrote:

> With pwmchip_remove() being automatically called after switching to
> devm_pwmchip_add() the remove function can be dropped completely. Yay!
> With lpg_remove() gone there is no user of the platform device's drvdata
> left, so platform_set_drvdata() can be dropped from .probe(), too.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---
> Note this patch was already sent out individually, find it at
> https://lore.kernel.org/linux-leds/20231126095230.683204-2-u.kleine-koenig@pengutronix.de/
> 
>  drivers/leds/rgb/leds-qcom-lpg.c | 12 +-----------
>  1 file changed, 1 insertion(+), 11 deletions(-)

Acked-by: Lee Jones <lee@kernel.org>

> diff --git a/drivers/leds/rgb/leds-qcom-lpg.c b/drivers/leds/rgb/leds-qcom-lpg.c
> index 68d82a682bf6..f5805fd0eb21 100644
> --- a/drivers/leds/rgb/leds-qcom-lpg.c
> +++ b/drivers/leds/rgb/leds-qcom-lpg.c
> @@ -1095,7 +1095,7 @@ static int lpg_add_pwm(struct lpg *lpg)
>  	lpg->pwm.npwm = lpg->num_channels;
>  	lpg->pwm.ops = &lpg_pwm_ops;
>  
> -	ret = pwmchip_add(&lpg->pwm);
> +	ret = devm_pwmchip_add(lpg->dev, &lpg->pwm);
>  	if (ret)
>  		dev_err(lpg->dev, "failed to add PWM chip: ret %d\n", ret);
>  
> @@ -1324,8 +1324,6 @@ static int lpg_probe(struct platform_device *pdev)
>  	if (!lpg->data)
>  		return -EINVAL;
>  
> -	platform_set_drvdata(pdev, lpg);
> -
>  	lpg->dev = &pdev->dev;
>  	mutex_init(&lpg->lock);
>  
> @@ -1363,13 +1361,6 @@ static int lpg_probe(struct platform_device *pdev)
>  	return lpg_add_pwm(lpg);
>  }
>  
> -static void lpg_remove(struct platform_device *pdev)
> -{
> -	struct lpg *lpg = platform_get_drvdata(pdev);
> -
> -	pwmchip_remove(&lpg->pwm);
> -}
> -
>  static const struct lpg_data pm8916_pwm_data = {
>  	.num_channels = 1,
>  	.channels = (const struct lpg_channel_data[]) {
> @@ -1529,7 +1520,6 @@ MODULE_DEVICE_TABLE(of, lpg_of_table);
>  
>  static struct platform_driver lpg_driver = {
>  	.probe = lpg_probe,
> -	.remove_new = lpg_remove,
>  	.driver = {
>  		.name = "qcom-spmi-lpg",
>  		.of_match_table = lpg_of_table,
> -- 
> 2.42.0
> 

-- 
Lee Jones [李琼斯]

