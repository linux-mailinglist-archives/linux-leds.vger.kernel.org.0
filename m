Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 90043B9F48
	for <lists+linux-leds@lfdr.de>; Sat, 21 Sep 2019 20:06:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727574AbfIUSG0 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 21 Sep 2019 14:06:26 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:38747 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725681AbfIUSG0 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 21 Sep 2019 14:06:26 -0400
Received: by mail-wr1-f68.google.com with SMTP id l11so9845667wrx.5;
        Sat, 21 Sep 2019 11:06:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=DvvD90MWg7hityxlW2aksBE/o3heFlBb8zdINpDckeI=;
        b=FU6Fvu8xO7heJSET7LdeRlUewRnehkdu6fKD+XUMnSppnRpm/90/bnyqN/CRHTmBx6
         7QiwBex48J9z3quBPhwRPtAN11QELeuH5DsXLUYX+tLBMg95JFtGusvZgvO0SL7sb0z5
         gFdGW5onBJNm9vqWNPhrwWVwVPbJkYsMrxoQ8DjxgumMxVFdTRBEpMT4blJS3JUnx3cH
         JUc1a6uhW4mWEmeyiOXfxz9M7LVJwDJY7Z/GUnVr65MT4Ke3yhu1nzZkNcnqVVa8izQf
         wd/7plWptRh9HThifQ1TPZJ5u3DxF+nxNwqYXucosc8Vr8HPb7naoc8uhjDVx6f/5cIu
         aWcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=DvvD90MWg7hityxlW2aksBE/o3heFlBb8zdINpDckeI=;
        b=cWD8efZjU5qUTqlcjVaRjsDl0SK8vDZMCttuQiLzTcqCB9ZdVm2Odb1ev6fSQM/3xG
         yDxWWtf0hSFoqvbG0Ud7EuOqx/US6oFESwrSm5PnWS8daQS/6iWipIQ2w+5DXzBSasJs
         racDYDWcyDNxf7AVlECK78Rt0Vj2MLZ1Ha90gdFQCm75jYL4ro2UWIKGF3wXbpDfpn46
         Xvhxfr/kKlRcUAbrKC32Ivo9ZAo/Uw9yjLFOyz+BAdU1semreu6K2TNjfNquFiVlHcgk
         lviJXgSmXvD2s8nohxfrDA/hb6GQigAoVojyQtwkGovb8NPEZJuvNIfz+T1yWYSIrLH9
         AE7g==
X-Gm-Message-State: APjAAAU912wsqaxtx3sQd4bLlEhSlMoX3IFx0oaxpNRqnArXnneFVKK/
        sKCHeAQAmMCyKKQrb1PBpuBo6ozf
X-Google-Smtp-Source: APXvYqyQedqpRhmJZCMwbwn5yhPKuoOIuzZMaempXfgc1sNrG0r8IcRAE+w93gAg8oIrllB/C+JSSQ==
X-Received: by 2002:a5d:4ac9:: with SMTP id y9mr3792619wrs.371.1569089182194;
        Sat, 21 Sep 2019 11:06:22 -0700 (PDT)
Received: from [192.168.1.19] (blb134.neoplus.adsl.tpnet.pl. [83.28.195.134])
        by smtp.gmail.com with ESMTPSA id r2sm4640453wrm.3.2019.09.21.11.06.20
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 21 Sep 2019 11:06:21 -0700 (PDT)
Subject: Re: [PATCH v8 9/9] leds: Update the lp55xx to use the multi color
 framework
To:     Dan Murphy <dmurphy@ti.com>, pavel@ucw.cz
Cc:     linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20190920174139.30079-1-dmurphy@ti.com>
 <20190920174139.30079-10-dmurphy@ti.com>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=jacek.anaszewski@gmail.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <4cc2c60b-9a16-2d64-e666-e4e460a53f56@gmail.com>
Date:   Sat, 21 Sep 2019 20:06:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190920174139.30079-10-dmurphy@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Dan,

