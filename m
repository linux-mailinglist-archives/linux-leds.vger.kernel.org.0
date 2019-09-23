Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1F79DBBE37
	for <lists+linux-leds@lfdr.de>; Tue, 24 Sep 2019 00:00:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2502548AbfIWWAD (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 23 Sep 2019 18:00:03 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:37205 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389997AbfIWWAD (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 23 Sep 2019 18:00:03 -0400
Received: by mail-wr1-f66.google.com with SMTP id i1so15625961wro.4;
        Mon, 23 Sep 2019 15:00:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=NnnDZeev726m2OmJw6ekee+oEaPokMPQdAEJQYuZ6nE=;
        b=Icoz3Q+YEJSeumSHmhXpOVM4zAWUNcbTbCmxdlSgone7+rk0VCH579nz6gkqt0MURf
         PLAHEaxi1kwnbn+umT3WWQUc8fuUbzsykw5y5DVQb+Bo2Us1m1rxcjB6bJw02UQb0zzE
         c4jtX7wu2ztz/8R8VJcnHlldS3TOjzYQsSb1Flv8M7yGo/cZxSUB5yblirdmWX4JY+2/
         vdTwOTtno4Az+hx0mi+GlxhiEz94rifJTvSOUjWRNYgPu5sRn3214GQVLjHM5OlkcOkm
         MVQ2BeRyvsAMyF7H2CfMr3a2szsRlRCUEAKpc82DSr21lExvKyZk4+ibfABmgitSrQsH
         /Xlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=NnnDZeev726m2OmJw6ekee+oEaPokMPQdAEJQYuZ6nE=;
        b=kRbHhKHHY52rbS0mEiiAr4PREXqOPC6PS9MoOPf+2JLQzx4l+tdcIe9+SwzQ1y8FjH
         Z5G51j/oIE0MjFK1/V2ZPZVekdgLaShnec+Sza+oIYx0DTYdA0h4toQMExk8Ag1HlwWF
         f3mQR3S6WJeSIxfguhFhcRntD198lRQz5A3bgRrxEezfu3OgXZbSJBr/Gmx/hyJc5rsD
         wwKDQB+NA7z1XYpZgDiZQda55vcSd+A/vYL8iFt0Uv46Kci/ziV7MqLOQyFCCAswrmYw
         caydWxk+A93gPZvn7bi3kz/1d2Imh+KW/gfjMs6NM6SuUZ/NhvG/P8VtTKiUDPJnwfJT
         EMjA==
X-Gm-Message-State: APjAAAUk6tsGv/LQa+mVRpPBX06LEBWaJ7TmdildZpKL1p1VzjOLe01k
        E+mYro9S0c/RrNf2rSEKxLPlklNI
X-Google-Smtp-Source: APXvYqyDZEenBDNPTPeZs9sTkE+UylvQPbv4d/ak9FW9dWgVfwsmrqWA3zWxzhqyCEcWfJYZAJPbtw==
X-Received: by 2002:a5d:4491:: with SMTP id j17mr967077wrq.257.1569275998947;
        Mon, 23 Sep 2019 14:59:58 -0700 (PDT)
Received: from [192.168.1.19] (bdr247.neoplus.adsl.tpnet.pl. [83.28.3.247])
        by smtp.gmail.com with ESMTPSA id t4sm7294018wrm.13.2019.09.23.14.59.57
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 23 Sep 2019 14:59:58 -0700 (PDT)
Subject: Re: [PATCH v8 8/9] leds: lp50xx: Add the LP50XX family of the RGB LED
 driver
To:     Dan Murphy <dmurphy@ti.com>, pavel@ucw.cz
Cc:     linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20190920174139.30079-1-dmurphy@ti.com>
 <20190920174139.30079-9-dmurphy@ti.com>
 <b6a09f76-3663-9bce-e009-24e31940517e@gmail.com>
 <c063774f-9397-31ae-4ca8-24d50114296e@ti.com>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=jacek.anaszewski@gmail.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <c8972136-7489-e5a1-6d25-87108806c9cc@gmail.com>
Date:   Mon, 23 Sep 2019 23:59:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <c063774f-9397-31ae-4ca8-24d50114296e@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Dan,

On 9/23/19 7:56 PM, Dan Murphy wrote:
> Jacek
> 
> On 9/21/19 10:11 AM, Jacek Anaszewski wrote:
>> Dan,
>>
>> On 9/20/19 7:41 PM, Dan Murphy wrote:
>>> Introduce the LP5036/30/24/18/12/9 RGB LED driver.
>>> The difference in these parts are the number of
>>> LED outputs where the:
>>>
>>> LP5036 can control 36 LEDs
>>> LP5030 can control 30 LEDs
>>> LP5024 can control 24 LEDs
>>> LP5018 can control 18 LEDs
>>> LP5012 can control 12 LEDs
>>> LP509 can control 9 LEDs
>>>
>>> The device has the ability to group LED output into control banks
>>> so that multiple LED banks can be controlled with the same mixing and
>>> brightness.  Inversely the LEDs can also be controlled independently.
>>>
>>> Signed-off-by: Dan Murphy<dmurphy@ti.com>
>>> ---
>>>   drivers/leds/Kconfig       |   7 +
>>>   drivers/leds/Makefile      |   1 +
>>>   drivers/leds/leds-lp50xx.c | 785 +++++++++++++++++++++++++++++++++++++
>>>   3 files changed, 793 insertions(+)
>>>   create mode 100644 drivers/leds/leds-lp50xx.c
>>>
>>> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
>>> index cfb1ebb6517f..1c0cacb100e6 100644
>>> --- a/drivers/leds/Kconfig
>>> +++ b/drivers/leds/Kconfig
>>> @@ -363,6 +363,13 @@ config LEDS_LP3952
>>>         To compile this driver as a module, choose M here: the
>>>         module will be called leds-lp3952.
>>>   +config LEDS_LP50XX
>>> +    tristate "LED Support for TI LP5036/30/24/18 LED driver chip"
>>> +    depends on LEDS_CLASS && REGMAP_I2C
>> && OF
> 
> Not sure why I would add that since we are using fw_node calls not
> of_property calls.
> 
> The fw_node calls are built in as default kernel so these should always
> be available.

Ah, right. Forget it.

[...]
>>> +static int lp50xx_brightness_set(struct led_classdev *cdev,
>>> +                 enum led_brightness brightness)
>>> +{
>>> +    struct lp50xx_led *led = container_of(cdev, struct lp50xx_led,
>>> led_dev);
>>> +    int ret = 0;
>>> +    u8 reg_val;
>>> +
>>> +    mutex_lock(&led->priv->lock);
>>> +
>>> +    if (led->ctrl_bank_enabled)
>>> +        reg_val = led->priv->chip_info->bank_brt_reg;
>>> +    else
>>> +        reg_val = led->priv->chip_info->led_brightness0_reg +
>>> +              led->led_number;
>>> +
>>> +    ret = regmap_write(led->priv->regmap, reg_val, brightness);
>>> +    if (ret)
>>> +        goto err_out;
>>> +
>>> +    ret = lp50xx_set_intensity(led);
>>> +err_out:
>>> +    mutex_unlock(&led->priv->lock);
>>> +    return ret;
>>> +}
>>> +
>>> +static enum led_brightness lp50xx_brightness_get(struct led_classdev
>>> *cdev)
>> Do we really need this op? Is it possible that the device will alter
>> brightness autonomously ? IOW can't we rely on what we've written
>> previously to the hw?
> 
> How can we be sure that the previous I/O actually wrote to the device?

brightness_set* op returned 0?

> If set_brightness fails does the LED class not modify the current
> brightness setting?

It does modify it on every brightness setting op in
led_set_brightness_nosleep().

> So we have mismatched values and with this call back we can refresh the
> right setting.
> 
> But I can remove it if you see no value in doing get_brightness call back.

If write to the device fails it signifies much more serious problem
than resulting mismatched values. Have you experienced that?

>>> +{
>>> +    struct lp50xx_led *led = container_of(cdev, struct lp50xx_led,
>>> led_dev);
>>> +    unsigned int brt_val;
>>> +    u8 reg_val;
>>> +    int ret;
>>> +
>>> +    mutex_lock(&led->priv->lock);
>>> +
>>> +    if (led->ctrl_bank_enabled)
>>> +        reg_val = led->priv->chip_info->bank_brt_reg;
>>> +    else
>>> +        reg_val = led->priv->chip_info->led_brightness0_reg +
>>> led->led_number;
>>> +
>>> +    ret = regmap_read(led->priv->regmap, reg_val, &brt_val);
>>> +
>>> +    mutex_unlock(&led->priv->lock);
>>> +
>>> +    return brt_val;
>>> +}
>>> +
>>> +static int lp50xx_set_color(struct led_classdev_mc *mcled_cdev,
>>> +                int color, int value)
>>> +{
>>> +    struct lp50xx_led *led = mcled_cdev_to_led(mcled_cdev);
>>> +
>>> +    led->led_intensity[color] = value;
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +static int lp50xx_set_banks(struct lp50xx *priv, u32 led_strings[])
>> This is a bit misleading to introduce "strings" when the function
>> claims to set "banks". Let's have the parameter name "led_banks".
> Ack
>>
>>> +{
>>> +    u8 led_ctrl_enable = 0;
>>> +    u8 led1_ctrl_enable = 0;
>>> +    u8 ctrl_ext = 0;
>> Let's have below instead of the above three variables:
>>
>>     u32 bank_enable_mask = 0;
>>     u8 led_config_lo, led_config_hi;
> 
> Ack but I have to keep the initialization to 0 as the compiler
> complained that these values may not be set.

It was because in your code values are assigned in a loop that
may or may not execute at all, depending on num_leds.
In my example variables will be assigned unconditionally
so there should be no compiler complaints.


-- 
Best regards,
Jacek Anaszewski
