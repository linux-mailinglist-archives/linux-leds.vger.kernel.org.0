Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6899F1CE590
	for <lists+linux-leds@lfdr.de>; Mon, 11 May 2020 22:30:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729836AbgEKUay (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 11 May 2020 16:30:54 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:56442 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729517AbgEKUay (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 11 May 2020 16:30:54 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 04BKUesj109263;
        Mon, 11 May 2020 15:30:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1589229040;
        bh=nFLUZnWOral4V9h4CaCXCNj02LHKLePkW4fyLhXgz2o=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=teRFVfKrzKDY/I9an3b7KyytZQzCyjTFolojiQskYzymtPTU0jZ2h3r3//htASdQt
         730+Ck1amK3MuiOWqqZn5mP/KTKtL73cKY3p2ha0wIhm4OUpxD3mKpY4rQCCgkhb1x
         ND6a/uOcEWeW7/5KMdeiUgzfwNsj1MmEZaDZm1qY=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 04BKUeVY047767
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 11 May 2020 15:30:40 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 11
 May 2020 15:30:39 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 11 May 2020 15:30:39 -0500
Received: from [10.250.52.63] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04BKUd76041575;
        Mon, 11 May 2020 15:30:39 -0500
Subject: Re: [PATCH v2 2/2] leds: initial support for Turris Omnia LEDs
To:     Marek Behun <marek.behun@nic.cz>
CC:     <linux-leds@vger.kernel.org>, Pavel Machek <pavel@ucw.cz>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>
References: <20200423065100.2652-1-marek.behun@nic.cz>
 <20200423065100.2652-3-marek.behun@nic.cz>
 <b6bc27c9-e34c-36c0-f5c0-73f4ed7b9429@ti.com>
 <20200511221729.09450e21@nic.cz>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <e6e3710f-dadc-9f9b-2194-9f4d5cf047e8@ti.com>
Date:   Mon, 11 May 2020 15:21:42 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200511221729.09450e21@nic.cz>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Marek

On 5/11/20 3:17 PM, Marek Behun wrote:
> On Mon, 11 May 2020 14:54:02 -0500
> Dan Murphy <dmurphy@ti.com> wrote:
>
>> Marek
>>
>> On 4/23/20 1:51 AM, Marek Behún wrote:
>>> This adds basic support for LEDs on the front side of CZ.NIC's Turris
>>> Omnia router.
>>>
>>> There are 12 RGB LEDs. The controller supports HW triggering mode for
>>> the LEDs, but this driver does not support it yet, and sets all the LEDs
>>> into SW mode upon probe.
>>>
>>> The user can either group all three channels of one RGB LED into one LED
>>> classdev, or expose each channel as an individual LED classdev. This is
>>> done by utilizing the 'led-sources' and 'color' DT properties.
>> I think this would be a good candidate for the multicolor framework.  It
>> would make the registration, brightness caching and color mapping easier
>>
>> We are waiting on maintainer feedback for this.
>>
>> https://lore.kernel.org/patchwork/project/lkml/list/?series=441958
> Hi Dan, thanks for the review.
>
> I just sent an email as response to Rob's review for dt-bindings, that
> it seems it would be better to add this driver directly in multicolor
> API. (I wanted to do it first without multicolor API support, because
> multicolor API is taking a long time to be merged.)

Ack to that.

Also some additional coding comments below


>
>> But until then comments below
>>
>>> Signed-off-by: Marek Behún <marek.behun@nic.cz>
>>> ---
>>>    drivers/leds/Kconfig             |  11 ++
>>>    drivers/leds/Makefile            |   1 +
>>>    drivers/leds/leds-turris-omnia.c | 285 +++++++++++++++++++++++++++++++
>>>    3 files changed, 297 insertions(+)
>>>    create mode 100644 drivers/leds/leds-turris-omnia.c
>>>
>>> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
>>> index c664d84e1667..7663a5cd9fb5 100644
>>> --- a/drivers/leds/Kconfig
>>> +++ b/drivers/leds/Kconfig
>>> @@ -145,6 +145,17 @@ config LEDS_EL15203000
>>>    	  To compile this driver as a module, choose M here: the module
>>>    	  will be called leds-el15203000.
>>>    
>>> +config LEDS_TURRIS_OMNIA
>>> +	tristate "LED support for CZ.NIC's Turris Omnia"
>>> +	depends on LEDS_CLASS
>>> +	depends on I2C
>> REGMAP?
> Isn't possible. Discussed with Jacek, see explanation at
> https://www.spinics.net/lists/linux-leds/msg11583.html
Ack
>
>>> +	depends on MACH_ARMADA_38X || COMPILE_TEST
>> Why is tied to a Marvel processor?
> Because Turris Omnia is the only device containing microcontroller with
> firmware that understands this protocol, since it was invented by my
> predecessors in CZ.NIC, and we don't want to bloat various
> distributions package systems with kernel modules that won't ever be
> used on devices they target. If a distribution's kernel is compiled to
> also run on Armada 38x, then the driver will be present. For other ARM
> processors or other architectures this driver is useless.


OK

>
>>> +	depends on OF
>>> +	help
>>> +	  This option enables basic support for the LEDs found on the front
>>> +	  side of CZ.NIC's Turris Omnia router. There are 12 RGB LEDs on the
>>> +	  front panel.
>>> +
>>>    config LEDS_LM3530
>>>    	tristate "LCD Backlight driver for LM3530"
>>>    	depends on LEDS_CLASS
>>> diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
>>> index 45235d5fb218..fd61421f7d40 100644
>>> --- a/drivers/leds/Makefile
>>> +++ b/drivers/leds/Makefile
>>> @@ -83,6 +83,7 @@ obj-$(CONFIG_LEDS_TCA6507)		+= leds-tca6507.o
>>>    obj-$(CONFIG_LEDS_TI_LMU_COMMON)	+= leds-ti-lmu-common.o
>>>    obj-$(CONFIG_LEDS_TLC591XX)		+= leds-tlc591xx.o
>>>    obj-$(CONFIG_LEDS_TPS6105X)		+= leds-tps6105x.o
>>> +obj-$(CONFIG_LEDS_TURRIS_OMNIA)		+= leds-turris-omnia.o
>>>    obj-$(CONFIG_LEDS_WM831X_STATUS)	+= leds-wm831x-status.o
>>>    obj-$(CONFIG_LEDS_WM8350)		+= leds-wm8350.o
>>>    obj-$(CONFIG_LEDS_WRAP)			+= leds-wrap.o
>>> diff --git a/drivers/leds/leds-turris-omnia.c b/drivers/leds/leds-turris-omnia.c
>>> new file mode 100644
>>> index 000000000000..aafb4be9b225
>>> --- /dev/null
>>> +++ b/drivers/leds/leds-turris-omnia.c
>>> @@ -0,0 +1,285 @@
>>> +// SPDX-License-Identifier: GPL-2.0
>>> +/*
>>> + * CZ.NIC's Turris Omnia LEDs driver
>>> + *
>>> + * 2020 by Marek Behun <marek.behun@nic.cz>
>>> + */
>>> +
>>> +#include <linux/i2c.h>
>>> +#include <linux/leds.h>
>>> +#include <linux/module.h>
>>> +#include <linux/mutex.h>
>>> +#include <linux/of.h>
>>> +#include <uapi/linux/uleds.h>


Whats the need for this header?


>>> +#include "leds.h"
>>> +
>>> +#define OMNIA_BOARD_LEDS		12
>>> +
>>> +#define CMD_LED_MODE			3
>>> +#define CMD_LED_MODE_LED(l)		((l) & 0x0f)
>>> +#define CMD_LED_MODE_USER		0x10
>>> +
>>> +#define CMD_LED_STATE			4
>>> +#define CMD_LED_STATE_LED(l)		((l) & 0x0f)
>>> +#define CMD_LED_STATE_ON		0x10
>>> +
>>> +#define CMD_LED_COLOR			5
>>> +#define CMD_LED_SET_BRIGHTNESS		7
>>> +#define CMD_LED_GET_BRIGHTNESS		8
>>> +
>>> +#define OMNIA_CMD			0
>>> +
>>> +#define OMNIA_CMD_LED_COLOR_LED		1
>>> +#define OMNIA_CMD_LED_COLOR_R		2
>>> +#define OMNIA_CMD_LED_COLOR_G		3
>>> +#define OMNIA_CMD_LED_COLOR_B		4
>>> +#define OMNIA_CMD_LED_COLOR_LEN		5
>>> +
>>> +struct omnia_led {
>>> +	struct led_classdev cdev;
>>> +	int reg, color;
>>> +};
>>> +
>>> +#define to_omnia_led(l)	container_of(l, struct omnia_led, cdev)
>>> +
>>> +struct omnia_leds {
>>> +	struct i2c_client *client;
>>> +	struct mutex lock;
>>> +	u8 cache[OMNIA_BOARD_LEDS][3];
>>> +	int nleds;
>>> +	struct omnia_led leds[0];
>> No need for the [0] in the flexible array
> Ack.
>
>>> +};
>>> +
>>> +static int omnia_led_brightness_set_blocking(struct led_classdev *cdev,
>>> +					     enum led_brightness brightness)
>>> +{
>>> +	static const u8 color2cmd[] = {
>>> +		[LED_COLOR_ID_RED] = OMNIA_CMD_LED_COLOR_R,
>>> +		[LED_COLOR_ID_GREEN] = OMNIA_CMD_LED_COLOR_G,
>>> +		[LED_COLOR_ID_BLUE] = OMNIA_CMD_LED_COLOR_B,
>>> +	};
>>> +	struct omnia_leds *leds = dev_get_drvdata(cdev->dev->parent);
>>> +	struct omnia_led *led = to_omnia_led(cdev);
>>> +	u8 buf[OMNIA_CMD_LED_COLOR_LEN], state;
>>> +	int ret;
>>> +
>>> +	mutex_lock(&leds->lock);
>>> +
>>> +	buf[OMNIA_CMD] = CMD_LED_COLOR;
>>> +	buf[OMNIA_CMD_LED_COLOR_LED] = led->reg;
>>> +
>>> +	if (led->color == LED_COLOR_ID_WHITE) {
>>> +		buf[OMNIA_CMD_LED_COLOR_R] = brightness;
>>> +		buf[OMNIA_CMD_LED_COLOR_G] = brightness;
>>> +		buf[OMNIA_CMD_LED_COLOR_B] = brightness;
>>> +	} else {
>>> +		buf[OMNIA_CMD_LED_COLOR_R] = leds->cache[led->reg][0];
>>> +		buf[OMNIA_CMD_LED_COLOR_G] = leds->cache[led->reg][1];
>>> +		buf[OMNIA_CMD_LED_COLOR_B] = leds->cache[led->reg][2];
>>> +		buf[color2cmd[led->color]] = brightness;
>>> +	}
>>> +
>>> +	state = CMD_LED_STATE_LED(led->reg);
>>> +	if (buf[OMNIA_CMD_LED_COLOR_R] || buf[OMNIA_CMD_LED_COLOR_G] ||
>>> +	    buf[OMNIA_CMD_LED_COLOR_B])
>>> +		state |= CMD_LED_STATE_ON;
>>> +
>>> +	ret = i2c_smbus_write_byte_data(leds->client, CMD_LED_STATE, state);
>>> +	if (ret >= 0 && (state & CMD_LED_STATE_ON))
>>> +		ret = i2c_master_send(leds->client, buf, 5);
>> No check on ret?
> The function returns ret.

But you are setting the cache values whether it passes or fails.

If it fails then the cache values and device values will not match.


>
>>> +
>>> +	leds->cache[led->reg][0] = buf[OMNIA_CMD_LED_COLOR_R];
>>> +	leds->cache[led->reg][1] = buf[OMNIA_CMD_LED_COLOR_G];
>>> +	leds->cache[led->reg][2] = buf[OMNIA_CMD_LED_COLOR_B];
>>> +
>>> +	mutex_unlock(&leds->lock);
>>> +
>>> +	return ret;
>>> +}
>>> +
>>> +static int omnia_led_register(struct omnia_leds *leds,
>>> +			      struct fwnode_handle *node)
>>> +{
>>> +	struct i2c_client *client = leds->client;
>>> +	struct led_init_data init_data = {};
>>> +	struct device *dev = &client->dev;
>>> +	struct omnia_led *led;
>>> +	int ret, nsources, color;
>>> +	u32 led_sources[3];
>>> +
>>> +	led = &leds->leds[leds->nleds];
>>> +
>>> +	nsources = fwnode_property_count_u32(node, "led-sources");
>>> +	if (nsources != 1 && nsources != 3) {
>>> +		dev_warn(dev,
>>> +			 "Node %pfw: 'led-sources' must contain either 1 or 3 items!\n",
>>> +			 node);
>>> +		return 0;
>>> +	}
>>> +
>>> +	ret = fwnode_property_read_u32_array(node, "led-sources", led_sources,
>>> +					     nsources);
>>> +	if (ret) {
>>> +		dev_err(dev, "Node %pfw: 'led-sources' read failed: %i\n",
>>> +			node, ret);
>>> +		return ret;
>>> +	}
>>> +
>>> +	ret = fwnode_property_read_u32(node, "color", &led->color);
>>> +	if (ret) {
>>> +		dev_warn(dev, "Node %pfw: 'color' read failed!\n",
>>> +			 node);
>>> +		return 0;
>>> +	}
>>> +
>>> +	if (nsources == 3) {
>>> +		if ((led_sources[0] % 3) != 0 ||
>>> +		    led_sources[1] != led_sources[0] + 1 ||
>>> +		    led_sources[2] != led_sources[0] + 2 ||
>>> +		    led_sources[2] >= OMNIA_BOARD_LEDS * 3) {
>>> +			dev_warn(dev, "Node %pfw has invalid 'led-sources'!\n",
>>> +				 node);
>>> +			return 0;
>>> +		}
>>> +
>>> +		color = LED_COLOR_ID_WHITE;
>>> +	} else {
>>> +		const int led_source_to_color[3] = {
>>> +			LED_COLOR_ID_RED,
>>> +			LED_COLOR_ID_GREEN,
>>> +			LED_COLOR_ID_BLUE
>>> +		};
>>> +		color = led_source_to_color[led_sources[0] % 3];
>>> +
>>> +		if (led_sources[0] >= OMNIA_BOARD_LEDS * 3) {
>>> +			dev_warn(dev, "Node %pfw has invalid 'led-sources'!\n",
>>> +				 node);
>>> +			return 0;
>>> +		}
>>> +	}
>>> +
>>> +	if (led->color != color) {
>>> +		dev_warn(dev, "Node %pfw: 'color' should be %s!\n", node,
>>> +			 led_colors[color]);
>>> +		return 0;
>>> +	}
>>> +
>>> +	init_data.fwnode = node;
>>> +
>>> +	led->reg = led_sources[0] / 3;
>>> +	led->cdev.max_brightness = 255;
>>> +	led->cdev.brightness_set_blocking = omnia_led_brightness_set_blocking;
>>> +
>>> +	fwnode_property_read_string(node, "linux,default-trigger",
>>> +				    &led->cdev.default_trigger);
>>> +
>>> +	/* put the LED into software mode */
>>> +	ret = i2c_smbus_write_byte_data(client, CMD_LED_MODE,
>>> +					CMD_LED_MODE_LED(led->reg) |
>>> +					CMD_LED_MODE_USER);
>>> +	if (ret < 0) {
>>> +		dev_err(dev, "Cannot set LED %pfw to software mode: %i\n", node,
>>> +			ret);
>>> +		return ret;
>>> +	}
>>> +
>>> +	/* disable the LED */
>>> +	ret = i2c_smbus_write_byte_data(client, CMD_LED_STATE,
>>> +						CMD_LED_STATE_LED(led->reg));
>>> +	if (ret < 0) {
>>> +		dev_err(dev, "Cannot set LED %pfw brightness: %i\n", node, ret);
>>> +		return ret;
>>> +	}
>>> +
>>> +	ret = devm_led_classdev_register_ext(dev, &led->cdev, &init_data);
>>> +	if (ret < 0) {
>>> +		dev_err(dev, "Cannot register LED %pfw: %i\n", node, ret);
>>> +		return ret;
>>> +	}
>>> +
>>> +	++leds->nleds;
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static int omnia_leds_probe(struct i2c_client *client,
>>> +			    const struct i2c_device_id *id)
>>> +{
>>> +	struct device *dev = &client->dev;
>>> +	struct device_node *np = dev->of_node, *child;
>>> +	struct omnia_leds *leds;
>>> +	int ret, count;
>>> +
>>> +	count = of_get_available_child_count(np);
>> device_get_child_node_count(&client->dev);
> No problem with that, but why? This driver cannot be used without OF
> anyway.
>
Consistency.  You use fwnode calls everywhere else why not here?



>>> +	if (!count) {
>>> +		dev_err(dev, "LEDs are not defined in device tree!\n");
>>> +		return -ENODEV;
>>> +	} else if (count > 3 * OMNIA_BOARD_LEDS) {
>>> +		dev_err(dev, "Too many LEDs defined in device tree!\n");
>>> +		return -EINVAL;
>>> +	}
>>> +
>>> +	leds = devm_kzalloc(dev, sizeof(*leds) + count * sizeof(leds->leds[0]),
>>> +			    GFP_KERNEL);
>> You can use this macro for flexible arrays struct_size(led, leds, count),
> Ack, thx.
>
>>> +	if (!leds)
>>> +		return -ENOMEM;
>>> +
>>> +	leds->client = client;
>>> +	i2c_set_clientdata(client, leds);
>>> +
>>> +	mutex_init(&leds->lock);
>>> +
>>> +	for_each_available_child_of_node(np, child) {
>>> +		ret = omnia_led_register(leds, &child->fwnode);
>>> +		if (ret < 0)
>> if (ret) I don't see ret returning > 0
> Ack.
>
>>> +			return ret;
>>> +	}
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static int omnia_leds_remove(struct i2c_client *client)
>>> +{
>>> +	u8 buf[OMNIA_CMD_LED_COLOR_LEN];
>>> +
>>> +	/* put all LEDs into default (HW triggered) mode */
>>> +	i2c_smbus_write_byte_data(client, CMD_LED_MODE,
>>> +				  CMD_LED_MODE_LED(OMNIA_BOARD_LEDS));
>>> +
>>> +	/* set all LEDs color to [255, 255, 255] */
>>> +	buf[OMNIA_CMD] = CMD_LED_COLOR;
>>> +	buf[OMNIA_CMD_LED_COLOR_LED] = OMNIA_BOARD_LEDS;
>>> +	buf[OMNIA_CMD_LED_COLOR_R] = 255;
>>> +	buf[OMNIA_CMD_LED_COLOR_G] = 255;
>>> +	buf[OMNIA_CMD_LED_COLOR_B] = 255;
>>> +
>>> +	i2c_master_send(client, buf, 5);

Another comment why not just return the value of the I2C send?


>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static const struct of_device_id of_omnia_leds_match[] = {
>>> +	{ .compatible = "cznic,turris-omnia-leds", },
>>> +	{},
>>> +};
>>> +
>>> +static const struct i2c_device_id omnia_id[] = {
>>> +	{ "omnia", 0 },
>>> +	{ }
>>> +};
>>> +
>>> +static struct i2c_driver omnia_leds_driver = {
>>> +	.probe		= omnia_leds_probe,
>>> +	.remove		= omnia_leds_remove,
>>> +	.id_table	= omnia_id,
>>> +	.driver		= {
>>> +		.name	= "leds-turris-omnia",
>>> +		.of_match_table = of_omnia_leds_match,
>>> +	},
>>> +};
>>> +
>>> +module_i2c_driver(omnia_leds_driver);
>>> +
>>> +MODULE_AUTHOR("Marek Behun <marek.behun@nic.cz>");
>>> +MODULE_DESCRIPTION("CZ.NIC's Turris Omnia LEDs");
>>> +MODULE_LICENSE("GPL v2");
