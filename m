Return-Path: <linux-leds+bounces-3419-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5364D9D1979
	for <lists+linux-leds@lfdr.de>; Mon, 18 Nov 2024 21:13:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DB1241F22C4B
	for <lists+linux-leds@lfdr.de>; Mon, 18 Nov 2024 20:13:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 160F21E5732;
	Mon, 18 Nov 2024 20:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="JiEyUIA8"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-20.smtpout.orange.fr [80.12.242.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AF5C1E5015;
	Mon, 18 Nov 2024 20:13:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731960826; cv=none; b=uDCNmkej8yY9mFATXC9sCVnBhY+s2K8VQnNN9ucokY+KXTBJaQ3hF5r+8ApnR7eBiNQ8BXHzjA/YfmdsJFHNiCteqkyfYhO3pUbAjFuM4m/nDYU4X7777aFQyEMvOtUZhquiV+qZ/VM6rEdVbbI2y/QD/sDOvebrPJpJ2XbsHuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731960826; c=relaxed/simple;
	bh=Dh0wnBmgR7c7ubz52tHRu7AUlLQhDPnpJj8qC34OR0g=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=NHdZyuoDuM01HYOUVqIse0Us5MEw+IHO1aYvW46If7hA4M5ry+GF2gwH9KIERrYgVZ2+xo2BbXj0W6gxDifx4aT36Scyq6Aiwj8SNa+VUcrIQhG0K4QDare0WHwQfWVElQNeAzbsOpAf0a/Zkv0dffwcgP/MXx2rwSOlshVJhOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=JiEyUIA8; arc=none smtp.client-ip=80.12.242.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from [192.168.1.37] ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id D87ptiy5f8AEMD87ptNDjZ; Mon, 18 Nov 2024 21:13:36 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1731960816;
	bh=0Uj4XXK/rJmkMPiNnKi8CwHd/oqNDiQqKVDY5wwCyhc=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=JiEyUIA8OSNZzjh+pPHfk2GPR941xjrXW2Z2VEl9zZFFKkj8vOgJDOjZ05Aht+oo8
	 lKlse8Om9CwQYKAw/gkEZPvOjdTzVD11twDv85VbwbYaAmofoDdUve4OnmGsMyHj0d
	 p1Sk+bBu/5GEYuAcIe8a6kYexueERB7Q6SzQpx7+jtRZyw5/oU5hjwWNdkqNfRc8VW
	 FJehlPXfPKfr21HyUDcM3s4zJ9TKUFFcSGti89a2B91PUVLBE+7MzKU5qz63WjPQnN
	 Kkf7bBjdcs/uyCptc7o0ZTrh+9EMadSyLf2VHpvie5fQyiHteeO3V0Cc26JvKsvaeZ
	 8T2x2hR+V+LEQ==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Mon, 18 Nov 2024 21:13:36 +0100
X-ME-IP: 90.11.132.44
Message-ID: <f6620b99-aabe-4b76-8a60-deae0a9042ae@wanadoo.fr>
Date: Mon, 18 Nov 2024 21:13:32 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 3/3] leds: Add LED1202 I2C driver
To: Vicentiu Galanopulo <vicentiu.galanopulo@remote-tech.co.uk>,
 Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
References: <20241118145449.7370-1-vicentiu.galanopulo@remote-tech.co.uk>
 <20241118145449.7370-4-vicentiu.galanopulo@remote-tech.co.uk>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20241118145449.7370-4-vicentiu.galanopulo@remote-tech.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 18/11/2024 à 15:54, Vicentiu Galanopulo a écrit :
> The output current can be adjusted separately for each channel by 8-bit
> analog (current sink input) and 12-bit digital (PWM) dimming control. The
> LED1202 implements 12 low-side current generators with independent dimming
> control.
> Internal volatile memory allows the user to store up to 8 different patterns,
> each pattern is a particular output configuration in terms of PWM
> duty-cycle (on 4096 steps). Analog dimming (on 256 steps) is per channel but
> common to all patterns. Each device tree LED node will have a corresponding
> entry in /sys/class/leds with the label name. The brightness property
> corresponds to the per channel analog dimming, while the patterns[1-8] to the
> PWM dimming control.
> 
> Signed-off-by: Vicentiu Galanopulo <vicentiu.galanopulo@remote-tech.co.uk>
...

