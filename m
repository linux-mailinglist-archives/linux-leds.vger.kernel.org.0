Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D361FE19F4
	for <lists+linux-leds@lfdr.de>; Wed, 23 Oct 2019 14:23:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726636AbfJWMXe (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 23 Oct 2019 08:23:34 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:53300 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731061AbfJWMXd (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 23 Oct 2019 08:23:33 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9NCNSWC035580;
        Wed, 23 Oct 2019 07:23:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1571833408;
        bh=GkW5gJVbTW+LhOlY4Ins8dpTt10fVxvgFsWnyyXMmEo=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=OarjQGalMDcQPW6kMg3U5Q8RI82bBJFkARMx4QqnB3AtkoEfO4kYJBivf3Z2d6IFu
         hD9EEs5EkSErWE9hW9Opv5jY0SH+EmAIBROjG+cYLFd1I5jpvNIGf1WZ5YFE8E7fYh
         M9I29WttA0GhMpE4M2P2WgdMfBewJTAWlt3wsFck=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9NCNShO012608;
        Wed, 23 Oct 2019 07:23:28 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 23
 Oct 2019 07:23:18 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 23 Oct 2019 07:23:18 -0500
Received: from [10.250.35.43] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9NCNSMH004188;
        Wed, 23 Oct 2019 07:23:28 -0500
Subject: Re: [PATCH v14 13/19] leds: lp55xx: Add multicolor framework support
 to lp55xx
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>
CC:     <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20191018122521.6757-1-dmurphy@ti.com>
 <20191018122521.6757-14-dmurphy@ti.com>
 <a24832d9-1c3d-b3ea-4326-2ef4937d5a59@gmail.com>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <44796209-104e-66f1-e1e0-2f3dfe3d7cd7@ti.com>
Date:   Wed, 23 Oct 2019 07:22:44 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <a24832d9-1c3d-b3ea-4326-2ef4937d5a59@gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Jacek

On 10/18/19 4:48 PM, Jacek Anaszewski wrote:
> Dan,
>
> On 10/18/19 2:25 PM, Dan Murphy wrote:
>> Add multicolor framework support for the lp55xx family.
>>
>> Signed-off-by: Dan Murphy <dmurphy@ti.com>
>> ---
>>   drivers/leds/Kconfig                      |   1 +
>>   drivers/leds/leds-lp55xx-common.c         | 185 +++++++++++++++++++---
>>   drivers/leds/leds-lp55xx-common.h         |   9 ++
>>   include/linux/platform_data/leds-lp55xx.h |   7 +
>>   4 files changed, 179 insertions(+), 23 deletions(-)
>>
>> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
>> index fb614a6b9afa..5706bf8d8bd1 100644
>> --- a/drivers/leds/Kconfig
>> +++ b/drivers/leds/Kconfig
>> @@ -377,6 +377,7 @@ config LEDS_LP50XX
>>   config LEDS_LP55XX_COMMON
>>   	tristate "Common Driver for TI/National LP5521/5523/55231/5562/8501"
>>   	depends on LEDS_LP5521 || LEDS_LP5523 || LEDS_LP5562 || LEDS_LP8501
>> +	depends on OF
>>   	select FW_LOADER
>>   	select FW_LOADER_USER_HELPER
>>   	help
>> diff --git a/drivers/leds/leds-lp55xx-common.c b/drivers/leds/leds-lp55xx-common.c
>> index 882ef39e4965..197b87ca5ca2 100644
>> --- a/drivers/leds/leds-lp55xx-common.c
>> +++ b/drivers/leds/leds-lp55xx-common.c
>> @@ -131,14 +131,62 @@ static struct attribute *lp55xx_led_attrs[] = {
>>   };
>>   ATTRIBUTE_GROUPS(lp55xx_led);
>>   
>> +#if IS_ENABLED(CONFIG_LEDS_CLASS_MULTI_COLOR)
>> +static int lp55xx_map_channel(struct lp55xx_led *led, int color_id,
>> +			      enum led_brightness brightness)
> If you changed the type of the first parameter to
> struct led_mc_color_conversion* then you could make this function local
> in LED mc class and call it in led_mc_calc_color_components() after
> calculating brightness components.

I prefer to leave this here and if this code is ever integrated we can 
see if there is a common need for the MC class to expose a mapping API.

>
>> +{
>> +	int i;
>> +
>> +	for (i = 0; i < led->mc_cdev.num_leds; i++) {
>> +		if (led->color_components[i].color_id == color_id) {
>> +			led->color_components[i].brightness = brightness;
>> +			return 0;
>> +		}
>> +	}
>> +
>> +	return -EINVAL;
>> +}
>> +#endif
>> +
>> +static int lp55xx_set_mc_brightness(struct lp55xx_led *led,
>> +				    struct lp55xx_device_config *cfg,
>> +				     enum led_brightness brightness)
>> +{
>> +	int ret = -EINVAL;
>> +#if IS_ENABLED(CONFIG_LEDS_CLASS_MULTI_COLOR)
>> +	struct led_mc_color_conversion color_components[LP55XX_MAX_GROUPED_CHAN];
> You wouldn't need this local variable then.

>> +	int i;
>> +
>> +	if (!cfg->multicolor_brightness_fn)
>> +		return -EINVAL;
>> +
>> +	led_mc_calc_color_components(&led->mc_cdev, brightness,
>> +				     color_components);
> Because you could pass what you already have in the struct lp55xx_led:
>
> led_mc_calc_color_components(&led->mc_cdev, brightness,
>                               led->color_components);

Well that is not entirely accurate the led->color_components is the data 
that we have from the DT that should not be changed. Passing this into 
the MC calc function would mean that the framework would have to map the 
output to the color_id.  As I indicated above for now I don't think the 
MC class should do any mapping of color_id to the output.


>
>> +
>> +	for (i = 0; i < led->mc_cdev.num_leds; i++) {
>> +		ret = lp55xx_map_channel(led, color_components[i].color_id,
>> +					 color_components[i].brightness);
>> +		if (ret)
>> +			return ret;
>> +	}
> And this loop would execute inside the previous call, thus it is to be
> optimized out from here.
>
>> +
>> +	ret = cfg->multicolor_brightness_fn(led);
>> +#endif
>> +	return ret;
>> +}
>> +
>>   static int lp55xx_set_brightness(struct led_classdev *cdev,
>>   			     enum led_brightness brightness)
>>   {
>>   	struct lp55xx_led *led = cdev_to_lp55xx_led(cdev);
>>   	struct lp55xx_device_config *cfg = led->chip->cfg;
>>   
>> -	led->brightness = (u8)brightness;
>> -	return cfg->brightness_fn(led);
>> +	if (led->mc_cdev.num_leds > 1) {
>> +		return lp55xx_set_mc_brightness(led, cfg, brightness);
>> +	} else {
>> +		led->brightness = (u8)brightness;
>> +		return cfg->brightness_fn(led);
>> +	}
>>   }
>>   
>>   static int lp55xx_init_led(struct lp55xx_led *led,
>> @@ -147,9 +195,9 @@ static int lp55xx_init_led(struct lp55xx_led *led,
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
>> @@ -159,10 +207,34 @@ static int lp55xx_init_led(struct lp55xx_led *led,
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
>> +		memcpy(led->color_components,
>> +		       pdata->led_config[chan].color_components,
>> +		       sizeof(led->color_components));
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
>> @@ -170,18 +242,13 @@ static int lp55xx_init_led(struct lp55xx_led *led,
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
>> +#if IS_ENABLED(CONFIG_LEDS_CLASS_MULTI_COLOR)
>> +	if (pdata->led_config[chan].num_colors > 1)
>> +		ret = devm_led_classdev_multicolor_register(dev, &led->mc_cdev);
>> +	else
>> +#endif
>> +		ret = devm_led_classdev_register(dev, &led->cdev);
>>   
>> -	ret = devm_led_classdev_register(dev, &led->cdev);
>>   	if (ret) {
>>   		dev_err(dev, "led register err: %d\n", ret);
>>   		return ret;
>> @@ -525,6 +592,82 @@ void lp55xx_unregister_sysfs(struct lp55xx_chip *chip)
>>   }
>>   EXPORT_SYMBOL_GPL(lp55xx_unregister_sysfs);
>>   
>> +static int lp5xx_parse_common_child(struct device_node *np,
>> +				    struct lp55xx_led_config *cfg,
>> +				    int chan_num, bool is_multicolor,
>> +				    int color_num)
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
>> +		cfg[chan_num].color_components[color_num].output_num =
>> +								led_number;
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
>> +	int num_colors = 0;
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
>> +						       child_number, true,
>> +						       num_colors);
>> +			if (ret)
>> +				return ret;
>> +
>> +			ret = of_property_read_u32(child, "color", &color_id);
>> +			if (ret)
>> +				return ret;
>> +
>> +			cfg[child_number].color_components[num_colors].color_id =
>> +						color_id;
>> +			set_bit(color_id, &cfg[child_number].available_colors);
>> +			num_colors++;
>> +		}
>> +
>> +		cfg[child_number].num_colors = num_colors;
>> +	} else {
>> +		return lp5xx_parse_common_child(np, cfg, child_number, false,
>> +						num_colors);
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>>   struct lp55xx_platform_data *lp55xx_of_populate_pdata(struct device *dev,
>>   						      struct device_node *np)
>>   {
>> @@ -533,6 +676,7 @@ struct lp55xx_platform_data *lp55xx_of_populate_pdata(struct device *dev,
>>   	struct lp55xx_led_config *cfg;
>>   	int num_channels;
>>   	int i = 0;
>> +	int ret;
>>   
>>   	pdata = devm_kzalloc(dev, sizeof(*pdata), GFP_KERNEL);
>>   	if (!pdata)
>> @@ -552,14 +696,9 @@ struct lp55xx_platform_data *lp55xx_of_populate_pdata(struct device *dev,
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
> I went into details of this parsing and finally came up with
> the code which is a bit greater in size, but IMHO cleaner.
> Note changes in variable naming. It is not even compile-tested.
>
> static int lp55xx_parse_common_child(struct device_node *np,
>                                      struct lp55xx_led_config *cfg,
>                                      int led_number, int *chan_nr)
> {
>          int ret;
>
>          of_property_read_string(np, "chan-name",
>                                  &cfg[led_number].name);
>          of_property_read_u8(np, "led-cur",
>                              &cfg[led_number].led_current);
>          of_property_read_u8(np, "max-cur",
>                              &cfg[led_number].max_current);
>
>          ret = of_property_read_u32(np, "reg", chan_nr);
>          if (ret)
>                  return ret;
>
>          if (chan_nr < 0 || chan_nr > cfg->max_chan_nr) /* side note: new
> max_chan_nr property needed in cfg */
>                  return -EINVAL;
>
>          return 0;
> }
>
> static int lp55xx_parse_mutli_led_child(struct device_node *np,
>                                          struct lp55xx_led_config *cfg,
>                                          int child_number,
>                                          int color_number)
> {
>          int chan_nr, color_id;
>
>          ret = lp55xx_parse_common_child(child, cfg, child_number,
> color_number,
>                                          &chan_nr);
>          if (ret)
>                  return ret;
>
>          ret = of_property_read_u32(child, "color", &color_id);
>          if (ret)
>                 return ret;
>
>          cfg[child_number].color_components[color_number].color_id =
> color_id;
>          cfg[child_number].color_components[color_number].output_num =
> chan_nr;
>          set_bit(color_id, &cfg[child_number].available_colors);
>
>          return 0;
> }
>
> staitc int lp55xx_parse_mutli_led(struct device_node *np,
>                                    struct lp55xx_led_config *cfg,
>                                    int child_number)
> {
>          struct device_node *child;
>          int num_colors = 0, i = 0;
>
>          for_each_child_of_node(np, child) {
>                  ret = lp55xx_parse_mutli_led_child(child, cfg, num_colors,
>                                                     child_number, i))
>                  if (ret)
>                          return ret;
>                  num_colors++;
>          }
> }
>
> static int lp5xx_parse_logical_led(struct device_node *np,
>                                     struct lp55xx_led_config *cfg,
>                                     int child_number)
> {
>          int led_color, ret;
>
>          cfg[child_number].default_trigger =
>                  of_get_property(np, "linux,default-trigger", NULL);
>
>          ret = of_property_read_u32(np, "color", &led_color);
>
>          if (ret) {
>                  int chan_nr;
>                  ret =  lp55xx_parse_common_child(np, cfg, child_number,
>                                                   &chan_nr);
>                  if (ret < 0)
>                         return ret;
>                  cfg[child_number].chan_nr = chan_nr;
>          } else if (led_color == LED_COLOR_ID_MULTI) {
>                  return lp55xx_parse_mutli_led(np, cfg, child_number);
>          } else
>                  return ret;
>
>          return 0;
> }
>
>
> for_each_child_of_node(np, child) {
>          ret = lp55xx_parse_logical_led(child, cfg, i);
>          if (ret)
>                  return ERR_PTR(-EINVAL);
>          i++;
> }
>
>
> It maybe worth also to check if channel has not been already taken.
>
I will board test this solution.

Dan

