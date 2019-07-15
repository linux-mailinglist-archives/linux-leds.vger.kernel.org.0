Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 10A3F68698
	for <lists+linux-leds@lfdr.de>; Mon, 15 Jul 2019 11:47:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729451AbfGOJrW (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 15 Jul 2019 05:47:22 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:36518 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729257AbfGOJrW (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 15 Jul 2019 05:47:22 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x6F9lBqe048982;
        Mon, 15 Jul 2019 04:47:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1563184031;
        bh=nsCbN9LXGkKl6cl+W3My4orVJKZBkvB5Iek+7zc89LA=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=soc+XYqrX6ZDIKzfnSbvExtZOfcT288ctZa2p4cB52aKsyU1yyucH/13+h7UcHZe8
         H+UKU6hm+R1aG7rmRfxojjpC3ehzxg33cu6PRUU8EUz2LsfE6SXLnG9+euIPhISfws
         hDmswrrwMsitV6kCa6H0C9UDrzsWcLE+U1LVFwzU=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x6F9lBnw105365
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 15 Jul 2019 04:47:11 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 15
 Jul 2019 04:47:10 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 15 Jul 2019 04:47:10 -0500
Received: from [10.250.97.31] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x6F9l8Uc080072;
        Mon, 15 Jul 2019 04:47:09 -0500
Subject: Re: [PATCH 1/2] leds: Add control of the voltage/current regulator to
 the LED core
To:     Daniel Thompson <daniel.thompson@linaro.org>
CC:     Dan Murphy <dmurphy@ti.com>, <jacek.anaszewski@gmail.com>,
        <pavel@ucw.cz>, <robh+dt@kernel.org>, <mark.rutland@arm.com>,
        <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>
References: <20190708103547.23528-1-jjhiblot@ti.com>
 <20190708103547.23528-2-jjhiblot@ti.com>
 <56d16260-ff82-3439-4c1f-2a3a1552bc7d@ti.com>
 <ab4818c0-bc7a-13e1-c6ce-e977b0234de0@ti.com>
 <20190715092400.sedjumqkecglheyu@holly.lan>
From:   Jean-Jacques Hiblot <jjhiblot@ti.com>
Message-ID: <9c53f54f-d0d4-50d4-09da-34389085269a@ti.com>
Date:   Mon, 15 Jul 2019 11:47:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190715092400.sedjumqkecglheyu@holly.lan>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


On 15/07/2019 11:24, Daniel Thompson wrote:
> On Mon, Jul 15, 2019 at 11:01:29AM +0200, Jean-Jacques Hiblot wrote:
>> Hi Dan,
>>
>> On 12/07/2019 20:49, Dan Murphy wrote:
>>> JJ
>>>
>>> On 7/8/19 5:35 AM, Jean-Jacques Hiblot wrote:
>>>> A LED is usually powered by a voltage/current regulator. Let the LED
>>>> core
>>> Let the LED core know
>>>> about it. This allows the LED core to turn on or off the power supply
>>>> as needed.
>>>> Signed-off-by: Jean-Jacques Hiblot <jjhiblot@ti.com>
>>>> ---
>>>>    drivers/leds/led-class.c | 10 ++++++++
>>>>    drivers/leds/led-core.c  | 53 +++++++++++++++++++++++++++++++++++++---
>>>>    include/linux/leds.h     |  4 +++
>>>>    3 files changed, 64 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
>>>> index 4793e77808e2..e01b2d982564 100644
>>>> --- a/drivers/leds/led-class.c
>>>> +++ b/drivers/leds/led-class.c
>>>> @@ -17,6 +17,7 @@
>>>>    #include <linux/slab.h>
>>>>    #include <linux/spinlock.h>
>>>>    #include <linux/timer.h>
>>>> +#include <linux/regulator/consumer.h>
>>> What if you move this to leds.h so core and class can both include it.
>>>
>>>
>>>>    #include <uapi/linux/uleds.h>
>>>>    #include "leds.h"
>>>>    @@ -272,6 +273,15 @@ int of_led_classdev_register(struct device
>>>> *parent, struct device_node *np,
>>>>            dev_warn(parent, "Led %s renamed to %s due to name collision",
>>>>                    led_cdev->name, dev_name(led_cdev->dev));
>>>>    +    led_cdev->regulator = devm_regulator_get(led_cdev->dev, "power");
>>> Is the regulator always going to be called power?
>> Actually in the dts, that will be "power-supply". I lacked the imagination
>> to come up with a better name.
>>
>>
>>
>>>> +    if (IS_ERR(led_cdev->regulator)) {
>>>> +        dev_err(led_cdev->dev, "Cannot get the power supply for %s\n",
>>>> +            led_cdev->name);
>>>> +        device_unregister(led_cdev->dev);
>>>> +        mutex_unlock(&led_cdev->led_access);
>>>> +        return PTR_ERR(led_cdev->regulator);
>>> This is listed as optional in the DT doc.  This appears to be required.
>> The regulator core will provide a dummy regulator if none is given in the
>> device tree. I would rather have an error in that case, but that is not how
>> it works.
> If you actively wanted to get -ENODEV back when there is no regulator
> then you can use devm_regulator_get_optional() for that.
>
> However perhaps be careful what you wish for. If you use get_optional()
> then you will have to sprinkle NULL or IS_ERR() checks everywhere. I'd
> favour using the current approach!

Thanks for the info. I think I'll use the get_optionnal(). That will add 
a bit of complexity, but it will avoid deferring some work in 
led_set_brightness_nopm() when it is not needed.

JJ

>
>
> Daniel.
>
>>
>>> I prefer to keep it optional.  Many LED drivers are connected to fixed
>>> non-managed supplies.
>>>
>>>> +    }
>>>> +
>>>>        if (led_cdev->flags & LED_BRIGHT_HW_CHANGED) {
>>>>            ret = led_add_brightness_hw_changed(led_cdev);
>>>>            if (ret) {
>>>> diff --git a/drivers/leds/led-core.c b/drivers/leds/led-core.c
>>>> index 7107cd7e87cf..139de6b08cad 100644
>>>> --- a/drivers/leds/led-core.c
>>>> +++ b/drivers/leds/led-core.c
>>>> @@ -16,6 +16,7 @@
>>>>    #include <linux/rwsem.h>
>>>>    #include <linux/slab.h>
>>>>    #include "leds.h"
>>>> +#include <linux/regulator/consumer.h>
>>>>      DECLARE_RWSEM(leds_list_lock);
>>>>    EXPORT_SYMBOL_GPL(leds_list_lock);
>>>> @@ -23,6 +24,31 @@ EXPORT_SYMBOL_GPL(leds_list_lock);
>>>>    LIST_HEAD(leds_list);
>>>>    EXPORT_SYMBOL_GPL(leds_list);
>>>>    +static bool __led_need_regulator_update(struct led_classdev
>>>> *led_cdev,
>>>> +                    int brightness)
>>>> +{
>>>> +    bool new_regulator_state = (brightness != LED_OFF);
>>>> +
>>>> +    return led_cdev->regulator_state != new_regulator_state;
>>>> +}
>>>> +
>>>> +static int __led_handle_regulator(struct led_classdev *led_cdev,
>>>> +                int brightness)
>>>> +{
>>>> +    if (__led_need_regulator_update(led_cdev, brightness)) {
>>>> +        int ret;
>>> Prefer to this to be moved up.
>> ok
>>>> +
>>>> +        if (brightness != LED_OFF)
>>>> +            ret = regulator_enable(led_cdev->regulator);
>>>> +        else
>>>> +            ret = regulator_disable(led_cdev->regulator);
>>>> +        if (ret)
>>>> +            return ret;
>>> new line
>>>> +        led_cdev->regulator_state = (brightness != LED_OFF);
>>>> +    }
>>>> +    return 0;
>>>> +}
>>>> +
>>>>    static int __led_set_brightness(struct led_classdev *led_cdev,
>>>>                    enum led_brightness value)
>>>>    {
>>>> @@ -80,6 +106,7 @@ static void led_timer_function(struct timer_list *t)
>>>>        }
>>>>          led_set_brightness_nosleep(led_cdev, brightness);
>>>> +    __led_handle_regulator(led_cdev, brightness);
>>> Again this seems to indicate that the regulator is a required property
>>> for the LEDs
>>>
>>> This needs to be made optional.  And the same comment through out for
>>> every call.
>>>
>>>
>>>>          /* Return in next iteration if led is in one-shot mode and
>>>> we are in
>>>>         * the final blink state so that the led is toggled each
>>>> delay_on +
>>>> @@ -115,6 +142,8 @@ static void set_brightness_delayed(struct
>>>> work_struct *ws)
>>>>        if (ret == -ENOTSUPP)
>>>>            ret = __led_set_brightness_blocking(led_cdev,
>>>>                        led_cdev->delayed_set_value);
>>>> +    __led_handle_regulator(led_cdev, led_cdev->delayed_set_value);
>>>> +
>>>>        if (ret < 0 &&
>>>>            /* LED HW might have been unplugged, therefore don't warn */
>>>>            !(ret == -ENODEV && (led_cdev->flags & LED_UNREGISTERING) &&
>>>> @@ -141,6 +170,7 @@ static void led_set_software_blink(struct
>>>> led_classdev *led_cdev,
>>>>        /* never on - just set to off */
>>>>        if (!delay_on) {
>>>>            led_set_brightness_nosleep(led_cdev, LED_OFF);
>>>> +        __led_handle_regulator(led_cdev, LED_OFF);
>>>>            return;
>>>>        }
>>>>    @@ -148,6 +178,7 @@ static void led_set_software_blink(struct
>>>> led_classdev *led_cdev,
>>>>        if (!delay_off) {
>>>>            led_set_brightness_nosleep(led_cdev,
>>>>                           led_cdev->blink_brightness);
>>>> +        __led_handle_regulator(led_cdev, led_cdev->blink_brightness);
>>>>            return;
>>>>        }
>>>>    @@ -256,8 +287,14 @@ void led_set_brightness_nopm(struct
>>>> led_classdev *led_cdev,
>>>>                      enum led_brightness value)
>>>>    {
>>>>        /* Use brightness_set op if available, it is guaranteed not to
>>>> sleep */
>>>> -    if (!__led_set_brightness(led_cdev, value))
>>>> -        return;
>>>> +    if (!__led_set_brightness(led_cdev, value)) {
>>>> +        /*
>>>> +         * if regulator state doesn't need to be changed, that is all/
>>>> +         * Otherwise delegate the change to a work queue
>>>> +         */
>>>> +        if (!__led_need_regulator_update(led_cdev, value))
>>>> +            return;
>>>> +    }
>>>>          /* If brightness setting can sleep, delegate it to a work
>>>> queue task */
>>>>        led_cdev->delayed_set_value = value;
>>>> @@ -280,6 +317,8 @@ EXPORT_SYMBOL_GPL(led_set_brightness_nosleep);
>>>>    int led_set_brightness_sync(struct led_classdev *led_cdev,
>>>>                    enum led_brightness value)
>>>>    {
>>>> +    int ret;
>>>> +
>>>>        if (led_cdev->blink_delay_on || led_cdev->blink_delay_off)
>>>>            return -EBUSY;
>>>>    @@ -288,7 +327,15 @@ int led_set_brightness_sync(struct
>>>> led_classdev *led_cdev,
>>>>        if (led_cdev->flags & LED_SUSPENDED)
>>>>            return 0;
>>>>    -    return __led_set_brightness_blocking(led_cdev,
>>>> led_cdev->brightness);
>>>> +    ret = __led_set_brightness_blocking(led_cdev,
>>>> led_cdev->brightness);
>>>> +    if (ret)
>>>> +        return ret;
>>>> +
>>>> +    ret = __led_handle_regulator(led_cdev, led_cdev->brightness);
>>> Can't you just return here?
>> ok
>>
>>
>> thanks for the review
>>
>> JJ
>>
>>> Dan
>>>
>>>> +    if (ret)
>>>> +        return ret;
>>>> +
>>>> +    return 0;
>>>>    }
>>>>    EXPORT_SYMBOL_GPL(led_set_brightness_sync);
>>>>    diff --git a/include/linux/leds.h b/include/linux/leds.h
>>>> index 9b2bf574a17a..bee8e3f8dddd 100644
>>>> --- a/include/linux/leds.h
>>>> +++ b/include/linux/leds.h
>>>> @@ -123,6 +123,10 @@ struct led_classdev {
>>>>          /* Ensures consistent access to the LED Flash Class device */
>>>>        struct mutex        led_access;
>>>> +
>>>> +    /* regulator */
>>>> +    struct regulator    *regulator;
>>>> +    bool            regulator_state;
>>>>    };
>>>>      extern int of_led_classdev_register(struct device *parent,
