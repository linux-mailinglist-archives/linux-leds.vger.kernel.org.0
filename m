Return-Path: <linux-leds+bounces-4930-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FD93AED446
	for <lists+linux-leds@lfdr.de>; Mon, 30 Jun 2025 08:12:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 946143A18B2
	for <lists+linux-leds@lfdr.de>; Mon, 30 Jun 2025 06:12:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11C5D1E1DE5;
	Mon, 30 Jun 2025 06:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pZQR96tQ"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8BBF126BF1;
	Mon, 30 Jun 2025 06:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751263945; cv=none; b=IJcyM/wOt0VuXXymAEy8Pz8FdaRIMgbrz8YoUNcTk5tFbTGslI2d6+j23j0g65s6ncquF+6Vh02XsJj9IoQqkev2KUtU94EM938LtRiAOgNayixI6O+/b2ZyuiLS/qXl2FpcmJyQG9YaaDb17yZAyUxkbLotUONII3/v7QOvqe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751263945; c=relaxed/simple;
	bh=OXC6fK+jEIvZa/zjiKJX+9r79IRQwYdqFYJbvN1VWCo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ti79qg+ANFJ9gZCrW3ycdjyxH+IqjQXoIWLNI7fwS5JQuOlg1c25I+J44dbBuRggWkBIBX4AnPv+9nMhsxRaVCpxJXGOYVTvK9v3xrDbdr+klG0omUy3ioTWBepcubir1D++WI9lwV0lHZTk+tItNHlvc62twxSDfCjdfMXxp/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pZQR96tQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD496C4CEE3;
	Mon, 30 Jun 2025 06:12:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751263944;
	bh=OXC6fK+jEIvZa/zjiKJX+9r79IRQwYdqFYJbvN1VWCo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=pZQR96tQ5sGHjxlRNA3N18PLGWppp1mtWGMNbWQIdgrkUTE1cxRP+MNQVkmWFB91f
	 FYv1ydC75ttHhFYhrW2qBbS4y/jpSn7Of1BkC0vmPcryPwW4OW+6zkkUtin1EDcbqy
	 2TdMXgMMDtOULq4cmGG990McSbxg/03ecRqP+jmrQQNp4AmGfZMuMRYk06IxUOOedG
	 3XOlfqMAVNFSOQnSBt4HVxc31gTvDFoKsHe4vSvCJNDi9qYFcMJjIGkH/xn84AXqzO
	 WEa408T2M0NP6JtWr8OLPHeXQ6gdWHAQGC+iFTFPOoWS+0WHAUmlPpTPrmKrKHowFL
	 VIBL2JS+cz/aQ==
Message-ID: <47d24e31-1c6f-4299-aeaf-669c474c4459@kernel.org>
Date: Mon, 30 Jun 2025 08:12:16 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/8] auxdisplay: Add Titanmec TM16xx 7-segment display
 controllers driver
To: =?UTF-8?Q?Jean-Fran=C3=A7ois_Lessard?= <jefflessard3@gmail.com>,
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, devicetree@vger.kernel.org,
 linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
 =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
 Boris Gjenero <boris.gjenero@gmail.com>,
 Christian Hewitt <christianshewitt@gmail.com>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 Paolo Sabatino <paolo.sabatino@gmail.com>
References: <20250629130002.49842-1-jefflessard3@gmail.com>
 <20250629131830.50034-1-jefflessard3@gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20250629131830.50034-1-jefflessard3@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 29/06/2025 15:18, Jean-François Lessard wrote:
> This patch introduces a new auxiliary display driver for TM16XX family LED controllers and compatible chips:

Please do not use "This commit/patch/change", but imperative mood. See
longer explanation here:
https://elixir.bootlin.com/linux/v5.17.1/source/Documentation/process/submitting-patches.rst#L95

Please wrap commit message according to Linux coding style / submission
process (neither too early nor over the limit):
https://elixir.bootlin.com/linux/v6.4-rc1/source/Documentation/process/submitting-patches.rst#L597


> - Shenzhen Titan Micro Electronics: TM1618, TM1620, TM1628, TM1650
> - Fuzhou Fuda Hisi Microelectronics: FD620, FD628, FD650, FD655, FD6551
> - Wuxi i-Core Electronics: AiP650, AiP1618, AiP1628
> - Princeton Technology: PT6964
> - Shenzhen Winrise Technology: HBS658
> 


...

