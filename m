Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6BF6215062
	for <lists+linux-leds@lfdr.de>; Mon,  6 May 2019 17:38:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726516AbfEFPiC (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 6 May 2019 11:38:02 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:48336 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726279AbfEFPiC (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 6 May 2019 11:38:02 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x46Fbl8W104214;
        Mon, 6 May 2019 10:37:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1557157067;
        bh=8JUWkB+m0ns76lXmJBUT3afsygMvaI57Z8OQcuorBQ4=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=pFcNuJb5/tu4IdWx6eQDUEC+iNT/fELI2Vxj8NOUboEb2OYWTGh6/XC2tcqyhXpAJ
         C8ouF+9FwNmLa+02TWWHMjwR2KIk01/0BDUlwsq7ZhNzMqLwhIRCkjS8esCN6rhkAd
         VXY0kNIVS+dRO/ccbC7sfAduNj7wMYoMUPWPhPt4=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x46FblO7110673
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 6 May 2019 10:37:47 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 6 May
 2019 10:37:46 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 6 May 2019 10:37:46 -0500
Received: from [10.250.90.63] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x46FbkDn116241;
        Mon, 6 May 2019 10:37:46 -0500
Subject: Re: [PATCH v3 2/2] leds: spi-byte: add single byte SPI LED driver
To:     Christian Mauderer <oss@c-mauderer.de>,
        <linux-leds@vger.kernel.org>, <devicetree@vger.kernel.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>
CC:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
References: <20190505200022.32209-1-oss@c-mauderer.de>
 <20190505200022.32209-2-oss@c-mauderer.de>
 <8c150278-4bf6-4202-998e-4d82a2a3cd3c@ti.com>
 <3f0d7a10-a67e-a2c2-98fe-a487493b8f2c@c-mauderer.de>
 <fb0bc2a0-1311-3a45-04db-5cddcba48392@ti.com>
 <ea650eef-0607-bbe8-701c-261410409fe6@c-mauderer.de>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <3647f3b0-5491-0858-4d48-c790047b8f1d@ti.com>
Date:   Mon, 6 May 2019 10:37:53 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <ea650eef-0607-bbe8-701c-261410409fe6@c-mauderer.de>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Christian

On 5/6/19 10:19 AM, Christian Mauderer wrote:
> On 06/05/2019 16:58, Dan Murphy wrote:
<snip>

> 
> If it should be a truly universal driver for SPI based controllers I
> would at least need the following additional features:
> 
> - Variable direction (led brighter with lower or higher values).
> - Counter at any location of the byte. Maybe even some odd combinations
> like bit 7, 3 and 5 in this order.
> - Sending some bytes before the LED brightness value.
> - Sending multiple bytes for multiple LEDs.
> - Configurable other bits.
> 
> And that would only include controllers without a SPI MISO channel. So
> where does "universal" stop? I stopped when my application and maybe
> some others (like using a digital potentiometer with an similar
> interface) could be covered.
> 
> So it's not a universal but a multi-purpose driver that can be used for
> every controller with the following interface:
> 
> - Only has a MOSI line. MISO can be ignored.
> - Expect one byte via SPI.
> - Expect a range of values from x to y to set brightness from off (x) to
> bright (y).
> 
> It can be extended if an application appears that needs more than that.
> Maybe it's a good idea to add that list of requirements to the device
> tree description?
> 

Yes that would be a good idea since it is a multi-purpose driver with very specific requirements.

>>
>>>>
>>>>
>>>>> +	mutex_lock(&led->mutex);
>>>>> +	ret = spi_write(led->spi, &value, sizeof(value));
>>>>> +	mutex_unlock(&led->mutex);
>>>>> +
>>>>> +	return ret;
>>>>> +}
>>>>> +
>>>>> +static int spi_byte_probe(struct spi_device *spi)
>>>>> +{
>>>>> +	struct device *dev = &spi->dev;
>>>>> +	struct device_node *child;
>>>>> +	struct spi_byte_led *led;
>>>>> +	int ret;
>>>>> +	const char *default_name = "leds-spi-byte::";
>>>>> +	const char *name;
>>>>> +	u8 off_value;
>>>>> +	u8 max_value;
>>>>> +
>>>>> +	if (!dev->of_node)
>>>>> +		return -ENODEV;
>>>>> +
>>>>> +	if (of_get_child_count(dev->of_node) != 1) {
>>>>> +		dev_err(dev, "Device must have exactly one LED sub-node.");
>>>>> +		return -EINVAL;
>>>>> +	}
>>>>> +	child = of_get_next_child(dev->of_node, NULL);
>>>>> +
>>>>> +	ret = of_property_read_string(child, "label", &name);
>>>>> +	if (ret)
>>>>> +		name = default_name;
>>>>> +
>>>>> +	ret = of_property_read_u8(child, "leds-spi-byte,off-value", &off_value);
>>>>> +	if (ret) {
>>>>> +		dev_err(dev, "LED node needs a leds-spi-byte,off-value.");
>>>>> +		return -EINVAL;
>>>>> +	}
>>>>> +
>>>>> +	ret = of_property_read_u8(child, "leds-spi-byte,max-value", &max_value);
>>>>> +	if (ret) {
>>>>> +		dev_err(dev, "LED node needs a leds-spi-byte,max-value.");
>>>>> +		return -EINVAL;
>>>>> +	}
>>>>> +
>>>>
>>>> You could probably allocate the led struct memory first and then pass in the address of those
>>>> variables as opposed to creating the stack variables.
>>>>
>>>> 	led = devm_kzalloc(dev, sizeof(*led), GFP_KERNEL);
>>>> 	if (!led)
>>>> 		return -ENOMEM;
>>>>
>>>> 	ret = of_property_read_string(child, "label", &led->ldev.name);
>>>> 	if (ret)
>>>> 		led->ldev.name = default_name;
>>>>
>>>> 	ret = of_property_read_u8(child, "leds-spi-byte,off-value", &led->off_value);
>>>> 	if (ret) {
>>>> 		dev_err(dev, "LED node needs a leds-spi-byte,off-value.");
>>>> 		return -EINVAL;
>>>> 	}
>>>> 	.
>>>> 	.
>>>> 	.
>>>
>>> I had that in the first revision. Also no one objected, I noted that I
>>> had to search whether I have initialized all fields when I added another
>>> one. Therefore I thought it would be more readable if I initialize the
>>> complete structure at one location. I put readability over efficiency in
>>> that case because it's only called once during initialization. Of course
>>> I can change that back.
>>>
>>
>> Well for readability you could also create a function that parses the node after allocating
>> the memory.  That way all the DT parsing and value checking is done in a single function.
>>
> 
> OK for me too. I'm quite indifferent here. It's a matter of preference
> how to style something like that.
> 

True not saying to do create the function it was just a suggestion.

>>>>
>>>>
>>>>> +	if (off_value >= max_value) {
>>>>> +		dev_err(dev, "off-value has to be smaller than max-value.");
>>>>> +		return -EINVAL;
>>>>> +	}
>>>>> +
>>>>> +	led = devm_kzalloc(dev, sizeof(*led), GFP_KERNEL);
>>>>> +	if (!led)
>>>>> +		return -ENOMEM;
>>>>> +
>>>>> +	led->spi = spi;
>>>>> +	strlcpy(led->name, name, sizeof(led->name));
>>>>> +	mutex_init(&led->mutex);
>>>>> +	led->off_value = off_value;
>>>>> +	led->max_value = max_value;
>>>>> +	led->ldev.name = led->name;
>>>>> +	led->ldev.max_brightness = led->max_value - led->off_value;
>>>>
>>>> Again not sure why this is needed.  This is changing the behavior of what max brightness value is defined in the DT.
>>>> And this is not documented in the DT doc.
>>>>
>>>> max_value = 255 off_value = 254 meets all the criteria but then LED framework has max brightness is 1
>>>> But that is not what is described in the DT.
>>>
>>> Then my description in the DT wasn't clear enough. I wanted to express
>>> that with the sentence: "The value of the byte can be any value between
>>> the off-value and max-value defined in the properties."
>>>
>>> Should I add another example (beneath the Ubiquiti controller) like the
>>> following in the description to make it more clear?
>>>
>>> "Another example could be a controller with the following control byte
>>> structure:
>>> - Bit 8 to 5: always 0x8
>>> - Bit 4 to 0: brightness value
>>> In that case the off-value would be 0x80 and the max-value would be 0x8f."
>>>
>>
>> In this case max-brightness would be 0xf.  No math needed.  With the aid of a brightness mask
>> then the code would need to do a read before write.
>> This makes this driver more extensible if it truly needs to be universal and generic.
> 
> That would mean that the controller allows a read of the register. Not
> every controller does that. For example the one I want to support just
> returns the previously sent byte.
> 

True a spi_read would be ineffective here.

>>
>> read_value = 0
>>
>> if (led->brightness_mask)
>> 	spi_read()
>>
>> value = (u8) brightness & led->brightness_mask | read_value; 
>> // or it can also skip brightness_mask and use max_brightness
>> // value = (u8) brightness & led->max_brightness | read_value; 
>>
>> spi_write(value)
>>
>> This aligns what is declared in the DT to what is expected from the user space.
>>>>>
>>>>> +	led->ldev.brightness_set_blocking = spi_byte_brightness_set_blocking;
>>>>> +	ret = devm_led_classdev_register(&spi->dev, &led->ldev);
>>>>> +	if (ret)
>>>>> +		return ret;
>>>>> +
>>>>> +	spi_set_drvdata(spi, led);
>>>>
>>>> If you move this above the registration this can just become
>>>>
>>>> return = devm_led_classdev_register(&spi->dev, &led->ldev);
>>>
>>> Good point. I'll change that.
>>>
>>>>
>>>>> +
>>>>> +	return 0;
>>>>> +}
>>>>> +
>>>>> +static int spi_byte_remove(struct spi_device *spi)
>>>>> +{
>>>>> +	struct spi_byte_led	*led = spi_get_drvdata(spi);
>>>>> +
>>>>> +	led_classdev_unregister(&led->ldev);
>>>>
>>>> Don't need this with devm call
>>>
>>> Thanks for the hint. Jacek told me that already. I wanted to wait for
>>> some further feedback before spamming the list with another version.
>>>
>>
>> One other thing if the LED driver is removed and the LED is on and unmanaged that is ok?
>>
> 
> Is that any different for any of the other drivers? As soon as I remove
> a driver, the device is unmanaged, isn't it?
> 

True.

Dan

> Best regards
> 
> Christian
> 
>> Dan
>>
>>>>
>>>> Dan
>>>>
>>>> <snip>
>>>>
>>>
>>> Best regards
>>>
>>> Christian
>>>
