Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 16081271611
	for <lists+linux-leds@lfdr.de>; Sun, 20 Sep 2020 18:55:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726305AbgITQze (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 20 Sep 2020 12:55:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726267AbgITQzd (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 20 Sep 2020 12:55:33 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FD7BC061755;
        Sun, 20 Sep 2020 09:55:32 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id nw23so14516040ejb.4;
        Sun, 20 Sep 2020 09:55:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=CAqmdf6aL8mzhP74g+GjJTStIQuY1mHyfBlsL4DKJCQ=;
        b=G8jz+iXJ2O+LIy++D83+hxIx1XoBuFvq2UhVRqKlTV58nIMxyrKVajsMkWr9LwBIUp
         Dgzkn9ROO1MoynIlB++qzJmvR45Ap7XbqqqfIkQzuhH4TPn2XxnJaqlpWpZsrQl77XXa
         YBPiytfd4GbuxTcbj/BTffvxuSARqmF0Xtb6uets97NNiHQlRtGJfnbYbeGzzyk5C/gI
         1IoneR6qC1y3vRjN6CFb5L9gCh6K6JNj0xeEK9qdJMuG1pkQdsl2Ar+0d3X4jUEwqqnl
         w5BZDkxJiedGr+wmtyvjgUzGdVb70XEk04oMKYtGoGbOEpTkSe95UQ9hC3P0WsI/pQw/
         54yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=CAqmdf6aL8mzhP74g+GjJTStIQuY1mHyfBlsL4DKJCQ=;
        b=cnlRohy3bAAK/jA3+HaX1FPxfQwZN66AsC99LAKqkiptcntvwLanQWRCcn0ebNmmYu
         hZgwrKXr3V/620SrYkbKES2V2c3Ui/QSPR8xs5lr98jmgNA+svs25eUQVb6uKpBKn15H
         42ofYKF1t5CbnppX/ZesUEiyaxSCd8Ul8Pcc3O2eel35VRrBSQZIxnxZIzwWyKPM6Srw
         uaO/3INBYGXkYMNNZ80ZRKaiOfPzFXqVQSVe5yT3gwtOPMlGFivaqyxU3a6CWkFbM55F
         C2C8F5HlMyXZaeNYFlQfUuf6f+VSZYA0sMAPi1/5NbnOHcCZ02R5VH1Y1AIYqKbiG6sg
         JXuw==
X-Gm-Message-State: AOAM532KmFYkFXSNiAVFagt4P3+RzXmMKhwXju/QuNY5aQejjOlZ9zT/
        eGZrA310LtGRo1UDUhry5PEDw0qmnTM=
X-Google-Smtp-Source: ABdhPJx9z66TL7y8GlK78FEX6DfBCjWF4DcLVrAunLqpYuAdBVTx52e9xBej9KDRK0YX9FvMEZAeZA==
X-Received: by 2002:a17:906:cd0d:: with SMTP id oz13mr45601187ejb.212.1600620930424;
        Sun, 20 Sep 2020 09:55:30 -0700 (PDT)
Received: from ?IPv6:2a01:110f:b59:fd00:1879:e534:7e37:5e55? ([2a01:110f:b59:fd00:1879:e534:7e37:5e55])
        by smtp.gmail.com with ESMTPSA id n7sm7011978eji.13.2020.09.20.09.55.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 20 Sep 2020 09:55:29 -0700 (PDT)
Subject: Re: ledtrig-cpu: Limit to 4 CPUs
To:     Marek Behun <marek.behun@nic.cz>
Cc:     Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org,
        dmurphy@ti.com,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20200919093833.GA14326@duo.ucw.cz>
 <27e19ac9-4bc0-2945-3985-6cd6bb5407df@gmail.com>
 <20200920173905.237c314e@nic.cz>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <91f1caa7-8005-6c8f-ce7c-84e5c8cee5f8@gmail.com>
Date:   Sun, 20 Sep 2020 18:55:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200920173905.237c314e@nic.cz>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 9/20/20 5:39 PM, Marek Behun wrote:
> On Sun, 20 Sep 2020 16:15:09 +0200
> Jacek Anaszewski <jacek.anaszewski@gmail.com> wrote:
> 
>> Hi Pavel,
>>
>> On 9/19/20 11:38 AM, Pavel Machek wrote:
>>> commit 318681d3e019e39354cc6c2155a7fd1bb8e8084d
>>> Author: Pavel Machek <pavel@ucw.cz>
>>> Date:   Sat Sep 19 11:34:58 2020 +0200
>>>
>>>       ledtrig-cpu: Limit to 4 CPUs
>>>       
>>>       Some machines have thousands of CPUs... and trigger mechanisms was not
>>>       really meant for thousands of triggers. I doubt anyone uses this
>>>       trigger on many-CPU machine; but if they do, they'll need to do it
>>>       properly.
>>>       
>>>       Signed-off-by: Pavel Machek <pavel@ucw.cz>
>>>
>>> diff --git a/drivers/leds/trigger/ledtrig-cpu.c b/drivers/leds/trigger/ledtrig-cpu.c
>>> index 869976d1b734..b7e00b09b137 100644
>>> --- a/drivers/leds/trigger/ledtrig-cpu.c
>>> +++ b/drivers/leds/trigger/ledtrig-cpu.c
>>> @@ -2,14 +2,18 @@
>>>    /*
>>>     * ledtrig-cpu.c - LED trigger based on CPU activity
>>>     *
>>> - * This LED trigger will be registered for each possible CPU and named as
>>> - * cpu0, cpu1, cpu2, cpu3, etc.
>>> + * This LED trigger will be registered for first four CPUs and named
>>> + * as cpu0, cpu1, cpu2, cpu3. There's additional trigger called cpu that
>>> + * is on when any CPU is active.
>>> + *
>>> + * If you want support for arbitrary number of CPUs, make it one trigger,
>>> + * with additional sysfs file selecting which CPU to watch.
>>>     *
>>>     * It can be bound to any LED just like other triggers using either a
>>>     * board file or via sysfs interface.
>>>     *
>>>     * An API named ledtrig_cpu is exported for any user, who want to add CPU
>>> - * activity indication in their code
>>> + * activity indication in their code.
>>>     *
>>>     * Copyright 2011 Linus Walleij <linus.walleij@linaro.org>
>>>     * Copyright 2011 - 2012 Bryan Wu <bryan.wu@canonical.com>
>>> @@ -145,6 +149,9 @@ static int __init ledtrig_cpu_init(void)
>>>    	for_each_possible_cpu(cpu) {
>>>    		struct led_trigger_cpu *trig = &per_cpu(cpu_trig, cpu);
>>>    
>>> +		if (cpu > 4)
>>
>> NACK. The workaround for this trigger was implemented for a reason -
>> to make it working on platforms with arbitrary number of logical cpus.
>> I've got 8, so I am discriminated now. Not saying, that it precludes
>> trigger registration with no single line of warning.
>> Regardless of that - you have no guarantee that you're not breaking
>> anyone - "I doubt" is not a sufficient argument.
>>
> 
> If that is the case Jacek, I would try 16 and then see if people
> complain. Do you really think that someone sets a specific LED to
> trigger on activity on CPU id > 16?

I have an access to the machine with 80 cpus, so I could once
get surprised not being able to find cpuN triggers not being
listed among available triggers.

And say that I have a solution where I install 80 userspace LEDs
(drivers/leds/uleds.c) and register them on each cpuN triggers to get
notifications on how cpus work.

> If you do not agree, then I think we should implement a "cpu" trigger
> where the cpu ID (or maybe mask of multiple CPUs) is configurable via
> another sysfs file. And then declare current cpu trigger (with names
> "cpu%d") as legacy.

Yes, we can do that, and even mark the cpu trigger as legacy but we
cannot prevent people from using it if that was present in kernel
for many years.

-- 
Best regards,
Jacek Anaszewski