> + * tm16xx_parse_dt - Parse device tree data
> + * @dev: Pointer to device structure
> + * @display: Pointer to tm16xx_display structure
> + *
> + * Return: 0 on success, negative error code on failure
> + */
> +static int tm16xx_parse_dt(struct device *dev, struct tm16xx_display *display)
> +{
> +	struct fwnode_handle *child;
> +	int ret, i, max_grid = 0;
> +	u8 *digits;
> +
> +	display->transpose_display_data =
> +		device_property_read_bool(dev, "titanmec,transposed");

Wrong wrapping.

> +
> +	ret = device_property_count_u8(dev, "titanmec,digits");
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to count 'titanmec,digits' property: %d\n", ret);
> +		return ret;
> +	}
> +
> +	display->num_digits = ret;
> +	dev_dbg(dev, "Number of digits: %d\n", display->num_digits);
> +
> +	digits = devm_kcalloc(dev, display->num_digits, sizeof(*digits), GFP_KERNEL);
> +	if (!digits)
> +		return -ENOMEM;
> +
> +	ret = device_property_read_u8_array(dev, "titanmec,digits", digits,
> +					    display->num_digits);
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to read 'titanmec,digits' property: %d\n", ret);
> +		return ret;
> +	}
> +
> +	display->digits = devm_kcalloc(dev, display->num_digits, sizeof(*display->digits),
> +				       GFP_KERNEL);
> +	if (!display->digits)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < display->num_digits; i++) {
> +		if (digits[i] >= display->controller->max_grids) {
> +			dev_err(dev, "Digit grid %d exceeds controller max_grids %d\n",
> +				digits[i], display->controller->max_grids);
> +			return -EINVAL;
> +		}
> +
> +		display->digits[i].grid = digits[i];
> +		max_grid = umax(max_grid, digits[i]);
> +	}
> +
> +	devm_kfree(dev, digits);
> +
> +	ret = device_property_read_u8_array(dev, "titanmec,segment-mapping",
> +					    display->segment_mapping, DIGIT_SEGMENTS);
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to read 'titanmec,segment-mapping' property: %d\n",
> +			ret);
> +		return ret;
> +	}
> +
> +	display->digit_bitmask = 0;
> +	for (i = 0; i < DIGIT_SEGMENTS; i++) {
> +		if (display->segment_mapping[i] < MIN_SEGMENT ||
> +		    display->segment_mapping[i] > MAX_SEGMENT) {
> +			dev_err(dev,
> +				"Invalid 'titanmec,segment-mapping' value: %d (must be between %d and %d)\n",
> +				display->segment_mapping[i], MIN_SEGMENT, MAX_SEGMENT);
> +			return -EINVAL;
> +		}
> +
> +		display->digit_bitmask |= BIT(display->segment_mapping[i]);
> +	}
> +
> +	display->num_leds = 0;
> +	device_for_each_child_node(dev, child) {
> +		u32 reg[2];
> +
> +		ret = fwnode_property_read_u32_array(child, "reg", reg, 2);
> +		if (ret < 0) {
> +			dev_err(dev, "Failed to read 'reg' property of led node: %d\n",
> +				ret);
> +			fwnode_handle_put(child);
> +			return ret;
> +		}
> +
> +		if (reg[0] >= display->controller->max_grids) {
> +			dev_err(dev, "LED grid %d exceeds controller max_grids %d\n",
> +				reg[0], display->controller->max_grids);
> +			fwnode_handle_put(child);
> +			return -EINVAL;
> +		}
> +
> +		if (reg[1] < MIN_SEGMENT || reg[1] > MAX_SEGMENT) {
> +			dev_err(dev,
> +				"LED segment %d is invalid (must be between %d and %d)\n",
> +				reg[1], MIN_SEGMENT, MAX_SEGMENT);
> +			fwnode_handle_put(child);
> +			return -EINVAL;
> +		}
> +
> +		max_grid = umax(max_grid, reg[0]);
> +		display->num_leds++;
> +	}
> +
> +	dev_dbg(dev, "Number of LEDs: %d\n", display->num_leds);
> +
> +	display->display_data_len = max_grid + 1;
> +	dev_dbg(dev, "Number of display grids: %zu\n", display->display_data_len);
> +
> +	display->display_data = devm_kcalloc(dev, display->display_data_len,
> +					     sizeof(*display->display_data), GFP_KERNEL);
> +	if (!display->display_data)
> +		return -ENOMEM;
> +
> +	return 0;
> +}
> +
> +/**
> + * tm16xx_probe - Probe function for tm16xx devices
> + * @display: Pointer to tm16xx_display structure
> + *
> + * Return: 0 on success, negative error code on failure
> + */
> +static int tm16xx_probe(struct tm16xx_display *display)
> +{
> +	struct device *dev = display->dev;
> +	struct fwnode_handle *child;
> +	int ret, i;
> +
> +	ret = tm16xx_parse_dt(dev, display);
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to parse device tree: %d\n", ret);
> +		return ret;
> +	}
> +
> +	mutex_init(&display->lock);
> +	INIT_WORK(&display->flush_init, tm16xx_display_flush_init);
> +
> +	/* Initialize work structure with appropriate flush function */
> +	if (display->transpose_display_data) {
> +		INIT_WORK(&display->flush_display, tm16xx_display_flush_data_transposed);
> +		dev_info(display->dev, "Operating in transposed mode\n");
> +	} else {
> +		INIT_WORK(&display->flush_display, tm16xx_display_flush_data);
> +	}
> +
> +	display->main_led.name = TM16XX_DEVICE_NAME;
> +	display->main_led.brightness = display->controller->max_brightness;
> +	display->main_led.max_brightness = display->controller->max_brightness;
> +	display->main_led.brightness_set = tm16xx_brightness_set;
> +	display->main_led.groups = tm16xx_main_led_groups;
> +	display->main_led.flags = LED_RETAIN_AT_SHUTDOWN | LED_CORE_SUSPENDRESUME;
> +
> +	ret = devm_led_classdev_register(dev, &display->main_led);
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to register main LED: %d\n", ret);
> +		return ret;
> +	}
> +
> +	display->leds =
> +		devm_kcalloc(dev, display->num_leds, sizeof(*display->leds), GFP_KERNEL);

