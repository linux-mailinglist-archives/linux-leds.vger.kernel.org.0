Return-Path: <linux-leds+bounces-2055-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0568A910AF7
	for <lists+linux-leds@lfdr.de>; Thu, 20 Jun 2024 18:03:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 30DF81C20A94
	for <lists+linux-leds@lfdr.de>; Thu, 20 Jun 2024 16:03:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88AC31AF697;
	Thu, 20 Jun 2024 16:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BrfoLKiR"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CD2D22616;
	Thu, 20 Jun 2024 16:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718899433; cv=none; b=tQlXFIJ+EOHz0tbSVpxH0UgYjByN7zW9/2zkhonNDt6NAw2d+0x/oKC4BTg2aIq3GVnXYn8zA+VXCDWlyCdwF5eplaGgce7S9aXAmiZWRCb08ZcYmL191pZJ5n9ivj1u0Ejwxth0JzVujMP/gr1q3ASqDmWpApAsqkdQCGSfsmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718899433; c=relaxed/simple;
	bh=7449aXzYn9bX0ZnucChb+HyWRYsC5+qU2hWIlqqwN5E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NxHjXsp+CDBTy7anzUa8dkPANqv8VJS/9KNZn/iiJS2B17g5joY/O6vx10R4/6vPU2dR55rQGLM+tZt5C1o4WgbKBz/cF8Md+X7RURQKlan9xWaWyeUnHKbgSO2aZuV+r+hVsruNqu1vR1P6XAhA0S0+Ur8ojVnLnZeZb5VlaGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BrfoLKiR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 121F4C2BD10;
	Thu, 20 Jun 2024 16:03:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718899432;
	bh=7449aXzYn9bX0ZnucChb+HyWRYsC5+qU2hWIlqqwN5E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BrfoLKiRMMIOXw0LZ59ayrDOnm//nmM8xdghnUjxRxZdKWuCmlMxqMuUdjfE9JQw+
	 YqTInOHFpAVh72PFRuA1bXv9DCGW7gFdZXW4Wqbb+w3G4UO+xHj2ElVnpav/CVv7xs
	 mZgifmdilcURRP3PjMhrvTcdkpxzzY6Z/KhEEyoOwRHHftxdUI59h5gdVSZ8+3kohC
	 hq8+SD7SCswHnSwKXWYYM2NK31XAwc4zehdGc90gptGj/W8LEwr2HEIvOU2aUa0gnX
	 TN8D0id4CPHo+Xw5VZYG4d+YZ2QCrU0lRW95h1yeneKXhmRq0TyVsH9enjb4NQEgsZ
	 etFQi9jdsqLdg==
Date: Thu, 20 Jun 2024 17:03:48 +0100
From: Lee Jones <lee@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Pavel Machek <pavel@ucw.cz>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jacek Anaszewski <jacek.anaszewski@gmail.com>,
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 20/20] leds: leds-lp5569: Add support for Texas
 Instruments LP5569
Message-ID: <20240620160348.GO3029315@google.com>
References: <20240616215226.2112-1-ansuelsmth@gmail.com>
 <20240616215226.2112-21-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240616215226.2112-21-ansuelsmth@gmail.com>

On Sun, 16 Jun 2024, Christian Marangi wrote:

> Add support for Texas Instruments LP5569 LED driver.
> 
> Texas Instruments LP5569 is 9 channels chip with programmable engines.
> 
> It almost a copy of LP5523 with fundamental changes to regs order and
> regs content.
> 
> Has difference in how the clock is handled and doesn't support detecting
> clock time automatically, different handling for selftest and different
> scheme for the status regs.
> 
> LED chip supports ENGINE and MUX to group LED and run precompiled code
> with magic values to run patterns. This is loaded via the sysfs entry
> and it's passed as a string of ASCII HEX char.
> 
> One some devices using this LED Controller (a NBG7815 Router) it was
> found loading big precompiled pattern with up to 96 bytes of code. To
> have support for this "extended" scenario, hardcode each engine to
> support 4 pages of precompiled pattern (128 bytes of code) and 1 page
> for each MUX. This gives plenty of space for any kind precompiled
> pattern keeping simple logic for page handling of each engine and mux.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  drivers/leds/Kconfig       |  16 +-
>  drivers/leds/Makefile      |   1 +
>  drivers/leds/leds-lp5569.c | 542 +++++++++++++++++++++++++++++++++++++
>  3 files changed, 556 insertions(+), 3 deletions(-)
>  create mode 100644 drivers/leds/leds-lp5569.c
Pretty good, just a couple of tiny nits.

[...]

