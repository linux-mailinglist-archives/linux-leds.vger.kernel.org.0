Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8E23322F49
	for <lists+linux-leds@lfdr.de>; Tue, 23 Feb 2021 18:02:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233682AbhBWRBG (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 23 Feb 2021 12:01:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233674AbhBWRBA (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 23 Feb 2021 12:01:00 -0500
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3EF0C06178B;
        Tue, 23 Feb 2021 09:00:19 -0800 (PST)
Received: by mail-pj1-x1032.google.com with SMTP id ds5so2362086pjb.2;
        Tue, 23 Feb 2021 09:00:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=+I+A05vCm3IG7TRzAH4tvspVQ7ImjwYeEeSSkYCANAs=;
        b=R1t58opIvMu6BVczn3RijvvqcNo0e2Ug758tJd6DCw7LwJTaya7RiMzn4CeIgtjZ0Z
         ES2khhXQ4Sge4r4D+IVLQMLoA/8TRJKFPv7ZwWs2KdrX24TRmWWFg1gYdHIggMXRgcFZ
         gS6SH3Fefq8qtkJZwoWp1V4iEzjz9uQ6Lru0cFl3GL+7W2ED1zzDCTbWW5J45BcpXPYe
         Cy5TOPbe0tTDnblbIHd2HShCXcramRxfGsXeeKBRbIW9eM0pGjryZ4YeIU7qeouZxK/R
         24ZZk4RAKaTjutVrFB5/9Hx5l7og4ViCbHobzIBTX9WAEx4qMNPTjAfMtGsbKPR4XlFV
         P/bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=+I+A05vCm3IG7TRzAH4tvspVQ7ImjwYeEeSSkYCANAs=;
        b=dEurHKRbP8gnzrJ7n5yrhRKUKHnPeFBlc5oyvL81wHgMMmDDrRRtGB6Ux6qmKV+9DU
         OLvxiC5pnAUhq6Wx2RA1vawKcCb0jVQ9MvdfjHG7AbIUiEsH/bf+l5GUJlXLwDctBErE
         dvg15F7bN35bFXZnnftNAjAUnqYLTIEcc9EIpSvthOD7NFMiqYpRj89JVHk3+6jQF6Y8
         0A91j93AicJS/HD140SzBFJVbDXAfUtwDqiRQAPd2nu3JWQMfpa9jLwQ4Sm6cj+DGIru
         sMmmbHaWQMheyS7ldgmbZFcD+HiYDQ2StF3XV1UFS71yJL/l1s1imDa4f8/bJ+DeFTd7
         tpag==
X-Gm-Message-State: AOAM532t/wYt2DHFpCvgvxkUEzdiHq/gHQ8TEBlp7ORue4ua+WHccnwD
        90dGhxyu2ne1LYp4lzswLuEJ+LhPv4o=
X-Google-Smtp-Source: ABdhPJyFe1yeJcpb80fsxw7qM8DuCagN1Qd/QSqAQAfueCVDENRijEsLnCDcU8KV3iVVn+xMqeRIzg==
X-Received: by 2002:a17:90a:7f8a:: with SMTP id m10mr30136637pjl.102.1614099618881;
        Tue, 23 Feb 2021 09:00:18 -0800 (PST)
Received: from [10.230.29.30] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 8sm4157654pjl.55.2021.02.23.09.00.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Feb 2021 09:00:18 -0800 (PST)
Subject: Re: [PATCH 1/2] leds: bcm6328: improve write and read functions
To:     =?UTF-8?Q?=c3=81lvaro_Fern=c3=a1ndez_Rojas?= <noltari@gmail.com>,
        Pavel Machek <pavel@ucw.cz>
Cc:     Dan Murphy <dmurphy@ti.com>, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210223081732.9362-1-noltari@gmail.com>
 <20210223081732.9362-2-noltari@gmail.com> <20210223083449.GA9750@amd>
 <3826ACDE-EFF2-4CC5-82EE-2DBC991CF996@gmail.com> <20210223085819.GB9750@amd>
 <F349F1C2-4D4F-4BF7-9ADC-6E879197405B@gmail.com>
From:   Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <a2da8ee6-a941-de04-3d45-56fb6cae596a@gmail.com>
Date:   Tue, 23 Feb 2021 09:00:16 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <F349F1C2-4D4F-4BF7-9ADC-6E879197405B@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org



On 2/23/2021 1:05 AM, Álvaro Fernández Rojas wrote:
> 
> 
>> El 23 feb 2021, a las 9:58, Pavel Machek <pavel@ucw.cz> escribió:
>>
>> Hi!
>>
>>>>> This is proven to work in BMIPS BE/LE and ARM BE/LE, as used in bcm2835-rng
>>>>> and bcmgenet drivers.
>>>>> Both should also be inline functions.
>>>>
>>>>
>>>>
>>>>> -#ifdef CONFIG_CPU_BIG_ENDIAN
>>>>> -	iowrite32be(data, reg);
>>>>> -#else
>>>>> -	writel(data, reg);
>>>>> -#endif
>>>>> +	/* MIPS chips strapped for BE will automagically configure the
>>>>> +	 * peripheral registers for CPU-native byte order.
>>>>> +	 */
>>>>
>>>> Bad comment style.
>>>
>>> I just wanted to copy the same comment as the one in bcm2835-rng and bcmgenet…
>>> https://github.com/torvalds/linux/blob/3b9cdafb5358eb9f3790de2f728f765fef100731/drivers/char/hw_random/bcm2835-rng.c#L42-L60
>>> https://github.com/torvalds/linux/blob/3b9cdafb5358eb9f3790de2f728f765fef100731/drivers/net/ethernet/broadcom/genet/bcmgenet.c#L71-L88
>>>
>>
>> Yeah, but ideally you should not be copying comments; there should be
>> one central place which does it and does it right.
> 
> I’m open to suggestions :).
> Which central place would be a good place for you?

I did consider creating an include/linux/brcm/brcm_io.h header or
something like that but I am really not sure what the benefit would be.

As far as using _relaxed() this is absolutely correct because the bus
logic that connects the CPU to its on-chip registers is non re-ordering
non posted. That is true on the MIPS BE/LE and ARM when configured in LE
or BE.

We need the swapping for ARM because when running in ARM BE32, the data
is going to be in the host CPU endian, but the register bus is hard
wired to little endian.
-- 
Florian
