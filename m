Return-Path: <linux-leds+bounces-565-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 290B2828A23
	for <lists+linux-leds@lfdr.de>; Tue,  9 Jan 2024 17:38:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C72C228656A
	for <lists+linux-leds@lfdr.de>; Tue,  9 Jan 2024 16:38:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1ED339AFD;
	Tue,  9 Jan 2024 16:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kAAclciL"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14CE738F9A;
	Tue,  9 Jan 2024 16:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-50e766937ddso3559125e87.3;
        Tue, 09 Jan 2024 08:38:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704818315; x=1705423115; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mOZQ7Q6/TyAbQPkXNKAKhNzxIS14TPe9owB9d+1h5JI=;
        b=kAAclciLqb9G4wGultkCE45Q8NL8I8pc1mBlxC6n0EWQWhVsRI1qsQerFFy9qRla+i
         fBBXyaJJ3LrB5xtAgMsJFZ169X0BK/yuDToiMCvOJsJ2JdohNoALdUW5XELiomaPThkh
         2KsKuN9/nQsANJx3fTqQrw2TjQEV4jIL6TWkkpI/xxpgjSsTHHURvkDfZuZ5jsXBhFNL
         HebuoI3Yrw/kpAAM8gxqhgMLnoh3fY6CePm9/YudyyWmAzwn3Q1dREjqM2V0C9dFLU+f
         B2ZBOKcNnNRVlcKWSidPpMD+voID/HgIOjq097uwGBIDVe7jKRvrRz3P05Fj/36svcte
         thCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704818315; x=1705423115;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mOZQ7Q6/TyAbQPkXNKAKhNzxIS14TPe9owB9d+1h5JI=;
        b=YJtsVFowndZlOMI4ewKOsTZkYRWVIDyMij5ls/ZHHl+ocupwUrO0YiGta5F48+qA6z
         cTYdtqHzViYQP15WPoVPnv2SI1YkQOKxENl/4AvC+dYVR4guNoWRWPFGep4vY04MFOwa
         /fogSNTv/eHpWOjmFHpTa8jPUxrb0T4c4WukwUpL+1Y+HN7RI/3KOU684SBPmxKU7P/L
         ll8Fd3DPX8fQk2MyQKEvF+xVUrIyOyyGd8eoLUW4BQLFkz79kbNht8Q8TAJVuTRk28F7
         nGgCEVOSFX1pwgqwRlIc0S6u88pgVx+HnHUauAfceyMB2lfHDgIJjdyIMAQ9jEKCNFSB
         qbtw==
X-Gm-Message-State: AOJu0YwQ77g7P+r1hkljNMZ69vSDKBn8xGiePv7/RpbcyFejaDS/nzu3
	wDZkKYyDwbcuSj6dsJXk1Bc=
X-Google-Smtp-Source: AGHT+IG7AEsDYBeDjF+tkfOF5dIxVnM8sQKYK8HsBHazIt8hMy8AYIFsW9BehQoH0zZebY5v9DGQdg==
X-Received: by 2002:a19:6556:0:b0:50e:b413:400f with SMTP id c22-20020a196556000000b0050eb413400fmr2205345lfj.49.1704818314790;
        Tue, 09 Jan 2024 08:38:34 -0800 (PST)
Received: from [192.168.26.149] (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.googlemail.com with ESMTPSA id y5-20020a170906070500b00a26b36311ecsm1231196ejb.146.2024.01.09.08.38.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jan 2024 08:38:34 -0800 (PST)
Message-ID: <69966efa-21ab-4a38-ad06-61e7e2e5b6d3@gmail.com>
Date: Tue, 9 Jan 2024 17:38:32 +0100
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
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
In-Reply-To: <1b90c50c-0a09-4627-83cd-1794dae7ed9b@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 9.01.2024 10:02, Krzysztof Kozlowski wrote:
> On 09/01/2024 09:23, Rafał Miłecki wrote:
>> From: Rafał Miłecki <rafal@milecki.pl>
>>
>> OpenWrt project provides downstream support for thousands of embedded
>> home network devices. Its custom requirement for DT is to provide info
>> about LEDs roles. Currently it does it by using custom non-documented
>> aliases. While formally valid (aliases.yaml doesn't limit names or
>> purposes of aliases) it's quite a loose solution.
>>
>> Document 4 precise "chosen" biding properties with clearly documented
>> OpenWrt usage. This will allow upstreaming tons of DTS files that noone
> 
> typo: none

typo: no one ;)

