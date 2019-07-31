Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AB5F67CD12
	for <lists+linux-leds@lfdr.de>; Wed, 31 Jul 2019 21:45:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729114AbfGaTpL (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 31 Jul 2019 15:45:11 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:34846 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727482AbfGaTpL (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 31 Jul 2019 15:45:11 -0400
Received: by mail-wm1-f65.google.com with SMTP id l2so60860933wmg.0;
        Wed, 31 Jul 2019 12:45:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=2vj845PATR3U2GKiFhpYXnxxTMS+21FVTJtitvMqLIw=;
        b=i8oSTVKKjR7fcOvQzMQ+zjdCRhytFyTAVKzdWrcYXkNfRM9xY7rHIL1Mz8FeYUQKJ6
         kEsmlhVQW10Wc0L9K9AMfy8C6QF0R4h4fmOTdIJ261KPDLEgJg6avcMlFxjK0NDliO+0
         tOC6OE4TrVXu8KW1ptmWh3c8nAiu0OKmg+W1w3AjU5pbp7nB28tCHhQc0FLyfAAORUN8
         6E9IsN68OVooRAI7Tp2jrYWTRRkNoezZUchMxAz3YZNjAphSrCR1JjyRDU3+4FnI91L4
         TzM0eQhmrqUrsM0IkiIAdXhBOxWZXnL1FdPCz+hHrVOghsj3IrsVcnRopvjXh11bT/5f
         Mh1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=2vj845PATR3U2GKiFhpYXnxxTMS+21FVTJtitvMqLIw=;
        b=RgMnbBcUmakKI3CTnO7r/eTAzq6210xwNaOCrxHvVCcsLn6gBMCBY+1HPzH88eBU2+
         lmE3jHSQbXU0HZK1M9SNbuL1AZx4R8pdfqxNWO8Y+F99FFA5GapbMr9PmOnqresMGND0
         BtbQV6SR7cFHDP1V+HrvvZLeaMG2Iqa/0KQ58v1UoRz+/c3HVJ6/u+xwnnKobTylfpKK
         ce1ybai594uJu+cRymgFPTyrfMaTR0wV4gSN4FBXZNeX+2qFAZt05RTqq/WOEBLdvYSn
         rpO/9QdP10yLly+96kx/SEPj2q96TDFKdbrj9kWRumkoiP577juTulpp4EkTMRLXwovL
         q2CQ==
X-Gm-Message-State: APjAAAWVr6KYmvGfkPfkcE6r8FXWUUE2/cug0cHK7VZI6/bYserDgxQZ
        6VISY3IGYYVQaq3GfOjS6PBYZpr4
X-Google-Smtp-Source: APXvYqxrMFp9EiDTE2MKIcekt460RAwTwmYggOjOkw31kW+XagszfRe+3Wv+e/rSjVm7P1OLsVDA5g==
X-Received: by 2002:a7b:cc81:: with SMTP id p1mr107611629wma.107.1564602307751;
        Wed, 31 Jul 2019 12:45:07 -0700 (PDT)
Received: from [192.168.1.19] (ciu68.neoplus.adsl.tpnet.pl. [83.31.44.68])
        by smtp.gmail.com with ESMTPSA id o20sm175015184wrh.8.2019.07.31.12.45.06
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 31 Jul 2019 12:45:07 -0700 (PDT)
Subject: Re: [PATCH v4 9/9] leds: Update the lp55xx to use the multi color
 framework
To:     Dan Murphy <dmurphy@ti.com>, pavel@ucw.cz
Cc:     linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20190725182818.29556-1-dmurphy@ti.com>
 <20190725182818.29556-10-dmurphy@ti.com>
 <fe3bbfbe-5b15-d87a-f4a1-28167081046b@gmail.com>
 <486308e9-e3e1-5f34-5af7-217527f2f1f9@ti.com>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=jacek.anaszewski@gmail.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <310ce737-df38-766c-b24a-17c26c5f9ab6@gmail.com>
Date:   Wed, 31 Jul 2019 21:45:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <486308e9-e3e1-5f34-5af7-217527f2f1f9@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Dan,

On 7/31/19 8:55 PM, Dan Murphy wrote:
> Jacek
> 
> Thanks for looking

You're welcome.

> On 7/31/19 1:45 PM, Jacek Anaszewski wrote:
>> Hi Dan,
>>
>> Thank you for the patch. My comments are below.
>>
>> On 7/25/19 8:28 PM, Dan Murphy wrote:
>>> Update the lp5523 to use the multi color framework.
>>>
>>> Signed-off-by: Dan Murphy <dmurphy@ti.com>
>>> ---
>>>   drivers/leds/leds-lp5523.c                |  13 ++
>>>   drivers/leds/leds-lp55xx-common.c         | 153 ++++++++++++++++++----
>>>   drivers/leds/leds-lp55xx-common.h         |  10 ++
>>>   include/linux/platform_data/leds-lp55xx.h |   6 +
>>>   modules.builtin.modinfo                   | Bin 0 -> 43550 bytes
>>>   5 files changed, 159 insertions(+), 23 deletions(-)
>>>   create mode 100644 modules.builtin.modinfo
>>>
>>> diff --git a/drivers/leds/leds-lp5523.c b/drivers/leds/leds-lp5523.c
>>> index d0b931a136b9..45380b32563f 100644
>>> --- a/drivers/leds/leds-lp5523.c
>>> +++ b/drivers/leds/leds-lp5523.c
[...]
> 
>>> +            if (ret)
>>> +                break;
>>> +        }
>>> +    } else {
>>> +        led->brightness = (u8)brightness;
>> What benefit stems actually from having the copy of brightness
>> in struct lp55xx_led, when we already have struct led_classdev
>> there? I know that this is pre-existing, but could be optimized away
>> while at it. We can have local u8 variable in the op setting brightness
>> and cast enum_led_brightness to it before passing to lp55xx_write().
>>
> This was a carry over from the original driver.  Ln 140.
> 
> I am not looking to change existing code functionality.
> 
> First pass was just to introduce mc_fw with no disruption or regression
> 
> to the base functionality.

Sure thing. Just wanted to mention that for a record.

[...]
>>>   -    led->cdev.brightness_set_blocking = lp55xx_set_brightness;
>>> -    led->cdev.groups = lp55xx_led_groups;
>>> -
>>> -    if (pdata->led_config[chan].name) {
>>> -        led->cdev.name = pdata->led_config[chan].name;
>>> -    } else {
>>> -        snprintf(name, sizeof(name), "%s:channel%d",
>>> -            pdata->label ? : chip->cl->name, chan);
>>> -        led->cdev.name = name;
>>> -    }
>>> +    if (pdata->led_config[chan].num_colors > 1)
>>> +        ret = led_classdev_multicolor_register(dev, &led->mc_cdev);
>>> +    else
>>> +        ret = led_classdev_register(dev, &led->cdev);
>> Why not devm ?
> 
> I will call the devm_ for multicolor but conversion for not MC should be
> done separately
> 
> Again not trying to regress original functionality.

Then it's better to switch to devm later. Only then it will
allow to optimize the error paths.

>>> -    ret = led_classdev_register(dev, &led->cdev);
>>>       if (ret) {
>>>           dev_err(dev, "led register err: %d\n", ret);
>>>           return ret;
>>> @@ -466,7 +526,6 @@ int lp55xx_register_leds(struct lp55xx_led *led,
>>> struct lp55xx_chip *chip)
>>>           dev_err(&chip->cl->dev, "empty brightness configuration\n");
>>>           return -EINVAL;
>>>       }
>>> -
>>>       for (i = 0; i < num_channels; i++) {
>>>             /* do not initialize channels that are not connected */
>>> @@ -538,6 +597,39 @@ void lp55xx_unregister_sysfs(struct lp55xx_chip
>>> *chip)
>>>   }
>>>   EXPORT_SYMBOL_GPL(lp55xx_unregister_sysfs);
>>>   +static int lp5xx_parse_channel_child(struct device_node *np,
>>> +                     struct lp55xx_led_config *cfg,
>>> +                     int chan_num)
>>> +{
>>> +    struct device_node *child;
>>> +    int num_colors = 0;
>>> +    u32 color_id;
>>> +    u32 led_number;
>>> +    int ret;
>>> +
>>> +    cfg[chan_num].default_trigger =
>>> +            of_get_property(np, "linux,default-trigger", NULL);
>>> +
>>> +    for_each_child_of_node(np, child) {
>>> +        of_property_read_string(child, "chan-name",
>>> +                    &cfg[chan_num].name);
>>> +        of_property_read_u8(child, "led-cur",
>>> +                    &cfg[chan_num].led_current);
>>> +        of_property_read_u8(child, "max-cur",
>>> +                    &cfg[chan_num].max_current);
>>> +        of_property_read_u32(child, "color", &color_id);
>>> +        cfg[chan_num].channel_color[num_colors] = color_id;
>>> +        cfg[chan_num].available_colors |= 1 << color_id;
>> set_bit(color_id, &cfg[chan_num].available_colors);
> 
> Ack
> 
> 
>>
>>> +        ret = of_property_read_u32(child, "reg", &led_number);
>>> +        cfg[chan_num].grouped_channels[num_colors] = led_number;
>>> +        num_colors++;
>>> +    }
>>> +
>>> +    cfg->num_colors = num_colors;
>>> +
>>> +    return 0;
>>> +}
>>> +
>>>   struct lp55xx_platform_data *lp55xx_of_populate_pdata(struct device
>>> *dev,
>>>                                 struct device_node *np)
>>>   {
>>> @@ -545,6 +637,8 @@ struct lp55xx_platform_data
>>> *lp55xx_of_populate_pdata(struct device *dev,
>>>       struct lp55xx_platform_data *pdata;
>>>       struct lp55xx_led_config *cfg;
>>>       int num_channels;
>>> +    int num_chan_children;
>>> +    u32 led_number;
>>>       int i = 0;
>>>         pdata = devm_kzalloc(dev, sizeof(*pdata), GFP_KERNEL);
>>> @@ -565,13 +659,26 @@ struct lp55xx_platform_data
>>> *lp55xx_of_populate_pdata(struct device *dev,
>>>       pdata->num_channels = num_channels;
>>>         for_each_child_of_node(np, child) {
>>> -        cfg[i].chan_nr = i;
>>> -
>>> -        of_property_read_string(child, "chan-name", &cfg[i].name);
>>> -        of_property_read_u8(child, "led-cur", &cfg[i].led_current);
>>> -        of_property_read_u8(child, "max-cur", &cfg[i].max_current);
>>> -        cfg[i].default_trigger =
>>> -            of_get_property(child, "linux,default-trigger", NULL);
>>> +        num_chan_children = of_get_child_count(child);
>>> +        if (num_chan_children != 0)
>> You're already parsing color. If it is present and equals
>> LED_COLOR_ID_MULTI then we should expect children in the node.
> 
> I don't see any parsing for color here but I suppose that I can add that
> now

I thought about that occurrence in lp5xx_parse_channel_child().

[...]

-- 
Best regards,
Jacek Anaszewski
