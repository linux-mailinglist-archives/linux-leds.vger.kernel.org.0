Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5CEE77E2A9
	for <lists+linux-leds@lfdr.de>; Thu,  1 Aug 2019 20:52:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731986AbfHASwS (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 1 Aug 2019 14:52:18 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:35318 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727899AbfHASwS (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 1 Aug 2019 14:52:18 -0400
Received: by mail-wr1-f66.google.com with SMTP id y4so74690130wrm.2;
        Thu, 01 Aug 2019 11:52:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=/57RK8cAibe8bCoTtXFBGc8yecliDAs1UI6+SLnKvQI=;
        b=h2wW0SPCa/93FLvAVtnyuoRPjC9azETuapQJYQY240vFaZU3oQ7WYaxLP+rTcwAJ1t
         YWGY18jMrTtIWY9kb9wJPOJtSgiI41HfRqWPRRM51pJfhEaiv1hn6EdaTYCyxUTY9+PU
         YPU6ccVcdv89Pw3kI3RImJpyiGNvUFxYkRcSvmiaxuHVvs8xKE1TWeDEzIBeQHfqlQ9j
         ufV27iWC4Ov3604IRsEd06kE1qglkWZqZFLiBR2J0P9+8hqBiktIh1cc/kTrhp53///L
         nANAM/yUQ4NGEkmrxR1UgIsx/WEimIeA42YoMraOaYB9lB1VIpth9MuSQWcUG02ZX+ub
         uhOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=/57RK8cAibe8bCoTtXFBGc8yecliDAs1UI6+SLnKvQI=;
        b=nKNasxmoAVtmf4JEC3MiudOWnffoxc0/rTlA32qkHIQ0UTQENvYMo+S0fk0XxTRrAO
         3HT93vUWX4A3eP+63udU+Ez2y0ipmSHu5WUKHdhN7NB7W3QyYO4EmbNLvBWIC1KcANlg
         TMfhbcrbl/UkgWmDyenMUswPAgeGwdamNmizldNDVAbvAtg8MJryeaCO3G1D8cYm5VZx
         MD4RbHbnCVPb1CeGIor/rXG+dFiwX0sIbfWl6XG0RpuVSHS/30eoTt2+JJxSkgRKkexW
         GufBILSChgv5BHxd0Q/PRcY1D5SS64jamef0SXQeCk8o7o7xbx6ISGBU9aMf21pxdndr
         abcA==
X-Gm-Message-State: APjAAAWaE5wh6/Mf2Ol2VFERRcTuyoxOuPo62Y+JCxWmjaO/najFZnhC
        wLdgQ5o5r9luhjd5Ha3lBJlSEY66
X-Google-Smtp-Source: APXvYqxgEkDO316PsUCZKNtM087dbMdyHLJwxfThWrjuaXcCezxMEVKHe0TGnRfteOzMzeLLI+jP9A==
X-Received: by 2002:adf:e8cb:: with SMTP id k11mr57606730wrn.244.1564685534154;
        Thu, 01 Aug 2019 11:52:14 -0700 (PDT)
Received: from [192.168.1.19] (bks40.neoplus.adsl.tpnet.pl. [83.28.186.40])
        by smtp.gmail.com with ESMTPSA id l8sm145575484wrg.40.2019.08.01.11.52.12
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 01 Aug 2019 11:52:13 -0700 (PDT)
Subject: Re: [PATCH 1/3] leds: lm3532: Fix brightness control for i2c mode
To:     Dan Murphy <dmurphy@ti.com>, pavel@ucw.cz, tony@atomide.com,
        sre@kernel.org, nekit1000@gmail.com, mpartap@gmx.net,
        merlijn@wizzup.org
Cc:     linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20190801151421.21486-1-dmurphy@ti.com>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=jacek.anaszewski@gmail.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <3e304b9a-e7fc-9294-1950-ee9bc5956305@gmail.com>
Date:   Thu, 1 Aug 2019 20:52:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190801151421.21486-1-dmurphy@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Dan,

Thank you for the patch set. Please find my comments
in the code below.

On 8/1/19 5:14 PM, Dan Murphy wrote:
> Fix the brightness control for I2C mode.  Instead of
> changing the full scale current register update the ALS target
> register for the appropriate banks.
> 
> In addition clean up some code errors and random misspellings found
> during coding.
> 
> Tested on Droid4 as well as LM3532 EVM connected to a BeagleBoneBlack
> 
> Fixes: e37a7f8d77e1 ("leds: lm3532: Introduce the lm3532 LED driver")
> Reported-by: Pavel Machek <pavel@ucw.cz>
> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> ---
>  drivers/leds/leds-lm3532.c | 78 ++++++++++++++++++++++++--------------
>  1 file changed, 50 insertions(+), 28 deletions(-)
> 
> diff --git a/drivers/leds/leds-lm3532.c b/drivers/leds/leds-lm3532.c
> index 646100724971..ff197adb2f22 100644
> --- a/drivers/leds/leds-lm3532.c
> +++ b/drivers/leds/leds-lm3532.c
> @@ -23,11 +23,11 @@
>  #define LM3532_REG_PWM_B_CFG	0x14
>  #define LM3532_REG_PWM_C_CFG	0x15
>  #define LM3532_REG_ZONE_CFG_A	0x16
> -#define LM3532_REG_CTRL_A_BRT	0x17
> +#define LM3532_REG_CTRL_A_FS_CURR	0x17
>  #define LM3532_REG_ZONE_CFG_B	0x18
> -#define LM3532_REG_CTRL_B_BRT	0x19
> +#define LM3532_REG_CTRL_B_FS_CURR	0x19
>  #define LM3532_REG_ZONE_CFG_C	0x1a
> -#define LM3532_REG_CTRL_C_BRT	0x1b
> +#define LM3532_REG_CTRL_C_FS_CURR	0x1b
>  #define LM3532_REG_ENABLE	0x1d
>  #define LM3532_ALS_CONFIG	0x23
>  #define LM3532_REG_ZN_0_HI	0x60
> @@ -38,9 +38,12 @@
>  #define LM3532_REG_ZN_2_LO	0x65
>  #define LM3532_REG_ZN_3_HI	0x66
>  #define LM3532_REG_ZN_3_LO	0x67
> +#define LM3532_REG_ZONE_TRGT_A	0x70
> +#define LM3532_REG_ZONE_TRGT_B	0x75
> +#define LM3532_REG_ZONE_TRGT_C	0x7a
>  #define LM3532_REG_MAX		0x7e
>  
> -/* Contorl Enable */
> +/* Control Enable */
>  #define LM3532_CTRL_A_ENABLE	BIT(0)
>  #define LM3532_CTRL_B_ENABLE	BIT(1)
>  #define LM3532_CTRL_C_ENABLE	BIT(2)
> @@ -63,6 +66,8 @@
>  #define LM3532_ZONE_2		BIT(3)
>  #define LM3532_ZONE_3		(BIT(2) | BIT(3))
>  #define LM3532_ZONE_4		BIT(4)
> +#define LM3532_BRT_CFG_MASK	(LM3532_I2C_CTRL | LM3532_LINEAR_MAP | \
> +				LM3532_ZONE_MASK)
>  
>  #define LM3532_ENABLE_ALS	BIT(3)
>  #define LM3532_ALS_SEL_SHIFT	6
> @@ -127,6 +132,7 @@ struct lm3532_led {
>  	int control_bank;
>  	int mode;
>  	int num_leds;
> +	int ctrl_brt_pointer;
>  	u32 led_strings[LM3532_MAX_CONTROL_BANKS];
>  	char label[LED_MAX_NAME_SIZE];
>  };
> @@ -161,18 +167,18 @@ struct lm3532_data {
>  };
>  
>  static const struct reg_default lm3532_reg_defs[] = {
> -	{LM3532_REG_OUTPUT_CFG, 0xe4},
> +	{LM3532_REG_OUTPUT_CFG, 0x24},
>  	{LM3532_REG_STARTSHUT_RAMP, 0xc0},
>  	{LM3532_REG_RT_RAMP, 0xc0},
>  	{LM3532_REG_PWM_A_CFG, 0x82},
>  	{LM3532_REG_PWM_B_CFG, 0x82},
>  	{LM3532_REG_PWM_C_CFG, 0x82},
>  	{LM3532_REG_ZONE_CFG_A, 0xf1},
> -	{LM3532_REG_CTRL_A_BRT, 0xf3},
> +	{LM3532_REG_CTRL_A_FS_CURR, 0x13},
>  	{LM3532_REG_ZONE_CFG_B, 0xf1},
> -	{LM3532_REG_CTRL_B_BRT, 0xf3},
> +	{LM3532_REG_CTRL_B_FS_CURR, 0x13},
>  	{LM3532_REG_ZONE_CFG_C, 0xf1},
> -	{LM3532_REG_CTRL_C_BRT, 0xf3},
> +	{LM3532_REG_CTRL_C_FS_CURR, 0x13},
>  	{LM3532_REG_ENABLE, 0xf8},
>  	{LM3532_ALS_CONFIG, 0x44},
>  	{LM3532_REG_ZN_0_HI, 0x35},
> @@ -302,7 +308,7 @@ static int lm3532_led_disable(struct lm3532_led *led_data)
>  	int ret;
>  
>  	ret = regmap_update_bits(led_data->priv->regmap, LM3532_REG_ENABLE,
> -					 ctrl_en_val, ~ctrl_en_val);
> +					 ctrl_en_val, 0);
>  	if (ret) {
>  		dev_err(led_data->priv->dev, "Failed to set ctrl:%d\n", ret);
>  		return ret;
> @@ -321,7 +327,7 @@ static int lm3532_brightness_set(struct led_classdev *led_cdev,
>  
>  	mutex_lock(&led->priv->lock);
>  
> -	if (led->mode == LM3532_BL_MODE_ALS) {
> +	if (led->mode == LM3532_ALS_CTRL) {
>  		if (brt_val > LED_OFF)
>  			ret = lm3532_led_enable(led);
>  		else
> @@ -339,11 +345,9 @@ static int lm3532_brightness_set(struct led_classdev *led_cdev,
>  	if (ret)
>  		goto unlock;
>  
> -	brightness_reg = LM3532_REG_CTRL_A_BRT + led->control_bank * 2;
> -	brt_val = brt_val / LM3532_BRT_VAL_ADJUST;
> -
> +	brightness_reg = LM3532_REG_ZONE_TRGT_A + led->control_bank * 5 +
> +			 (led->ctrl_brt_pointer >> 2);
>  	ret = regmap_write(led->priv->regmap, brightness_reg, brt_val);
> -
>  unlock:
>  	mutex_unlock(&led->priv->lock);
>  	return ret;
> @@ -356,8 +360,29 @@ static int lm3532_init_registers(struct lm3532_led *led)
>  	unsigned int output_cfg_val = 0;
>  	unsigned int output_cfg_shift = 0;
>  	unsigned int output_cfg_mask = 0;
> +	int brightness_config_reg;
> +	int brightness_config_val;
>  	int ret, i;
>  
> +	if (drvdata->enable_gpio)
> +		gpiod_direction_output(drvdata->enable_gpio, 1);
> +
> +	brightness_config_reg = LM3532_REG_ZONE_CFG_A + led->control_bank * 2;
> +	/* This could be hard coded to the default value but the control

Coding style issue:

        /*
         * This is the preferred style for multi-line comments


> +	 * brightness register may have changed during boot.
> +	 */> +	ret = regmap_read(drvdata->regmap, brightness_config_reg,
> +			  &led->ctrl_brt_pointer);
> +	if (ret)
> +		return ret;
> +
> +	led->ctrl_brt_pointer &= LM3532_ZONE_MASK;

Could you shed more light on this hardware peculiarity?
What kind of pointer is it?

> +	brightness_config_val = led->ctrl_brt_pointer | led->mode;
> +	ret = regmap_write(drvdata->regmap, brightness_config_reg,
> +			   brightness_config_val);
> +	if (ret)
> +		return ret;
> +
>  	for (i = 0; i < led->num_leds; i++) {
>  		output_cfg_shift = led->led_strings[i] * 2;
>  		output_cfg_val |= (led->control_bank << output_cfg_shift);
> @@ -382,7 +407,6 @@ static int lm3532_als_configure(struct lm3532_data *priv,
>  	struct lm3532_als_data *als = priv->als_data;
>  	u32 als_vmin, als_vmax, als_vstep;
>  	int zone_reg = LM3532_REG_ZN_0_HI;
> -	int brightnes_config_reg;
>  	int ret;
>  	int i;
>  
> @@ -411,14 +435,7 @@ static int lm3532_als_configure(struct lm3532_data *priv,
>  	als->config = (als->als_avrg_time | (LM3532_ENABLE_ALS) |
>  		(als->als_input_mode << LM3532_ALS_SEL_SHIFT));
>  
> -	ret = regmap_write(priv->regmap, LM3532_ALS_CONFIG, als->config);
> -	if (ret)
> -		return ret;
> -
> -	brightnes_config_reg = LM3532_REG_ZONE_CFG_A + led->control_bank * 2;
> -
> -	return regmap_update_bits(priv->regmap, brightnes_config_reg,
> -				  LM3532_I2C_CTRL, LM3532_ALS_CTRL);
> +	return regmap_write(priv->regmap, LM3532_ALS_CONFIG, als->config);
>  }
>  
>  static int lm3532_parse_als(struct lm3532_data *priv)
> @@ -542,12 +559,14 @@ static int lm3532_parse_node(struct lm3532_data *priv)
>  		}
>  
>  		if (led->mode == LM3532_BL_MODE_ALS) {
> +			led->mode = LM3532_ALS_CTRL;
>  			ret = lm3532_parse_als(priv);
>  			if (ret)
>  				dev_err(&priv->client->dev, "Failed to parse als\n");
>  			else
>  				lm3532_als_configure(priv, led);
> -		}
> +		} else
> +			led->mode = LM3532_I2C_CTRL;

Coding style issue: you need curly braces around the body of "else"
in this case as well.

>  
>  		led->num_leds = fwnode_property_count_u32(child, "led-sources");
>  		if (led->num_leds > LM3532_MAX_LED_STRINGS) {
> @@ -587,7 +606,13 @@ static int lm3532_parse_node(struct lm3532_data *priv)
>  			goto child_out;
>  		}
>  
> -		lm3532_init_registers(led);
> +		ret = lm3532_init_registers(led);
> +		if (ret) {
> +			dev_err(&priv->client->dev, "register init err: %d\n",
> +				ret);
> +			fwnode_handle_put(child);
> +			goto child_out;
> +		}
>  
>  		i++;
>  	}
> @@ -634,9 +659,6 @@ static int lm3532_probe(struct i2c_client *client,
>  		return ret;
>  	}
>  
> -	if (drvdata->enable_gpio)
> -		gpiod_direction_output(drvdata->enable_gpio, 1);
> -
>  	return ret;
>  }
>  
> 

-- 
Best regards,
Jacek Anaszewski
