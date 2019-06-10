Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 292083BA45
	for <lists+linux-leds@lfdr.de>; Mon, 10 Jun 2019 19:01:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727997AbfFJRBj (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 10 Jun 2019 13:01:39 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:37608 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727914AbfFJRBj (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 10 Jun 2019 13:01:39 -0400
Received: by mail-wr1-f65.google.com with SMTP id v14so9944531wrr.4
        for <linux-leds@vger.kernel.org>; Mon, 10 Jun 2019 10:01:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=TUB576LgwyE3wSX2mfs+fOvpIiYD35l6I6Wrmmjfh/4=;
        b=N/SqaqBXcSCJCjUTtLo20OQERbyiMNrgp3+XihE80mvLh+jmfw35fTNPaIcViY9hst
         LW8O84sF88iPuKCpfp7Nxrr/AznnWCiaOZQBlCY5CuoKCV3LKIxg/KEc4TR7lWt1F7/E
         y32kZ7dpmYVrESX5t61dEOGW/6IUsUy58T9yKZcgB5wkm2spgcuefI6U6SWX9DNRoy52
         Ig2+5jWLSsLlh8czWKnYxz/XPkfM/37ygbfs2/po19u8mYlTvtQT3Z7WPISiqVKuhmAM
         xyAddNCghcp7UJfNGvXJcxg6vXkAaT2jiULTujLlAt501zhDa37FiDqKjHj264fnCGiS
         /WyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=TUB576LgwyE3wSX2mfs+fOvpIiYD35l6I6Wrmmjfh/4=;
        b=dnjJe0XqXzAjMoAuH0zuswhNrki1J5rou21/UF7lx1xqxr/K9xcwL+tg+FIScA2bwF
         CDeVChth6PvHuosMrOH+Sk6VeGWYHO7XKhf9AhDIxVghba924ZEkY92LrEX/oEUbOaF6
         cQq+NDYj2nXtR2GakP25x5MbHzjsyAIknUf55JlpZsd9M7SfWumZqjSZTF8TTVHPffyC
         KL2wV2UeQxgolkx7rP59RGgHwRU5ZhAWufLtVwje5Ok7KV7eEpc/LfyWHghElAJ9KVqG
         rp+oyG/3WzlmBakOttk7alWod9C4QaNTtZ6tLHyfCYaiDqfbpnZD3wPXdOv3bfO6ZORQ
         yyGw==
X-Gm-Message-State: APjAAAWtFMn5Pu9J0rBv0BtKxlT+Da6bPBA8fReQGSkwRpXCchEUpQWN
        AUUIPapztEQYUnWnsLCrpS+Wl2Q0
X-Google-Smtp-Source: APXvYqxTDrp39qcfT4vpXT8ZLXyF8iqRPjaaMn5Slb9sFVSTDWHPeOfZjd/wOqRGFRtqhq14tWwwSg==
X-Received: by 2002:adf:ef09:: with SMTP id e9mr31907796wro.79.1560186096442;
        Mon, 10 Jun 2019 10:01:36 -0700 (PDT)
Received: from [192.168.1.17] (chq222.neoplus.adsl.tpnet.pl. [83.31.14.222])
        by smtp.gmail.com with ESMTPSA id o15sm14361554wrw.42.2019.06.10.10.01.34
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 10 Jun 2019 10:01:35 -0700 (PDT)
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
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <0c61035a-f2dc-7d9e-a75c-98f22cb839ee@gmail.com>
Date:   Mon, 10 Jun 2019 19:01:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <c4a150f4-529d-870d-7dd9-218eee4fac33@kaa.org.ua>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 6/9/19 10:23 PM, Oleh Kravchenko wrote:
> 
> 
> 09.06.19 22:31, Jacek Anaszewski пише:
>> Oleh,
>>
>> On 6/9/19 8:13 PM, Oleh Kravchenko wrote:
>>> Jacek,
>>>
>>> 09.06.19 15:24, Jacek Anaszewski пише:
>>>> Hi Oleh,
>>>>
>>>> On 6/8/19 12:42 AM, Oleh Kravchenko wrote:
>>>>
>>>> You want to set timer trigger (first turn it on in the config):
>>>>
>>>> echo "timer" > trigger
>>>>
>>>> After that two files appear: delay_on and delay_off.
>>>>
>>>> ledtrig-timer uses blink_set op for setting up the hw blinking.
>>>
>>> Thank you for explanation.
>>>
>>> I just want to clerify - for now LEDs board has 2 from 3 LEDs with effect function.
>>>
>>> 1. Screen frame led is just blinking, so blink_set() is fit well to this.
>>> 2. Pipe led actually consist from 3 leds and when effect is enabled next pattern is used:
>>>
>>>         ^
>>>         |
>>> LED1  >   OFF  ON   ON   ON
>>>         |
>>> LED2  >   OFF  OFF  ON   ON
>>>         |
>>> LED3  >   OFF  OFF  OFF  ON
>>>         |
>>>         +----^----^----^----^----> time
>>
>> Pattern trigger applies to a single LED so it won't fit for this
>> pattern.
>>
>> Currently we don't support patterns spanning on multiple LEDs,
>> so you would have to come up with your own solution.
>>
>> What I can recommend is a trigger that would be created by your driver
>> and would activate this sequence.
>>
> 
> How to be sure this trigger can be applied only to Pipe LED?

After thinking a bit more of it I came to the conclusion that instead
of a trigger the driver should create its own specific sysfs files for 
controlling the effect.

Some time ago we had a proposal of generic support for hardware triggers
that this one could make use of, but the idea didn't seem to introduce
much gain in comparison to the driver specific files.

So, you could have "effect_on" file which would accept "true" or "false"
(other API name proposals are welcome), that would be created by
every LED class device created by the driver.

The effect will be activated when all three LEDs have the effect_on
file value set to "true".

-- 
Best regards,
Jacek Anaszewski
