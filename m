Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 139E432434E
	for <lists+linux-leds@lfdr.de>; Wed, 24 Feb 2021 18:47:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235589AbhBXRqK (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 24 Feb 2021 12:46:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229644AbhBXRqJ (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 24 Feb 2021 12:46:09 -0500
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BDFDC06174A;
        Wed, 24 Feb 2021 09:45:28 -0800 (PST)
Received: by mail-pg1-x534.google.com with SMTP id b21so1923064pgk.7;
        Wed, 24 Feb 2021 09:45:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=szGV+7aObjZoi5mnUKGEjRtKB5YQVvCFN71VukUYruI=;
        b=OFaiKo+Vy4oRCwbsHopxZe7ZEjUg43O4CmTWU78wzLDY6tN35JJOqhGwfs6cPNXqJw
         7IUZRrHees1aUOTPvy8zUzrZdB2JUbdJJVV38NDQLM2S+HLKIx9c475ahyaNhg32eq8t
         05creesKrWyX+BhBxgoJJPUCa2EKnnEuz8q7m4fwuW6evSn9o/28pkvX60pqpQNfBUsk
         MrHO0qaeqno1QE/cOgPCq9JrO5sIwQ4JReo4ipDU6r399cbGu4x0fu70dkPH4k3e7fTX
         jpchjTM+T0nOjMmtHRsCcd4PSlzPAxl1qkoLVO58rMQcFwRM3weqdp21Vt7KVJR113WH
         RdoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=szGV+7aObjZoi5mnUKGEjRtKB5YQVvCFN71VukUYruI=;
        b=EWJZSAydJlxKxS6eLhlDxXyDg0o6W+emUHif1Dq1d1MohClIHki1aWV1JQr/ONT5mY
         UZfPtXqr9Ul1bhFhQC8/g0y4YhU0db7qoL0E+9rlLG4tVgVV8Vspuv0F3RiDuLT5wM/Z
         npZP904Txbfjsaa4w2lxhNH/8IiunaNbbma0wOEuQmp28++aYhDpE64pMUru9rtpZyWv
         IIFc51C6+AB/AsRz12JBNqqeZ3nhnI21K4j0Lz2t5CBl2gH/yZ7k/uzTq0ONRRdtgh/c
         ++rWcJKNK2qZ1QMsX0OoV5qS/4YI5BbLtYPR5tv2dT1Ky/MKvG5zErb5D0OfxtZt46jd
         jf5w==
X-Gm-Message-State: AOAM533BkBHqur2OZh9ITOUxPTQJza32eKqmUOgEfk8hGpgU0u3I31v1
        hoG/nWnL+Ce3rN0/ygTGWChhXTfHyGo=
X-Google-Smtp-Source: ABdhPJyZ6iwnqs01Rw7mY9cxCoeL0YAOqFT21p83snAKZz9vk+0M4dGW7F9JQRmWsUQzMWRFl+UNyg==
X-Received: by 2002:a63:e614:: with SMTP id g20mr18466910pgh.275.1614188727360;
        Wed, 24 Feb 2021 09:45:27 -0800 (PST)
Received: from [10.230.29.30] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 190sm3510749pfv.155.2021.02.24.09.45.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Feb 2021 09:45:26 -0800 (PST)
Subject: Re: [PATCH 1/2] leds: bcm6328: improve write and read functions
To:     Pavel Machek <pavel@ucw.cz>
Cc:     =?UTF-8?Q?=c3=81lvaro_Fern=c3=a1ndez_Rojas?= <noltari@gmail.com>,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210223081732.9362-1-noltari@gmail.com>
 <20210223081732.9362-2-noltari@gmail.com> <20210223083449.GA9750@amd>
 <3826ACDE-EFF2-4CC5-82EE-2DBC991CF996@gmail.com> <20210223085819.GB9750@amd>
 <F349F1C2-4D4F-4BF7-9ADC-6E879197405B@gmail.com>
 <a2da8ee6-a941-de04-3d45-56fb6cae596a@gmail.com> <20210224173649.GA10809@amd>
From:   Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <b43f49c1-8fb6-bedf-b560-9bd8c5ce872a@gmail.com>
Date:   Wed, 24 Feb 2021 09:45:25 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210224173649.GA10809@amd>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org



On 2/24/2021 9:36 AM, Pavel Machek wrote:
> Hi!
> 
>>>> Yeah, but ideally you should not be copying comments; there should be
>>>> one central place which does it and does it right.
>>>
>>> I’m open to suggestions :).
>>> Which central place would be a good place for you?
>>
>> I did consider creating an include/linux/brcm/brcm_io.h header or
>> something like that but I am really not sure what the benefit would
>> be.
> 
> Less code duplication? It is immediately clear that driver including
> this is specific for brcm SoCs and would not try to work somewhere else?

Yes maybe, there still does not feel like this deserves a shared header,
but as long as the generated code is the same, why not.

> 
>> As far as using _relaxed() this is absolutely correct because the bus
>> logic that connects the CPU to its on-chip registers is non re-ordering
>> non posted. That is true on the MIPS BE/LE and ARM when configured in LE
>> or BE.
> 
> If that's right on particular SoC, then _relaxed and normal versions
> should be same; drivers still need to use normal versions, because
> they may be running on different SoC...?

readl() includes barriers and read_relaxed() does not, hence the
difference in the name. There is no need to pay the price of a barrier
when a) the bus architecture guarantees non re-ordering and posting and
that statement is true on all the SoCs where these peripherals are used,
and b) you have worked on fine tuning your drivers to get the most
performance out of them.

> 
>> We need the swapping for ARM because when running in ARM BE32, the data
>> is going to be in the host CPU endian, but the register bus is hard
>> wired to little endian.
> 
> Yeah I see you need to do some byteswapping. But I'm pretty sure not
> all MIPS BE boxes do the magic swapping, right? And drivers/leds is
> not a place where you encode knowledge about SoC byte swapping.

The Broadcom MIPS CPUs (we have/had an architectural license) can be
strapped for BE or LE, and when that happens the bridge that connects to
the registers follows the CPU's endian, which is why __raw_{read,write}l
is appropriate for these specific peripherals.

Given these peripherals can only be used on CPUs/SoCs made by Broadcom,
any argument about portability to other SoCs is moot.
-- 
Florian
