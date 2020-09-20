Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C351B271670
	for <lists+linux-leds@lfdr.de>; Sun, 20 Sep 2020 19:50:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726109AbgITRt5 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 20 Sep 2020 13:49:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725858AbgITRt5 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 20 Sep 2020 13:49:57 -0400
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5D0AC061755;
        Sun, 20 Sep 2020 10:49:56 -0700 (PDT)
Received: by mail-ed1-x542.google.com with SMTP id l17so10617703edq.12;
        Sun, 20 Sep 2020 10:49:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=yC2IsBfWzK7ZQ09LtojSvZoD4EQg7HI9mq1hIWS4J6A=;
        b=BiJUwRFgcR3h/6Hkbk1y6UKhj2QBXzgbO2d4orYpKa91odNUZpH2+LO31ez24ulNn/
         AwMXA6nhZ2Vujxu34JmOoDoXUL6N9VjENiWD1sUf01iopp63a4Qfp8YlekBMMHQZWzYu
         XR5U5IDTT0SZoNNpvpdtx4Lcp/IxvZVzMZoInzdb1AqYRkdlofsEzPZ593RdRQoOGVJx
         DqhZp1G2cxEjLaKWIsVEWgf0ZiOcxSHZl+hoDofL74bAmpaOh2/qr2x3MPdyh4sq5N32
         QO1W3D1Lq/udrB2rt0iLy75BLmTC7bdzCAMs12sGSnuGV7dSHFBx6j7ADhYAx2Cpbm3L
         cUfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=yC2IsBfWzK7ZQ09LtojSvZoD4EQg7HI9mq1hIWS4J6A=;
        b=LzKpwD8jpuq4J22O+A7LkkjNjDiaHZu7vLzxb+1CpFZoMEV3PcEtrWfb3XQdhyEZpN
         KKG/NeCMaNICt04fYvAXEcf3r2DVuQcVMBsEPvu1J5Sqv+rd2YtQQfa2QWtjRtDz3tdw
         kStOVbYIyWWcCPPCi0c60+gkQ2wnOqrLk27gzG+u9kcMnfgOx9GE+5bvnQpsLkVPNNu9
         XHFoWpQ/fSwH6AmRapOVNMIGhI6h+1Udzy9JC6t0ba9jY16n37eL8KASOUf9YbBx7Pft
         //V6rg4P/WrRyYtQTVEYBam0tXKhceWBHguggSBN6SUpc14PSr13B6ffGcNBmA6Ai1Zo
         TjWw==
X-Gm-Message-State: AOAM530TlPPe+6Kg2HSVnf6oq1HaQ1JE/kQS75TNWHa3tfSM6HJmuWwH
        fhZVYs2LnrM3lA2Sz7FqqjCHMV9nBEQ=
X-Google-Smtp-Source: ABdhPJzYZQOxxiDWmwSjz1ZfxP7A8zCvb/AhvdOUgHx1t3dn4BR5oNZkwLEST9JnQWZAGUmmEH9TwA==
X-Received: by 2002:aa7:cb44:: with SMTP id w4mr49144986edt.139.1600624195080;
        Sun, 20 Sep 2020 10:49:55 -0700 (PDT)
Received: from ?IPv6:2a01:110f:b59:fd00:1879:e534:7e37:5e55? ([2a01:110f:b59:fd00:1879:e534:7e37:5e55])
        by smtp.gmail.com with ESMTPSA id si28sm7057547ejb.95.2020.09.20.10.49.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 20 Sep 2020 10:49:54 -0700 (PDT)
Subject: Re: ledtrig-cpu: Limit to 4 CPUs
To:     Marek Behun <marek.behun@nic.cz>
Cc:     Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org,
        dmurphy@ti.com,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20200919093833.GA14326@duo.ucw.cz>
 <27e19ac9-4bc0-2945-3985-6cd6bb5407df@gmail.com>
 <20200920173905.237c314e@nic.cz>
 <91f1caa7-8005-6c8f-ce7c-84e5c8cee5f8@gmail.com>
 <20200920193357.3d797a46@nic.cz>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <2cf83322-0f9f-6d7e-02d0-c2e6d773921f@gmail.com>
