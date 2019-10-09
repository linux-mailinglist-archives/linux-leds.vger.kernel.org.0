Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7127FD1B5E
	for <lists+linux-leds@lfdr.de>; Thu, 10 Oct 2019 00:04:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732151AbfJIWE1 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 9 Oct 2019 18:04:27 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:54747 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730809AbfJIWE0 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 9 Oct 2019 18:04:26 -0400
Received: by mail-wm1-f68.google.com with SMTP id p7so4500057wmp.4;
        Wed, 09 Oct 2019 15:04:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=KyV+Jff/gkXafDEOrYW3L4PkrPc8XG792PkV+blt+jo=;
        b=ThLoXWecXgG0EVX/5GgL/sDfEVnIpr9ZkFJqbs7F744jHv6AFhr7f+y8lIzKiVRouz
         P6PMFnY5UXJo0AisprOaUyxvRb2+4TK31uqarx+0BQuSX7fueSirc8roaNdON+1Ac7QE
         d+wGRUrGUH0Lngngrx6eYrk5mCiDxR4JZY/xz5aghXs/G9JfAI1XKdEqHKHNuq0aclPR
         zhl4pRbbqYgk1mkYuuK4G4j61bYfG+1y3Df77xO8Plo18jsYbGMbMq+EPe8hjJqsRDSA
         PHy5Y7p4UfFlb1Mw5ZKPg1J9dFoPNEWc3UbojVLCkHFU6P1QUrLyalFKQU6nweoazoAy
         AiVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=KyV+Jff/gkXafDEOrYW3L4PkrPc8XG792PkV+blt+jo=;
        b=KDdpO4Ywk7Du6SZLR8ReJpkSgqNvTsbsUv5p/YnC2WzQR60c3rHeHIPVusyOll8eEt
         T1tQYeBNWQ+nQv9qLBlfVbKktM9y+KRyMUEdIthVngcfoYawTccXxqJ3WxAUel7ObEaB
         p6xahR0RqsBj/pm34ybMPIKEFKK7F8eXLGPesjhgp5BhKJwbzpsOsSx7QteNNZ9ps9IZ
         QxV16nlpl6FuBOAYR62kPA2lduMsLbFS10Q3kCa0WV4IwNRAl2Bk/s/7QnnRdhQ5WL3v
         8qxHrQe91iFM3MQPGibQjCqFg0A8DWrNVtzT7vUsc3klkFlRJpaUnAwYQ8eYvD3SPoXR
         B9bw==
X-Gm-Message-State: APjAAAWKdT1AFbP4HrbhoL/Nf3rCQCieGiHfTYKPqf9bRECv7q1GxpvC
        ZD+B8c/+MB+POZOVRMlkNP9DjYLY
X-Google-Smtp-Source: APXvYqyrcSl9o8uiFJT4FPRLdSEvhPQDiGAeBxLElCam6XyXWRSPd10CFmy08SUwInC+IrPUFA6Zkw==
X-Received: by 2002:a1c:41c1:: with SMTP id o184mr4281464wma.57.1570658663049;
        Wed, 09 Oct 2019 15:04:23 -0700 (PDT)
Received: from [192.168.1.19] (cjk130.neoplus.adsl.tpnet.pl. [83.31.60.130])
        by smtp.gmail.com with ESMTPSA id t123sm5275856wma.40.2019.10.09.15.04.21
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 09 Oct 2019 15:04:22 -0700 (PDT)
Subject: Re: [PATCH v11 12/16] leds: lp55xx: Add multicolor framework support
 to lp55xx
To:     Dan Murphy <dmurphy@ti.com>, pavel@ucw.cz
Cc:     linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20191008204800.19870-1-dmurphy@ti.com>
 <20191008204800.19870-13-dmurphy@ti.com>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=jacek.anaszewski@gmail.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <1f0ac6f3-a822-84f0-d398-2f16751c3b1b@gmail.com>
Date:   Thu, 10 Oct 2019 00:04:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191008204800.19870-13-dmurphy@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Dan,

On 10/8/19 10:47 PM, Dan Murphy wrote:
> Add multicolor framework support for the lp55xx family.
> 
> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> ---
>  drivers/leds/Kconfig                      |   1 +
>  drivers/leds/leds-lp55xx-common.c         | 176 +++++++++++++++++++---
>  drivers/leds/leds-lp55xx-common.h         |  11 ++
>  include/linux/platform_data/leds-lp55xx.h |   5 +
>  4 files changed, 169 insertions(+), 24 deletions(-)
> 
[...]
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
> index 783ed5103ce5..55d420f704d1 100644
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
> +	int (*color_intensity_fn)(struct lp55xx_led *led);
> +
>  	/* current setting function */
>  	void (*set_led_current) (struct lp55xx_led *led, u8 led_current);
>  
> @@ -159,6 +166,8 @@ struct lp55xx_chip {
>   * struct lp55xx_led
>   * @chan_nr         : Channel number
>   * @cdev            : LED class device
> + * @mc_cdev	    : Multi color class device
> + * @color_component : Multi color LED map information
>   * @led_current     : Current setting at each led channel
>   * @max_current     : Maximun current at each led channel
>   * @brightness      : Brightness value
> @@ -167,6 +176,8 @@ struct lp55xx_chip {
>  struct lp55xx_led {
>  	int chan_nr;
>  	struct led_classdev cdev;
> +	struct led_classdev_mc mc_cdev;
> +	struct led_mc_color_conversion color_component[LP55XX_MAX_GROUPED_CHAN];
>  	u8 led_current;
>  	u8 max_current;
>  	u8 brightness;
> diff --git a/include/linux/platform_data/leds-lp55xx.h b/include/linux/platform_data/leds-lp55xx.h
> index 96a787100fda..1e7a25ed9a87 100644
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
> @@ -23,6 +25,9 @@ struct lp55xx_led_config {
>  	u8 chan_nr;
>  	u8 led_current; /* mA x10, 0 if led is not connected */
>  	u8 max_current;
> +	int num_colors;
> +	unsigned long available_colors;
> +	struct led_mc_color_conversion color_component[LED_COLOR_ID_MAX];

I can't see why the array length can't be LP55XX_MAX_GROUPED_CHAN here
too. You're indexing it with num_colors counter and not with color_id.

>  };
>  
>  struct lp55xx_predef_pattern {
> 

-- 
Best regards,
Jacek Anaszewski
