Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9FFDB2944B5
	for <lists+linux-leds@lfdr.de>; Tue, 20 Oct 2020 23:47:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389754AbgJTVrC (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 20 Oct 2020 17:47:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389617AbgJTVrC (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 20 Oct 2020 17:47:02 -0400
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A5B5C0613CE;
        Tue, 20 Oct 2020 14:47:02 -0700 (PDT)
Received: by mail-ej1-x642.google.com with SMTP id h24so4956305ejg.9;
        Tue, 20 Oct 2020 14:47:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=fT5KwI1u6PV8EmjtyHpKqwjn8VqaBxGqgtD+UYm6G/w=;
        b=Gs/w6JM7zA6yL1ixdYo1xR++QcsTBl9aPPPmTi4LPCXqtcDSCsqlk25SUycBw5BAPq
         lshXIwVAyQmQeHnMmNOE4CAcNnWfUuah3dultc6A7qA546Dis3N/2bSsJ3iLNk7GG4PQ
         Kq93Z/YksnxpG+6FLS5CU3NfXpn/ogqMrYxkiDrpJoyPi6BmQCECe9wVFBdwoAbl0SMa
         01zrWTokETo5D6DzICgTxTe3pr7X1PmIFDgQxYUV5/PPk3grP87lbA5a7CRpYguw72Hs
         7Aa9lBvIOaZszZoF6bNXzNag+O+25IzLyZForF8uJ8pyrOXwU9gurtOPWxZzXXtcAwQ/
         pe1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=fT5KwI1u6PV8EmjtyHpKqwjn8VqaBxGqgtD+UYm6G/w=;
        b=KhYM+vYvzKYOIoqE2TNN3A7vtBpTS1itNBAZFZKfmglDRzos0zVBX/5ACLmerwbcF+
         WjEm01RxsLg0T+ZduwgaZLSxgubZcpGNJ464A7Q9LXQS4HdSh1eH3KO3ivxjD4MBckbz
         WQrI12N0hvIZB/jggYJ9Ls7W8yOI/j446mgRaL2DzeycsfiO37lwv6aNx2rauXZt/IFH
         /zH7/2ybY/JvrNry/alc99zajWmPSHYL03vfY8P2ZcQMi5TTCqw5J5SXJyfbKExYGkBJ
         Le1UANZAlXUP4cBeYecX0bEfHPrxzOvXuVe933G81KJuTPHsvbD+xJ/C5usrEcuOp8xO
         4Hog==
X-Gm-Message-State: AOAM533ixAtHcl53nSnvTxBMEcgILRrMD8/8piYc8jDubkKFUv5oCfSg
        n0eRVOnHFLQFE3iMd6ahVkpNpFGn1ac=
X-Google-Smtp-Source: ABdhPJzR95k+qiXGnZue7DquJHpX6z+X0kmVYYGtiPcjz51ZgZ/tz2/zilEua/Slair4hem1PZTnaA==
X-Received: by 2002:a17:906:1e95:: with SMTP id e21mr190796ejj.355.1603230420970;
        Tue, 20 Oct 2020 14:47:00 -0700 (PDT)
Received: from ?IPv6:2a01:110f:b59:fd00:7dff:cc5e:4622:485f? ([2a01:110f:b59:fd00:7dff:cc5e:4622:485f])
        by smtp.gmail.com with ESMTPSA id p2sm107051ejd.34.2020.10.20.14.46.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2020 14:47:00 -0700 (PDT)
Subject: Re: [PATCH v5 2/2] leds: mt6360: Add LED driver for MT6360
To:     Gene Chen <gene.chen.richtek@gmail.com>
Cc:     Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
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
References: <1602034966-3524-1-git-send-email-gene.chen.richtek@gmail.com>
 <1602034966-3524-3-git-send-email-gene.chen.richtek@gmail.com>
 <5a9b31c4-739c-06fc-2015-ed474993ad22@gmail.com>
 <CAE+NS35Y41mFKNhj+54BeeSYFu2J9BtvMWOxyMcf9a==39cbdA@mail.gmail.com>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <8925db23-5cc4-3c5f-932a-461fe6450dad@gmail.com>
Date:   Tue, 20 Oct 2020 23:46:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <CAE+NS35Y41mFKNhj+54BeeSYFu2J9BtvMWOxyMcf9a==39cbdA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 10/20/20 8:44 AM, Gene Chen wrote:
> Jacek Anaszewski <jacek.anaszewski@gmail.com> 於 2020年10月9日 週五 上午5:51寫道：
>>
>> Hi Gene,
>>
>> On 10/7/20 3:42 AM, Gene Chen wrote:
>>> From: Gene Chen <gene_chen@richtek.com>
>>>
>>> Add MT6360 LED driver include 2-channel Flash LED with torch/strobe mode,
>>> 3-channel RGB LED support Register/Flash/Breath Mode, and 1-channel for
>>> moonlight LED.
>>>
>>> Signed-off-by: Gene Chen <gene_chen@richtek.com>
>>> ---
>>>    drivers/leds/Kconfig       |  12 +
>>>    drivers/leds/Makefile      |   1 +
>>>    drivers/leds/leds-mt6360.c | 783 +++++++++++++++++++++++++++++++++++++++++++++
>>>    3 files changed, 796 insertions(+)
>>>    create mode 100644 drivers/leds/leds-mt6360.c
>>>
>>> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
>>> index 1c181df..c7192dd 100644
>>> --- a/drivers/leds/Kconfig
>>> +++ b/drivers/leds/Kconfig
>>> @@ -271,6 +271,18 @@ config LEDS_MT6323
>>>          This option enables support for on-chip LED drivers found on
>>>          Mediatek MT6323 PMIC.
>>>
>>> +config LEDS_MT6360
>>> +     tristate "LED Support for Mediatek MT6360 PMIC"
>>> +     depends on LEDS_CLASS_FLASH && OF
>>> +     depends on LEDS_CLASS_MULTICOLOR
>>
>> Since CONFIG_LED_CLASS_MULTICOLOR can be turned off you need to have
>> below instead:
>>
>> depends on LEDS_CLASS_MULTICOLOR || !!LEDS_CLASS_MULTICOLOR
>>
>> Unless you want to prevent enabling the driver without RGB LED,
>> but that does not seem to be reasonable at first glance.
>>
> 
> May I change to "select LEDS_CLASS_MULTICOLOR"?
> I suppose RGB always use multicolor mode.

You will also have moonlight LED that will not need multicolor
framework. Is it somehow troublesome to keep "depends on"?

-- 
Best regards,
Jacek Anaszewski