Wrong wrapping. Use kernel style, not clang style.


> +	if (!display->leds)
> +		return -ENOMEM;
> +
> +	i = 0;
> +	device_for_each_child_node(dev, child) {
> +		struct tm16xx_led *led = &display->leds[i];
> +		struct led_init_data led_init = {
> +			.fwnode = child,
> +			.devicename = display->main_led.name,
> +			.devname_mandatory = true,
> +		};
> +		u32 reg[2];
> +
> +		ret = fwnode_property_read_u32_array(child, "reg", reg, 2);
> +		if (ret < 0) {
> +			fwnode_handle_put(child);
> +			dev_err(dev, "Failed to read LED reg property: %d\n", ret);
> +			return ret;
> +		}
> +
> +		led->grid = reg[0];
> +		led->segment = reg[1];
> +
> +		led->cdev.max_brightness = 1;
> +		led->cdev.brightness_set = tm16xx_led_set;
> +		led->cdev.flags = LED_RETAIN_AT_SHUTDOWN | LED_CORE_SUSPENDRESUME;
> +
> +		ret = devm_led_classdev_register_ext(dev, &led->cdev, &led_init);
> +		if (ret < 0) {
> +			fwnode_handle_put(child);
> +			dev_err(dev, "Failed to register LED %s: %d\n", led->cdev.name,
> +				ret);
> +			return ret;
> +		}
> +
> +		i++;
> +	}
> +
> +	ret = tm16xx_display_init(display);
> +	if (ret < 0) {
> +		dev_err(display->dev, "Failed to initialize display: %d\n", ret);
> +		return ret;
> +	}
> +
> +	dev_info(display->dev, "Display initialized successfully\n");

Drop, drivers should be silent on success. See coding style.

> +	return 0;
> +}
> +
> +/* SPI specific code */
> +static int tm16xx_spi_probe(struct spi_device *spi)
> +{
> +	const struct tm16xx_controller *controller;
> +	struct tm16xx_display *display;
> +	int ret;
> +
> +	controller = of_device_get_match_data(&spi->dev);
> +	if (!controller)
> +		return -EINVAL;
> +
> +	display = devm_kzalloc(&spi->dev, sizeof(*display), GFP_KERNEL);
> +	if (!display)
> +		return -ENOMEM;
> +
> +	display->client.spi = spi;
> +	display->dev = &spi->dev;
> +	display->controller = controller;
> +
> +	spi_set_drvdata(spi, display);
> +
> +	ret = tm16xx_probe(display);
> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}
> +
> +static void tm16xx_spi_remove(struct spi_device *spi)
> +{
> +	struct tm16xx_display *display = spi_get_drvdata(spi);
> +
> +	tm16xx_display_remove(display);
> +}
> +
> +// clang-format off

Drop

