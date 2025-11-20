Return-Path: <linux-leds+bounces-6248-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 58357C73DF7
	for <lists+linux-leds@lfdr.de>; Thu, 20 Nov 2025 13:07:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id CC7A2354977
	for <lists+linux-leds@lfdr.de>; Thu, 20 Nov 2025 12:07:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FC3C32E756;
	Thu, 20 Nov 2025 12:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZC7OyiES"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71F77270541;
	Thu, 20 Nov 2025 12:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763640429; cv=none; b=P19e44CywwyCLOxHj1q8wBjZAIKmQ4ukPvSlKzKKkR7IaRxEjz1BNr49Xju0K1LwVvIkMo27ttHJSlVy98d0H8/KlJyksYlTkeSU801vVp5zhx6w/F6UaY98pdWSLUNIVbQphlPiY4Y8jKxe0T0sIVeV4jOmNQJr3FBVofa7JHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763640429; c=relaxed/simple;
	bh=jOAR/2OEg96v/OAxdeweZ7wHHbn/DqZmAgrJRgPLZYs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t2eO/1vpI0Sm64u1BGJpC894nxyG50EgOk5TMR9W5HJDhTA1evtUBEeohOnJtMSeUeJmeWNmxOAsXAO2Wr6yUdQ8YpW6up9YYuKE+Drjf8ZezTnaTo+HTSZNPXM9Q8k2Mtw7CgSm01SACcSZf9JCTWBuzyQcEyMb85nM+z55xDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZC7OyiES; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B969C4CEF1;
	Thu, 20 Nov 2025 12:07:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763640429;
	bh=jOAR/2OEg96v/OAxdeweZ7wHHbn/DqZmAgrJRgPLZYs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZC7OyiESbGr9mwSf9D+jJhYoN7Qc0qQcS8Lxvd8PxLZ9VhJqiV/2U1JOm2AtvaPnN
	 fRB2iWdNYdrvTEPeiiGws0ZVvsT14sE0S0F1JC/RKIUuvZMQwka6kBSqVr9fkV5MYl
	 XfIw3uOSeEROdwl3Qr6hmvT8XP6B6x1AHl/SoAYC0BqNpNQ0LrKsPVRVjjD2Shg3YB
	 /6FfM2+alMeyFd8M6JBB4B+1jZQvU82mIZQP5Y68N5rO6Uj9NiI66HX2k59BEE+e+c
	 mfxvmyb2YmoD8JCrxGYnNHr8iYz25H0WPFEW6PTefdkhTtqVfoK2tcwpU4emwtJqqF
	 J/03jinDvzqQw==
Date: Thu, 20 Nov 2025 12:07:04 +0000
From: Lee Jones <lee@kernel.org>
To: Lukas Timmermann <linux@timmermann.space>
Cc: pavel@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v10 2/2] leds: as3668: Driver for the ams Osram 4-channel
 i2c LED driver
Message-ID: <20251120120704.GC1949330@google.com>
References: <20251117020008.316648-1-linux@timmermann.space>
 <20251117020008.316648-3-linux@timmermann.space>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251117020008.316648-3-linux@timmermann.space>

On Mon, 17 Nov 2025, Lukas Timmermann wrote:

