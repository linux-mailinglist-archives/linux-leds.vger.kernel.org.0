Return-Path: <linux-leds+bounces-568-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 77846828F2C
	for <lists+linux-leds@lfdr.de>; Tue,  9 Jan 2024 22:49:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1FF542867C9
	for <lists+linux-leds@lfdr.de>; Tue,  9 Jan 2024 21:49:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B29A3DB93;
	Tue,  9 Jan 2024 21:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bTBjmAbW"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B684B3F8C4;
	Tue,  9 Jan 2024 21:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-55822753823so1039569a12.2;
        Tue, 09 Jan 2024 13:48:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704836933; x=1705441733; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2kUybH711d4IPyZvjwPOkzBxksJPg1Yxrdr0etwEOL8=;
        b=bTBjmAbWPOr8CEEOtP30uMw7f82NHKRHs81oh0efqNN5hSmNN6SIuIUR75HdHWLRfr
         UjA03jAoYX6Z4UTrAYh1ZquSZbJwyjib8qLcjJGVSe+JrpoPOF1QfVPr5ubA1W4Ihsfc
         jbV8FHdM/zvbO7THo3pMi+MEEDabDz3I8tL1hm7gtPjbjBxXVuVZLe2LjbA9flZU/5K9
         8Jg7YMvOADD/OlEVN4GtRPszhHLkBE2GlXGcWSv0BNJQ7Bn+qSOowjdEfivnITssvhkH
         U6fE/pZzxMSBNt1eJUyh+u0uC8PY6aAAgSx7sRxig2SRzZJhnKhJuH9QtrbEFUny4LmU
         NSow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704836933; x=1705441733;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2kUybH711d4IPyZvjwPOkzBxksJPg1Yxrdr0etwEOL8=;
        b=ZYn5TTQEpCACWqE+yByuGgVbGrWsuxNd+zWRsBzGLx73vcP0AL4XvDKWdmzwoLbgah
         MYenBvEVYsfpmf6M7XMxz6AU0UwWOfTsU0tgEsU2Wt7YprKfcrNlN+8oTMf/a4F5fKLJ
         i/GjFwSMql6ySj6v5OOQ9NNnu74fKTw+ny/MZS9MzNCQoB9RybNjKqLzjS1adsqW685W
         yPMwKmjtJQpTVRnRf/UPGss4MddstLx9jNN7IYbWtisptjo5wHSgLx54GcvSJPhJz3xs
         I1UZHHBsYiNudi5kTJytfLcMBwivEtZW2KCvueoErqDK24UhDY9WGIVW3QnYzY7HPNfn
         vhsw==
X-Gm-Message-State: AOJu0YzaYalkvaP+O88NE+eqK9tO570EgVo0btczkemMT+j/uAHGA+rU
	VVjilRpaHyIx36zBF3as60Y9ioCYvoI=
X-Google-Smtp-Source: AGHT+IEaKiLetGeveAMhvVJZiA0vT3xzrxNCiEOlPcs0olr69OoZ6oILuaIcy8mgQZuoZgqPOvBgfw==
X-Received: by 2002:a50:9e85:0:b0:553:6a7c:4c8 with SMTP id a5-20020a509e85000000b005536a7c04c8mr18013edf.53.1704836932688;
        Tue, 09 Jan 2024 13:48:52 -0800 (PST)
Received: from [192.168.26.149] (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.googlemail.com with ESMTPSA id g10-20020aa7c58a000000b005546ba152f4sm1345437edq.71.2024.01.09.13.48.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jan 2024 13:48:52 -0800 (PST)
Message-ID: <62fdd030-7eb0-4658-969a-3bbddfa3334f@gmail.com>
Date: Tue, 9 Jan 2024 22:48:50 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH dt-schema] schemas: chosen: Add OpenWrt LEDs properties
 for system states
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>
Cc: linux-leds@vger.kernel.org, openwrt-devel@lists.openwrt.org,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
References: <20240109082312.9989-1-zajec5@gmail.com>
 <1b90c50c-0a09-4627-83cd-1794dae7ed9b@linaro.org>
 <69966efa-21ab-4a38-ad06-61e7e2e5b6d3@gmail.com>
 <987fe3e7-adc8-489f-867b-2d3aaa004d94@linaro.org>
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
In-Reply-To: <987fe3e7-adc8-489f-867b-2d3aaa004d94@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 9.01.2024 20:10, Krzysztof Kozlowski wrote:
> On 09/01/2024 17:38, Rafał Miłecki wrote:
>> On 9.01.2024 10:02, Krzysztof Kozlowski wrote:
>>> On 09/01/2024 09:23, Rafał Miłecki wrote:
>>>> From: Rafał Miłecki <rafal@milecki.pl>
>>>>
>>>> OpenWrt project provides downstream support for thousands of embedded
>>>> home network devices. Its custom requirement for DT is to provide info
>>>> about LEDs roles. Currently it does it by using custom non-documented
>>>> aliases. While formally valid (aliases.yaml doesn't limit names or
>>>> purposes of aliases) it's quite a loose solution.
>>>>
>>>> Document 4 precise "chosen" biding properties with clearly documented
>>>> OpenWrt usage. This will allow upstreaming tons of DTS files that noone
>>>
>>> typo: none
>>
>> typo: no one ;)
>>
>>>> cared about so far as those would need to be patched downstream anyway.
>>>
>>>   From all this description I understand why you want to add it, but I
>>> don't understand what are you exactly adding and how it is being used by
>>> the users/OS.
>>
>> In OpenWrt we have user space script that reads LED full path:
>> cat /proc/device-tree/aliases/led-<foo>
>>
>> And then sets LED to state matching current boot stage:
>> echo 1 > /sys/class/leds/<bar>/brightness
> 
> OK, it's nowhere close to a hardware property. You now instruct OS what
> to do. It's software or software policy.