> +static const struct of_device_id tm16xx_spi_of_match[] = {
> +	{ .compatible = "titanmec,tm1618", .data = &tm1618_controller },
> +	{ .compatible = "titanmec,tm1620", .data = &tm1628_controller },
> +	{ .compatible = "titanmec,tm1628", .data = &tm1628_controller },
> +	{ .compatible = "fdhisi,fd620", .data = &tm1628_controller },
> +	{ .compatible = "fdhisi,fd628", .data = &tm1628_controller },
> +	{ .compatible = "icore,aip1618", .data = &tm1618_controller },
> +	{ .compatible = "icore,aip1628", .data = &tm1628_controller },
> +	{ .compatible = "princeton,pt6964", .data = &tm1628_controller },
> +	{ .compatible = "winrise,hbs658", .data = &hbs658_controller },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, tm16xx_spi_of_match);
> +
> +static const struct spi_device_id tm16xx_spi_id[] = {
> +	{ "tm1618", 0 },
> +	{ "tm1620", 0 },
> +	{ "tm1628", 0 },
> +	{ "fd620", 0 },
> +	{ "fd628", 0 },
> +	{ "aip1618", 0 },
> +	{ "aip1628", 0 },
> +	{ "pt6964", 0 },
> +	{ "hbs658", 0 },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(spi, tm16xx_spi_id);
> +// clang-format on

Drop

> +
> +static struct spi_driver tm16xx_spi_driver = {
> +	.driver = {
> +		.name = TM16XX_DRIVER_NAME,
> +		.of_match_table = tm16xx_spi_of_match,
> +	},
> +	.probe = tm16xx_spi_probe,
> +	.remove = tm16xx_spi_remove,
> +	.shutdown = tm16xx_spi_remove,
> +	.id_table = tm16xx_spi_id,
> +};
> +
> +/* I2C specific code */
> +static int tm16xx_i2c_probe(struct i2c_client *client)
> +{
> +	const struct tm16xx_controller *controller;
> +	struct tm16xx_display *display;
> +	int ret;
> +
> +	controller = of_device_get_match_data(&client->dev);
> +	if (!controller)
> +		return -EINVAL;
> +
> +	display = devm_kzalloc(&client->dev, sizeof(*display), GFP_KERNEL);
> +	if (!display)
> +		return -ENOMEM;
> +
> +	display->client.i2c = client;
> +	display->dev = &client->dev;
> +	display->controller = controller;
> +
> +	i2c_set_clientdata(client, display);
> +
> +	ret = tm16xx_probe(display);
> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}
> +
> +static void tm16xx_i2c_remove(struct i2c_client *client)
> +{
> +	struct tm16xx_display *display = i2c_get_clientdata(client);
> +
> +	tm16xx_display_remove(display);
> +}
> +
> +// clang-format off

Drop

> +static const struct of_device_id tm16xx_i2c_of_match[] = {
> +	{ .compatible = "titanmec,tm1650", .data = &tm1650_controller },
> +	{ .compatible = "icore,aip650", .data = &tm1650_controller },
> +	{ .compatible = "fdhisi,fd650", .data = &tm1650_controller },
> +	{ .compatible = "fdhisi,fd6551", .data = &fd6551_controller },
> +	{ .compatible = "fdhisi,fd655", .data = &fd655_controller },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, tm16xx_i2c_of_match);
> +
> +static const struct i2c_device_id tm16xx_i2c_id[] = {
> +	{ "tm1650", 0 },
> +	{ "aip650", 0 },
> +	{ "fd650", 0 },
> +	{ "fd6551", 0 },
> +	{ "fd655", 0 },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(i2c, tm16xx_i2c_id);
> +// clang-format on

Drop.

> +
> +static struct i2c_driver tm16xx_i2c_driver = {
> +	.driver = {
> +		.name = TM16XX_DRIVER_NAME,
> +		.of_match_table = tm16xx_i2c_of_match,
> +	},
> +	.probe = tm16xx_i2c_probe,
> +	.remove = tm16xx_i2c_remove,
> +	.shutdown = tm16xx_i2c_remove,
> +	.id_table = tm16xx_i2c_id,
> +};
> +
> +static int __init tm16xx_init(void)
> +{
> +	int ret;
> +
> +	ret = spi_register_driver(&tm16xx_spi_driver);
> +	if (ret)
> +		return ret;
> +
> +	ret = i2c_add_driver(&tm16xx_i2c_driver);
> +	if (ret) {
> +		spi_unregister_driver(&tm16xx_spi_driver);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static void __exit tm16xx_exit(void)
> +{
> +	i2c_del_driver(&tm16xx_i2c_driver);
> +	spi_unregister_driver(&tm16xx_spi_driver);
> +}
> +
> +module_init(tm16xx_init);
> +module_exit(tm16xx_exit);


> +
> +MODULE_AUTHOR("Jean-François Lessard");
> +MODULE_DESCRIPTION("TM16XX Compatible LED Display Controllers");
> +MODULE_LICENSE("GPL");
> +MODULE_ALIAS("spi:tm16xx");
> +MODULE_ALIAS("i2c:tm16xx");

Drop these two.



Best regards,
Krzysztof

