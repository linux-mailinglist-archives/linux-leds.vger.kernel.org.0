Return-Path: <linux-leds+bounces-569-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 951A982944D
	for <lists+linux-leds@lfdr.de>; Wed, 10 Jan 2024 08:28:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0470A1F2712D
	for <lists+linux-leds@lfdr.de>; Wed, 10 Jan 2024 07:28:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C91839FCB;
	Wed, 10 Jan 2024 07:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vPx8xnrW"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7360F39AF5
	for <linux-leds@vger.kernel.org>; Wed, 10 Jan 2024 07:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-50ea9e189ebso3911250e87.3
        for <linux-leds@vger.kernel.org>; Tue, 09 Jan 2024 23:28:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704871720; x=1705476520; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JVBX5etdoAzgr9+pLxG10oD5FiibLDWzHD4Y2Mq2tt0=;
        b=vPx8xnrWQ8ZfToJ3VOxwq5WRTLB7x7ZRsUvryfNQAs529+d4eOOLXcpqCrWKlSF2Wh
         mIeiP9woZr9YfEDQQRhQ59UvOVeKWFSYVxJTjGYSMivOhdo+oct6CxgdlJN/c4c1LL4w
         eiy16wMrK0G7Qc6+gvCaQWxZlP7nLeuds/bVlwYW7jzi118b3xK6BFwSnSqR1uB/+ntP
         K497Gz3xW4NXz8/oPgE9Sw0P4y2QT3Ibm060vVD4tGSZLzgRz7Jg/7pjtonTjIRSRn3v
         mpmwv4CA9gcjm7tvxCyew+BvbSykC9u20dYIzm4m7jJ+t0E04oTgnJHO7sKgk5BIXTQc
         6Z2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704871720; x=1705476520;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JVBX5etdoAzgr9+pLxG10oD5FiibLDWzHD4Y2Mq2tt0=;
        b=PIt87Lp9/5AmfBnKnJ0liEIY6Q4+WhTIAdbl1R9cPA+WkMuxu343CX7zgh0HqYBiBX
         Y/Twmq4IkIui4XFt8n3RHepPGMu+fnwZktxPITZ8wP+cI6a5ePZ6NPXmrxuNbaypka7O
         n3Ri9+Uljz89kjvHF7cGXNbbjz3rOBPrO7UpDMlqy5l2fNInwSSTpR1T7StFx+0PX7l/
         8AmHy+n2Bc+n7pCyyXITCfD+kB5TCEAXzhzrBJydhtqOiDpavYOyLL9ZtNhEYjKa2GCT
         kwaLOX9SgAuo3rK6PHolBpzOul0GUeWhYz5WynmLdqZfFGtuXrXurZYBTEd3jdfmCgna
         5Esg==
X-Gm-Message-State: AOJu0Yybb6TVPvtGTEqLIzCQoQRfXcf33fkaqkthdFCOSixqusA87Jnm
	BKJTk9alL0UinE63l44/xH7Kfq2sdtiOzw==
X-Google-Smtp-Source: AGHT+IGydUSfCgHpYRePlQnwbswXNg46P9mzqd2WmznBWo9bXKrtJ0dquI7S6+ZrYbY4keGgGj6XpA==
X-Received: by 2002:a05:6512:1184:b0:50e:b298:9e16 with SMTP id g4-20020a056512118400b0050eb2989e16mr132832lfr.135.1704871720303;
        Tue, 09 Jan 2024 23:28:40 -0800 (PST)
Received: from [192.168.1.20] ([178.197.223.112])
        by smtp.gmail.com with ESMTPSA id a21-20020a170906275500b00a2b94ba997fsm802577ejd.89.2024.01.09.23.28.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jan 2024 23:28:39 -0800 (PST)
Message-ID: <a2394a4a-0fc1-45a0-9f01-c792a138fe0c@linaro.org>
Date: Wed, 10 Jan 2024 08:28:37 +0100
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
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
 linux-leds@vger.kernel.org, openwrt-devel@lists.openwrt.org,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
References: <20240109082312.9989-1-zajec5@gmail.com>
 <1b90c50c-0a09-4627-83cd-1794dae7ed9b@linaro.org>
 <69966efa-21ab-4a38-ad06-61e7e2e5b6d3@gmail.com>
 <987fe3e7-adc8-489f-867b-2d3aaa004d94@linaro.org>
 <CAMuHMdW4BVWd93GcKwujb1p_gdOejDKwq9ewrwCqytDFRW9r=A@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <CAMuHMdW4BVWd93GcKwujb1p_gdOejDKwq9ewrwCqytDFRW9r=A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 09/01/2024 22:08, Geert Uytterhoeven wrote:
