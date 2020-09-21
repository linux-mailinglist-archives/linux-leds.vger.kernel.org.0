Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57192273585
	for <lists+linux-leds@lfdr.de>; Tue, 22 Sep 2020 00:14:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726468AbgIUWOU (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 21 Sep 2020 18:14:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726457AbgIUWOU (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 21 Sep 2020 18:14:20 -0400
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 130A0C0613D0;
        Mon, 21 Sep 2020 15:14:20 -0700 (PDT)
Received: by mail-ed1-x542.google.com with SMTP id g4so14398909edk.0;
        Mon, 21 Sep 2020 15:14:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=O6tJk/SISDwkbmTOE0GNqIuSRPZUNkUq0hTN3vtvvrE=;
        b=ip7gvZXASzX/CqYuYtB+E8OZUWOyiEZLGUCAfQ7I2QgxPpm33cMkRYUBZ4uvQSp8jB
         ZoEiNSoQSTlr4iMUtk1z8honIjYVu7kDhKfdGUA9vtIpRqIBioIvpQ4WF7ydyYXYXNE+
         hzxkddMi4m1AfIp0s6GtgGyodk10x4axbSFFIIU/eDTX2B1fxVcO2zQYRwrtrgU7g5Ln
         I7FFq0kIXg/tojGAKk+WjTLvGmly5MYOiHYDHToYBNINfkxlQmqGPiqrE7tI8KvzUSjV
         gro9+EsLWVu0oTU+BXogVj883PS0IBP3kKl23mBvRddBvjyOoEHe6//V+4LSdQJg7UP0
         /XIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=O6tJk/SISDwkbmTOE0GNqIuSRPZUNkUq0hTN3vtvvrE=;
        b=Xdp8gUAMOwfO7Sl1vUVIedQ4xM+O0TLvyCPqIB70dqXoyJUKnmeTE7uZl6BWqnPJVi
         VHMXLRVkdrqu9Vfk++1wMgf0Xjtk8XJil82YZBN3KA4gW7nPxzWWQfW94RiRA8+uY7Kx
         sMrIzG7v8pSlt/kvtEFAjgz0xdX5bo2yY1Q+Jg/vpY+mOBfkAnN6wL+IvnZX9VEr204B
         a7q+JUw3mHc4REI4uzMFlDYlmzBWByUZONtb/AFjJgHVJRhBvBR39tYGqnjNdaNTe0Xr
         p5I8Eoeay629nxHdpPNan/u+pSrABoEEC5gWcFIHMFOGUcpPWz7e150LVnDRjFaPW0ZN
         /bAA==
X-Gm-Message-State: AOAM530v/TXhkbHdA4KIZ5G3gQUIFr8mLIEL+yZDh2wOABNGyIQW2+6x
        reyB19gaqB5v3YPnLgXNxZ1MdvLqTMk=
X-Google-Smtp-Source: ABdhPJz7Iu6SOSHf2PCa9yscfLTaNUe5sJ22tlOpeL8ciOTUjlF47EjPlLk+gItiTObZuBpftmk2rQ==
X-Received: by 2002:aa7:c3d4:: with SMTP id l20mr1043995edr.263.1600726457739;
        Mon, 21 Sep 2020 15:14:17 -0700 (PDT)
Received: from ?IPv6:2a01:110f:b59:fd00:a971:b6c4:4471:b459? ([2a01:110f:b59:fd00:a971:b6c4:4471:b459])
        by smtp.gmail.com with ESMTPSA id s22sm9431737eds.21.2020.09.21.15.14.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2020 15:14:17 -0700 (PDT)
Subject: Re: ledtrig-cpu: Limit to 4 CPUs
To:     Pavel Machek <pavel@ucw.cz>
Cc:     linux-leds@vger.kernel.org, dmurphy@ti.com,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20200919093833.GA14326@duo.ucw.cz>
 <27e19ac9-4bc0-2945-3985-6cd6bb5407df@gmail.com>
 <20200920183401.GA21494@duo.ucw.cz>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <781dcb5e-7bad-f740-5914-778ec8a7306b@gmail.com>
Date:   Tue, 22 Sep 2020 00:14:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200920183401.GA21494@duo.ucw.cz>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 9/20/20 8:34 PM, Pavel Machek wrote:
> Hi!
> 
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
>>> +		if (cpu > 4)
>>
>> NACK. The workaround for this trigger was implemented for a reason -
>> to make it working on platforms with arbitrary number of logical cpus.
>> I've got 8, so I am discriminated now. Not saying, that it precludes
>> trigger registration with no single line of warning.
> 
> Can I get details of your setup?

I don't use this trigger, but I can imagine that someone does.

> What CPU type that is, and how are you mapping CPU activity to LEDs?

The type of CPU is irrelevant here. What is important is the fact
that with this trigger it is possible to visually monitor CPU core
online state. Probably it would be good to ask the author of that
trigger about his use case.

We've had also another patch in 2017 adding "cpu" trigger to
ledtrig-cpu.c that expressed number of online cores in a function of
brightness.

The commit message said:

"This is particularly useful on tiny linux boards with more CPU cores
than LED pins."

So apparently there are still users thereof.

As I've checked it now it has a bug, as it assumes max brightness to be
always LED_FULL, so that will need a fix.

I have spoken up, because I don't get the reason for your patch.
This driver was reworked year ago to remove PAGE_SIZE limit,
and I even applied it to my for-next tree, but that was at
the time of handling maintainership to yourself, and you
seem to not have picked that commit.

Was that intentional? We had even Greg's ack [0].

[0] https://lkml.org/lkml/2019/9/30/397

-- 
Best regards,
Jacek Anaszewski
