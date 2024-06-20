Return-Path: <linux-leds+bounces-2040-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EFA0910064
	for <lists+linux-leds@lfdr.de>; Thu, 20 Jun 2024 11:31:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AEFC01F21BFA
	for <lists+linux-leds@lfdr.de>; Thu, 20 Jun 2024 09:31:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E1AD1A4F02;
	Thu, 20 Jun 2024 09:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ijYZEqCY"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 214901A3BC9;
	Thu, 20 Jun 2024 09:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718875879; cv=none; b=gwtg0M/A27GxESFMmyWKhLSmkpRVUdEFhPnMcEUPiW/JMO5lec51vq8xyqjBqNLuEO3OTJWFp0x3XBVVaq5dD3xLl7Xg4CsAHAyNO8wwbZ0P/1b+9IJ1pid6tVFb6MmfOj/KsP8IQO5Q9OyNGnWgQCThkxC4a7tOqrRxDZHMS2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718875879; c=relaxed/simple;
	bh=YRUQLSRlPc/Dg7XX4c9Tp2yq8qiVx+MeTvOp2+K5JMo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CvutXFAPtsg3N7Job0wCw3Mz8raIFw7p8py1rpvGOlQxpK6+/OoxRKm4zTcHrG3+KEeP9kxQ5tZC8z341peDAXRVzNgCZpMNJBanb2Ut2kanlZZyO3+Q1ArpBTzC6SzVjjHPCaL2b+ctv8wHkblpyC6p/tGx936hCkjrgVowwm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ijYZEqCY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00018C32781;
	Thu, 20 Jun 2024 09:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718875878;
	bh=YRUQLSRlPc/Dg7XX4c9Tp2yq8qiVx+MeTvOp2+K5JMo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ijYZEqCYi5NY/2WHH5YO3D6P8J6opMRX07jnPNWIWaFuc62t2AbVyEcsrR41LiCA3
	 9uP0iQmvdIJonfjarTxfcOQeJSMMwFAPbAdhunHJmhOo6VsO+ipt4ExoVV1ooXN9GO
	 99f6wh7UqGiU14QEIwFpvEry2bL1YxXyfUUqzaVuPuECv/hbZ6b62wIfH8xmWux73x
	 EwsvY7tEkK+4tfQ/Iw6wXM1ry4jjkNdQ+xsjbv6oSdULJrpdnUnvNZoLAESL+ds2vQ
	 ZfLjHPciAj3bY09fdeMZvUbRH7hOJsMeZX81n+YsJJByxYHPV2SvHYPpjgZrCo6dPX
	 qIVhucHgd/1Hg==
Date: Thu, 20 Jun 2024 10:31:14 +0100
From: Lee Jones <lee@kernel.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas@weissschuh.net>,
	Pavel Machek <pavel@ucw.cz>, Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>, linux-leds@vger.kernel.org,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] leds: cros_ec: Implement review comments from Lee
Message-ID: <20240620093114.GH3029315@google.com>
References: <20240614-cros_ec-led-review-v1-1-946f2549fac2@weissschuh.net>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240614-cros_ec-led-review-v1-1-946f2549fac2@weissschuh.net>

Definitely not seen a commit message like that before

> Implement review comments from Lee as requested in [0] for
> "leds: Add ChromeOS EC driver".
> 
> Changes:
> * Inline DRV_NAME string constant.
> * Use dev_err() instead of dev_warn() to report errors.
> * Rename cros_ec_led_probe_led() to cros_ec_led_probe_one().
> * Make loop variable "int" where they belong.
> * Move "Unknown LED" comment to where it belongs.
> * Register trigger during _probe().
> * Use module_platform_driver() and drop all the custom boilerplate.

If you're fixing many things, then I would expect to receive many
patches.  One patch for functional change please.  If you can reasonably
group fixes of similar elk, then please do.  However one patch that does
a bunch of different things is a no-go from me, sorry.

