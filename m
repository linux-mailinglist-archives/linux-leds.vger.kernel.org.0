Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4CC4FBC910
	for <lists+linux-leds@lfdr.de>; Tue, 24 Sep 2019 15:43:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730203AbfIXNn3 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 24 Sep 2019 09:43:29 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:58642 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727963AbfIXNn3 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 24 Sep 2019 09:43:29 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8ODhOdD022608;
        Tue, 24 Sep 2019 08:43:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1569332604;
        bh=MGPyYnOE9iJUG1lF+FjK3DuaMzMR8PthtlnbMzCnkWY=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=SGnBwd7KtaGNMfFGxoEmchvTacVbzL/kamdKhN6Yg5WQd7ooVcRaU2xlUoOyb+6xR
         2BvhtgzKKJIBwF/QRSKM/dE0xUcbktVNPRwTMaswkDBIXbLPxEA9OayigmHBfOOGbH
         Ky0f59PhYft4z5egXRRPwCeTQAVFiXC4XYKX2N4M=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8ODhO5W005401
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 24 Sep 2019 08:43:24 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 24
 Sep 2019 08:43:17 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 24 Sep 2019 08:43:17 -0500
Received: from [10.250.99.146] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8ODhMOk055308;
        Tue, 24 Sep 2019 08:43:22 -0500
Subject: Re: [PATCH v4 1/3] led: make led_set_brightness_sync() use
 led_set_brightness_nosleep()
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>,
        <daniel.thompson@linaro.org>
CC:     <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <dmurphy@ti.com>, <tomi.valkeinen@ti.com>
References: <20190920122525.15712-1-jjhiblot@ti.com>
 <20190920122525.15712-2-jjhiblot@ti.com>
 <c8519e2f-9d46-e164-04d0-42cc5834042a@gmail.com>
 <2172e1c7-931e-d510-648b-80ef9c606ab6@ti.com>
 <2de8d45c-dc0f-90d2-ed8d-96494a6386c1@gmail.com>
From:   Jean-Jacques Hiblot <jjhiblot@ti.com>
Message-ID: <360f37a8-da8d-6ea9-3164-35d2289097dc@ti.com>
Date:   Tue, 24 Sep 2019 15:43:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <2de8d45c-dc0f-90d2-ed8d-96494a6386c1@gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


On 23/09/2019 23:03, Jacek Anaszewski wrote:
> Hi Jean,
>
> On 9/23/19 11:14 AM, Jean-Jacques Hiblot wrote:
>> Hi Jacek,
>>
>> On 20/09/2019 23:10, Jacek Anaszewski wrote:
>>> Hi Jean,
>>>
>>> On 9/20/19 2:25 PM, Jean-Jacques Hiblot wrote:
>>>> Making led_set_brightness_sync() use led_set_brightness_nosleep() has 2
>>>> advantages:
>>>> - works for LED controllers that do not provide
>>>> brightness_set_blocking()
>>>> - When the blocking callback is used, it uses the workqueue to update
>>>> the
>>>>     LED state, removing the need for mutual exclusion between
>>>>     led_set_brightness_sync() and set_brightness_delayed().
>>> And third:
>>>
>>> - it compromises the "sync" part of the function name :-)
>> Making it sync is the role of the flush_work() function. It waits until
>> the deferred work has been done.
> The thing is not in the blocking character of the function, but rather
> in the fastest possible way of setting torch brightness.
> led_set_brightness_nosleep() will defer brightness_set_blocking op
> to the workqueue so this condition will not be met then.

OK. I see the point there.

>
> This function was added specifically for LED class flash v4l2 wrapper:
> drivers/media/v4l2-core/v4l2-flash-led-class.c.
>
> It may need an addition of support for brightness_set only drivers,
> but we haven't had a use case so far, since all client flash LED
> controllers are driven via blocking buses (there are not many of them).
>
> Also, when LED flash class (and thus LED class also as a parent)
> is hijacked by v4l2-flash-led wrapper, its sysfs is disabled,
> so it is not possible to set e.g. timer trigger which could
> interfere with the led_set_brightness_sync() (and it also returns
> -EBUSY when blinking is enabled).

Then this is a really special use case and we don't really have to  
worry about synchronization with the other ways to set the LED 
brightness. I'll drop any change to this function then.

Thanks for the detailed explanation.

JJ


>
>>> This function has been introduced specifically to be blocking
>>> and have the immediate effect. Its sole client is
>>> drivers/media/v4l2-core/v4l2-flash-led-class.c.
>>>
>>>> Signed-off-by: Jean-Jacques Hiblot <jjhiblot@ti.com>
>>>> ---
>>>>    drivers/leds/led-core.c | 12 +++++++-----
>>>>    1 file changed, 7 insertions(+), 5 deletions(-)
>>>>
>>>> diff --git a/drivers/leds/led-core.c b/drivers/leds/led-core.c
>>>> index f1f718dbe0f8..50e28a8f9357 100644
>>>> --- a/drivers/leds/led-core.c
>>>> +++ b/drivers/leds/led-core.c
>>>> @@ -294,15 +294,17 @@ EXPORT_SYMBOL_GPL(led_set_brightness_nosleep);
>>>>    int led_set_brightness_sync(struct led_classdev *led_cdev,
>>>>                    enum led_brightness value)
>>>>    {
>>>> +    int ret;
>>>> +
>>>>        if (led_cdev->blink_delay_on || led_cdev->blink_delay_off)
>>>>            return -EBUSY;
>>>>    -    led_cdev->brightness = min(value, led_cdev->max_brightness);
>>>> -
>>>> -    if (led_cdev->flags & LED_SUSPENDED)
>>>> -        return 0;
>>>> +    ret = led_set_brightness_nosleep(led_cdev, value);
>>>> +    if (!ret)
>>>> +        return ret;
>>>>    -    return __led_set_brightness_blocking(led_cdev,
>>>> led_cdev->brightness);
>>>> +    flush_work(&led_cdev->set_brightness_work);
>>>> +    return 0;
>>>>    }
>>>>    EXPORT_SYMBOL_GPL(led_set_brightness_sync);
>>>>   
