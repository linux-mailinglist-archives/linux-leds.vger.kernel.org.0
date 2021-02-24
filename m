Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 696DF324348
	for <lists+linux-leds@lfdr.de>; Wed, 24 Feb 2021 18:44:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235746AbhBXRnw (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 24 Feb 2021 12:43:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235733AbhBXRnv (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 24 Feb 2021 12:43:51 -0500
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C273BC061788;
        Wed, 24 Feb 2021 09:43:11 -0800 (PST)
Received: by mail-pl1-x635.google.com with SMTP id k22so1633865pll.6;
        Wed, 24 Feb 2021 09:43:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=LXNIgzDpBNjJ7YwKUu+tDRHmHQyxXwb8vfl+dWf/F58=;
        b=SA1Sl456+jzuZMuzAN1MmnafgmK4qLnrgwvcBAHUia+UPuHxuMqtZrO2tAaIoOd7Fl
         KwGvH4DQ1u7apOV7GyDVV4C+FrRTYG/umP4+lCQXnZBCtZxSem4t1d1m7oY6Rr0RwqHu
         inUxowg0EEb+9Bz272hLzeHb+VWbvjkgXNIuRYblVyWyuOmfI8rvNd/SoqXOj+ksZjU2
         kC6shu4G5XGV5MqebhBZd0OhAf40FCZROscMx5KoyCz9qKWtkfz9Y53QzKHUxT6tYYkz
         jvUSuBzyGqw7dsmUPUHrFQqVqA42tOZ8W41rP1dJ51K8F6mwUNFMRDEQL+1cXPISY+C7
         j+aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=LXNIgzDpBNjJ7YwKUu+tDRHmHQyxXwb8vfl+dWf/F58=;
        b=R8s25fTto8SNNHH+h1eH6XVc6456imwA+6QQkr9IxAiVWD8DsXbrgGSFgJGiTMtt98
         cQohgjOJ2HsTAs4duPFORCqNZCIdXnv1HUh2yx9i8gO/08eE0Ad/Bx4f5PWKdJCiHnKH
         SaL9ia3xu1/ne1BimNWN/46wiEFioUKarcGGsO85RdAe4ZfuGhbXUTHhtGmI0cdh5pE4
         2xvtqSdxYigeHMKgaS6trBNrWNU1YU2Agrf5js+Iop7Rab5w74zLKr9GYA0EHBKL9B6p
         0FQChTyc5RJeT0vPgSmaUzimBAb/8iYk/1tshvQxCDCMB8EXTn9ztlqTiC70tI8pPIdn
         o7yg==
X-Gm-Message-State: AOAM532D/yZGruf6sgoCgEI5DtloPBcjTLOG7SlQBNDehdRmLtDm2eV8
        HngANiiQYeGjKyItxQK/ae8iBpM28Ig=
X-Google-Smtp-Source: ABdhPJy5VHEDemPf+a3ImccmxYUxUqXnIDEdv+yRJ4EQ1r25qV2yIPtgNnuw+tI7eBrfG1Yfguk/6Q==
X-Received: by 2002:a17:90a:16d7:: with SMTP id y23mr5748296pje.227.1614188590865;
        Wed, 24 Feb 2021 09:43:10 -0800 (PST)
Received: from [10.230.29.30] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id e12sm3524448pjj.23.2021.02.24.09.43.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Feb 2021 09:43:10 -0800 (PST)
Subject: Re: [PATCH v2 0/2] leds: bcm63x8: improve read and write functions
To:     =?UTF-8?Q?=c3=81lvaro_Fern=c3=a1ndez_Rojas?= <noltari@gmail.com>
Cc:     Jonas Gorski <jonas.gorski@gmail.com>, Pavel Machek <pavel@ucw.cz>,
        Dan Murphy <dmurphy@ti.com>, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210224101110.20179-1-noltari@gmail.com>
 <a9a9fb30-2d90-33ff-9b80-af9d03b69c69@gmail.com>
 <B9E7BB0F-00E7-40CC-9571-E17E574E1C3F@gmail.com>
From:   Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <f94b922f-b720-1ea1-e1d1-405e7bb475de@gmail.com>
Date:   Wed, 24 Feb 2021 09:43:08 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <B9E7BB0F-00E7-40CC-9571-E17E574E1C3F@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org



On 2/24/2021 7:54 AM, Álvaro Fernández Rojas wrote:
> Hi Florian,
> 
>> El 24 feb 2021, a las 16:45, Florian Fainelli <f.fainelli@gmail.com> escribió:
>>
>>
>>
>> On 2/24/2021 2:11 AM, Álvaro Fernández Rojas wrote:
>>> This code is proven to work in BMIPS BE/LE and ARM BE/LE.
>>> See bcm2835-rng and bcmgenet.c:
>>> https://github.com/torvalds/linux/blob/3b9cdafb5358eb9f3790de2f728f765fef100731/drivers/char/hw_random/bcm2835-rng.c#L42-L60
>>> https://github.com/torvalds/linux/blob/3b9cdafb5358eb9f3790de2f728f765fef100731/drivers/net/ethernet/broadcom/genet/bcmgenet.c#L71-L88
>>
>> What is the motivation for doing this? bcm2835-rng and bcmgenet are used
>> across MIPS and ARM platforms therefore they need to be compatible with
>> both, but these two LEDs drivers are super specialized, are you working
>> on porting the 6328 LED driver to the newer ARM-based DSL SoCs such as
>> 63138 and 63148?
> 
> I just wanted to have all bmips drivers in line (at least regarding read/write).
> If I remember correctly someone told me that this controller was also present on some little endian SoCs, but you can confirm that :).
> Unfortunately I haven’t got any devices with ARM-based DSL SoCs, so the answer is no.

The 6328 LED controller could be utilized on the ARM-based DSL SoCs,
however 6358 will not, so changing the I/O accessors for that driver
sounds like just code churn to me.
-- 
Florian
