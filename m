Return-Path: <linux-leds+bounces-3635-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 431069F508E
	for <lists+linux-leds@lfdr.de>; Tue, 17 Dec 2024 17:13:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6F8B47AA1F2
	for <lists+linux-leds@lfdr.de>; Tue, 17 Dec 2024 16:10:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6904F1FBEAA;
	Tue, 17 Dec 2024 15:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Byuv3fSf"
X-Original-To: linux-leds@vger.kernel.org
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2ED61FBEA8;
	Tue, 17 Dec 2024 15:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734451032; cv=none; b=IKITH5qoqEcnGG0F2zBnvJtqRdl7tazD/IawSfBBDJKEyDOvE7rJFHcTn0Yl3/R9uBlkM+zBYNGnBw2VV6DCahVn9tdPwlDl5/3bZ/cKxElwOMzr6RDX0Zhez9FTL1m6J72ypkWqIBkftTmcw737BoU7zcPb45klb8TR7r8O7Rg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734451032; c=relaxed/simple;
	bh=3nO3LPfbB9KEAmlbYzZKlo5cryE4gyZbil4LEs5QFC0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=HouIRyfPugcpLxEggbRWedifn4s4jluBoiIaFpr6TWZTuNUSpGgyi7U8b1QjozwwxbFTuQ6D3hp62ev2fP16RXGSJEu00ER1wNIEkM8ll51l95HLYB99eJ+2JPAOIMAoUDZPpbh8b2RWO/EkKkkc6K/113o8BwnRP+QHwR7QeXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=Byuv3fSf; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 4BHFuoVN025962
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 17 Dec 2024 09:56:50 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1734451010;
	bh=UGeiJKnAhgpVTPvUacMnuLnYh9kTlMuDIuvWegvk4T0=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=Byuv3fSf2zG4wQeGZaCPHplIC+wohUdacAG4GT1U1IrwNuUIIG03zepPyDVt/YwV7
	 DBe4fliqpxzvCUv2FO7K/FFaGGu31pxPo4Gl1ntaw/NmCpA3bngoY+qepGuoB94W6R
	 J5ztbRvdnD53ffd1nKWStUmPftbCPrf0XTky5O+Q=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4BHFuor0001793
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 17 Dec 2024 09:56:50 -0600
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 17
 Dec 2024 09:56:49 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 17 Dec 2024 09:56:49 -0600
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4BHFunb3066883;
	Tue, 17 Dec 2024 09:56:49 -0600
Message-ID: <b0e2e061-0a1f-4cba-9f25-b26769e8ff27@ti.com>
Date: Tue, 17 Dec 2024 09:56:49 -0600
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] leds: lp8864: New driver
To: "A. Sverdlin" <alexander.sverdlin@siemens.com>,
        <linux-leds@vger.kernel.org>, <devicetree@vger.kernel.org>
CC: <dri-devel@lists.freedesktop.org>, Lee Jones <lee@kernel.org>,
        Daniel
 Thompson <danielt@kernel.org>,
        Jingoo Han <jingoohan1@gmail.com>, Pavel
 Machek <pavel@ucw.cz>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
References: <20241217133713.326853-1-alexander.sverdlin@siemens.com>
 <20241217133713.326853-3-alexander.sverdlin@siemens.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20241217133713.326853-3-alexander.sverdlin@siemens.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On 12/17/24 7:37 AM, A. Sverdlin wrote:
