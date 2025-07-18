Return-Path: <linux-leds+bounces-5094-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB86EB09D5C
	for <lists+linux-leds@lfdr.de>; Fri, 18 Jul 2025 10:04:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 643CB7AD0CA
	for <lists+linux-leds@lfdr.de>; Fri, 18 Jul 2025 08:03:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B971221B8F8;
	Fri, 18 Jul 2025 08:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n739tt50"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86051249F9;
	Fri, 18 Jul 2025 08:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752825879; cv=none; b=ckadEB0JcXu3AdXjfjzH/8mnLuEeo7JH70dkjLVjakatPnDHNf2SEWxMF6I+rzdhmq4yx7kMwBez0ymIlElZtsesC4u8nZ4Ioh20VaGG7W0dPYlzwr+j4oIK4sn4tpPKKbslKxJxrv84xr59g22FZxuI9gG0rz47GF7sibmmTBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752825879; c=relaxed/simple;
	bh=5YLH0B30wGVpAwrxZAlI6qNxZW0jgLZa03hx5hfBDvw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jCR+/+bjqNk5JHDUi3sbhcsTkbxAO9py34DbfdBkIKfBj3GHNxk34dwmCBQzQEob4YWi2D0bMZSI/PPTrBuO1/+Qvljn+hTbQuiALM7mPXvDrrdya4TahLTZUV9auw/1MrLDskiq+tyviZlhMP+VTZI43I0PtbsGl9apxiWiRSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n739tt50; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1154AC4CEEB;
	Fri, 18 Jul 2025 08:04:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752825879;
	bh=5YLH0B30wGVpAwrxZAlI6qNxZW0jgLZa03hx5hfBDvw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=n739tt50+rk7LcNgfsBniXYm/fzHIEVS5DrXPv3xg8fU44MabAAQamBbhSMDf2SI0
	 V+1rFKDPl3auNf3j4hrYUGKQ4i5jFxaN4PzS2rHGkGiDtGvTQJofE4P6Zkpxj1vMJ1
	 U868EJsNvtlxDdE/f9F1f7ugKx5xbrKtUFz8qFwgOGkq3KpAssGlqutzbfzkRxpIKy
	 L53QpGEr4IeHcATVb5NKYXbsy/V+HP3zcdRjtcuaDob/9JKKlWcDywiU8Pckyw2Mxu
	 BkF2a9sj42ul3btq64bWGN476JsMxrtttmMSLnuUKGvXmcwbrC7S9Kx2D25TIcgSnk
	 mI6WGY1bIll3Q==
Message-ID: <0c7e171d-056d-4c00-a30b-0fd39e25bf4c@kernel.org>
Date: Fri, 18 Jul 2025 10:04:34 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 2/4] leds: add basic support for TI/National
 Semiconductor LP5812 LED Driver
To: Nam Tran <trannamatk@gmail.com>, lee@kernel.org
Cc: pavel@kernel.org, rdunlap@infradead.org, christophe.jaillet@wanadoo.fr,
 krzk+dt@kernel.org, robh@kernel.org, conor+dt@kernel.org, corbet@lwn.net,
 linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-doc@vger.kernel.org
References: <20250714172355.84609-1-trannamatk@gmail.com>
 <20250714172355.84609-3-trannamatk@gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20250714172355.84609-3-trannamatk@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14/07/2025 19:23, Nam Tran wrote:
>> +static int lp5812_parse_led(struct device_node *np,
> +			    struct lp5812_led_config *cfg,
> +			    int led_index)
> +{
> +	int num_colors = 0, ret;
> +
> +	of_property_read_string(np, "label", &cfg[led_index].name);
> +
> +	ret = of_property_read_u32(np, "reg", &cfg[led_index].chan_nr);

You mix code for probe with code for regular operation. This is not
expected and confusing. All functions related to probe must be before
the probe function is defined.

> +	if (ret)
> +		return ret;
> +
> +	for_each_available_child_of_node_scoped(np, child) {
> +		ret = lp5812_parse_led_channel(child, cfg, led_index, num_colors);
> +		if (ret)
> +			return ret;
> +		num_colors++;
> +	}
> +
> +	if (num_colors == 0) {
> +		ret = lp5812_parse_led_channel(np, cfg, led_index, 0);
> +		if (ret)
> +			return ret;
> +		num_colors = 1;
> +		cfg[led_index].is_sc_led = true;
> +	} else {
> +		cfg[led_index].is_sc_led = false;
> +	}
> +
> +	cfg[led_index].num_colors = num_colors;
> +
> +	return 0;
> +}
> +
> +static int lp5812_of_populate_pdata(struct device *dev,
> +				    struct device_node *np,
> +				    struct lp5812_chip *chip)
> +{
> +	struct lp5812_led_config *cfg;
> +	int num_channels, i = 0, ret;
> +
> +	num_channels = of_get_available_child_count(np);
> +	if (num_channels == 0) {
> +		dev_err(dev, "no LED channels\n");
> +		return -EINVAL;
> +	}
> +
> +	cfg = devm_kcalloc(dev, num_channels, sizeof(*cfg), GFP_KERNEL);
> +	if (!cfg)
> +		return -ENOMEM;
> +
> +	chip->led_config = &cfg[0];
> +	chip->num_channels = num_channels;
> +
> +	for_each_available_child_of_node_scoped(np, child) {
> +		ret = lp5812_parse_led(child, cfg, i);
> +		if (ret)
> +			return -EINVAL;
> +		i++;
> +	}
> +
> +	of_property_read_string(np, "label", &chip->label);
> +	return 0;
> +}
> +

