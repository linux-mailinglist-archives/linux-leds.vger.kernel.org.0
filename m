Return-Path: <linux-leds+bounces-566-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 47886828D24
	for <lists+linux-leds@lfdr.de>; Tue,  9 Jan 2024 20:10:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4CBC81C21624
	for <lists+linux-leds@lfdr.de>; Tue,  9 Jan 2024 19:10:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 599223C694;
	Tue,  9 Jan 2024 19:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Cwc0DLQz"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1290A3B789
	for <linux-leds@vger.kernel.org>; Tue,  9 Jan 2024 19:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5572a9b3420so7373472a12.1
        for <linux-leds@vger.kernel.org>; Tue, 09 Jan 2024 11:10:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704827410; x=1705432210; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=38upq0ZzU1tISIrkowGeYZ8IjZE2mDSS4QnkETG2qGY=;
        b=Cwc0DLQz+5fUuyKB7lcmoFLqhhZzoeze2/5jos4lvu0gwOwWHESdnQyxw40/o+0VwR
         CzgX4mXJ95X0u0QnriOGVSnEkjtAeI5+3ZMG7aKPJoR7oYXgZX/K046EE/KTiUgI83ZI
         ToKuZIIocOTiRlTeqjyCp87OkncKY9adzSizswpAj7kAZ8YrHdL3QxsY0DAW7uUH7DV3
         J2LEabZW5S+5QGYPRAhTLC0s/W2Ud4sgQwkV8l8VPmlEQVfozl6lEJZVORnyk6MvQvQ9
         H3Z616yFiCEZCNN2LHHHE/c8lu4+QcL32DTMOCVV1YlMkQPg014zvJk6JD4wfeOphvwd
         rwvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704827410; x=1705432210;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=38upq0ZzU1tISIrkowGeYZ8IjZE2mDSS4QnkETG2qGY=;
        b=DXjX2+8HNTatrv7cLpD5strPY1jkDq19dqyi5dWAQYGD3O9QyCL5cMWl/OIn5XFWEC
         B/Gu4v9jeO3PB2KJf/LcjzdBg35Ic9RgXPmKSPFd6QoIc7yNKE+MMzzv9HREtoWrqEwP
         5HPyM4PwstiRgtxAlj+nsOZZNxtpaxmEUkRYr/t9CC8BNmcTUI9J0rLpZXIUKYopdjI+
         79TpLn0+N4GRdSs7deWBuU2qKY/g1LYUsq98eTsPUtnOb0wVyUt5RKasVeLldG6PQF59
         a4O3uOQmh28dXd8cjghDQ5xok/M5/xVEzPQolUwh/+uAysj/U26DtzUdBtULCySpG5od
         75SA==
X-Gm-Message-State: AOJu0YxTrx/PF/JtDuUxTmCjAqVVUUBFNfBV9mH5zm4QQF9a9e3VwuUR
	ELuwL7AZLCbW6pdLYTkIOG45Z1L5nzNCMA==
X-Google-Smtp-Source: AGHT+IHY53rvYCnjfCP3JID9HswV/uzfoiBe6263UhGYu8ub8K6E0F4Oi3qTfq5lk8/Lns5uAghjYg==
X-Received: by 2002:a17:907:c987:b0:a28:26e9:a13d with SMTP id uj7-20020a170907c98700b00a2826e9a13dmr945728ejc.55.1704827410302;
        Tue, 09 Jan 2024 11:10:10 -0800 (PST)
Received: from [192.168.1.20] ([178.197.223.112])
        by smtp.gmail.com with ESMTPSA id y19-20020a17090668d300b00a27a7fa8691sm1329066ejr.137.2024.01.09.11.10.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jan 2024 11:10:09 -0800 (PST)
Message-ID: <987fe3e7-adc8-489f-867b-2d3aaa004d94@linaro.org>
Date: Tue, 9 Jan 2024 20:10:07 +0100
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
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>
Cc: linux-leds@vger.kernel.org, openwrt-devel@lists.openwrt.org,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
References: <20240109082312.9989-1-zajec5@gmail.com>
 <1b90c50c-0a09-4627-83cd-1794dae7ed9b@linaro.org>
 <69966efa-21ab-4a38-ad06-61e7e2e5b6d3@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <69966efa-21ab-4a38-ad06-61e7e2e5b6d3@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 09/01/2024 17:38, Rafał Miłecki wrote:
