Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8B1F73BB41
	for <lists+linux-leds@lfdr.de>; Mon, 10 Jun 2019 19:47:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388411AbfFJRrK (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 10 Jun 2019 13:47:10 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:39391 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387643AbfFJRrK (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 10 Jun 2019 13:47:10 -0400
Received: by mail-wm1-f67.google.com with SMTP id z23so199571wma.4
        for <linux-leds@vger.kernel.org>; Mon, 10 Jun 2019 10:47:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=3TY6bRFDr1aqeOd4FrhZzQ+JR/umDefYUaoJoaLVWwQ=;
        b=WA5NxEsN5o9kCKS5EG5kjFWkbT8EMQZ8atkrhdgmr83DCGoxRczvq2cprXly6JpCeJ
         d6TWcc10z+csJj5/sUlEsXzrzp17J7xi6m1vxQV9It9r57s9uKh5IbI5z9LGecszDsFY
         oWaUBx+HAlnauKKP5xrTAS73gGFD1XG9RDKdc+W/2GNoNkpxFw5RRE5MwTQ8iVGQfGVo
         GyaxTZnXTwJ7NwHzUIhMgNnskUGnE7xhRbFthuOTGfUts/3sVjTgRB2ii910vocDiGTc
         94ShnxQkGQno3AeIRDMZ7dIPAj0byrWmg7sGNbzucgrIt7Xg2zyYArw3ndT25M0GyfLS
         Oc1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=3TY6bRFDr1aqeOd4FrhZzQ+JR/umDefYUaoJoaLVWwQ=;
        b=rgIawMnPAuOHUtoMPPohKz6gqaT/CKbu+4Le6gpWvOX1kaWGCKLhxQUbAcAuVxqcS9
         MmJV+uVYE+VqZTqrxH2dXDuP5TFaPGbqcToQoVTVXc6+Q8G9oiqokMmgw3u3AVj4PDJ7
         8U0c8HTpZb+ozDcYpb21mPWcPac1yYPrtRmFD0Frh/+5bomkbX1Fzs35ngiQTnASvAXJ
         mDgv1h0x7xvAA6J4NwyzokuTiUNV3nZfYrRdyDruUSsdvs+j5JKuDNlv+zDNokIMUVri
         TVVM8ZKTchvwSNQmpg1GIzi3XnDO+Dsx6uQCzfmmLe8eG22kWJ8EiJSUI6t7HZEb2niZ
         7eUA==
X-Gm-Message-State: APjAAAXxO8ZfMOYTiKkiLnOFhZGxFK2In7bMf4acnSoO0+4lbww5Dwpd
        3eT5GoDEMD6x+mwHRkUJF7pLZuUc
X-Google-Smtp-Source: APXvYqyBEACpK1DcqIwOcaXHUDyWecKxiZ78jw+zZUSWuocclTohIkXPXlpeZO0aiIOFp/Xo1Qp12A==
X-Received: by 2002:a1c:6585:: with SMTP id z127mr15492666wmb.25.1560188827576;
        Mon, 10 Jun 2019 10:47:07 -0700 (PDT)
Received: from [192.168.1.17] (chq222.neoplus.adsl.tpnet.pl. [83.31.14.222])
        by smtp.gmail.com with ESMTPSA id 32sm27132810wra.35.2019.06.10.10.47.06
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 10 Jun 2019 10:47:06 -0700 (PDT)
Subject: Re: [PATCH v2 1/2] dt-bindings: Add docs for EL15203000
To:     Oleh Kravchenko <oleg@kaa.org.ua>
Cc:     Dan Murphy <dmurphy@ti.com>, linux-leds@vger.kernel.org
References: <20190607184022.13793-1-oleg@kaa.org.ua>
 <b1f0eaf6-e91c-2095-5928-179ad8695b33@ti.com>
 <27c0b356-8111-6b36-23cc-8e654147178f@kaa.org.ua>
 <b6a5cc5e-74f1-d328-7a47-995670ba7aa7@ti.com>
 <adf5a755-c534-64c3-6e99-ba39ffea95e2@kaa.org.ua>
 <2eba86cb-01be-c002-32d0-80ab2ab14f97@gmail.com>
 <7e787498-537b-390d-589a-577f34ffbc3f@kaa.org.ua>
 <94968b55-a9cc-277e-ac25-bf765f9db138@kaa.org.ua>
 <e1fc84a1-75e4-6c56-d2ea-f6ade28087ac@kaa.org.ua>
 <e4e0223d-c463-e767-12b2-7e360eac000b@gmail.com>
 <38050529-5730-6e88-fe1a-909492711dd0@kaa.org.ua>
 <8f658d57-5079-ad76-ce3e-af3d031b4685@gmail.com>
 <c4a150f4-529d-870d-7dd9-218eee4fac33@kaa.org.ua>
 <0c61035a-f2dc-7d9e-a75c-98f22cb839ee@gmail.com>
 <53ac2921-6bc8-df0b-5d5d-ff0545a53909@kaa.org.ua>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <c27a2968-c4e3-15e8-8790-b979e14c8330@gmail.com>
Date:   Mon, 10 Jun 2019 19:47:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <53ac2921-6bc8-df0b-5d5d-ff0545a53909@kaa.org.ua>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 6/10/19 7:22 PM, Oleh Kravchenko wrote:
> 
> 10.06.19 20:01, Jacek Anaszewski пише:
>> On 6/9/19 10:23 PM, Oleh Kravchenko wrote:
>>>
>>>
>>> 09.06.19 22:31, Jacek Anaszewski пише:
>>>>> I just want to clerify - for now LEDs board has 2 from 3 LEDs with effect function.
>>>>>
>>>>> 1. Screen frame led is just blinking, so blink_set() is fit well to this.
>>>>> 2. Pipe led actually consist from 3 leds and when effect is enabled next pattern is used:
>>>>>
>>>>>          ^
>>>>>          |
>>>>> LED1  >   OFF  ON   ON   ON
>>>>>          |
>>>>> LED2  >   OFF  OFF  ON   ON
>>>>>          |
>>>>> LED3  >   OFF  OFF  OFF  ON
>>>>>          |
>>>>>          +----^----^----^----^----> time
>>>>
>>>> Pattern trigger applies to a single LED so it won't fit for this
>>>> pattern.
>>>>
>>>> Currently we don't support patterns spanning on multiple LEDs,
>>>> so you would have to come up with your own solution.
>>>>
>>>> What I can recommend is a trigger that would be created by your driver
>>>> and would activate this sequence.
>>>>
>>>
>>> How to be sure this trigger can be applied only to Pipe LED?
>>
>> After thinking a bit more of it I came to the conclusion that instead
>> of a trigger the driver should create its own specific sysfs files for controlling the effect.
>>
>> Some time ago we had a proposal of generic support for hardware triggers
>> that this one could make use of, but the idea didn't seem to introduce
>> much gain in comparison to the driver specific files.
>>
>> So, you could have "effect_on" file which would accept "true" or "false"
>> (other API name proposals are welcome), that would be created by
>> every LED class device created by the driver.
>>
>> The effect will be activated when all three LEDs have the effect_on
>> file value set to "true".
>>
> 
> Sorry, I think we don't understand each other ;)

OK, so below depicting clarifies the things a bit, but
it doesn't change too much regarding the API.

> 
> ,-----------.   -\
> |           |     \
> |           |      \
> |  SCREEN   |       \
> |           |        +---- **Screen Frame LED Tube**
> |           |       /      only one LED with ID 'S' or 0x53
> |           |      /
> |           |     /        It can blinks when brightness set to '2' or 0x32
> `-----------'   -/

So this LED will use blink_set op for activating hw blinking.

>                  -
> PIPE_LED1 *      \      **Pipe LEDs**
> PIPE_LED2 *       +---- 3 leds with ID 'P' or 0x50
> PIPE_LED3 *      /      we can't control every LED individually.
>                  -       When brightness 0x32, this LEDs start playing 'leaking' effect:

This LED will need dedicated file for controlling the effect.
Blinking feature cannot be used for that because it will not
behave uniformly with software blink fallback.

>>          ^
>>          |
>> LED1  >   OFF  ON   ON   ON
>>          |
>> LED2  >   OFF  OFF  ON   ON
>>          |
>> LED3  >   OFF  OFF  OFF  ON
>>          |
>>          +----^----^----^----^----> time
> 
> 
>                  -
> ,-----------.    \
> | Place for |     \
> | coffee    |      +---- **Vending Area LED**
> |  cap      |     /      Simple OFF/ON behavior
> `-----------'    /
>                  -

This one will support neither blink_set nor effect file.

> 
> So you will be fine?
> if I proceed with recommendation from Dan to have sysfs attribute which actually set brightness to '2' (0x32) value?

I don't think there is necessity for anything like
el15203000-blink. Just use what LED framework is used to
support. Activate hw blinking when specific blink delay_on/off
intervals are given.

-- 
Best regards,
Jacek Anaszewski
