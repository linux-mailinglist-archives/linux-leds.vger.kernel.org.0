Return-Path: <linux-leds+bounces-6378-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 12DB5CA479E
	for <lists+linux-leds@lfdr.de>; Thu, 04 Dec 2025 17:27:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E346230253F2
	for <lists+linux-leds@lfdr.de>; Thu,  4 Dec 2025 16:26:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4109B304BDE;
	Thu,  4 Dec 2025 16:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="xIzMhK6m"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D052BE5E
	for <linux-leds@vger.kernel.org>; Thu,  4 Dec 2025 16:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764865047; cv=none; b=bdkBhC4tzQFBc24q3kH3krRjFpp98RgfcVPWaQjHvqIZ3W92Mn43XGt8PeP/2lqizjeG9DiKxPtaZpanJplGpZuxcSKsYY3oGfsSRsM9/vTp102Eo93ZVvxLsHS+rb2/wPipoKFZJxxWVYdrZ29P3Y5PcBydpeGkmTiQYrr67rM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764865047; c=relaxed/simple;
	bh=XtTJ7qlXuDJZzj6VLw1zDRFC4g0AQQg/n2a5j599URk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kfk6Lh3BNSZ11s9TaYp/F8eenTvsfQJLjDWIabCxmTkbV8A1F5pQoAYmsnYBqfYsIzv1Yt2cT1JPVRXIqhCVTcx4AjAYgJS/A8S3Usp4VO7zqteCb7FAO7JoTECcHGPvmTcKoSt3zECYls9d8Y7M4Is//qrF4xpZm2MmECY2VC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=xIzMhK6m; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4777771ed1aso9367085e9.2
        for <linux-leds@vger.kernel.org>; Thu, 04 Dec 2025 08:17:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1764865043; x=1765469843; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aNxmDbbdKqIboODXWdbYm3bL1ySA2CUYBdNtl6MTmVk=;
        b=xIzMhK6mdKE8AZFhegE2U3apHkZsGQsNRA+AbpxmLDyCmI9jFafNpslA4GETdaHUjv
         U8oyp/BJMjmElxLdh87V8KxlJ6NZbRq7fqGZ5qrDkHU/C8kqJVWdKfJGzsnUvhwp+aV1
         dRItVdGs2QW7Kb5ZubF3/5Dm0J5VhlAhKh57eZBQZGORtLzXz4O0S5hRK256OLB0Bth7
         7CcEuv1lIxpy/3c7Jo9nZAQGHCaj7y8gadsv4CcojVsPFFohEyvXltigLJTXDPoy+mSj
         Z0O0f4oag7FvkkvuREaNlHAccDv99tsDbJIYbNsYWg+FZ0F5UcDxX82gPnHFsPNzBLgp
         zt0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764865043; x=1765469843;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aNxmDbbdKqIboODXWdbYm3bL1ySA2CUYBdNtl6MTmVk=;
        b=E/FYI/a4MgMn94Xy+01oCJQghlgspo4CSfrmYDj11I3eU9DtNiem3L0sD/K745gO64
         sdI8l6305+F25wQ6a8tNunyOryC57qhGBvao2m2RMqo7mT6iJkgRGozpnx5AGCliO1fn
         sArNgn3n6awLDAuZQBIgaQrG8SNJ2xX5zVvz6fHadhxv0MXhSgGHw0lYABLdfZQiDDGD
         5hPJLL03MtIAVNsdTA9HyR+sLadBwbu4AtP5/RPhs0t9MIxP+9yxZ23wG53gUokEw+yD
         d4dL1eTWlIhX/P/7dA8b9Jz3IlWWBzI6AEdOJbhTet1Gf06FStR/M889Ne8zClfYFfNJ
         mHuQ==
X-Forwarded-Encrypted: i=1; AJvYcCURWEoPMg6UsOYK5dKDDzs4VnLRsJF8ccGXzMzLYUS7f2i58ZG8usSjGgTvIRcWpIGqumuJ45IBkv2x@vger.kernel.org
X-Gm-Message-State: AOJu0YyroneIP0jzR4q3j6mYOL8LiHVO+RW3oCh4CHo+ojkHOpJRyqg+
	MKcPpCo5leSR3zneRT7/sNse4dblhgmEpxZsSuIj7PI1UF+DDI2hLuUYuyIW2NHKzzc=
