Return-Path: <linux-leds+bounces-6102-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BE76C58BC9
	for <lists+linux-leds@lfdr.de>; Thu, 13 Nov 2025 17:31:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C348D424FCA
	for <lists+linux-leds@lfdr.de>; Thu, 13 Nov 2025 15:58:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E710E2F6923;
	Thu, 13 Nov 2025 15:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Jb3daeNc"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8B9B2F5A2C;
	Thu, 13 Nov 2025 15:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763049228; cv=none; b=lJ1Qyh0DeCgDgLoD6SvNRRUtpOBGP4PdTIOFoz4OUftfjFoRbvGeaZsl9L56Iw6ozUrya5U+OxHd8wwrE2e907SEg3fPUXAwfJn2hlCnjRcmgHcFz+Xs5d7M4i2urUREzCVgpf5Hl6q9uRP1WnyTc2WvtqaRX5YLN7NPUS++sl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763049228; c=relaxed/simple;
	bh=JxJauLY+ba1iXG0VTsoMlwTwiTPASiGsh3bv8D8L0GM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CAGv2PjBCN2O14jGCmjGOFSqVjUCYqmo/Eh1fKg1tf+KADB3crOforZrPZK+xCCFqVfxzC/B8P+qxX04pmOAK03oGs5jkCg+QJBf/g1hKjXfaH5Gyg+/6c9Q1iAftX2F1EkqWeePEkt9VxSEc74USTd0JBU02syKakiQ+XSw5Zk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Jb3daeNc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9697EC113D0;
	Thu, 13 Nov 2025 15:53:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763049228;
	bh=JxJauLY+ba1iXG0VTsoMlwTwiTPASiGsh3bv8D8L0GM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Jb3daeNce383Za1kPNHvt+RSwKQvMS7xYs9ULFhOvWmR+JrMERX1c78Yyvk/KYpI6
	 Dw2EyNd8Smzxofsi2apmDVFnFs51OC0q4/s1iO3Z5++t0fOy7dcMbz8zNWLcvVNsb0
	 N4ckYgGLmEIiyuQelSqqP86SSwVUQxBM3rD8VkVTkvANTKHNB7gex7SjBPRO55lgtN
	 zwWul+SpUO9CEuMhpg0xWqheCgfPuecuX8lqiSNCaSx2qBzjYvBH1SK+SfC7f2gEYX
	 VqtnwcEi4Dn+CEEUl5h378BgoHCB7Q+dlL0w+aracZv5FNDVUHcv3q5tvKVsySPE1C
	 WeivcU6ZvEGJg==
Date: Thu, 13 Nov 2025 15:53:43 +0000
From: Lee Jones <lee@kernel.org>
To: LI Qingwu <Qing-wu.Li@leica-geosystems.com.cn>
Cc: pavel@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V9 2/3] leds: pwm: Add optional GPIO enable pin support
Message-ID: <20251113155343.GM1949330@google.com>
References: <20251105065012.88796-1-Qing-wu.Li@leica-geosystems.com.cn>
 <20251105065012.88796-3-Qing-wu.Li@leica-geosystems.com.cn>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251105065012.88796-3-Qing-wu.Li@leica-geosystems.com.cn>

On Wed, 05 Nov 2025, LI Qingwu wrote:

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
>  drivers/leds/leds-pwm.c | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/drivers/leds/leds-pwm.c b/drivers/leds/leds-pwm.c
> index c73134e7b951..aa9e14d912bf 100644
> --- a/drivers/leds/leds-pwm.c
> +++ b/drivers/leds/leds-pwm.c
> @@ -9,6 +9,7 @@
>   * based on leds-gpio.c by Raphael Assenat <raph@8d.com>
>   */
>  
> +#include <linux/gpio/consumer.h>
>  #include <linux/module.h>
>  #include <linux/kernel.h>
>  #include <linux/platform_device.h>
> @@ -26,6 +27,7 @@ struct led_pwm {
>  };
>  
>  struct led_pwm_data {
> +	struct gpio_desc	*enable_gpio;
>  	struct led_classdev	cdev;
>  	struct pwm_device	*pwm;
>  	struct pwm_state	pwmstate;
> @@ -51,6 +53,8 @@ static int led_pwm_set(struct led_classdev *led_cdev,
>  	if (led_dat->active_low)
>  		duty = led_dat->pwmstate.period - duty;
>  
> +	gpiod_set_value_cansleep(led_dat->enable_gpio,  !!brightness);

Nit: Too many spaces.

Didn't checkpatch.pl pick this up?

The rest of the set looks okay.

> +
>  	led_dat->pwmstate.duty_cycle = duty;
>  	/*
>  	 * Disabling a PWM doesn't guarantee that it emits the inactive level.
> @@ -132,6 +136,21 @@ static int led_pwm_add(struct device *dev, struct led_pwm_priv *priv,
>  		break;
>  	}
>  
> +	/*
> +	 * Claim the GPIO as GPIOD_ASIS and set the value
> +	 * later on to honor the different default states
> +	 */
> +	led_data->enable_gpio = devm_fwnode_gpiod_get(dev, fwnode, "enable", GPIOD_ASIS, NULL);
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

