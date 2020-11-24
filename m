Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E09A2C3323
	for <lists+linux-leds@lfdr.de>; Tue, 24 Nov 2020 22:39:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732663AbgKXVib (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 24 Nov 2020 16:38:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731491AbgKXVia (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 24 Nov 2020 16:38:30 -0500
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2A9AC061A4D;
        Tue, 24 Nov 2020 13:38:29 -0800 (PST)
Received: by mail-ej1-x641.google.com with SMTP id mc24so63908ejb.6;
        Tue, 24 Nov 2020 13:38:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=iQio4Ne00oWRLO53kOiJ6PJC/Dr9Xmg8gf3qp82R6SI=;
        b=tfyNznt7z8kE5BWQGQcZEExW/qZBtg4t3865yVSNR8vlIDnL1AzvjhxYVTFSC2Pc5y
         ytZWCs+5+/FYVzg+R+hxN8CRV9eACwQPq3V6G+RQgUEebVloawO6RPLfId+zXOddXeXK
         4W42xKjJ9eDsI2K5N6LczjlBHdNAGAZysnbLJ0KTXyQp9rTIClSDVvb6WOm6qbHPUt3j
         xZNNYJRLqoxxgVM2Ob7vVBgdd1EPCQt80UXlRUDrSxpXnjbWafUobGyngEknLVQCCjGb
         NCOP8cG5PaWbhpUy33aukbnO32PkOFhURyXDLDoI6TyvRIbbdm6e81QwdPC/YdyeVZDK
         U1Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=iQio4Ne00oWRLO53kOiJ6PJC/Dr9Xmg8gf3qp82R6SI=;
        b=VvjvQIoQ50ayLHhB5HxpB6ycTaI8L0suoC/sUrywcJB+cbiqkSUw8pipaXF4HX6+TK
         l5wL0PRVkt1siPHj47XiaDmhU4qbpL+mH6wscuROLsT33hluW7OhWElJz67W/bcuWxlQ
         yZ9Gzv3ktR6SoXJwqbg+PRwJuC04cygHFavct0N66ELiJhgyyT9qL19t3dT0M8Zubh0o
         CLOagWpWpRzklWWwpwMFd1ntmm65YKGurgs8kdmqK4MufEGDVWljp/Onrgcf0JbObEg+
         Zli6GSmcc9vxQIbMzgNQGm6Al+5h/8rNk4W9lwSwJZaNLwLXCO7VmpJuQ6DNqkULlMN0
         EkwA==
X-Gm-Message-State: AOAM533nSqfWNvtWIGxROXr7p1DIREIWGOrosrBIZNa2LGgfmN9TcV9W
        +hseSIFz23Qfmmrf2HN/hLU=
X-Google-Smtp-Source: ABdhPJykTb408PecV0yt6X9lQn51yoRJmiwXBgwIkczHmEgrGAEDMshHi1tKnOetfrRhVUD5rJRkpw==
X-Received: by 2002:a17:906:4a91:: with SMTP id x17mr411974eju.126.1606253908473;
        Tue, 24 Nov 2020 13:38:28 -0800 (PST)
Received: from ?IPv6:2a01:110f:b59:fd00:b507:ec4b:7acf:a836? ([2a01:110f:b59:fd00:b507:ec4b:7acf:a836])
        by smtp.gmail.com with ESMTPSA id k12sm122131ejz.48.2020.11.24.13.38.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2020 13:38:27 -0800 (PST)
Subject: Re: [PATCH v7 2/5] dt-bindings: leds: Add LED_COLOR_ID_MOONLIGHT
 definitions
To:     Gene Chen <gene.chen.richtek@gmail.com>
Cc:     Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Dan Murphy <dmurphy@ti.com>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Gene Chen <gene_chen@richtek.com>, Wilma.Wu@mediatek.com,
        shufan_lee@richtek.com, cy_huang@richtek.com,
        benjamin.chao@mediatek.com
References: <1605696462-391-1-git-send-email-gene.chen.richtek@gmail.com>
 <1605696462-391-3-git-send-email-gene.chen.richtek@gmail.com>
 <20201118213712.GA22371@amd> <6068b1e3-a4c8-6c7d-d33d-f2238e905e43@gmail.com>
 <20201119215721.GA5337@amd> <0700c32d-643b-fedb-06f0-21547b18205d@gmail.com>
 <CAE+NS363BpytNGZzfZHLa7KLKL8gjGj14oNvRi3oaH9KT79REg@mail.gmail.com>
 <25fef924-634d-7f60-7e1d-0290d1701fab@gmail.com>
 <CAE+NS34vDejgf8Ydfer_rY25qaG-DQQ5H-9-Er+Shz0=UF-EzA@mail.gmail.com>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <31804c28-fa2b-9b1d-2d10-63de70d2fbd8@gmail.com>
Date:   Tue, 24 Nov 2020 22:38:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <CAE+NS34vDejgf8Ydfer_rY25qaG-DQQ5H-9-Er+Shz0=UF-EzA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 11/24/20 8:33 AM, Gene Chen wrote:
> Jacek Anaszewski <jacek.anaszewski@gmail.com> 於 2020年11月24日 週二 上午4:52寫道：
>>
>> On 11/23/20 4:00 AM, Gene Chen wrote:
>>> Jacek Anaszewski <jacek.anaszewski@gmail.com> 於 2020年11月20日 週五 上午6:26寫道：
>>>>
>>>> On 11/19/20 10:57 PM, Pavel Machek wrote:
>>>>> On Thu 2020-11-19 22:03:14, Jacek Anaszewski wrote:
>>>>>> Hi Pavel, Gene,
>>>>>>
>>>>>> On 11/18/20 10:37 PM, Pavel Machek wrote:
>>>>>>> Hi!
>>>>>>>
>>>>>>>> From: Gene Chen <gene_chen@richtek.com>
>>>>>>>>
>>>>>>>> Add LED_COLOR_ID_MOONLIGHT definitions
>>>>>>>
>>>>>>> Why is moonlight a color? Camera flashes are usually white, no?
>>>>>>>
>>>>>>> At least it needs a comment...
>>>>>>
>>>>>> That's my fault, In fact I should have asked about adding
>>>>>> LED_FUNCTION_MOONLIGHT, it was evidently too late for me that evening...
>>>>>
>>>>> Aha, that makes more sense.
>>>>>
>>>>> But please let's call it "torch" if we do that, as that is already
>>>>> used in kernel sources... and probably in the interface, too:
>>>>
>>>> I'd say that torch is something different that moonlight,
>>>> but we would need more input from Gene to learn more about
>>>> the nature of light emitted by ML LED on his device.
>>>>
>>>> Please note that torch is usually meant as the other mode of
>>>> flash LED (sometimes it is called "movie mode"), which is already
>>>> handled by brightness file of LED class flash device (i.e. its LED class
>>>> subset), and which also maps to v4l2-flash TORCH mode.
>>>>
>>>
>>> It's used to front camera fill light.
>>> More brightness than screen backlight, and more soft light than flash.
>>> I think LED_ID_COLOR_WHITE is okay.
>>
>> So why in v6 you assigned LED_COLOR_ID_AMBER to it?
>>
>> Regardless of that, now we're talking about LED function - you chose
>> LED_FUNCTION_INDICATOR for it, but inferring from your above description
>> - it certainly doesn't fit here.
>>
>> Also register names, containing part "ML" indicate that this LED's
>> intended function is moonlinght, which your description somehow
>> corroborates.
>>
>> Moonlight LEDs become ubiquitous nowadays so sooner or later we will
>> need to add this function anyway [0].
>>
>> [0]
>> https://landscapelightingoakville.com/what-is-moon-lighting-and-why-does-it-remain-so-popular/
>>
> 
> We use term "Moonlight" as reference says
> "When you are trying to imitate moonlight you need to use low voltage,
> softer lighting. You don’t want something that’s too bright"
> which is focus on brightness instead of color.
> 
> So we surpose Moonlight can be white or amber.
> 
> Should I add LED_FUNCTION_MOONLIGHT and set LED_COLOR_ID_WHITE?

Regarding the function - yes, the reference backs that up.
Regarding the color - if you feel that it properly describes the
LED color then go for it.

-- 
Best regards,
Jacek Anaszewski
