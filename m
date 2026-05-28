Return-Path: <linux-leds+bounces-8355-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IJIFIKZXGGoQjQgAu9opvQ
	(envelope-from <linux-leds+bounces-8355-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 28 May 2026 16:56:38 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 060E75F402B
	for <lists+linux-leds@lfdr.de>; Thu, 28 May 2026 16:56:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4A6EC31DE2DA
	for <lists+linux-leds@lfdr.de>; Thu, 28 May 2026 14:50:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 245283F44C8;
	Thu, 28 May 2026 14:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KY5/qWZ3"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B19B93F39CA;
	Thu, 28 May 2026 14:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779979815; cv=none; b=anirymSJ44fFlLqzybnq/aBNonnN6ft85CFnVIXnxBCsb2aDKJc4BqhOAtBM1NENqOzZpXKQguHi34iF0i9zeUXxvK0KkblpseqHkSgK9XPG+38FFHOWmoqFTGwSsJ2AublTOG0dRmRHTQztPDJtzHVtiizJP31coftpuFesLTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779979815; c=relaxed/simple;
	bh=PFp3sO8hb+Eu6vwodvP5eqxXPknEtjKp9agdsSZ5+CU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rrxJ0Y1YcwR02jbHyQywggj6LcI+0Y8VAMyII+DHBgbM2PyxBAThNBgQLuvXeeh3cukpxIT7vMh9htRP3789pGDDMtZGps0ugdVfvtNizY2uHPGLae15Rd3eYLcWt3urcTHY2pKgW+Yksmf82E9+Da6coFCMJUcAYNek98fRfFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KY5/qWZ3; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F33C21F000E9;
	Thu, 28 May 2026 14:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779979813;
	bh=NiItlBY7QOVrHd2Lg1eA5eBS6YeaFvRU04FpBU3GdhU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=KY5/qWZ3RyMqWExGi4AC93pZcwim6EYmS7SHr06t9dLMY/CHdNjrfybK2SZnhcZXV
	 d906jL0Nr9kL4/Wk6b4kuXVnGMplWdmCxmh1jTXTqh+z4HIFJ8V2N7Y15TCKn/7vE2
	 rh8ZqPUS8gimH7cjMIVSKEjnmdsWX/8mGkGr8Cojklc8q76Z4s3AP3dggqYxVrpGvb
	 CxwiiLm5Jc4doO1J/SF/aDRa8zX+OqCySS0FWbUALqNHLkJ/M+UcLkvOE9ynAX5uKA
	 X8pIic5YxjIuEhxX5jo74zQhPWKHVHZv8Jz3kTl6LPRGzqn6N5t3PlIcU82yywAHVP
	 WGW+W/GiDYD4g==
Date: Thu, 28 May 2026 15:50:01 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>, Jingoo
 Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, David Lechner <dlechner@baylibre.com>, Nuno
 =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Helge Deller <deller@gmx.de>, Johan Hovold <johan@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-fbdev@vger.kernel.org
Subject: Re: [PATCH v2 2/6] mfd: lm3533: Convert to use OF bindings
Message-ID: <20260528155001.2bcb7003@jic23-huawei>
In-Reply-To: <20260528135123.103745-3-clamor95@gmail.com>
References: <20260528135123.103745-1-clamor95@gmail.com>
	<20260528135123.103745-3-clamor95@gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8355-lists,linux-leds=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jic23@kernel.org,linux-leds@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,baylibre.com,analog.com,gmx.de,lists.freedesktop.org,vger.kernel.org];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 060E75F402B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, 28 May 2026 16:51:19 +0300
Svyatoslav Ryhel <clamor95@gmail.com> wrote:

> Since there are no users of this driver via platform data, remove the
> platform data support and switch to using Device Tree bindings.
> Additionally, optimize functions used only by platform data.


At least the IIO ones would have made much the same amount of sense for
dt, just that they weren't having in the first place. I'd prefer that
as a precursor patch to make the rest much more readable.

> 
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>

I only looked in detail at the iio bit. A few changes requested.

> ---
>  drivers/iio/light/lm3533-als.c      |  95 ++++------
>  drivers/leds/leds-lm3533.c          |  51 ++++--
>  drivers/mfd/lm3533-core.c           | 268 ++++++++++------------------
>  drivers/video/backlight/lm3533_bl.c |  52 ++++--
>  include/linux/mfd/lm3533.h          |  51 +-----
>  5 files changed, 212 insertions(+), 305 deletions(-)
> 
> diff --git a/drivers/iio/light/lm3533-als.c b/drivers/iio/light/lm3533-als.c
> index 99f0b903018c..cbd337b73bd9 100644
> --- a/drivers/iio/light/lm3533-als.c
> +++ b/drivers/iio/light/lm3533-als.c