> From: Alexander Sverdlin <alexander.sverdlin@siemens.com>
> 
> Add driver for TI LP8864, LP8864S, LP8866 4/6 channel LED-backlight drivers
> with I2C interface.
> 
> Link: https://www.ti.com/lit/gpn/lp8864-q1
> Link: https://www.ti.com/lit/gpn/lp8864s-q1
> Link: https://www.ti.com/lit/gpn/lp8866-q1
> Link: https://www.ti.com/lit/gpn/lp8866s-q1
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
> ---
> Changelog:
> v4:
> - better separated comments from register defines
> - removed NULL from fault text arrays for two regs with odd-even structure
> - changed HW fault printf from errors to warnings
> - renamed "buf" -> "val"
> - reflowed the code with up to 100 symbols per line
> - added comments for 8<->16-bit linear scaling in set/get callbacks
> - removed register names from error messages
> v3:
> - dropped lp8864_init(), REGCACHE_NONE, %pe in dev_err_probe(),
>    i2c_set_clientdata()
> - added devm_add_action_or_reset() return value check, dev_err_probe() after
>    devm_regmap_init_i2c()
> v2: no changes
> 
>   MAINTAINERS                |   7 +
>   drivers/leds/Kconfig       |  12 ++
>   drivers/leds/Makefile      |   1 +
>   drivers/leds/leds-lp8864.c | 296 +++++++++++++++++++++++++++++++++++++
>   4 files changed, 316 insertions(+)
>   create mode 100644 drivers/leds/leds-lp8864.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index b332995b3350..d4268a3bbc5a 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -23322,6 +23322,13 @@ S:	Supported
>   F:	Documentation/devicetree/bindings/iio/dac/ti,dac7612.yaml
>   F:	drivers/iio/dac/ti-dac7612.c
>   
> +TEXAS INSTRUMENTS' LB8864 LED BACKLIGHT DRIVER
> +M:	Alexander Sverdlin <alexander.sverdlin@siemens.com>
> +L:	linux-leds@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/leds/backlight/ti,lp8864.yaml
> +F:	drivers/leds/leds-lp8864.c
> +
>   TEXAS INSTRUMENTS' SYSTEM CONTROL INTERFACE (TISCI) PROTOCOL DRIVER
>   M:	Nishanth Menon <nm@ti.com>
>   M:	Tero Kristo <kristo@kernel.org>
> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> index 3bf51a4e01d7..5dde8f46100c 100644
> --- a/drivers/leds/Kconfig
> +++ b/drivers/leds/Kconfig
> @@ -513,6 +513,18 @@ config LEDS_LP8860
>   	  on the LP8860 4 channel LED driver using the I2C communication
>   	  bus.
>   
> +config LEDS_LP8864
> +	tristate "LED support for the TI LP8864/LP8866 4/6 channel LED drivers"
> +	depends on LEDS_CLASS && I2C && OF
> +	select REGMAP_I2C
> +	help
> +	  If you say yes here you get support for the TI LP8864-Q1,
> +	  LP8864S-Q1, LP8866-Q1, LP8866S-Q1 4/6 channel LED backlight
> +	  drivers with I2C interface.
> +
> +	  To compile this driver as a module, choose M here: the
> +	  module will be called leds-lp8864.
> +
>   config LEDS_CLEVO_MAIL
>   	tristate "Mail LED on Clevo notebook"
>   	depends on LEDS_CLASS && BROKEN
> diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
> index e7982938ddc1..8a2caa48343b 100644
> --- a/drivers/leds/Makefile
> +++ b/drivers/leds/Makefile
> @@ -57,6 +57,7 @@ obj-$(CONFIG_LEDS_LP55XX_COMMON)	+= leds-lp55xx-common.o
>   obj-$(CONFIG_LEDS_LP8501)		+= leds-lp8501.o
>   obj-$(CONFIG_LEDS_LP8788)		+= leds-lp8788.o
>   obj-$(CONFIG_LEDS_LP8860)		+= leds-lp8860.o
> +obj-$(CONFIG_LEDS_LP8864)		+= leds-lp8864.o
>   obj-$(CONFIG_LEDS_LT3593)		+= leds-lt3593.o
>   obj-$(CONFIG_LEDS_MAX5970)		+= leds-max5970.o
>   obj-$(CONFIG_LEDS_MAX77650)		+= leds-max77650.o
> diff --git a/drivers/leds/leds-lp8864.c b/drivers/leds/leds-lp8864.c
> new file mode 100644
> index 000000000000..9ee9e5e0df3c
> --- /dev/null
> +++ b/drivers/leds/leds-lp8864.c
> @@ -0,0 +1,296 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * TI LP8864/LP8866 4/6 Channel LED Driver
> + *
> + * Copyright (C) 2024 Siemens AG
> + *
> + * Based on LP8860 driver by Dan Murphy <dmurphy@ti.com>
> + */
> +
> +#include <linux/gpio/consumer.h>
> +#include <linux/i2c.h>
> +#include <linux/init.h>
> +#include <linux/leds.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/of.h>
> +#include <linux/regmap.h>
> +#include <linux/regulator/consumer.h>
> +#include <linux/slab.h>
> +
> +#define LP8864_BRT_CONTROL		0x00
> +#define LP8864_USER_CONFIG1		0x04
> +#define   LP8864_BRT_MODE_MASK		GENMASK(9, 8)
> +#define   LP8864_BRT_MODE_REG		BIT(9)		/* Brightness control by DISPLAY_BRT reg */
> +#define LP8864_SUPPLY_STATUS		0x0e
> +#define LP8864_BOOST_STATUS		0x10
> +#define LP8864_LED_STATUS		0x12
> +#define   LP8864_LED_STATUS_WR_MASK	GENMASK(14, 9	/* Writeable bits in the LED_STATUS reg */