On 9/20/19 7:41 PM, Dan Murphy wrote:
> Update the lp5523 to use the multi color framework.
> 
> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> ---
>  drivers/leds/leds-lp5523.c                |  13 +++
>  drivers/leds/leds-lp55xx-common.c         | 131 ++++++++++++++++++----
>  drivers/leds/leds-lp55xx-common.h         |   9 ++
>  include/linux/platform_data/leds-lp55xx.h |   6 +
>  4 files changed, 137 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/leds/leds-lp5523.c b/drivers/leds/leds-lp5523.c
> index d0b931a136b9..8b2cdb98fed6 100644
> --- a/drivers/leds/leds-lp5523.c
> +++ b/drivers/leds/leds-lp5523.c
> @@ -791,6 +791,18 @@ static ssize_t store_master_fader_leds(struct device *dev,
>  	return ret;
>  }
>  
> +static int lp5523_led_intensity(struct lp55xx_led *led, int chan_num)
> +{
> +	struct lp55xx_chip *chip = led->chip;
> +	int ret;
> +
> +	mutex_lock(&chip->lock);
> +	ret = lp55xx_write(chip, LP5523_REG_LED_PWM_BASE + chan_num,
> +		     led->brightness);
> +	mutex_unlock(&chip->lock);
> +	return ret;
> +}
> +
>  static int lp5523_led_brightness(struct lp55xx_led *led)
>  {
>  	struct lp55xx_chip *chip = led->chip;
> @@ -857,6 +869,7 @@ static struct lp55xx_device_config lp5523_cfg = {
>  	.max_channel  = LP5523_MAX_LEDS,
>  	.post_init_device   = lp5523_post_init_device,
>  	.brightness_fn      = lp5523_led_brightness,
> +	.color_intensity_fn = lp5523_led_intensity,
>  	.set_led_current    = lp5523_set_led_current,
>  	.firmware_cb        = lp5523_firmware_loaded,
>  	.run_engine         = lp5523_run_engine,
> diff --git a/drivers/leds/leds-lp55xx-common.c b/drivers/leds/leds-lp55xx-common.c
> index 44ced02b49f9..a5efe2407832 100644
> --- a/drivers/leds/leds-lp55xx-common.c
> +++ b/drivers/leds/leds-lp55xx-common.c
> @@ -136,9 +136,26 @@ static int lp55xx_set_brightness(struct led_classdev *cdev,
>  {
>  	struct lp55xx_led *led = cdev_to_lp55xx_led(cdev);
>  	struct lp55xx_device_config *cfg = led->chip->cfg;
> +	int adj_value[LED_COLOR_ID_MAX];

This looks suboptimal. This array should have only the number
of elements equal to the number of requested colors.

> +	int ret;
> +	int i;
> +
> +	if (led->mc_cdev.num_leds > 1) {
> +		led_mc_calc_brightness(&led->mc_cdev,
> +				       brightness, adj_value);

I still feel uncomfortable with the name of the third
argument for led_mc_calc_brightness().

In the function definition I proposed brightness_val instead of
adj_value, but this is not too informative either.
How about brightness_dimmed ? If you agree then let's change it
also in the definition. Also the type should be enum led_brightness.

Here we would have the following call:

led_mc_calc_brightness(&led->mc_cdev, brightness, brightness_dimmed);

> +		for (i = 0; i < led->mc_cdev.num_leds; i++) {
> +			led->brightness = adj_value[i];
> +			ret = cfg->color_intensity_fn(led,
> +						      led->grouped_channels[i]);
> +			if (ret)
> +				break;
> +		}
> +	} else {
> +		led->brightness = (u8)brightness;
> +		ret = cfg->brightness_fn(led);
> +	}
>  
> -	led->brightness = (u8)brightness;
> -	return cfg->brightness_fn(led);
> +	return ret;
>  }
>  
>  static int lp55xx_init_led(struct lp55xx_led *led,
> @@ -147,9 +164,9 @@ static int lp55xx_init_led(struct lp55xx_led *led,
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
> @@ -159,10 +176,35 @@ static int lp55xx_init_led(struct lp55xx_led *led,
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
> +	if (pdata->led_config[chan].num_colors > 1) {> +		led->mc_cdev.led_cdev = &led->cdev;
> +		led->cdev.brightness_set_blocking = lp55xx_set_brightness;
> +		led->cdev.groups = lp55xx_led_groups;
> +		led->mc_cdev.num_leds = pdata->led_config[chan].num_colors;
> +		led->mc_cdev.available_colors = pdata->led_config[chan].available_colors;
> +		memcpy(led->channel_color,
> +		       pdata->led_config[chan].channel_color,
> +		       sizeof(led->channel_color));
> +		memcpy(led->grouped_channels,
> +		       pdata->led_config[chan].grouped_channels,
> +		       sizeof(led->grouped_channels));
> +	} else {
> +
> +		led->cdev.default_trigger = pdata->led_config[chan].default_trigger;
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
> @@ -170,18 +212,11 @@ static int lp55xx_init_led(struct lp55xx_led *led,
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
> @@ -466,7 +501,6 @@ int lp55xx_register_leds(struct lp55xx_led *led, struct lp55xx_chip *chip)
>  		dev_err(&chip->cl->dev, "empty brightness configuration\n");
>  		return -EINVAL;
>  	}
> -
>  	for (i = 0; i < num_channels; i++) {
>  
>  		/* do not initialize channels that are not connected */
> @@ -538,6 +572,38 @@ void lp55xx_unregister_sysfs(struct lp55xx_chip *chip)
>  }
>  EXPORT_SYMBOL_GPL(lp55xx_unregister_sysfs);
>  
> +static int lp5xx_parse_channel_child(struct device_node *np,
> +				     struct lp55xx_led_config *cfg,
> +				     int chan_num)
> +{
> +	struct device_node *child;
> +	int num_colors = 0;
> +	u32 color_id;
> +	u32 led_number;
> +	int ret;
> +
> +	cfg[chan_num].default_trigger =
> +			of_get_property(np, "linux,default-trigger", NULL);
> +
> +	for_each_child_of_node(np, child) {
> +		of_property_read_string(child, "chan-name",
> +					&cfg[chan_num].name);
> +		of_property_read_u8(child, "led-cur",
> +				    &cfg[chan_num].led_current);
> +		of_property_read_u8(child, "max-cur",
> +				    &cfg[chan_num].max_current);
> +		of_property_read_u32(child, "color", &color_id);
> +		cfg[chan_num].channel_color[num_colors] = color_id;
> +		set_bit(color_id, &cfg[chan_num].available_colors);
> +		ret = of_property_read_u32(child, "reg", &led_number);
> +		cfg[chan_num].grouped_channels[num_colors] = led_number;
> +		num_colors++;

We have similar parser snippet below in lp55xx_of_populate_pdata().
Why this duplication is needed? We also need an update to DT bindings.
Now I don't know what's the multicolor DT design for this driver
family.

> +	}
> +	cfg[chan_num].num_colors = num_colors;
> +
> +	return 0;
> +}
> +
>  struct lp55xx_platform_data *lp55xx_of_populate_pdata(struct device *dev,
>  						      struct device_node *np)
>  {
> @@ -545,7 +611,10 @@ struct lp55xx_platform_data *lp55xx_of_populate_pdata(struct device *dev,
>  	struct lp55xx_platform_data *pdata;
>  	struct lp55xx_led_config *cfg;
>  	int num_channels;
> +	int channel_color;
> +	u32 led_number;
>  	int i = 0;
> +	int ret;
>  
>  	pdata = devm_kzalloc(dev, sizeof(*pdata), GFP_KERNEL);
>  	if (!pdata)
> @@ -565,13 +634,31 @@ struct lp55xx_platform_data *lp55xx_of_populate_pdata(struct device *dev,
>  	pdata->num_channels = num_channels;
>  
>  	for_each_child_of_node(np, child) {
> -		cfg[i].chan_nr = i;
> +		ret = of_property_read_u32(child, "color", &channel_color);
> +		if (ret) {
> +			dev_err(dev,"Missing color property setting white\n");
> +			channel_color = LED_COLOR_ID_WHITE;
> +		}
>  
> -		of_property_read_string(child, "chan-name", &cfg[i].name);
> -		of_property_read_u8(child, "led-cur", &cfg[i].led_current);
> -		of_property_read_u8(child, "max-cur", &cfg[i].max_current);
> -		cfg[i].default_trigger =
> -			of_get_property(child, "linux,default-trigger", NULL);
> +		if (channel_color == LED_COLOR_ID_MULTI)
> +			lp5xx_parse_channel_child(child, cfg, i);
> +		else {
> +			of_property_read_string(child, "chan-name",
> +						&cfg[i].name);
> +			of_property_read_u8(child, "led-cur",
> +					    &cfg[i].led_current);
> +			of_property_read_u8(child, "max-cur",
> +					    &cfg[i].max_current);
> +			cfg[i].default_trigger =
> +				of_get_property(child, "linux,default-trigger",
> +						NULL);
> +			of_property_read_u32(child, "reg", &led_number);
> +
> +			if (led_number < 0 || led_number > 6)
> +				return ERR_PTR(EINVAL);
> +
> +			cfg[i].chan_nr = led_number;
> +		}
>  
>  		i++;
>  	}
> diff --git a/drivers/leds/leds-lp55xx-common.h b/drivers/leds/leds-lp55xx-common.h
> index 783ed5103ce5..d9c114259dcb 100644
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
> +	int (*color_intensity_fn)(struct lp55xx_led *led, int chan_num);
> +
>  	/* current setting function */
>  	void (*set_led_current) (struct lp55xx_led *led, u8 led_current);
>  
> @@ -159,6 +164,7 @@ struct lp55xx_chip {
>   * struct lp55xx_led
>   * @chan_nr         : Channel number
>   * @cdev            : LED class device
> + * @mc_cdev	    : Multi color class device
>   * @led_current     : Current setting at each led channel
>   * @max_current     : Maximun current at each led channel
>   * @brightness      : Brightness value
> @@ -167,9 +173,12 @@ struct lp55xx_chip {
>  struct lp55xx_led {
>  	int chan_nr;
>  	struct led_classdev cdev;
> +	struct led_classdev_mc mc_cdev;
>  	u8 led_current;
>  	u8 max_current;
>  	u8 brightness;
> +	int channel_color[LED_COLOR_ID_MAX];
> +	int grouped_channels[LED_COLOR_ID_MAX];
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
> +	int grouped_channels[LED_COLOR_ID_MAX];

We can do with three-element arrays here.

>  };
>  
>  struct lp55xx_predef_pattern {
> 

-- 
Best regards,
Jacek Anaszewski
