Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C82C9D495A
	for <lists+linux-leds@lfdr.de>; Fri, 11 Oct 2019 22:36:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728814AbfJKUgV (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 11 Oct 2019 16:36:21 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:35192 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729049AbfJKUgU (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 11 Oct 2019 16:36:20 -0400
Received: by mail-wm1-f66.google.com with SMTP id y21so11355783wmi.0;
        Fri, 11 Oct 2019 13:36:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Gsq4kTWKqpDeFkAYjAqZpducEBtOrtANSZzS3gbLDmc=;
        b=gQHbsHRefVF8wH+y8bAtqqNVgwdrLLP6JYKsrkNN/IwH4hmomhfWqq3XIyCOd5Mj/I
         qzr9bLf37DLhRrAqEf7xTkZ9/FZHO5tDMU1Pat8sgj+BhnD1jCxUZ9CG2lkRZ/6/+tcI
         0MziRA6AKnCC8gLJMLniBpD5dyuRxgq5pPi0ntuGxPIBCyjJOLu3EtKf9hSr1Is5IOO/
         i+hxex5G3dSO4r8cak45tZbAXSHqQzsq1h2OG6WLcy5w62Zh/AfwKRhyeCAbl72xkEuz
         /C0q0H0sBKEcgYc7xPRoEjuWMBedtAmf6qM/X8gIGScCXxq/wteRRYfwFSPXNg+iLMi/
         nGeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=Gsq4kTWKqpDeFkAYjAqZpducEBtOrtANSZzS3gbLDmc=;
        b=SuNtePDIFXMMHJEPMLZUbeuVRqj5PoGfCTbHCgAokCpv8qnekgRjOU0CSjsj1UKOAy
         VeUlUcxjM9V1HU/qJ1Bpz/eagYR88CdRolah1o+gJOsOVhbrxwM8Ct8ISSeZqtFzwOph
         AoZx+iVfijyeUEyqZLZW8klUIF4fwuMOSWtGNavXXQ2R6jGCouD+3Y3WqpPgzFFRjcvj
         iYXaFwRSrFxHO3EAJ9a498HyGzDYgsLeNhy5D6jZUxUineeNtaZEmxxv7AVc9tBZ9Ahu
         ZHpTJnbElmNHAatNzAG1S7ZWGZDivchxUik6uG2rRWsu3HyTvF99sX95I++rp7Da04gB
         5n5Q==
X-Gm-Message-State: APjAAAVMZjQ8XYFunqjNyk2ez1mhJb8ntXiyAYjddP3W/3VwC5BJOZCv
        dV8mYAFskqk4Jqy0lVAUGcSDwjtP
X-Google-Smtp-Source: APXvYqwtGymEh1Sp2WlVJRDAh5UbsJNkKK7/rtzdxXv2bPMi0bgz5yI7xQ6Ldvh4/UdM3Nra62itTg==
X-Received: by 2002:a1c:e455:: with SMTP id b82mr4522878wmh.41.1570826176243;
        Fri, 11 Oct 2019 13:36:16 -0700 (PDT)
Received: from [192.168.1.19] (cjl71.neoplus.adsl.tpnet.pl. [83.31.61.71])
        by smtp.gmail.com with ESMTPSA id x129sm16961566wmg.8.2019.10.11.13.36.14
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 11 Oct 2019 13:36:15 -0700 (PDT)
Subject: Re: [PATCH v12 12/16] leds: lp55xx: Add multicolor framework support
 to lp55xx
To:     Dan Murphy <dmurphy@ti.com>, pavel@ucw.cz
Cc:     linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20191011130657.4713-1-dmurphy@ti.com>
 <20191011130657.4713-13-dmurphy@ti.com>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=jacek.anaszewski@gmail.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <a5a6af00-24d4-1136-23e4-48f50ff51400@gmail.com>
Date:   Fri, 11 Oct 2019 22:36:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191011130657.4713-13-dmurphy@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Dan,

On 10/11/19 3:06 PM, Dan Murphy wrote:
> Add multicolor framework support for the lp55xx family.
> 
> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> ---
>  drivers/leds/Kconfig                      |   1 +
>  drivers/leds/leds-lp55xx-common.c         | 176 +++++++++++++++++++---
>  drivers/leds/leds-lp55xx-common.h         |   9 ++
>  include/linux/platform_data/leds-lp55xx.h |   7 +
>  4 files changed, 169 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> index fb614a6b9afa..5706bf8d8bd1 100644
> --- a/drivers/leds/Kconfig
> +++ b/drivers/leds/Kconfig
> @@ -377,6 +377,7 @@ config LEDS_LP50XX
>  config LEDS_LP55XX_COMMON
>  	tristate "Common Driver for TI/National LP5521/5523/55231/5562/8501"
>  	depends on LEDS_LP5521 || LEDS_LP5523 || LEDS_LP5562 || LEDS_LP8501
> +	depends on OF
>  	select FW_LOADER
>  	select FW_LOADER_USER_HELPER
>  	help
> diff --git a/drivers/leds/leds-lp55xx-common.c b/drivers/leds/leds-lp55xx-common.c
> index 44ced02b49f9..1417df6df8a7 100644
> --- a/drivers/leds/leds-lp55xx-common.c
> +++ b/drivers/leds/leds-lp55xx-common.c
> @@ -131,14 +131,54 @@ static struct attribute *lp55xx_led_attrs[] = {
>  };
>  ATTRIBUTE_GROUPS(lp55xx_led);
>  
> +static int lp55xx_map_channel(struct lp55xx_led *led, int color_id,
> +			      enum led_brightness brightness)
> +{
> +	int i;
> +
> +	for (i = 0; i < led->mc_cdev.num_leds; i++) {
> +		if (led->color_component[i].color_id == color_id) {
> +			led->color_component[i].brightness = brightness;
> +			return 0;
> +		}
> +	}
> +
> +	return -EINVAL;
> +}
> +
>  static int lp55xx_set_brightness(struct led_classdev *cdev,
>  			     enum led_brightness brightness)
>  {
> +	struct led_mc_color_conversion color_component[LP55XX_MAX_GROUPED_CHAN];
>  	struct lp55xx_led *led = cdev_to_lp55xx_led(cdev);
>  	struct lp55xx_device_config *cfg = led->chip->cfg;
> +	int ret;
> +	int i;
>  
> -	led->brightness = (u8)brightness;
> -	return cfg->brightness_fn(led);
> +	if (led->mc_cdev.num_leds > 1) {
> +		if (!cfg->color_intensity_fn)
> +			return -EINVAL;
> +
> +		led_mc_calc_color_components(&led->mc_cdev, brightness,
> +					     color_component);
> +
> +		for (i = 0; i < led->mc_cdev.num_leds; i++) {
> +			ret = lp55xx_map_channel(led,
> +						color_component[i].color_id,
> +						color_component[i].brightness);
> +			if (ret)
> +				return ret;
> +		}
> +
> +		ret = cfg->color_intensity_fn(led);
> +		if (ret)
> +			return ret;
> +	} else {
> +		led->brightness = (u8)brightness;
> +		ret = cfg->brightness_fn(led);
> +	}
> +
> +	return ret;
>  }
>  
>  static int lp55xx_init_led(struct lp55xx_led *led,
> @@ -147,9 +187,9 @@ static int lp55xx_init_led(struct lp55xx_led *led,
>  	struct lp55xx_platform_data *pdata = chip->pdata;
>  	struct lp55xx_device_config *cfg = chip->cfg;
>  	struct device *dev = &chip->cl->dev;
> +	int max_channel = cfg->max_channel;
>  	char name[32];
>  	int ret;
> -	int max_channel = cfg->max_channel;
>  
>  	if (chan >= max_channel) {
>  		dev_err(dev, "invalid channel: %d / %d\n", chan, max_channel);
> @@ -159,10 +199,34 @@ static int lp55xx_init_led(struct lp55xx_led *led,
>  	if (pdata->led_config[chan].led_current == 0)
>  		return 0;
>  
> +	if (pdata->led_config[chan].name) {
> +		led->cdev.name = pdata->led_config[chan].name;
> +	} else {
> +		snprintf(name, sizeof(name), "%s:channel%d",
> +			pdata->label ? : chip->cl->name, chan);
> +		led->cdev.name = name;
> +	}
> +
> +	if (pdata->led_config[chan].num_colors > 1) {
> +		led->mc_cdev.led_cdev = &led->cdev;
> +		led->cdev.brightness_set_blocking = lp55xx_set_brightness;
> +		led->cdev.groups = lp55xx_led_groups;
> +		led->mc_cdev.num_leds = pdata->led_config[chan].num_colors;
> +		led->mc_cdev.available_colors =
> +			pdata->led_config[chan].available_colors;
> +		memcpy(led->color_component,
> +		       pdata->led_config[chan].color_component,
> +		       sizeof(led->color_component));
> +	} else {
> +
> +		led->cdev.default_trigger =
> +			pdata->led_config[chan].default_trigger;
> +		led->cdev.brightness_set_blocking = lp55xx_set_brightness;
> +	}	led->cdev.groups = lp55xx_led_groups;
> +
>  	led->led_current = pdata->led_config[chan].led_current;
>  	led->max_current = pdata->led_config[chan].max_current;
>  	led->chan_nr = pdata->led_config[chan].chan_nr;
> -	led->cdev.default_trigger = pdata->led_config[chan].default_trigger;
>  
>  	if (led->chan_nr >= max_channel) {
>  		dev_err(dev, "Use channel numbers between 0 and %d\n",
> @@ -170,18 +234,11 @@ static int lp55xx_init_led(struct lp55xx_led *led,
>  		return -EINVAL;
>  	}
>  
> -	led->cdev.brightness_set_blocking = lp55xx_set_brightness;
> -	led->cdev.groups = lp55xx_led_groups;
> -
> -	if (pdata->led_config[chan].name) {
> -		led->cdev.name = pdata->led_config[chan].name;
> -	} else {
> -		snprintf(name, sizeof(name), "%s:channel%d",
> -			pdata->label ? : chip->cl->name, chan);
> -		led->cdev.name = name;
> -	}
> +	if (pdata->led_config[chan].num_colors > 1)
> +		ret = led_classdev_multicolor_register(dev, &led->mc_cdev);
> +	else
> +		ret = led_classdev_register(dev, &led->cdev);

Why not devm versions?

> -	ret = led_classdev_register(dev, &led->cdev);
>  	if (ret) {
>  		dev_err(dev, "led register err: %d\n", ret);
>  		return ret;
> @@ -466,7 +523,6 @@ int lp55xx_register_leds(struct lp55xx_led *led, struct lp55xx_chip *chip)
>  		dev_err(&chip->cl->dev, "empty brightness configuration\n");
>  		return -EINVAL;
>  	}
> -

This empty line removal was not intended I suppose.

>  	for (i = 0; i < num_channels; i++) {
>  
>  		/* do not initialize channels that are not connected */
> @@ -538,6 +594,82 @@ void lp55xx_unregister_sysfs(struct lp55xx_chip *chip)
>  }
>  EXPORT_SYMBOL_GPL(lp55xx_unregister_sysfs);
>  
> +static int lp5xx_parse_common_child(struct device_node *np,
> +				    struct lp55xx_led_config *cfg,
> +				    int chan_num, bool is_multicolor,
> +				    int color_num)
> +{
> +	u32 led_number;
> +	int ret;
> +
> +	of_property_read_string(np, "chan-name",
> +				&cfg[chan_num].name);
> +	of_property_read_u8(np, "led-cur",
> +			    &cfg[chan_num].led_current);
> +	of_property_read_u8(np, "max-cur",
> +			    &cfg[chan_num].max_current);
> +
> +	ret = of_property_read_u32(np, "reg", &led_number);
> +	if (ret)
> +		return ret;
> +
> +	if (led_number < 0 || led_number > 6)
> +		return -EINVAL;
> +
> +	if (is_multicolor)
> +		cfg[chan_num].color_component[color_num].output_num =
> +								led_number;
> +	else
> +		cfg[chan_num].chan_nr = led_number;
> +
> +	return 0;
> +}
> +
> +static int lp5xx_parse_channel_child(struct device_node *np,
> +				     struct lp55xx_led_config *cfg,
> +				     int child_number)
> +{
> +	struct device_node *child;
> +	int channel_color;
> +	int num_colors = 0;
> +	u32 color_id;
> +	int ret;
> +
> +	cfg[child_number].default_trigger =
> +			of_get_property(np, "linux,default-trigger", NULL);
> +
> +	ret = of_property_read_u32(np, "color", &channel_color);
> +	if (ret)
> +		channel_color = ret;
> +
> +
> +	if (channel_color == LED_COLOR_ID_MULTI) {
> +		for_each_child_of_node(np, child) {
> +			ret = lp5xx_parse_common_child(child, cfg,
> +						       child_number, true,
> +						       num_colors);
> +			if (ret)
> +				return ret;
> +
> +			ret = of_property_read_u32(child, "color", &color_id);
> +			if (ret)
> +				return ret;
> +
> +			cfg[child_number].color_component[num_colors].color_id =
> +						color_id;
> +			set_bit(color_id, &cfg[child_number].available_colors);
> +			num_colors++;
> +		}
> +
> +		cfg[child_number].num_colors = num_colors;
> +	} else {
> +		return lp5xx_parse_common_child(np, cfg, child_number, false,
> +						num_colors);
> +	}
> +
> +	return 0;
> +}
> +
>  struct lp55xx_platform_data *lp55xx_of_populate_pdata(struct device *dev,
>  						      struct device_node *np)
>  {
> @@ -546,6 +678,7 @@ struct lp55xx_platform_data *lp55xx_of_populate_pdata(struct device *dev,
>  	struct lp55xx_led_config *cfg;
>  	int num_channels;
>  	int i = 0;
> +	int ret;
>  
>  	pdata = devm_kzalloc(dev, sizeof(*pdata), GFP_KERNEL);
>  	if (!pdata)
> @@ -565,14 +698,9 @@ struct lp55xx_platform_data *lp55xx_of_populate_pdata(struct device *dev,
>  	pdata->num_channels = num_channels;
>  
>  	for_each_child_of_node(np, child) {
> -		cfg[i].chan_nr = i;
> -
> -		of_property_read_string(child, "chan-name", &cfg[i].name);
> -		of_property_read_u8(child, "led-cur", &cfg[i].led_current);
> -		of_property_read_u8(child, "max-cur", &cfg[i].max_current);
> -		cfg[i].default_trigger =
> -			of_get_property(child, "linux,default-trigger", NULL);
> -
> +		ret = lp5xx_parse_channel_child(child, cfg, i);
> +		if (ret)
> +			return ERR_PTR(-EINVAL);
>  		i++;
>  	}
>  
> diff --git a/drivers/leds/leds-lp55xx-common.h b/drivers/leds/leds-lp55xx-common.h
> index 783ed5103ce5..75d57fb835c3 100644
> --- a/drivers/leds/leds-lp55xx-common.h
> +++ b/drivers/leds/leds-lp55xx-common.h
> @@ -12,6 +12,8 @@
>  #ifndef _LEDS_LP55XX_COMMON_H
>  #define _LEDS_LP55XX_COMMON_H
>  
> +#include <linux/led-class-multicolor.h>
> +
>  enum lp55xx_engine_index {
>  	LP55XX_ENGINE_INVALID,
>  	LP55XX_ENGINE_1,
> @@ -109,6 +111,9 @@ struct lp55xx_device_config {
>  	/* access brightness register */
>  	int (*brightness_fn)(struct lp55xx_led *led);
>  
> +	/* access specific brightness register */
> +	int (*color_intensity_fn)(struct lp55xx_led *led);

Wouldn't multicolor_brightness_fn be more accurate now ?

It is vital to reduce possibility of confusing mc framework
intensity with brightness level that is set on each grouped
monochrome LED channel.

> +
>  	/* current setting function */
>  	void (*set_led_current) (struct lp55xx_led *led, u8 led_current);
>  
> @@ -159,6 +164,8 @@ struct lp55xx_chip {
>   * struct lp55xx_led
>   * @chan_nr         : Channel number
>   * @cdev            : LED class device
> + * @mc_cdev	    : Multi color class device
> + * @color_component : Multi color LED map information
>   * @led_current     : Current setting at each led channel
>   * @max_current     : Maximun current at each led channel
>   * @brightness      : Brightness value
> @@ -167,6 +174,8 @@ struct lp55xx_chip {
>  struct lp55xx_led {
>  	int chan_nr;
>  	struct led_classdev cdev;
> +	struct led_classdev_mc mc_cdev;
> +	struct led_mc_color_conversion color_component[LP55XX_MAX_GROUPED_CHAN];
>  	u8 led_current;
>  	u8 max_current;
>  	u8 brightness;
> diff --git a/include/linux/platform_data/leds-lp55xx.h b/include/linux/platform_data/leds-lp55xx.h
> index 96a787100fda..0f9b88019c18 100644
> --- a/include/linux/platform_data/leds-lp55xx.h
> +++ b/include/linux/platform_data/leds-lp55xx.h
> @@ -12,17 +12,24 @@
>  #ifndef _LEDS_LP55XX_H
>  #define _LEDS_LP55XX_H
>  
> +#include <linux/led-class-multicolor.h>
> +
>  /* Clock configuration */
>  #define LP55XX_CLOCK_AUTO	0
>  #define LP55XX_CLOCK_INT	1
>  #define LP55XX_CLOCK_EXT	2
>  
> +#define LP55XX_MAX_GROUPED_CHAN	4
> +
>  struct lp55xx_led_config {
>  	const char *name;
>  	const char *default_trigger;
>  	u8 chan_nr;
>  	u8 led_current; /* mA x10, 0 if led is not connected */
>  	u8 max_current;
> +	int num_colors;
> +	unsigned long available_colors;
> +	struct led_mc_color_conversion color_component[LP55XX_MAX_GROUPED_CHAN];
>  };
>  
>  struct lp55xx_predef_pattern {
> 

-- 
Best regards,
Jacek Anaszewski
