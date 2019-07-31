Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 267E67CC34
	for <lists+linux-leds@lfdr.de>; Wed, 31 Jul 2019 20:45:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729312AbfGaSpS (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 31 Jul 2019 14:45:18 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:40644 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725942AbfGaSpQ (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 31 Jul 2019 14:45:16 -0400
Received: by mail-wm1-f65.google.com with SMTP id v19so60773065wmj.5;
        Wed, 31 Jul 2019 11:45:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=7WC/tn1bE2q8zBFq2cpMVFcD11FzT0yAA5k4NRxIHr0=;
        b=XFrM+Bu+RzRy4D+y4LJU3DDRoaYbzx6X4o06vzAZ1SUiPcIJO1j2UcRatNm3Vy9GzE
         TIbJXgQOTUEWK2SYWS6j9xfrrdtFUTJsdf29GCSA07KEWGhb8lDnKhF+3L9YG2BUVWUu
         BQwmDbRMPkuPHN6INem141fUXIl9JDncXwupFThkbO57N+MFa1/pmqbzKWqNYd9YpRfL
         I+kw9e0za6jzodK+O/TmCk1TosDRaryDRCXgQtZJhxTA1QnHV+XKkfu2OkTs4OPAmidm
         zR1YJwuZLudByXRvRRc0jamOBbHq0inxCI+no+qw1yP93qXgd2o0Qt0+Q7l6HulTBHLt
         LbOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=7WC/tn1bE2q8zBFq2cpMVFcD11FzT0yAA5k4NRxIHr0=;
        b=UYUDU160yJ35k4WwX4n+wpd0MsPt/1X5cuiR0P2/omdx9jyp3FPKJs/QziTkRe6tv5
         VmLgx6wK453a1xc3Y90dUmhmnx1KCjRvBwfLLueOEihCv9W0UgDXt9zvgsU+jdX+5iM3
         7mieDbw4amZLVzRlRYGiYWT7IcfAD67I0x8r2oKeEsm2XkakZlsa3/k3wOeoyedBVONF
         mqXV/1fg0UwEWMcpMK9qrBAba8o9/Ed31SaNrPzFLdn5W2HIf9JYCSgUrkysPabvHXT0
         DiQ6WNsZmQUlsuJ9Oed5HJiK3GCL9ze8aRM5o6UPs7QrC2Yid/hpHaP0a+KsfKRqpkXX
         eWUQ==
X-Gm-Message-State: APjAAAUBU4zG+CMX+BzFzJ7Xl2HvNBC3vrnhh33TIwcm8kcvsKiHo7/f
        vxDneLUoJKTiZS42YiCFk/r9G/pR
X-Google-Smtp-Source: APXvYqyqal+1YU97od9VM9pTRGYuc7fB+B8MOyoXhrQJPLUM+iK6aFu34fHaDY36lvLPAw6/X17KEA==
X-Received: by 2002:a1c:7e90:: with SMTP id z138mr108475751wmc.128.1564598711880;
        Wed, 31 Jul 2019 11:45:11 -0700 (PDT)
Received: from [192.168.1.19] (ciu68.neoplus.adsl.tpnet.pl. [83.31.44.68])
        by smtp.gmail.com with ESMTPSA id v65sm77971753wme.31.2019.07.31.11.45.10
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 31 Jul 2019 11:45:11 -0700 (PDT)
Subject: Re: [PATCH v4 9/9] leds: Update the lp55xx to use the multi color
 framework
To:     Dan Murphy <dmurphy@ti.com>, pavel@ucw.cz
Cc:     linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20190725182818.29556-1-dmurphy@ti.com>
 <20190725182818.29556-10-dmurphy@ti.com>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=jacek.anaszewski@gmail.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <fe3bbfbe-5b15-d87a-f4a1-28167081046b@gmail.com>
Date:   Wed, 31 Jul 2019 20:45:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190725182818.29556-10-dmurphy@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Dan,

Thank you for the patch. My comments are below.

On 7/25/19 8:28 PM, Dan Murphy wrote:
> Update the lp5523 to use the multi color framework.
> 
> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> ---
>  drivers/leds/leds-lp5523.c                |  13 ++
>  drivers/leds/leds-lp55xx-common.c         | 153 ++++++++++++++++++----
>  drivers/leds/leds-lp55xx-common.h         |  10 ++
>  include/linux/platform_data/leds-lp55xx.h |   6 +
>  modules.builtin.modinfo                   | Bin 0 -> 43550 bytes
>  5 files changed, 159 insertions(+), 23 deletions(-)
>  create mode 100644 modules.builtin.modinfo
> 
> diff --git a/drivers/leds/leds-lp5523.c b/drivers/leds/leds-lp5523.c
> index d0b931a136b9..45380b32563f 100644
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
> +	.intensity_fn       = lp5523_led_intensity,
>  	.set_led_current    = lp5523_set_led_current,
>  	.firmware_cb        = lp5523_firmware_loaded,
>  	.run_engine         = lp5523_run_engine,
> diff --git a/drivers/leds/leds-lp55xx-common.c b/drivers/leds/leds-lp55xx-common.c
> index 44ced02b49f9..32a4ab8664ca 100644
> --- a/drivers/leds/leds-lp55xx-common.c
> +++ b/drivers/leds/leds-lp55xx-common.c
> @@ -35,6 +35,11 @@ static struct lp55xx_led *dev_to_lp55xx_led(struct device *dev)
>  	return cdev_to_lp55xx_led(dev_get_drvdata(dev));
>  }
>  
> +static struct lp55xx_led *mcdev_to_lp55xx_led(struct led_classdev_mc *mc_dev)
> +{
> +	return container_of(mc_dev, struct lp55xx_led, mc_cdev);
> +}
> +
>  static void lp55xx_reset_device(struct lp55xx_chip *chip)
>  {
>  	struct lp55xx_device_config *cfg = chip->cfg;
> @@ -136,20 +141,55 @@ static int lp55xx_set_brightness(struct led_classdev *cdev,
>  {
>  	struct lp55xx_led *led = cdev_to_lp55xx_led(cdev);
>  	struct lp55xx_device_config *cfg = led->chip->cfg;
> +	int adj_value[LED_COLOR_ID_MAX];
> +	int ret;
> +	int i;
> +
> +	if (led->mc_cdev.num_leds > 1) {
> +		set_cluster_brightness(&led->mc_cdev, brightness, adj_value);
> +		for (i = 0; i < led->mc_cdev.num_leds; i++) {
> +			led->brightness = adj_value[i];
> +			ret = cfg->intensity_fn(led, led->grouped_channels[i]);

At first glance I would have hard time discerning between brightness_fn
and intensity_fn purpose. Maybe color_intensity_fn?


> +			if (ret)
> +				break;
> +		}
> +	} else {
> +		led->brightness = (u8)brightness;

What benefit stems actually from having the copy of brightness
in struct lp55xx_led, when we already have struct led_classdev
there? I know that this is pre-existing, but could be optimized away
while at it. We can have local u8 variable in the op setting brightness
and cast enum_led_brightness to it before passing to lp55xx_write().

> +		ret = cfg->brightness_fn(led);
> +	}
> +
> +	return ret;
> +}
> +
> +static int lp55xx_set_color(struct led_classdev_mc *mcled_cdev,
> +			    int color, int value)
> +{
> +	struct lp55xx_led *led = mcdev_to_lp55xx_led(mcled_cdev);
> +	struct lp55xx_device_config *cfg = led->chip->cfg;
> +	int i;
> +
> +	for (i = 0; i < led->mc_cdev.num_leds; i++) {
> +		if (led->channel_color[i] == color)
> +			break;
> +	}
>  
> -	led->brightness = (u8)brightness;
> -	return cfg->brightness_fn(led);
> +	led->brightness = (u8)value;
> +	return cfg->intensity_fn(led, led->grouped_channels[i]);
>  }
>  
> +static struct led_multicolor_ops lp55xx_mc_ops = {
> +	.set_color_brightness = lp55xx_set_color,
> +};
> +
>  static int lp55xx_init_led(struct lp55xx_led *led,
>  			struct lp55xx_chip *chip, int chan)
>  {
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
> @@ -159,10 +199,37 @@ static int lp55xx_init_led(struct lp55xx_led *led,
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
> +		led->cdev.name = led->cdev.name;

?

> +		led->cdev.groups = lp55xx_led_groups;
> +		led->mc_cdev.ops = &lp55xx_mc_ops;
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
> @@ -170,18 +237,11 @@ static int lp55xx_init_led(struct lp55xx_led *led,
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

Why not devm ?

> -	ret = led_classdev_register(dev, &led->cdev);
>  	if (ret) {
>  		dev_err(dev, "led register err: %d\n", ret);
>  		return ret;
> @@ -466,7 +526,6 @@ int lp55xx_register_leds(struct lp55xx_led *led, struct lp55xx_chip *chip)
>  		dev_err(&chip->cl->dev, "empty brightness configuration\n");
>  		return -EINVAL;
>  	}
> -
>  	for (i = 0; i < num_channels; i++) {
>  
>  		/* do not initialize channels that are not connected */
> @@ -538,6 +597,39 @@ void lp55xx_unregister_sysfs(struct lp55xx_chip *chip)
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
> +		cfg[chan_num].available_colors |= 1 << color_id;

set_bit(color_id, &cfg[chan_num].available_colors);

> +		ret = of_property_read_u32(child, "reg", &led_number);
> +		cfg[chan_num].grouped_channels[num_colors] = led_number;
> +		num_colors++;
> +	}
> +
> +	cfg->num_colors = num_colors;
> +
> +	return 0;
> +}
> +
>  struct lp55xx_platform_data *lp55xx_of_populate_pdata(struct device *dev,
>  						      struct device_node *np)
>  {
> @@ -545,6 +637,8 @@ struct lp55xx_platform_data *lp55xx_of_populate_pdata(struct device *dev,
>  	struct lp55xx_platform_data *pdata;
>  	struct lp55xx_led_config *cfg;
>  	int num_channels;
> +	int num_chan_children;
> +	u32 led_number;
>  	int i = 0;
>  
>  	pdata = devm_kzalloc(dev, sizeof(*pdata), GFP_KERNEL);
> @@ -565,13 +659,26 @@ struct lp55xx_platform_data *lp55xx_of_populate_pdata(struct device *dev,
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
> +		num_chan_children = of_get_child_count(child);
> +		if (num_chan_children != 0)

You're already parsing color. If it is present and equals
LED_COLOR_ID_MULTI then we should expect children in the node.

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

I see code redundancy here. There are common properties to parse
in both multi color and monochrome LED case: chan-name, led-cur,
max-cur, linux,default-trigger, reg. We could have one function
for parsing this common subset.

> +
> +			cfg[i].chan_nr = led_number;
> +		}
>  
>  		i++;
>  	}
> diff --git a/drivers/leds/leds-lp55xx-common.h b/drivers/leds/leds-lp55xx-common.h
> index 783ed5103ce5..0737e79bc21b 100644
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
> +	int (*intensity_fn)(struct lp55xx_led *led, int chan_num);
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
> @@ -167,9 +173,13 @@ struct lp55xx_chip {
>  struct lp55xx_led {
>  	int chan_nr;
>  	struct led_classdev cdev;
> +	struct led_classdev_mc mc_cdev;
>  	u8 led_current;
>  	u8 max_current;
>  	u8 brightness;
> +/*	int num_colors;*/
> +	int channel_color[LED_COLOR_ID_MAX];
> +	int grouped_channels[LED_COLOR_ID_MAX];
>  	struct lp55xx_chip *chip;
>  };
>  
> diff --git a/include/linux/platform_data/leds-lp55xx.h b/include/linux/platform_data/leds-lp55xx.h
> index 96a787100fda..adce8cec411b 100644
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
> +	int available_colors;

unsigned long

> +	u32 channel_color[LED_COLOR_ID_MAX];
> +	int grouped_channels[LED_COLOR_ID_MAX];
>  };
>  
>  struct lp55xx_predef_pattern {
> diff --git a/modules.builtin.modinfo b/modules.builtin.modinfo
> new file mode 100644
> index 0000000000000000000000000000000000000000..e528d8f57796621b6cfef52ad0da44551a482481
> GIT binary patch
> literal 43550
> zcmcJ2?Q+|=(x(2ta}}twKjNIV<j*)6t(~$X+ldo9*0G$-%sF+IMNyQ*NF)`K@<-~u
> zoV|v<f%nGt=>|YGNXqfd?pCE75g*+RpaC?x8;w!ycl>2BO|zrh@WId3MUofUG7gi1
> zeg~})3e2M*O!DyPegBfbM`0dh(V~db<mme9q^|~l3~tY^)aliUI=#90dUn&gPqW$g
[...]

This has gotten here by mistake I presume.

-- 
Best regards,
Jacek Anaszewski