> On 9.01.2024 10:02, Krzysztof Kozlowski wrote:
>> On 09/01/2024 09:23, Rafał Miłecki wrote:
>>> From: Rafał Miłecki <rafal@milecki.pl>
>>>
>>> OpenWrt project provides downstream support for thousands of embedded
>>> home network devices. Its custom requirement for DT is to provide info
>>> about LEDs roles. Currently it does it by using custom non-documented
>>> aliases. While formally valid (aliases.yaml doesn't limit names or
>>> purposes of aliases) it's quite a loose solution.
>>>
>>> Document 4 precise "chosen" biding properties with clearly documented
>>> OpenWrt usage. This will allow upstreaming tons of DTS files that noone
>>
>> typo: none
> 
> typo: no one ;)
> 
>>> cared about so far as those would need to be patched downstream anyway.
>>
>>  From all this description I understand why you want to add it, but I
>> don't understand what are you exactly adding and how it is being used by
>> the users/OS.
> 
> In OpenWrt we have user space script that reads LED full path:
> cat /proc/device-tree/aliases/led-<foo>
> 
> And then sets LED to state matching current boot stage:
> echo 1 > /sys/class/leds/<bar>/brightness

OK, it's nowhere close to a hardware property. You now instruct OS what
to do. It's software or software policy.

> 
> 
>>> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
>>> ---
>>> A few weeks ago I was seeking for a help regarding OpenWrt's need for
>>> specifing LEDs roles in DT, see:
>>>
>>> Describing LEDs roles in device tree?
>>> https://lore.kernel.org/linux-devicetree/ee912a89-4fd7-43c3-a79b-16659a035fe1@gmail.com/T/#u
>>>
>>> I DON'T think OpenWrt's current solution with aliases is good enough:
>>> * It's not clearly documented
>>> * It may vary from other projects usa case
>>> * It may be refused by random maintainers I think
>>>
>>> I decided to suggest 4 OpenWrt-prefixed properties for "chosen". I'm
>>> hoping this small custom binding is sth we could go with. I'm really
>>> looking forward to upstreaming OpenWrt's downstream DTS files so other
>>> projects (e.g. Buildroot) can use them.
>>>
>>> If you have any better fitting solution in mind please let me know. I
>>> should be fine with anything that lets me solve this downstream mess
>>> situation.
>>>
>>>   dtschema/schemas/chosen.yaml | 9 +++++++++
>>>   1 file changed, 9 insertions(+)
>>>
>>> diff --git a/dtschema/schemas/chosen.yaml b/dtschema/schemas/chosen.yaml
>>> index 6d5c3f1..96d0db7 100644
>>> --- a/dtschema/schemas/chosen.yaml
>>> +++ b/dtschema/schemas/chosen.yaml
>>> @@ -264,4 +264,13 @@ properties:
>>>   patternProperties:
>>>     "^framebuffer": true
>>>   
>>> +  "^openwrt,led-(boot|failsafe|running|upgrade)$":
>>> +    $ref: types.yaml#/definitions/string
>>> +    description:
>>> +      OpenWrt choice of LED for a given role.
>>
>> Neither this explains it. What is "OpenWrt choice"? Choice like what?
>> What are the valid choices?
>>
>>> Value must be a full path (encoded
>>> +      as a string) to a relevant LED node.
>>
>> What do you mean by full path? DT node path? Then no, use phandles.
>>
>> Anyway, we have existing properties for this - LED functions. Just
>> choose LED with given function (from sysfs) and you are done. If
>> function is missing in the header: feel free to go, least for me.
> 
> In "Describing LEDs roles in device tree?" e-mail I wrote:
> 
> "
> Please note that "function" on its own is not sufficient as multiple
> LEDs my share the same function name but its meaning may vary depending
> on color.
> "
> 
> Let me elaborate here.
> 
> Values of "function" property match LEDs descriptions (usually it's a
> physical label). That is OK and makes sense but doesn't allow OpenWrt to
> automatically pick proper LED to use during given boot stage.
> 
> Some devices may have multiple color of a the same LED function. OpenWrt
> developer needs to choose which color to use for failsafe more and which
> boot fully booted state (and others too).
> 
> Devices also differ in available LEDs by their functions. Some may have
> LED_FUNCTION_POWER that OpenWrt needs to use. Some may have
> LED_FUNCTION_STATUS. Or both. There are some more (less common)
> functions like LED_FUNCTION_ACTIVITY.
> 
> We failed at OpenWrt to develop a single generic script to rule all
> devices and all their LEDs combinations. We ended up with developers
> *choosing* what LED to use for a given system state.

So this all is because you want to write easier OS. That's abuse of
Devicetree. You can define which LEDs have different meaning, e.g.
physical label or icon attached to them. That's a hardware property.

You can also define how pieces of hardware are wired together and create
entire system, e.g. connect one LED to disk activity.

However what you are proposing here is to dynamically configure one,
given OS. I don't think it is suitable.

The problem of OS to nicely figure out which LED to blink when, is not a
problem of Devicetree. It is a problem of OS and its configuration.

Best regards,
Krzysztof


