Return-Path: <linux-leds+bounces-309-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BB7E8808E30
	for <lists+linux-leds@lfdr.de>; Thu,  7 Dec 2023 18:06:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 65F2F1F20FC9
	for <lists+linux-leds@lfdr.de>; Thu,  7 Dec 2023 17:06:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81EB544C73;
	Thu,  7 Dec 2023 17:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N4/MFHsX"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 616BE3D0D4
	for <linux-leds@vger.kernel.org>; Thu,  7 Dec 2023 17:06:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5F00C433C8;
	Thu,  7 Dec 2023 17:06:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701968766;
	bh=hucgfGiqMzt5m8SuZ65JZS1zfQ5HLVCOnODaRbnG6gE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N4/MFHsXl6E+17ToTq+DQQqvO1e/cOPGu4Ma7EI2wtJvTb42AAr7rYOkkj1kgI7SZ
	 TrMYGzLD04BtpmpFmcbkAb3BEuIM7+JzRFmbBRnS0beh9eN7552eMiQwvGYX3VtKm9
	 5CMvCe8eOhbjBWayoTbnHpLvb/sc2SuGG/WQWKpKyCdxY6UUoYom0A1cqh0FE3lX1Y
	 EV73/QsFTfoN/kjdM3X10a/rKTle7qOTLAcXksKYojrfuBWdoAkec8lraNveIycCez
	 o6Q+OCSe2BnOMrdr2kz656ZzqvUaawJQgaMIk37mThRSu8QyxwBhquQHinD+vb6dpn
	 iVA2RDjjOnJ7g==
Date: Thu, 7 Dec 2023 17:06:02 +0000
From: Lee Jones <lee@kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Thierry Reding <thierry.reding@gmail.com>, kernel@pengutronix.de,
	Pavel Machek <pavel@ucw.cz>,
	Anjelique Melendez <quic_amelende@quicinc.com>,
	Lu Hongfei <luhongfei@vivo.com>, Rob Herring <robh@kernel.org>,
	Luca Weiss <luca@z3ntu.xyz>, linux-leds@vger.kernel.org
Subject: Re: [PATCH v4 004/115] leds: qcom-lpg: Consistenly use
 dev_err_probe() in .probe()'s error path
Message-ID: <20231207170602.GE111411@google.com>
References: <cover.1701860672.git.u.kleine-koenig@pengutronix.de>
 <1884e7d6928764ef230587d68ec79f04aa0e79a0.1701860672.git.u.kleine-koenig@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1884e7d6928764ef230587d68ec79f04aa0e79a0.1701860672.git.u.kleine-koenig@pengutronix.de>

On Wed, 06 Dec 2023, Uwe Kleine-König wrote:

> One error path already used dev_err_probe(). Adapt the other error paths
> that emit an error message to also use this function for consistency and
> slightly simplified code.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---
> Note this patch was already sent out individually, find it at
> https://lore.kernel.org/linux-pwm/20231130074133.969806-3-u.kleine-koenig@pengutronix.de
> 
>  drivers/leds/rgb/leds-qcom-lpg.c | 40 ++++++++++++++------------------
>  1 file changed, 17 insertions(+), 23 deletions(-)

Acked-by: Lee Jones <lee@kernel.org>

