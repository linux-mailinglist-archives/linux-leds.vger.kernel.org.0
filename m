Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A2AEA395EF
	for <lists+linux-leds@lfdr.de>; Fri,  7 Jun 2019 21:41:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730854AbfFGTld (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 7 Jun 2019 15:41:33 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:53048 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730847AbfFGTlb (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 7 Jun 2019 15:41:31 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x57JfOkl002470;
        Fri, 7 Jun 2019 14:41:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1559936484;
        bh=cR64qGFqFB2jObbBjuKardFF8J5x1PCGncTRVKn0PNE=;
        h=Subject:To:References:From:Date:In-Reply-To;
        b=xT2uf7bLlwCnbm2Xw7uoNmGN3ZBGyJyPos2kF3A4pm4SJ+xMjPg+BDkmms1QLstK3
         Wwy3RN6iB/GQc3tKW8lE4P/vsoSH8xJYswFu7zJ6XBst5fzRS9P9yyMEtVmU59IpBs
         YEsC05iAE3CFOXkC3OtpqgYPQkJTuRyWuRyGrdO8=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x57JfOBT036167
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 7 Jun 2019 14:41:24 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 7 Jun
 2019 14:41:23 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 7 Jun 2019 14:41:23 -0500
Received: from [10.250.65.13] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x57JfN3l084939;
        Fri, 7 Jun 2019 14:41:23 -0500
Subject: Re: [PATCH 2/2] leds: add LED driver for EL15203000 board
To:     Oleh Kravchenko <oleg@kaa.org.ua>, <devicetree@vger.kernel.org>,
        <linux-leds@vger.kernel.org>
References: <20190607114823.3735-1-oleg@kaa.org.ua>
 <20190607114823.3735-2-oleg@kaa.org.ua>
 <f0ec5988-77c2-b0fa-045d-ec6a7445fc48@ti.com>
 <a2382176-f4f5-b346-0b9f-bf59d047b8a6@kaa.org.ua>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <39d78c5c-01b0-23ce-6d01-d6baa7a34159@ti.com>
Date:   Fri, 7 Jun 2019 14:41:22 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <a2382176-f4f5-b346-0b9f-bf59d047b8a6@kaa.org.ua>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Oleh

On 6/7/19 12:46 PM, Oleh Kravchenko wrote:
> Hello Dan,
> thank you for your review!
>
> 07.06.19 17:59, Dan Murphy пише:
>> Oleh
>>
>> On 6/7/19 6:48 AM, Oleh Kravchenko wrote:
>>> +#include <linux/delay.h>
>>> +#include <linux/leds.h>
>>> +#include <linux/limits.h>
>> I do not see any #defines used from this file
> For U8_MAX, please see below.
>
>>> +#include <linux/module.h>
>>> +#include <linux/of_device.h>
>>> +#include <linux/spi/spi.h>
>>> +#include <linux/workqueue.h>
>> It does not look like you are using any work queues.
>   
> My bad, thank you!
>
>>> + * LED        ID, known values is 0x50 (Pipe), 0x53 (Screen Frame) and
>>> + *         0x56 (Vending Area);
>>> + * BRIGHTNESS    Can be 0x30 (OFF), 0x31 (ON).
>>> + *         0x32 (Effect) can be used for 0x50 (leaking) and
>>> + *         for 0x53 (blinking).
>>> + *
>> These can be #defined which makes them desctiptive
>>
>> #define EL15203000_LED_OFF     0x30
>>
>> #define EL15203000_LED_ON     0x31
>>
>> and so on
> Hm, but just adding 0x30 not will be more clear and faster?
> I think switch .. case or if .. else, will be more hard to read :)

Huh?

You had to explain what the value 0x3X meant in a comment.  So clarity 
is not there.  Faster?

The #define LED_?? makes sense without having to explain the protocol.  
What is 0x30?

And I am not seeing any switch..case or if..else in the code using these 
values but if it was defined it would be easier to read.

Why would this value be in a switch..case or if..else if it is just a 
protocol value?

You have 1 line of code that uses the 0x30 so maybe you don't need to 
define LED_ON and LED_OFF but this value means something

and that should be #defined as there is no understanding what the 0x30 
is actually doing.

cmd[1] =  EL15203000_LED_???? + (u8)brightness;



>>> +        if (reg > U8_MAX) {
>>> +            dev_err(priv->dev, "LED value %d is invalid", reg);
>>> +            fwnode_handle_put(child);
>>> +
>>> +            return -ENODEV;
>> -EINVAL
> Done
>
>>> +        }
>>> +        led->reg = reg;
>>> +
>>> +        ret = fwnode_property_read_string(child, "label", &str);
>>> +        if (ret)
>>> +            snprintf(led->name, sizeof(led->name),
>>> +                 "el15203000::");
>>> +        else
>>> +            snprintf(led->name, sizeof(led->name),
>>> +                 "el15203000:%s", str);
>>> +
>>> +        fwnode_property_read_string(child, "linux,default-trigger",
>>> +                        &led->ldev.default_trigger);
>>> +
>>> +        led->priv              = priv;
>>> +        led->ldev.name              = led->name;
>>> +        led->ldev.max_brightness      = LED_ON;
>> Do not need this as it should be stored when doing the fwnode read.
> This is default value 1, by dtb we can override it to 2.

This has code some other issues.  I will comment in your v2.

Dan

>>> +        led->ldev.brightness_set_blocking = el15203000_set_sync;
>>> +
>>> +        ret = fwnode_property_read_u32(child, "max-brightness",
>>> +                           &led->ldev.max_brightness);
>>> +        if (led->ldev.max_brightness > EL_MAX_BRIGHTNESS) {
>>> +            dev_err(priv->dev, "invalid max brightness %d",
>>> +                led->ldev.max_brightness);
>>> +            fwnode_handle_put(child);
>>> +
>>> +            return -ENODEV;
>> -EINVAL
> Done
>   
>>> +        ret = devm_of_led_classdev_register(priv->dev, np,
>>> +                            &led->ldev);
>> please use devm_led_classdev_register then there is no need to set np or store it.
>>
>> Dan
>>
