Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 863E82CDF56
	for <lists+linux-leds@lfdr.de>; Thu,  3 Dec 2020 21:07:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728938AbgLCUHc (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 3 Dec 2020 15:07:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725885AbgLCUHc (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 3 Dec 2020 15:07:32 -0500
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCBF1C061A54;
        Thu,  3 Dec 2020 12:06:51 -0800 (PST)
Received: by mail-wr1-x442.google.com with SMTP id g14so3124317wrm.13;
        Thu, 03 Dec 2020 12:06:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=PWPu1GzqV5FHg9xfQEvSGAQ5O7PflnkxSHLUb6RuJyM=;
        b=POS58uipglTVurisya+5rLohAt4eYU71k/c9L9Bltt3/oIrteIkrshnDW0l2ncjz6O
         vTyEq7haqlzshO+n2+++DxdnwTNrTd21393ZbXF2cSGelFOjPNZgr1GWvbBturH2Sz12
         RgQ6CNvxQ5dc/NUe5rdBn5cMP8Xb+40FXWFAEdGuZqBl7YdrQgZ3tt5dl5nxtgxBuO1d
         9PX0cgN8H/q/Sc//z4FEb8csQy5ePxscGBctMZQZPQ7amVIwIcMSh+BgEYRFWGJ6QsFg
         ZxDTa6zdpDuKPMT1h8EMJ6lIRVl7xKIowMfGk+9aAwi2yg7nzpSwFJTVBKfDEjvCcbef
         4u6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=PWPu1GzqV5FHg9xfQEvSGAQ5O7PflnkxSHLUb6RuJyM=;
        b=TJJlQEA7xyUcdhknLCAgeFIQ05sLKpRkatzUhufw2BNvc022UpEn6ZGVACyxH4UwRc
         nEeOsZ5dWBhHh+4qghkWN/iPuYaJ2MSYNmGc02gGR492ezbePET7SfdTpzTXEQ0+E4U9
         xHqoXDlkQLDylbSYKQGs4s28ksvRxAZqZQlDmIGiWHvAwI2lx0uAx1ASyN580AbulCPz
         nQFqZNl0Bj7AeOWgHkRA3y32sQzkUefKvOqpNtKmZMJn7lH8Vg3jSsC8VtKt1Btvdn4G
         QwIYP61m1uE1KEYMLOhAsINb2owTNTqM32/abDoOeSV7wRW428tw3us8ikjbmdZZgG8s
         4rNQ==
X-Gm-Message-State: AOAM531w4S+bs80W6mr5FcuM+LntsJHpjhrbOnAfHrPVojU659DgGdn0
        QDf9DCCfurYXh1h3e7dWFk8=
X-Google-Smtp-Source: ABdhPJxAioMssVD6ZRb5IlWH5ouH50sbnP5fPPTaWPj9wd/3CdZiufgPuMXWtLmqim46JhmP6mK6+w==
X-Received: by 2002:a5d:530d:: with SMTP id e13mr1018783wrv.92.1607026010695;
        Thu, 03 Dec 2020 12:06:50 -0800 (PST)
Received: from ?IPv6:2a01:110f:b59:fd00:2969:dca1:ffae:a9ff? ([2a01:110f:b59:fd00:2969:dca1:ffae:a9ff])
        by smtp.gmail.com with ESMTPSA id c2sm741399wrf.68.2020.12.03.12.06.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Dec 2020 12:06:50 -0800 (PST)
Subject: Re: [PATCH v11 3/5] dt-bindings: leds: Add LED_FUNCTION_MOONLIGHT
 definitions
To:     Pavel Machek <pavel@ucw.cz>,
        Gene Chen <gene.chen.richtek@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Dan Murphy <dmurphy@ti.com>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Gene Chen <gene_chen@richtek.com>, Wilma.Wu@mediatek.com,
        shufan_lee@richtek.com, cy_huang@richtek.com,
        benjamin.chao@mediatek.com
References: <1606906011-25633-1-git-send-email-gene.chen.richtek@gmail.com>
 <1606906011-25633-4-git-send-email-gene.chen.richtek@gmail.com>
 <20201202122329.GA30929@duo.ucw.cz>
 <CAE+NS34D8a6Udt7ZZ0=U7oqm5POtihKvD3WjD_sAADamqQ=1AQ@mail.gmail.com>
 <20201203114044.GA9061@duo.ucw.cz>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <87a4f0b9-1450-cd9f-70ea-dd5b408893f3@gmail.com>
Date:   Thu, 3 Dec 2020 21:06:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201203114044.GA9061@duo.ucw.cz>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Pavel,

On 12/3/20 12:40 PM, Pavel Machek wrote:
> Hi!
> 
>>>> +++ b/include/dt-bindings/leds/common.h
>>>> @@ -78,6 +78,7 @@
>>>>   #define LED_FUNCTION_INDICATOR "indicator"
>>>>   #define LED_FUNCTION_LAN "lan"
>>>>   #define LED_FUNCTION_MAIL "mail"
>>>> +#define LED_FUNCTION_MOONLIGHT "moonlight"
>>>
>>> There's "torch" function that should be used for this. I guess comment
>>> should be added with explanation what exactly that is and how should
>>> the LED be named.
>>>
>>
>> According to mail, 11/25 "Re: [PATCH v7 2/5] dt-bindings: leds: Add
>> LED_COLOR_ID_MOONLIGHT definitions",
>> The Moonlight LED is LED which maximum current more than torch, but
>> less than flash. Such as front camera fill light.
>> I think our channel is moonlight, not torch.
>> I will add this description to comment.
>> We can't exactly define moonlight current level, because every vendor
>> has their own specification.
> 
> So... what is the timelimit on moonlight?
> 
> But if it is used for camera illumination, I believe it should be
> simply called flash.

Let's keep FLASH reserved for LED flash class devices.
This device has already two other flash iouts.

Also iouts amperage gives clue that they have three different
functions.

-- 
Best regards,
Jacek Anaszewski
