Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7D6E53A567
	for <lists+linux-leds@lfdr.de>; Sun,  9 Jun 2019 14:23:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728445AbfFIMXW (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 9 Jun 2019 08:23:22 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:41750 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726874AbfFIMXW (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 9 Jun 2019 08:23:22 -0400
Received: by mail-wr1-f67.google.com with SMTP id c2so6397765wrm.8;
        Sun, 09 Jun 2019 05:23:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=E/gSmhj2u4YOk6bQo10OCCYptqTX59f5ZrcJ7DXFY5s=;
        b=XpgqsluWAMv2F5Oivz2rPwORfT9XUJMD/M1VxE1HQDwZ1grd4IoM10N6wlJvtyuDQ0
         fz70FGO0f9FIWwZLskTS353DDOOR9NSMsO3Dh+l9z68TrjvNha1YoCe12bONvCwsOqlX
         YCJJQxr+NYHFvZrjI8w7gTBDyVqL9m/uoSVINyVjUZQJiw1rYWtCP1hD+ChAYd8bgyB7
         D+aQgEaEum9pAReuV9zXSAr1KeMOuUGyP1PKjNIJdYHoBgvMGUbtq5CAU90Au2hCPwdk
         EwLY4aEMb69zeGluIhGHZo84HRuU0tQS00RtbMdfx3I4FQMadm+pvLtQSvosSnUyK5p3
         A6tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=E/gSmhj2u4YOk6bQo10OCCYptqTX59f5ZrcJ7DXFY5s=;
        b=pw3uvpNqj5RmB89SoeaZ8TrJNIzp7GaFDilRnctKBTnqC3qk3jZp7Z9KDNR/G43grW
         JAOprRV/dIgmd6AXFIbzheDVq4Xt45smhQHA7GpLEymikKLISbXbL8iaeH0DRUn2GlqY
         FJv543Ee0GWjf5iedhidVYOjz/UcrGnMqXaRap/U3CW/MtIfGxPP1JHHwk1L2JMpm1U1
         mko1BLXw97rBEnYUHHzDV29ZMAZ1u+I4CDagsS9NW0nNh1Q9oi0Zt5xz4PUN/pX6nCr7
         aFRMcB0CO5uQ+xukas/bZ1loEYgvZXgOA0nVtLSIgdcA0bt0I1EfX9QafXWrRr3M6GXA
         7i6A==
X-Gm-Message-State: APjAAAVf7cjMWkFRARaKi7x3q26Wu3BWjY2qOKsceiybprNdaOOaTEqq
        MDo5pDvtEwUX9EfBsx3dWwlq4Dgj
X-Google-Smtp-Source: APXvYqydR0RqjV0FSNaSsJHOLKLKHMC9tJMBtfmaEj9UQflpoikZAS1UblQEEQOLW2wMse9O2hJp+A==
X-Received: by 2002:a5d:5448:: with SMTP id w8mr7934698wrv.180.1560083000495;
        Sun, 09 Jun 2019 05:23:20 -0700 (PDT)
Received: from [192.168.1.17] (bkq78.neoplus.adsl.tpnet.pl. [83.28.184.78])
        by smtp.gmail.com with ESMTPSA id s63sm8087205wme.17.2019.06.09.05.23.19
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 09 Jun 2019 05:23:19 -0700 (PDT)
Subject: Re: [PATCH v2 1/2] dt-bindings: Add docs for EL15203000
To:     Oleh Kravchenko <oleg@kaa.org.ua>, Dan Murphy <dmurphy@ti.com>,
        devicetree@vger.kernel.org, linux-leds@vger.kernel.org
References: <20190607184022.13793-1-oleg@kaa.org.ua>
 <b1f0eaf6-e91c-2095-5928-179ad8695b33@ti.com>
 <27c0b356-8111-6b36-23cc-8e654147178f@kaa.org.ua>
 <b6a5cc5e-74f1-d328-7a47-995670ba7aa7@ti.com>
 <adf5a755-c534-64c3-6e99-ba39ffea95e2@kaa.org.ua>
 <2eba86cb-01be-c002-32d0-80ab2ab14f97@gmail.com>
 <7e787498-537b-390d-589a-577f34ffbc3f@kaa.org.ua>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <44b77942-232d-4b23-1da9-f59644492d74@gmail.com>
Date:   Sun, 9 Jun 2019 14:23:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <7e787498-537b-390d-589a-577f34ffbc3f@kaa.org.ua>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Oleh,

On 6/7/19 11:48 PM, Oleh Kravchenko wrote:
> Jacek,
> 
> 08.06.19 00:23, Jacek Anaszewski пише:
>> Hi Oleh.
>>
>> On 6/7/19 11:17 PM, Oleh Kravchenko wrote:
>>> Dan,
>>>
>>> On 08.06.19 00:04, Dan Murphy wrote:
>>>> Oleh
>>>> But this is not really max_brightness now this is a feature and now
>>>> does not make sense in this context
>>>>>>
>>>>>> You may need to use something different for this property or expose
>>>>>> a file in the driver.
>>>>>>
>>>>>>
>>>>> Protocol for this board define 0x32 as brightness level.
>>>>> This behaviur needed to keep backward compatibity.
>>>>>
>>>>>
>>>> Backwards compatibility to what?
>>> With old/new boards.
>>
>> You have in your driver the following:
>>
>> + * BRIGHTNESS    Can be 0x30 (OFF), 0x31 (ON).
>> + *         0x32 (Effect) can be used for 0x50 (leaking) and
>> + *         for 0x53 (blinking)
>>
>> If your max-brightness DT property is to be used for controlling this,
>> then I don't see how it would be backward compatible with anything.
>>
>> Clearly, you don't need max-brightness DT property at all.
> 
> What I should do with board which accept brightness in range 0x30 - 0x3a?
> Where 0x3a means special effect.

I believe 0x3a is a typo since above you have 0x32 for the effect.

Anyway, we shouldn't propagate hardware design flaws to the userspace
interface. You have ON/OFF register values for manipulating brightness,
so use them appropriately. struct led_classdev's max_brightness property
should be set to 1, as already pointed out by Dan.

>> For blinking you can use blink_set op. To be able to recommend
>> you anoptimal solution for the effect we would need more
>> details regarding its nature.
> 
> Thanks, I will do that.
> But how to properly handle other effects? Not only blinking?

For the effects we could probably use pattern trigger, but we need
more information on how it can be configured.

> And how to define it by device tree?
> Driver can't get this information about what is really supported.
> I don't want define effect code inside DT.

We now have led-pattern DT property, which allows to initialize a LED
with the DT provided pattern
(see Documentation/devicetree/bindings/leds/common.txt).

>>>> This is a new driver there should be no DT that has this compatible or
>>>> definition.
>>>>
>>>> I will let Rob ack or nack this node.
>>>>
>>>> Dan
>>>>
>>>
>>>
>>
> 

-- 
Best regards,
Jacek Anaszewski
