Return-Path: <linux-leds+bounces-4322-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F5E1A68763
	for <lists+linux-leds@lfdr.de>; Wed, 19 Mar 2025 10:03:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 85D25176354
	for <lists+linux-leds@lfdr.de>; Wed, 19 Mar 2025 09:03:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6298E24EF81;
	Wed, 19 Mar 2025 09:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KwJmJFcU"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37E4121148F;
	Wed, 19 Mar 2025 09:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742375013; cv=none; b=gcyG5/r+X/Cc0nsPDhZIar5aFyLvWEZ3xIdKuoQTVHM++CDgPy1Nojh8W2xfEznwIHIrOMmBz27KxQdFBCYdEVaOWOCsTgeTUBZZSZEwRR2rgnTCeyBix6VK+So3G4mlLGRtgfUT+E+Ji/Fg7Oo9CpplSlS1V5ooGgurVd6wiFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742375013; c=relaxed/simple;
	bh=dQvR/S4XJZhcHcr+6+KKDchP8WC8gk+tc5FAc2FfLNY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dcRldA4I6qUk/zJPQgkDVR4GVvMgKcgSf9ULfkPuTlMLIunC6QANdidcl5iWiP4eQ8W7owJp5xFHv8t08IDEVhzEDM30if0Ql4eKxphCbXheCHCSo/iAOIitqRaLH3HO/ao10cj2TAZCTEmBhE3kLYapxwZ2SrkzFwkPt9YChj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KwJmJFcU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B441CC4CEEA;
	Wed, 19 Mar 2025 09:03:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742375012;
	bh=dQvR/S4XJZhcHcr+6+KKDchP8WC8gk+tc5FAc2FfLNY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KwJmJFcUImIlu7qbjeyo+xFoMYOhTt+rUbew4vM0VtDOPJgSI71SkAYV6nUMXlOKF
	 uAYzAJSfpZTEfqGnRMZjKDIwuVlCrN6JHDNMwI3YRmtsPjVJVtOVRr59rhojtzOdkO
	 N407OMhXQJ/1NBI5IR8BV6WLxPuMK/2qvXKUDAg4CK0o2HWX5jBWgNX73/srcBpnPc
	 xib9OIpc8UQi6JEr+DQQy/xiu688kuk2AFBXdg7XqwBus/xYXR7+ZjFLX6+tLBYIrn
	 4ZyfnvmPl/q3lU4mG9MOCeTc4srbGmhJTs4RW/FFzn5ohyk9fEZeSJG9EZ6C8mj+HV
	 0O80dOohJyW0g==
Date: Wed, 19 Mar 2025 10:03:28 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Matthias Fend <matthias.fend@emfend.at>
Cc: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, bsp-development.geo@leica-geosystems.com
Subject: Re: [PATCH v2 2/2] leds: tps6131x: add support for Texas Instruments
 TPS6131X flash LED driver
Message-ID: <20250319-tall-ruddy-flamingo-a12fcc@krzk-bin>
References: <20250318-leds-tps6131x-v2-0-bc09c7a50b2e@emfend.at>
 <20250318-leds-tps6131x-v2-2-bc09c7a50b2e@emfend.at>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250318-leds-tps6131x-v2-2-bc09c7a50b2e@emfend.at>

