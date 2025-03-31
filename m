Return-Path: <linux-leds+bounces-4383-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D7C0FA76C05
	for <lists+linux-leds@lfdr.de>; Mon, 31 Mar 2025 18:35:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 83B2216A476
	for <lists+linux-leds@lfdr.de>; Mon, 31 Mar 2025 16:35:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A530210186;
	Mon, 31 Mar 2025 16:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="GPUeFo9x"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-16.smtpout.orange.fr [80.12.242.16])
	(using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0785D2B9A8;
	Mon, 31 Mar 2025 16:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743438946; cv=none; b=td4U5/J60sB5rptiWPv+Ufxieq3WOk3v14phSPoTuDUNyq0d6CngL/ZhiSvXIxRNsY5w+dsk46xcO3vkp0zkEFALPJDFxan9Fv+41bhS99wQ+31xE5jDUvt3aMIuRGgjXD0LTrIWuj2Dr/HqhhEDdS/ZeR7F+k/UaxP3Kp9x+dY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743438946; c=relaxed/simple;
	bh=Y5jbM88MAgn3wl6VGv2T/3V8FXFl/Ja/r03cNLJAc9E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rf9MVPPzYDAt6qlzX3QEHaRUngGvAZi5F6GHCvPS51aH12FYSlScWokd1M9wui59Fn1iMmP+Dgopc+FkU/BapfEFysnTxEMjHh8Bt2JlYv6VV0T9KqcOC0Pshg3TMYmVrSL8RC+z+2qhDIVhNS+rAuFSWzF0jWABrLPMezCV6hY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=GPUeFo9x; arc=none smtp.client-ip=80.12.242.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from [192.168.1.37] ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id zI6htGlLKjmO8zI6ltQDaO; Mon, 31 Mar 2025 18:35:31 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1743438932;
	bh=lY7BeyveUH3AXOWViZpRYutnAaNNZPsSe/bRA8mdx0c=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=GPUeFo9xbQmzMQIIAaUMa7wDOXL3m658gUV3uNppLE896pHfTlFMG9rSARiJvzbwp
	 G2LOKluvti6Iau9HYX1trNfd4g4aav2Wo/6W6sMrh69AkfV3xLNXIwDASW/Cyp+mdC
	 jTEo8tXJV3Gw1FS6i4pWC9HxPrBlKaSzdpt7/CUnB+7gijjhWjOuT292OBaSpwF9AC
	 gg7i9e5ruTnW6q969Pnj0YLjuR4wVKekAxqowGhtcuOCvvdED5pHR1XtV50It4A1E2
	 R5dPVkZLUJJMPxkFhMn9myoI2WAEZjP8RxDIJmf5HfhzT4MQ0bin43DcNGItrvQ2xp
	 +DhYQq1mF9ASA==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Mon, 31 Mar 2025 18:35:32 +0200
X-ME-IP: 90.11.132.44
Message-ID: <3be3ca59-157d-4ceb-81bd-4a1acdbccb9c@wanadoo.fr>
Date: Mon, 31 Mar 2025 18:35:26 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] leds: tlc5928: Driver for the TI 16 Channel spi LED
 driver
To: Corentin Guillevic <corentin.guillevic@smile.fr>,
 Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
References: <20250326153535.158137-1-corentin.guillevic@smile.fr>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20250326153535.158137-1-corentin.guillevic@smile.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 26/03/2025 à 16:35, Corentin Guillevic a écrit :
> The TLC59928 is an SPI-connected bus controlled 16-channel LED driver.
> A single 16-bit register handles the whole LEDs. Following a write, a
> latch GPIO applies the new LED configuration. An "enable" GPIO (blank
> in the TLC59928 datasheet) turns off the whole LEDs when active/high.
> 
> This driver is able to handle a daisy-chain case, so when several
> TLC59928 controllers are connected in serie.
> 
> Signed-off-by: Corentin Guillevic <corentin.guillevic@smile.fr>
> ---

...

