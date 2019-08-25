Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 083779C2F2
	for <lists+linux-leds@lfdr.de>; Sun, 25 Aug 2019 12:51:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726511AbfHYKvA (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 25 Aug 2019 06:51:00 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:40755 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725995AbfHYKvA (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 25 Aug 2019 06:51:00 -0400
Received: by mail-wr1-f66.google.com with SMTP id c3so12554044wrd.7;
        Sun, 25 Aug 2019 03:50:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Z4LZRcJX7yFxtYd9ZqbkCVE7tpudPLpKrjUrE+oXxxc=;
        b=dU213K24anPdfF7XH/plFNyb+QQjqRPBjlXBy0GJRBkBIRwkK3N2EZpOj8Wv9x+Ssq
         /IqtnzfGYSVwTa3clVOeG3xMC4u5CSJ+ln3MSozcAoHsNQ4sYDVNN3OryTs5Y/ujFSZb
         YUz4WUsVnb3Fja/5ydSZM3XTulHu/fSMUmYH91c5iE8LQyIbJEkmhQ8exeNkLr4zuqeL
         MqgTZ7ZziUD1Yqg8YMtmma4QA8gQg3CKs3Jny196kzjZzTuYFGlFnBbWA9IXqeyaHE58
         9ThAyziiAtUvRFv17bT8X08ieqnGB6aiJfvhaFE9cRGbZutyywCIRChXZUWI3aBWn20H
         KvUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=Z4LZRcJX7yFxtYd9ZqbkCVE7tpudPLpKrjUrE+oXxxc=;
        b=cs/xgrZi/ZWXNhgU34XFbZf0pgZCq13bqErFGn3qwVFrWVIFxpdbkNLXML4hX84CGn
         OPkoyYA1g3+UPs3dqHdXhwc75YtRSUI/r1GTeeGfOpVr1SSdIf1psMyoebGElPU4mQ6v
         k6JDl8bbtr0yByRGojS+EgPP445ox66hf9tggwtzIYF64HjOi/+FIkQvs1EFOmhaEmP2
         NfRgVdvTdBUwPspCtv5tOMbgr0Y/eFxFSxzXaSXortEMwVRtvg6UT/AVgGkUSEi2KaQv
         LGN+oZ6KLnurzlfI4TTtarFWVDjIs61BKeMipv7Ruvhm4+q3RVp49C6jVdgvLvU1c/fO
         1cvQ==
X-Gm-Message-State: APjAAAWdi3YnHAct1Yt6gm68uC5oEv6eoOGLL59SYefEa/lzxqUHhff2
        uW3eAaRzCwh+gdbiqbDM8Q7DzmYZ
X-Google-Smtp-Source: APXvYqxX3U4ynt293pQXYmzSYp6tOoPOuQsTwYvcnP6P06wmrirmciEcsI5iV5GLaKWqDjWr6j+m6Q==
X-Received: by 2002:adf:94e5:: with SMTP id 92mr15937253wrr.212.1566730256410;
        Sun, 25 Aug 2019 03:50:56 -0700 (PDT)
Received: from [192.168.1.19] (bkm171.neoplus.adsl.tpnet.pl. [83.28.180.171])
        by smtp.gmail.com with ESMTPSA id t8sm22848815wra.73.2019.08.25.03.50.54
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 25 Aug 2019 03:50:55 -0700 (PDT)
Subject: Re: [PATCH v3 1/5] leds: lm3532: Fix brightness control for i2c mode
To:     Dan Murphy <dmurphy@ti.com>, pavel@ucw.cz, tony@atomide.com,
        sre@kernel.org, nekit1000@gmail.com, mpartap@gmx.net,
        merlijn@wizzup.org
Cc:     linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20190820195307.27590-1-dmurphy@ti.com>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=jacek.anaszewski@gmail.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <8497503d-6b6a-b557-2247-33b186218beb@gmail.com>
Date:   Sun, 25 Aug 2019 12:50:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190820195307.27590-1-dmurphy@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Dan,

Thank you for the update.

On 8/20/19 9:53 PM, Dan Murphy wrote:
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
> 
> v3 - Removed register define updates - https://lore.kernel.org/patchwork/patch/1114542/
> 
>  drivers/leds/leds-lm3532.c | 44 ++++++++++++++++++++++++++------------
>  1 file changed, 30 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/leds/leds-lm3532.c b/drivers/leds/leds-lm3532.c
> index 646100724971..8132d05f7add 100644
> --- a/drivers/leds/leds-lm3532.c
> +++ b/drivers/leds/leds-lm3532.c
> @@ -38,6 +38,9 @@
>  #define LM3532_REG_ZN_2_LO	0x65
>  #define LM3532_REG_ZN_3_HI	0x66
>  #define LM3532_REG_ZN_3_LO	0x67
> +#define LM3532_REG_ZONE_TRGT_A	0x70
> +#define LM3532_REG_ZONE_TRGT_B	0x75
> +#define LM3532_REG_ZONE_TRGT_C	0x7a
>  #define LM3532_REG_MAX		0x7e
>  
>  /* Contorl Enable */
> @@ -116,6 +119,7 @@ struct lm3532_als_data {
>   * @priv - Pointer the device data structure
>   * @control_bank - Control bank the LED is associated to
>   * @mode - Mode of the LED string
> + * @ctrl_brt_pointer - Zone target register that controls the sink
>   * @num_leds - Number of LED strings are supported in this array
>   * @led_strings - The LED strings supported in this array
>   * @label - LED label
> @@ -126,6 +130,7 @@ struct lm3532_led {
>  
>  	int control_bank;
>  	int mode;
> +	int ctrl_brt_pointer;
>  	int num_leds;
>  	u32 led_strings[LM3532_MAX_CONTROL_BANKS];
>  	char label[LED_MAX_NAME_SIZE];
> @@ -339,8 +344,8 @@ static int lm3532_brightness_set(struct led_classdev *led_cdev,
>  	if (ret)
>  		goto unlock;
>  
> -	brightness_reg = LM3532_REG_CTRL_A_BRT + led->control_bank * 2;
> -	brt_val = brt_val / LM3532_BRT_VAL_ADJUST;
> +	brightness_reg = LM3532_REG_ZONE_TRGT_A + led->control_bank * 5 +
> +			 (led->ctrl_brt_pointer >> 2);
>  
>  	ret = regmap_write(led->priv->regmap, brightness_reg, brt_val);
>  
> @@ -356,8 +361,30 @@ static int lm3532_init_registers(struct lm3532_led *led)
>  	unsigned int output_cfg_val = 0;
>  	unsigned int output_cfg_shift = 0;
>  	unsigned int output_cfg_mask = 0;
> +	unsigned int brightness_config_reg;
> +	unsigned int brightness_config_val;
>  	int ret, i;
>  
> +	if (drvdata->enable_gpio)
> +		gpiod_direction_output(drvdata->enable_gpio, 1);
> +
> +	brightness_config_reg = LM3532_REG_ZONE_CFG_A + led->control_bank * 2;
> +	/*
> +	 * This could be hard coded to the default value but the control
> +	 * brightness register may have changed during boot.
> +	 */
> +	ret = regmap_read(drvdata->regmap, brightness_config_reg,
> +			  &led->ctrl_brt_pointer);
> +	if (ret)
> +		return ret;
> +
> +	led->ctrl_brt_pointer &= LM3532_ZONE_MASK;
> +	brightness_config_val = led->ctrl_brt_pointer | led->mode;
> +	ret = regmap_write(drvdata->regmap, brightness_config_reg,
> +			   brightness_config_val);
> +	if (ret)
> +		return ret;
> +
>  	for (i = 0; i < led->num_leds; i++) {
>  		output_cfg_shift = led->led_strings[i] * 2;
>  		output_cfg_val |= (led->control_bank << output_cfg_shift);
> @@ -382,7 +409,6 @@ static int lm3532_als_configure(struct lm3532_data *priv,
>  	struct lm3532_als_data *als = priv->als_data;
>  	u32 als_vmin, als_vmax, als_vstep;
>  	int zone_reg = LM3532_REG_ZN_0_HI;
> -	int brightnes_config_reg;
>  	int ret;
>  	int i;
>  
> @@ -411,14 +437,7 @@ static int lm3532_als_configure(struct lm3532_data *priv,
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
> @@ -634,9 +653,6 @@ static int lm3532_probe(struct i2c_client *client,
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

Patch set applied.

-- 
Best regards,
Jacek Anaszewski
