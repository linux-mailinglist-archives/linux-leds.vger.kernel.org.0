Return-Path: <linux-leds+bounces-5352-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C1DBB3F6FC
	for <lists+linux-leds@lfdr.de>; Tue,  2 Sep 2025 09:50:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 115801A857EC
	for <lists+linux-leds@lfdr.de>; Tue,  2 Sep 2025 07:51:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49C9E2E7185;
	Tue,  2 Sep 2025 07:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ipBE2LIi"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E24A2E62D4;
	Tue,  2 Sep 2025 07:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756799442; cv=none; b=q0fnTAjCs735FQvHShX2mfdhabjiDtbwBKzDLu79eO/odJhC7A9Go8FOPaVoMWoXx7anEOdxdxILqKyhQfst9DJ8AbT8XmsEoilwXz6o5RRAi9l9STef9Ov6InXKVvIMri98+yVO1G/UgkUiRJvnCfx3ggVjqGVWFdfdQ1fta4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756799442; c=relaxed/simple;
	bh=jUwejSsgbLEFI49DnF07gNccecyfLLhAlz1wMXuHxfY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M1YGyPAq7xxc9JZJ0BZJYdKeUT5Gn391gyWpvwGoTG3Mc9odO5ws8hwPOhwY2UQCAw+zF76wYU3XjBF+7SBwJEcTdCXSXMy4Z7t0jOuwlLagMqm2ZLadcmiAH1nBcN8Cz8gbDt7xyMzKxklii0PE8W4aQVWRM4jCk8h0rlPsRnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ipBE2LIi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E399CC4CEED;
	Tue,  2 Sep 2025 07:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756799441;
	bh=jUwejSsgbLEFI49DnF07gNccecyfLLhAlz1wMXuHxfY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ipBE2LIiSRLAcl0gv0asq3SiQvlpOF1ddHiCKBld7CAiMsYG8MfHPParsrUnz4Ieq
	 JxVivqSp1UQKVwx7c8bA+6qOIuZsyiu61Bzk5ABtXUxs5M3GJtfHOhc66J4tQwiHIF
	 PWFyVcq+Z0robyml+z/YszmRQRnk87kagkvoRITsSMKPrwyK3Bjma0NNnHFRxOqpOr
	 tbjZdWPoe8/S6tIjn2ktREdmm/VqbF+TVKBvtTccLJmLMSiHPy5AgvWtmZeQ1hc0rb
	 Wq0EpyBWOVQiqqd+O4jAKYlN72zooKkaFxcKhhcbosWLUFr7qfoX4Ju67vrhfHKDdL
	 Z62/tZjYyyN7g==
Date: Tue, 2 Sep 2025 08:50:37 +0100
From: Lee Jones <lee@kernel.org>
To: Lukas Timmermann <linux@timmermann.space>
Cc: pavel@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 2/2] leds: as3668: Driver for the ams Osram 4-channel
 i2c LED driver
Message-ID: <20250902075037.GA2163762@google.com>
References: <20250808213143.146732-1-linux@timmermann.space>
 <20250808213143.146732-3-linux@timmermann.space>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250808213143.146732-3-linux@timmermann.space>

On Fri, 08 Aug 2025, Lukas Timmermann wrote:

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
>  drivers/leds/leds-as3668.c | 202 +++++++++++++++++++++++++++++++++++++
>  4 files changed, 217 insertions(+)
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
> index a104cbb0a001..8cfb423ddf82 100644
> --- a/drivers/leds/Kconfig
> +++ b/drivers/leds/Kconfig
> @@ -100,6 +100,19 @@ config LEDS_ARIEL
>  
>  	  Say Y to if your machine is a Dell Wyse 3020 thin client.
>  
> +config LEDS_AS3668
> +	tristate "LED support for AMS AS3668"
> +	depends on LEDS_CLASS
> +	depends on I2C
> +	help
> +	  This option enables support for the AMS AS3668 LED controller.
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
> index 000000000000..0cfd3b68f90c
> --- /dev/null
> +++ b/drivers/leds/leds-as3668.c
> @@ -0,0 +1,202 @@
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
> +#define AS3668_MAX_LEDS 4
> +#define AS3668_EXPECTED_I2C_ADDR 0x42
> +
> +/* Chip Ident */
> +
> +#define AS3668_CHIP_ID1_REG 0x3e

Can you tab out all of the values please.

> +#define AS3668_CHIP_ID2_REG 0x3f
> +#define AS3668_CHIP_ID1_EXPECTED_IDENTIFIER 0xa5

This is odd.  What do you mean by expected?

What kind of ID is this?  Board ID, platform ID, Chip ID?

Call it that instead.

> +#define AS3668_CHIP_ID2_SERIAL_MASK GENMASK(7, 4)
> +#define AS3668_CHIP_ID2_REV_MASK GENMASK(3, 0)
> +
> +/* Current Control */
> +

The X thing (below) is weirding me out.

> +#define AS3668_CURRX_CONTROL_REG 0x01

Drop the X.

> +#define AS3668_CURR1_REG 0x02
> +#define AS3668_CURR2_REG 0x03
> +#define AS3668_CURR3_REG 0x04
> +#define AS3668_CURR4_REG 0x05

