Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A97F114A7B
	for <lists+linux-leds@lfdr.de>; Mon,  6 May 2019 15:00:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726241AbfEFNAA (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 6 May 2019 09:00:00 -0400
Received: from hamsrv800.servertools24.de ([213.238.32.28]:38265 "EHLO
        hamsrv800.servertools24.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725886AbfEFM77 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 6 May 2019 08:59:59 -0400
Received: from christian-pc.localdomain (p54A59A9B.dip0.t-ipconnect.de [84.165.154.155])
        by hamsrv800.servertools24.de (Postfix) with ESMTPSA id A709C2382C14;
        Mon,  6 May 2019 14:59:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-mauderer.de;
        s=default; t=1557147598;
        bh=bQ/qjd0iPkRpnOeKptFFmF+gJJUMKxKC7PcZu+5Yckg=; l=9910;
        h=Subject:To:From;
        b=jEch+ApVi/wO1Pw2VN6qd7praDwcU7XCIVZUIoE768PqYBId5n0ULBI1sObv2XV6h
         hPjWEPP756Pg3Z9pJu3AQzqOlEPhshk/mRLFGVoEI6il6u8d9AG4qsCJtv9Y42C6kK
         7HrHOm0O1eIOujAahhDW2j4DGlnC52KtCIb3X1t4=
Authentication-Results: hamsrv800.servertools24.de;
        spf=pass (sender IP is 84.165.154.155) smtp.mailfrom=oss@c-mauderer.de smtp.helo=christian-pc.localdomain
Received-SPF: pass (hamsrv800.servertools24.de: connection is authenticated)
Subject: Re: [PATCH v3 2/2] leds: spi-byte: add single byte SPI LED driver
To:     Dan Murphy <dmurphy@ti.com>, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
References: <20190505200022.32209-1-oss@c-mauderer.de>
 <20190505200022.32209-2-oss@c-mauderer.de>
 <8c150278-4bf6-4202-998e-4d82a2a3cd3c@ti.com>
From:   Christian Mauderer <oss@c-mauderer.de>
Message-ID: <3f0d7a10-a67e-a2c2-98fe-a487493b8f2c@c-mauderer.de>
Date:   Mon, 6 May 2019 14:59:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <8c150278-4bf6-4202-998e-4d82a2a3cd3c@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-PPP-Message-ID: <155714759801.111912.16000577120283145503@hamsrv800.servertools24.de>
X-PPP-Vhost: c-mauderer.de
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hello Dan,

thanks for reviewing the patch.

On 06/05/2019 14:05, Dan Murphy wrote:
> Christian
> 
> On 5/5/19 3:00 PM, oss@c-mauderer.de wrote:
>> From: Christian Mauderer <oss@c-mauderer.de>
>>
>> This driver adds support for simple SPI based LED controller which use
>> only one byte for setting the brightness.
>>
>> Signed-off-by: Christian Mauderer <oss@c-mauderer.de>
>> ---
>>
>> Changes compared to v2:
>> - use "if (ret)" instead of "if (ret != 0)"
>> - don't initialize ldev-fields with zero
>> - use devm_led_classdev_register instead of led_classdev_register
>> - check for error instead of good case with the last if in spi_byte_probe
>>
>> Changes compared to v1:
>> - rename ubnt-spi to leds-spi-byte
>> - rework probe to get all parameters before allocating anything -> error checks
>>   all collected together and initializing all fields of the device structure is
>>   more obvious
>> - fix some unsteady indentations during variable declaration
>> - rework comment with protocol explanation
>> - handle case of off_bright > max_bright
>> - fix spelling in commit message
>> - mutex_destroy in remove
>> - change label to use either use the given one without a prefix or a default one
>>
>>
>>  drivers/leds/Kconfig         |  12 ++++
>>  drivers/leds/Makefile        |   1 +
>>  drivers/leds/leds-spi-byte.c | 134 +++++++++++++++++++++++++++++++++++
>>  3 files changed, 147 insertions(+)
>>  create mode 100644 drivers/leds/leds-spi-byte.c
>>
>> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
>> index a72f97fca57b..0866c55e8004 100644
>> --- a/drivers/leds/Kconfig
>> +++ b/drivers/leds/Kconfig
>> @@ -766,6 +766,18 @@ config LEDS_NIC78BX
>>  	  To compile this driver as a module, choose M here: the module
>>  	  will be called leds-nic78bx.
>>  
>> +config LEDS_SPI_BYTE
>> +	tristate "LED support for SPI LED controller with a single byte"
>> +	depends on LEDS_CLASS
>> +	depends on SPI
>> +	depends on OF
>> +	help
>> +	  This option enables support for LED controller which use a single byte
>> +	  for controlling the brightness. The minimum and maximum value of the
>> +	  byte can be configured via a device tree. The driver can be used for
>> +	  example for the microcontroller based LED controller in the Ubiquiti
>> +	  airCube ISP devices.
>> +
>>  comment "LED Triggers"
>>  source "drivers/leds/trigger/Kconfig"
>>  
>> diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
>> index 4c1b0054f379..1786d7e2c236 100644
>> --- a/drivers/leds/Makefile
>> +++ b/drivers/leds/Makefile
>> @@ -75,6 +75,7 @@ obj-$(CONFIG_LEDS_PM8058)		+= leds-pm8058.o
>>  obj-$(CONFIG_LEDS_MLXCPLD)		+= leds-mlxcpld.o
>>  obj-$(CONFIG_LEDS_MLXREG)		+= leds-mlxreg.o
>>  obj-$(CONFIG_LEDS_NIC78BX)		+= leds-nic78bx.o
>> +obj-$(CONFIG_LEDS_SPI_BYTE)		+= leds-spi-byte.o
>>  obj-$(CONFIG_LEDS_MT6323)		+= leds-mt6323.o
>>  obj-$(CONFIG_LEDS_LM3692X)		+= leds-lm3692x.o
>>  obj-$(CONFIG_LEDS_SC27XX_BLTC)		+= leds-sc27xx-bltc.o
>> diff --git a/drivers/leds/leds-spi-byte.c b/drivers/leds/leds-spi-byte.c
>> new file mode 100644
>> index 000000000000..8170b2da497a
>> --- /dev/null
>> +++ b/drivers/leds/leds-spi-byte.c
>> @@ -0,0 +1,134 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +// Copyright (c) 2019 Christian Mauderer <oss@c-mauderer.de>
>> +
>> +/*
>> + * The driver can be used for controllers with a very simple SPI protocol: Only
>> + * one byte between an off and a max value (defined by devicetree) will be sent.
>> + */
>> +
>> +#include <linux/leds.h>
>> +#include <linux/module.h>
>> +#include <linux/of_device.h>
>> +#include <linux/spi/spi.h>
>> +#include <linux/mutex.h>
>> +#include <uapi/linux/uleds.h>
>> +
>> +struct spi_byte_led {
>> +	struct led_classdev	ldev;
>> +	struct spi_device	*spi;
>> +	char			name[LED_MAX_NAME_SIZE];
>> +	struct mutex		mutex;
>> +	u8			off_value;
>> +	u8			max_value;
>> +};
>> +
>> +static int spi_byte_brightness_set_blocking(struct led_classdev *dev,
>> +					    enum led_brightness brightness)
>> +{
>> +	struct spi_byte_led *led = container_of(dev, struct spi_byte_led, ldev);
>> +	u8 value;
>> +	int ret;
>> +
>> +	value = (u8) brightness + led->off_value;
>> +
> 
> Sorry if this has been addressed but the versions moved fast.
> 
> What is the purpose of adding the off_value?
> 
> If max is 63 and say off value is 1 then this will set brightness to 64 but that is not what the LED framework will send.
> if you read the brightness.
> 
> Is it safe to assume that off_value would always be 0?

No it's not always 0.

In my target application (a microcontroller based LED controller from
Ubiquiti) I have the values from 0 to 63. But after some discussion I
wrote the driver to be more generic so it can cover some similar
controllers too.

So if there is a hypothetical SPI-based controller that uses a single
byte with values from 0x80 (off) to 0x8f (maximum brightness) to control
a LED, you could set the off and max values to these two and the driver
sends 0x80 if you set brightness to 0 and 0x8f if you set brightness to 15.

A more concrete application could be to let the LED slightly on to show
power by setting the off value to for example 10 but letting the max
value at 63. In that case there would be only 53 brightness levels left.

Of course it would have been possible to make it a lot more universal by
for example adding a prefix, a bit mask or other word lengths. But that
would have added a lot of complexity without any actual application.

> 
> 
>> +	mutex_lock(&led->mutex);
>> +	ret = spi_write(led->spi, &value, sizeof(value));
>> +	mutex_unlock(&led->mutex);
>> +
>> +	return ret;
>> +}
>> +
>> +static int spi_byte_probe(struct spi_device *spi)
>> +{
>> +	struct device *dev = &spi->dev;
>> +	struct device_node *child;
>> +	struct spi_byte_led *led;
>> +	int ret;
>> +	const char *default_name = "leds-spi-byte::";
>> +	const char *name;
>> +	u8 off_value;
>> +	u8 max_value;
>> +
>> +	if (!dev->of_node)
>> +		return -ENODEV;
>> +
>> +	if (of_get_child_count(dev->of_node) != 1) {
>> +		dev_err(dev, "Device must have exactly one LED sub-node.");
>> +		return -EINVAL;
>> +	}
>> +	child = of_get_next_child(dev->of_node, NULL);
>> +
>> +	ret = of_property_read_string(child, "label", &name);
>> +	if (ret)
>> +		name = default_name;
>> +
>> +	ret = of_property_read_u8(child, "leds-spi-byte,off-value", &off_value);
>> +	if (ret) {
>> +		dev_err(dev, "LED node needs a leds-spi-byte,off-value.");
>> +		return -EINVAL;
>> +	}
>> +
>> +	ret = of_property_read_u8(child, "leds-spi-byte,max-value", &max_value);
>> +	if (ret) {
>> +		dev_err(dev, "LED node needs a leds-spi-byte,max-value.");
>> +		return -EINVAL;
>> +	}
>> +
> 
> You could probably allocate the led struct memory first and then pass in the address of those
> variables as opposed to creating the stack variables.
> 
> 	led = devm_kzalloc(dev, sizeof(*led), GFP_KERNEL);
> 	if (!led)
> 		return -ENOMEM;
> 
> 	ret = of_property_read_string(child, "label", &led->ldev.name);
> 	if (ret)
> 		led->ldev.name = default_name;
> 
> 	ret = of_property_read_u8(child, "leds-spi-byte,off-value", &led->off_value);
> 	if (ret) {
> 		dev_err(dev, "LED node needs a leds-spi-byte,off-value.");
> 		return -EINVAL;
> 	}
> 	.
> 	.
> 	.

I had that in the first revision. Also no one objected, I noted that I
had to search whether I have initialized all fields when I added another
one. Therefore I thought it would be more readable if I initialize the
complete structure at one location. I put readability over efficiency in
that case because it's only called once during initialization. Of course
I can change that back.

> 
> 
>> +	if (off_value >= max_value) {
>> +		dev_err(dev, "off-value has to be smaller than max-value.");
>> +		return -EINVAL;
>> +	}
>> +
>> +	led = devm_kzalloc(dev, sizeof(*led), GFP_KERNEL);
>> +	if (!led)
>> +		return -ENOMEM;
>> +
>> +	led->spi = spi;
>> +	strlcpy(led->name, name, sizeof(led->name));
>> +	mutex_init(&led->mutex);
>> +	led->off_value = off_value;
>> +	led->max_value = max_value;
>> +	led->ldev.name = led->name;
>> +	led->ldev.max_brightness = led->max_value - led->off_value;
> 
> Again not sure why this is needed.  This is changing the behavior of what max brightness value is defined in the DT.
> And this is not documented in the DT doc.
> 
> max_value = 255 off_value = 254 meets all the criteria but then LED framework has max brightness is 1
> But that is not what is described in the DT.

Then my description in the DT wasn't clear enough. I wanted to express
that with the sentence: "The value of the byte can be any value between
the off-value and max-value defined in the properties."

Should I add another example (beneath the Ubiquiti controller) like the
following in the description to make it more clear?

"Another example could be a controller with the following control byte
structure:
- Bit 8 to 5: always 0x8
- Bit 4 to 0: brightness value
In that case the off-value would be 0x80 and the max-value would be 0x8f."

> 
>> +	led->ldev.brightness_set_blocking = spi_byte_brightness_set_blocking;
>> +	ret = devm_led_classdev_register(&spi->dev, &led->ldev);
>> +	if (ret)
>> +		return ret;
>> +
>> +	spi_set_drvdata(spi, led);
> 
> If you move this above the registration this can just become
> 
> return = devm_led_classdev_register(&spi->dev, &led->ldev);

Good point. I'll change that.

> 
>> +
>> +	return 0;
>> +}
>> +
>> +static int spi_byte_remove(struct spi_device *spi)
>> +{
>> +	struct spi_byte_led	*led = spi_get_drvdata(spi);
>> +
>> +	led_classdev_unregister(&led->ldev);
> 
> Don't need this with devm call

Thanks for the hint. Jacek told me that already. I wanted to wait for
some further feedback before spamming the list with another version.

> 
> Dan
> 
> <snip>
> 

Best regards

Christian
