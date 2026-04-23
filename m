Return-Path: <linux-leds+bounces-7809-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EK4tFAf/6WkHrAIAu9opvQ
	(envelope-from <linux-leds+bounces-7809-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 23 Apr 2026 13:14:15 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9284A45125A
	for <lists+linux-leds@lfdr.de>; Thu, 23 Apr 2026 13:14:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 84B43300B121
	for <lists+linux-leds@lfdr.de>; Thu, 23 Apr 2026 11:12:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B32A3E63B4;
	Thu, 23 Apr 2026 11:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JvPh+v1G"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 204873D090B;
	Thu, 23 Apr 2026 11:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776942731; cv=none; b=dgUQZdWdsdBzrl+F7L7NRQ+cVKu9DAy+Sqgd2Mg2KXGTTZm39da2JnFOMNJD0uLCvLVOt5rGEZYeBJ4Y2R2OyZT6D1Sz9ki5+x1U0Hw/8MfHM3BGyJtVUbhT1WMa3ilek+2YlPLqoubDfuPQdnAevWPibfXT0uhClDVfN4Be4T0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776942731; c=relaxed/simple;
	bh=b7WXA1tfWDJB/VlmIr6bWQjx9CcPwSRNs330u+CY4jw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WNHGmdji7z4gIp9qijPVs2DuByD7VAMoeOrAGBu9F75phnjoSGaj/ihS4RaFXmX60uQH0+lBP1YGxaDx/d2VjoE4chcfKDbYN50zPaEJAvZqumtVz9eFNbyJp7dr5Yq+c8mBmtth66dTwTuSZ3vBnKVyU15DPXagBdFz603jO3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JvPh+v1G; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4058AC2BCB2;
	Thu, 23 Apr 2026 11:12:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776942730;
	bh=b7WXA1tfWDJB/VlmIr6bWQjx9CcPwSRNs330u+CY4jw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JvPh+v1G4yZoYywHwjmxR0GAzKniCMimJphEHj4Teih5rf4gfSacNpKOow9crx9Lr
	 aiDNEFKaxN2iceX9F8ksjVAMRY7dp0Oc+i4lvGlmYtcmBKWHlfuYTdcjiw3NKKd46h
	 zT4+R8vDtX3fRiI/t8HYbyJdie4rAnZ5vE6yuVAHyGDfPza6c6UkVria9C6ME4fjo8
	 qYROUJivM28aUGjv/xIDA/zc2z68PvXRrk3fdgzHIPCI1rHlg3G75gK2ABHrsn4UI7
	 jups9rV+t/ISdZ6HFsFCnH8DPn/tFjNtu/1ywEO1CGSR4xVm0qtl9BQyq5+Pswpe/9
	 4esvwTyCqnHqQ==
Date: Thu, 23 Apr 2026 12:12:04 +0100
From: Lee Jones <lee@kernel.org>
To: guptarud@gmail.com
Cc: Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH v4 2/3] leds: flash: rt8515: Support single-GPIO flash
 ICs with vin supply
Message-ID: <20260423111204.GA170138@google.com>
References: <20260331-expressatt_camera_flash-v4-0-f1e99f474513@gmail.com>
 <20260331-expressatt_camera_flash-v4-2-f1e99f474513@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260331-expressatt_camera_flash-v4-2-f1e99f474513@gmail.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7809-lists,linux-leds=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lee@kernel.org,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 9284A45125A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, 31 Mar 2026, Rudraksha Gupta via B4 Relay wrote:

> From: Rudraksha Gupta <guptarud@gmail.com>
> 
> Extend the RT8515 driver to support flash ICs that use only a single
> GPIO for both flash and torch modes (no separate ENT pin), with an
> optional vin regulator that gates power to the flash IC.
> 
> When vin-supply is provided, the driver enables the regulator before
> activating the LED and disables it when turning off.
> 
> Make ent-gpios optional and validate at probe time that exactly one of
> ent-gpios or vin-supply is provided. When ent-gpios is absent, the
> driver uses enf-gpios for both flash and torch brightness control.

Do you?  Where in probe() do you validate that?

