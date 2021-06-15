Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 840A33A7DF9
	for <lists+linux-leds@lfdr.de>; Tue, 15 Jun 2021 14:17:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229869AbhFOMTS (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 15 Jun 2021 08:19:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33970 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229601AbhFOMTR (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Tue, 15 Jun 2021 08:19:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1623759433;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=W1LLGCnhy//F9DKEVml1BND+rCIJl0/vXdm/npAJVsI=;
        b=KtVdVauZeosqYKb3AzfFVWnp+k8jdsSOF9wq5A36fPEn/b0D663qTho7MI4tgnh1VgcN8L
        e4Oz3rjgUQOUSCI4ImCleY2q9J2k6IudLx9li4nLvIusR5HC6ut+xNcLnCBdXi/50qs2/j
        U03RteSjNkXMKbg2fbW6CTrNCRSt1yo=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-87-tt7t-9psO8GNmy7SHjSJBQ-1; Tue, 15 Jun 2021 08:17:12 -0400
X-MC-Unique: tt7t-9psO8GNmy7SHjSJBQ-1
Received: by mail-ed1-f69.google.com with SMTP id j3-20020aa7c3430000b0290393f7aad447so7984398edr.18
        for <linux-leds@vger.kernel.org>; Tue, 15 Jun 2021 05:17:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=W1LLGCnhy//F9DKEVml1BND+rCIJl0/vXdm/npAJVsI=;
        b=GyOBo3R86a4/XvUZz9X36M9YjMVaOP1RfX4R78y0HvW/xlQd+iA0ZxDQoKHzTFJJJk
         xskMGspPcpjgBiqFDzyRvPOFu2GPJRasRXZQSYQ24sufGwYMc5seiwKnHouuW6yowI3y
         rza9oJKQfzLsYGCdXVo9asWJ/BvQzPlzVWQOAq9h8oGIef2aTOqh4OXy4JaMGyNfDP7G
         PoO/wzTPgsTTywvJxWsUTrNqf2Jwwwign6djTyTsLZww2tTGRmyBObIxpMtieUJYTWqK
         aaP9YySaGdUsdMQsS11k8w0XBKqkyI8zkY6lZGPy5stFeuNZNTNbb30xGsfzz31celc5
         MGHg==
X-Gm-Message-State: AOAM532c0XMRhR3uwpEB28vvSzlwGh+VN4PToHvD05ROUuhJTZCFwmBf
        0wfLwYVSrX5/CodIJsgxzM3lSv4AQURzZqWM30bZdWHEhUm7u76DK25uZpmmXrohgBriTSlIcW+
        XXYiXnsqp76nycvbuvEQa3g==
X-Received: by 2002:aa7:d5c6:: with SMTP id d6mr22543662eds.290.1623759429964;
        Tue, 15 Jun 2021 05:17:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyYQSCTko7OllcPFzyfWOPOykdYRrGw5E0zmq2G8csmiDGhdbS7+AVCvo1BWSR3YYjAKa44Zg==
X-Received: by 2002:aa7:d5c6:: with SMTP id d6mr22543637eds.290.1623759429821;
        Tue, 15 Jun 2021 05:17:09 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id p10sm12095691edy.86.2021.06.15.05.17.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Jun 2021 05:17:09 -0700 (PDT)
Subject: Re: LEDs with hardware-accelerated patterns, suspend indication
To:     Jafar Akhondali <gigelaknak@gmail.com>,
        Pavel Machek <pavel@ucw.cz>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        mauro.chehab@huawei.com,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20210526153040.GA4537@amd>
 <5fbbab4f-3e22-5a4a-eea8-2531ee165cc4@redhat.com>
 <CAMW3L+19tP_9=+8j8LLjqCGDaaVZ86UMm9NwLbbpA77zOYnr1Q@mail.gmail.com>
 <79988fe2-7b3d-7485-131c-4f654ec6d8b8@redhat.com>
 <CAMW3L+13O4jXyp1LVtuxhpXP_fkfWXi9JoNS8FYUAMHaJBGKZg@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <17ec2040-24e9-4090-e64b-8048f0b4005b@redhat.com>
Date:   Tue, 15 Jun 2021 14:17:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <CAMW3L+13O4jXyp1LVtuxhpXP_fkfWXi9JoNS8FYUAMHaJBGKZg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

<I accidentally dropped the Cc list when mailing Jafar, I'm restoring it now>

Hi All,

On 6/12/21 10:21 PM, Jafar Akhondali wrote:
> Hi Hans,
> Sorry for the late reply.
> there are two categories of keyboard lighting modes:
> 1. static
> 2. dynamic
> 
> In static mode, any of 4 zones can be configured to show specific color,
> independently.
> 
> In dynamic mode, there is no control over specific zones.
> It's only possible to set some: color, speed, direction
> and: [R]ed,[G]reen, [B]lue
> 
> so in dynamic mode, the user can't control zones,
> the dynamic effects take care of that.

So we have 4 zones, which are individual controllable, so which should
probably be modeled as individual LED class devices. But when we enable
the hardware effects, then the individual addressing goes away and we
set one effect which applies to all zones.

Jafar, do I understand this correctly?

Pavel, how should this be mapped to the led-class API?

Some ideas:

a) Only add the new lpattern to the main zone?
2) Add the new lpattern to all zones, but only make it
writable in the main zone ?