Date:   Sun, 20 Sep 2020 19:49:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200920193357.3d797a46@nic.cz>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 9/20/20 7:33 PM, Marek Behun wrote:
> On Sun, 20 Sep 2020 18:55:28 +0200
> Jacek Anaszewski <jacek.anaszewski@gmail.com> wrote:
> 
>> On 9/20/20 5:39 PM, Marek Behun wrote:
>>> On Sun, 20 Sep 2020 16:15:09 +0200
>>> Jacek Anaszewski <jacek.anaszewski@gmail.com> wrote:
>>>    
>>>> Hi Pavel,
>>>>
>>>> On 9/19/20 11:38 AM, Pavel Machek wrote:
>>>>> commit 318681d3e019e39354cc6c2155a7fd1bb8e8084d
>>>>> Author: Pavel Machek <pavel@ucw.cz>
>>>>> Date:   Sat Sep 19 11:34:58 2020 +0200
>>>>>
>>>>>        ledtrig-cpu: Limit to 4 CPUs
>>>>>        
>>>>>        Some machines have thousands of CPUs... and trigger mechanisms was not
>>>>>        really meant for thousands of triggers. I doubt anyone uses this
>>>>>        trigger on many-CPU machine; but if they do, they'll need to do it
>>>>>        properly.
>>>>>        
>>>>>        Signed-off-by: Pavel Machek <pavel@ucw.cz>
>>>>>
>>>>> diff --git a/drivers/leds/trigger/ledtrig-cpu.c b/drivers/leds/trigger/ledtrig-cpu.c
>>>>> index 869976d1b734..b7e00b09b137 100644
>>>>> --- a/drivers/leds/trigger/ledtrig-cpu.c
>>>>> +++ b/drivers/leds/trigger/ledtrig-cpu.c
>>>>> @@ -2,14 +2,18 @@
>>>>>     /*
>>>>>      * ledtrig-cpu.c - LED trigger based on CPU activity
>>>>>      *
>>>>> - * This LED trigger will be registered for each possible CPU and named as
>>>>> - * cpu0, cpu1, cpu2, cpu3, etc.
>>>>> + * This LED trigger will be registered for first four CPUs and named
>>>>> + * as cpu0, cpu1, cpu2, cpu3. There's additional trigger called cpu that
>>>>> + * is on when any CPU is active.
>>>>> + *
>>>>> + * If you want support for arbitrary number of CPUs, make it one trigger,
>>>>> + * with additional sysfs file selecting which CPU to watch.
>>>>>      *
>>>>>      * It can be bound to any LED just like other triggers using either a
>>>>>      * board file or via sysfs interface.
>>>>>      *
>>>>>      * An API named ledtrig_cpu is exported for any user, who want to add CPU
>>>>> - * activity indication in their code
>>>>> + * activity indication in their code.
>>>>>      *
>>>>>      * Copyright 2011 Linus Walleij <linus.walleij@linaro.org>
>>>>>      * Copyright 2011 - 2012 Bryan Wu <bryan.wu@canonical.com>
>>>>> @@ -145,6 +149,9 @@ static int __init ledtrig_cpu_init(void)
>>>>>     	for_each_possible_cpu(cpu) {
>>>>>     		struct led_trigger_cpu *trig = &per_cpu(cpu_trig, cpu);
>>>>>     
>>>>> +		if (cpu > 4)
>>>>
>>>> NACK. The workaround for this trigger was implemented for a reason -
>>>> to make it working on platforms with arbitrary number of logical cpus.
>>>> I've got 8, so I am discriminated now. Not saying, that it precludes
>>>> trigger registration with no single line of warning.
>>>> Regardless of that - you have no guarantee that you're not breaking
>>>> anyone - "I doubt" is not a sufficient argument.
>>>>   
>>>
>>> If that is the case Jacek, I would try 16 and then see if people
>>> complain. Do you really think that someone sets a specific LED to
>>> trigger on activity on CPU id > 16?
>>
>> I have an access to the machine with 80 cpus, so I could once
>> get surprised not being able to find cpuN triggers not being
>> listed among available triggers.
>>
>> And say that I have a solution where I install 80 userspace LEDs
>> (drivers/leds/uleds.c) and register them on each cpuN triggers to get
>> notifications on how cpus work.
> 
> Hi Jacek,
> 
> I understand (and Pavel does for sure too) that many people
> currently have that possibility, that they have access to machines with
> many CPUs and many LEDs. We also understand that currently it is
> possible for users to set 1847th LED to trigger on activity on CPU ID
> 1337. What we are suggesting is that practically no one uses this, and
> for those 10 people who do, well it would be better for them to migrate
> to new ABI than for kernel developers having forever maintain this
> legacy ABI.
> 
> Legacy drivers get removed from kernel from time to time, if no one
> uses them. So I think Pavel's proposal (although I may not agree with
> the limit 4) has some merit. If we try this, and someone complains, we
> can then discuss. If we don't try, we may never know.

Just go ahead without my ack. I just wanted not to let it go without
any discussion. At least we leave a trace...

>>> If you do not agree, then I think we should implement a "cpu" trigger
>>> where the cpu ID (or maybe mask of multiple CPUs) is configurable via
>>> another sysfs file. And then declare current cpu trigger (with names
>>> "cpu%d") as legacy.
>>
>> Yes, we can do that, and even mark the cpu trigger as legacy but we
>> cannot prevent people from using it if that was present in kernel
>> for many years.
>>
> 

-- 
Best regards,
Jacek Anaszewski
