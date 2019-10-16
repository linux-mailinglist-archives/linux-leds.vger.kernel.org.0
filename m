Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C4119D9C44
	for <lists+linux-leds@lfdr.de>; Wed, 16 Oct 2019 23:09:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728480AbfJPVJ0 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 16 Oct 2019 17:09:26 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:35375 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727542AbfJPVJZ (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 16 Oct 2019 17:09:25 -0400
Received: by mail-wr1-f66.google.com with SMTP id v8so29644447wrt.2;
        Wed, 16 Oct 2019 14:09:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:openpgp:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=a1u4ctK0eqqGfLD5qC9FK2nFgVcGiySc5jdu0XXv4IE=;
        b=ANCS+MCkdZVcmS7y8kTBIWMHHfWtycc8hP66SRZmojZHrx6eWmEStaiNV9UZ+ujfvt
         PG5eriwkqXPRfwGaOu58nXg5JJs1T3Ykf4D32LM0GsKabDT49KGmlpJA87UcEsbbXxyK
         SFoav7SJByEd3oIBuABp9QjgClDDe5A3f3AmT15hWbYic/FD4kC7qhlt+7MGVlM8d17Q
         gSHKztg+ar1q/tmXNKIQaq1Wmi/rfaog5RaazcioAdPES0kIdgG5YhP4ybDVIp+ObCFq
         cBx20ggLDkabubwB+3gxpaJwfqbCS4aXI8oHuhOtqoKktTNzxZGs0jGX+2t5sDDMgKnJ
         OQiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:openpgp:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=a1u4ctK0eqqGfLD5qC9FK2nFgVcGiySc5jdu0XXv4IE=;
        b=WNl59QrhyFiKgbW2fSgaREdeN14oCrxUETrgFgSya/bYlcT82yUqCPIDJHef01B5j4
         9Xf37N4ndumZi6ev5JoieLVMf2swiz8nzI8AM4gua6qSNsO6lvgaYATEapshuwTsocG9
         IiU1ql+7lTeRM1xRoya3rXuKpTPlxrwewG/MMYizduipoEDtG/5OS+GQQwqUim9c9e7e
         9Zd9bU0ijHsbVN36OxlQJKg9+mrJSOuhMEE893wA9wA2dQiTgJhYKycPr3Ffger54TPM
         cHU+KyT7G7+1xAwyCUR956kfjUVQPUTnPJKaCIWNrGpmXdMZrN2HE84fRkHUEmScz9xN
         vHHw==
X-Gm-Message-State: APjAAAXnldQ/mIPMcbMcL0PzV3pBvICY7gm7QcfKQpZ4IMcR+2NrplbB
        97zp6s+eDS+4c5vKClQowspF7+fK
X-Google-Smtp-Source: APXvYqzyOR5m4xJMbHhGynnn7bKvvMMyjgDxzAPy8iy+gGHoRpOw3IYveKHz1p1cUOPRo3v7L2HPsw==
X-Received: by 2002:a5d:4f0f:: with SMTP id c15mr4439878wru.161.1571260162286;
        Wed, 16 Oct 2019 14:09:22 -0700 (PDT)
Received: from [192.168.1.19] (dkm177.neoplus.adsl.tpnet.pl. [83.24.16.177])
        by smtp.gmail.com with ESMTPSA id w17sm43218wra.34.2019.10.16.14.09.21
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 16 Oct 2019 14:09:21 -0700 (PDT)
Subject: Re: [PATCH v13 13/18] leds: lp55xx: Add multicolor framework support
 to lp55xx
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
To:     Dan Murphy <dmurphy@ti.com>, pavel@ucw.cz
Cc:     linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20191016155954.29044-1-dmurphy@ti.com>
 <20191016155954.29044-14-dmurphy@ti.com>
 <3d73452f-fd41-0b63-c79d-c29ed70867af@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=jacek.anaszewski@gmail.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <1a78bde8-4559-ce0d-75de-430b23dfc5f1@gmail.com>
Date:   Wed, 16 Oct 2019 23:09:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <3d73452f-fd41-0b63-c79d-c29ed70867af@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

And one more issue regarding LEDS_CLASS_MULTI_COLOR config.

On 10/16/19 10:44 PM, Jacek Anaszewski wrote:
> Dan,
> 
> Some variable naming related nitpicking below.
> 
> On 10/16/19 5:59 PM, Dan Murphy wrote:
>> Add multicolor framework support for the lp55xx family.
>>
>> Signed-off-by: Dan Murphy <dmurphy@ti.com>
>> ---
>>  drivers/leds/Kconfig                      |   2 +
>>  drivers/leds/leds-lp55xx-common.c         | 175 +++++++++++++++++++---
>>  drivers/leds/leds-lp55xx-common.h         |   9 ++
>>  include/linux/platform_data/leds-lp55xx.h |   7 +
>>  4 files changed, 170 insertions(+), 23 deletions(-)
>>
>> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
>> index fb614a6b9afa..a121a2855c06 100644
>> --- a/drivers/leds/Kconfig
>> +++ b/drivers/leds/Kconfig
>> @@ -377,8 +377,10 @@ config LEDS_LP50XX
>>  config LEDS_LP55XX_COMMON
>>  	tristate "Common Driver for TI/National LP5521/5523/55231/5562/8501"
>>  	depends on LEDS_LP5521 || LEDS_LP5523 || LEDS_LP5562 || LEDS_LP8501
>> +	depends on OF
>>  	select FW_LOADER
>>  	select FW_LOADER_USER_HELPER
>> +	select LEDS_CLASS_MULTI_COLOR

Why so? This is unnecessary.

>>  	help
>>  	  This option supports common operations for LP5521/5523/55231/5562/8501
>>  	  devices.
>> diff --git a/drivers/leds/leds-lp55xx-common.c b/drivers/leds/leds-lp55xx-common.c
>> index 824d1d73dde1..026ebc2f8e18 100644
>> --- a/drivers/leds/leds-lp55xx-common.c
>> +++ b/drivers/leds/leds-lp55xx-common.c
>> @@ -131,14 +131,54 @@ static struct attribute *lp55xx_led_attrs[] = {
>>  };
>>  ATTRIBUTE_GROUPS(lp55xx_led);
>>  
>> +static int lp55xx_map_channel(struct lp55xx_led *led, int color_id,
>> +			      enum led_brightness brightness)
>> +{
>> +	int i;
>> +
>> +	for (i = 0; i < led->mc_cdev.num_leds; i++) {
>> +		if (led->color_component[i].color_id == color_id) {
> 
> I'd use plural "color_components" for the property name.
> 
>> +			led->color_component[i].brightness = brightness;
>> +			return 0;
>> +		}
>> +	}
>> +
>> +	return -EINVAL;
>> +}
>> +
>>  static int lp55xx_set_brightness(struct led_classdev *cdev,
>>  			     enum led_brightness brightness)
>>  {
>> +	struct led_mc_color_conversion color_component[LP55XX_MAX_GROUPED_CHAN];
>>  	struct lp55xx_led *led = cdev_to_lp55xx_led(cdev);
>>  	struct lp55xx_device_config *cfg = led->chip->cfg;
>> +	int ret;
>> +	int i;
>>  
>> -	led->brightness = (u8)brightness;
>> -	return cfg->brightness_fn(led);
>> +	if (led->mc_cdev.num_leds > 1) {
>> +		if (!cfg->multicolor_brightness_fn)
>> +			return -EINVAL;
>> +
>> +		led_mc_calc_color_components(&led->mc_cdev, brightness,
>> +					     color_component);
> 
> Similarly here - you calculate all components so it is weird to pass
> variable of singular color_component form.
> 
>> +
>> +		for (i = 0; i < led->mc_cdev.num_leds; i++) {
>> +			ret = lp55xx_map_channel(led,
>> +						color_component[i].color_id,
>> +						color_component[i].brightness);
>> +			if (ret)
>> +				return ret;
>> +		}
>> +
>> +		ret = cfg->multicolor_brightness_fn(led);
>> +		if (ret)
>> +			return ret;

Please wrap what you have under "if: case into a function, e.g.:


static int lp55xx_set_mc_brightness()
{
	int ret = -EINVAL;

#if IS_ENABLED(CONFIG_LEDS_CLASS_MULTI_COLOR)
	if (!cfg->multicolor_brightness_fn)
		....
#endif

	return ret;
}

And then have here:

if (led->mc_cdev.num_leds > 1)
	ret = lp55xx_set_mc_brightness();


You won't need inline empty led_mc_calc_color_components() then.

>> +	} else {
>> +		led->brightness = (u8)brightness;
>> +		ret = cfg->brightness_fn(led);
>> +	}
>> +
>> +	return ret;
> [...]
> 

-- 
Best regards,
Jacek Anaszewski