> Hi Krzysztof,
> 
> On Tue, Jan 9, 2024 at 8:10 PM Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
>> On 09/01/2024 17:38, Rafał Miłecki wrote:
>>> On 9.01.2024 10:02, Krzysztof Kozlowski wrote:
>>>> On 09/01/2024 09:23, Rafał Miłecki wrote:
>>>>> From: Rafał Miłecki <rafal@milecki.pl>
>>>>>
>>>>> OpenWrt project provides downstream support for thousands of embedded
>>>>> home network devices. Its custom requirement for DT is to provide info
>>>>> about LEDs roles. Currently it does it by using custom non-documented
>>>>> aliases. While formally valid (aliases.yaml doesn't limit names or
>>>>> purposes of aliases) it's quite a loose solution.
>>>>>
>>>>> Document 4 precise "chosen" biding properties with clearly documented
>>>>> OpenWrt usage. This will allow upstreaming tons of DTS files that noone
>>>>
>>>> typo: none
>>>
>>> typo: no one ;)
>>>
>>>>> cared about so far as those would need to be patched downstream anyway.
>>>>
>>>>  From all this description I understand why you want to add it, but I
>>>> don't understand what are you exactly adding and how it is being used by
>>>> the users/OS.
>>>
>>> In OpenWrt we have user space script that reads LED full path:
>>> cat /proc/device-tree/aliases/led-<foo>
>>>
>>> And then sets LED to state matching current boot stage:
>>> echo 1 > /sys/class/leds/<bar>/brightness
>>
>> OK, it's nowhere close to a hardware property. You now instruct OS what
>> to do. It's software or software policy.
> 
>>>> Anyway, we have existing properties for this - LED functions. Just
>>>> choose LED with given function (from sysfs) and you are done. If
>>>> function is missing in the header: feel free to go, least for me.
>>>
>>> In "Describing LEDs roles in device tree?" e-mail I wrote:
>>>
>>> "
>>> Please note that "function" on its own is not sufficient as multiple
>>> LEDs my share the same function name but its meaning may vary depending
>>> on color.
>>> "
>>>
>>> Let me elaborate here.
>>>
>>> Values of "function" property match LEDs descriptions (usually it's a
>>> physical label). That is OK and makes sense but doesn't allow OpenWrt to
>>> automatically pick proper LED to use during given boot stage.
>>>
>>> Some devices may have multiple color of a the same LED function. OpenWrt
>>> developer needs to choose which color to use for failsafe more and which
>>> boot fully booted state (and others too).
>>>
>>> Devices also differ in available LEDs by their functions. Some may have
>>> LED_FUNCTION_POWER that OpenWrt needs to use. Some may have
>>> LED_FUNCTION_STATUS. Or both. There are some more (less common)
>>> functions like LED_FUNCTION_ACTIVITY.
>>>
>>> We failed at OpenWrt to develop a single generic script to rule all
>>> devices and all their LEDs combinations. We ended up with developers
>>> *choosing* what LED to use for a given system state.
>>
>> So this all is because you want to write easier OS. That's abuse of
>> Devicetree. You can define which LEDs have different meaning, e.g.
>> physical label or icon attached to them. That's a hardware property.
>>
>> You can also define how pieces of hardware are wired together and create
>> entire system, e.g. connect one LED to disk activity.
>>
>> However what you are proposing here is to dynamically configure one,
>> given OS. I don't think it is suitable.
>>
>> The problem of OS to nicely figure out which LED to blink when, is not a
>> problem of Devicetree. It is a problem of OS and its configuration.
> 
> I'd say it's a grey area...
> 
> What if the colors are printed on the case, next to the LED?
> Like these multi-color LEDs indicating port speed on network switches?
> Then it suddenly becomes hardware description, just like
> "aliases/serial2 = &...;" referring to serial port 2.
> 
> Next, what if the colors are not printed on the case, but documented
> in the product's manual?
> What if there is no paper product manual, but just the OpenWRT online
> documentation?

Mapping between colors and logical meanings is subjective. I don't think
it is the same case as LED with a radio-signal or power-plug label.

Anyway I also agree that this distinction is a bit blurred.

Best regards,
Krzysztof


