Return-Path: <linux-leds+bounces-5029-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E231AFFE4B
	for <lists+linux-leds@lfdr.de>; Thu, 10 Jul 2025 11:37:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7E021480B1A
	for <lists+linux-leds@lfdr.de>; Thu, 10 Jul 2025 09:37:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19FAD2D0283;
	Thu, 10 Jul 2025 09:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l7M568p0"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E141820B80A;
	Thu, 10 Jul 2025 09:37:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752140252; cv=none; b=jlfoAclBM+06xcsT1kwh0dQ5LQlUOzcDw6+SOUJMefVQzfj/AK2wcrUHThXSD7yGfyZYn2/gTlHfYcz/bUCuAxFlbrePhPinrgJPsFkxBPK6UznueuuQk/JoonnTB2aXfhQvgA9pCmmE2ftEkD4gpp1ZzqkruLJr1U1WkGCtvuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752140252; c=relaxed/simple;
	bh=7JOq7FOv5bTpMZUieiLhS8U+rK+/XC/emjowf7BbJQs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YHTS3HMsxfS/8o1nnBnK5tvzDRAPBhH/xTR4RSByGbhrpcLujHseuqImStC1F75ZI96QSpoXxKoaJqQqpApH3P9we5x5UpD5XAgMVAd/QMSV4IV+TdzbP85t8x2O78KRzHmlGnyQtGA/mAmYV6wtHhfkW6Md/r9rBXJfR9yMUws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l7M568p0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBAFFC4CEE3;
	Thu, 10 Jul 2025 09:37:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752140251;
	bh=7JOq7FOv5bTpMZUieiLhS8U+rK+/XC/emjowf7BbJQs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=l7M568p0jgUK7gJCDH7RzHUjJGHy9Fbq15HebTAhQ3RZpyCUhW+2+G8kcJZ3J/qK4
	 vPDOGrJRfe0873OrgePF4AePyjk88yyR6Wl5OvZ9QvrhE+ksBYWQbDIQlcKCYTUVqA
	 qcW7DNqAwmLhdYn5lTehSjOdF6C0gW0bQvQ7u0BptIM36Bc4NWlpdcKmqd5R5TJPC3
	 6b4p/nfLtSo1KasZlGXDRrt0UqRBj0e9mZqdZvPO/sPmXt6AalS7zQkgkwLqpvJ3LX
	 mvkYEQYFPXuwIuecH6khI1bPfD+fm9Grk+G8T+gxS7hf3CUkmI9O1txBgLVac6noFw
	 WtnXHUzah+CPA==
Date: Thu, 10 Jul 2025 10:37:26 +0100
From: Lee Jones <lee@kernel.org>
To: LI Qingwu <Qing-wu.Li@leica-geosystems.com.cn>
Cc: pavel@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	bsp-development.geo@leica-geosystems.com
Subject: Re: [PATCH V3 2/2] leds: pwm: Add optional GPIO enable pin support
Message-ID: <20250710093726.GD1431498@google.com>
References: <20250703035256.225289-1-Qing-wu.Li@leica-geosystems.com.cn>
 <20250703035256.225289-2-Qing-wu.Li@leica-geosystems.com.cn>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250703035256.225289-2-Qing-wu.Li@leica-geosystems.com.cn>

On Thu, 03 Jul 2025, LI Qingwu wrote:

> add support for optional GPIO-based enable pin control to PWM LED driver.
> some PWM LED chips have a dedicated enable GPIO. This commit adds the
> support to specify such GPIO, activating the pin when LED brightness
> is non-zero and deactivating it when off.
> 
> Signed-off-by: LI Qingwu <Qing-wu.Li@leica-geosystems.com.cn>
> ---
>  drivers/leds/leds-pwm.c | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)

Couple of nits.

> diff --git a/drivers/leds/leds-pwm.c b/drivers/leds/leds-pwm.c
> index c73134e7b9514..1397149464b35 100644
> --- a/drivers/leds/leds-pwm.c
> +++ b/drivers/leds/leds-pwm.c
> @@ -17,6 +17,7 @@
>  #include <linux/err.h>
>  #include <linux/pwm.h>
>  #include <linux/slab.h>
> +#include <linux/gpio/consumer.h>
>  
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
> @@ -51,6 +53,9 @@ static int led_pwm_set(struct led_classdev *led_cdev,
>  	if (led_dat->active_low)
>  		duty = led_dat->pwmstate.period - duty;
>  
> +	gpiod_set_value_cansleep(led_dat->enable_gpio,
> +				 brightness == LED_OFF ? 0 : 1);

Put this on one line.

> +
>  	led_dat->pwmstate.duty_cycle = duty;
>  	/*
>  	 * Disabling a PWM doesn't guarantee that it emits the inactive level.
> @@ -132,6 +137,23 @@ static int led_pwm_add(struct device *dev, struct led_pwm_priv *priv,
>  		break;
>  	}
>  
> +	/* Claim the GPIO as ASIS and set the value

Explain what ASIS is please.

> +	 * later on to honor the different default states
> +	 */

Use proper multi-line comments please.

> +	led_data->enable_gpio =
> +		devm_fwnode_gpiod_get(dev, fwnode, "enable", GPIOD_ASIS, NULL);

One line please.

> +

Drop this line.

> +	/* enable_gpio is optional */

Comments start with a capital letter.

Place this comment inside the second if () statement.

> +	if (IS_ERR(led_data->enable_gpio)) {
> +		if (PTR_ERR(led_data->enable_gpio) == -ENOENT)
> +			led_data->enable_gpio = NULL;
> +		else
> +			return PTR_ERR(led_data->enable_gpio);
> +	}
> +
> +	gpiod_direction_output(led_data->enable_gpio,
> +			       !!led_data->cdev.brightness);

One line.

> +
>  	ret = devm_led_classdev_register_ext(dev, &led_data->cdev, &init_data);
>  	if (ret) {
>  		dev_err(dev, "failed to register PWM led for %s: %d\n",
> -- 
> 2.43.0
> 

-- 
Lee Jones [李琼斯]