This is a messy driver :/

....

> +
> +static struct lp5812_led *lp5812_dev_to_led(struct device *dev)
> +{
> +	struct led_classdev *cdev = dev_get_drvdata(dev);
> +	const char *name = dev->platform_data;
> +
> +	if (strcmp(name, LP5812_SC_LED) == 0)
> +		return container_of(cdev, struct lp5812_led, cdev);
> +
> +	return container_of((struct led_classdev_mc *)cdev, struct lp5812_led, mc_cdev);


No, just pass correct pointer to platform data, no need with strcmp and
then different container of...


...

> +
> +static int lp5812_init_led(struct lp5812_led *led, struct lp5812_chip *chip, int chan)
> +{
> +	struct device *dev = &chip->client->dev;
> +	struct mc_subled *mc_led_info;
> +	struct led_classdev *led_cdev;
> +	int i, ret = 0;
> +
> +	if (chip->led_config[chan].name) {
> +		led->cdev.name = chip->led_config[chan].name;
> +	} else {
> +		led->cdev.name = devm_kasprintf(dev, GFP_KERNEL, "%s:channel%d",
> +						chip->label ? : chip->client->name, chan);
> +		if (!led->cdev.name)
> +			return -ENOMEM;
> +	}
> +
> +	if (!chip->led_config[chan].is_sc_led) {
> +		mc_led_info = devm_kcalloc(dev,
> +					   chip->led_config[chan].num_colors,
> +					   sizeof(*mc_led_info), GFP_KERNEL);
> +		if (!mc_led_info)
> +			return -ENOMEM;
> +
> +		led_cdev = &led->mc_cdev.led_cdev;
> +		led_cdev->name = led->cdev.name;
> +		led_cdev->brightness_set_blocking = lp5812_set_mc_brightness;
> +		led->mc_cdev.num_colors = chip->led_config[chan].num_colors;
> +		for (i = 0; i < led->mc_cdev.num_colors; i++) {
> +			mc_led_info[i].color_index =
> +				chip->led_config[chan].color_id[i];
> +			mc_led_info[i].channel =
> +					chip->led_config[chan].led_id[i];
> +		}
> +
> +		led->mc_cdev.subled_info = mc_led_info;
> +	} else {
> +		led->cdev.brightness_set_blocking = lp5812_set_brightness;
> +	}
> +
> +	led->cdev.groups = lp5812_led_groups;
> +	led->chan_nr = chan;
> +
> +	if (chip->led_config[chan].is_sc_led) {
> +		ret = devm_led_classdev_register(dev, &led->cdev);
> +		if (ret == 0) {
> +			led->cdev.dev->platform_data = devm_kstrdup(dev, LP5812_SC_LED, GFP_KERNEL);
> +			if (!led->cdev.dev->platform_data)
> +				return -ENOMEM;
> +		}
> +	} else {
> +		ret = devm_led_classdev_multicolor_register(dev, &led->mc_cdev);
> +		if (ret == 0) {
> +			led->mc_cdev.led_cdev.dev->platform_data =
> +				devm_kstrdup(dev, LP5812_MC_LED, GFP_KERNEL);
> +			if (!led->mc_cdev.led_cdev.dev->platform_data)
> +				return -ENOMEM;
> +
> +			ret = sysfs_create_groups(&led->mc_cdev.led_cdev.dev->kobj,
> +						  lp5812_led_groups);
> +			if (ret)
> +				dev_err(dev, "sysfs_create_groups failed\n");
> +		}
> +	}
> +
> +	if (ret) {
> +		dev_err(dev, "led register err: %d\n", ret);

Why are you printing same error multiple times?

> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int lp5812_register_leds(struct lp5812_led *led, struct lp5812_chip *chip)
> +{
> +	struct lp5812_led *each;
> +	int num_channels = chip->num_channels;
> +	int ret, i, j;
> +
> +	for (i = 0; i < num_channels; i++) {
> +		each = led + i;
> +		ret = lp5812_init_led(each, chip, i);
> +		if (ret)
> +			goto err_init_led;
> +
> +		each->chip = chip;
> +
> +		for (j = 0; j < chip->led_config[i].num_colors; j++) {
> +			ret = lp5812_auto_dc(chip, chip->led_config[i].led_id[j],
> +					     chip->led_config[i].led_id[j]);
> +			if (ret)
> +				goto err_init_led;
> +
> +			ret = lp5812_set_led_mode(chip, chip->led_config[i].led_id[j],
> +						  LP5812_MODE_MANUAL);
> +			if (ret)
> +				goto err_init_led;
> +		}
> +	}
> +
> +	return 0;
> +
> +err_init_led:
> +	return ret;
> +}
> +
> +static int lp5812_register_sysfs(struct lp5812_chip *chip)
> +{
> +	struct device *dev = &chip->client->dev;
> +	const struct lp5812_device_config *cfg = chip->cfg;
> +	int ret;
> +
> +	ret = sysfs_create_group(&dev->kobj, cfg->dev_attr_group);
> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}
> +
> +static void lp5812_unregister_sysfs(struct lp5812_led *led, struct lp5812_chip *chip)
> +{
> +	struct device *dev = &chip->client->dev;
> +	const struct lp5812_device_config *cfg = chip->cfg;
> +	struct lp5812_led *each;
> +	int i;
> +
> +	sysfs_remove_group(&dev->kobj, cfg->dev_attr_group);
> +
> +	for (i = 0; i < chip->num_channels; i++) {
> +		if (!chip->led_config[i].is_sc_led) {
> +			each = led + i;
> +			sysfs_remove_groups(&each->mc_cdev.led_cdev.dev->kobj, lp5812_led_groups);
> +		}
> +	}
> +}
> +
> +static int lp5812_probe(struct i2c_client *client)
> +{
> +	struct lp5812_chip *chip;
> +	const struct i2c_device_id *id = i2c_client_get_device_id(client);
> +	struct device_node *np = dev_of_node(&client->dev);
> +	struct lp5812_led *led;
> +	int ret;
> +
> +	chip = devm_kzalloc(&client->dev, sizeof(*chip), GFP_KERNEL);
> +	if (!chip)
> +		return -ENOMEM;
> +
> +	chip->cfg = i2c_get_match_data(client);
> +
> +	if (np) {
> +		ret = lp5812_of_populate_pdata(&client->dev, np, chip);
> +		if (ret)
> +			goto err_init;
> +	} else {
> +		return dev_err_probe(&client->dev, -EINVAL, "No platform data\n");

This is confusing syntax. Expected is:
if (!missing something)
	return -EINVAL

The other problem is that you claim this can match and bind without OF,
but here you say it is a requirement. So either this code is wrong or
your I2C ID table should be removed.


> +	}
> +
> +	led = devm_kcalloc(&client->dev, chip->num_channels, sizeof(*led), GFP_KERNEL);
> +	if (!led)
> +		return -ENOMEM;
> +
> +	chip->client = client;
> +
> +	mutex_init(&chip->lock);
> +
> +	i2c_set_clientdata(client, led);
> +
> +	ret = lp5812_init_device(chip);
> +	if (ret)
> +		goto err_init;
> +
> +	dev_info(&client->dev, "%s Programmable led chip found\n", id->name);

Drop. You have only one device type (look at your binding), so you
cannot "find" devices.

> +
> +	ret = lp5812_register_leds(led, chip);
> +	if (ret)
> +		goto err_out;
> +
> +	ret = lp5812_register_sysfs(chip);
> +	if (ret) {
> +		dev_err_probe(&client->dev, ret, "Registering sysfs failed\n");
> +		goto err_out;
> +	}
> +
> +	return 0;
> +
> +err_out:
> +	lp5812_deinit_device(chip);
> +err_init:
> +	return ret;
> +}
> +
> +static void lp5812_remove(struct i2c_client *client)
> +{
> +	struct lp5812_led *led = i2c_get_clientdata(client);
> +
> +	lp5812_unregister_sysfs(led, led->chip);
> +	lp5812_deinit_device(led->chip);
> +
> +	dev_info(&client->dev, "Removed driver\n");

No, drop, useless.


Best regards,
Krzysztof