> @@ -714,59 +720,33 @@ static const struct attribute_group lm3533_als_attribute_group = {
>  	.attrs = lm3533_als_attributes
>  };
>  
> -static int lm3533_als_set_input_mode(struct lm3533_als *als, bool pwm_mode)
> +static int lm3533_als_setup(struct lm3533_als *als)
>  {
> -	u8 mask = LM3533_ALS_INPUT_MODE_MASK;
> -	u8 val;
> +	struct device *dev = &als->pdev.dev;
>  	int ret;
>  
> -	if (pwm_mode)
> -		val = mask;	/* pwm input */
> -	else
> -		val = 0;	/* analog input */
> -
> -	ret = lm3533_update(als->lm3533, LM3533_REG_ALS_CONF, val, mask);
> -	if (ret) {
> -		dev_err(&als->pdev->dev, "failed to set input mode %d\n",
> -								pwm_mode);
> -		return ret;
> -	}
> -
> -	return 0;
> -}
> -
> -static int lm3533_als_set_resistor(struct lm3533_als *als, u8 val)
> -{
> -	int ret;
> -
> -	if (val < LM3533_ALS_RESISTOR_MIN || val > LM3533_ALS_RESISTOR_MAX) {
> -		dev_err(&als->pdev->dev, "invalid resistor value\n");
> -		return -EINVAL;
> -	}
> -
> -	ret = lm3533_write(als->lm3533, LM3533_REG_ALS_RESISTOR_SELECT, val);
> -	if (ret) {
> -		dev_err(&als->pdev->dev, "failed to set resistor\n");
> -		return ret;
> -	}
> +	device_property_read_u32(dev, "ti,resistor-value-ohm",
> +				 &als->r_select);
Does this have a default?  If so the pattern we've recently be setting on for IIO
is
	if (device_property_present(dev, "ti,resistor-value-ohm"))
		ret = device_property_read_u32();
		if (ret) //corrupt property in some fashion
			return ret;
	} else {
		//set default
	}
If there is no default then check it unconditionally.

>  
> -	return 0;
> -}
> +	als->r_select = clamp(als->r_select, LM3533_ALS_RESISTOR_MIN,
> +			      LM3533_ALS_RESISTOR_MAX);
> +	als->r_select = DIV_ROUND_UP(2 * MICRO, 10 * als->r_select);
>  
> -static int lm3533_als_setup(struct lm3533_als *als,
> -			    const struct lm3533_als_platform_data *pdata)
> -{
> -	int ret;
> +	als->pwm_mode = device_property_read_bool(dev, "ti,pwm-mode");
>  
> -	ret = lm3533_als_set_input_mode(als, pdata->pwm_mode);
> +	ret = lm3533_update(lm3533, LM3533_REG_ALS_CONF, als->pwm_mode ?
> +			    LM3533_ALS_INPUT_MODE_MASK : 0,

That's ugly.  Better as

	ret = lm3533_update(lm3533, LM3533_REG_ALS_CONF,
			    als->pwm_mode ? LM3533_ALS_INPUT_MODE_MASK : 0,

Though if there wasn't a layer hiding the regmap, it could just have been

	ret = regmap_assign_bits(lm3533->regmap, LM3533_REG_ALS_CONF,
				 LM3533_ALS_INPUT_MODE_MASK, als->pwm_mode);;

which would have been nicer.

I'm not particularly keen on the swashing of the helpers being in a patch
that is about switching the binding type as feels largely unrelated.
Should really have been a precursor, easier to review patch.


> +			    LM3533_ALS_INPUT_MODE_MASK);
>  	if (ret)
> -		return ret;
> +		return dev_err_probe(dev, ret, "failed to set input mode %d\n",
> +				     als->pwm_mode);
>  
>  	/* ALS input is always high impedance in PWM-mode. */
> -	if (!pdata->pwm_mode) {
> -		ret = lm3533_als_set_resistor(als, pdata->r_select);
> +	if (!als->pwm_mode) {
> +		ret = lm3533_write(lm3533, LM3533_REG_ALS_RESISTOR_SELECT,
> +				   (u8)als->r_select);

Same applies here. Mostly an unrelated change as the only thing switching that
is related to the patch is one parameter.

>  		if (ret)
> -			return ret;
> +			return dev_err_probe(dev, ret, "failed to set resistor\n");
>  	}
>  
>  	return 0;

> @@ -852,25 +825,28 @@ static int lm3533_als_probe(struct platform_device *pdev)
>  	indio_dev->channels = lm3533_als_channels;
>  	indio_dev->num_channels = ARRAY_SIZE(lm3533_als_channels);
>  	indio_dev->name = dev_name(&pdev->dev);
> -	iio_device_set_parent(indio_dev, pdev->dev.parent);

I'm not sure why this was there in the first place.  Hence not sure if it
is safe to remove.


> diff --git a/drivers/leds/leds-lm3533.c b/drivers/leds/leds-lm3533.c
> index 45795f2a1042..d707d43d5526 100644
> --- a/drivers/leds/leds-lm3533.c
> +++ b/drivers/leds/leds-lm3533.c

>  
>  	led->cb.dev = led->cdev.dev;
>  
> -	ret = lm3533_led_setup(led, pdata);
> +	device_property_read_u32(&pdev->dev, "led-max-microamp",
> +				 &led->max_current);

I'd prefer explicit setting of the default to be visible before this, or
the property_present pattern I mention in the IIO review above.

> +	led->max_current = clamp(led->max_current, LM3533_LED_MAX_CURRENT_MIN,
> +				 LM3533_LED_MAX_CURRENT_MAX);

I didn't look any further (busy day!)