> Since there were no existing drivers for the AS3668 or related devices,
> a new driver was introduced in a separate file. Similar devices were
> reviewed, but none shared enough characteristics to justify code reuse.
> As a result, this driver is written specifically for the AS3668.
> 
> Signed-off-by: Lukas Timmermann <linux@timmermann.space>
> ---
>  MAINTAINERS                |   1 +
>  drivers/leds/Kconfig       |  13 +++
>  drivers/leds/Makefile      |   1 +
>  drivers/leds/leds-as3668.c | 222 +++++++++++++++++++++++++++++++++++++
>  4 files changed, 237 insertions(+)
>  create mode 100644 drivers/leds/leds-as3668.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 091206c54c63..945d78fef380 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -3511,6 +3511,7 @@ M:	Lukas Timmermann <linux@timmermann.space>
>  L:	linux-leds@vger.kernel.org
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/leds/ams,as3668.yaml
> +F:	drivers/leds/leds-as3668.c
>  
>  ASAHI KASEI AK7375 LENS VOICE COIL DRIVER
>  M:	Tianshu Qiu <tian.shu.qiu@intel.com>
> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> index a104cbb0a001..ec37d55ac14e 100644
> --- a/drivers/leds/Kconfig
> +++ b/drivers/leds/Kconfig
> @@ -100,6 +100,19 @@ config LEDS_ARIEL
>  
>  	  Say Y to if your machine is a Dell Wyse 3020 thin client.
>  
> +config LEDS_OSRAM_AMS_AS3668
> +	tristate "LED support for Osram AMS AS3668"
> +	depends on LEDS_CLASS
> +	depends on I2C
> +	help
> +	  This option enables support for the Osram AMS AS3668 LED controller.
> +	  The AS3668 provides up to four LED channels and is controlled via
> +	  the I2C bus. This driver offers basic brightness control for each
> +	  channel, without support for blinking or other advanced features.
> +
> +	  To compile this driver as a module, choose M here: the module
> +	  will be called leds-as3668.
> +
>  config LEDS_AW200XX
>  	tristate "LED support for Awinic AW20036/AW20054/AW20072/AW20108"
>  	depends on LEDS_CLASS
> diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
> index 2f170d69dcbf..983811384fec 100644
> --- a/drivers/leds/Makefile
> +++ b/drivers/leds/Makefile
> @@ -14,6 +14,7 @@ obj-$(CONFIG_LEDS_ADP5520)		+= leds-adp5520.o
>  obj-$(CONFIG_LEDS_AN30259A)		+= leds-an30259a.o
>  obj-$(CONFIG_LEDS_APU)			+= leds-apu.o
>  obj-$(CONFIG_LEDS_ARIEL)		+= leds-ariel.o
> +obj-$(CONFIG_LEDS_AS3668)		+= leds-as3668.o
>  obj-$(CONFIG_LEDS_AW200XX)		+= leds-aw200xx.o
>  obj-$(CONFIG_LEDS_AW2013)		+= leds-aw2013.o
>  obj-$(CONFIG_LEDS_BCM6328)		+= leds-bcm6328.o
> diff --git a/drivers/leds/leds-as3668.c b/drivers/leds/leds-as3668.c
> new file mode 100644
> index 000000000000..8c43429f2856
> --- /dev/null
> +++ b/drivers/leds/leds-as3668.c
> @@ -0,0 +1,222 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + *  Osram AMS AS3668 LED Driver IC
> + *
> + *  Copyright (C) 2025 Lukas Timmermann <linux@timmermann.space>
> + */
> +
> +#include <linux/bitfield.h>
> +#include <linux/i2c.h>
> +#include <linux/leds.h>
> +#include <linux/module.h>
> +#include <linux/uleds.h>
> +
> +#define AS3668_MAX_LEDS			4
> +
> +/* Chip Ident */
> +
> +#define AS3668_CHIP_ID1_REG		0x3e
> +#define AS3668_CHIP_ID			0xa5
> +
> +/* Current Control */
> +
> +#define AS3668_CURR_MODE_REG		0x01
> +#define AS3668_CURR_MODE_OFF		0x0
> +#define AS3668_CURR_MODE_ON		0x1
> +#define AS3668_CURR1_MODE_MASK		GENMASK(1, 0)
> +#define AS3668_CURR2_MODE_MASK		GENMASK(3, 2)
> +#define AS3668_CURR3_MODE_MASK		GENMASK(5, 4)
> +#define AS3668_CURR4_MODE_MASK		GENMASK(7, 6)
> +#define AS3668_CURR1_REG		0x02
> +#define AS3668_CURR2_REG		0x03
> +#define AS3668_CURR3_REG		0x04
> +#define AS3668_CURR4_REG		0x05
> +
> +struct as3668_led {
> +	struct led_classdev cdev;
> +	struct as3668 *chip;
> +	struct fwnode_handle *fwnode;
> +	int led_id;

If you stored AS3668_CURR{X}_MODE_MASK and AS3668_CURR1_REG + {X} in
here, you could omit led_id from here and save on a bunch of parameter
passing and additional handling (i.e. removal of the switch(), etc).

> +};
> +
> +struct as3668 {
> +	struct i2c_client *client;
> +	struct as3668_led leds[AS3668_MAX_LEDS];
> +};
> +
> +static void as3668_channel_mode_set(struct as3668 *as3668, int led_id, u8 mode)
> +{
> +	int err;
> +	u8 reg;
> +
> +	reg = i2c_smbus_read_byte_data(as3668->client, AS3668_CURR_MODE_REG);

Does CURR have anything to do with Current (amps)?

Either way 'reg' can be named better.

> +	if (reg < 0) {
> +		dev_err(&as3668->client->dev, "failed to read channel modes\n");
> +		return;
> +	}
> +
> +	switch (led_id) {
> +	case 0:
> +		reg &= ~AS3668_CURR1_MODE_MASK;
> +		reg |= FIELD_PREP(AS3668_CURR1_MODE_MASK, mode);
> +		break;
> +	case 1:
> +		reg &= ~AS3668_CURR2_MODE_MASK;
> +		reg |= FIELD_PREP(AS3668_CURR2_MODE_MASK, mode);
> +		break;
> +	case 2:
> +		reg &= ~AS3668_CURR3_MODE_MASK;
> +		reg |= FIELD_PREP(AS3668_CURR3_MODE_MASK, mode);
> +		break;
> +	case 3:
> +		reg &= ~AS3668_CURR4_MODE_MASK;
> +		reg |= FIELD_PREP(AS3668_CURR4_MODE_MASK, mode);
> +		break;
> +	default:
> +		return;
> +	}
> +
> +	err = i2c_smbus_write_byte_data(as3668->client, AS3668_CURR_MODE_REG, reg);

Either it's an error or it's not.  Why isn't it being propagated?

> +}
> +
> +static enum led_brightness as3668_brightness_get(struct led_classdev *cdev)
> +{
> +	struct as3668_led *led = container_of(cdev, struct as3668_led, cdev);
> +
> +	return i2c_smbus_read_byte_data(led->chip->client, AS3668_CURR1_REG + led->led_id);
> +}
> +
> +static void as3668_brightness_set(struct led_classdev *cdev, enum led_brightness brightness)
> +{
> +	struct as3668_led *led = container_of(cdev, struct as3668_led, cdev);
> +	int err;
> +
> +	if (brightness == 0)
> +		as3668_channel_mode_set(led->chip, led->led_id, AS3668_CURR_MODE_OFF);
> +	else
> +		as3668_channel_mode_set(led->chip, led->led_id, AS3668_CURR_MODE_ON);

If you take my advice further up, you can drop all of this for:

	as3668_channel_mode_set(led, !!brightness);

> +
> +	err = i2c_smbus_write_byte_data(led->chip->client,
> +					AS3668_CURR1_REG + led->led_id,
> +					brightness);
> +
> +	if (err)
> +		dev_err(&led->chip->client->dev, "failed to set brightness: %d\n", err);

cdev->dev

> +}
> +
> +static int as3668_dt_init(struct as3668 *as3668)
> +{
> +	struct device *dev = &as3668->client->dev;
> +	struct as3668_led *led;
> +	struct led_init_data init_data = {};
> +	int err;
> +	u32 reg;
> +
> +	for_each_available_child_of_node_scoped(dev_of_node(dev), child) {
> +		err = of_property_read_u32(child, "reg", &reg);
> +		if (err)
> +			return dev_err_probe(dev, err, "failed to read 'reg' property");
> +
> +		if (reg < 0 || reg > AS3668_MAX_LEDS)
> +			return dev_err_probe(dev, -EOPNOTSUPP,

This should be -EINVAL.

> +					     "unsupported LED: %d\n", reg);
> +
> +		led = &as3668->leds[reg];
> +		led->fwnode = of_fwnode_handle(child);
> +
> +		led->led_id = reg;
> +		led->chip = as3668;
> +
> +		led->cdev.max_brightness = U8_MAX;
> +		led->cdev.brightness_get = as3668_brightness_get;
> +		led->cdev.brightness_set = as3668_brightness_set;
> +
> +		init_data.fwnode = led->fwnode;
> +		init_data.default_label = ":";
> +
> +		err = devm_led_classdev_register_ext(dev, &led->cdev, &init_data);
> +		if (err)
> +			return dev_err_probe(dev, err, "failed to register LED %d\n", reg);
> +	}
> +
> +	return 0;
> +}
> +
> +static int as3668_probe(struct i2c_client *client)
> +{
> +	struct as3668 *as3668;
> +	int err;
> +	u8 chip_id;
> +
> +	chip_id = i2c_smbus_read_byte_data(client, AS3668_CHIP_ID1_REG);
> +	if (chip_id != AS3668_CHIP_ID)
> +		return dev_err_probe(&client->dev, -ENODEV,
> +				     "expected chip ID 0x%02x, got 0x%02x\n",
> +				     AS3668_CHIP_ID, chip_id);
> +
> +	as3668 = devm_kzalloc(&client->dev, sizeof(*as3668), GFP_KERNEL);
> +	if (!as3668)
> +		return -ENOMEM;
> +
> +	as3668->client = client;
> +
> +	err = as3668_dt_init(as3668);
> +	if (err)
> +		return err;
> +
> +	/* Set all four channel modes to 'off' */
> +	err = i2c_smbus_write_byte_data(client, AS3668_CURR_MODE_REG,
> +					FIELD_PREP(AS3668_CURR1_MODE_MASK, AS3668_CURR_MODE_OFF) |
> +					FIELD_PREP(AS3668_CURR2_MODE_MASK, AS3668_CURR_MODE_OFF) |
> +					FIELD_PREP(AS3668_CURR3_MODE_MASK, AS3668_CURR_MODE_OFF) |
> +					FIELD_PREP(AS3668_CURR4_MODE_MASK, AS3668_CURR_MODE_OFF));
> +
> +	/* Set initial currents to 0mA */
> +	err |= i2c_smbus_write_byte_data(client, AS3668_CURR1_REG, 0);
> +	err |= i2c_smbus_write_byte_data(client, AS3668_CURR2_REG, 0);
> +	err |= i2c_smbus_write_byte_data(client, AS3668_CURR3_REG, 0);
> +	err |= i2c_smbus_write_byte_data(client, AS3668_CURR4_REG, 0);
> +
> +	if (err)
> +		return dev_err_probe(&client->dev, -EIO, "failed to write to the device\n");

Failed to set zero initial current levels

> +	return 0;
> +}
> +
> +static void as3668_remove(struct i2c_client *client)
> +{
> +	int err;
> +
> +	err = i2c_smbus_write_byte_data(client, AS3668_CURR_MODE_REG, 0);
> +	if (err)
> +		dev_err(&client->dev, "failed to turn off the LEDs\n");

This is probably not useful to the user.

Just make an attempt to turn them off, then leave.

> +}
> +
> +static const struct i2c_device_id as3668_idtable[] = {
> +	{ "as3668" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(i2c, as3668_idtable);
> +
> +static const struct of_device_id as3668_match_table[] = {
> +	{ .compatible = "ams,as3668" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, as3668_match_table);
> +
> +static struct i2c_driver as3668_driver = {
> +	.driver = {
> +		.name = "leds_as3668",
> +		.of_match_table = as3668_match_table,
> +	},
> +	.probe = as3668_probe,
> +	.remove = as3668_remove,
> +	.id_table = as3668_idtable,
> +};
> +module_i2c_driver(as3668_driver);
> +
> +MODULE_AUTHOR("Lukas Timmermann <linux@timmermann.space>");
> +MODULE_DESCRIPTION("AS3668 LED driver");
> +MODULE_LICENSE("GPL");
> -- 
> 2.51.2
> 

-- 
Lee Jones [李琼斯]