Missing the closing ) ?

> +
> +/* Textual meaning for status bits, starting from bit 1 */
> +static const char *const lp8864_supply_status_msg[] = {
> +	"Vin under-voltage fault",
> +	"Vin over-voltage fault",
> +	"Vdd under-voltage fault",
> +	"Vin over-current fault",
> +	"Missing charge pump fault",
> +	"Charge pump fault",
> +	"Missing boost sync fault",
> +	"CRC error fault ",
> +};
> +
> +/* Textual meaning for status bits, starting from bit 1 */
> +static const char *const lp8864_boost_status_msg[] = {
> +	"Boost OVP low fault",
> +	"Boost OVP high fault",
> +	"Boost over-current fault",
> +	"Missing boost FSET resistor fault",
> +	"Missing MODE SEL resistor fault",
> +	"Missing LED resistor fault",
> +	"ISET resistor short to ground fault",
> +	"Thermal shutdown fault",
> +};
> +
> +/* Textual meaning for every register bit */
> +static const char *const lp8864_led_status_msg[] = {
> +	"LED 1 fault",
> +	"LED 2 fault",
> +	"LED 3 fault",
> +	"LED 4 fault",
> +	"LED 5 fault",
> +	"LED 6 fault",
> +	"LED open fault",
> +	"LED internal short fault",
> +	"LED short to GND fault",
> +	NULL, NULL, NULL,
> +	"Invalid string configuration fault",
> +	NULL,
> +	"I2C time out fault",
> +};
> +
> +/**
> + * struct lp8864_led
> + * @client: Pointer to the I2C client
> + * @led_dev: led class device pointer
> + * @regmap: Devices register map
> + * @led_status_mask: Helps to report LED fault only once
> + */
> +struct lp8864_led {
> +	struct i2c_client *client;
> +	struct led_classdev led_dev;
> +	struct regmap *regmap;
> +	u16 led_status_mask;
> +};
> +
> +static int lp8864_fault_check(struct lp8864_led *led)
> +{
> +	int ret, i;
> +	unsigned int val;
> +
> +	ret = regmap_read(led->regmap, LP8864_SUPPLY_STATUS, &val);
> +	if (ret)
> +		goto err;

You could probably keep this simple and print the exact error here
and return, vs the common error message at the end

> +
> +	/* Odd bits are status bits, even bits are clear bits */
> +	for (i = 0; i < ARRAY_SIZE(lp8864_supply_status_msg); i++)
> +		if (val & BIT(i * 2 + 1))
> +			dev_warn(&led->client->dev, "%s\n", lp8864_supply_status_msg[i]);
> +
> +	/*
> +	 * Clear bits have an index preceding the corresponding Status bits;
> +	 * both have to be written "1" simultaneously to clear the corresponding
> +	 * Status bit.
> +	 */
> +	if (val)
> +		ret = regmap_write(led->regmap, LP8864_SUPPLY_STATUS, val >> 1 | val);
> +	if (ret)
> +		goto err;
> +
> +	ret = regmap_read(led->regmap, LP8864_BOOST_STATUS, &val);
> +	if (ret)
> +		goto err;
> +
> +	/* Odd bits are status bits, even bits are clear bits */
> +	for (i = 0; i < ARRAY_SIZE(lp8864_boost_status_msg); i++)
> +		if (val & BIT(i * 2 + 1))
> +			dev_warn(&led->client->dev, "%s\n", lp8864_boost_status_msg[i]);
> +
> +	if (val)
> +		ret = regmap_write(led->regmap, LP8864_BOOST_STATUS, val >> 1 | val);
> +	if (ret)
> +		goto err;
> +
> +	ret = regmap_read(led->regmap, LP8864_LED_STATUS, &val);
> +	if (ret)
> +		goto err;
> +
> +	/*
> +	 * Clear already reported faults that maintain their value until device
> +	 * power-down
> +	 */
> +	val &= ~led->led_status_mask;
> +
> +	for (i = 0; i < ARRAY_SIZE(lp8864_led_status_msg); i++)
> +		if (lp8864_led_status_msg[i] && val & BIT(i))
> +			dev_warn(&led->client->dev, "%s\n", lp8864_led_status_msg[i]);
> +
> +	/*
> +	 * Mark those which maintain their value until device power-down as
> +	 * "already reported"
> +	 */
> +	led->led_status_mask |= val & ~LP8864_LED_STATUS_WR_MASK;
> +
> +	/*
> +	 * Only bits 14, 12, 10 have to be cleared here, but others are RO,
> +	 * we don't care what we write to them.
> +	 */
> +	if (val & LP8864_LED_STATUS_WR_MASK)
> +		ret = regmap_write(led->regmap, LP8864_LED_STATUS, val >> 1 | val);
> +	if (ret)
> +		goto err;
> +
> +	return 0;
> +
> +err:
> +	dev_err(&led->client->dev, "Failed to read/clear faults (%pe)\n", ERR_PTR(ret));
> +
> +	return ret;
> +}
> +
> +static int lp8864_brightness_set(struct led_classdev *led_cdev,
> +				 enum led_brightness brt_val)
> +{
> +	struct lp8864_led *led = container_of(led_cdev, struct lp8864_led, led_dev);
> +	/* Scale 0..LED_FULL into 16-bit HW brightness */
> +	unsigned int val = brt_val * 0xffff / LED_FULL;
> +	int ret;
> +
> +	ret = lp8864_fault_check(led);
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_write(led->regmap, LP8864_BRT_CONTROL, val);
> +	if (ret)
> +		dev_err(&led->client->dev, "Failed to write brightness value\n");
> +
> +	return ret;
> +}
> +
> +static enum led_brightness lp8864_brightness_get(struct led_classdev *led_cdev)
> +{
> +	struct lp8864_led *led = container_of(led_cdev, struct lp8864_led, led_dev);
> +	unsigned int val;
> +	int ret;
> +
> +	ret = regmap_read(led->regmap, LP8864_BRT_CONTROL, &val);
> +	if (ret) {
> +		dev_err(&led->client->dev, "Failed to read brightness value\n");
> +		return ret;
> +	}
> +
> +	/* Scale 16-bit HW brightness into 0..LED_FULL */
> +	return val * LED_FULL / 0xffff;
> +}
> +
> +static const struct regmap_config lp8864_regmap_config = {
> +	.reg_bits		= 8,
> +	.val_bits		= 16,
> +	.val_format_endian	= REGMAP_ENDIAN_LITTLE,
> +};
> +
> +static void lp8864_disable_gpio(void *data)
> +{
> +	struct gpio_desc *gpio = data;
> +
> +	gpiod_set_value(gpio, 0);
> +}
> +
> +static int lp8864_probe(struct i2c_client *client)
> +{
> +	int ret;
> +	struct lp8864_led *led;
> +	struct device_node *np = dev_of_node(&client->dev);
> +	struct device_node *child_node;
> +	struct led_init_data init_data = {};
> +	struct gpio_desc *enable_gpio;
> +
> +	led = devm_kzalloc(&client->dev, sizeof(*led), GFP_KERNEL);
> +	if (!led)
> +		return -ENOMEM;
> +
> +	child_node = of_get_next_available_child(np, NULL);
> +	if (!child_node) {
> +		dev_err(&client->dev, "No LED function defined\n");
> +		return -EINVAL;
> +	}
> +
> +	ret = devm_regulator_get_enable_optional(&client->dev, "vled");
> +	if (ret && ret != -ENODEV)
> +		return dev_err_probe(&client->dev, ret, "Failed to enable vled regulator\n");
> +
> +	enable_gpio = devm_gpiod_get_optional(&client->dev, "enable", GPIOD_OUT_HIGH);
> +	if (IS_ERR(enable_gpio))
> +		return dev_err_probe(&client->dev, PTR_ERR(enable_gpio),
> +				     "Failed to get enable GPIO\n");
> +
> +	ret = devm_add_action_or_reset(&client->dev, lp8864_disable_gpio, enable_gpio);
> +	if (ret)
> +		return ret;
> +
> +	led->client = client;
> +	led->led_dev.brightness_set_blocking = lp8864_brightness_set;
> +	led->led_dev.brightness_get = lp8864_brightness_get;
> +
> +	led->regmap = devm_regmap_init_i2c(client, &lp8864_regmap_config);
> +	if (IS_ERR(led->regmap))
> +		return dev_err_probe(&client->dev, PTR_ERR(led->regmap),
> +				     "Failed to allocate regmap\n");
> +
> +	/* Control brightness by DISPLAY_BRT register */
> +	ret = regmap_update_bits(led->regmap, LP8864_USER_CONFIG1, LP8864_BRT_MODE_MASK,
> +								   LP8864_BRT_MODE_REG);
> +	if (ret) {
> +		dev_err(&led->client->dev, "Failed to set brightness control mode\n");
> +		return ret;
> +	}
> +
> +	ret = lp8864_fault_check(led);
> +	if (ret)
> +		return ret;
> +
> +	init_data.fwnode = of_fwnode_handle(child_node);
> +	init_data.devicename = "lp8864";
> +	init_data.default_label = ":display_cluster";
> +
> +	ret = devm_led_classdev_register_ext(&client->dev, &led->led_dev, &init_data);
> +	if (ret)
> +		dev_err(&client->dev, "Failed to register LED device (%pe)\n", ERR_PTR(ret));
> +
> +	return ret;
> +}
> +
> +static const struct i2c_device_id lp8864_id[] = {
> +	{ "lp8864" },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(i2c, lp8864_id);
> +
> +static const struct of_device_id of_lp8864_leds_match[] = {
> +	{ .compatible = "ti,lp8864" },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, of_lp8864_leds_match);
> +
> +static struct i2c_driver lp8864_driver = {
> +	.driver = {
> +		.name	= "lp8864",
> +		.of_match_table = of_lp8864_leds_match,
> +	},
> +	.probe		= lp8864_probe,
> +	.id_table	= lp8864_id,
> +};
> +module_i2c_driver(lp8864_driver);
> +
> +MODULE_DESCRIPTION("Texas Instruments LP8864/LP8866 LED driver");
> +MODULE_AUTHOR("Alexander Sverdlin <alexander.sverdlin@siemens.com>");
> +MODULE_LICENSE("GPL");

