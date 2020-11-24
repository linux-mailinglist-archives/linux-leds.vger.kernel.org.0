Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A534F2C3265
	for <lists+linux-leds@lfdr.de>; Tue, 24 Nov 2020 22:16:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730122AbgKXVPZ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 24 Nov 2020 16:15:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728492AbgKXVPZ (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 24 Nov 2020 16:15:25 -0500
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0276C0613D6;
        Tue, 24 Nov 2020 13:15:24 -0800 (PST)
Received: by mail-ej1-x643.google.com with SMTP id f23so14344ejk.2;
        Tue, 24 Nov 2020 13:15:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=w1qiBNDdA1JwHw+2ZKcim6vrSTIhQv+8rDMvJ+E/JrQ=;
        b=kB+JIj6u4ow4o9fOz1GCL4oA8OsRunaz/tLguMU6KPdHTamjb0OfniiJjyeu8yJEdA
         AeX9sTZ8Vbjqsyx5jQTLdXQfienb1ojx0Xet2YY3X18T37cNyr0OCSNXJYGKT0mXIhbU
         TTnqyqP+tMM9UgQbhDgaK0eCjyFrQDNZU0Tv8/PSEjZzWUGLiwUKS8DQfUzzL1MSWDlk
         loGdrZvHX/GSUGQqynhVkJxnhwCSht/W2QPf/i02wSm1t87Rzf3og4hcgAQwPkcck6FW
         WNJ+W5DQDs7kZ/oYNf9lfLHrs8lumLy/vv4m8fE/aiMzezk2jyXE0hCEw13W3P8WyQbP
         ThxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=w1qiBNDdA1JwHw+2ZKcim6vrSTIhQv+8rDMvJ+E/JrQ=;
        b=VanvfpqRneCGqWpajjHmkQ+KJTCYc9ES/p33cUREdhMssM2XJ582QibceTTrQgUP3b
         K2a1aOqRNIXOvLPZVXz/wb1mRr3sryYXiSwxnulc2fkAwt0r3uy4oHxcKmM3Em8ZM5+G
         amUQTRwQvBr/hJMPtRiTEpm4IjWkzRh2czr3rV/UDAeNHQfPLNN42o8QUtXd5FLjb13C
         7BEaaqdKAvoH6QQL5kmms33ZVOcdkdMp+w0CGXkwXQwyEmetqiee3Ns2sVhk45QPBvkm
         pbnjrOIiHKBWCv0l8otbXOZ3sROicPoyy7m5y1eBO7sG6IWZWSpUWdX6iND+ZnZoX9F0
         FDPA==
X-Gm-Message-State: AOAM530cOkP2lkc7QRQ0435O6P2M6JYDbi5ah9pkq74QVCGL+DGTRe8W
        HprJa63Afpp9VYTSYTYiMiw=
X-Google-Smtp-Source: ABdhPJzYs+ib7boCpe0azznlmvJsLrs8rSJXM0GayRzIyyD7uhJFKjTe3LSeK1BW6W6MACfIua3Zew==
X-Received: by 2002:a17:906:5847:: with SMTP id h7mr344686ejs.124.1606252523461;
        Tue, 24 Nov 2020 13:15:23 -0800 (PST)
Received: from ?IPv6:2a01:110f:b59:fd00:b507:ec4b:7acf:a836? ([2a01:110f:b59:fd00:b507:ec4b:7acf:a836])
        by smtp.gmail.com with ESMTPSA id gf6sm94382ejb.80.2020.11.24.13.15.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2020 13:15:22 -0800 (PST)
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
 <5c4a5780-afec-fa7f-307e-b969192ec677@gmail.com>
 <CAE+NS36yU_ho5eV=j2rd36XqGXBKj3d8KP-bsrCCnWvxzV3Afw@mail.gmail.com>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <e792dbfc-4b98-058d-bbe5-fd556463a757@gmail.com>
Date:   Tue, 24 Nov 2020 22:15:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <CAE+NS36yU_ho5eV=j2rd36XqGXBKj3d8KP-bsrCCnWvxzV3Afw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 11/24/20 7:08 AM, Gene Chen wrote:
[...]
>>>> This function should be placed after #ifdef block because its
>>>> shape is the same for both cases.
>>>>
>>>>> +static inline void led_classdev_flash_unregister(struct led_classdev_flash *fled_cdev) {};
>>>>> +static inline int devm_led_classdev_flash_register_ext(struct device *parent,
>>>>> +                                  struct led_classdev_flash *fled_cdev,
>>>>> +                                  struct led_init_data *init_data)
>>>>> +{
>>>>> +     return -EINVAL;
>>>>
>>>> /-EINVAL/0/
>>>>
>>>> Please do the same fix in all no-ops in the led-class-multicolor.h,
>>>> as we've discussed.
>>>>
>>>
>>> I think return -EINVAL is correct, because I should register flash
>>> light device if I define FLED in DTS node.

OK, I think I'm getting your concerns now. So you're only partially
correct - the driver should register flash LED device if there is
corresponding node in DT, but only if CONFIG_LEDS_CLASS_FLASH is 
enabled. In case it is disabled the no-op will come into play
and return 0, allowing the probe() to proceed as if the registration
succeeded.

 From the driver point of view nothing changes, except that flash LED
ops will not be called afterwards. This is common pattern. If in doubt
skim through the headers in include/linux.

>>
>> I don't quite follow your logic here.
>>
>> No-op function's purpose is to simplify the code on the caller's side.
>> Therefore it should report success.
>>
>> Please return 0 from it.
>>
> 
> Just like those functions in led-class-multicolor.h, caller may use
> return value to check whether FLED is registered successfully or not.
> For this case, is returning 0 a little bit misleading?

Please note that I've already admitted that led-class-multicolor.h
class is buggy and should also be fixed to return 0 from its no-ops.
Please apply the "s/-EINVAL/0/" fixes to it as well - your driver will
need that.

-- 
Best regards,
Jacek Anaszewski
