Return-Path: <linux-leds+bounces-5177-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D1AABB16FC2
	for <lists+linux-leds@lfdr.de>; Thu, 31 Jul 2025 12:46:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4F26218C4E6F
	for <lists+linux-leds@lfdr.de>; Thu, 31 Jul 2025 10:46:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DA482BD5A3;
	Thu, 31 Jul 2025 10:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AgIG+/wt"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 215F129CB58;
	Thu, 31 Jul 2025 10:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753958788; cv=none; b=NfQhWCnFiF0uIM+LyYn0oB9nBb1kA67zMEEGeS38ms3XZkBL5qWovznUWwv8EJp8ngNvaDpBRpWH6pbpkg1VrktYl+Ry8PZQSzD+whKN5Iy6RJc4CCDLO9ZKIeQp5q/84QFGmKdBDToyXpIsCbBGdwPlsLCKskkIxY1rzBdsp4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753958788; c=relaxed/simple;
	bh=jNQBrIrKbVL885WtZ7hrK1I4ZMVbW9N7qN5ZeW4fifM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G7KXypK5xgE2sx9kGLRJGlITzQ6gYJvrreEKgKHwFjnfI+LXgn4m+AI8C7WNSD54skF3GIZ4ttGrxQhYxyEQ+MZdWlM1L6J57LEqhHLSB59cr96ZzkCT4f2fSrvdgCL/LxmuAYCWwyUDnfoJiKKbLJle4CzgttN8Be2BO1f8bRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AgIG+/wt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C5D5C4CEEF;
	Thu, 31 Jul 2025 10:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753958788;
	bh=jNQBrIrKbVL885WtZ7hrK1I4ZMVbW9N7qN5ZeW4fifM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AgIG+/wtRLJQtUmFapUiUzA3UxjKCPLZ1ia1TLPepyDvvnsWpB7xwCjENigoYlm4R
	 iYhsY1H119odK23ye7bQL3ePiqztysfNr/Q6jCFlFWpWsU6NCfU73HdwyRPKFgoTcP
	 Q9WMtIPWFGL7lGL+Ju/FfJF3Rkq5nQxrNlWyh2TMW7zWylGvzOwA2Hf6Hgs9qx9E/R
	 MwyAQ7NS/RY4kOIAAlIFtSDCZ8YuJJsOVrHfMMP4w+91SNCfgtqKU0KKZPdPkKKQQ/
	 AK9MM7slF5HIP4QPlUJ2QRIb/7aLpi7MlliEeY/CXmxzBNxNGJka5vgk+3Nydprgfx
	 SqdTZHlCkKVFA==
Date: Thu, 31 Jul 2025 11:46:23 +0100
From: Lee Jones <lee@kernel.org>
To: LI Qingwu <Qing-wu.Li@leica-geosystems.com.cn>
Cc: pavel@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V8 2/2] leds: pwm: Add optional GPIO enable pin support
Message-ID: <20250731104623.GD1049189@google.com>
References: <20250724080221.7562-1-Qing-wu.Li@leica-geosystems.com.cn>
 <20250724080221.7562-3-Qing-wu.Li@leica-geosystems.com.cn>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250724080221.7562-3-Qing-wu.Li@leica-geosystems.com.cn>

On Thu, 24 Jul 2025, LI Qingwu wrote:

> Add support for optional GPIO-based enable pin control to PWM LED driver.
> Some PWM LED driver chips like TPS92380 and LT3743 require a separate
> enable signal in addition to PWM control. Implement support for such
> GPIO control through the "enable-gpios" device tree property, activating
> the pin when LED brightness is non-zero and deactivating it when off.
> 
> Tested on i.MX8MP EVK with TPS92380 LED driver chip
> 
> Signed-off-by: LI Qingwu <Qing-wu.Li@leica-geosystems.com.cn>
> ---
>  drivers/leds/leds-pwm.c | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/drivers/leds/leds-pwm.c b/drivers/leds/leds-pwm.c
> index c73134e7b9514..08a1f735166ad 100644
> --- a/drivers/leds/leds-pwm.c
> +++ b/drivers/leds/leds-pwm.c
> @@ -17,6 +17,7 @@
>  #include <linux/err.h>
>  #include <linux/pwm.h>
>  #include <linux/slab.h>
> +#include <linux/gpio/consumer.h>

This list is alphabetical.

>  struct led_pwm {
>  	const char	*name;
> @@ -29,6 +30,7 @@ struct led_pwm_data {
>  	struct led_classdev	cdev;
>  	struct pwm_device	*pwm;
>  	struct pwm_state	pwmstate;
> +	struct gpio_desc	*enable_gpio;
>  	unsigned int		active_low;
>  };
>  
> @@ -51,6 +53,8 @@ static int led_pwm_set(struct led_classdev *led_cdev,
>  	if (led_dat->active_low)
>  		duty = led_dat->pwmstate.period - duty;
>  
> +	gpiod_set_value_cansleep(led_dat->enable_gpio, brightness == LED_OFF ? 0 : 1);

How about the more succinct:

  brightness ? 1 : 0

Or:

  !!brightness

> +
>  	led_dat->pwmstate.duty_cycle = duty;
>  	/*
>  	 * Disabling a PWM doesn't guarantee that it emits the inactive level.
> @@ -132,6 +136,22 @@ static int led_pwm_add(struct device *dev, struct led_pwm_priv *priv,
>  		break;
>  	}
>  
> +	/*
> +	 * Claim the GPIO as GPIOD_ASIS and set the value
> +	 * later on to honor the different default states
> +	 */
> +	led_data->enable_gpio = devm_fwnode_gpiod_get(dev, fwnode, "enable", GPIOD_ASIS, NULL);
> +

Remove this line.

> +	if (IS_ERR(led_data->enable_gpio)) {
> +		if (PTR_ERR(led_data->enable_gpio) == -ENOENT)
> +			/* Enable GPIO is optional */
> +			led_data->enable_gpio = NULL;
> +		else
> +			return PTR_ERR(led_data->enable_gpio);
> +	}
> +
> +	gpiod_direction_output(led_data->enable_gpio, !!led_data->cdev.brightness);
> +
>  	ret = devm_led_classdev_register_ext(dev, &led_data->cdev, &init_data);
>  	if (ret) {
>  		dev_err(dev, "failed to register PWM led for %s: %d\n",
> -- 
> 2.43.0
> 

-- 
Lee Jones [李琼斯]