> Assisted-by: Claude:claude-opus-4.6
> Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>
> ---
>  drivers/leds/flash/leds-rt8515.c | 100 ++++++++++++++++++++++++++++++++-------
>  1 file changed, 83 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/leds/flash/leds-rt8515.c b/drivers/leds/flash/leds-rt8515.c
> index f6b439674c03..c7f0bdf804a7 100644
> --- a/drivers/leds/flash/leds-rt8515.c
> +++ b/drivers/leds/flash/leds-rt8515.c
> @@ -63,16 +63,44 @@ static struct rt8515 *to_rt8515(struct led_classdev_flash *fled)
>  	return container_of(fled, struct rt8515, fled);
>  }
>  
> -static void rt8515_gpio_led_off(struct rt8515 *rt)
> +static int rt8515_gpio_led_off(struct rt8515 *rt)
>  {
> +	int ret;
> +
>  	gpiod_set_value(rt->enable_flash, 0);

'\n'

> -	gpiod_set_value(rt->enable_torch, 0);
> +	if (rt->enable_torch)
> +		gpiod_set_value(rt->enable_torch, 0);

The gpiolib framework safely ignores NULL descriptors. Should we drop the 'if'
check here for simplicity?

> +
> +	/* Disable regulator */
> +	ret = regulator_is_enabled(rt->reg);
> +	if (ret < 0)
> +		return ret;
> +	if (ret > 0)
> +		return regulator_disable(rt->reg);
> +
> +	return 0;
>  }
>  
> -static void rt8515_gpio_brightness_commit(struct gpio_desc *gpiod,
> -					  int brightness)
> +static int rt8515_gpio_brightness_commit(struct rt8515 *rt,
> +					 struct gpio_desc *gpiod,
> +					 int brightness)
>  {
>  	int i;
> +	int ret;
> +
> +	/*
> +	 * Reset the IC to start brightness from zero,
> +	 * then re-enable and pulse to the desired level.
> +	 */
> +	ret = rt8515_gpio_led_off(rt);
> +	if (ret)
> +		return ret;

'\n'

> +	/* IC needs time to reset its brightness counter */
> +	usleep_range(100, 200);

'\n'

> +	/* Enable regulator */
> +	ret = regulator_enable(rt->reg);
> +	if (ret)
> +		return ret;
>  
>  	/*
>  	 * Toggling a GPIO line with a small delay increases the
> @@ -84,6 +112,8 @@ static void rt8515_gpio_brightness_commit(struct gpio_desc *gpiod,
>  		gpiod_set_value(gpiod, 1);
>  		udelay(1);
>  	}
> +
> +	return 0;
>  }
>  
>  /* This is setting the torch light level */
> @@ -92,23 +122,39 @@ static int rt8515_led_brightness_set(struct led_classdev *led,
>  {
>  	struct led_classdev_flash *fled = lcdev_to_flcdev(led);
>  	struct rt8515 *rt = to_rt8515(fled);
> +	int ret = 0;
>  
>  	mutex_lock(&rt->lock);
>  
>  	if (brightness == LED_OFF) {
>  		/* Off */
> -		rt8515_gpio_led_off(rt);
> +		ret = rt8515_gpio_led_off(rt);
> +		if (ret)
> +			goto out;
>  	} else if (brightness < RT8515_TORCH_MAX) {
> -		/* Step it up to movie mode brightness using the flash pin */
> -		rt8515_gpio_brightness_commit(rt->enable_torch, brightness);
> +		/*
> +		 * Step it up to movie mode brightness.
> +		 * If there is no separate torch pin, use the flash pin
> +		 * for torch as well.
> +		 */
> +		ret = rt8515_gpio_brightness_commit(rt, rt->enable_torch ?
> +				rt->enable_torch : rt->enable_flash, brightness);

rt->enable_torch ?: rt->enable_flash

> +		if (ret)
> +			goto out;
>  	} else {
> -		/* Max torch brightness requested */
> -		gpiod_set_value(rt->enable_torch, 1);
> +		/*
> +		 * Max torch brightness requested.
> +		 * If there is no separate torch pin, use the flash pin
> +		 * for torch as well.
> +		 */
> +		gpiod_set_value(rt->enable_torch ? rt->enable_torch :
> +				rt->enable_flash, 1);

rt->enable_torch ?: rt->enable_flash

>  	}
>  
> +out:
>  	mutex_unlock(&rt->lock);
>  
> -	return 0;
> +	return ret;
>  }
>  
>  static int rt8515_led_flash_strobe_set(struct led_classdev_flash *fled,
> @@ -117,27 +163,33 @@ static int rt8515_led_flash_strobe_set(struct led_classdev_flash *fled,
>  	struct rt8515 *rt = to_rt8515(fled);
>  	struct led_flash_setting *timeout = &fled->timeout;
>  	int brightness = rt->flash_max_intensity;
> +	int ret = 0;
>  
>  	mutex_lock(&rt->lock);
>  
>  	if (state) {
>  		/* Enable LED flash mode and set brightness */
> -		rt8515_gpio_brightness_commit(rt->enable_flash, brightness);
> +		ret = rt8515_gpio_brightness_commit(rt, rt->enable_flash, brightness);
> +		if (ret)
> +			goto out;

'\n'

>  		/* Set timeout */
>  		mod_timer(&rt->powerdown_timer,
>  			  jiffies + usecs_to_jiffies(timeout->val));
>  	} else {
>  		timer_delete_sync(&rt->powerdown_timer);
>  		/* Turn the LED off */
> -		rt8515_gpio_led_off(rt);
> +		ret = rt8515_gpio_led_off(rt);
> +		if (ret)
> +			goto out;
>  	}
>  
>  	fled->led_cdev.brightness = LED_OFF;
>  	/* After this the torch LED will be disabled */
>  
> +out:
>  	mutex_unlock(&rt->lock);
>  
> -	return 0;
> +	return ret;
>  }
>  
>  static int rt8515_led_flash_strobe_get(struct led_classdev_flash *fled,
> @@ -166,9 +218,12 @@ static const struct led_flash_ops rt8515_flash_ops = {
>  static void rt8515_powerdown_timer(struct timer_list *t)
>  {
>  	struct rt8515 *rt = timer_container_of(rt, t, powerdown_timer);
> +	int ret;
>  
>  	/* Turn the LED off */
> -	rt8515_gpio_led_off(rt);
> +	ret = rt8515_gpio_led_off(rt);
> +	if (ret)
> +		dev_err(rt->dev, "failed to turn off LED (%d)\n", ret);
>  }

This timer callback runs in atomic context, but 'rt8515_gpio_led_off()' now
calls 'regulator_disable()', which might sleep.  Should we consider using a
delayed workqueue instead of a timer to avoid sleeping in an atomic context?

>  
>  static void rt8515_init_flash_timeout(struct rt8515 *rt)
> @@ -298,12 +353,18 @@ static int rt8515_probe(struct platform_device *pdev)
>  		return dev_err_probe(dev, PTR_ERR(rt->enable_flash),
>  				     "cannot get ENF (enable flash) GPIO\n");
>  
> -	/* ENT - Enable Torch line */
> -	rt->enable_torch = devm_gpiod_get(dev, "ent", GPIOD_OUT_LOW);
> +	/* ENT - Enable Torch line (optional for single-GPIO flash ICs) */
> +	rt->enable_torch = devm_gpiod_get_optional(dev, "ent", GPIOD_OUT_LOW);
>  	if (IS_ERR(rt->enable_torch))
>  		return dev_err_probe(dev, PTR_ERR(rt->enable_torch),
>  				     "cannot get ENT (enable torch) GPIO\n");
>  
> +	/* Optional VIN supply */

devm_regulator_get_optional()?

> +	rt->reg = devm_regulator_get(dev, "vin");
> +	if (IS_ERR(rt->reg))
> +		return dev_err_probe(dev, PTR_ERR(rt->reg),
> +				     "failed to get vin supply\n");
> +
>  	child = device_get_next_child_node(dev, NULL);
>  	if (!child) {
>  		dev_err(dev,
> @@ -333,7 +394,12 @@ static int rt8515_probe(struct platform_device *pdev)
>  
>  	fled->ops = &rt8515_flash_ops;
>  
> -	led->max_brightness = rt->torch_max_intensity;
> +	/*
> +	 * If there is no separate torch pin, use the flash max intensity
> +	 * as the max brightness instead.
> +	 */
> +	led->max_brightness = rt->enable_torch ?
> +		rt->torch_max_intensity : rt->flash_max_intensity;
>  	led->brightness_set_blocking = rt8515_led_brightness_set;
>  	led->flags |= LED_CORE_SUSPENDRESUME | LED_DEV_CAP_FLASH;
>  
> 
> -- 
> 2.53.0
> 
> 

-- 
Lee Jones [李琼斯]

