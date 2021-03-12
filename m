Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B438D3388DB
	for <lists+linux-leds@lfdr.de>; Fri, 12 Mar 2021 10:43:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232809AbhCLJms (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 12 Mar 2021 04:42:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232822AbhCLJmT (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 12 Mar 2021 04:42:19 -0500
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B039C061574;
        Fri, 12 Mar 2021 01:42:19 -0800 (PST)
Received: by mail-lj1-x22e.google.com with SMTP id f16so5922817ljm.1;
        Fri, 12 Mar 2021 01:42:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=6rum3JkinS0VLPRAC0gLr71Y06GoJpC2dRJmB8yx8fw=;
        b=Ruax6XRZ0EgDiWtOmpNunoqEZCjzUNfzo+lQZLwTCzC0q/gm+H2kf3MlyuTFq+ChMm
         kxMEPVJWQKlspFsz9RyDHsjp8XTCCFATDAE5G5SMGdJUBIFH+uZ2a+PPXsonBdabzcbT
         TuD8fee6Qn6H4GEV5OxwIUJOa0pW434WXxw5LP6unrjngv0cvYa1R3QUjIy/qten39WS
         0DLNCh+X/UZqs4lNIWr6mANv88vlwmv9//30Ex3RDiV6GagNyZ4zwSmbzKBTPp7mhI0f
         ihuQk+sPdSsjZQrkaNVLBHPTBY7mKwW0wMx+seoF1+qf/M8atopcvu+d5kgR7NrctTLS
         WSiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=6rum3JkinS0VLPRAC0gLr71Y06GoJpC2dRJmB8yx8fw=;
        b=XZlE3rVAIsypnKhwHLpe9bN6Q6rW2+iSEahro1/j01WvAct6z+FenBlF1mLJdCaCEQ
         5GokzDhIx8vVDTA7PYyzIh7/GPVtj8EVCGV04QBg2C6R3KW6MsbT2eCsKfPS9+18v4dZ
         lt5C0t9Yf0FW01fzAvhwcNuZAqe5/q7U11ZPiGCjoIXbZJkMcWWgFdfAQ3EgBdZXqdPF
         /hv+dORxvIU6G6R25VQ39jy4W3J4zE6aNevMyspvKfkQ70x5FUwkRCU7d0XMc0yQjJV2
         zMT6JWYBT+PY4ypzNBtvX/zYo8h0gdsbw0t6A4a4WsVhR3X7gBWaqT3ApBEAC0yqmNXN
         F4iQ==
X-Gm-Message-State: AOAM531wow6UNydNq+rg1a1fISU0PZRTwikmKWvtmXCenCW7kkUatjxt
        23FMg6iPcmoVZxFj3K2NsiU=
X-Google-Smtp-Source: ABdhPJwPfPo3yqwZXd0BvR+fgBE8UXSICKOCSspcdQun537xHWPFLg3C15ZGVrpCP7kv0zIWWiBE4w==
X-Received: by 2002:a2e:9bd6:: with SMTP id w22mr1853192ljj.407.1615542137836;
        Fri, 12 Mar 2021 01:42:17 -0800 (PST)
Received: from localhost.localdomain (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.googlemail.com with ESMTPSA id y8sm1956742ljk.9.2021.03.12.01.42.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Mar 2021 01:42:17 -0800 (PST)
Subject: Re: [PATCH] dt-bindings: leds: leds-gpio: fix & extend node regex
To:     Marek Behun <marek.behun@nic.cz>, Rob Herring <robh+dt@kernel.org>
Cc:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        Florian Fainelli <f.fainelli@gmail.com>,
        =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
References: <20210310070025.9150-1-zajec5@gmail.com>
 <20210312084414.7e4822bb@nic.cz>
 <62b556d5-0ebd-0923-69c6-a2fa3ede73b2@gmail.com>
 <20210312092336.5cbd10cb@nic.cz>
 <f9fc4dce-5b9c-5aff-e317-f2daabb73931@gmail.com>
 <20210312102620.1307e7de@nic.cz>
From:   =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Message-ID: <cbbc4bc6-8651-937d-8ab2-9818f6bc9f53@gmail.com>
Date:   Fri, 12 Mar 2021 10:42:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210312102620.1307e7de@nic.cz>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

[Rob: please kindly comment on nodes numbering]

On 12.03.2021 10:26, Marek Behun wrote:
> On Fri, 12 Mar 2021 10:12:26 +0100
> Rafał Miłecki <zajec5@gmail.com> wrote:
> 
>> On 12.03.2021 09:23, Marek Behun wrote:
>>> On Fri, 12 Mar 2021 08:52:16 +0100
>>> Rafał Miłecki <zajec5@gmail.com> wrote:
>>>    
>>>> On 12.03.2021 08:44, Marek Behun wrote:
>>>>> On Wed, 10 Mar 2021 08:00:25 +0100
>>>>> Rafał Miłecki <zajec5@gmail.com> wrote:
>>>>>       
>>>>>> From: Rafał Miłecki <rafal@milecki.pl>
>>>>>>
>>>>>> The old regex allowed only 1 character to follow the "led-" prefix which
>>>>>> was most likely just an overlook. Fix it and while at it allow dashes in
>>>>>> node names. It allows more meaningful names and it helpful e.g. when
>>>>>> having the same function name with 2 different colors. For example:
>>>>>> 1. led-power-white
>>>>>> 2. led-power-blue
>>>>>>
>>>>>> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
>>>>>> ---
>>>>>>     Documentation/devicetree/bindings/leds/leds-gpio.yaml | 2 +-
>>>>>>     1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>>
>>>>>> diff --git a/Documentation/devicetree/bindings/leds/leds-gpio.yaml b/Documentation/devicetree/bindings/leds/leds-gpio.yaml
>>>>>> index 7ad2baeda0b0..ae46a43e480f 100644
>>>>>> --- a/Documentation/devicetree/bindings/leds/leds-gpio.yaml
>>>>>> +++ b/Documentation/devicetree/bindings/leds/leds-gpio.yaml
>>>>>> @@ -21,7 +21,7 @@ properties:
>>>>>>     patternProperties:
>>>>>>       # The first form is preferred, but fall back to just 'led' anywhere in the
>>>>>>       # node name to at least catch some child nodes.
>>>>>> -  "(^led-[0-9a-f]$|led)":
>>>>>> +  "(^led-[0-9a-f][0-9a-f-]*$|led)":
>>>>>
>>>>> Why not use +, like everywhere else?
>>>>>      "(^led-[0-9a-f]+$|led)"
>>>>
>>>> 1. Your regex doesn't allow dashes. I described that in commit message.
>>>
>>> Ah, I confess I did not read the commit message. My fault.
>>>    
>>>> 2. If I use one range and +, that will allow unwanted names like "led--power"
>>>
>>> But this can happen anyway. Your regex will match for example
>>> "led-deaf------beef".
>>
>> You're right. I probably was overthinking that ;)
>>
>>
>>> Moreover you give as an example names
>>>     led-power-white
>>>     led-power-blue
>>> but the regex only allows hexadecimal characters, ie
>>>     led-dead-beef
>>>     led-1f-3
>>>
>>> The idea is that the string after "led-" is a hexadecimal address.
>>> Names like
>>>     led-power-white
>>> shouldn't be used, as far as I understand.
>>
>> Oops!
>> 1. My regex was meant to be [0-9][a-z-][0-9][a-z-]+
>> 2. I totally missed that nodename should contain hex num and not a name
>>
>> My patch is based on bad binding understanding.
>>
>>
>> So as I understand it now, the point of led hex number is to enumerate
>> nodes. That way we avoid:
>> ERROR (duplicate_node_names): /leds/led: Duplicate node name
>>
>>
>> I'm just wondering if there is some cleaner solution than using those
>> led-0, led-1, led-2, led-3, led-4 (...) names.
>>
>> Would that be acceptable to use address with GPIO number? Example:
>>
>> leds {
>> 	compatible = "gpio-leds";
>> 	led@6 {
>> 		gpios = <&mpc8572 6 GPIO_ACTIVE_HIGH>;
>> 		color = <LED_COLOR_ID_RED>;
>> 	};
>> 	led@7 {
>> 		gpios = <&mpc8572 7 GPIO_ACTIVE_HIGH>;
>> 		color = <LED_COLOR_ID_GREEN>;
>> 	};
>> };
> 
> I don't know. This is a question for Rob Herring.
> But why is led-0, led-1, led-2 not good enough?
> You can still define function via the function property:
>   led-7 {
>     gpios = <&mpc8572 7 GPIO_ACTIVE_HIGH>;
>     color = <LED_COLOR_ID_GREEN>;
>     function = LED_FUNCTION_POWER;
>   };

1. I found is a bit unnatural
2. Inserting/removing single LED may result in renaming nodes

Nothing really serious, I'm just wondering if that could be slightly improved.
