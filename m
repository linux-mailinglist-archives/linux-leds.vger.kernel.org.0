Return-Path: <linux-leds+bounces-6062-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 21D63C46666
	for <lists+linux-leds@lfdr.de>; Mon, 10 Nov 2025 12:55:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CD9F03A24A1
	for <lists+linux-leds@lfdr.de>; Mon, 10 Nov 2025 11:55:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B64030AABC;
	Mon, 10 Nov 2025 11:55:13 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A18712FFFA4;
	Mon, 10 Nov 2025 11:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762775713; cv=none; b=lKxuPR/1qHl6yzT1xGpp8T6WsorJLkdt+u9+xrrG088TDOw4KImcxbRkkfyRqQBf8e3tAFQOL+s8Ja1iB/wqKqNLMW0Hlnbsb65qz3PPw6/obGsznLmfyjm+Ly4tLalLIbDcEDaK1tf3hc5AnGkPOuSinASE6wiC8X4CVPzGdMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762775713; c=relaxed/simple;
	bh=SEGGQCraDKkaakuOL1qELKnn7n3IsPKHAFteZ3/gqQE=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:References:
	 In-Reply-To:Content-Type; b=RTn1t05AON/qaID7nP0bnNIunov7Bg0NMzloZXYZZE4GwTaxpiEpeUZQSf6eJNPbY3Wp9dEJd0FtC9jDELyDwXzynuM47Y6smptz+gYm7kD31TnImur8TorWHfFhEU3Eh2JfOevpjFKibovdJOfo361/9Xf6LngQP0OYqU7/Vf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=timmermann.space; spf=pass smtp.mailfrom=timmermann.space; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=timmermann.space
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=timmermann.space
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4d4p4m4JkWz9t8S;
	Mon, 10 Nov 2025 12:55:04 +0100 (CET)
Message-ID: <a7dffb1f-1545-413b-99ee-421dc6e9f63a@timmermann.space>
Date: Mon, 10 Nov 2025 12:55:02 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Lukas Timmermann <linux@timmermann.space>
Subject: Re: [PATCH v9 2/2] leds: as3668: Driver for the ams Osram 4-channel
 i2c LED driver
To: pavel@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20251014152604.852487-1-linux@timmermann.space>
 <20251014152604.852487-3-linux@timmermann.space>
 <20251023141844.GP475031@google.com>