Regards,

Hans




> On Mon, Jun 7, 2021 at 11:58 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> Hi,
>>
>> On 6/4/21 10:57 PM, Jafar Akhondali wrote:
>>> Hi Hans,
>>>
>>> On Sat, Jun 5, 2021 at 12:58 AM Hans de Goede <hdegoede@redhat.com> wrote:
>>>>
>>>> Hi Pavel,
>>>>
>>>> Jafar can you explain how this works in a bit more detail. I get
>>>> the feeling that from a hardware-API pov there are no individual
>>>> addressable LEDs, yet some effects do program individual LEDs
>>>> differently then their neighbors ?  Or am I just misunderstanding
>>>> what some of the effects do ?
>>> Sure, Acer predator helios 300 got a 4-zone RGB keyboard.
>>> Some of the mentioned modes like "wave" accept less configurable
>>> parameters, such as color.
>>> This is because the effect itself changes the color. So yes, there is
>>> no per-key rgb at least in this model,
>>> and the lowest possible change is to change each zone.
>>> You can watch a video of keyboard demo here(check after 2:05):
>>> https://www.youtube.com/watch?v=eAfAwNiIWbA
>>> Above uses PredatorSense, which is Acer's official gaming control app.
>>> Also, my patch provides only support for effects, and not static coloring.
>>> As a workaround for static coloring, it's possible to use a effect
>>> with zero speed,
>>> so it looks like static coloring til I can figure how static coloring
>>> is implemented.
>>>
>>> The whole config for my patch accepts 16 bytes which configures different modes.
>>> I've also created a CLI interface for configuring this steps, so you
>>> can check required params
>>> from there too:
>>> https://github.com/JafarAkhondali/acer-helios-300-rgb-keyboard-linux-module/blob/main/facer_rgb.py
>>>
>>> Hope this helps, and thanks for adding me.
>>
>> Thank you for the extra info, looking at the video it seems that the
>> wave effect is cycling through the colors of the rainbow, but at the
>> same time it also seems that say starts in zone 1 and then moves to
>> zone 2 (while zone 1 becomes say purple) and then after that the red
>> moves to zone 3 and then zone 2 becomes purple. Did I see that
>> correct ? And is this just caused by the software not starting the
>> cycle effect in the different zones at the same time, or is this actual
>> the intended wave effect ?
>>
>> What I'm trying to ask here is if the 4 zones are fully independent,
>> e.g. one could be in wave effect while the other 3 zones do something
>> else, or are certain effects multi-zone effects?
>>
>> Regards,
>>
>> Hans
>>
> 

