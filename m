Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 821587CC57
	for <lists+linux-leds@lfdr.de>; Wed, 31 Jul 2019 20:55:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729012AbfGaSzb (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 31 Jul 2019 14:55:31 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:33186 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727809AbfGaSzb (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 31 Jul 2019 14:55:31 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x6VItQVq032649;
        Wed, 31 Jul 2019 13:55:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1564599326;
        bh=WArdQ13rzdUPYI+IKJ7QQKP6F52/uXs8lTmQdPF+qDk=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=onuklNkvOb2mMybRhXJfy2KaqzveCZiW1tXzVgSJJQ/9VPJoL+iRdzUYEAb5QJ5Oq
         6X9j1f33MYTi5fMtFyG0BLiaOpksWDPx4wdg4zIv71okDxAVkS/palpmQe0VG9T8q4
         07fX8o4bHZbyh0cdrRGmiEP4iN61kvhsILCSv1KU=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x6VItQCQ105070
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 31 Jul 2019 13:55:26 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 31
 Jul 2019 13:55:26 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 31 Jul 2019 13:55:26 -0500
Received: from [10.250.65.13] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x6VItQ8b051782;
        Wed, 31 Jul 2019 13:55:26 -0500
Subject: Re: [PATCH v4 9/9] leds: Update the lp55xx to use the multi color
 framework
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>
CC:     <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20190725182818.29556-1-dmurphy@ti.com>
 <20190725182818.29556-10-dmurphy@ti.com>
 <fe3bbfbe-5b15-d87a-f4a1-28167081046b@gmail.com>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <486308e9-e3e1-5f34-5af7-217527f2f1f9@ti.com>
Date:   Wed, 31 Jul 2019 13:55:26 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <fe3bbfbe-5b15-d87a-f4a1-28167081046b@gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Jacek

Thanks for looking

On 7/31/19 1:45 PM, Jacek Anaszewski wrote:
> Hi Dan,
>
> Thank you for the patch. My comments are below.
>
> On 7/25/19 8:28 PM, Dan Murphy wrote:
>> Update the lp5523 to use the multi color framework.
>>
>> Signed-off-by: Dan Murphy <dmurphy@ti.com>
>> ---
>>   drivers/leds/leds-lp5523.c                |  13 ++
>>   drivers/leds/leds-lp55xx-common.c         | 153 ++++++++++++++++++----
>>   drivers/leds/leds-lp55xx-common.h         |  10 ++
>>   include/linux/platform_data/leds-lp55xx.h |   6 +
>>   modules.builtin.modinfo                   | Bin 0 -> 43550 bytes
>>   5 files changed, 159 insertions(+), 23 deletions(-)
>>   create mode 100644 modules.builtin.modinfo
>>
>> diff --git a/drivers/leds/leds-lp5523.c b/drivers/leds/leds-lp5523.c
>> index d0b931a136b9..45380b32563f 100644
>> --- a/drivers/leds/leds-lp5523.c
>> +++ b/drivers/leds/leds-lp5523.c
>> @@ -791,6 +791,18 @@ static ssize_t store_master_fader_leds(struct device *dev,
>>   	return ret;
>>   }
>>   
>> +static int lp5523_led_intensity(struct lp55xx_led *led, int chan_num)
>> +{
>> +	struct lp55xx_chip *chip = led->chip;
>> +	int ret;
>> +
>> +	mutex_lock(&chip->lock);
>> +	ret = lp55xx_write(chip, LP5523_REG_LED_PWM_BASE + chan_num,
>> +		     led->brightness);
>> +	mutex_unlock(&chip->lock);
>> +	return ret;
>> +}
>> +
>>   static int lp5523_led_brightness(struct lp55xx_led *led)
>>   {
>>   	struct lp55xx_chip *chip = led->chip;
>> @@ -857,6 +869,7 @@ static struct lp55xx_device_config lp5523_cfg = {
>>   	.max_channel  = LP5523_MAX_LEDS,
>>   	.post_init_device   = lp5523_post_init_device,
>>   	.brightness_fn      = lp5523_led_brightness,
>> +	.intensity_fn       = lp5523_led_intensity,
>>   	.set_led_current    = lp5523_set_led_current,
>>   	.firmware_cb        = lp5523_firmware_loaded,
>>   	.run_engine         = lp5523_run_engine,
>> diff --git a/drivers/leds/leds-lp55xx-common.c b/drivers/leds/leds-lp55xx-common.c
>> index 44ced02b49f9..32a4ab8664ca 100644
>> --- a/drivers/leds/leds-lp55xx-common.c
>> +++ b/drivers/leds/leds-lp55xx-common.c
>> @@ -35,6 +35,11 @@ static struct lp55xx_led *dev_to_lp55xx_led(struct device *dev)
>>   	return cdev_to_lp55xx_led(dev_get_drvdata(dev));
>>   }
>>   
>> +static struct lp55xx_led *mcdev_to_lp55xx_led(struct led_classdev_mc *mc_dev)
>> +{
>> +	return container_of(mc_dev, struct lp55xx_led, mc_cdev);
>> +}
>> +
>>   static void lp55xx_reset_device(struct lp55xx_chip *chip)
>>   {
>>   	struct lp55xx_device_config *cfg = chip->cfg;
>> @@ -136,20 +141,55 @@ static int lp55xx_set_brightness(struct led_classdev *cdev,
>>   {
>>   	struct lp55xx_led *led = cdev_to_lp55xx_led(cdev);
>>   	struct lp55xx_device_config *cfg = led->chip->cfg;
>> +	int adj_value[LED_COLOR_ID_MAX];
>> +	int ret;
>> +	int i;
>> +
>> +	if (led->mc_cdev.num_leds > 1) {
>> +		set_cluster_brightness(&led->mc_cdev, brightness, adj_value);
>> +		for (i = 0; i < led->mc_cdev.num_leds; i++) {
>> +			led->brightness = adj_value[i];
>> +			ret = cfg->intensity_fn(led, led->grouped_channels[i]);
> At first glance I would have hard time discerning between brightness_fn
> and intensity_fn purpose. Maybe color_intensity_fn?
>
Ack


>> +			if (ret)
>> +				break;
>> +		}
>> +	} else {
>> +		led->brightness = (u8)brightness;
> What benefit stems actually from having the copy of brightness
> in struct lp55xx_led, when we already have struct led_classdev
> there? I know that this is pre-existing, but could be optimized away
> while at it. We can have local u8 variable in the op setting brightness
> and cast enum_led_brightness to it before passing to lp55xx_write().
>
This was a carry over from the original driver.  Ln 140.

I am not looking to change existing code functionality.

First pass was just to introduce mc_fw with no disruption or regression

to the base functionality.


>> +		ret = cfg->brightness_fn(led);
>> +	}
>> +
>> +	return ret;
>> +}
>> +
>> +static int lp55xx_set_color(struct led_classdev_mc *mcled_cdev,
>> +			    int color, int value)
>> +{
>> +	struct lp55xx_led *led = mcdev_to_lp55xx_led(mcled_cdev);
>> +	struct lp55xx_device_config *cfg = led->chip->cfg;
>> +	int i;
>> +
>> +	for (i = 0; i < led->mc_cdev.num_leds; i++) {
>> +		if (led->channel_color[i] == color)
>> +			break;
>> +	}
>>   
>> -	led->brightness = (u8)brightness;
>> -	return cfg->brightness_fn(led);
>> +	led->brightness = (u8)value;
>> +	return cfg->intensity_fn(led, led->grouped_channels[i]);
>>   }
>>   
>> +static struct led_multicolor_ops lp55xx_mc_ops = {
>> +	.set_color_brightness = lp55xx_set_color,
>> +};
>> +
>>   static int lp55xx_init_led(struct lp55xx_led *led,
>>   			struct lp55xx_chip *chip, int chan)
>>   {
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
>> @@ -159,10 +199,37 @@ static int lp55xx_init_led(struct lp55xx_led *led,
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
>> +		led->cdev.name = led->cdev.name;
> ?

Duplicate I see that now.


>> +		led->cdev.groups = lp55xx_led_groups;
>> +		led->mc_cdev.ops = &lp55xx_mc_ops;
>> +		led->mc_cdev.num_leds = pdata->led_config[chan].num_colors;
>> +		led->mc_cdev.available_colors = pdata->led_config[chan].available_colors;
>> +		memcpy(led->channel_color,
>> +		       pdata->led_config[chan].channel_color,
>> +		       sizeof(led->channel_color));
>> +		memcpy(led->grouped_channels,
>> +		       pdata->led_config[chan].grouped_channels,
>> +		       sizeof(led->grouped_channels));
>> +	} else {
>> +
>> +		led->cdev.default_trigger = pdata->led_config[chan].default_trigger;
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
>> @@ -170,18 +237,11 @@ static int lp55xx_init_led(struct lp55xx_led *led,
>>   		return -EINVAL;
>>   	}
>>   
>> -	led->cdev.brightness_set_blocking = lp55xx_set_brightness;
>> -	led->cdev.groups = lp55xx_led_groups;
>> -
>> -	if (pdata->led_config[chan].name) {
>> -		led->cdev.name = pdata->led_config[chan].name;
>> -	} else {
>> -		snprintf(name, sizeof(name), "%s:channel%d",
>> -			pdata->label ? : chip->cl->name, chan);
>> -		led->cdev.name = name;
>> -	}
>> +	if (pdata->led_config[chan].num_colors > 1)
>> +		ret = led_classdev_multicolor_register(dev, &led->mc_cdev);
>> +	else
>> +		ret = led_classdev_register(dev, &led->cdev);
> Why not devm ?

I will call the devm_ for multicolor but conversion for not MC should be 
done separately

Again not trying to regress original functionality.

>> -	ret = led_classdev_register(dev, &led->cdev);
>>   	if (ret) {
>>   		dev_err(dev, "led register err: %d\n", ret);
>>   		return ret;
>> @@ -466,7 +526,6 @@ int lp55xx_register_leds(struct lp55xx_led *led, struct lp55xx_chip *chip)
>>   		dev_err(&chip->cl->dev, "empty brightness configuration\n");
>>   		return -EINVAL;
>>   	}
>> -
>>   	for (i = 0; i < num_channels; i++) {
>>   
>>   		/* do not initialize channels that are not connected */
>> @@ -538,6 +597,39 @@ void lp55xx_unregister_sysfs(struct lp55xx_chip *chip)
>>   }
>>   EXPORT_SYMBOL_GPL(lp55xx_unregister_sysfs);
>>   
>> +static int lp5xx_parse_channel_child(struct device_node *np,
>> +				     struct lp55xx_led_config *cfg,
>> +				     int chan_num)
>> +{
>> +	struct device_node *child;
>> +	int num_colors = 0;
>> +	u32 color_id;
>> +	u32 led_number;
>> +	int ret;
>> +
>> +	cfg[chan_num].default_trigger =
>> +			of_get_property(np, "linux,default-trigger", NULL);
>> +
>> +	for_each_child_of_node(np, child) {
>> +		of_property_read_string(child, "chan-name",
>> +					&cfg[chan_num].name);
>> +		of_property_read_u8(child, "led-cur",
>> +				    &cfg[chan_num].led_current);
>> +		of_property_read_u8(child, "max-cur",
>> +				    &cfg[chan_num].max_current);
>> +		of_property_read_u32(child, "color", &color_id);
>> +		cfg[chan_num].channel_color[num_colors] = color_id;
>> +		cfg[chan_num].available_colors |= 1 << color_id;
> set_bit(color_id, &cfg[chan_num].available_colors);

Ack


>
>> +		ret = of_property_read_u32(child, "reg", &led_number);
>> +		cfg[chan_num].grouped_channels[num_colors] = led_number;
>> +		num_colors++;
>> +	}
>> +
>> +	cfg->num_colors = num_colors;
>> +
>> +	return 0;
>> +}
>> +
>>   struct lp55xx_platform_data *lp55xx_of_populate_pdata(struct device *dev,
>>   						      struct device_node *np)
>>   {
>> @@ -545,6 +637,8 @@ struct lp55xx_platform_data *lp55xx_of_populate_pdata(struct device *dev,
>>   	struct lp55xx_platform_data *pdata;
>>   	struct lp55xx_led_config *cfg;
>>   	int num_channels;
>> +	int num_chan_children;
>> +	u32 led_number;
>>   	int i = 0;
>>   
>>   	pdata = devm_kzalloc(dev, sizeof(*pdata), GFP_KERNEL);
>> @@ -565,13 +659,26 @@ struct lp55xx_platform_data *lp55xx_of_populate_pdata(struct device *dev,
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
>> +		num_chan_children = of_get_child_count(child);
>> +		if (num_chan_children != 0)
> You're already parsing color. If it is present and equals
> LED_COLOR_ID_MULTI then we should expect children in the node.

I don't see any parsing for color here but I suppose that I can add that now

since it is a common property and if == ID_MULTI then parse children.


>
>> +			lp5xx_parse_channel_child(child, cfg, i);
>> +		else {
>> +			of_property_read_string(child, "chan-name",
>> +						&cfg[i].name);
>> +			of_property_read_u8(child, "led-cur",
>> +					    &cfg[i].led_current);
>> +			of_property_read_u8(child, "max-cur",
>> +					    &cfg[i].max_current);
>> +			cfg[i].default_trigger =
>> +				of_get_property(child, "linux,default-trigger",
>> +						NULL);
>> +			of_property_read_u32(child, "reg", &led_number);
>> +
>> +			if (led_number < 0 || led_number > 6)
>> +				return ERR_PTR(EINVAL);
> I see code redundancy here. There are common properties to parse
> in both multi color and monochrome LED case: chan-name, led-cur,
> max-cur, linux,default-trigger, reg. We could have one function
> for parsing this common subset.

ACK


>> +
>> +			cfg[i].chan_nr = led_number;
>> +		}
>>   
>>   		i++;
>>   	}
>> diff --git a/drivers/leds/leds-lp55xx-common.h b/drivers/leds/leds-lp55xx-common.h
>> index 783ed5103ce5..0737e79bc21b 100644
>> --- a/drivers/leds/leds-lp55xx-common.h
>> +++ b/drivers/leds/leds-lp55xx-common.h
>> @@ -12,6 +12,8 @@
>>   #ifndef _LEDS_LP55XX_COMMON_H
>>   #define _LEDS_LP55XX_COMMON_H
>>   
>> +#include <linux/led-class-multicolor.h>
>> +
>>   enum lp55xx_engine_index {
>>   	LP55XX_ENGINE_INVALID,
>>   	LP55XX_ENGINE_1,
>> @@ -109,6 +111,9 @@ struct lp55xx_device_config {
>>   	/* access brightness register */
>>   	int (*brightness_fn)(struct lp55xx_led *led);
>>   
>> +	/* access specific brightness register */
>> +	int (*intensity_fn)(struct lp55xx_led *led, int chan_num);
>> +
>>   	/* current setting function */
>>   	void (*set_led_current) (struct lp55xx_led *led, u8 led_current);
>>   
>> @@ -159,6 +164,7 @@ struct lp55xx_chip {
>>    * struct lp55xx_led
>>    * @chan_nr         : Channel number
>>    * @cdev            : LED class device
>> + * @mc_cdev	    : Multi color class device
>>    * @led_current     : Current setting at each led channel
>>    * @max_current     : Maximun current at each led channel
>>    * @brightness      : Brightness value
>> @@ -167,9 +173,13 @@ struct lp55xx_chip {
>>   struct lp55xx_led {
>>   	int chan_nr;
>>   	struct led_classdev cdev;
>> +	struct led_classdev_mc mc_cdev;
>>   	u8 led_current;
>>   	u8 max_current;
>>   	u8 brightness;
>> +/*	int num_colors;*/
>> +	int channel_color[LED_COLOR_ID_MAX];
>> +	int grouped_channels[LED_COLOR_ID_MAX];
>>   	struct lp55xx_chip *chip;
>>   };
>>   
>> diff --git a/include/linux/platform_data/leds-lp55xx.h b/include/linux/platform_data/leds-lp55xx.h
>> index 96a787100fda..adce8cec411b 100644
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
>> +	int available_colors;
> unsigned long

ACK


>
>> +	u32 channel_color[LED_COLOR_ID_MAX];
>> +	int grouped_channels[LED_COLOR_ID_MAX];
>>   };
>>   
>>   struct lp55xx_predef_pattern {
>> diff --git a/modules.builtin.modinfo b/modules.builtin.modinfo
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..e528d8f57796621b6cfef52ad0da44551a482481
>> GIT binary patch
>> literal 43550
>> zcmcJ2?Q+|=(x(2ta}}twKjNIV<j*)6t(~$X+ldo9*0G$-%sF+IMNyQ*NF)`K@<-~u
>> zoV|v<f%nGt=>|YGNXqfd?pCE75g*+RpaC?x8;w!ycl>2BO|zrh@WId3MUofUG7gi1
>> zeg~})3e2M*O!DyPegBfbM`0dh(V~db<mme9q^|~l3~tY^)aliUI=#90dUn&gPqW$g
> [...]
>
> This has gotten here by mistake I presume.


Yes Will remove this