That's the reason I targeted "chosen" node which seemed the best option
given it does not describe real hardware.


>>>> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
>>>> ---
>>>> A few weeks ago I was seeking for a help regarding OpenWrt's need for
>>>> specifing LEDs roles in DT, see:
>>>>
>>>> Describing LEDs roles in device tree?
>>>> https://lore.kernel.org/linux-devicetree/ee912a89-4fd7-43c3-a79b-16659a035fe1@gmail.com/T/#u
>>>>
>>>> I DON'T think OpenWrt's current solution with aliases is good enough:
>>>> * It's not clearly documented
>>>> * It may vary from other projects usa case
>>>> * It may be refused by random maintainers I think
>>>>
>>>> I decided to suggest 4 OpenWrt-prefixed properties for "chosen". I'm
>>>> hoping this small custom binding is sth we could go with. I'm really
>>>> looking forward to upstreaming OpenWrt's downstream DTS files so other
>>>> projects (e.g. Buildroot) can use them.
>>>>
>>>> If you have any better fitting solution in mind please let me know. I
>>>> should be fine with anything that lets me solve this downstream mess
>>>> situation.
>>>>
>>>>    dtschema/schemas/chosen.yaml | 9 +++++++++
>>>>    1 file changed, 9 insertions(+)
>>>>
>>>> diff --git a/dtschema/schemas/chosen.yaml b/dtschema/schemas/chosen.yaml
>>>> index 6d5c3f1..96d0db7 100644
>>>> --- a/dtschema/schemas/chosen.yaml
>>>> +++ b/dtschema/schemas/chosen.yaml
>>>> @@ -264,4 +264,13 @@ properties:
>>>>    patternProperties:
>>>>      "^framebuffer": true
>>>>    
>>>> +  "^openwrt,led-(boot|failsafe|running|upgrade)$":
>>>> +    $ref: types.yaml#/definitions/string
>>>> +    description:
>>>> +      OpenWrt choice of LED for a given role.
>>>
>>> Neither this explains it. What is "OpenWrt choice"? Choice like what?
>>> What are the valid choices?
>>>
>>>> Value must be a full path (encoded
>>>> +      as a string) to a relevant LED node.
>>>
>>> What do you mean by full path? DT node path? Then no, use phandles.
>>>
>>> Anyway, we have existing properties for this - LED functions. Just
>>> choose LED with given function (from sysfs) and you are done. If
>>> function is missing in the header: feel free to go, least for me.
>>
>> In "Describing LEDs roles in device tree?" e-mail I wrote:
>>
>> "
>> Please note that "function" on its own is not sufficient as multiple
>> LEDs my share the same function name but its meaning may vary depending
>> on color.
>> "
>>
>> Let me elaborate here.
>>
>> Values of "function" property match LEDs descriptions (usually it's a
>> physical label). That is OK and makes sense but doesn't allow OpenWrt to
>> automatically pick proper LED to use during given boot stage.
>>
>> Some devices may have multiple color of a the same LED function. OpenWrt
>> developer needs to choose which color to use for failsafe more and which
>> boot fully booted state (and others too).
>>
>> Devices also differ in available LEDs by their functions. Some may have
>> LED_FUNCTION_POWER that OpenWrt needs to use. Some may have
>> LED_FUNCTION_STATUS. Or both. There are some more (less common)
>> functions like LED_FUNCTION_ACTIVITY.
>>
>> We failed at OpenWrt to develop a single generic script to rule all
>> devices and all their LEDs combinations. We ended up with developers
>> *choosing* what LED to use for a given system state.
> 
> So this all is because you want to write easier OS. That's abuse of
> Devicetree. You can define which LEDs have different meaning, e.g.
> physical label or icon attached to them. That's a hardware property.
> 
> You can also define how pieces of hardware are wired together and create
> entire system, e.g. connect one LED to disk activity.
> 
> However what you are proposing here is to dynamically configure one,
> given OS. I don't think it is suitable.
> 
> The problem of OS to nicely figure out which LED to blink when, is not a
> problem of Devicetree. It is a problem of OS and its configuration.

I'd say it's a thin line. Or just a grey idea as Geert said.

What is a LED "function" after all? How exactly are:
LED_FUNCTION_STATUS
LED_FUNCTION_ACTIVITY
LED_FUNCTION_BOOT
LED_FUNCTION_HEARTBEAT
different from each other?

I can imagine OpenWrt seeing a different role for LED_FUNCTION_ACTIVITY
or LED_FUNCTION_BOOT than other projects.

Proposed properties "openwrt,led-<foo>" don't exactly describe hardware
per se but are still designed to deal with hardware differences.

 From a practical point of view it's much easier to put such OS
configuration info in DT since it's closely related to LEDs defined
there and it helps a lot with maintenance. If at some point we change
DT due to previous mistake (e.g. we fix LED color from amber to red)
that would mean breaking user space of Linux system (changing LED name).
Having DT binding for LEDs roles would prevent that.

I was hoping that vendor prefixed "chosen" properties may somehow get
accepted as a reasonable solution for dealing with hardware differences
even if they don't strictly describe hardware itself.

Is there any other DT solution you think would be better and could be
accepted?
Given my hesitation about "function" meaning would something like
openwrt,function = "(boot|failsafe|running|upgrade)"
be any better?
Any other ideas?