> diff --git a/drivers/leds/rgb/leds-qcom-lpg.c b/drivers/leds/rgb/leds-qcom-lpg.c
> index f5805fd0eb21..54c90ee43ef8 100644
> --- a/drivers/leds/rgb/leds-qcom-lpg.c
> +++ b/drivers/leds/rgb/leds-qcom-lpg.c
> @@ -552,9 +552,9 @@ static int lpg_parse_dtest(struct lpg *lpg)
>  		ret = count;
>  		goto err_malformed;
>  	} else if (count != lpg->data->num_channels * 2) {
> -		dev_err(lpg->dev, "qcom,dtest needs to be %d items\n",
> -			lpg->data->num_channels * 2);
> -		return -EINVAL;
> +		return dev_err_probe(lpg->dev, -EINVAL,
> +				     "qcom,dtest needs to be %d items\n",
> +				     lpg->data->num_channels * 2);
>  	}
>  
>  	for (i = 0; i < lpg->data->num_channels; i++) {
> @@ -574,8 +574,7 @@ static int lpg_parse_dtest(struct lpg *lpg)
>  	return 0;
>  
>  err_malformed:
> -	dev_err(lpg->dev, "malformed qcom,dtest\n");
> -	return ret;
> +	return dev_err_probe(lpg->dev, ret, "malformed qcom,dtest\n");
>  }
>  
>  static void lpg_apply_dtest(struct lpg_channel *chan)
> @@ -1097,7 +1096,7 @@ static int lpg_add_pwm(struct lpg *lpg)
>  
>  	ret = devm_pwmchip_add(lpg->dev, &lpg->pwm);
>  	if (ret)
> -		dev_err(lpg->dev, "failed to add PWM chip: ret %d\n", ret);
> +		dev_err_probe(lpg->dev, ret, "failed to add PWM chip\n");
>  
>  	return ret;
>  }
> @@ -1111,19 +1110,16 @@ static int lpg_parse_channel(struct lpg *lpg, struct device_node *np,
>  	int ret;
>  
>  	ret = of_property_read_u32(np, "reg", &reg);
> -	if (ret || !reg || reg > lpg->num_channels) {
> -		dev_err(lpg->dev, "invalid \"reg\" of %pOFn\n", np);
> -		return -EINVAL;
> -	}
> +	if (ret || !reg || reg > lpg->num_channels)
> +		return dev_err_probe(lpg->dev, -EINVAL, "invalid \"reg\" of %pOFn\n", np);
>  
>  	chan = &lpg->channels[reg - 1];
>  	chan->in_use = true;
>  
>  	ret = of_property_read_u32(np, "color", &color);
> -	if (ret < 0 && ret != -EINVAL) {
> -		dev_err(lpg->dev, "failed to parse \"color\" of %pOF\n", np);
> -		return ret;
> -	}
> +	if (ret < 0 && ret != -EINVAL)
> +		return dev_err_probe(lpg->dev, ret,
> +				     "failed to parse \"color\" of %pOF\n", np);
>  
>  	chan->color = color;
>  
> @@ -1146,10 +1142,9 @@ static int lpg_add_led(struct lpg *lpg, struct device_node *np)
>  	int i;
>  
>  	ret = of_property_read_u32(np, "color", &color);
> -	if (ret < 0 && ret != -EINVAL) {
> -		dev_err(lpg->dev, "failed to parse \"color\" of %pOF\n", np);
> -		return ret;
> -	}
> +	if (ret < 0 && ret != -EINVAL)
> +		return dev_err_probe(lpg->dev, ret,
> +			      "failed to parse \"color\" of %pOF\n", np);
>  
>  	if (color == LED_COLOR_ID_RGB)
>  		num_channels = of_get_available_child_count(np);
> @@ -1226,7 +1221,7 @@ static int lpg_add_led(struct lpg *lpg, struct device_node *np)
>  	else
>  		ret = devm_led_classdev_register_ext(lpg->dev, &led->cdev, &init_data);
>  	if (ret)
> -		dev_err(lpg->dev, "unable to register %s\n", cdev->name);
> +		dev_err_probe(lpg->dev, ret, "unable to register %s\n", cdev->name);
>  
>  	return ret;
>  }
> @@ -1272,10 +1267,9 @@ static int lpg_init_triled(struct lpg *lpg)
>  
>  	if (lpg->triled_has_src_sel) {
>  		ret = of_property_read_u32(np, "qcom,power-source", &lpg->triled_src);
> -		if (ret || lpg->triled_src == 2 || lpg->triled_src > 3) {
> -			dev_err(lpg->dev, "invalid power source\n");
> -			return -EINVAL;
> -		}
> +		if (ret || lpg->triled_src == 2 || lpg->triled_src > 3)
> +			return dev_err_probe(lpg->dev, -EINVAL,
> +					     "invalid power source\n");
>  	}
>  
>  	/* Disable automatic trickle charge LED */
> -- 
> 2.42.0
> 

-- 
Lee Jones [李琼斯]

