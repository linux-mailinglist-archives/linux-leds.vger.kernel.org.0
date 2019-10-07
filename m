Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F353ACEA14
	for <lists+linux-leds@lfdr.de>; Mon,  7 Oct 2019 19:05:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728736AbfJGRFo (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 7 Oct 2019 13:05:44 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:51124 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727801AbfJGRFo (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 7 Oct 2019 13:05:44 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x97H5cr7095753;
        Mon, 7 Oct 2019 12:05:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1570467938;
        bh=q6Qq7vGOZLyqRO8NHrGtGMKENBEtJw+/rZDysxprU0E=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=THKGsenhXowqTsyC0mi0psJuYGeOpCtncoxkbmBShiIrxKFAfe/Ddmz64FPCPBeCZ
         r+K9DS9zah/onlk9eKGo0qgceHgtXAp11VFpfFSaiy7gd4EIB0d8aqFJGfM9Q8CTuy
         g+EGsO+eO+0yjf9H3hg6vHDQ9GF/mXhZ7SPw2g3M=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x97H5cJu077626;
        Mon, 7 Oct 2019 12:05:38 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 7 Oct
 2019 12:05:38 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 7 Oct 2019 12:05:38 -0500
Received: from [10.250.65.13] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x97H5cWg021058;
        Mon, 7 Oct 2019 12:05:38 -0500
Subject: Re: [PATCH v10 12/16] leds: lp55xx: Add multicolor framework support
 to lp55xx
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>
CC:     <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20191001145620.11123-1-dmurphy@ti.com>
 <20191001145620.11123-13-dmurphy@ti.com>
 <9353b10d-d805-0142-5d90-da73e172bd78@gmail.com>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <7d2aa67b-dcf7-d8b9-12ad-92329736623e@ti.com>
Date:   Mon, 7 Oct 2019 12:08:20 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <9353b10d-d805-0142-5d90-da73e172bd78@gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Jacek

On 10/6/19 2:52 PM, Jacek Anaszewski wrote:
> Dan,
>
> On 10/1/19 4:56 PM, Dan Murphy wrote:
>> Add multicolor framework support for the lp55xx family.
>>
>> Signed-off-by: Dan Murphy <dmurphy@ti.com>
>> ---
>>   drivers/leds/Kconfig                      |   1 +
>>   drivers/leds/leds-lp55xx-common.c         | 169 +++++++++++++++++++---
>>   drivers/leds/leds-lp55xx-common.h         |  11 ++
>>   include/linux/platform_data/leds-lp55xx.h |   6 +
>>   4 files changed, 163 insertions(+), 24 deletions(-)
>>
>> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
>> index 84f60e35c5ee..dc3d9f2194cd 100644
>> --- a/drivers/leds/Kconfig
>> +++ b/drivers/leds/Kconfig
>> @@ -377,6 +377,7 @@ config LEDS_LP50XX
>>   config LEDS_LP55XX_COMMON
>>   	tristate "Common Driver for TI/National LP5521/5523/55231/5562/8501"
>>   	depends on LEDS_LP5521 || LEDS_LP5523 || LEDS_LP5562 || LEDS_LP8501
>> +	depends on LEDS_CLASS_MULTI_COLOR && OF
>>   	select FW_LOADER
>>   	select FW_LOADER_USER_HELPER
>>   	help
>> diff --git a/drivers/leds/leds-lp55xx-common.c b/drivers/leds/leds-lp55xx-common.c
>> index 44ced02b49f9..5de4f1789a44 100644
>> --- a/drivers/leds/leds-lp55xx-common.c
>> +++ b/drivers/leds/leds-lp55xx-common.c
>> @@ -131,14 +131,50 @@ static struct attribute *lp55xx_led_attrs[] = {
>>   };
>>   ATTRIBUTE_GROUPS(lp55xx_led);
>>   
>> +struct led_mc_color_conversion color_component[LP55XX_MAX_GROUPED_CHAN];
> Why is this global? Please move it to lp55xx_set_brightness().
ACK
>
>> +
>> +static int lp55xx_get_channel(struct lp55xx_led *led, int color_id)
>> +{
>> +	int i;
>> +
>> +	for (i = 0; i < led->mc_cdev.num_leds; i++) {
>> +		if (led->channel_color[i] == color_id)
>> +			return led->grouped_channels[i];
>> +	}
>> +
>> +	return -EINVAL;
>> +}
>> +
>>   static int lp55xx_set_brightness(struct led_classdev *cdev,
>>   			     enum led_brightness brightness)
>>   {
>>   	struct lp55xx_led *led = cdev_to_lp55xx_led(cdev);
>>   	struct lp55xx_device_config *cfg = led->chip->cfg;
>> +	int channel_num;
>> +	int ret;
>> +	int i;
>>   
>> -	led->brightness = (u8)brightness;
>> -	return cfg->brightness_fn(led);
>> +	if (led->mc_cdev.num_leds > 1) {
>> +		led_mc_calc_brightness(&led->mc_cdev, brightness,
>> +				       &color_component[0]);
> s/&color_component[0]/color_component/

ACK


>> +
>> +		for (i = 0; i < led->mc_cdev.num_leds; i++) {
>> +			channel_num = lp55xx_get_channel(led,
>> +						color_component[i].color_id);
>> +			if (channel_num < 0)
>> +				return channel_num;
>> +
>> +			ret = cfg->color_intensity_fn(led, channel_num,
>> +						 color_component[i].brightness);
> If you passed struct led_mc_color_conversion instead of brightness,
> then in the color_intensity_fn op you could obtain channel numbers
> by calling lp55xx_get_channel in a loop. And you could setup the whole
> cluster in a single call.

Hmm.  How would that be an improvement?  Maybe the answer lies down 
below in my response and we will not have to get the channel_num as we 
can make the output part of the mc_color_conversion struct.

As I pointed out in v9 "Beyond that in coding this and thinking about 
the design it is better to have the lp55xx_common code to do all the 
heavy lifting and the children to just perform the action on the device 
itself"

https://lore.kernel.org/linux-leds/4186e454-48fd-1578-cd26-083b54c707ab@gmail.com/T/#u

The children should not have to know if the LED is registered to the LED 
class, MC Class or Flash class only the common code should know this 
information.  Just need to keep the child code simple. This is why I 
pass in the values as opposed to having the child figure it out.


>> +			if (ret)
>> +				return ret;
>> +		}
>> +	} else {
>> +		led->brightness = (u8)brightness;
>> +		ret = cfg->brightness_fn(led);
>> +	}
>> +
>> +	return ret;
>>   }
>>   
>>   static int lp55xx_init_led(struct lp55xx_led *led,
>> @@ -147,9 +183,9 @@ static int lp55xx_init_led(struct lp55xx_led *led,
>>   	struct lp55xx_platform_data *pdata = chip->pdata;
>>   	struct lp55xx_device_config *cfg = chip->cfg;
>>   	struct device *dev = &chip->cl->dev;
>> +	int max_channel = cfg->max_channel;
>>   	char name[32];
>>   	int ret;
>> -	int max_channel = cfg->max_channel;
>>   
>>   	if (chan >= max_channel) {
>>   		dev_err(dev, "invalid channel: %d / %d\n", chan, max_channel);
>> @@ -159,10 +195,37 @@ static int lp55xx_init_led(struct lp55xx_led *led,
>>   	if (pdata->led_config[chan].led_current == 0)
>>   		return 0;
>>   
>> +	if (pdata->led_config[chan].name) {
>> +		led->cdev.name = pdata->led_config[chan].name;
>> +	} else {
>> +		snprintf(name, sizeof(name), "%s:channel%d",
>> +			pdata->label ? : chip->cl->name, chan);
>> +		led->cdev.name = name;
>> +	}
>> +
>> +	if (pdata->led_config[chan].num_colors > 1) {
>> +		led->mc_cdev.led_cdev = &led->cdev;
>> +		led->cdev.brightness_set_blocking = lp55xx_set_brightness;
>> +		led->cdev.groups = lp55xx_led_groups;
>> +		led->mc_cdev.num_leds = pdata->led_config[chan].num_colors;
>> +		led->mc_cdev.available_colors =
>> +			pdata->led_config[chan].available_colors;
>> +		memcpy(led->channel_color,
>> +		       pdata->led_config[chan].channel_color,
>> +		       sizeof(led->channel_color));
>> +		memcpy(led->grouped_channels,
>> +		       pdata->led_config[chan].grouped_channels,
>> +		       sizeof(led->grouped_channels));
>> +	} else {
>> +
>> +		led->cdev.default_trigger =
>> +			pdata->led_config[chan].default_trigger;
>> +		led->cdev.brightness_set_blocking = lp55xx_set_brightness;
>> +	}	led->cdev.groups = lp55xx_led_groups;
>> +
>>   	led->led_current = pdata->led_config[chan].led_current;
>>   	led->max_current = pdata->led_config[chan].max_current;
>>   	led->chan_nr = pdata->led_config[chan].chan_nr;
>> -	led->cdev.default_trigger = pdata->led_config[chan].default_trigger;
>>   
>>   	if (led->chan_nr >= max_channel) {
>>   		dev_err(dev, "Use channel numbers between 0 and %d\n",
>> @@ -170,18 +233,11 @@ static int lp55xx_init_led(struct lp55xx_led *led,
>>   		return -EINVAL;
>>   	}
>>   
>> -	led->cdev.brightness_set_blocking = lp55xx_set_brightness;
>> -	led->cdev.groups = lp55xx_led_groups;
>> +	if (pdata->led_config[chan].num_colors > 1)
>> +		ret = led_classdev_multicolor_register(dev, &led->mc_cdev);
>> +	else
>> +		ret = led_classdev_register(dev, &led->cdev);
>>   
>> -	if (pdata->led_config[chan].name) {
>> -		led->cdev.name = pdata->led_config[chan].name;
>> -	} else {
>> -		snprintf(name, sizeof(name), "%s:channel%d",
>> -			pdata->label ? : chip->cl->name, chan);
>> -		led->cdev.name = name;
>> -	}
>> -
>> -	ret = led_classdev_register(dev, &led->cdev);
>>   	if (ret) {
>>   		dev_err(dev, "led register err: %d\n", ret);
>>   		return ret;
>> @@ -466,7 +522,6 @@ int lp55xx_register_leds(struct lp55xx_led *led, struct lp55xx_chip *chip)
>>   		dev_err(&chip->cl->dev, "empty brightness configuration\n");
>>   		return -EINVAL;
>>   	}
>> -
>>   	for (i = 0; i < num_channels; i++) {
>>   
>>   		/* do not initialize channels that are not connected */
>> @@ -538,6 +593,76 @@ void lp55xx_unregister_sysfs(struct lp55xx_chip *chip)
>>   }
>>   EXPORT_SYMBOL_GPL(lp55xx_unregister_sysfs);
>>   
>> +static int lp5xx_parse_common_child(struct device_node *np,
>> +				     struct lp55xx_led_config *cfg,
>> +				     int chan_num, bool is_multicolor)
>> +{
>> +	u32 led_number;
>> +	int ret;
>> +
>> +	of_property_read_string(np, "chan-name",
>> +				&cfg[chan_num].name);
>> +	of_property_read_u8(np, "led-cur",
>> +			    &cfg[chan_num].led_current);
>> +	of_property_read_u8(np, "max-cur",
>> +			    &cfg[chan_num].max_current);
>> +
>> +	ret = of_property_read_u32(np, "reg", &led_number);
>> +	if (ret)
>> +		return ret;
>> +
>> +	if (led_number < 0 || led_number > 6)
>> +		return -EINVAL;
>> +
>> +	if (is_multicolor)
>> +		cfg[chan_num].grouped_channels[cfg[chan_num].num_colors]
> Please pass the index for grouped channels as an argument to this
> function. Referring here directly to a temporary state of num_colors
> that is incremented in the loop from which this function is called
> is ugly IMO.

Ack


>> +				= led_number;
>> +	else
>> +		cfg[chan_num].chan_nr = led_number;
>> +
>> +	return 0;
>> +}
>> +
>> +static int lp5xx_parse_channel_child(struct device_node *np,
>> +				     struct lp55xx_led_config *cfg,
>> +				     int child_number)
>> +{
>> +	struct device_node *child;
>> +	int channel_color;
>> +	u32 color_id;
>> +	int ret;
>> +
>> +	cfg[child_number].default_trigger =
>> +			of_get_property(np, "linux,default-trigger", NULL);
>> +
>> +	ret = of_property_read_u32(np, "color", &channel_color);
>> +	if (ret)
>> +		channel_color = ret;
>> +
>> +
>> +	if (channel_color == LED_COLOR_ID_MULTI) {
>> +		for_each_child_of_node(np, child) {
>> +			ret = lp5xx_parse_common_child(child, cfg,
>> +						       child_number, true);
>> +			if (ret)
>> +				return ret;
>> +			ret = of_property_read_u32(child, "color", &color_id);
>> +			if (ret)
>> +				return ret;
>> +
>> +			cfg[child_number].channel_color[cfg[child_number].num_colors] =
>> +				color_id;
>> +			set_bit(color_id, &cfg[child_number].available_colors);
>> +
>> +			cfg[child_number].num_colors++;
>> +		}
>> +	} else {
>> +		return lp5xx_parse_common_child(np, cfg, child_number, false);
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>>   struct lp55xx_platform_data *lp55xx_of_populate_pdata(struct device *dev,
>>   						      struct device_node *np)
>>   {
>> @@ -546,6 +671,7 @@ struct lp55xx_platform_data *lp55xx_of_populate_pdata(struct device *dev,
>>   	struct lp55xx_led_config *cfg;
>>   	int num_channels;
>>   	int i = 0;
>> +	int ret;
>>   
>>   	pdata = devm_kzalloc(dev, sizeof(*pdata), GFP_KERNEL);
>>   	if (!pdata)
>> @@ -565,14 +691,9 @@ struct lp55xx_platform_data *lp55xx_of_populate_pdata(struct device *dev,
>>   	pdata->num_channels = num_channels;
>>   
>>   	for_each_child_of_node(np, child) {
>> -		cfg[i].chan_nr = i;
>> -
>> -		of_property_read_string(child, "chan-name", &cfg[i].name);
>> -		of_property_read_u8(child, "led-cur", &cfg[i].led_current);
>> -		of_property_read_u8(child, "max-cur", &cfg[i].max_current);
>> -		cfg[i].default_trigger =
>> -			of_get_property(child, "linux,default-trigger", NULL);
>> -
>> +		ret = lp5xx_parse_channel_child(child, cfg, i);
>> +		if (ret)
>> +			return ERR_PTR(-EINVAL);
>>   		i++;
>>   	}
>>   
>> diff --git a/drivers/leds/leds-lp55xx-common.h b/drivers/leds/leds-lp55xx-common.h
>> index 783ed5103ce5..5ea2a292a97e 100644
>> --- a/drivers/leds/leds-lp55xx-common.h
>> +++ b/drivers/leds/leds-lp55xx-common.h
>> @@ -12,6 +12,10 @@
>>   #ifndef _LEDS_LP55XX_COMMON_H
>>   #define _LEDS_LP55XX_COMMON_H
>>   
>> +#include <linux/led-class-multicolor.h>
>> +
>> +#define LP55XX_MAX_GROUPED_CHAN	4
>> +
>>   enum lp55xx_engine_index {
>>   	LP55XX_ENGINE_INVALID,
>>   	LP55XX_ENGINE_1,
>> @@ -109,6 +113,9 @@ struct lp55xx_device_config {
>>   	/* access brightness register */
>>   	int (*brightness_fn)(struct lp55xx_led *led);
>>   
>> +	/* access specific brightness register */
>> +	int (*color_intensity_fn)(struct lp55xx_led *led, int chan_num, int brightness);
>> +
>>   	/* current setting function */
>>   	void (*set_led_current) (struct lp55xx_led *led, u8 led_current);
>>   
>> @@ -159,6 +166,7 @@ struct lp55xx_chip {
>>    * struct lp55xx_led
>>    * @chan_nr         : Channel number
>>    * @cdev            : LED class device
>> + * @mc_cdev	    : Multi color class device
>>    * @led_current     : Current setting at each led channel
>>    * @max_current     : Maximun current at each led channel
>>    * @brightness      : Brightness value
> Documentation for channel_color and grouped_channels is missing.
>
ACK


>> @@ -167,9 +175,12 @@ struct lp55xx_chip {
>>   struct lp55xx_led {
>>   	int chan_nr;
>>   	struct led_classdev cdev;
>> +	struct led_classdev_mc mc_cdev;
>>   	u8 led_current;
>>   	u8 max_current;
>>   	u8 brightness;
>> +	int channel_color[LP55XX_MAX_GROUPED_CHAN];
>> +	int grouped_channels[LP55XX_MAX_GROUPED_CHAN];
> I propose to create structure:
>
> struct lp55xx_mc_cluster {
> 	int channel_color;
> 	int channel_id;
> };
>
> and instead of the above two arrays create one
>
> struct lp55xx_mc_cluster mc_cluster[LP55XX_MAX_GROUPED_CHAN];

Maybe we can extend the mc_color_converion struct to add output_num.

Now I did try to do this but the design of the code made it a bit 
wonky.  I will look at it again.

If the output_num information is contain in a single struct as opposed 
to having each driver create their own struct.

struct led_mc_color_conversion {
     int color_id;
     int brightness;

     int output_num;

};

struct led_mc_color_conversion mc_cluster[LP55XX_MAX_GROUPED_CHAN];

If other drivers do not need that information then they do not need to 
populate it

>
>>   	struct lp55xx_chip *chip;
>>   };
>>   
>> diff --git a/include/linux/platform_data/leds-lp55xx.h b/include/linux/platform_data/leds-lp55xx.h
>> index 96a787100fda..0ac29f537ab6 100644
>> --- a/include/linux/platform_data/leds-lp55xx.h
>> +++ b/include/linux/platform_data/leds-lp55xx.h
>> @@ -12,6 +12,8 @@
>>   #ifndef _LEDS_LP55XX_H
>>   #define _LEDS_LP55XX_H
>>   
>> +#include <linux/led-class-multicolor.h>
>> +
>>   /* Clock configuration */
>>   #define LP55XX_CLOCK_AUTO	0
>>   #define LP55XX_CLOCK_INT	1
>> @@ -23,6 +25,10 @@ struct lp55xx_led_config {
>>   	u8 chan_nr;
>>   	u8 led_current; /* mA x10, 0 if led is not connected */
>>   	u8 max_current;
>> +	int num_colors;
>> +	unsigned long available_colors;
>> +	u32 channel_color[LED_COLOR_ID_MAX];
> channel_color array is redundant if you have available_colors flags.

I will look this again.


>> +	int grouped_channels[LED_COLOR_ID_MAX];
>>   };
>>   
>>   struct lp55xx_predef_pattern {
>>