>> cared about so far as those would need to be patched downstream anyway.
> 
>  From all this description I understand why you want to add it, but I
> don't understand what are you exactly adding and how it is being used by
> the users/OS.

In OpenWrt we have user space script that reads LED full path:
cat /proc/device-tree/aliases/led-<foo>

And then sets LED to state matching current boot stage:
echo 1 > /sys/class/leds/<bar>/brightness


>> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
>> ---
>> A few weeks ago I was seeking for a help regarding OpenWrt's need for
>> specifing LEDs roles in DT, see:
>>
>> Describing LEDs roles in device tree?
>> https://lore.kernel.org/linux-devicetree/ee912a89-4fd7-43c3-a79b-16659a035fe1@gmail.com/T/#u
>>
>> I DON'T think OpenWrt's current solution with aliases is good enough:
>> * It's not clearly documented
>> * It may vary from other projects usa case
>> * It may be refused by random maintainers I think
>>
>> I decided to suggest 4 OpenWrt-prefixed properties for "chosen". I'm
>> hoping this small custom binding is sth we could go with. I'm really
>> looking forward to upstreaming OpenWrt's downstream DTS files so other
>> projects (e.g. Buildroot) can use them.
>>
>> If you have any better fitting solution in mind please let me know. I
>> should be fine with anything that lets me solve this downstream mess
>> situation.
>>
>>   dtschema/schemas/chosen.yaml | 9 +++++++++
>>   1 file changed, 9 insertions(+)
>>
>> diff --git a/dtschema/schemas/chosen.yaml b/dtschema/schemas/chosen.yaml
>> index 6d5c3f1..96d0db7 100644
>> --- a/dtschema/schemas/chosen.yaml
>> +++ b/dtschema/schemas/chosen.yaml
>> @@ -264,4 +264,13 @@ properties:
>>   patternProperties:
>>     "^framebuffer": true
>>   
>> +  "^openwrt,led-(boot|failsafe|running|upgrade)$":
>> +    $ref: types.yaml#/definitions/string
>> +    description:
>> +      OpenWrt choice of LED for a given role.
> 
> Neither this explains it. What is "OpenWrt choice"? Choice like what?
> What are the valid choices?
> 
>> Value must be a full path (encoded
>> +      as a string) to a relevant LED node.
> 
> What do you mean by full path? DT node path? Then no, use phandles.
> 
> Anyway, we have existing properties for this - LED functions. Just
> choose LED with given function (from sysfs) and you are done. If
> function is missing in the header: feel free to go, least for me.

In "Describing LEDs roles in device tree?" e-mail I wrote:

"
Please note that "function" on its own is not sufficient as multiple
LEDs my share the same function name but its meaning may vary depending
on color.
"

Let me elaborate here.

Values of "function" property match LEDs descriptions (usually it's a
physical label). That is OK and makes sense but doesn't allow OpenWrt to
automatically pick proper LED to use during given boot stage.

Some devices may have multiple color of a the same LED function. OpenWrt
developer needs to choose which color to use for failsafe more and which
boot fully booted state (and others too).

Devices also differ in available LEDs by their functions. Some may have
LED_FUNCTION_POWER that OpenWrt needs to use. Some may have
LED_FUNCTION_STATUS. Or both. There are some more (less common)
functions like LED_FUNCTION_ACTIVITY.

We failed at OpenWrt to develop a single generic script to rule all
devices and all their LEDs combinations. We ended up with developers
*choosing* what LED to use for a given system state.


> Also: please Cc LED maintainers on all future submissions of this.
Included them (apart from linux-leds@ already present) now, thanks.

