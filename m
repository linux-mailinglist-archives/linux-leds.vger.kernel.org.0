Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E3392799E9
	for <lists+linux-leds@lfdr.de>; Sat, 26 Sep 2020 15:59:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726210AbgIZN7S (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 26 Sep 2020 09:59:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726183AbgIZN7S (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 26 Sep 2020 09:59:18 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4661C0613CE;
        Sat, 26 Sep 2020 06:59:17 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id j11so2445584ejk.0;
        Sat, 26 Sep 2020 06:59:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Kn91WpjTLfJsOWdj644PK+5MSB/N/LMnIIqFsBNahWA=;
        b=dlcNcizlBQwyX5JcWhe+7U3FLhZaxq40b3BBcqAAnVXmwvLRb6e23IimVFfWclIemJ
         Pv5+GU/eXXw3N33FyxCZvEo3ADSc5bZEqaOvjXfByAZrC5bKd2k/O4sGL4HTKvctuzCh
         +Ws8lss7Yr5nxXY/BsJMzS+5qC49tuz/+Q4W9/gY+r3RRk55r9KLtGK9ghD3pmz4G2ws
         /CAl/jslWEPhr4iqGdHuPQMA6c8na01AmVz/6dp5tzX4YiOMvfuwHmRKm/+QPU0r1LXR
         Yfe+gT9JN2GcEO1uqbyccvdlpCNVKWVz/zuLd5DmK1dvtI6SNhBpW6qMlCOdRV/bcAJS
         b1fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Kn91WpjTLfJsOWdj644PK+5MSB/N/LMnIIqFsBNahWA=;
        b=ueUWBKYjZfPMJjwUqGJLEpDMzHDi1luGj9pRToq2wBwLrxzbvRpwP2jBwRMuFVaD6t
         qV0Q+4pdANLKpuwjTPL+TPf3pYZF8mpJ3KVfl5p7NxcprWx5llHvqsxEfobLsbC1eSyC
         uiEuS1GICb22Q5o0QQOZMjnF16Mir3G1/Faysvvbl//nDTaDedDo11ECnpH4Onue5G/N
         pH5aD+JfuXBdFtd/QJK7bbvEW29NeTKd6qzEyBmU+Ce1uA1cMSaOBcCDNUXRJ5a69NF4
         00GmUqoHc8z58ldRLp8m/iWuCfqS6k3PrEmvFdlpvDc/Xt1BkKyQNIZ7iVeRkVOgDfGw
         a8Jg==
X-Gm-Message-State: AOAM5308ptxg05Dd5H8tmBRpBeyONwQmit8dw6rlejL5MY9lGhxBMKIq
        l9mfHSX+IBtBUVdW+JR9EXLw+sASWO0=
X-Google-Smtp-Source: ABdhPJz54S4TpN/sICMtc9/bHx9L1c9pMUqyfCcH5pCATuRvfnGMSjWQKhCnLD/2jFhwuR4Eyb25xw==
X-Received: by 2002:a17:906:368c:: with SMTP id a12mr7826250ejc.423.1601128756190;
        Sat, 26 Sep 2020 06:59:16 -0700 (PDT)
Received: from ?IPv6:2a01:110f:b59:fd00:c5aa:62b3:e4c:2acd? ([2a01:110f:b59:fd00:c5aa:62b3:e4c:2acd])
        by smtp.gmail.com with ESMTPSA id i26sm4411439edq.47.2020.09.26.06.59.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Sep 2020 06:59:15 -0700 (PDT)
Subject: Re: ledtrig-cpu: Limit to 4 CPUs
To:     Pavel Machek <pavel@ucw.cz>
Cc:     linux-leds@vger.kernel.org, dmurphy@ti.com,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20200919093833.GA14326@duo.ucw.cz>
 <27e19ac9-4bc0-2945-3985-6cd6bb5407df@gmail.com>
 <20200920183401.GA21494@duo.ucw.cz>
 <781dcb5e-7bad-f740-5914-778ec8a7306b@gmail.com> <20200921224212.GA13299@amd>
 <db0b2dca-b7d3-8d76-cc6c-b399c1fa9921@gmail.com>
 <c60858bd-9a9f-5537-9f96-2e44db0c0d9e@gmail.com> <20200925094038.GC20659@amd>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <5496ac44-003e-5f2a-7faf-88b4a264dedf@gmail.com>
Date:   Sat, 26 Sep 2020 15:59:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200925094038.GC20659@amd>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 9/25/20 11:40 AM, Pavel Machek wrote:
> Hi!
> 
>>>> So.. no, it is not causing kernel crashes or something. But it is
>>>> example of bad interface, and _that_ is causing problems. (And yes, if
>>>> I realized it is simply possible to limit it, maybe the BIN_ATTR
>>>> conversion would not be neccessary...)
>>>
>>> The limitation you proposed breaks the trigger on many plafforms.
>>
>> Actually it precludes its use.
>>
>> I still see the patch in your linux-next, so I reserve myself the
>> right to comment on your pull request.
> 
> You are free to comment on anything.
> 
> I believe probability someone uses that with more than 4 CPUs is <
> 5%. 

So you even didn't bother to check:

$ git grep "default-trigger = \"cpu[4-9]"
arch/arm/boot/dts/vexpress-v2m-rs1.dtsi: 
linux,default-trigger = "cpu4";
arch/arm/boot/dts/vexpress-v2m-rs1.dtsi: 
linux,default-trigger = "cpu5";
arch/arm/boot/dts/vexpress-v2m.dtsi: 
linux,default-trigger = "cpu4";
arch/arm/boot/dts/vexpress-v2m.dtsi: 
linux,default-trigger = "cpu5";

cpus are enumerated starting from 0, so there are more reasons for which
your patch is broken:

1. There are mainline users.
2. You claim that you limit trigger use to 4 cpus, while the number is
    actually 5, due to your condition:
	+		if (cpu > 4)
	+			continue;
3. For platforms exceeding the limit the number of triggers registered
    would not match the number all available cpus, for no obvious reason.
    Better solution would be to prevent use of the trigger entirely
    in such cases, which would need only to alter first instruction in
    ledtrig_cpu_init(), which currently is:

	BUILD_BUG_ON(CONFIG_NR_CPUS > 9999);

However I am not in favor of this approach since after removing
PAGE_LIMIT size on triggers file, the trigger doesn't longer cause
problems even with hypothetical 1000 cpus.

The correct approach would be to create new trigger with better
interface and then advise people switching to it.

> Probability that someone uses it with more than 100 CPUs is << 1%
> I'd say. Systems just don't have that many LEDs. I'll take the risk.
> 
> If I broke someone's real, existing setup, I'll raise the limit.

Is this professional approach - throw a potential bug at users and
check if it will hit them? :-) And for no reason - you're not fixing
anything.

> (With exception of uled setups. In such cases, I'll just laugh.)
> 
> If you know or can find out someone using it with more than 4 CPUs, I
> can obviously raise the limit before the merge.

-- 
Best regards,
Jacek Anaszewski
