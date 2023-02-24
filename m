Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 07EA46A1E48
	for <lists+linux-leds@lfdr.de>; Fri, 24 Feb 2023 16:15:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230318AbjBXPPg (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 24 Feb 2023 10:15:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230322AbjBXPPY (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 24 Feb 2023 10:15:24 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FB3264D68;
        Fri, 24 Feb 2023 07:14:58 -0800 (PST)
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 738EF33F;
        Fri, 24 Feb 2023 16:14:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1677251695;
        bh=xTnA7QVb3l3gx6z2va/ZKA9zXmQZPU35yhvdDq5Rk+g=;
        h=Date:Subject:To:References:From:In-Reply-To:From;
        b=mFzBPowycEIeGeHxvdplibxhct2fZx3nR4K1n7pF8Ak6rr8PNwtJSqnw8DyRtXCAY
         dIYqGmcndy/QgVpPvk8zzsl7VEX/ooJQv9wgAPMRH6gd5nqrPAgBFFzLn8yYXkY3NI
         Lqhre/V0eiqzshhV1GDI8M5xnlqlzCj4o0LOvWkY=
Message-ID: <91a754b4-6bfb-e0a4-7cd1-0a58b3df0ce3@ideasonboard.com>
Date:   Fri, 24 Feb 2023 15:14:52 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [RESEND PATCH 3/3] leds: tps68470: Add LED control for tps68470
Content-Language: en-US
To:     Hans de Goede <hdegoede@redhat.com>, Kate Hsuan <hpa@redhat.com>,
        Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
        linux-leds@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        Daniel Scally <djrscally@gmail.com>,
        Mark Gross <markgross@kernel.org>,
        Dan Scally <dan.scally@ideasonboard.com>
References: <20230213124520.1635257-1-hpa@redhat.com>
 <20230213124520.1635257-4-hpa@redhat.com>
 <2a0f7d36-ef0c-1c29-5f01-6115275e78dd@redhat.com>
From:   Dan Scally <dan.scally@ideasonboard.com>
In-Reply-To: <2a0f7d36-ef0c-1c29-5f01-6115275e78dd@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 22/02/2023 16:53, Hans de Goede wrote:
> Hi Kate,
> 
> On 2/13/23 13:45, Kate Hsuan wrote:
>> There are two LED controllers, LEDA indicator LED and LEDB flash LED for
>> tps68470. LEDA can be enabled by setting TPS68470_ILEDCTL_ENA. Moreover,
>> tps68470 provides 4 levels of power status for LEDB, so after setting
>> TPS68470_ILEDCTL_ENB, the current status field (TPS68470_ILEDCTL_CTRLB)
>> should also be set according to the brightness value from user space.
>> These two LEDs can be controlled through the LED class of sysfs
>> (tps68470-leda and tps68470-ledb).
>>
>> Signed-off-by: Kate Hsuan <hpa@redhat.com>
>> ---
>>   drivers/leds/Kconfig         |  12 +++
>>   drivers/leds/Makefile        |   1 +
>>   drivers/leds/leds-tps68470.c | 170 +++++++++++++++++++++++++++++++++++
>>   3 files changed, 183 insertions(+)
>>   create mode 100644 drivers/leds/leds-tps68470.c
>>
>> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
>> index 499d0f215a8b..453404cb1329 100644
>> --- a/drivers/leds/Kconfig
>> +++ b/drivers/leds/Kconfig
>> @@ -846,6 +846,18 @@ config LEDS_TPS6105X
>>   	  It is a single boost converter primarily for white LEDs and
>>   	  audio amplifiers.
>>   
>> +config LEDS_TPS68470
>> +	tristate "LED support for TI TPS68470"
>> +	depends on LEDS_CLASS
>> +	depends on INTEL_SKL_INT3472
>> +	help
>> +	  This driver supports TPS68470 PMIC with LED chip.
>> +	  It provide two LED controllers, including an indicator LED
>> +	  and a flash LED.
>> +
>> +	  To compile this driver as a module, choose M and it will be
>> +	  called leds-tps68470
>> +
>>   config LEDS_IP30
>>   	tristate "LED support for SGI Octane machines"
>>   	depends on LEDS_CLASS
>> diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
>> index 4fd2f92cd198..0a2ec01e27d9 100644
>> --- a/drivers/leds/Makefile
>> +++ b/drivers/leds/Makefile
>> @@ -86,6 +86,7 @@ obj-$(CONFIG_LEDS_TURRIS_OMNIA)		+= leds-turris-omnia.o
>>   obj-$(CONFIG_LEDS_WM831X_STATUS)	+= leds-wm831x-status.o
>>   obj-$(CONFIG_LEDS_WM8350)		+= leds-wm8350.o
>>   obj-$(CONFIG_LEDS_WRAP)			+= leds-wrap.o
>> +obj-$(CONFIG_LEDS_TPS68470)		+= leds-tps68470.o
>>   
>>   # LED SPI Drivers
>>   obj-$(CONFIG_LEDS_CR0014114)		+= leds-cr0014114.o
>> diff --git a/drivers/leds/leds-tps68470.c b/drivers/leds/leds-tps68470.c
>> new file mode 100644
>> index 000000000000..6243e7a4a718
>> --- /dev/null
>> +++ b/drivers/leds/leds-tps68470.c
>> @@ -0,0 +1,170 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * LED driver for TPS68470 PMIC
>> + *
>> + * Copyright (C) 2023 Red Hat
>> + *
>> + * Authors:
>> + *	Kate Hsuan <hpa@redhat.com>
>> + */
>> +
>> +#include <linux/gpio/driver.h>
>> +#include <linux/mfd/tps68470.h>
>> +#include <linux/module.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/regmap.h>
>> +#include <linux/leds.h>
>> +
>> +struct tps68470_led_data {
>> +	struct regmap *tps68470_regmap;
>> +	unsigned int brightness_a;
>> +	unsigned int brightness_b;
>> +	struct led_classdev leda_cdev;
>> +	struct led_classdev ledb_cdev;
>> +};
>> +
>> +enum ctrlb_current {
>> +	CTRLB_2MA	= 0,
>> +	CTRLB_4MA	= 1,
>> +	CTRLB_8MA	= 2,
>> +	CTRLB_16MA	= 3,
>> +};
>> +
>> +static int set_ledb_current(struct regmap *regmap,
>> +			    unsigned int *data_brightness,
>> +			    enum led_brightness brightness)
>> +{
>> +	unsigned int ledb_current;
>> +
>> +	switch (brightness) {
>> +	case LED_HALF:
>> +		ledb_current = CTRLB_8MA;
>> +		break;
>> +	case LED_FULL:
>> +		ledb_current = CTRLB_16MA;
>> +		break;
> 
> LED_FULL is 255, now a days the LED class supports custom
> brightness ranges, so you could just set max_brightness to 4
> and then use brightness 1-4 to map to the 4 values.
> 
>> +	case LED_ON:
>> +		ledb_current = CTRLB_4MA;
>> +		break;
>> +	case LED_OFF:
>> +		ledb_current = CTRLB_2MA;
>> +		break;
> 
> This makes no sense, when brightness == LED_OFF you
> disable the LEDB output, so the configured current does
> not matter.
> 
> But I believe that mapping the current to brightness is
> not how this should be done / modeled. With the separate
> on/off toggle this is clearly not intended to allow dimming
> a LED. This is configurable to allow adjusting for different
> notification LED types, but the intention is still for LEDB
> to be used as a simple on/off notification LED.
> 
> (The lack of e.g. actual PWM / fine grained current control
> vs doubling the current each step to me is another clear
> indication the current is intended to be set once and not
> for dimming purposes)
> 
> So IMHO both LED pins should have a max_brightness of 1 and
> the sysfs API (or internal kernel users) should only be able
> to turn them on/off (sysfs brightness 1/0)
> 
> The setting of the current should be done through a device
> property. Lets call this "ti,ledb-current" with allowed
> values of 2, 4, 8, 16. You can then try to get a configured
> current for the pin using device-properties from probe()
> and only set the current once if the property is their, e.g.
> something like this:
> 
> probe ()
> {
> 	u32 curr;
> 
> 	ret = device_property_read_u32(dev, "ti,ledb-current", &curr);
> 	if (ret == 0) {
> 		switch (curr) {
> 		case  2: current = CTRLB_2MA; break;
> 		case  4: current = CTRLB_4MA; break;
> 		case  8: current = CTRLB_8MA; break;
> 		case 16: current = CTRLB_16MA; break;
> 		default:
> 			dev_err(dev, "Invalid LEDB curr value: %d\n", curr);
> 			return -EINVAL;
> 		}
> 
> 		regmap_update_bits(regmap, TPS68470_REG_ILEDCTL, TPS68470_ILEDCTL_CTRLB, curr);
> 	}
> 
> 

fwiw I agree with Hans on the above

>> +	default:
>> +		return -EINVAL;
>> +	}
>> +
>> +	*data_brightness = brightness;
>> +	return regmap_update_bits(regmap, TPS68470_REG_ILEDCTL,
>> +				  TPS68470_ILEDCTL_CTRLB, ledb_current);
>> +}
>> +
>> +static int tps68470_brightness_set(struct led_classdev *led_cdev,
>> +				   enum led_brightness brightness)
>> +{
>> +	struct tps68470_led_data *data;
>> +	struct regmap *regmap;
>> +	unsigned int mask;
>> +	unsigned int value;
>> +	int ret;
>> +
>> +	if (!strncmp(led_cdev->name, "tps68470-ileda", 14)) {
>> +		data = container_of(led_cdev, struct tps68470_led_data, leda_cdev);
>> +		regmap = data->tps68470_regmap;
>> +		data->brightness_a = brightness ? TPS68470_ILEDCTL_ENA : 0;
>> +		mask = TPS68470_ILEDCTL_ENA;
>> +		value = data->brightness_a;
>> +	} else if (!strncmp(led_cdev->name, "tps68470-iledb", 14)) {
>> +		data = container_of(led_cdev, struct tps68470_led_data, ledb_cdev);
>> +		regmap = data->tps68470_regmap;
>> +		mask = TPS68470_ILEDCTL_ENB;
>> +		value = brightness ? TPS68470_ILEDCTL_ENB : 0;
>> +		/* Set current state for ledb */
>> +		ret = set_ledb_current(regmap, &data->brightness_b, brightness);
>> +		if (ret)
>> +			goto err_exit;
>> +	} else
>> +		return -EINVAL;
>> +
>> +	ret = regmap_update_bits(regmap, TPS68470_REG_ILEDCTL, mask, value);
>> +
>> +err_exit:
>> +	return ret;
>> +}
> 
> 
>> +
>> +static enum led_brightness tps68470_brightness_get(struct led_classdev *led_cdev)
>> +{
>> +	struct tps68470_led_data *data = container_of(led_cdev,
>> +						      struct tps68470_led_data,
>> +						      ledb_cdev);
> 
> This container_of only works for led_b not for led_a.
> 
>> +
>> +	if (!strncmp(led_cdev->name, "tps68470-ileda", 14))
>> +		return data->brightness_a;
>> +	else if (!strncmp(led_cdev->name, "tps68470-iledb", 14))
>> +		return data->brightness_b;
>> +
>> +	return -EINVAL;
>> +}
> 
> Instead of this strcmp magic, please just use 2 separate
> brightness_get functions (thus also solving the container_of
> problem above). And please also do the same for brightness_set.

I don't mind the single function so much but I don't particularly like the strcmp. I'm actually 
working on this at the moment too trying (but so far mostly failing) to get the WLED that drives the 
Surface Go's IR LED working properly (I can drive it...for a maximum of 13 seconds); I had modeled 
the problem as an array of structs for the LEDs and reference them with IDs:

#define lcdev_to_led(lcdev) \
	container_of(lcdev, struct tps68470_led, lcdev);

#define led_to_tps68470(led, index) \
	container_of(led, struct tps68470_device, leds[index])

enum tps68470_led_ids {
	TPS68470_ILED_A,
	TPS68470_ILED_B,
	TPS68470_WLED,
	TPS68470_NUM_LEDS
};

static const char *tps68470_led_names[] = {
	[TPS68470_ILED_A] = "tps68470-iled_a",
	[TPS68470_ILED_B] = "tps68470-iled_b",
	[TPS68470_WLED] = "tps68470-wled",
};

struct tps68470_led {
	unsigned int led_id;
	struct led_classdev lcdev;
};

struct tps68470_device {
	struct device *dev;
	struct regmap *regmap;
	struct tps68470_led leds[TPS68470_NUM_LEDS];
};

int tps68470_led_brightness_set(...)
{
	struct tps68470_led *led = lcdev_to_led(lcdev);
	struct tps68470_device *tps68470 = led_to_tps68470(led, led->index);

	switch (led->led_id) {
	case TPS68470_ILED_A:
		return regmap_update_bits(...);
	case TPS68470_ILED_B:
		...

	}
}

int tps68470_leds_probe(...)
{
	struct tps68470_led *led;

	...

	for (i = 0; i < TPS68470_NUM_LEDS; i++) {
		led = &tps68470->leds[i];

		led->led_id = i;

		lcdev->name = devm_kasprintf(tps68470->dev, GFP_KERNEL, "%s::%s",
					tps68470_led_names[i], LED_FUNCTION_INDICATOR);
		if (!lcdev->name)
			return -ENOMEM;

		lcdev->max_brightness = 1;
		lcdev->brightness_set_blocking = tps68470_led_brightness_set;

		ret = devm_led_classdev_register(tps68470->dev, lcdev);
		if (ret)
			return dev_err_probe(tps68470->dev, ret,
					"error registering led\n");
	}
}

Personally I think that's better than having 3 functions to do it.

Regardless of how it ends up being done; I think you need the LED_FUNCTION_INDICATOR part in 
lcdev->name to match the "devicename:color:function" that the LED subsystem seems to want.

> 
> Regards,
> 
> Hans
> 
> 
>> +
>> +static int tps68470_led_probe(struct platform_device *pdev)
>> +{
>> +	int ret = 0;
>> +	struct tps68470_led_data *tps68470_led;
>> +
>> +	tps68470_led = devm_kzalloc(&pdev->dev, sizeof(struct tps68470_led_data),
>> +				    GFP_KERNEL);
>> +	if (!tps68470_led)
>> +		return -ENOMEM;
>> +
>> +	tps68470_led->tps68470_regmap = dev_get_drvdata(pdev->dev.parent);
>> +	tps68470_led->leda_cdev.name = "tps68470-ileda";
>> +	tps68470_led->leda_cdev.max_brightness = 1;
>> +	tps68470_led->leda_cdev.brightness_set_blocking = tps68470_brightness_set;
>> +	tps68470_led->leda_cdev.brightness_get = tps68470_brightness_get;
>> +	tps68470_led->leda_cdev.dev = &pdev->dev;
>> +	tps68470_led->brightness_a = 0;
>> +	ret = led_classdev_register(&pdev->dev, &tps68470_led->leda_cdev);
>> +	if (ret < 0) {
>> +		dev_err(&pdev->dev, "Failed to register LEDA: %d\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	tps68470_led->tps68470_regmap = dev_get_drvdata(pdev->dev.parent);
>> +	tps68470_led->ledb_cdev.name = "tps68470-iledb";
>> +	tps68470_led->ledb_cdev.max_brightness = 255;
>> +	tps68470_led->ledb_cdev.brightness_set_blocking = tps68470_brightness_set;
>> +	tps68470_led->ledb_cdev.brightness_get = tps68470_brightness_get;
>> +	tps68470_led->ledb_cdev.dev = &pdev->dev;
>> +	tps68470_led->brightness_b = 0;
>> +	ret = led_classdev_register(&pdev->dev, &tps68470_led->ledb_cdev);
>> +	if (ret < 0) {
> 
> 		You are forgetting to unregister the other LED here.
> 
> But instead of adding an unregister here, please just switch to
> devm_led_classdev_register() for both LEDs and then... (continued below)
> 
>> +		dev_err(&pdev->dev, "Failed to register LEDB: %d\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	platform_set_drvdata(pdev, tps68470_led);
>> +
>> +	return ret;
>> +}
>> +
>> +static int tps68470_led_remove(struct platform_device *pdev)
>> +{
>> +	struct tps68470_led_data *data = platform_get_drvdata(pdev);
>> +
>> +	led_classdev_unregister(&data->leda_cdev);
>> +	led_classdev_unregister(&data->ledb_cdev);
>> +
>> +	return 0;
>> +}
> 
> You can remove the tps68470_led_remove() function since the
> devm framework now takes care of unregistering on probe-errors
> and on driver unbinding (aka remove).
> 
>> +
>> +static struct platform_driver tps68470_led_driver = {
>> +	.driver = {
>> +		   .name = "tps68470-led",
>> +	},
>> +	.probe = tps68470_led_probe,
>> +	.remove = tps68470_led_remove,
>> +};
>> +module_platform_driver(tps68470_led_driver);
>> +
>> +MODULE_ALIAS("platform:tps68470-led");
>> +MODULE_DESCRIPTION("LED driver for TPS68470 PMIC");
>> +MODULE_LICENSE("GPL v2");
> 
> Regards,
> 
> Hans
> 