> +static int st1202_write_reg(struct st1202_chip *chip, int reg, uint8_t val)
> +{
> +	return i2c_smbus_write_byte_data(chip->client, reg, val);
> +}

Many duplicated message could be saved if errors where logged directly 
in st1202_write_reg() and st1202_read_reg()

This would simplify a lot the callers that would only need to return 
directly.

> +
> +static uint8_t st1202_prescalar_to_miliseconds(unsigned int value)
> +{
> +	return value/ST1202_MILLIS_PATTERN_DUR_MIN - 1;

Can value be 0?
If yes, should the return value be clamped?

> +}

...

> +static int st1202_dt_init(struct st1202_chip *chip)
> +{
> +	struct device *dev = &chip->client->dev;
> +	struct st1202_led *led;
> +	int err, reg;
> +
> +	for_each_available_child_of_node_scoped(dev_of_node(dev), child) {
> +		struct led_init_data init_data = {};
> +
> +		err = of_property_read_u32(child, "reg", &reg);
> +		if (err) {
> +			of_node_put(child);

The _scoped version of the iterator is used, so I think that this 
of_node_put() is not needed.

> +			return dev_err_probe(dev, err, "Invalid register, error: %d\n", err);

No need to duplicate err. dev_err_probe() already prints it, in a human 
readble form.

> +		}
> +
> +		led = &chip->leds[reg];
> +		led->is_active = true;
> +		led->fwnode = of_fwnode_handle(child);
> +
> +		led->led_cdev.max_brightness = U8_MAX;
> +		led->led_cdev.brightness_set_blocking = st1202_led_set;
> +		led->led_cdev.pattern_set = st1202_led_pattern_set;
> +		led->led_cdev.pattern_clear = st1202_led_pattern_clear;
> +		led->led_cdev.default_trigger = "pattern";
> +
> +		init_data.fwnode = led->fwnode;
> +		init_data.devicename = "st1202";
> +		init_data.default_label = ":";
> +		err = devm_led_classdev_register_ext(dev,
> +					&led->led_cdev, &init_data);
> +		if (err < 0) {
> +			dev_err_probe(dev, err,
> +				"Failed to register LED class dev, error: %d\n", err);

No need to duplicate err. dev_err_probe() already prints it, in a human 
readble form.

Also return dev_err_probe() would save a few lines.

> +			return err;
> +		}
> +		led->led_cdev.brightness_set = st1202_brightness_set;
> +		led->led_cdev.brightness_get = st1202_brightness_get;
> +	}
> +
> +	return 0;
> +}
> +
> +static int st1202_setup(struct st1202_chip *chip)
> +{
> +	int ret;
> +
> +	mutex_lock(&chip->lock);

if guard(mutex)(&chip->lock); was used you could return directly in all 
error paths below.

Same applies in several functions above.

> +	/*
> +	 * Once the supply voltage is applied, the LED1202 executes some internal checks,
> +	 * afterwords it stops the oscillator and puts the internal LDO in quiescent mode.
> +	 * To start the device, EN bit must be set inside the “Device Enable” register at
> +	 * address 01h. As soon as EN is set, the LED1202 loads the adjustment parameters
> +	 * from the internal non-volatile memory and performs an auto-calibration procedure
> +	 * in order to increase the output current precision.
> +	 * Such initialization lasts about 6.5 ms.
> +	 */
> +
> +	/* Reset the chip during setup */
> +	ret = st1202_write_reg(chip, ST1202_DEV_ENABLE, ST1202_DEV_ENABLE_RESET);
> +	if (ret < 0) {
> +		dev_err_probe(&chip->client->dev, -EIO,
> +				"Failed to write to register [0x%x], error: %d\n",
> +				ST1202_DEV_ENABLE, ret);

Why return -EIO if you have an error code in ret?
If you return ret, the ", error: %d\n", ret" part can be removed

Same everywhere in this function

> +		goto exit;
> +	}
> +
> +	/* Enable phase-shift delay feature */
> +	ret = st1202_write_reg(chip, ST1202_CONFIG_REG, ST1202_CONFIG_REG_SHFT);
> +	if (ret < 0) {
> +		dev_err_probe(&chip->client->dev, -EIO,
> +				"Failed to write to register [0x%x], error: %d\n",
> +				ST1202_CONFIG_REG, ret);
> +		goto exit;
> +	}
> +
> +	/* Enable the device */
> +	ret = st1202_write_reg(chip, ST1202_DEV_ENABLE, ST1202_DEV_ENABLE_ON);
> +	if (ret < 0) {
> +		dev_err_probe(&chip->client->dev, -EIO,
> +				"Failed to write to register [0x%x], error: %d\n",
> +				ST1202_DEV_ENABLE, ret);
> +		goto exit;
> +	}
> +
> +	/* Duration of initialization */
> +	usleep_range(6500, 10000);
> +
> +	/* Deactivate all LEDS (channels) and activate only the ones found in Device Tree */
> +	ret = st1202_write_reg(chip, ST1202_CHAN_ENABLE_LOW, ST1202_CHAN_DISABLE_ALL);
> +	if (ret < 0) {
> +		dev_err_probe(&chip->client->dev, -EIO,
> +				"Failed writing to register [0x%x], error: %d\n",
> +				ST1202_CHAN_ENABLE_LOW, ret);
> +		goto exit;
> +	}
> +
> +	ret = st1202_write_reg(chip, ST1202_CHAN_ENABLE_HIGH, ST1202_CHAN_DISABLE_ALL);
> +	if (ret < 0) {
> +		dev_err_probe(&chip->client->dev, -EIO,
> +				"Failed writing to register [0x%x], error: %d\n",
> +				ST1202_CHAN_ENABLE_HIGH, ret);
> +		goto exit;
> +	}
> +
> +	ret = st1202_write_reg(chip, ST1202_CONFIG_REG,
> +				ST1202_CONFIG_REG_PATS | ST1202_CONFIG_REG_PATSR);
> +	if (ret < 0) {
> +		dev_err_probe(&chip->client->dev, -EIO,
> +				"Failed writing to register [0x%lx], error: %d\n",
> +				ST1202_CONFIG_REG_PATS | ST1202_CONFIG_REG_PATSR, ret);
> +		goto exit;
> +	}
> +
> +exit:
> +	mutex_unlock(&chip->lock);
> +	return ret;
> +}
> +
> +static int st1202_probe(struct i2c_client *client)
> +{
> +	struct st1202_chip *chip;
> +	struct st1202_led *led;
> +	int ret;
> +
> +	if (!i2c_check_functionality(client->adapter, I2C_FUNC_SMBUS_BYTE_DATA))
> +		return dev_err_probe(&client->dev, -EIO, "SMBUS Byte Data not Supported\n");
> +
> +	chip = devm_kzalloc(&client->dev, sizeof(*chip), GFP_KERNEL);
> +	if (!chip)
> +		return -ENOMEM;
> +
> +	i2c_set_clientdata(client, chip);

Is it needed?
(There is no i2c_get_clientdata())

> +
> +	devm_mutex_init(&client->dev, &chip->lock);
> +	chip->client = client;
> +
> +	ret = st1202_dt_init(chip);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = st1202_setup(chip);
> +	if (ret < 0)
> +		return ret;
> +
> +	for (int i = 0; i < ST1202_MAX_LEDS; i++) {
> +		led = &chip->leds[i];
> +		led->chip = chip;
> +		led->led_num = i;
> +
> +		if (led->is_active) {
> +			ret = st1202_channel_set(led->chip, led->led_num, true);
> +			if (ret < 0) {
> +				return dev_err_probe(&client->dev, -EIO,
> +					"Failed to activate LED channel, error: %d\n", ret);
> +			}

Why return -EIO if you have an error code in ret?
If you return ret, the ", error: %d\n", ret" part can be removed

Also some { } could be removed.

> +
> +			ret = st1202_led_pattern_clear(&led->led_cdev);
> +			if (ret < 0) {
> +				return dev_err_probe(&client->dev, -EIO,
> +					"Failed to clear LED pattern, error: %d\n", ret);

Why return -EIO if you have an error code in ret?
If you return ret, the ", error: %d\n", ret" part can be removed

Also some { } could be removed.

> +			}
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static const struct i2c_device_id st1202_id[] = {
> +	{ "st1202-i2c" },
> +	{ /* sentinel */ },

Nitpick: no need for ending comma after a terminator

> +};
> +MODULE_DEVICE_TABLE(i2c, st1202_id);
> +
> +static const struct of_device_id st1202_dt_ids[] = {
> +	{ .compatible = "st,led1202", },
> +	{ /* sentinel */ },

Nitpick: no need for ending comma after a terminator

> +};
> +MODULE_DEVICE_TABLE(of, st1202_dt_ids);
...

CJ

