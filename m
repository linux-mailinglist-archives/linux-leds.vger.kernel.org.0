Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D4A28BBD86
	for <lists+linux-leds@lfdr.de>; Mon, 23 Sep 2019 23:03:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388089AbfIWVDr (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 23 Sep 2019 17:03:47 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:37869 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387617AbfIWVDq (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 23 Sep 2019 17:03:46 -0400
Received: by mail-wr1-f66.google.com with SMTP id i1so15508198wro.4;
        Mon, 23 Sep 2019 14:03:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=fVe2WkRSC+/JEESDxzcblBv1KaMd9haF8Fwrq2sZu/o=;
        b=GnSvtobcMbJX4lBtD8JZWrUcA7WBIfrM5jqg5R4a4k72bLwWPPe4TRdUrU1zAFNJ9H
         HTFJEndLAL+QH3yne2LlAP7L4ATR3vrvkWvI/5A2pKqbs0u9ZuZFSmRfYt9uRoVOkR0/
         ZLmEOCRq0ZDysZCi2+4cdg0IYBDzkL2kKpYaR2O7xaVSa77xfk3ka0EAzTQpHHxW1Bsf
         7V+UtSKRT+U6tsMDAoudHFp/lO/51TSrcrGl9rls8bYB+6tgYc/lDYu9vr9dgSsuEjMr
         BE0KbdhxapmcAGbikwNL8Jm2tTSVrea+CuITaNysGDAkshtL1Hi3z4SeSwbXunXUXVw3
         brUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=fVe2WkRSC+/JEESDxzcblBv1KaMd9haF8Fwrq2sZu/o=;
        b=Yrhq0utb4dcvMYz8I+5hkm4Ei8zcDc6cXOueEDFgo93pprK0HJ9uqij7IwTnn3+TkE
         siIyzhyl2P948RBMFpOBS87Gzmqi1Y8xsVryE1Ltwinh21IC95qx7J53h+DoPax2RqXY
         pvtNa0H50b3RdeGSyYU1I2Fjz4fJNpHDV8Ccuk1nPq3s3y6eSzeQWe6D2b4d69M2/oa4
         coKzmad0Wh4JPdQoJetQfPyQFPoNdmX+K/qPOtoK3jDQUimDZfXClm7ZToHbxuDDdEyq
         Zij2o3JbhWNd6rzTTXITjvso1bkt5Yj/sB/+xCx+KMxoXi0/MJe6jseaCCM9TC3k8Bdj
         x09w==
X-Gm-Message-State: APjAAAXT3KcECrKXH7dXvrG3yrHhA0CxQthTO/hTY+DsqlWvz9T+OZPE
        p2gikMcCezGOcy7rzaEiohM=
X-Google-Smtp-Source: APXvYqzJD3D5MvfXMaFrP+5zOCfamlXds4X7mCYDilCd5gtE7S9tRSaEm4azH/oa8Ydd2R0hlZ+H7w==
X-Received: by 2002:a05:6000:108e:: with SMTP id y14mr917888wrw.344.1569272623547;
        Mon, 23 Sep 2019 14:03:43 -0700 (PDT)
Received: from [192.168.1.19] (bdr247.neoplus.adsl.tpnet.pl. [83.28.3.247])
        by smtp.gmail.com with ESMTPSA id y186sm26130778wmb.41.2019.09.23.14.03.41
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 23 Sep 2019 14:03:42 -0700 (PDT)
Subject: Re: [PATCH v4 1/3] led: make led_set_brightness_sync() use
 led_set_brightness_nosleep()
To:     Jean-Jacques Hiblot <jjhiblot@ti.com>, pavel@ucw.cz,
        daniel.thompson@linaro.org
Cc:     linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        dmurphy@ti.com, tomi.valkeinen@ti.com
References: <20190920122525.15712-1-jjhiblot@ti.com>
 <20190920122525.15712-2-jjhiblot@ti.com>
 <c8519e2f-9d46-e164-04d0-42cc5834042a@gmail.com>
 <2172e1c7-931e-d510-648b-80ef9c606ab6@ti.com>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=jacek.anaszewski@gmail.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <2de8d45c-dc0f-90d2-ed8d-96494a6386c1@gmail.com>
Date:   Mon, 23 Sep 2019 23:03:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <2172e1c7-931e-d510-648b-80ef9c606ab6@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Jean,

On 9/23/19 11:14 AM, Jean-Jacques Hiblot wrote:
> Hi Jacek,
> 
> On 20/09/2019 23:10, Jacek Anaszewski wrote:
>> Hi Jean,
>>
>> On 9/20/19 2:25 PM, Jean-Jacques Hiblot wrote:
>>> Making led_set_brightness_sync() use led_set_brightness_nosleep() has 2
>>> advantages:
>>> - works for LED controllers that do not provide
>>> brightness_set_blocking()
>>> - When the blocking callback is used, it uses the workqueue to update
>>> the
>>>    LED state, removing the need for mutual exclusion between
>>>    led_set_brightness_sync() and set_brightness_delayed().
>> And third:
>>
>> - it compromises the "sync" part of the function name :-)
> 
> Making it sync is the role of the flush_work() function. It waits until
> the deferred work has been done.

The thing is not in the blocking character of the function, but rather
in the fastest possible way of setting torch brightness.
led_set_brightness_nosleep() will defer brightness_set_blocking op
to the workqueue so this condition will not be met then.

This function was added specifically for LED class flash v4l2 wrapper:
drivers/media/v4l2-core/v4l2-flash-led-class.c.

It may need an addition of support for brightness_set only drivers,
but we haven't had a use case so far, since all client flash LED
controllers are driven via blocking buses (there are not many of them).

Also, when LED flash class (and thus LED class also as a parent)
is hijacked by v4l2-flash-led wrapper, its sysfs is disabled,
so it is not possible to set e.g. timer trigger which could
interfere with the led_set_brightness_sync() (and it also returns
-EBUSY when blinking is enabled).

>> This function has been introduced specifically to be blocking
>> and have the immediate effect. Its sole client is
>> drivers/media/v4l2-core/v4l2-flash-led-class.c.
>>
>>> Signed-off-by: Jean-Jacques Hiblot <jjhiblot@ti.com>
>>> ---
>>>   drivers/leds/led-core.c | 12 +++++++-----
>>>   1 file changed, 7 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/drivers/leds/led-core.c b/drivers/leds/led-core.c
>>> index f1f718dbe0f8..50e28a8f9357 100644
>>> --- a/drivers/leds/led-core.c
>>> +++ b/drivers/leds/led-core.c
>>> @@ -294,15 +294,17 @@ EXPORT_SYMBOL_GPL(led_set_brightness_nosleep);
>>>   int led_set_brightness_sync(struct led_classdev *led_cdev,
>>>                   enum led_brightness value)
>>>   {
>>> +    int ret;
>>> +
>>>       if (led_cdev->blink_delay_on || led_cdev->blink_delay_off)
>>>           return -EBUSY;
>>>   -    led_cdev->brightness = min(value, led_cdev->max_brightness);
>>> -
>>> -    if (led_cdev->flags & LED_SUSPENDED)
>>> -        return 0;
>>> +    ret = led_set_brightness_nosleep(led_cdev, value);
>>> +    if (!ret)
>>> +        return ret;
>>>   -    return __led_set_brightness_blocking(led_cdev,
>>> led_cdev->brightness);
>>> +    flush_work(&led_cdev->set_brightness_work);
>>> +    return 0;
>>>   }
>>>   EXPORT_SYMBOL_GPL(led_set_brightness_sync);
>>>  
> 

-- 
Best regards,
Jacek Anaszewski
