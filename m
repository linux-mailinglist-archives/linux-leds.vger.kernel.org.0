Return-Path: <linux-leds+bounces-5874-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F4D8C08F7A
	for <lists+linux-leds@lfdr.de>; Sat, 25 Oct 2025 13:38:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 495E74E1EBD
	for <lists+linux-leds@lfdr.de>; Sat, 25 Oct 2025 11:38:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3FAC2F6587;
	Sat, 25 Oct 2025 11:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MmRdkG2I"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78F342F069E;
	Sat, 25 Oct 2025 11:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761392288; cv=none; b=b5QqRkqa9VcpF30wbxaPNHbc7PBhE0pce6lO3NoS0bXCD1Z3uDroj2MvTNiGLeZ3DYTJwGxbJQ02FEOfYBj4KLTtxEyqyvUI6CA+ospeZxriPgDApyZOcdm/hUcQ54LDlVVNbT6+hSvohR1a8Sm9X+OVR/0PlyM6EQkDA/l0rlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761392288; c=relaxed/simple;
	bh=F8IahjDZGjj5AZc+2Q2JyqxSl+DYX48BIZmYr2S7bRU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XibBATc1fYPJnAIK6hvDMcUC5F8mrkxH57RaqUPSre8xzpZKe1KYm9tLnxpFFnL2R2WrorHYccU6TMF+DqT/zdmbKzKkhxbRLe1nRo+ZQUk73FLD4n5rvhKsCxjBFL86dYLx0ZUA5UuhmEglJlefuEZGBVLqHGi7PiTrT5mJ2Hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MmRdkG2I; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 879ACC4CEF5;
	Sat, 25 Oct 2025 11:38:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761392287;
	bh=F8IahjDZGjj5AZc+2Q2JyqxSl+DYX48BIZmYr2S7bRU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MmRdkG2I7D00nJ1TBpsXWkgMXskP5mljErDLxGc29wnnyzfe8B1RtVWwV6fBp1roL
	 PURB2rIqI4sjakcYeyjpqoeNpaGqqDo+Bwgt4SUzgaH15T8A2Js2cxOQORB8/x0DR2
	 EbgkOyhCwFjJpsY0fiF0ZddzWGsUdw6Bx1CL2S5I+zUm1VWd5CoLMWdjYvxAcKO2OD
	 kOT93BPQZyxwuZtbuZu1LEsoU97DkoxJHFNyGI3KO/4GXfBQXcaew6/Y8ark0VnzPq
	 Qw4h1C8YLimfzluRSUdYtPIHZV9HxksW47go5Bk6eIiKPqXqaSk3InaWj5oCSBGdOr
	 Yajz0py4lS78g==
Date: Sat, 25 Oct 2025 12:37:58 +0100
From: Lee Jones <lee@kernel.org>
To: Christian Hitz <christian@klarinett.li>
Cc: Pavel Machek <pavel@kernel.org>,
	Jacek Anaszewski <jacek.anaszewski@gmail.com>,
	Dan Murphy <dmurphy@ti.com>, Christian Hitz <christian.hitz@bbv.ch>,
	stable@vger.kernel.org, Pavel Machek <pavel@ucw.cz>,
	linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] leds: leds-lp50xx: enable chip before any communication
Message-ID: <20251025113758.GA29337@google.com>
References: <20251016145623.2863553-1-christian@klarinett.li>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251016145623.2863553-1-christian@klarinett.li>

On Thu, 16 Oct 2025, Christian Hitz wrote:

> From: Christian Hitz <christian.hitz@bbv.ch>
> 
> If a GPIO is used to control the chip's enable pin, it needs to be pulled
> high before any SPI communication is attempted.
> Split lp50xx_enable_disable() into two distinct functions to enforce
> correct ordering.
> Observe correct timing after manipulating the enable GPIO and SPI
> communication.

Is this currently broken?  How did it test okay before?

You need to explain more about why you are changing the semantics.

See below.

