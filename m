Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7C3F61A40B
	for <lists+linux-leds@lfdr.de>; Fri, 10 May 2019 22:42:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727860AbfEJUmt (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 10 May 2019 16:42:49 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:42610 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727676AbfEJUms (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 10 May 2019 16:42:48 -0400
Received: by mail-lf1-f68.google.com with SMTP id w23so5040902lfc.9;
        Fri, 10 May 2019 13:42:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ycaP3bValOFQShvGyJb2yjexwS2UlTwBL/bcOafrar0=;
        b=XV69E2bQPQTvC2/LNl/c6s5MYRPSMZ+Y35jbidwjx/Ee3BLUXRAMgsatOJXU6qIMBR
         A6be4WeWepBn0ybXsIg8ecO7xUSg/neRFk4R30LULwHzOdO7yj6+n4yqkA/AOaSXXtNU
         DG9NevVkr+qqc/W5Q2jxt7mRXfzyS4gDylAmD91HLiGHIHfe7gSHE3kMcJEcl0zHjBbM
         562JIcX5EKI/fi/Wl3c6xgjapmdGUxEvSefHrhw6jVIuQF4PIE08/AWJOwGcfDrP1zZU
         lVnBvxvsMcJD3axSouY/Xga3hc+OksR/mGTg5V0ZDTjVxCDrUp71kjbsZwLqLBlcCB9D
         3aEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ycaP3bValOFQShvGyJb2yjexwS2UlTwBL/bcOafrar0=;
        b=Mj0H+seTeGzgi/WrWggl51ONiG0X5GycPBzIH1/R7Er72NMqS+K8e7YwuPvuLr4Svw
         tP0LsPG21A7sOTG9xBvckKse/mENC3jpnt4Rjwm8AROo61t6RlYwASZ1LXXMapMbaMO5
         /qV8pTV+8jMvR4CBgIWqqpWUGWixMW6v6GFMpMLyUlirBEMbIj1oVaywiMTySuRafM7x
         P1tUYyjiPRXWCJstZl3HxIMnhss4grUrKmtPVOhGz9XTacZ32lJpAJcILtRIMXZTALqa
         cVBGM3vLGUS+1i6JiVx6c9arjocOGDBgOvfXe9cGeI+YcevaGG0zdzO6nOUN6A9zF5SM
         rgJQ==
X-Gm-Message-State: APjAAAWnn90iXazlnWIeHAfmL/JxwvyvxrGWFYT0efXic996NoBegaf1
        C0hXFPRLxjQ0OeGsSRzQcPA=
X-Google-Smtp-Source: APXvYqxSEP1i0RENZHWSaObSb2Fn/lx8u7R0HJZ33ZyL3AExRQSVcBjO24ScjizmDxv1X/2fla6UzA==
X-Received: by 2002:ac2:4186:: with SMTP id z6mr6922459lfh.50.1557520965846;
        Fri, 10 May 2019 13:42:45 -0700 (PDT)
Received: from [192.168.1.19] (bgp193.neoplus.adsl.tpnet.pl. [83.28.79.193])
        by smtp.gmail.com with ESMTPSA id v26sm1767627lja.60.2019.05.10.13.42.44
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 10 May 2019 13:42:45 -0700 (PDT)
Subject: Re: [PATCH v3 1/2] dt-bindings: leds: Add binding for spi-byte LED.
To:     Christian Mauderer <oss@c-mauderer.de>, Pavel Machek <pavel@ucw.cz>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        devicetree@vger.kernel.org, Dan Murphy <dmurphy@ti.com>,
        Mark Rutland <mark.rutland@arm.com>
References: <20190505200022.32209-1-oss@c-mauderer.de>
 <CAL_JsqKmKzSw2-mfmBbhpyY=Ku6H7cE2KZrgkcPD7kAS_GqbFw@mail.gmail.com>
 <20190506162848.GA9522@amd>
 <CAL_JsqJerwvjghnuiwndE9Kp_qX5ef-aSa5JcdUAoE6R6YYuYA@mail.gmail.com>
 <54199d69-67a9-eb9d-e46d-b3ea43e2e7a3@c-mauderer.de>
 <20190506202511.GA4979@amd>
 <faba9d62-c650-5be8-a9c2-645be10dab6d@c-mauderer.de>
 <c10de8fe-5955-da5f-d197-cda9a0d5452f@c-mauderer.de>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <ccddfde6-e60c-605c-beb4-9b89e8b81be9@gmail.com>
Date:   Fri, 10 May 2019 22:42:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <c10de8fe-5955-da5f-d197-cda9a0d5452f@c-mauderer.de>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Christian,

On 5/10/19 9:50 PM, Christian Mauderer wrote:
> On 07/05/2019 11:52, Christian Mauderer wrote:
>> On 06/05/2019 22:25, Pavel Machek wrote:
>>> Hi!
>>>
>>>>>> Ok, I'm afraid I caused this. What should the compatible be, then?
>>>>>
>>>>> Knowing nothing about the h/w other than the above description:
>>>>> ubiquiti,aircube-leds
>>>>>
>>>>> Not sure if that's a registered or correct vendor prefix though.
>>>>>
>>>>> Rob
>>>>>
>>>>
>>>> Where would such a vendor prefix be registered? Does that mean that only
>>>> the vendor is allowed to use it? In that case: How would a reverse
>>>> engineered prefix look like?
>>>
>>> You can use it, too. It is in
>>> Documentation/devicetree/bindings/vendor-prefixes.txt :
>>>
>>> ubnt    Ubiquiti Networks
>>>
>>> So you can probably use ubnt, prefix.
>>>
>>>> (still with some missing parts like U-Boot) about two weeks later. I had
>>>> a look at it and they are not using a device tree. So there is no
>>>> "official" string that I could deduce from that archive.
>>>
>>> Mainline is the master. You are more "official" than them ;-).
>>> 									Pavel
>>>
>>
>> Hello
>>
>> let me summarize the direction before I create a v4:
>>
>> Rob Herring suggested "ubnt,acb-spi-led" for the binding name in his
>> Mail from 06.05.2019 17:59 UTC. If no one objects, I'll use that.
>>
>> With the more specific name I'll remove the off-value and max-value from
>> the device tree. Instead I'll create some look up table in the driver.
>> based on the name or go back to the defines like in the v1 patch. What
>> kind of solution would be preferable depends on the next question:
>>
>> How should I name the driver? Should I use a device specific name like
>> in v1 again (most likely now acb-spi-led)? That would allow to
>> potentially add a hardware supported blinking in that driver. The
>> alternative would be the more generic name that it has now
>> (leds-spi-byte) without any plans to add the blinking but it could be
>> potentially used for example for a digital potentiometer based
>> brightness setting.
>>
>> Note that I didn't really had planned to implement the blinking support
>> because I don't have a use case for it. So it would be either a feature
>> that I would add because someone insists. Or it could be added in the
>> future by a user who wants that feature (maybe Ubiquiti when they
>> upgrade their kernel?).
>>
>> If it is a required feature for that driver: Please note that although
>> of course I would do some basic tests during development it would be a
>> mostly unused and therefore untested feature.
>>
>> Best regards
>>
>> Christian
>>
> 
> Hello,
> 
> sorry for repeating my question. I assume I wrote to much text hiding
> it: How should I name the driver?
> 
> The name for the binding is clear (ubnt,acb-spi-led). Only the driver is
> left (keep leds-spi-byte or rename to leds-ubnt-acb-spi or something else).

Why leds-spi-byte name would prevent addition of blink support? It can
be always added basing on OF compatible. If it is to be generic SPI
byte driver, then I'd use leds-spi-byte. Actually also the things
like allowed brightness levels could be determined basing on that,
and not in device tree, but in the driver.

Please compare how e.g. drivers/leds/leds-is31fl32xx.c accomplishes
that.

-- 
Best regards,
Jacek Anaszewski