Are these not also a 'CONTROL' regs?

If not, what kind of regs are they?

> +#define AS3668_CURRX_MODE_ON 0x1
> +#define AS3668_CURRX_CURR1_MASK GENMASK(1, 0)
> +#define AS3668_CURRX_CURR2_MASK GENMASK(3, 2)
> +#define AS3668_CURRX_CURR3_MASK GENMASK(5, 4)
> +#define AS3668_CURRX_CURR4_MASK GENMASK(7, 6)

Drop the CURRX from each of these?

> +
> +struct as3668_led {
> +	struct led_classdev cdev;
> +	struct as3668 *chip;
> +	struct fwnode_handle *fwnode;
> +

The new line seems unnecessary.

> +	int led_id;
> +};
> +
> +struct as3668 {
> +	struct i2c_client *client;
> +	struct as3668_led leds[AS3668_MAX_LEDS];
> +};
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
> +
> +	int err = i2c_smbus_write_byte_data(led->chip->client,
> +					    AS3668_CURR1_REG + led->led_id,
> +					    brightness);
> +
> +	if (err)
> +		dev_err(&led->chip->client->dev, "error writing to reg 0x%02x, returned %d\n",
> +			AS3668_CURR1_REG + led->led_id, err);
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
> +			return dev_err_probe(dev, err, "'reg' property missing from %s\n",
> +					     child->name);
> +
> +		if (reg < 0 || reg > AS3668_MAX_LEDS)
> +			return dev_err_probe(dev, -EOPNOTSUPP,
> +					     "'reg' property in %s is out of scope: %d\n",
> +					     child->name, reg);
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
> +	u8 chip_ident, chip_subident, chip_serial, chip_rev;
> +
> +	/* Check for sensible i2c address */

I2C

"sensible" probably isn't the correct term here.

Actually, do we really need this comment?  What does it add?

> +	if (client->addr != AS3668_EXPECTED_I2C_ADDR)
> +		return dev_err_probe(&client->dev, -EFAULT,
> +				     "expected i2c address 0x%02x, got 0x%02x\n",

I2C

If we already know the I2C address - why is it being set elsewhere?

> +				     AS3668_EXPECTED_I2C_ADDR, client->addr);
> +
> +	/* Read identifier from chip */
> +	chip_ident = i2c_smbus_read_byte_data(client, AS3668_CHIP_ID1_REG);
> +
> +	if (chip_ident != AS3668_CHIP_ID1_EXPECTED_IDENTIFIER)
> +		return dev_err_probe(&client->dev, -ENODEV,
> +				     "expected chip identifier 0x%02x, got 0x%02x\n",
> +				     AS3668_CHIP_ID1_EXPECTED_IDENTIFIER, chip_ident);
> +
> +	chip_subident = i2c_smbus_read_byte_data(client, AS3668_CHIP_ID2_REG);
> +	chip_serial = FIELD_GET(AS3668_CHIP_ID2_SERIAL_MASK, chip_subident);
> +	chip_rev = FIELD_GET(AS3668_CHIP_ID2_REV_MASK, chip_subident);
> +
> +	/* Print out information about the chip */

This is definitely superfluous.

> +	dev_dbg(&client->dev,
> +		"chip_ident: 0x%02x | chip_subident: 0x%02x | chip_serial: 0x%02x | chip_rev: 0x%02x\n",
> +		chip_ident, chip_subident, chip_serial, chip_rev);

Does this have a role now that development is over?

Is the user going to care about all this stuff?

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
> +	/* Set all four channel modes to 'on' */
> +	err = i2c_smbus_write_byte_data(client, AS3668_CURRX_CONTROL_REG,
> +					FIELD_PREP(AS3668_CURRX_CURR1_MASK, AS3668_CURRX_MODE_ON) |
> +					FIELD_PREP(AS3668_CURRX_CURR2_MASK, AS3668_CURRX_MODE_ON) |
> +					FIELD_PREP(AS3668_CURRX_CURR3_MASK, AS3668_CURRX_MODE_ON) |
> +					FIELD_PREP(AS3668_CURRX_CURR4_MASK, AS3668_CURRX_MODE_ON));
> +
> +	/* Set initial currents to 0mA */
> +	err |= i2c_smbus_write_byte_data(client, AS3668_CURR1_REG, 0);
> +	err |= i2c_smbus_write_byte_data(client, AS3668_CURR2_REG, 0);
> +	err |= i2c_smbus_write_byte_data(client, AS3668_CURR3_REG, 0);
> +	err |= i2c_smbus_write_byte_data(client, AS3668_CURR4_REG, 0);
> +
> +	if (err)
> +		return dev_err_probe(&client->dev, -EIO, "error during hardware initialization\n");

"Failed to write to the device"?

> +
> +	return 0;
> +}
> +
> +static void as3668_remove(struct i2c_client *client)
> +{
> +	int err = i2c_smbus_write_byte_data(client, AS3668_CURRX_CONTROL_REG, 0);

Do this after declaration please.

> +
> +	if (err)
> +		dev_err(&client->dev, "couldn't deinit device\n");

"deinit" is not a word.

Please expand slang and shortened words in comments and user-facing messages.

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
> 2.50.1
> 
> 

-- 
Lee Jones [李琼斯]