Content-Language: en-US, de-DE
In-Reply-To: <20251023141844.GP475031@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Am 23.10.25 um 16:18 schrieb Lee Jones:
> On Tue, 14 Oct 2025, Lukas Timmermann wrote:
> 
>> Since there were no existing drivers for the AS3668 or related devices,
>> a new driver was introduced in a separate file. Similar devices were
>> reviewed, but none shared enough characteristics to justify code reuse.
>> As a result, this driver is written specifically for the AS3668.
>>
>> Signed-off-by: Lukas Timmermann <linux@timmermann.space>
>> ---
>>   MAINTAINERS                |   1 +
>>   drivers/leds/Kconfig       |  13 +++
>>   drivers/leds/Makefile      |   1 +
>>   drivers/leds/leds-as3668.c | 188 +++++++++++++++++++++++++++++++++++++
>>   4 files changed, 203 insertions(+)
>>   create mode 100644 drivers/leds/leds-as3668.c
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 091206c54c63..945d78fef380 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -3511,6 +3511,7 @@ M:	Lukas Timmermann <linux@timmermann.space>
>>   L:	linux-leds@vger.kernel.org
>>   S:	Maintained
>>   F:	Documentation/devicetree/bindings/leds/ams,as3668.yaml
>> +F:	drivers/leds/leds-as3668.c
>>   
>>   ASAHI KASEI AK7375 LENS VOICE COIL DRIVER
>>   M:	Tianshu Qiu <tian.shu.qiu@intel.com>
>> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
>> index a104cbb0a001..8cfb423ddf82 100644
>> --- a/drivers/leds/Kconfig
>> +++ b/drivers/leds/Kconfig
>> @@ -100,6 +100,19 @@ config LEDS_ARIEL
>>   
>>   	  Say Y to if your machine is a Dell Wyse 3020 thin client.
>>   
>> +config LEDS_AS3668
> 
> LEDS_OSRAM_AMS_AS3668
> 
>> +	tristate "LED support for AMS AS3668"
> 
> "Osram"
Thanks. Makes sense.
>> +	depends on LEDS_CLASS
>> +	depends on I2C
>> +	help
>> +	  This option enables support for the AMS AS3668 LED controller.
> 
> "Osram"
Same.>> +	  The AS3668 provides up to four LED channels and is 
controlled via
>> +	  the I2C bus. This driver offers basic brightness control for each
>> +	  channel, without support for blinking or other advanced features.
>> +
>> +	  To compile this driver as a module, choose M here: the module
>> +	  will be called leds-as3668.
>> +
>>   config LEDS_AW200XX
>>   	tristate "LED support for Awinic AW20036/AW20054/AW20072/AW20108"
>>   	depends on LEDS_CLASS
>> diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
>> index 2f170d69dcbf..983811384fec 100644
>> --- a/drivers/leds/Makefile
>> +++ b/drivers/leds/Makefile
>> @@ -14,6 +14,7 @@ obj-$(CONFIG_LEDS_ADP5520)		+= leds-adp5520.o
>>   obj-$(CONFIG_LEDS_AN30259A)		+= leds-an30259a.o
>>   obj-$(CONFIG_LEDS_APU)			+= leds-apu.o
>>   obj-$(CONFIG_LEDS_ARIEL)		+= leds-ariel.o
>> +obj-$(CONFIG_LEDS_AS3668)		+= leds-as3668.o
>>   obj-$(CONFIG_LEDS_AW200XX)		+= leds-aw200xx.o
>>   obj-$(CONFIG_LEDS_AW2013)		+= leds-aw2013.o
>>   obj-$(CONFIG_LEDS_BCM6328)		+= leds-bcm6328.o
>> diff --git a/drivers/leds/leds-as3668.c b/drivers/leds/leds-as3668.c
>> new file mode 100644
>> index 000000000000..2b7b776fe2f5
>> --- /dev/null
>> +++ b/drivers/leds/leds-as3668.c
>> @@ -0,0 +1,188 @@
>> +// SPDX-License-Identifier: GPL-2.0-or-later
>> +/*
>> + *  Osram AMS AS3668 LED Driver IC
>> + *
>> + *  Copyright (C) 2025 Lukas Timmermann <linux@timmermann.space>
>> + */
>> +
>> +#include <linux/bitfield.h>
>> +#include <linux/i2c.h>
>> +#include <linux/leds.h>
>> +#include <linux/module.h>
>> +#include <linux/uleds.h>
>> +
>> +#define AS3668_MAX_LEDS			4
>> +#define AS3668_EXPECTED_I2C_ADDR	0x42
>> +
>> +/* Chip Ident */
>> +
>> +#define AS3668_CHIP_ID1_REG		0x3e
>> +#define AS3668_CHIP_ID			0xa5
>> +
>> +/* Current Control */
>> +
>> +#define AS3668_CURRX_CONTROL_REG	0x01
>> +#define AS3668_CURR1_REG		0x02
>> +#define AS3668_CURR2_REG		0x03
>> +#define AS3668_CURR3_REG		0x04
>> +#define AS3668_CURR4_REG		0x05
>> +#define AS3668_CURRX_MODE_ON		0x1
>> +#define AS3668_CURRX_CURR1_MASK		GENMASK(1, 0)
>> +#define AS3668_CURRX_CURR2_MASK		GENMASK(3, 2)
>> +#define AS3668_CURRX_CURR3_MASK		GENMASK(5, 4)
>> +#define AS3668_CURRX_CURR4_MASK		GENMASK(7, 6)
>> +
>> +struct as3668_led {
>> +	struct led_classdev cdev;
>> +	struct as3668 *chip;
>> +	struct fwnode_handle *fwnode;
>> +	int led_id;
>> +};
>> +
>> +struct as3668 {
>> +	struct i2c_client *client;
>> +	struct as3668_led leds[AS3668_MAX_LEDS];
>> +};
>> +
>> +static enum led_brightness as3668_brightness_get(struct led_classdev *cdev)
>> +{
>> +	struct as3668_led *led = container_of(cdev, struct as3668_led, cdev);
>> +
>> +	return i2c_smbus_read_byte_data(led->chip->client, AS3668_CURR1_REG + led->led_id);
>> +}
>> +
>> +static void as3668_brightness_set(struct led_classdev *cdev, enum led_brightness brightness)
>> +{
>> +	struct as3668_led *led = container_of(cdev, struct as3668_led, cdev);
>> +
>> +	int err = i2c_smbus_write_byte_data(led->chip->client,
>> +					    AS3668_CURR1_REG + led->led_id,
>> +					    brightness);
>> +
>> +	if (err)
>> +		dev_err(&led->chip->client->dev, "error writing to reg 0x%02x, returned %d\n",
> 
> The user isn't going to care about this stuff.
> 
> "Failed to set brightness: %d"
> 
>> +			AS3668_CURR1_REG + led->led_id, err);
>> +}
>> +
>> +static int as3668_dt_init(struct as3668 *as3668)
>> +{
>> +	struct device *dev = &as3668->client->dev;
>> +	struct as3668_led *led;
>> +	struct led_init_data init_data = {};
>> +	int err;
>> +	u32 reg;
>> +
>> +	for_each_available_child_of_node_scoped(dev_of_node(dev), child) {
>> +		err = of_property_read_u32(child, "reg", &reg);
>> +		if (err)
>> +			return dev_err_probe(dev, err, "'reg' property missing from %s\n",
> 
> "Failed to read 'reg' property"
> 
Thanks
>> +					     child->name);
>> +
>> +		if (reg < 0 || reg > AS3668_MAX_LEDS)
>> +			return dev_err_probe(dev, -EOPNOTSUPP,
>> +					     "'reg' property in %s is out of scope: %d\n",
> 
> "Unsupported LED: %d"
> 
I understand now that should be user facing messages... Thanks.
>> +					     child->name, reg);
>> +
>> +		led = &as3668->leds[reg];
>> +		led->fwnode = of_fwnode_handle(child);
>> +
>> +		led->led_id = reg;
>> +		led->chip = as3668;
>> +
>> +		led->cdev.max_brightness = U8_MAX;
>> +		led->cdev.brightness_get = as3668_brightness_get;
>> +		led->cdev.brightness_set = as3668_brightness_set;
>> +
>> +		init_data.fwnode = led->fwnode;
>> +		init_data.default_label = ":";
>> +
>> +		err = devm_led_classdev_register_ext(dev, &led->cdev, &init_data);
>> +		if (err)
>> +			return dev_err_probe(dev, err, "failed to register LED %d\n", reg);
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static int as3668_probe(struct i2c_client *client)
>> +{
>> +	struct as3668 *as3668;
>> +	int err;
>> +	u8 chip_id;
>> +
>> +	if (client->addr != AS3668_EXPECTED_I2C_ADDR)
> 
> Expected is weird.
> 
> Why are we trying to catch-out the consumer?
> 
> If you already know what the I2C address is, just use that.
> 
Okay, I will do that instead.
I aim to fail early in my code and double check everything.
Drivers shouldn't error check the device tree, if I understand you 
correctly.
>> +		return dev_err_probe(&client->dev, -EFAULT,
>> +				     "expected i2c address 0x%02x, got 0x%02x\n",
>> +				     AS3668_EXPECTED_I2C_ADDR, client->addr);
>> +
>> +	/* Read identifier from chip */
> 
> This comment is superfluous IMHO.
> 
> The register name should tell us everything.
> 
>> +	chip_id = i2c_smbus_read_byte_data(client, AS3668_CHIP_ID1_REG);
>> +
> 
> Remove this line.
> 
>> +	if (chip_id != AS3668_CHIP_ID)
>> +		return dev_err_probe(&client->dev, -ENODEV,
>> +				     "expected chip id 0x%02x, got 0x%02x\n",
> 
> "ID"
> 
>> +				     AS3668_CHIP_ID, chip_id);
>> +
>> +	as3668 = devm_kzalloc(&client->dev, sizeof(*as3668), GFP_KERNEL);
>> +	if (!as3668)
>> +		return -ENOMEM;
>> +
>> +	as3668->client = client;
>> +
>> +	err = as3668_dt_init(as3668);
>> +	if (err)
>> +		return err;
>> +
>> +	/* Set all four channel modes to 'on' */
> 
> Even if a specific LED wasn't requested?
> 
> Are you sure that this doesn't have any drawbacks (power perhaps)?
> 
After reading through downstream code and it's datasheet, this actually 
might result in higher power consumption than switching it off.
I suppose we could enable and disable a specific channel when setting 
the brightness. I will add that in my next patch version.
>> +	err = i2c_smbus_write_byte_data(client, AS3668_CURRX_CONTROL_REG,
>> +					FIELD_PREP(AS3668_CURRX_CURR1_MASK, AS3668_CURRX_MODE_ON) |
>> +					FIELD_PREP(AS3668_CURRX_CURR2_MASK, AS3668_CURRX_MODE_ON) |
>> +					FIELD_PREP(AS3668_CURRX_CURR3_MASK, AS3668_CURRX_MODE_ON) |
>> +					FIELD_PREP(AS3668_CURRX_CURR4_MASK, AS3668_CURRX_MODE_ON));
>> +
>> +	/* Set initial currents to 0mA */
>> +	err |= i2c_smbus_write_byte_data(client, AS3668_CURR1_REG, 0);
>> +	err |= i2c_smbus_write_byte_data(client, AS3668_CURR2_REG, 0);
>> +	err |= i2c_smbus_write_byte_data(client, AS3668_CURR3_REG, 0);
>> +	err |= i2c_smbus_write_byte_data(client, AS3668_CURR4_REG, 0);
>> +
>> +	if (err)
>> +		return dev_err_probe(&client->dev, -EIO, "failed to write to the device\n");
>> +
>> +	return 0;
>> +}
>> +
>> +static void as3668_remove(struct i2c_client *client)
>> +{
>> +	int err;
> 
> '\n' here.
> 
Okay
>> +	err = i2c_smbus_write_byte_data(client, AS3668_CURRX_CONTROL_REG, 0);
>> +	if (err)
>> +		dev_err(&client->dev, "couldn't remove the device\n");
> 
> This does not remove the device.
> 
> "Failed to turn off the LEDs"
> 
Obviously, now that I see it. Thanks
>> +}
>> +
>> +static const struct i2c_device_id as3668_idtable[] = {
>> +	{ "as3668" },
>> +	{ }
>> +};
>> +MODULE_DEVICE_TABLE(i2c, as3668_idtable);
>> +
>> +static const struct of_device_id as3668_match_table[] = {
>> +	{ .compatible = "ams,as3668" },
>> +	{ }
>> +};
>> +MODULE_DEVICE_TABLE(of, as3668_match_table);
>> +
>> +static struct i2c_driver as3668_driver = {
>> +	.driver = {
>> +		.name = "leds_as3668",
>> +		.of_match_table = as3668_match_table,
>> +	},
>> +	.probe = as3668_probe,
>> +	.remove = as3668_remove,
>> +	.id_table = as3668_idtable,
>> +};
>> +module_i2c_driver(as3668_driver);
>> +
>> +MODULE_AUTHOR("Lukas Timmermann <linux@timmermann.space>");
>> +MODULE_DESCRIPTION("AS3668 LED driver");
>> +MODULE_LICENSE("GPL");
>> -- 
>> 2.51.0
>>
> 