> Fixes: 242b81170fb8 ("leds: lp50xx: Add the LP50XX family of the RGB LED driver")
> 
> Signed-off-by: Christian Hitz <christian.hitz@bbv.ch>
> Cc: stable@vger.kernel.org
> ---
>  drivers/leds/leds-lp50xx.c | 51 +++++++++++++++++++++++++++-----------
>  1 file changed, 36 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/leds/leds-lp50xx.c b/drivers/leds/leds-lp50xx.c
> index d19b6a459151..f23e9ae434e4 100644
> --- a/drivers/leds/leds-lp50xx.c
> +++ b/drivers/leds/leds-lp50xx.c
> @@ -52,6 +52,8 @@
>  
>  #define LP50XX_SW_RESET		0xff
>  #define LP50XX_CHIP_EN		BIT(6)
> +#define LP50XX_START_TIME_US	500
> +#define LP50XX_RESET_TIME_US	3
>  
>  /* There are 3 LED outputs per bank */
>  #define LP50XX_LEDS_PER_MODULE	3
> @@ -374,19 +376,42 @@ static int lp50xx_reset(struct lp50xx *priv)
>  	return regmap_write(priv->regmap, priv->chip_info->reset_reg, LP50XX_SW_RESET);
>  }
>  
> -static int lp50xx_enable_disable(struct lp50xx *priv, int enable_disable)
> +static int lp50xx_enable(struct lp50xx *priv)
>  {
>  	int ret;
>  
> -	ret = gpiod_direction_output(priv->enable_gpio, enable_disable);
> +	if (priv->enable_gpio) {

Why have you added this check back in?

See: 5d2bfb3fb95b ("leds: lp50xx: Get rid of redundant check in lp50xx_enable_disable()")

> +		ret = gpiod_direction_output(priv->enable_gpio, 1);

Take the opportunity to define the magic numbers '0' and '1'.

> +		if (ret)
> +			return ret;
> +
> +		udelay(LP50XX_START_TIME_US);
> +	} else {

In this old code we did both.  Why are we now choosing?

> +		ret = lp50xx_reset(priv);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return regmap_write(priv->regmap, LP50XX_DEV_CFG0, LP50XX_CHIP_EN);
> +}
> +
> +static int lp50xx_disable(struct lp50xx *priv)
> +{
> +	int ret;
> +
> +	ret = regmap_write(priv->regmap, LP50XX_DEV_CFG0, 0);
>  	if (ret)
>  		return ret;
>  
> -	if (enable_disable)
> -		return regmap_write(priv->regmap, LP50XX_DEV_CFG0, LP50XX_CHIP_EN);
> -	else
> -		return regmap_write(priv->regmap, LP50XX_DEV_CFG0, 0);
> +	if (priv->enable_gpio) {
> +		ret = gpiod_direction_output(priv->enable_gpio, 0);
> +		if (ret)
> +			return ret;
> +
> +		udelay(LP50XX_RESET_TIME_US);
> +	}
>  
> +	return 0;
>  }
>  
>  static int lp50xx_probe_leds(struct fwnode_handle *child, struct lp50xx *priv,
> @@ -453,6 +478,10 @@ static int lp50xx_probe_dt(struct lp50xx *priv)
>  		return dev_err_probe(priv->dev, PTR_ERR(priv->enable_gpio),
>  				     "Failed to get enable GPIO\n");
>  
> +	ret = lp50xx_enable(priv);
> +	if (ret)
> +		return ret;
> +
>  	priv->regulator = devm_regulator_get(priv->dev, "vled");
>  	if (IS_ERR(priv->regulator))
>  		priv->regulator = NULL;
> @@ -550,14 +579,6 @@ static int lp50xx_probe(struct i2c_client *client)
>  		return ret;
>  	}
>  
> -	ret = lp50xx_reset(led);
> -	if (ret)
> -		return ret;
> -
> -	ret = lp50xx_enable_disable(led, 1);
> -	if (ret)
> -		return ret;
> -
>  	return lp50xx_probe_dt(led);
>  }
>  
> @@ -566,7 +587,7 @@ static void lp50xx_remove(struct i2c_client *client)
>  	struct lp50xx *led = i2c_get_clientdata(client);
>  	int ret;
>  
> -	ret = lp50xx_enable_disable(led, 0);
> +	ret = lp50xx_disable(led);
>  	if (ret)
>  		dev_err(led->dev, "Failed to disable chip\n");
>  
> -- 
> 2.51.0
> 

-- 
Lee Jones [李琼斯]

