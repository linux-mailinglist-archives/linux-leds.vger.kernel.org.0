Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 436A7153B8
	for <lists+linux-leds@lfdr.de>; Mon,  6 May 2019 20:34:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726277AbfEFSeT (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 6 May 2019 14:34:19 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:42541 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726218AbfEFSeT (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 6 May 2019 14:34:19 -0400
Received: by mail-lj1-f195.google.com with SMTP id y10so5461284lji.9;
        Mon, 06 May 2019 11:34:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=9dr2t70HqoErcc6AIpx/L947AGG3Wuq83IlK9OTfe4M=;
        b=I+8EtU+x/wZ64yCcz+n1HABkgUojO1695Aj6BiDt16itoEG6tyZgD7+2FanrxXDgWQ
         4YhwaOKOXQOvjRguxtZb4QmeWYEI7qoS5Sb+nPzXP5ayjJMPJXCP0z/npEIf+CObnQam
         qXxjuTeFp1vKTcX+AFuuhoeAZgHTbYrBzE5XreyblnvIpEefm/RuYyyNxoUtCV3gyiMJ
         nYSbxaCLQeQT6ymc5Q8wX/13ZyGhoMiaOjQOQkuBACkJLVijcPVCjuZssb5veAYGKCvN
         37Elxliqag8qmEzPaJ7aFOin9Ksfml4RcuBWHLidPh8M4rDGP77AKzwWxj6dnldwLfsw
         y1wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=9dr2t70HqoErcc6AIpx/L947AGG3Wuq83IlK9OTfe4M=;
        b=NGoCkm3YqFdidp6IZO27LVVNkX0n+5VdGyhtHM0gC+bOMt6QOxLzVwxkcxnLo9NChc
         J39U3KwtIm5A7I1oSsLik47JlONiFkWXfNI7DKPdYCKlJ/YOkpEIWmQPsFOkv4ydPu1p
         UkK0Plc9fC4WEcNEyosbwqS021ZdqWMnu4j7msOqn///q244froH3PCogiq8SWgxOb1r
         9CtaUB4JDTlClxz8Nvp0uwkz1ID9YMY60R5QVA8TlDb2ZagjdsuKW0QUHGIZ2pz1E2ft
         oe5445rjUHdFJU0U2wPF7rAqVMBagVifjMVrPQw7whvNLzsSdZjVbcrPNGIVeeuntC6r
         STlw==
X-Gm-Message-State: APjAAAUZgK6F4V18VNl4BQNBre/iyhP/a3fyc/16Hk27Yjkl1G/c2jIp
        uFK2vmrPNdcmMaUt86ic868=
X-Google-Smtp-Source: APXvYqxHsTfseI10v12uh7c3tXqU4nXRPIG+cQ+2XEhMBnaONwRDOjQIAGgqh3FZ2iOANcHw/zPh3g==
X-Received: by 2002:a2e:99d2:: with SMTP id l18mr14051374ljj.27.1557167657195;
        Mon, 06 May 2019 11:34:17 -0700 (PDT)
Received: from [192.168.1.19] (chs110.neoplus.adsl.tpnet.pl. [83.31.16.110])
        by smtp.gmail.com with ESMTPSA id k10sm2486563ljh.86.2019.05.06.11.34.15
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 06 May 2019 11:34:16 -0700 (PDT)
Subject: Re: [PATCH v2 2/2] leds: spi-byte: add single byte SPI LED driver
To:     Christian Mauderer <oss@c-mauderer.de>, Pavel Machek <pavel@ucw.cz>
Cc:     linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        Dan Murphy <dmurphy@ti.com>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
References: <20190505125242.10298-1-oss@c-mauderer.de>
 <20190505125242.10298-2-oss@c-mauderer.de>
 <da311a7e-0d3b-5c60-5bed-06446e71e5ff@gmail.com> <20190505201218.GA21957@amd>
 <911128ec-1327-5895-d101-97801e9c777a@c-mauderer.de>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <cf99d1f1-4cb2-4e60-3ce1-d123f28536bc@gmail.com>
Date:   Mon, 6 May 2019 20:34:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <911128ec-1327-5895-d101-97801e9c777a@c-mauderer.de>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Christian,

On 5/6/19 10:48 AM, Christian Mauderer wrote:
> On 05/05/2019 22:12, Pavel Machek wrote:
>> Hi!
>>
>>>> +	led = devm_kzalloc(dev, sizeof(*led), GFP_KERNEL);
>>>> +	if (!led)
>>>> +		return -ENOMEM;
>>>> +
>>>> +	led->spi = spi;
>>>> +	strlcpy(led->name, name, sizeof(led->name));
>>>> +	mutex_init(&led->mutex);
>>>> +	led->off_value = off_value;
>>>> +	led->max_value = max_value;
>>>> +	led->ldev.name = led->name;
>>>> +	led->ldev.brightness = LED_OFF;
>>>
>>> This line is redundant - already zeroed by kzalloc.
>>
>> Actually I'd prefer to leave it in. Yes, LED_OFF == 0, and will
>> probably stay == 0 in future, but...
>> 									Pavel
>>
> 
> Before I send v4: Currently the initial value isn't written to the LED
> anywhere. The state that is set by U-Boot is just kept till the first
> write to the brightness file.
> 
> I didn't implement "default-state" because the OpenWRT user space sets
> the LED anyway a few seconds later (which is still my use case for that
> driver). But now I noted that there is a remark in the documentation of
> the option "default-state" in devicetree/bindings/leds/common.txt: "The
> default is off if this property is not present."
> 
> Should I send an initial value to the device during initialization or is
> it OK to just keep the original state?

Yes, I would make use of default-state in this case.

-- 
Best regards,
Jacek Anaszewski
