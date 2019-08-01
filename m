Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 26BB77E37B
	for <lists+linux-leds@lfdr.de>; Thu,  1 Aug 2019 21:48:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388684AbfHATsr (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 1 Aug 2019 15:48:47 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:33597 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388609AbfHATsr (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 1 Aug 2019 15:48:47 -0400
Received: by mail-wm1-f65.google.com with SMTP id h19so4392397wme.0;
        Thu, 01 Aug 2019 12:48:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=fogmmuIXVtf8Dt2A8vpHuSaMOqU2LYOosVYosYcJPzY=;
        b=Dy6dvKUlGdHpVC7fL9OhOV8Opi+9qkdxVK6x9eK74Ck5tFCJ43lYVlfJgYIYU7BRE6
         MtypMtkYzaEyaupboqwwV1D/ABW6QNy1VEsNp4fUDUgX8ZRZnkBXtrPNA5I3R/PUJ2Um
         yTUQlQ+1GKldjIRROEOqSsxVmfGEYsoBuiv2+7Ar2yNmpEblbQzQDBaTaqoKeYGSk+Ys
         QKyz9F6apfeavzMJyju6qWqf9uog5XzR20mhiaq03o5F441nyDiH+JdY8nShm8sl5Dlp
         bqs/ZqCohy1Fuz1uIm2dYN/o/s1fcIMymQIZus9SriqUdsfe08zwjiLSDyyjAmfI1gT4
         amHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=fogmmuIXVtf8Dt2A8vpHuSaMOqU2LYOosVYosYcJPzY=;
        b=nqNON1sOXiGp3NTNF0AOiTtuAs18EgHN6t3QAKuY9L03rcp1E/yznxvMm/oUFRp0Jw
         i1MuGtEZU3Bnv/BnnI+gzl71DbWwXGORYPgPECuvYousZZG4jlPjPyXEh1Okpyz858jm
         sRsAPWgWKDEviiBrwGX133mmHKjPjDJhepuwlwJPLupgB6A8kwV20GBCE8/3NU+8DMj0
         qO30eWvxfiDjssODYbJxfetnIo2Batgn5o1wL93Gsr/++SvlOrLz+fBgvzJNynuPQ3RE
         EMB7+0EJXCJN9JvXuKzfVZ4nu3vLxBMItIW7aukrumRkMub3wpWWts3/8bc6WPrG75G1
         i6zg==
X-Gm-Message-State: APjAAAUGIkTYu2+7w3ELXz/8P+E+S5G7Q+H5OsywR2tJA19UojrxmQSq
        gfHMCsWT9sKt+fkBPIcW6giDLY/p
X-Google-Smtp-Source: APXvYqwl5C0vXu5DRaX+lb+B3uJkBVeBrHvmORlqtN0e+wSMQ7LuiXRq9zpV5Swttz0Rkkk3WCOtkw==
X-Received: by 2002:a1c:6c01:: with SMTP id h1mr300142wmc.30.1564688923934;
        Thu, 01 Aug 2019 12:48:43 -0700 (PDT)
Received: from [192.168.1.19] (bks40.neoplus.adsl.tpnet.pl. [83.28.186.40])
        by smtp.gmail.com with ESMTPSA id n5sm54651379wmi.21.2019.08.01.12.48.42
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 01 Aug 2019 12:48:43 -0700 (PDT)
Subject: Re: [PATCH 1/3] leds: lm3532: Fix brightness control for i2c mode
To:     Dan Murphy <dmurphy@ti.com>, pavel@ucw.cz, tony@atomide.com,
        sre@kernel.org, nekit1000@gmail.com, mpartap@gmx.net,
        merlijn@wizzup.org
Cc:     linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20190801151421.21486-1-dmurphy@ti.com>
 <3e304b9a-e7fc-9294-1950-ee9bc5956305@gmail.com>
 <3716262b-64e5-e236-1c35-7cfe9e0d935a@ti.com>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=jacek.anaszewski@gmail.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <1fb65b16-a558-37ba-30a9-26819849f336@gmail.com>
Date:   Thu, 1 Aug 2019 21:48:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <3716262b-64e5-e236-1c35-7cfe9e0d935a@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Dan,

On 8/1/19 9:17 PM, Dan Murphy wrote:
> Jacek
> 
> On 8/1/19 1:52 PM, Jacek Anaszewski wrote:
>> Hi Dan,
>>
>> Thank you for the patch set. Please find my comments
>> in the code below.
>>
>> On 8/1/19 5:14 PM, Dan Murphy wrote:
>>> Fix the brightness control for I2C mode.  Instead of
>>> changing the full scale current register update the ALS target
>>> register for the appropriate banks.
>>>
>>> In addition clean up some code errors and random misspellings found
>>> during coding.
>>>
>>> Tested on Droid4 as well as LM3532 EVM connected to a BeagleBoneBlack
>>>
>>> Fixes: e37a7f8d77e1 ("leds: lm3532: Introduce the lm3532 LED driver")
>>> Reported-by: Pavel Machek <pavel@ucw.cz>
>>> Signed-off-by: Dan Murphy <dmurphy@ti.com>
>>> ---
>>>   drivers/leds/leds-lm3532.c | 78 ++++++++++++++++++++++++--------------
>>>   1 file changed, 50 insertions(+), 28 deletions(-)
>>>
[...]
>>> +     * brightness register may have changed during boot.
>>> +     */> +    ret = regmap_read(drvdata->regmap, brightness_config_reg,
>>> +              &led->ctrl_brt_pointer);
>>> +    if (ret)
>>> +        return ret;
>>> +
>>> +    led->ctrl_brt_pointer &= LM3532_ZONE_MASK;
>> Could you shed more light on this hardware peculiarity?
>> What kind of pointer is it?
> 
> The bits in the register are called Control A,B or C Brightness Pointer
> in the data sheet.
> 
> Basically BITS(4:2) control or points to which Zone target register will
> be used to control
> 
> the output current for the particular control bank
> 
> 000 = Control A Zone Target 0
> 001 = Control A Zone Target 1
> 010 = Control A Zone Target 2
> 011 = Control A Zone Target 3
> 1XX = Control A Zone Target 4 (default)
> 
> I was trying to keep the variable and register bits name some what the
> same.

Thanks for the explanation.

If that's the name from data sheet then it's indeed reasonable to
keep the same name for the variable.

>>
>>> +    brightness_config_val = led->ctrl_brt_pointer | led->mode;
>>> +    ret = regmap_write(drvdata->regmap, brightness_config_reg,
>>> +               brightness_config_val);
>>> +    if (ret)>>> +        return ret;
>>> +
>>>       for (i = 0; i < led->num_leds; i++) {
>>>           output_cfg_shift = led->led_strings[i] * 2;
>>>           output_cfg_val |= (led->control_bank << output_cfg_shift);
>>> @@ -382,7 +407,6 @@ static int lm3532_als_configure(struct
>>> lm3532_data *priv,
>>>       struct lm3532_als_data *als = priv->als_data;
>>>       u32 als_vmin, als_vmax, als_vstep;
>>>       int zone_reg = LM3532_REG_ZN_0_HI;
>>> -    int brightnes_config_reg;
>>>       int ret;
>>>       int i;
>>>   @@ -411,14 +435,7 @@ static int lm3532_als_configure(struct
>>> lm3532_data *priv,
>>>       als->config = (als->als_avrg_time | (LM3532_ENABLE_ALS) |
>>>           (als->als_input_mode << LM3532_ALS_SEL_SHIFT));
>>>   -    ret = regmap_write(priv->regmap, LM3532_ALS_CONFIG, als->config);
>>> -    if (ret)
>>> -        return ret;
>>> -
>>> -    brightnes_config_reg = LM3532_REG_ZONE_CFG_A + led->control_bank
>>> * 2;
>>> -
>>> -    return regmap_update_bits(priv->regmap, brightnes_config_reg,
>>> -                  LM3532_I2C_CTRL, LM3532_ALS_CTRL);
>>> +    return regmap_write(priv->regmap, LM3532_ALS_CONFIG, als->config);
>>>   }
>>>     static int lm3532_parse_als(struct lm3532_data *priv)
>>> @@ -542,12 +559,14 @@ static int lm3532_parse_node(struct lm3532_data
>>> *priv)
>>>           }
>>>             if (led->mode == LM3532_BL_MODE_ALS) {
>>> +            led->mode = LM3532_ALS_CTRL;
>>>               ret = lm3532_parse_als(priv);
>>>               if (ret)
>>>                   dev_err(&priv->client->dev, "Failed to parse als\n");
>>>               else
>>>                   lm3532_als_configure(priv, led);
>>> -        }
>>> +        } else
>>> +            led->mode = LM3532_I2C_CTRL;
>> Coding style issue: you need curly braces around the body of "else"
>> in this case as well.
> 
> No checkpatch complaint I will fix it.

Check section 3) Placing Braces and Spaces from
Documentation/process/coding-style.rst.

-- 
Best regards,
Jacek Anaszewski