On Tue, Mar 18, 2025 at 08:28:58AM +0100, Matthias Fend wrote:
> +
> +static int tps6131x_reset_chip(struct tps6131x *tps6131x)
> +{
> +	int ret;
> +
> +	if (IS_ERR_OR_NULL(tps6131x->reset_gpio)) {

No, only check for non-null, see comment in probe().

> +		ret = regmap_update_bits(tps6131x->regmap, TPS6131X_REG_0, TPS6131X_REG_0_RESET,
> +					 TPS6131X_REG_0_RESET);
> +		if (ret)
> +			return ret;
> +
> +		fsleep(100);
> +
> +		ret = regmap_update_bits(tps6131x->regmap, TPS6131X_REG_0, TPS6131X_REG_0_RESET, 0);
> +		if (ret)
> +			return ret;
> +	} else {
> +		gpiod_set_value_cansleep(tps6131x->reset_gpio, 1);
> +		fsleep(10);
> +		gpiod_set_value_cansleep(tps6131x->reset_gpio, 0);
> +		fsleep(100);
> +	}
> +
> +	return 0;
> +}
> +
> +static int tps6131x_init_chip(struct tps6131x *tps6131x)
> +{
> +	u32 reg4, reg5, reg6;
> +	int ret;
> +
> +	reg4 = tps6131x->valley_current_limit ? TPS6131X_REG_4_ILIM : 0;
> +	ret = regmap_write(tps6131x->regmap, TPS6131X_REG_4, reg4);
> +	if (ret)
> +		return ret;
> +
> +	reg5 = TPS6131X_REG_5_ENPSM | TPS6131X_REG_5_STSTRB1_DIR | TPS6131X_REG_5_GPIOTYPE;
> +	if (tps6131x->chan1_en)
> +		reg5 |= TPS6131X_REG_5_ENLED1;
> +
> +	if (tps6131x->chan2_en)
> +		reg5 |= TPS6131X_REG_5_ENLED2;
> +
> +	if (tps6131x->chan3_en)
> +		reg5 |= TPS6131X_REG_5_ENLED3;
> +	ret = regmap_write(tps6131x->regmap, TPS6131X_REG_5, reg5);
> +	if (ret)
> +		return ret;
> +
> +	reg6 = TPS6131X_REG_6_ENTS;
> +	ret = regmap_write(tps6131x->regmap, TPS6131X_REG_6, reg6);
> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}
> +
> +static int tps6131x_set_mode(struct tps6131x *tps6131x, enum tps6131x_mode mode, bool force)
> +{
> +	u8 val;
> +
> +	val = mode << TPS6131X_REG_1_MODE_SHIFT;
> +
> +	return regmap_update_bits_base(tps6131x->regmap, TPS6131X_REG_1, TPS6131X_REG_1_MODE, val,
> +				       NULL, false, force);
> +}
> +
> +static void tps6131x_torch_refresh_handler(struct work_struct *work)
> +{
> +	struct tps6131x *tps6131x = container_of(work, struct tps6131x, torch_refresh_work.work);
> +
> +	guard(mutex)(&tps6131x->lock);
> +
> +	tps6131x_set_mode(tps6131x, TPS6131X_MODE_TORCH, true);
> +
> +	schedule_delayed_work(&tps6131x->torch_refresh_work,
> +			      TPS6131X_TORCH_REFRESH_INTERVAL_JIFFIES);
> +}
> +
> +static int tps6131x_brightness_set(struct led_classdev *cdev, enum led_brightness brightness)
> +{
> +	struct led_classdev_flash *fled_cdev = lcdev_to_flcdev(cdev);
> +	struct tps6131x *tps6131x = fled_cdev_to_tps6131x(fled_cdev);
> +	u32 num_chans;
> +	u32 steps_chan13, steps_chan2;
> +	u32 steps_remaining;
> +	u8 reg0;
> +	int ret;
> +
> +	cancel_delayed_work_sync(&tps6131x->torch_refresh_work);
> +
> +	guard(mutex)(&tps6131x->lock);
> +
> +	/*
> +	 * The brightness parameter uses the number of current steps as the unit (not the current
> +	 * value itself). Since the reported step size can vary depending on the configuration,
> +	 * this value must be converted into actual register steps.
> +	 */
> +	steps_remaining = (brightness * tps6131x->step_torch_current_ma) / TPS6131X_TORCH_STEP_I_MA;
> +
> +	num_chans = tps6131x->chan1_en + tps6131x->chan2_en + tps6131x->chan3_en;
> +
> +	/*
> +	 * The currents are distributed as evenly as possible across the activated channels.
> +	 * Since channels 1 and 3 share the same register setting, they always use the same current
> +	 * value. Channel 2 supports higher currents and thus takes over the remaining additional
> +	 * portion that cannot be covered by the other channels.
> +	 */
> +	steps_chan13 = min_t(u32, steps_remaining / num_chans,
> +			     TPS6131X_TORCH_MAX_I_CHAN13_MA / TPS6131X_TORCH_STEP_I_MA);
> +	if (tps6131x->chan1_en)
> +		steps_remaining -= steps_chan13;
> +	if (tps6131x->chan3_en)
> +		steps_remaining -= steps_chan13;
> +
> +	steps_chan2 = min_t(u32, steps_remaining,
> +			    TPS6131X_TORCH_MAX_I_CHAN2_MA / TPS6131X_TORCH_STEP_I_MA);
> +
> +	reg0 = (steps_chan13 << TPS6131X_REG_0_DCLC13_SHIFT) |
> +	       (steps_chan2 << TPS6131X_REG_0_DCLC2_SHIFT);

Looks like guard should start here... or you are not synchronizing
hardware access but more.

> +	ret = regmap_update_bits(tps6131x->regmap, TPS6131X_REG_0,
> +				 TPS6131X_REG_0_DCLC13 | TPS6131X_REG_0_DCLC2, reg0);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = tps6131x_set_mode(tps6131x, brightness ? TPS6131X_MODE_TORCH : TPS6131X_MODE_SHUTDOWN,
> +				true);
> +	if (ret < 0)
> +		return ret;
> +
> +	/*
> +	 * In order to use both the flash and the video light functions purely via the I2C
> +	 * interface, STRB1 must be low. If STRB1 is low, then the video light watchdog timer
> +	 * is also active, which puts the device into the shutdown state after around 13 seconds.
> +	 * To prevent this, the mode must be refreshed within the watchdog timeout.
> +	 */
> +	if (brightness)
> +		schedule_delayed_work(&tps6131x->torch_refresh_work,
> +				      TPS6131X_TORCH_REFRESH_INTERVAL_JIFFIES);
> +
> +	return 0;
> +}
> +
> +static int tps6131x_strobe_set(struct led_classdev_flash *fled_cdev, bool state)
> +{
> +	struct tps6131x *tps6131x = fled_cdev_to_tps6131x(fled_cdev);
> +	int ret;
> +
> +	guard(mutex)(&tps6131x->lock);
> +
> +	ret = tps6131x_set_mode(tps6131x, state ? TPS6131X_MODE_FLASH : TPS6131X_MODE_SHUTDOWN,
> +				true);
> +	if (ret < 0)
> +		return ret;
> +
> +	if (state) {
> +		ret = regmap_update_bits_base(tps6131x->regmap, TPS6131X_REG_3, TPS6131X_REG_3_SFT,
> +					      TPS6131X_REG_3_SFT, NULL, false, true);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	ret = regmap_update_bits_base(tps6131x->regmap, TPS6131X_REG_3, TPS6131X_REG_3_SFT, 0, NULL,
> +				      false, true);
> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}
> +
> +static int tps6131x_flash_brightness_set(struct led_classdev_flash *fled_cdev, u32 brightness)
> +{
> +	struct tps6131x *tps6131x = fled_cdev_to_tps6131x(fled_cdev);
> +	u32 num_chans;
> +	u32 steps_chan13, steps_chan2;
> +	u32 steps_remaining;
> +	int ret;
> +
> +	guard(mutex)(&tps6131x->lock);
> +
> +	steps_remaining = brightness / TPS6131X_FLASH_STEP_I_MA;
> +	num_chans = tps6131x->chan1_en + tps6131x->chan2_en + tps6131x->chan3_en;
> +	steps_chan13 = min_t(u32, steps_remaining / num_chans,
> +			     TPS6131X_FLASH_MAX_I_CHAN13_MA / TPS6131X_FLASH_STEP_I_MA);
> +	if (tps6131x->chan1_en)
> +		steps_remaining -= steps_chan13;
> +	if (tps6131x->chan3_en)
> +		steps_remaining -= steps_chan13;
> +	steps_chan2 = min_t(u32, steps_remaining,
> +			    TPS6131X_FLASH_MAX_I_CHAN2_MA / TPS6131X_FLASH_STEP_I_MA);
> +

Same here

> +	ret = regmap_update_bits(tps6131x->regmap, TPS6131X_REG_2, TPS6131X_REG_2_FC13,
> +				 steps_chan13 << TPS6131X_REG_2_FC13_SHIFT);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = regmap_update_bits(tps6131x->regmap, TPS6131X_REG_1, TPS6131X_REG_1_FC2,
> +				 steps_chan2 << TPS6131X_REG_1_FC2_SHIFT);
> +	if (ret < 0)
> +		return ret;
> +
> +	fled_cdev->brightness.val = brightness;
> +
> +	return 0;
> +}
> +
> +static int tps6131x_flash_timeout_set(struct led_classdev_flash *fled_cdev, u32 timeout_us)
> +{
> +	const struct tps6131x_timer_config *timer_config;
> +	struct tps6131x *tps6131x = fled_cdev_to_tps6131x(fled_cdev);
> +	u8 reg3;
> +	int ret;
> +
> +	guard(mutex)(&tps6131x->lock);
> +
> +	timer_config = tps6131x_find_closest_timer_config(timeout_us);
> +
> +	reg3 = timer_config->val << TPS6131X_REG_3_STIM_SHIFT;
> +	if (timer_config->range)
> +		reg3 |= TPS6131X_REG_3_SELSTIM_TO;
> +
> +	ret = regmap_update_bits(tps6131x->regmap, TPS6131X_REG_3,
> +				 TPS6131X_REG_3_STIM | TPS6131X_REG_3_SELSTIM_TO, reg3);
> +	if (ret < 0)
> +		return ret;
> +
> +	fled_cdev->timeout.val = timer_config->time_us;
> +
> +	return 0;
> +}
> +
> +static int tps6131x_strobe_get(struct led_classdev_flash *fled_cdev, bool *state)
> +{
> +	struct tps6131x *tps6131x = fled_cdev_to_tps6131x(fled_cdev);
> +	unsigned int reg3;
> +	int ret;
> +
> +	guard(mutex)(&tps6131x->lock);
> +
> +	ret = regmap_read_bypassed(tps6131x->regmap, TPS6131X_REG_3, &reg3);
> +	if (ret)
> +		return ret;
> +
> +	*state = !!(reg3 & TPS6131X_REG_3_SFT);
> +
> +	return 0;
> +}
> +
> +static int tps6131x_flash_fault_get(struct led_classdev_flash *fled_cdev, u32 *fault)
> +{
> +	struct tps6131x *tps6131x = fled_cdev_to_tps6131x(fled_cdev);
> +	unsigned int reg3, reg4, reg6;
> +	int ret;
> +
> +	*fault = 0;
> +

Why no lock here?

> +	ret = regmap_read_bypassed(tps6131x->regmap, TPS6131X_REG_3, &reg3);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = regmap_read_bypassed(tps6131x->regmap, TPS6131X_REG_4, &reg4);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = regmap_read_bypassed(tps6131x->regmap, TPS6131X_REG_6, &reg6);
> +	if (ret < 0)
> +		return ret;
> +
> +	if (reg3 & TPS6131X_REG_3_HPFL)
> +		*fault |= LED_FAULT_SHORT_CIRCUIT;
> +
> +	if (reg3 & TPS6131X_REG_3_SELSTIM_TO)
> +		*fault |= LED_FAULT_TIMEOUT;
> +
> +	if (reg4 & TPS6131X_REG_4_HOTDIE_HI)
> +		*fault |= LED_FAULT_OVER_TEMPERATURE;
> +
> +	if (reg6 & (TPS6131X_REG_6_LEDHOT | TPS6131X_REG_6_LEDWARN))
> +		*fault |= LED_FAULT_LED_OVER_TEMPERATURE;
> +
> +	if (!(reg6 & TPS6131X_REG_6_LEDHDR))
> +		*fault |= LED_FAULT_UNDER_VOLTAGE;
> +
> +	if (reg6 & TPS6131X_REG_6_LEDHOT) {
> +		ret = regmap_update_bits_base(tps6131x->regmap, TPS6131X_REG_6,
> +					      TPS6131X_REG_6_LEDHOT, 0, NULL, false, true);

And this is not locked?

> +		if (ret < 0)
> +			return ret;
> +	}
> +

...

> +
> +static int tps6131x_flash_external_strobe_set(struct v4l2_flash *v4l2_flash, bool enable)
> +{
> +	struct led_classdev_flash *fled_cdev = v4l2_flash->fled_cdev;
> +	struct tps6131x *tps6131x = fled_cdev_to_tps6131x(fled_cdev);
> +
> +	guard(mutex)(&tps6131x->lock);
> +
> +	return tps6131x_set_mode(tps6131x, enable ? TPS6131X_MODE_FLASH : TPS6131X_MODE_SHUTDOWN,
> +				 false);
> +}
> +
> +static const struct v4l2_flash_ops tps6131x_v4l2_flash_ops = {
> +	.external_strobe_set = tps6131x_flash_external_strobe_set,
> +};
> +
> +static int tps6131x_v4l2_setup(struct tps6131x *tps6131x)
> +{
> +	struct v4l2_flash_config v4l2_cfg = { 0 };
> +	struct led_flash_setting *intensity = &v4l2_cfg.intensity;
> +
> +	if (!IS_BUILTIN(CONFIG_V4L2_FLASH_LED_CLASS))

Why builtin? That's a tristate, so I don't get why driver and v4l flash
cannot be modules. You wanted REACHABLE probably... but then it is
anyway discouraged practice leading to runtime debugging. So actually
you want CONFIG_V4L2_FLASH_LED_CLASS || !CONFIG_V4L2_FLASH_LED_CLASS
dependency.

See Kconfig description.

> +		return 0;
> +
> +	intensity->min = tps6131x->step_torch_current_ma;
> +	intensity->max = tps6131x->max_torch_current_ma;
> +	intensity->step = tps6131x->step_torch_current_ma;
> +	intensity->val = intensity->min;
> +
> +	strscpy(v4l2_cfg.dev_name, tps6131x->fled_cdev.led_cdev.dev->kobj.name,
> +		sizeof(v4l2_cfg.dev_name));
> +
> +	v4l2_cfg.has_external_strobe = true;
> +	v4l2_cfg.flash_faults = LED_FAULT_TIMEOUT | LED_FAULT_OVER_TEMPERATURE |
> +				LED_FAULT_SHORT_CIRCUIT | LED_FAULT_UNDER_VOLTAGE |
> +				LED_FAULT_LED_OVER_TEMPERATURE;
> +
> +	tps6131x->v4l2_flash = v4l2_flash_init(tps6131x->dev, tps6131x->led_node,
> +					       &tps6131x->fled_cdev, &tps6131x_v4l2_flash_ops,
> +					       &v4l2_cfg);
> +	if (IS_ERR(tps6131x->v4l2_flash)) {
> +		dev_err(tps6131x->dev, "Failed to initialize v4l2 flash LED\n");
> +		return PTR_ERR(tps6131x->v4l2_flash);
> +	}
> +
> +	return 0;
> +}
> +
> +static int tps6131x_probe(struct i2c_client *client)
> +{
> +	struct tps6131x *tps6131x;
> +	int ret;
> +
> +	tps6131x = devm_kzalloc(&client->dev, sizeof(*tps6131x), GFP_KERNEL);
> +	if (!tps6131x)
> +		return -ENOMEM;
> +
> +	tps6131x->dev = &client->dev;
> +	i2c_set_clientdata(client, tps6131x);
> +	mutex_init(&tps6131x->lock);
> +	INIT_DELAYED_WORK(&tps6131x->torch_refresh_work, tps6131x_torch_refresh_handler);
> +
> +	ret = tps6131x_parse_node(tps6131x);
> +	if (ret)
> +		return -ENODEV;
> +
> +	tps6131x->regmap = devm_regmap_init_i2c(client, &tps6131x_regmap);
> +	if (IS_ERR(tps6131x->regmap)) {
> +		ret = PTR_ERR(tps6131x->regmap);
> +		dev_err(&client->dev, "Failed to allocate register map\n");
> +		return ret;

Syntax is:

return dev_err_probe

> +	}
> +
> +	tps6131x->reset_gpio = devm_gpiod_get_optional(&client->dev, "reset", GPIOD_OUT_HIGH);

You should handle IS_ERR


Best regards,
Krzysztof


