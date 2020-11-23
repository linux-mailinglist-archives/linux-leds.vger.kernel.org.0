Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3EFBB2C1750
	for <lists+linux-leds@lfdr.de>; Mon, 23 Nov 2020 22:11:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730104AbgKWVHE (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 23 Nov 2020 16:07:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729939AbgKWVHE (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 23 Nov 2020 16:07:04 -0500
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 043C1C0613CF;
        Mon, 23 Nov 2020 13:07:02 -0800 (PST)
Received: by mail-ed1-x541.google.com with SMTP id q16so18579020edv.10;
        Mon, 23 Nov 2020 13:07:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=eCKQHOm6yrNlbYBkTUcKRxSyfXODx3SiT7JXRbFTfOs=;
        b=oRVIARoj6Npne1uHahzkvz6Iqk4N8tWjy2k64IeeSHtjUbR4yhzBpFbv+vHgt0pydK
         9vHFoChzqhHamWgIwWS30goFKdlRtHYiIzi9FhBMv79qwtnIgqDTuoqcPjXwclyFJCuD
         adVcwzpdR7pqc+qI6Je3aNEZvgD/H6BSmoa5xKIJ2KUF78k7KB5AtOUvbmLQ47gfb6UX
         3qPJWbGKaAMCmcoM6X96KLdoNG5aTj/6MLIXqILy+m1PrMNwkqfvdSLzWADkQwMPnfCI
         oOGEkFfFtVWerj44JSXV5/mGRVi7VYJ8QZTLcGyQDxeexrO8cLhkU060Wj4OYkP7L+4E
         jUmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=eCKQHOm6yrNlbYBkTUcKRxSyfXODx3SiT7JXRbFTfOs=;
        b=ovnaWFzW5FXHww+G8vfePOFf7+mZwZsL7rdni5eF3AX4CJaCi/qsCmLk+gBrPqK9L2
         5NMriHB2So3P7ulyXPIMsmG4GY6sgyeiVJH6evSknpYxW18/B38xnQeHnx5ozCoY+1Q7
         9p1OdOnSXg7T1u98fenG/9CTRyqnd+5TfTw51+kh6jpU+2ea6ugnoV1gDMficGOfF4T0
         heJ8QiwnYcacfBAPwhzGjwewgZZGwZr+ds6acWnbqr8sfAPoh40TP28Ld+85wRMkIHDz
         QSg+YJYigkfqpyW6PsRiG1NpquRID/Ceqvg3IrfTJLvN+CYUYucckyPVF8tPU/ZYvmCt
         6/3w==
X-Gm-Message-State: AOAM530UZpPhPwMA1G0OC/0zGfSq6q3bo14I4l9q6bf2XBcaereVsSZf
        CWnGlJk6m/NMHYKTDE7KfMYnCM/dF7Q=
X-Google-Smtp-Source: ABdhPJzGgxkRXgJEslQ81aBHIfM30EdAKpVjc9uhBXXm+OQBmE34napFZKPTbU4TtGZ1lx+t0iDsrQ==
X-Received: by 2002:a05:6402:1358:: with SMTP id y24mr994373edw.291.1606165620724;
        Mon, 23 Nov 2020 13:07:00 -0800 (PST)
Received: from ?IPv6:2a01:110f:b59:fd00:7836:e682:dddf:6361? ([2a01:110f:b59:fd00:7836:e682:dddf:6361])
        by smtp.gmail.com with ESMTPSA id lz27sm5586999ejb.39.2020.11.23.13.06.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2020 13:07:00 -0800 (PST)
Subject: Re: [PATCH v7 1/5] leds: flash: Add flash registration with undefined
 CONFIG_LEDS_CLASS_FLASH
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
References: <1605696462-391-1-git-send-email-gene.chen.richtek@gmail.com>
 <1605696462-391-2-git-send-email-gene.chen.richtek@gmail.com>
 <3164b1ed-9e47-88cd-d492-ff5a9243e5ef@gmail.com>
 <CAE+NS350vuY1qNwn4_7ow8Z22_DfHrJAnKX1dsFM_WbaHziZiw@mail.gmail.com>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <5c4a5780-afec-fa7f-307e-b969192ec677@gmail.com>
Date:   Mon, 23 Nov 2020 22:06:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <CAE+NS350vuY1qNwn4_7ow8Z22_DfHrJAnKX1dsFM_WbaHziZiw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 11/23/20 4:20 AM, Gene Chen wrote:
> Jacek Anaszewski <jacek.anaszewski@gmail.com> 於 2020年11月20日 週五 上午6:29寫道：
>>
>> Hi Gene,
>>
>> On 11/18/20 11:47 AM, Gene Chen wrote:
>>> From: Gene Chen <gene_chen@richtek.com>
>>>
>>> Add flash registration with undefined CONFIG_LEDS_CLASS_FLASH
>>>
>>> Signed-off-by: Gene Chen <gene_chen@richtek.com>
>>> ---
>>>    include/linux/led-class-flash.h | 36 ++++++++++++++++++++++++++++++++++++
>>>    1 file changed, 36 insertions(+)
>>>
>>> diff --git a/include/linux/led-class-flash.h b/include/linux/led-class-flash.h
>>> index 21a3358..4f56c28 100644
>>> --- a/include/linux/led-class-flash.h
>>> +++ b/include/linux/led-class-flash.h
>>> @@ -85,6 +85,7 @@ static inline struct led_classdev_flash *lcdev_to_flcdev(
>>>        return container_of(lcdev, struct led_classdev_flash, led_cdev);
>>>    }
>>>
>>> +#if IS_ENABLED(CONFIG_LEDS_CLASS_FLASH)
>>>    /**
>>>     * led_classdev_flash_register_ext - register a new object of LED class with
>>>     *                               init data and with support for flash LEDs
>>> @@ -127,6 +128,41 @@ static inline int devm_led_classdev_flash_register(struct device *parent,
>>>    void devm_led_classdev_flash_unregister(struct device *parent,
>>>                                        struct led_classdev_flash *fled_cdev);
>>>
>>> +#else
>>> +
>>> +static inline int led_classdev_flash_register_ext(struct device *parent,
>>> +                                 struct led_classdev_flash *fled_cdev,
>>> +                                 struct led_init_data *init_data)
>>> +{
>>> +     return -EINVAL;
>>
>> s/-EINVAL/0/
>>
>> The goal here is to assure that client will not fail when using no-op.
>>
>>> +}
>>> +
>>> +static inline int led_classdev_flash_register(struct device *parent,
>>> +                                        struct led_classdev_flash *fled_cdev)
>>> +{
>>> +     return led_classdev_flash_register_ext(parent, fled_cdev, NULL);
>>> +}
>>
>> This function should be placed after #ifdef block because its
>> shape is the same for both cases.
>>
>>> +static inline void led_classdev_flash_unregister(struct led_classdev_flash *fled_cdev) {};
>>> +static inline int devm_led_classdev_flash_register_ext(struct device *parent,
>>> +                                  struct led_classdev_flash *fled_cdev,
>>> +                                  struct led_init_data *init_data)
>>> +{
>>> +     return -EINVAL;
>>
>> /-EINVAL/0/
>>
>> Please do the same fix in all no-ops in the led-class-multicolor.h,
>> as we've discussed.
>>
> 
> I think return -EINVAL is correct, because I should register flash
> light device if I define FLED in DTS node.

I don't quite follow your logic here.

No-op function's purpose is to simplify the code on the caller's side.
Therefore it should report success.

Please return 0 from it.

-- 
Best regards,
Jacek Anaszewski
