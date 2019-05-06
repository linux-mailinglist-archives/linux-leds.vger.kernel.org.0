Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 63F2814FEB
	for <lists+linux-leds@lfdr.de>; Mon,  6 May 2019 17:19:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726402AbfEFPTQ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 6 May 2019 11:19:16 -0400
Received: from hamsrv800.servertools24.de ([213.238.32.28]:48781 "EHLO
        hamsrv800.servertools24.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726095AbfEFPTP (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 6 May 2019 11:19:15 -0400
Received: from christian-pc.localdomain (p54A59A9B.dip0.t-ipconnect.de [84.165.154.155])
        by hamsrv800.servertools24.de (Postfix) with ESMTPSA id AEF132382AB1;
        Mon,  6 May 2019 17:19:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-mauderer.de;
        s=default; t=1557155953;
        bh=0okZWy/XqllI7pnyUwJTut+NNcihN1AWcqa93Vz0f1w=; l=13964;
        h=Subject:To:From;
        b=GutBZoRx2tWqL4PEaRf+vpIWaNjWidnRg/RK+HfY/QkZN5T4ggrkkQsshxkNvSTJs
         bMWBfPheFmsNxQaOIakk7TxcIx8MCbalbnKfkHbQzBIkZW69IKPXeqmJ91pzT5Pi2/
         63LTON3TiWkGiFU1eq9JcRjRXZkbGm/ZZoBO8v0Y=
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
 <3f0d7a10-a67e-a2c2-98fe-a487493b8f2c@c-mauderer.de>
 <fb0bc2a0-1311-3a45-04db-5cddcba48392@ti.com>
From:   Christian Mauderer <oss@c-mauderer.de>
Message-ID: <ea650eef-0607-bbe8-701c-261410409fe6@c-mauderer.de>
Date:   Mon, 6 May 2019 17:19:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <fb0bc2a0-1311-3a45-04db-5cddcba48392@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-PPP-Message-ID: <155715595308.129695.12960321340469112752@hamsrv800.servertools24.de>
X-PPP-Vhost: c-mauderer.de
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 06/05/2019 16:58, Dan Murphy wrote:
> 
> 
> On 5/6/19 7:59 AM, Christian Mauderer wrote:
>> Hello Dan,
>>
>> thanks for reviewing the patch.
>>
>> On 06/05/2019 14:05, Dan Murphy wrote:
>>> Christian
>>>
>>> On 5/5/19 3:00 PM, oss@c-mauderer.de wrote:
>>>> From: Christian Mauderer <oss@c-mauderer.de>
>>>>
>>>> This driver adds support for simple SPI based LED controller which use
>>>> only one byte for setting the brightness.
>>>>
>>>> Signed-off-by: Christian Mauderer <oss@c-mauderer.de>
>>>> ---
>>>>
>>>> Changes compared to v2:
>>>> - use "if (ret)" instead of "if (ret != 0)"
>>>> - don't initialize ldev-fields with zero
>>>> - use devm_led_classdev_register instead of led_classdev_register
>>>> - check for error instead of good case with the last if in spi_byte_probe
>>>>
>>>> Changes compared to v1:
>>>> - rename ubnt-spi to leds-spi-byte
>>>> - rework probe to get all parameters before allocating anything -> error checks
>>>>   all collected together and initializing all fields of the device structure is
>>>>   more obvious
>>>> - fix some unsteady indentations during variable declaration
>>>> - rework comment with protocol explanation
>>>> - handle case of off_bright > max_bright
>>>> - fix spelling in commit message
>>>> - mutex_destroy in remove
>>>> - change label to use either use the given one without a prefix or a default one
>>>>
>>>>
>>>>  drivers/leds/Kconfig         |  12 ++++
>>>>  drivers/leds/Makefile        |   1 +
>>>>  drivers/leds/leds-spi-byte.c | 134 +++++++++++++++++++++++++++++++++++
>>>>  3 files changed, 147 insertions(+)
>>>>  create mode 100644 drivers/leds/leds-spi-byte.c
>>>>
>>>> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
>>>> index a72f97fca57b..0866c55e8004 100644
>>>> --- a/drivers/leds/Kconfig
>>>> +++ b/drivers/leds/Kconfig
>>>> @@ -766,6 +766,18 @@ config LEDS_NIC78BX
>>>>  	  To compile this driver as a module, choose M here: the module
>>>>  	  will be called leds-nic78bx.
>>>>  
>>>> +config LEDS_SPI_BYTE
>>>> +	tristate "LED support for SPI LED controller with a single byte"
>>>> +	depends on LEDS_CLASS
>>>> +	depends on SPI
>>>> +	depends on OF
>>>> +	help
>>>> +	  This option enables support for LED controller which use a single byte
>>>> +	  for controlling the brightness. The minimum and maximum value of the
>>>> +	  byte can be configured via a device tree. The driver can be used for
>>>> +	  example for the microcontroller based LED controller in the Ubiquiti
>>>> +	  airCube ISP devices.
>>>> +
>>>>  comment "LED Triggers"
>>>>  source "drivers/leds/trigger/Kconfig"
>>>>  
>>>> diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
>>>> index 4c1b0054f379..1786d7e2c236 100644
>>>> --- a/drivers/leds/Makefile
>>>> +++ b/drivers/leds/Makefile
>>>> @@ -75,6 +75,7 @@ obj-$(CONFIG_LEDS_PM8058)		+= leds-pm8058.o
>>>>  obj-$(CONFIG_LEDS_MLXCPLD)		+= leds-mlxcpld.o
>>>>  obj-$(CONFIG_LEDS_MLXREG)		+= leds-mlxreg.o
>>>>  obj-$(CONFIG_LEDS_NIC78BX)		+= leds-nic78bx.o
>>>> +obj-$(CONFIG_LEDS_SPI_BYTE)		+= leds-spi-byte.o
>>>>  obj-$(CONFIG_LEDS_MT6323)		+= leds-mt6323.o
>>>>  obj-$(CONFIG_LEDS_LM3692X)		+= leds-lm3692x.o
>>>>  obj-$(CONFIG_LEDS_SC27XX_BLTC)		+= leds-sc27xx-bltc.o
>>>> diff --git a/drivers/leds/leds-spi-byte.c b/drivers/leds/leds-spi-byte.c
>>>> new file mode 100644
>>>> index 000000000000..8170b2da497a
>>>> --- /dev/null
>>>> +++ b/drivers/leds/leds-spi-byte.c
>>>> @@ -0,0 +1,134 @@
>>>> +// SPDX-License-Identifier: GPL-2.0
>>>> +// Copyright (c) 2019 Christian Mauderer <oss@c-mauderer.de>
>>>> +
>>>> +/*
>>>> + * The driver can be used for controllers with a very simple SPI protocol: Only
>>>> + * one byte between an off and a max value (defined by devicetree) will be sent.
>>>> + */
>>>> +
>>>> +#include <linux/leds.h>
>>>> +#include <linux/module.h>
>>>> +#include <linux/of_device.h>
>>>> +#include <linux/spi/spi.h>
>>>> +#include <linux/mutex.h>
>>>> +#include <uapi/linux/uleds.h>
>>>> +
>>>> +struct spi_byte_led {
>>>> +	struct led_classdev	ldev;
>>>> +	struct spi_device	*spi;
>>>> +	char			name[LED_MAX_NAME_SIZE];
>>>> +	struct mutex		mutex;
>>>> +	u8			off_value;
>>>> +	u8			max_value;
>>>> +};
>>>> +
>>>> +static int spi_byte_brightness_set_blocking(struct led_classdev *dev,
>>>> +					    enum led_brightness brightness)
>>>> +{
>>>> +	struct spi_byte_led *led = container_of(dev, struct spi_byte_led, ldev);
>>>> +	u8 value;
>>>> +	int ret;
>>>> +
>>>> +	value = (u8) brightness + led->off_value;
>>>> +
>>>
>>> Sorry if this has been addressed but the versions moved fast.
>>>
>>> What is the purpose of adding the off_value?
>>>
>>> If max is 63 and say off value is 1 then this will set brightness to 64 but that is not what the LED framework will send.
>>> if you read the brightness.
>>>
>>> Is it safe to assume that off_value would always be 0?
>>
>> No it's not always 0.
>>
>> In my target application (a microcontroller based LED controller from
>> Ubiquiti) I have the values from 0 to 63. But after some discussion I
>> wrote the driver to be more generic so it can cover some similar
>> controllers too.
>>
>> So if there is a hypothetical SPI-based controller that uses a single
>> byte with values from 0x80 (off) to 0x8f (maximum brightness) to control
>> a LED, you could set the off and max values to these two and the driver
>> sends 0x80 if you set brightness to 0 and 0x8f if you set brightness to 15.
>>
> 
> In this case would the max brightness just be 0x7f.
> Maybe an optional DT property for brightness mask would help here.
> 
> Not sure what the msb is in the example but if this bit defines the  LED on/off control then 
> maybe an optional dt property for this would be more clear.
> 
>> A more concrete application could be to let the LED slightly on to show
>> power by setting the off value to for example 10 but letting the max
>> value at 63. In that case there would be only 53 brightness levels left.
>>
> 
> But then the LED is not off by user space request.  When the LED is asked to be off
> it should be off.  The brightness values requested by the user space should be honored and
> not modified by the driver.

That's correct. It was an example what would be possible. You are
correct that this would be an ugly hack.

> 
>> Of course it would have been possible to make it a lot more universal by
>> for example adding a prefix, a bit mask or other word lengths. But that
>> would have added a lot of complexity without any actual application.
>>
> 
> I have to disagree here.  If this is supposed to be a universal SPI byte driver that
> needs special handling then it is either needs to be created in a universal way or needs to be made
> target specific.

If it should be a truly universal driver for SPI based controllers I
would at least need the following additional features:

- Variable direction (led brighter with lower or higher values).
- Counter at any location of the byte. Maybe even some odd combinations
like bit 7, 3 and 5 in this order.
- Sending some bytes before the LED brightness value.
- Sending multiple bytes for multiple LEDs.
- Configurable other bits.

And that would only include controllers without a SPI MISO channel. So
where does "universal" stop? I stopped when my application and maybe
some others (like using a digital potentiometer with an similar
interface) could be covered.

So it's not a universal but a multi-purpose driver that can be used for
every controller with the following interface:

- Only has a MOSI line. MISO can be ignored.
- Expect one byte via SPI.
- Expect a range of values from x to y to set brightness from off (x) to
bright (y).

It can be extended if an application appears that needs more than that.
Maybe it's a good idea to add that list of requirements to the device
tree description?

> 
>>>
>>>
>>>> +	mutex_lock(&led->mutex);
>>>> +	ret = spi_write(led->spi, &value, sizeof(value));
>>>> +	mutex_unlock(&led->mutex);
>>>> +
>>>> +	return ret;
>>>> +}
>>>> +
>>>> +static int spi_byte_probe(struct spi_device *spi)
>>>> +{
>>>> +	struct device *dev = &spi->dev;
>>>> +	struct device_node *child;
>>>> +	struct spi_byte_led *led;
>>>> +	int ret;
>>>> +	const char *default_name = "leds-spi-byte::";
>>>> +	const char *name;
>>>> +	u8 off_value;
>>>> +	u8 max_value;
>>>> +
>>>> +	if (!dev->of_node)
>>>> +		return -ENODEV;
>>>> +
>>>> +	if (of_get_child_count(dev->of_node) != 1) {
>>>> +		dev_err(dev, "Device must have exactly one LED sub-node.");
>>>> +		return -EINVAL;
>>>> +	}
>>>> +	child = of_get_next_child(dev->of_node, NULL);
>>>> +
>>>> +	ret = of_property_read_string(child, "label", &name);
>>>> +	if (ret)
>>>> +		name = default_name;
>>>> +
>>>> +	ret = of_property_read_u8(child, "leds-spi-byte,off-value", &off_value);
>>>> +	if (ret) {
>>>> +		dev_err(dev, "LED node needs a leds-spi-byte,off-value.");
>>>> +		return -EINVAL;
>>>> +	}
>>>> +
>>>> +	ret = of_property_read_u8(child, "leds-spi-byte,max-value", &max_value);
>>>> +	if (ret) {
>>>> +		dev_err(dev, "LED node needs a leds-spi-byte,max-value.");
>>>> +		return -EINVAL;
>>>> +	}
>>>> +
>>>
>>> You could probably allocate the led struct memory first and then pass in the address of those
>>> variables as opposed to creating the stack variables.
>>>
>>> 	led = devm_kzalloc(dev, sizeof(*led), GFP_KERNEL);
>>> 	if (!led)
>>> 		return -ENOMEM;
>>>
>>> 	ret = of_property_read_string(child, "label", &led->ldev.name);
>>> 	if (ret)
>>> 		led->ldev.name = default_name;
>>>
>>> 	ret = of_property_read_u8(child, "leds-spi-byte,off-value", &led->off_value);
>>> 	if (ret) {
>>> 		dev_err(dev, "LED node needs a leds-spi-byte,off-value.");
>>> 		return -EINVAL;
>>> 	}
>>> 	.
>>> 	.
>>> 	.
>>
>> I had that in the first revision. Also no one objected, I noted that I
>> had to search whether I have initialized all fields when I added another
>> one. Therefore I thought it would be more readable if I initialize the
>> complete structure at one location. I put readability over efficiency in
>> that case because it's only called once during initialization. Of course
>> I can change that back.
>>
> 
> Well for readability you could also create a function that parses the node after allocating
> the memory.  That way all the DT parsing and value checking is done in a single function.
> 

OK for me too. I'm quite indifferent here. It's a matter of preference
how to style something like that.

>>>
>>>
>>>> +	if (off_value >= max_value) {
>>>> +		dev_err(dev, "off-value has to be smaller than max-value.");
>>>> +		return -EINVAL;
>>>> +	}
>>>> +
>>>> +	led = devm_kzalloc(dev, sizeof(*led), GFP_KERNEL);
>>>> +	if (!led)
>>>> +		return -ENOMEM;
>>>> +
>>>> +	led->spi = spi;
>>>> +	strlcpy(led->name, name, sizeof(led->name));
>>>> +	mutex_init(&led->mutex);
>>>> +	led->off_value = off_value;
>>>> +	led->max_value = max_value;
>>>> +	led->ldev.name = led->name;
>>>> +	led->ldev.max_brightness = led->max_value - led->off_value;
>>>
>>> Again not sure why this is needed.  This is changing the behavior of what max brightness value is defined in the DT.
>>> And this is not documented in the DT doc.
>>>
>>> max_value = 255 off_value = 254 meets all the criteria but then LED framework has max brightness is 1
>>> But that is not what is described in the DT.
>>
>> Then my description in the DT wasn't clear enough. I wanted to express
>> that with the sentence: "The value of the byte can be any value between
>> the off-value and max-value defined in the properties."
>>
>> Should I add another example (beneath the Ubiquiti controller) like the
>> following in the description to make it more clear?
>>
>> "Another example could be a controller with the following control byte
>> structure:
>> - Bit 8 to 5: always 0x8
>> - Bit 4 to 0: brightness value
>> In that case the off-value would be 0x80 and the max-value would be 0x8f."
>>
> 
> In this case max-brightness would be 0xf.  No math needed.  With the aid of a brightness mask
> then the code would need to do a read before write.
> This makes this driver more extensible if it truly needs to be universal and generic.

That would mean that the controller allows a read of the register. Not
every controller does that. For example the one I want to support just
returns the previously sent byte.

> 
> read_value = 0
> 
> if (led->brightness_mask)
> 	spi_read()
> 
> value = (u8) brightness & led->brightness_mask | read_value; 
> // or it can also skip brightness_mask and use max_brightness
> // value = (u8) brightness & led->max_brightness | read_value; 
> 
> spi_write(value)
> 
> This aligns what is declared in the DT to what is expected from the user space.
> >>>
>>>> +	led->ldev.brightness_set_blocking = spi_byte_brightness_set_blocking;
>>>> +	ret = devm_led_classdev_register(&spi->dev, &led->ldev);
>>>> +	if (ret)
>>>> +		return ret;
>>>> +
>>>> +	spi_set_drvdata(spi, led);
>>>
>>> If you move this above the registration this can just become
>>>
>>> return = devm_led_classdev_register(&spi->dev, &led->ldev);
>>
>> Good point. I'll change that.
>>
>>>
>>>> +
>>>> +	return 0;
>>>> +}
>>>> +
>>>> +static int spi_byte_remove(struct spi_device *spi)
>>>> +{
>>>> +	struct spi_byte_led	*led = spi_get_drvdata(spi);
>>>> +
>>>> +	led_classdev_unregister(&led->ldev);
>>>
>>> Don't need this with devm call
>>
>> Thanks for the hint. Jacek told me that already. I wanted to wait for
>> some further feedback before spamming the list with another version.
>>
> 
> One other thing if the LED driver is removed and the LED is on and unmanaged that is ok?
> 

Is that any different for any of the other drivers? As soon as I remove
a driver, the device is unmanaged, isn't it?

Best regards

Christian

> Dan
> 
>>>
>>> Dan
>>>
>>> <snip>
>>>
>>
>> Best regards
>>
>> Christian
>>