> +static ssize_t lp5569_led_short_test(struct lp55xx_led *led, char *buf)
> +{
> +	struct lp55xx_chip *chip = led->chip;
> +	struct lp55xx_platform_data *pdata = chip->pdata;
> +	bool leds_fault[LP5569_MAX_LEDS];
> +	struct lp55xx_led *led_tmp = led;
> +	int i, ret, pos = 0;
> +	u8 status;
> +
> +	/* Set in STANDBY state */
> +	ret = lp55xx_write(chip, LP5569_REG_ENABLE, 0);
> +	if (ret)
> +		goto exit;
> +
> +	/* Wait 1ms for device to enter STANDBY state */
> +	usleep_range(1000, 2000);
> +
> +	/* Set Charge Pump to 1x */
> +	ret = lp55xx_update_bits(chip, LP5569_REG_MISC,
> +				 FIELD_PREP(LP5569_CP_MODE_MASK, LP55XX_CP_BYPASS),
> +				 LP5569_CP_MODE_MASK);
> +	if (ret)
> +		goto exit;
> +
> +	/* Enable LED and set to 100% brightness and current to 100% (25.5mA) */
> +	for (i = 0; i < pdata->num_channels; i++) {
> +		ret = lp55xx_write(chip, LP5569_REG_LED_PWM_BASE + led_tmp->chan_nr,
> +				   LED_FULL);
> +		if (ret)
> +			goto exit;
> +
> +		ret = lp55xx_write(chip, LP5569_REG_LED_CURRENT_BASE + led_tmp->chan_nr,
> +				   LED_FULL);
> +		if (ret)
> +			goto exit;
> +
> +		led_tmp++;
> +	}
> +
> +	/* Put Device in NORMAL state */
> +	ret = lp55xx_write(chip, LP5569_REG_ENABLE, LP5569_ENABLE);
> +	if (ret)
> +		goto exit;
> +
> +	/* Wait 500 us for device to enter NORMAL state */
> +	usleep_range(500, 750);
> +
> +	/* Enable LED Shorted Test */
> +	ret = lp55xx_update_bits(chip, LP5569_REG_MISC2, LP5569_LED_OPEN_TEST,
> +				 LP5569_LED_SHORT_TEST);
> +	if (ret)
> +		goto exit;
> +
> +	/* Wait 500 us for device to fill status regs */
> +	usleep_range(500, 750);
> +
> +	/* Parse status led fault 1 regs */
> +	ret = lp55xx_read(chip, LP5569_REG_LED_FAULT1, &status);
> +	if (ret < 0)
> +		goto exit;
> +
> +	for (i = 0; i < 8; i++)
> +		leds_fault[i] = !!LEDn_STATUS_FAULT(i, status);
> +
> +	/* Parse status led fault 2 regs */
> +	ret = lp55xx_read(chip, LP5569_REG_LED_FAULT2, &status);
> +	if (ret < 0)
> +		goto exit;
> +
> +	for (i = 0; i < 1; i++)
> +		leds_fault[i + 8] = !!LEDn_STATUS_FAULT(i, status);
> +
> +	/* Report LED fault */
> +	led_tmp = led;
> +	for (i = 0; i < pdata->num_channels; i++) {
> +		if (leds_fault[led_tmp->chan_nr])
> +			pos += sprintf(buf + pos, "LED %d SHORTED FAIL\n",
> +				       led_tmp->chan_nr);
> +
> +		led_tmp++;
> +	}
> +
> +	ret = pos;
> +
> +exit:
> +	/* Disable LED Shorted Test */
> +	lp55xx_update_bits(chip, LP5569_REG_MISC2, LP5569_LED_SHORT_TEST,
> +			   0);

Nit: This line break seems unnecessary.

> +
> +	led_tmp = led;
> +	for (i = 0; i < pdata->num_channels; i++) {
> +		lp55xx_write(chip, LP5569_REG_LED_PWM_BASE + led_tmp->chan_nr,
> +			     0);

Nit: This too.

> +
> +		led_tmp++;
> +	}
> +
> +	return ret;
> +}
> +
> +static ssize_t lp5569_selftest(struct device *dev,
> +			       struct device_attribute *attr,
> +			       char *buf)
> +{
> +	struct lp55xx_led *led = i2c_get_clientdata(to_i2c_client(dev));
> +	struct lp55xx_chip *chip = led->chip;
> +	int i, pos = 0;
> +
> +	mutex_lock(&chip->lock);
> +
> +	/* Test LED Open */
> +	pos = lp5569_led_open_test(led, buf);
> +	if (pos < 0)
> +		goto fail;
> +
> +	/* Test LED Shorted */
> +	pos = lp5569_led_short_test(led, buf);
> +	if (pos < 0)
> +		goto fail;
> +
> +	for (i = 0; i < chip->pdata->num_channels; i++) {
> +		/* Restore current */
> +		lp55xx_write(chip, LP5569_REG_LED_CURRENT_BASE + led->chan_nr,
> +			     led->led_current);
> +
> +		/* Restore brightness */
> +		lp55xx_write(chip, LP5569_REG_LED_PWM_BASE + led->chan_nr,
> +			     led->brightness);
> +		led++;
> +	}
> +
> +	if (pos == 0)
> +		pos = sprintf(buf, "OK\n");
> +	goto release_lock;
> +fail:
> +	pos = sprintf(buf, "FAIL\n");
> +
> +release_lock:
> +	mutex_unlock(&chip->lock);
> +
> +	return pos;
> +}
> +
> +LP55XX_DEV_ATTR_ENGINE_MODE(1);
> +LP55XX_DEV_ATTR_ENGINE_MODE(2);
> +LP55XX_DEV_ATTR_ENGINE_MODE(3);
> +LP55XX_DEV_ATTR_ENGINE_LEDS(1);
> +LP55XX_DEV_ATTR_ENGINE_LEDS(2);
> +LP55XX_DEV_ATTR_ENGINE_LEDS(3);
> +LP55XX_DEV_ATTR_ENGINE_LOAD(1);
> +LP55XX_DEV_ATTR_ENGINE_LOAD(2);
> +LP55XX_DEV_ATTR_ENGINE_LOAD(3);
> +static LP55XX_DEV_ATTR_RO(selftest, lp5569_selftest);
> +LP55XX_DEV_ATTR_MASTER_FADER(1);
> +LP55XX_DEV_ATTR_MASTER_FADER(2);
> +LP55XX_DEV_ATTR_MASTER_FADER(3);
> +static LP55XX_DEV_ATTR_RW(master_fader_leds, lp55xx_show_master_fader_leds,
> +			  lp55xx_store_master_fader_leds);
> +
> +static struct attribute *lp5569_attributes[] = {
> +	&dev_attr_engine1_mode.attr,
> +	&dev_attr_engine2_mode.attr,
> +	&dev_attr_engine3_mode.attr,
> +	&dev_attr_engine1_load.attr,
> +	&dev_attr_engine2_load.attr,
> +	&dev_attr_engine3_load.attr,
> +	&dev_attr_engine1_leds.attr,
> +	&dev_attr_engine2_leds.attr,
> +	&dev_attr_engine3_leds.attr,
> +	&dev_attr_selftest.attr,
> +	&dev_attr_master_fader1.attr,
> +	&dev_attr_master_fader2.attr,
> +	&dev_attr_master_fader3.attr,
> +	&dev_attr_master_fader_leds.attr,
> +	NULL,
> +};
> +
> +static const struct attribute_group lp5569_group = {
> +	.attrs = lp5569_attributes,
> +};
> +
> +/* Chip specific configurations */
> +static struct lp55xx_device_config lp5569_cfg = {
> +	.reg_op_mode = {
> +		.addr = LP5569_REG_OP_MODE,
> +		.shift = LP5569_MODE_ENG_SHIFT,
> +	},
> +	.reg_exec = {
> +		.addr = LP5569_REG_EXEC_CTRL,
> +		.shift = LP5569_EXEC_ENG_SHIFT,
> +	},
> +	.reset = {
> +		.addr = LP5569_REG_RESET,
> +		.val  = LP5569_RESET,
> +	},
> +	.enable = {
> +		.addr = LP5569_REG_ENABLE,
> +		.val  = LP5569_ENABLE,
> +	},
> +	.prog_mem_base = {
> +		.addr = LP5569_REG_PROG_MEM,
> +	},
> +	.reg_led_pwm_base = {
> +		.addr = LP5569_REG_LED_PWM_BASE,
> +	},
> +	.reg_led_current_base = {
> +		.addr = LP5569_REG_LED_CURRENT_BASE,
> +	},
> +	.pages_per_engine   = LP5569_PAGES_PER_ENGINE,
> +	.max_channel  = LP5569_MAX_LEDS,
> +	.post_init_device   = lp5569_post_init_device,
> +	.brightness_fn      = lp55xx_led_brightness,
> +	.multicolor_brightness_fn = lp55xx_multicolor_brightness,
> +	.set_led_current    = lp55xx_set_led_current,
> +	.firmware_cb        = lp55xx_firmware_loaded_cb,
> +	.run_engine         = lp5569_run_engine,
> +	.dev_attr_group     = &lp5569_group,
> +};
> +
> +static const struct i2c_device_id lp5569_id[] = {
> +	{ "lp5569",  .driver_data = (kernel_ulong_t)&lp5569_cfg, },
> +	{ }
> +};
> +
> +MODULE_DEVICE_TABLE(i2c, lp5569_id);
> +
> +static const struct of_device_id of_lp5569_leds_match[] = {
> +	{ .compatible = "ti,lp5569", .data = &lp5569_cfg, },
> +	{},
> +};
> +
> +MODULE_DEVICE_TABLE(of, of_lp5569_leds_match);
> +
> +static struct i2c_driver lp5569_driver = {
> +	.driver = {
> +		.name	= "lp5569x",
> +		.of_match_table = of_lp5569_leds_match,
> +	},
> +	.probe		= lp55xx_probe,
> +	.remove		= lp55xx_remove,
> +	.id_table	= lp5569_id,
> +};
> +
> +module_i2c_driver(lp5569_driver);
> +
> +MODULE_AUTHOR("Christian Marangi <ansuelsmth@gmail.com>");
> +MODULE_DESCRIPTION("LP5569 LED engine");
> +MODULE_LICENSE("GPL");
> -- 
> 2.43.0
> 

-- 
Lee Jones [李琼斯]

