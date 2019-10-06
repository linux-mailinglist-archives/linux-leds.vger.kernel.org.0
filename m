Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 67B38CD8FF
	for <lists+linux-leds@lfdr.de>; Sun,  6 Oct 2019 21:52:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725900AbfJFTwY (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 6 Oct 2019 15:52:24 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:42534 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725811AbfJFTwY (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 6 Oct 2019 15:52:24 -0400
Received: by mail-wr1-f65.google.com with SMTP id n14so12716487wrw.9;
        Sun, 06 Oct 2019 12:52:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Y69qRstcEMZ/5T/e2Uz2/F5LFZE9cnViqlYYpZHWQqo=;
        b=ulYbmUA84gFWD+zt4NkiS7g34heACso7DczMotimCIyAcjcc0d/onZdRv9BOVPCAPe
         +eMch4c38WrqJcnkfh2PW46rTawq5xJIx6YJnVbVyLiPsp2xo1m7uyDbhz5k4d6ZFFI+
         SgU+/RxPDGRciK6fmn9fuhq6r71iuSCgBxPLnLwvdJFs1XsCckIXAJiRUk3fG6JB00Zy
         J3/imJ/Ln+HtnhgdzOk3bSUvrPXmmqIY3PuYf4fK+I4FZ7hh3ZfclqqPYDN6eLAMKZBu
         ZEJSU1c03wsXH1hHutQ04PyZbUg+2RiUwk0rU53q9B0e/2IIowRgd52fI2S7EJrBeYlm
         H/Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=Y69qRstcEMZ/5T/e2Uz2/F5LFZE9cnViqlYYpZHWQqo=;
        b=HOHJjXQK1QIe6lpyRVc7TKS/JeFhK9qwIVutcIBi8shMynnlwYhJLW+epugGQmpLar
         CbidBE+vVLzI64UoD86fF3XdSTAABjWMM2CQD8CTDyM/SXpATz3lfbrzAvFOUj7H2o63
         zUmIZehm4JfqTjR0ItIedaYPLK+JNkLEzJHzuWW9eXJayI49KWr+GO3iIO0EAVGFBtJ5
         e6T5LQzX4ZBKwsYaHn2+o12SphXDNMY247w+WPi2jwF23fJjpX0suXcVS2TTRG0SF3ZC
         04m0hd8AtOxWiKSHVSx9Lh1ubm8vPBHIaJ2nToOfl8HFfBbZRp0XIGllQmaUeaMxOmwO
         QvWQ==
X-Gm-Message-State: APjAAAWFH8WoH922lFa85fXUOkBAFZcYdBiRMHoOHQFUiXtpEa1dlm4V
        bnBiJdEjr8JipsZDZpO7kr1oMQPx
X-Google-Smtp-Source: APXvYqyQtO7RWLnYMm75hfwivN46d0devZrdVj/hVf/dvfVt1tzzahd+gBMuyD+Vg0haCoEDUtD0Zg==
X-Received: by 2002:a5d:4dd1:: with SMTP id f17mr4415739wru.375.1570391539956;
        Sun, 06 Oct 2019 12:52:19 -0700 (PDT)
Received: from [192.168.1.19] (bgw69.neoplus.adsl.tpnet.pl. [83.28.86.69])
        by smtp.gmail.com with ESMTPSA id m18sm27092565wrg.97.2019.10.06.12.52.18
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 06 Oct 2019 12:52:19 -0700 (PDT)
Subject: Re: [PATCH v10 12/16] leds: lp55xx: Add multicolor framework support
 to lp55xx
To:     Dan Murphy <dmurphy@ti.com>, pavel@ucw.cz
Cc:     linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20191001145620.11123-1-dmurphy@ti.com>
 <20191001145620.11123-13-dmurphy@ti.com>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=jacek.anaszewski@gmail.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <9353b10d-d805-0142-5d90-da73e172bd78@gmail.com>
Date:   Sun, 6 Oct 2019 21:52:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191001145620.11123-13-dmurphy@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Dan,

On 10/1/19 4:56 PM, Dan Murphy wrote:
> Add multicolor framework support for the lp55xx family.
> 
> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> ---
>  drivers/leds/Kconfig                      |   1 +
>  drivers/leds/leds-lp55xx-common.c         | 169 +++++++++++++++++++---
>  drivers/leds/leds-lp55xx-common.h         |  11 ++
>  include/linux/platform_data/leds-lp55xx.h |   6 +
>  4 files changed, 163 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> index 84f60e35c5ee..dc3d9f2194cd 100644
> --- a/drivers/leds/Kconfig
> +++ b/drivers/leds/Kconfig
> @@ -377,6 +377,7 @@ config LEDS_LP50XX
>  config LEDS_LP55XX_COMMON
>  	tristate "Common Driver for TI/National LP5521/5523/55231/5562/8501"
>  	depends on LEDS_LP5521 || LEDS_LP5523 || LEDS_LP5562 || LEDS_LP8501
> +	depends on LEDS_CLASS_MULTI_COLOR && OF
>  	select FW_LOADER
>  	select FW_LOADER_USER_HELPER
>  	help
> diff --git a/drivers/leds/leds-lp55xx-common.c b/drivers/leds/leds-lp55xx-common.c
> index 44ced02b49f9..5de4f1789a44 100644
> --- a/drivers/leds/leds-lp55xx-common.c
> +++ b/drivers/leds/leds-lp55xx-common.c
> @@ -131,14 +131,50 @@ static struct attribute *lp55xx_led_attrs[] = {
>  };
>  ATTRIBUTE_GROUPS(lp55xx_led);
>  
> +struct led_mc_color_conversion color_component[LP55XX_MAX_GROUPED_CHAN];

Why is this global? Please move it to lp55xx_set_brightness().

> +
> +static int lp55xx_get_channel(struct lp55xx_led *led, int color_id)
> +{
> +	int i;
> +
> +	for (i = 0; i < led->mc_cdev.num_leds; i++) {
> +		if (led->channel_color[i] == color_id)
> +			return led->grouped_channels[i];
> +	}
> +
> +	return -EINVAL;
> +}
> +
>  static int lp55xx_set_brightness(struct led_classdev *cdev,
>  			     enum led_brightness brightness)
>  {
>  	struct lp55xx_led *led = cdev_to_lp55xx_led(cdev);
>  	struct lp55xx_device_config *cfg = led->chip->cfg;
> +	int channel_num;
> +	int ret;
> +	int i;
>  
> -	led->brightness = (u8)brightness;
> -	return cfg->brightness_fn(led);
> +	if (led->mc_cdev.num_leds > 1) {
> +		led_mc_calc_brightness(&led->mc_cdev, brightness,
> +				       &color_component[0]);

s/&color_component[0]/color_component/

> +
> +		for (i = 0; i < led->mc_cdev.num_leds; i++) {
> +			channel_num = lp55xx_get_channel(led,
> +						color_component[i].color_id);
> +			if (channel_num < 0)
> +				return channel_num;
> +
> +			ret = cfg->color_intensity_fn(led, channel_num,
> +						 color_component[i].brightness);

If you passed struct led_mc_color_conversion instead of brightness,
then in the color_intensity_fn op you could obtain channel numbers
by calling lp55xx_get_channel in a loop. And you could setup the whole
cluster in a single call.

> +			if (ret)
> +				return ret;
> +		}
> +	} else {
> +		led->brightness = (u8)brightness;
> +		ret = cfg->brightness_fn(led);
> +	}
> +
> +	return ret;
>  }
>  
>  static int lp55xx_init_led(struct lp55xx_led *led,
> @@ -147,9 +183,9 @@ static int lp55xx_init_led(struct lp55xx_led *led,
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
> @@ -159,10 +195,37 @@ static int lp55xx_init_led(struct lp55xx_led *led,
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
> +		memcpy(led->channel_color,
> +		       pdata->led_config[chan].channel_color,
> +		       sizeof(led->channel_color));
> +		memcpy(led->grouped_channels,
> +		       pdata->led_config[chan].grouped_channels,
> +		       sizeof(led->grouped_channels));
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
> @@ -170,18 +233,11 @@ static int lp55xx_init_led(struct lp55xx_led *led,
>  		return -EINVAL;
>  	}
>  
> -	led->cdev.brightness_set_blocking = lp55xx_set_brightness;
> -	led->cdev.groups = lp55xx_led_groups;
> +	if (pdata->led_config[chan].num_colors > 1)
> +		ret = led_classdev_multicolor_register(dev, &led->mc_cdev);
> +	else
> +		ret = led_classdev_register(dev, &led->cdev);
>  
> -	if (pdata->led_config[chan].name) {
> -		led->cdev.name = pdata->led_config[chan].name;
> -	} else {
> -		snprintf(name, sizeof(name), "%s:channel%d",
> -			pdata->label ? : chip->cl->name, chan);
> -		led->cdev.name = name;
> -	}
> -
> -	ret = led_classdev_register(dev, &led->cdev);
>  	if (ret) {
>  		dev_err(dev, "led register err: %d\n", ret);
>  		return ret;
> @@ -466,7 +522,6 @@ int lp55xx_register_leds(struct lp55xx_led *led, struct lp55xx_chip *chip)
>  		dev_err(&chip->cl->dev, "empty brightness configuration\n");
>  		return -EINVAL;
>  	}
> -
>  	for (i = 0; i < num_channels; i++) {
>  
>  		/* do not initialize channels that are not connected */
> @@ -538,6 +593,76 @@ void lp55xx_unregister_sysfs(struct lp55xx_chip *chip)
>  }
>  EXPORT_SYMBOL_GPL(lp55xx_unregister_sysfs);
>  
> +static int lp5xx_parse_common_child(struct device_node *np,
> +				     struct lp55xx_led_config *cfg,
> +				     int chan_num, bool is_multicolor)
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
> +		cfg[chan_num].grouped_channels[cfg[chan_num].num_colors]

Please pass the index for grouped channels as an argument to this
function. Referring here directly to a temporary state of num_colors
that is incremented in the loop from which this function is called
is ugly IMO.

> +				= led_number;
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
> +						       child_number, true);
> +			if (ret)
> +				return ret;
> +			ret = of_property_read_u32(child, "color", &color_id);
> +			if (ret)
> +				return ret;
> +
> +			cfg[child_number].channel_color[cfg[child_number].num_colors] =
> +				color_id;
> +			set_bit(color_id, &cfg[child_number].available_colors);
> +
> +			cfg[child_number].num_colors++;
> +		}
> +	} else {
> +		return lp5xx_parse_common_child(np, cfg, child_number, false);
> +	}
> +
> +	return 0;
> +}
> +
>  struct lp55xx_platform_data *lp55xx_of_populate_pdata(struct device *dev,
>  						      struct device_node *np)
>  {
> @@ -546,6 +671,7 @@ struct lp55xx_platform_data *lp55xx_of_populate_pdata(struct device *dev,
>  	struct lp55xx_led_config *cfg;
>  	int num_channels;
>  	int i = 0;
> +	int ret;
>  
>  	pdata = devm_kzalloc(dev, sizeof(*pdata), GFP_KERNEL);
>  	if (!pdata)
> @@ -565,14 +691,9 @@ struct lp55xx_platform_data *lp55xx_of_populate_pdata(struct device *dev,
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
> index 783ed5103ce5..5ea2a292a97e 100644
> --- a/drivers/leds/leds-lp55xx-common.h
> +++ b/drivers/leds/leds-lp55xx-common.h
> @@ -12,6 +12,10 @@
>  #ifndef _LEDS_LP55XX_COMMON_H
>  #define _LEDS_LP55XX_COMMON_H
>  
> +#include <linux/led-class-multicolor.h>
> +
> +#define LP55XX_MAX_GROUPED_CHAN	4
> +
>  enum lp55xx_engine_index {
>  	LP55XX_ENGINE_INVALID,
>  	LP55XX_ENGINE_1,
> @@ -109,6 +113,9 @@ struct lp55xx_device_config {
>  	/* access brightness register */
>  	int (*brightness_fn)(struct lp55xx_led *led);
>  
> +	/* access specific brightness register */
> +	int (*color_intensity_fn)(struct lp55xx_led *led, int chan_num, int brightness);
> +
>  	/* current setting function */
>  	void (*set_led_current) (struct lp55xx_led *led, u8 led_current);
>  
> @@ -159,6 +166,7 @@ struct lp55xx_chip {
>   * struct lp55xx_led
>   * @chan_nr         : Channel number
>   * @cdev            : LED class device
> + * @mc_cdev	    : Multi color class device
>   * @led_current     : Current setting at each led channel
>   * @max_current     : Maximun current at each led channel
>   * @brightness      : Brightness value

Documentation for channel_color and grouped_channels is missing.

> @@ -167,9 +175,12 @@ struct lp55xx_chip {
>  struct lp55xx_led {
>  	int chan_nr;
>  	struct led_classdev cdev;
> +	struct led_classdev_mc mc_cdev;
>  	u8 led_current;
>  	u8 max_current;
>  	u8 brightness;
> +	int channel_color[LP55XX_MAX_GROUPED_CHAN];
> +	int grouped_channels[LP55XX_MAX_GROUPED_CHAN];

I propose to create structure:

struct lp55xx_mc_cluster {
	int channel_color;
	int channel_id;
};

and instead of the above two arrays create one

struct lp55xx_mc_cluster mc_cluster[LP55XX_MAX_GROUPED_CHAN];

>  	struct lp55xx_chip *chip;
>  };
>  
> diff --git a/include/linux/platform_data/leds-lp55xx.h b/include/linux/platform_data/leds-lp55xx.h
> index 96a787100fda..0ac29f537ab6 100644
> --- a/include/linux/platform_data/leds-lp55xx.h
> +++ b/include/linux/platform_data/leds-lp55xx.h
> @@ -12,6 +12,8 @@
>  #ifndef _LEDS_LP55XX_H
>  #define _LEDS_LP55XX_H
>  
> +#include <linux/led-class-multicolor.h>
> +
>  /* Clock configuration */
>  #define LP55XX_CLOCK_AUTO	0
>  #define LP55XX_CLOCK_INT	1
> @@ -23,6 +25,10 @@ struct lp55xx_led_config {
>  	u8 chan_nr;
>  	u8 led_current; /* mA x10, 0 if led is not connected */
>  	u8 max_current;
> +	int num_colors;
> +	unsigned long available_colors;
> +	u32 channel_color[LED_COLOR_ID_MAX];

channel_color array is redundant if you have available_colors flags.

> +	int grouped_channels[LED_COLOR_ID_MAX];
>  };
>  
>  struct lp55xx_predef_pattern {
> 

-- 
Best regards,
Jacek Anaszewski