> [0] https://lore.kernel.org/lkml/20240614093445.GF3029315@google.com/T/#m8750abdef6a968ace765645189170814196c9ce9
> 
> Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
> ---
>  drivers/leds/leds-cros_ec.c | 50 +++++++++++++--------------------------------
>  1 file changed, 14 insertions(+), 36 deletions(-)
> 
> diff --git a/drivers/leds/leds-cros_ec.c b/drivers/leds/leds-cros_ec.c
> index 7bb21a587713..275522b81ea5 100644
> --- a/drivers/leds/leds-cros_ec.c
> +++ b/drivers/leds/leds-cros_ec.c
> @@ -14,8 +14,6 @@
>  #include <linux/platform_data/cros_ec_commands.h>
>  #include <linux/platform_data/cros_ec_proto.h>
>  
> -#define DRV_NAME	"cros-ec-led"
> -
>  static const char * const cros_ec_led_functions[] = {
>  	[EC_LED_ID_BATTERY_LED]            = LED_FUNCTION_CHARGING,
>  	[EC_LED_ID_POWER_LED]              = LED_FUNCTION_POWER,
> @@ -152,7 +150,7 @@ static int cros_ec_led_count_subleds(struct device *dev,
>  
>  		if (common_range != range) {
>  			/* The multicolor LED API expects a uniform max_brightness */
> -			dev_warn(dev, "Inconsistent LED brightness values\n");
> +			dev_err(dev, "Inconsistent LED brightness values\n");
>  			return -EINVAL;
>  		}
>  	}
> @@ -176,22 +174,21 @@ static const char *cros_ec_led_get_color_name(struct led_classdev_mc *led_mc_cde
>  	return led_get_color_name(color);
>  }
>  
> -static int cros_ec_led_probe_led(struct device *dev, struct cros_ec_device *cros_ec,
> +static int cros_ec_led_probe_one(struct device *dev, struct cros_ec_device *cros_ec,
>  				 enum ec_led_id id)
>  {
>  	union cros_ec_led_cmd_data arg = {};
>  	struct cros_ec_led_priv *priv;
>  	struct led_classdev *led_cdev;
>  	struct mc_subled *subleds;
> -	int ret, num_subleds;
> -	size_t i, subled;
> +	int i, ret, num_subleds;
> +	size_t subled;
>  
>  	arg.req.led_id = id;
>  	arg.req.flags = EC_LED_FLAGS_QUERY;
>  	ret = cros_ec_led_send_cmd(cros_ec, &arg);
> -	/* Unknown LED, skip */
>  	if (ret == -EINVAL)
> -		return 0;
> +		return 0; /* Unknown LED, skip */
>  	if (ret == -EOPNOTSUPP)
>  		return -ENODEV;
>  	if (ret < 0)
> @@ -247,11 +244,14 @@ static int cros_ec_led_probe(struct platform_device *pdev)
>  	struct device *dev = &pdev->dev;
>  	struct cros_ec_dev *ec_dev = dev_get_drvdata(dev->parent);
>  	struct cros_ec_device *cros_ec = ec_dev->ec_dev;
> -	int ret = 0;
> -	size_t i;
> +	int i, ret = 0;
> +
> +	ret = devm_led_trigger_register(dev, &cros_ec_led_trigger);
> +	if (ret)
> +		return ret;
>  
>  	for (i = 0; i < EC_LED_ID_COUNT; i++) {
> -		ret = cros_ec_led_probe_led(dev, cros_ec, i);
> +		ret = cros_ec_led_probe_one(dev, cros_ec, i);
>  		if (ret)
>  			break;
>  	}
> @@ -260,38 +260,16 @@ static int cros_ec_led_probe(struct platform_device *pdev)
>  }
>  
>  static const struct platform_device_id cros_ec_led_id[] = {
> -	{ DRV_NAME, 0 },
> +	{ "cros-ec-led", 0 },
>  	{}
>  };
>  
>  static struct platform_driver cros_ec_led_driver = {
> -	.driver.name	= DRV_NAME,
> +	.driver.name	= "cros-ec-led",
>  	.probe		= cros_ec_led_probe,
>  	.id_table	= cros_ec_led_id,
>  };
> -
> -static int __init cros_ec_led_init(void)
> -{
> -	int ret;
> -
> -	ret = led_trigger_register(&cros_ec_led_trigger);
> -	if (ret)
> -		return ret;
> -
> -	ret = platform_driver_register(&cros_ec_led_driver);
> -	if (ret)
> -		led_trigger_unregister(&cros_ec_led_trigger);
> -
> -	return ret;
> -};
> -module_init(cros_ec_led_init);
> -
> -static void __exit cros_ec_led_exit(void)
> -{
> -	platform_driver_unregister(&cros_ec_led_driver);
> -	led_trigger_unregister(&cros_ec_led_trigger);
> -};
> -module_exit(cros_ec_led_exit);
> +module_platform_driver(cros_ec_led_driver);
>  
>  MODULE_DEVICE_TABLE(platform, cros_ec_led_id);
>  MODULE_DESCRIPTION("ChromeOS EC LED Driver");
> 
> ---
> base-commit: b6774dd948171c478c7aa19318b1d7ae9cf6d7a4
> change-id: 20240614-cros_ec-led-review-ec93abc65933
> 
> Best regards,
> -- 
> Thomas Weißschuh <linux@weissschuh.net>
> 

-- 
Lee Jones [李琼斯]