X-Gm-Gg: ASbGncsVN3cu0xb8jJZ1Qa3p0CONPvG0fwL3ZoWJP8DU+p0f/CTcKAYoqD22kZZPU2z
	sgEr6qbPOWj5phULbDdrdrBKBp+Qtk9bM47d8Hhhnd04iGkZR+LAB1p0g3ri5xCQO0SsQUfPPGv
	QHVjqdCo8WUz4NAGnlEwrgqmBTwWZE0lJF42IifxX/vJcuwL8nx/lcW8XbRyueoUnsxvOO+wH8w
	5CkfjqZMWChaHR2cS7zUpsp7jZ8Oul4iTU4T5W1lBL6Tol6VlSwZIc0ZRAkvFt+i+OWPEit2BpJ
	ZGRFk9QuYAN71i4raAkSENZ+ZgsEwPWMrAG/gIw8uRCwNtM62/oeBER4rQ0Do3OBMKmxXiWXp0Q
	8bpfxsnHJQNB0rMvRNhQXm9J7ZWOVXjIeuInpNgqOiMVLnX9kV49JDzMXqllIraWVkz9HzUOljk
	JL1EV7DwQtA6eQSsxEKWSxlppHEVQWXpn0rD2tAtM17fGBz3BSCM0zClFNxOlBYE85kxT9Nw==
X-Google-Smtp-Source: AGHT+IH6HRzgtWVSRwk2pLy54f/ZcykaKll9/7ioHYJyiAfAQ0RExVb1Rrhx4JL/zXiO1Ib8Xi1u/g==
X-Received: by 2002:a05:600c:310c:b0:477:7b9a:bb0a with SMTP id 5b1f17b1804b1-4792af34a44mr65294315e9.21.1764865043101;
        Thu, 04 Dec 2025 08:17:23 -0800 (PST)
Received: from aspen.lan (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42f7d353f8bsm4033746f8f.43.2025.12.04.08.17.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Dec 2025 08:17:22 -0800 (PST)
Date: Thu, 4 Dec 2025 16:17:20 +0000
From: Daniel Thompson <daniel@riscstar.com>
To: maudspierings@gocontroll.com
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, dri-devel@lists.freedesktop.org,
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v6 2/4] backlight: add max25014atg backlight
Message-ID: <aTG0EK_zuSB-U_bb@aspen.lan>
References: <20251201-max25014-v6-0-88e3ac8112ff@gocontroll.com>
 <20251201-max25014-v6-2-88e3ac8112ff@gocontroll.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251201-max25014-v6-2-88e3ac8112ff@gocontroll.com>

On Mon, Dec 01, 2025 at 12:53:21PM +0100, Maud Spierings via B4 Relay wrote:
> From: Maud Spierings <maudspierings@gocontroll.com>
>
> The Maxim MAX25014 is a 4-channel automotive grade backlight driver IC
> with integrated boost controller.
>
> Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>

> <snip>