> +static int
> +tlc5928_set_ledout(struct tlc5928_led *led, bool val)
> +{
> +	struct tlc5928_chip *chip;
> +	struct tlc5928_chip *chip_owner = led->chip;
> +	struct tlc5928_priv *priv = chip_owner->priv;
> +	int ret;
> +
> +	mutex_lock(&priv->lock);
> +
> +	if (val)
> +		chip_owner->leds_state |= (1 << led->led_no);
> +	else
> +		chip_owner->leds_state &= ~(1 << led->led_no);
> +
> +	list_for_each_entry_reverse(chip, &priv->chips_list, list) {
> +		u16 leds_state = cpu_to_be16(chip->leds_state);
> +
> +		ret = spi_write(priv->spi, &(leds_state), sizeof(leds_state));
> +
> +		if (ret)

Missing unlock.
Or use guard()?

> +			return ret;
> +	}
> +
> +	gpiod_set_value(priv->latch_gpio, 0);
> +	udelay(1);
> +	gpiod_set_value(priv->latch_gpio, 1);
> +
> +	mutex_unlock(&priv->lock);
> +
> +	return 0;
> +}
> +
> +static int
> +tlc5928_brightness_set(struct led_classdev *led_cdev,
> +			enum led_brightness brightness)
> +{
> +	struct tlc5928_led *led = ldev_to_led(led_cdev);
> +
> +	/* TLC5928 only allows on/off, no brightness */
> +	return tlc5928_set_ledout(led, !!brightness);
> +}
> +
> +static const struct of_device_id of_tlc5928_leds_match[] __maybe_unused = {
> +	{ .compatible = "ti,tlc5928" },
> +	{},

Unneeded trailing ,

> +};
> +MODULE_DEVICE_TABLE(of, of_tlc5928_leds_match);
> +
> +static int tlc5928_probe_chip_dt(struct device *dev, struct device_node *node,
> +		struct tlc5928_chip *chip)
> +{
> +	struct device_node *child;
> +	int count, err, reg;
> +
> +	count = of_get_available_child_count(node);
> +	if (!count)
> +		return -EINVAL;
> +
> +	chip->leds_state = 0;
> +
> +	for_each_available_child_of_node(node, child) {

for_each_available_child_of_node_scoped()?

> +		struct tlc5928_led *led;
> +		struct led_init_data init_data = {};
> +
> +		init_data.fwnode = of_fwnode_handle(child);
> +
> +		err = of_property_read_u32(child, "reg", &reg);
> +		if (err) {
> +			dev_err(dev, "%pOF: failed to read reg\n", child);
> +			of_node_put(child);
> +			return err;
> +		}
> +
> +		if (reg < 0 || reg >= TLC5928_MAX_LEDS ||
> +				chip->leds[reg].active) {
> +			of_node_put(child);
> +			return -EINVAL;
> +		}
> +
> +		led = &chip->leds[reg];
> +
> +		led->active = true;
> +		led->chip = chip;
> +		led->led_no = reg;
> +		led->ldev.brightness_set_blocking = tlc5928_brightness_set;
> +		err = devm_led_classdev_register_ext(dev, &led->ldev,
> +							 &init_data);
> +		if (err < 0) {
> +			of_node_put(child);
> +			dev_err(dev, "Failed to register LED for node %pfw\n",
> +				init_data.fwnode);
> +			return err;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static int tlc5928_probe(struct spi_device *spi)
> +{
> +	struct device_node *node, *child;
> +	struct device *dev = &spi->dev;
> +	struct list_head *pos;
> +	struct tlc5928_chip *chip;
> +	struct tlc5928_priv *priv;
> +	int count, err, i;
> +
> +	node = dev_of_node(dev);
> +	if (!node)
> +		return -ENODEV;
> +
> +	count = of_get_available_child_count(node);
> +	if (!count)
> +		return -EINVAL;
> +
> +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	priv->spi = spi;
> +	priv->latch_gpio = devm_gpiod_get(dev, "latch", GPIOD_OUT_HIGH);
> +	if (IS_ERR(priv->latch_gpio))
> +		return dev_err_probe(dev, PTR_ERR(priv->latch_gpio),
> +				     "Failed to get latch GPIO\n");
> +
> +	mutex_init(&priv->lock);

Maybe:
err = devm_mutex_init(...);
if (err)
	return err;

?

> +	INIT_LIST_HEAD(&priv->chips_list);
> +
> +	i = 0;
> +	for_each_available_child_of_node(node, child) {
> +		chip = devm_kzalloc(dev, sizeof(*chip), GFP_KERNEL);
> +		if (!chip)
> +			return -ENOMEM;
> +
> +		list_add_tail(&chip->list, &priv->chips_list);
> +		chip->priv = priv;
> +		chip->enable_gpio = devm_gpiod_get_index_optional(dev, "enable", i,
> +				GPIOD_OUT_HIGH);
> +		if (IS_ERR(chip->enable_gpio)) {
> +			dev_err(dev, "Error getting enable GPIO %i property: %ld\n", i,
> +					PTR_ERR(chip->enable_gpio));
> +			return PTR_ERR(chip->enable_gpio);
> +		}
> +
> +		err = tlc5928_probe_chip_dt(dev, child, chip);
> +		if (err)
> +			return err;
> +
> +		i++;
> +	}
> +
> +	list_for_each(pos, &priv->chips_list) {

list_for_each_entry()?

> +		chip = container_of(pos, struct tlc5928_chip, list);
> +		if (chip->enable_gpio)
> +			gpiod_set_value(chip->enable_gpio, 0);
> +	}
> +
> +	spi_set_drvdata(spi, priv);
> +
> +	return 0;
> +}
> +
> +static int tlc5928_remove(struct spi_device *spi)
> +{
> +	struct list_head *pos;
> +	struct tlc5928_priv *priv = spi_get_drvdata(spi);
> +	int i;
> +
> +	list_for_each(pos, &priv->chips_list) {

list_for_each_entry()?

> +		struct tlc5928_chip *chip = container_of(pos, struct tlc5928_chip,
> +				list);
> +
> +		for (i = 0; i < TLC5928_MAX_LEDS; i++) {
> +			if (chip->leds[i].active)
> +				devm_led_classdev_unregister(&spi->dev,
> +					     &chip->leds[i].ldev);

Why is it needed?
devm_led_classdev_register_ext() was used.

> +		}
> +
> +		if (chip->enable_gpio) {
> +			gpiod_set_value(chip->enable_gpio, 1);
> +			gpiod_put(chip->enable_gpio);

Why is it needed?
devm_gpiod_get_index_optional() was used.

> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static const struct spi_device_id tlc5928_id[] = {
> +	{ "tlc5928" },
> +	{},

Unneeded trailing ,

> +};
> +MODULE_DEVICE_TABLE(spi, tlc5928_id);

...

CJ


