Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 09B833A56C
	for <lists+linux-leds@lfdr.de>; Sun,  9 Jun 2019 14:24:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728345AbfFIMYE (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 9 Jun 2019 08:24:04 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:34233 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726874AbfFIMYE (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 9 Jun 2019 08:24:04 -0400
Received: by mail-wr1-f67.google.com with SMTP id e16so6445409wrn.1
        for <linux-leds@vger.kernel.org>; Sun, 09 Jun 2019 05:24:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Z+5NAHAenYbYDvukrR9AeErRTg6vmO0P18jwzrqd4ak=;
        b=lyh/9CBRhJNbmrOc2TLE77cWPC5KlYJrr47NhYF93sELN5xrPdaBQbUyb8SPmRmYkV
         ud76Duizd8A+0CEweqFe/0/V5k+kqMOkVy5MyaLYhWp2beNXPgpISumOQuVc1m1aC8gP
         +dqy4pb7fbY8WUPxjH85UzyjMnZuvQ8RCFOHgvrEO/xqrtUpmvh/5se3QEh57UKMjFAy
         qgTIn9/XUcVtOIAelJh/2oRr2uMSlfo42LsZcPZ2RsAiIp6x81rFvcveEZvqg9C75D2A
         SH2mRZC+YjFp/SAYkEv3pWVr9j0sN/MsxkIA5zMf3uu40nbA1PX2RL7LSn96RWBJmjo1
         n6hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Z+5NAHAenYbYDvukrR9AeErRTg6vmO0P18jwzrqd4ak=;
        b=HHqrOyHZEGGhQ7fx0hUIr7Y30lMQSgiQysp8CB/drjgjxZo9ClBnF+RoKEzCzexBDg
         NobRkOLFFP96WkgB7oieq0JPz3h0D15yCa35L9rrORzr0Ous2d2VlzUoI1eQW+5aBmDu
         4RtOIqNvWuSphFtHJnLWVZXFFJ+rAGmqX9T9F8oVOfHbn+y5PQmFywcc4F6gOD5MhVss
         fnMiNm5UQIjP0ygRXGMCDXIIJVq3T0p06b0+d6ebKnsTh8crhpbe5qd9HbgiML79OKXo
         uEme6RnyoEEXg+GzGu76hAUZ4hINZjNGS9gpbGuh8kJbWoi6JgO/b7YnJRGXOhykkIEQ
         UxVQ==
X-Gm-Message-State: APjAAAWjA+MtcIXufZxIMgEbw8sT5SSD/kbfl8ziEhjJzo3dbEzAl949
        DZp3N/KWJpYqmPI33Y3ApOMMdJQG
X-Google-Smtp-Source: APXvYqwxuwt3bu7krOz7Dtd7RM3KYu1nogE5zZVJlBH6JNL9evsW1v0o5ZKkEBt1PbC8PRGLIeQcmQ==
X-Received: by 2002:a5d:4089:: with SMTP id o9mr35607502wrp.6.1560083042123;
        Sun, 09 Jun 2019 05:24:02 -0700 (PDT)
Received: from [192.168.1.17] (bkq78.neoplus.adsl.tpnet.pl. [83.28.184.78])
        by smtp.gmail.com with ESMTPSA id 11sm7240102wmd.23.2019.06.09.05.24.00
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 09 Jun 2019 05:24:01 -0700 (PDT)
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
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <e4e0223d-c463-e767-12b2-7e360eac000b@gmail.com>
Date:   Sun, 9 Jun 2019 14:24:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <e1fc84a1-75e4-6c56-d2ea-f6ade28087ac@kaa.org.ua>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Oleh,

On 6/8/19 12:42 AM, Oleh Kravchenko wrote:
> Jacek,
> 
> 08.06.19 01:12, Oleh Kravchenko пише:
>> Hello Jacek,
>>
>> 08.06.19 00:48, Oleh Kravchenko пише:
>>> Jacek,
>>>
>>>> For blinking you can use blink_set op. To be able to recommend
>>>> you anoptimal solution for the effect we would need more
>>>> details regarding its nature.
>>>
>>> Thanks, I will do that.
>>> But how to properly handle other effects? Not only blinking?
>>
>> 	int		(*blink_set)(struct led_classdev *led_cdev,
>> 				     unsigned long *delay_on,
>> 				     unsigned long *delay_off);
>>
>> My LED board doesn't support any delay settings at all.
>> Should I always set delay_on, delay_off to zero?

See a description of blink_set op in the leds.h:

* Activate hardware accelerated blink, delays are in milliseconds
* and if both are zero then a sensible default should be chosen.
* The call should adjust the timings in that case and if it can't
* match the values specified exactly.

Does the chip documentation say something about the rate
of blinking it supports?

If yes, then your implementation of blink_set op should set
the hw blinking effect only if these specific delays are
requested (you can also do some alignment - please compare
other LED drivers) or as mentioned before if two zeros are
provided.

If not, you could try to measure the blink rate and and
proceed similarly.

If requested delays are far beyond hw capabilities than just return
-EINVAL which will make LED core using software blink callback.

> 
> How to blink from userspace?
> 
> sysfs looks like doesn't have any property for that :(
>    brightness
>    device -> ../../../spi0.0
>    max_brightness
>    power
>    subsystem -> ../../../../../../../../../class/leds
>    trigger
>    uevent

You want to set timer trigger (first turn it on in the config):

echo "timer" > trigger

After that two files appear: delay_on and delay_off.

ledtrig-timer uses blink_set op for setting up the hw blinking.

-- 
Best regards,
Jacek Anaszewski