> +static int max25014_check_errors(struct max25014 *maxim)
> +{
> +	uint32_t val;
> +	uint8_t i;
> +	int ret;
> +
> +	ret = regmap_read(maxim->regmap, MAX25014_OPEN, &val);
> +	if (ret)
> +		return ret;
> +	if (val) {
> +		dev_err(&maxim->client->dev, "Open led strings detected on:\n");
> +		for (i = 0; i < 4; i++) {
> +			if (val & 1 << i)
> +				dev_err(&maxim->client->dev, "string %d\n", i + 1);
> +		}
> +		return -EIO;
> +	}
> +
> +	ret = regmap_read(maxim->regmap, MAX25014_SHORT_GND, &val);
> +	if (ret)
> +		return ret;
> +	if (val) {
> +		dev_err(&maxim->client->dev, "Short to ground detected on:\n");
> +		for (i = 0; i < 4; i++) {
> +			if (val & 1 << i)
> +				dev_err(&maxim->client->dev, "string %d\n", i + 1);
> +		}
> +		return -EIO;
> +	}
> +
> +	ret = regmap_read(maxim->regmap, MAX25014_SHORT_GND, &val);

Shouldn't this be MAX25014_SHORT_LED?


> +	if (ret)
> +		return ret;
> +	if (val) {
> +		dev_err(&maxim->client->dev, "Shorted led detected on:\n");
> +		for (i = 0; i < 4; i++) {
> +			if (val & 1 << i)
> +				dev_err(&maxim->client->dev, "string %d\n", i + 1);
> +		}
> +		return -EIO;
> +	}
> +
> +	ret = regmap_read(maxim->regmap, MAX25014_DIAG, &val);
> +	if (ret)
> +		return ret;
> +	/*
> +	 * The HW_RST bit always starts at 1 after power up.
> +	 * It is reset on first read, does not indicate an error.
> +	 */
> +	if (val && val != MAX25014_DIAG_HW_RST) {
> +		if (val & MAX25014_DIAG_OT)
> +			dev_err(&maxim->client->dev,
> +				"Overtemperature shutdown\n");
> +		if (val & MAX25014_DIAG_OTW)
> +			dev_err(&maxim->client->dev,
> +				 "Chip is getting too hot (>125C)\n");
> +		if (val & MAX25014_DIAG_BSTOV)
> +			dev_err(&maxim->client->dev,
> +				"Boost converter overvoltage\n");
> +		if (val & MAX25014_DIAG_BSTUV)
> +			dev_err(&maxim->client->dev,
> +				"Boost converter undervoltage\n");
> +		if (val & MAX25014_DIAG_IREFOOR)
> +			dev_err(&maxim->client->dev, "IREF out of range\n");
> +		return -EIO;
> +	}
> +	return 0;
> +}
> +
> +/*
> + * 1. disable unused strings
> + * 2. set dim mode
> + * 3. set setting register
> + * 4. enable the backlight
> + */
> +static int max25014_configure(struct max25014 *maxim, int initial_state)
> +{
> +	uint32_t val;
> +	int ret;
> +
> +	/*
> +	 * Strings can only be disabled when MAX25014_ISET_ENA == 0, check if
> +	 * it needs to be changed at all to prevent the backlight flashing when
> +	 * it is configured correctly by the bootloader
> +	 */

Attach the comment to the if statement rather than the read.


> +	ret = regmap_read(maxim->regmap, MAX25014_DISABLE, &val);
> +	if (ret)
> +		return ret;
> +
> +	if (!((val & MAX25014_DISABLE_DIS_MASK) == maxim->strings_mask)) {
> +		if (initial_state == BACKLIGHT_POWER_ON) {
> +			ret = regmap_write(maxim->regmap, MAX25014_ISET, 0);
> +			if (ret)
> +				return ret;
> +		}
> +		ret = regmap_write(maxim->regmap, MAX25014_DISABLE, maxim->strings_mask);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	ret = regmap_write(maxim->regmap, MAX25014_IMODE, MAX25014_IMODE_HDIM);
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_read(maxim->regmap, MAX25014_SETTING, &val);
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_write(maxim->regmap, MAX25014_SETTING,
> +			   val & ~MAX25014_SETTING_FPWM);
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_write(maxim->regmap, MAX25014_ISET,
> +			   maxim->iset | MAX25014_ISET_ENA |
> +			   MAX25014_ISET_PSEN);
> +	return ret;
> +}
> +
> +static int max25014_update_status(struct backlight_device *bl_dev)
> +{
> +	struct max25014 *maxim = bl_get_data(bl_dev);
> +	uint32_t reg;
> +	int ret;
> +
> +	if (backlight_is_blank(maxim->bl))
> +		bl_dev->props.brightness = 0;

This isn't right. Why would you change the backlight level just because
it is currently blanked (and sorry I missed this one last time).

> +
> +	reg  = TON_STEP * bl_dev->props.brightness;

The correct way to honour blanking is just go call
backlight_get_brightness() instead of reading the property directly.


> +
> +	/*
> +	 * 18 bit number lowest, 2 bits in first register,
> +	 * next lowest 8 in the L register, next 8 in the H register
> +	 * Seemingly setting the strength of only one string controls all of
> +	 * them, individual settings don't affect the outcome.
> +	 */
> +
> +	ret = regmap_write(maxim->regmap, MAX25014_TON_1_4_LSB, reg & 0b00000011);
> +	if (ret != 0)
> +		return ret;
> +	ret = regmap_write(maxim->regmap, MAX25014_TON1L, (reg >> 2) & 0b11111111);
> +	if (ret != 0)
> +		return ret;
> +	return regmap_write(maxim->regmap, MAX25014_TON1H, (reg >> 10) & 0b11111111);
> +}
> +
> +static const struct backlight_ops max25014_bl_ops = {
> +	.options = BL_CORE_SUSPENDRESUME,
> +	.update_status = max25014_update_status,
> +};
> +
> +static int max25014_parse_dt(struct max25014 *maxim,
> +			     uint32_t *initial_brightness)
> +{
> +	struct device *dev = &maxim->client->dev;
> +	struct device_node *node = dev->of_node;
> +	struct fwnode_handle *child;
> +	uint32_t strings[4];
> +	int res, i;
> +
> +	if (!node)
> +		return dev_err_probe(dev, -EINVAL, "no platform data\n");
> +
> +	child = device_get_next_child_node(dev, NULL);
> +	if (child) {
> +		res = fwnode_property_count_u32(child, "led-sources");
> +		if (res > 0) {
> +			fwnode_property_read_u32_array(child, "led-sources",
> +						       strings, res);
> +
> +			/* set all strings as disabled, then enable those in led-sources*/
> +			maxim->strings_mask = 0xf;
> +			for (i = 0; i < res; i++) {
> +				if (strings[i] <= 4)
> +					maxim->strings_mask &= ~BIT(strings[i]);
> +			}
> +		}
> +
> +		fwnode_property_read_u32(child, "default-brightness",
> +					 initial_brightness);
> +
> +		fwnode_handle_put(child);
> +	}
> +
> +	maxim->iset = MAX25014_ISET_DEFAULT_100;
> +	of_property_read_u32(node, "maxim,iset", &maxim->iset);
> +
> +	if (maxim->iset > 15)
> +		return dev_err_probe(dev, -EINVAL,
> +				     "Invalid iset, should be a value from 0-15, entered was %d\n",
> +				     maxim->iset);
> +
> +	if (*initial_brightness > 100)
> +		return dev_err_probe(dev, -EINVAL,
> +				     "Invalid initial brightness, should be a value from 0-100, entered was %d\n",
> +				     *initial_brightness);
> +
> +	return 0;
> +}
> +
> +static int max25014_probe(struct i2c_client *cl)
> +{
> +	const struct i2c_device_id *id = i2c_client_get_device_id(cl);
> +	struct backlight_properties props;
> +	uint32_t initial_brightness = 50;
> +	struct backlight_device *bl;
> +	struct max25014 *maxim;
> +	int ret;
> +
> +	maxim = devm_kzalloc(&cl->dev, sizeof(struct max25014), GFP_KERNEL);
> +	if (!maxim)
> +		return -ENOMEM;
> +
> +	maxim->client = cl;
> +
> +	ret = max25014_parse_dt(maxim, &initial_brightness);
> +	if (ret)
> +		return ret;
> +
> +	maxim->vin = devm_regulator_get(&maxim->client->dev, "power");
> +	if (IS_ERR(maxim->vin)) {
> +		return dev_err_probe(&maxim->client->dev, PTR_ERR(maxim->vin),
> +				     "failed to get power-supply");
> +	}
> +
> +	ret = regulator_enable(maxim->vin);
> +	if (ret)
> +		return dev_err_probe(&maxim->client->dev, ret,
> +			"failed to enable power-supply\n");

Can this use devm_regulator_get_enable()?


> +
> +	maxim->enable = devm_gpiod_get_optional(&maxim->client->dev, "enable",
> +						GPIOD_OUT_HIGH);
> +	if (IS_ERR(maxim->enable)) {
> +		ret = dev_err_probe(&maxim->client->dev, PTR_ERR(maxim->enable),
> +				    "failed to get enable gpio\n");
> +		goto disable_vin;
> +	}
> +
> +	/* Datasheet Electrical Characteristics tSTARTUP 2ms */
> +	fsleep(2000);
> +
> +	maxim->regmap = devm_regmap_init_i2c(cl, &max25014_regmap_config);
> +	if (IS_ERR(maxim->regmap)) {
> +		ret = dev_err_probe(&maxim->client->dev, PTR_ERR(maxim->regmap),
> +			"failed to initialize the i2c regmap\n");
> +		goto disable_full;
> +	}
> +
> +	i2c_set_clientdata(cl, maxim);
> +
> +	ret = max25014_check_errors(maxim);
> +	if (ret) { /* error is already reported in the above function */
> +		goto disable_full;
> +	}
> +
> +	ret = max25014_initial_power_state(maxim);
> +	if (ret < 0) {
> +		dev_err_probe(&maxim->client->dev, ret, "Could not get enabled state\n");
> +		goto disable_full;
> +	}
> +
> +	memset(&props, 0, sizeof(struct backlight_properties));
> +	props.type = BACKLIGHT_PLATFORM;
> +	props.max_brightness = MAX_BRIGHTNESS;
> +	props.brightness = initial_brightness;
> +	props.scale = BACKLIGHT_SCALE_LINEAR;
> +	props.power = ret;
> +
> +	ret = max25014_configure(maxim, ret);
> +	if (ret) {
> +		dev_err_probe(&maxim->client->dev, ret, "device config error");
> +		goto disable_full;
> +	}
> +
> +	bl = devm_backlight_device_register(&maxim->client->dev, id->name,
> +					    &maxim->client->dev, maxim,
> +					    &max25014_bl_ops, &props);
> +	if (IS_ERR(bl)) {
> +		ret = dev_err_probe(&maxim->client->dev, PTR_ERR(bl),
> +				    "failed to register backlight\n");
> +		goto disable_full;
> +	}
> +
> +	maxim->bl = bl;
> +
> +	backlight_update_status(maxim->bl);
> +
> +	return 0;
> +
> +disable_full:
> +	gpiod_set_value_cansleep(maxim->enable, 0);

Why is this needed? It was only ever set by devm_gpiod_get_optional().

> +disable_vin:
> +	regulator_disable(maxim->vin);

This is also not needed if you use devm_regulator_get_enable().


> +	return ret;
> +}


Daniel.

