Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F276313F58
	for <lists+linux-leds@lfdr.de>; Sun,  5 May 2019 14:15:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726310AbfEEMPn (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 5 May 2019 08:15:43 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:39688 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725811AbfEEMPn (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 5 May 2019 08:15:43 -0400
Received: by mail-lf1-f66.google.com with SMTP id z124so1129249lfd.6;
        Sun, 05 May 2019 05:15:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=fIkrNy5IzUeiRGlTltI+GpTBec3U11q53koMP83Xz9M=;
        b=rZV/nugWNcQltzC/A3st8sgI+6DOrkuLwte7a9TCmjEHK3H2RlYsf7NNZSgRijOnj4
         TMpJiIfITiU8x6uI4NiUxTZJq6on1qicqDTDqZtsMKWRqxwB/wfpaH9VClei46/lIVUW
         ciH0vWmOklMrfTQzTK7KEvGcsp04FgX3BS4lLrG3JUkYMDG3uNEIdC3+4FN5iIAi0XJn
         LSb72U5u3n5eAt6URWMF+J0wh69bFVQsYEtXGUz8vueSwsbUk55vZP00B6KeyHP8qOP+
         b1DyMrtdPMVTD9jJx3QhTRVXmxYLaqPJvY7YrpSWe22RVyanuyYm3avGmAUIdl1N4O7n
         TQvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=fIkrNy5IzUeiRGlTltI+GpTBec3U11q53koMP83Xz9M=;
        b=TgBYVkW+B1D/9XNZr3gxfIt+RwbiHdJqaLyVNZLeSL2Z2aY43LxuhV21de7icLB16F
         9fGT8OuvoixOAQU7s4yJk2B3emLpoifJez+fi4QD+AU+oZ6hq+Ogd7JltznK2vTGGwGJ
         J/aI1vJdfyNPIfRgGc6kcTt4DDrA5v4rkQ2e0Xbx9A+a6ikTKd2OHo7JKHF+7Ge6lsBR
         vI73ztmWIuS6TJa6xdzH0GM8lJHReLzj0XMgQUV1c+biVwGIqxCenYG4dzz7DV50qbUi
         5OeheT+MexEZaw0SBh0vgwPugNMNovnUySNVLjLqqJvi1oHz5yD5JpmJ2omvSIN7TAIQ
         ohMA==
X-Gm-Message-State: APjAAAXI4UAqNrdfmLRRk3fILnqWdB7BUh5hJXb5Mw2yvbGoOVE3Z60q
        XvL7WTmjvyGapFmRGjpNE6q5x6Of
X-Google-Smtp-Source: APXvYqy1wHBT/xpzwc2Bx0DniLIAgL8IA/+FUc9lV9z4KKw6HXeF5kCuKBodbm1eF8YoGfS+gWESuA==
X-Received: by 2002:a19:ec07:: with SMTP id b7mr3958164lfa.62.1557058540569;
        Sun, 05 May 2019 05:15:40 -0700 (PDT)
Received: from [192.168.1.19] (chp150.neoplus.adsl.tpnet.pl. [83.31.13.150])
        by smtp.gmail.com with ESMTPSA id f21sm1477885ljk.94.2019.05.05.05.15.38
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 05 May 2019 05:15:39 -0700 (PDT)
Subject: Re: [PATCH 1/2] dt-bindings: leds: Add binding for ubnt-spi LED.
To:     Christian Mauderer <oss@c-mauderer.de>, Pavel Machek <pavel@ucw.cz>
Cc:     Christian Mauderer <list@c-mauderer.de>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        Dan Murphy <dmurphy@ti.com>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
References: <20190504122825.11883-1-list@c-mauderer.de>
 <4889e87a-5c7a-da74-bff6-c20fd07ea0f4@gmail.com>
 <0175bf00-f2eb-98c7-ce0b-d9a2858872e7@c-mauderer.de>
 <5cc8907f-5cb4-e8b4-7309-cc446ef5bde7@gmail.com> <20190504203448.GA24856@amd>
 <20190504221719.GA7237@amd> <0001f61b-b245-0c70-ee39-a6ec95889938@gmail.com>
 <e58c6bbb-9003-be45-19dc-0b1851770f54@c-mauderer.de>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <5710b652-aace-0daf-3b08-983690d66b27@gmail.com>
Date:   Sun, 5 May 2019 14:15:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <e58c6bbb-9003-be45-19dc-0b1851770f54@c-mauderer.de>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 5/5/19 1:51 PM, Christian Mauderer wrote:
> On 05/05/2019 12:56, Jacek Anaszewski wrote:
>> Hi,
>>
>> On 5/5/19 12:17 AM, Pavel Machek wrote:
>>> Hi!
>>>
>>>>>> I wasn't aware of that list. Maybe "power" or even better "status"
>>>>>> would
>>>>>> match the function.
>>>>>
>>>>> Hmm, I've just found out that there are two "wlan-ap" occurrences in
>>>>> the existing mainline bindings, so I propose to follow that.
>>>
>>> Let me see... dove-d3plug.dts has "status", "wlan-ap", "wlan-act".
>>>
>>>>>> Should I add the color too? So "white:status"?
>>>>>
>>>>> Yes, why not if it is known. So, having the above I propose:
>>>>>
>>>>>          label = "white:wlan-ap";
>>>>
>>>> Linux now runs on many different devices, and I believe userland wants
>>>> to know "this is main notification LED for this device" (and the only
>>>> one in this case).
>>
>> This LED is on the access point, so it should have this affiliation
>> somehow represented in the name.
>>
>>> ...and I guess if you have single LED it will be used for more than
>>> "is AP active". IOW it will likely to be more similar to "status" than
>>> "wlan-ap".
>>
>> IMO if a LED is on some specific device, then it should be reflected
>> in the "function" section of the LED name. It facilitates locating in
>> physically. If usersapce wants to change its purpose it is free to do
>> so. e.g. via triggers. But it will not affect the LED name.
>>
> 
> This looks like a strongly opinion based discussion. Currently it's only
> relevant for the name in the examble in the dt-binding document. Isn't
> it completely irrelevant what I use there? The controller could be used
> on any device, couldn't it?
> 
> Regarding your argument toward naming (maybe relevant when I add it to
> the device tree files in OpenWRT): Would that mean that if a
> hypothetical server has one LED to show some arbitrary system states it
> should be named "green:server" instead of "green:status" because it is
> on a specific device (server in that case)?
> 
> I would expect a LED called "wlan-ap" to show the status of the WLAN.
> Like many small WLAN access points, the airCube has multiple ports. So
> it could be used as a generic router with WLAN switched off too. In that
> case "wlan-ap" wouldn't really fit the function of the LED.
> 
> Like I said: Ubiquiti uses the LED in the original software to show some
> system events like "I'm finished booting" (steady brightness) or "I'm
> currently upgrading" (blinking pattern).

OK, I've misinterpreted something here. Let's have "white:status"
in the example.

-- 
Best regards,
Jacek Anaszewski
