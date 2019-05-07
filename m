Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0D6DD16AAB
	for <lists+linux-leds@lfdr.de>; Tue,  7 May 2019 20:49:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726688AbfEGSti (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 7 May 2019 14:49:38 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:35116 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726464AbfEGSti (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 7 May 2019 14:49:38 -0400
Received: by mail-lj1-f194.google.com with SMTP id m20so6062853lji.2
        for <linux-leds@vger.kernel.org>; Tue, 07 May 2019 11:49:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=OVsi1cxHAOc8htzCkDx3cQa7CQnoLK2VK6wvK3PTM5s=;
        b=gAmjCwMoiAhOkpx5fMVMX/rppmSqKpDOfSoTjRycAgk28ErueusmMbdmcIdaI666AA
         4IJfAmBKk4wMR/eJBHvYPg+MrVZHySSewBPMw7Zhw2XEpDmRyx8cwx4HG/lAsLZ9uk7z
         z1Lc88iqASpi9prw7uN9eGVQrHl9XDm9OrUkEbtbbU1lzzLdy0cOe7Zok+4LQUnNie3h
         jIYLxBLOD0afb492SjqRTVA0faLM1VNr88Ipp2Qdqe79md/aM83bieVnFvVEFy0XFuH4
         QPMvLkH+WctgGl6kegAQmJTqiign8tSN3mcHnd9D34hU8ra0762R+s5iZDQJw/zhyh6O
         wn5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=OVsi1cxHAOc8htzCkDx3cQa7CQnoLK2VK6wvK3PTM5s=;
        b=c6XJzLFwvnslcRlHSyRc3RVI9pvaed0UO6fpeVbUeqNXVGyMML6ARj91eAsX3ab3wX
         0YIfqL8KuaLi6E4o1LgcyIwt8X8CWiCfbnysgZtW550S5QBnQa8mQ7mIRh/bIIFaXqWo
         /QDd1MEpLq9wnko9exQJHv10kW9ALYaF+aj6Y+iSSBs+34Mpain9spXrGE34xc8eGnJ7
         DesWRF9tBEE/bDoAAcahSycdssfV0l5q5o8HHoLn36rosgZig5VIpVTWJnqF4CcRv3hJ
         JxUBTxICFVjZ2pyB/5UiH+bZPPZ18/GgbYe1AhAGPpp98ri9zN2Vj3gLUy0gNnVtOTHJ
         /0Gg==
X-Gm-Message-State: APjAAAWh4NAB+Bb8AqV8tnYnpE8ZCcr9m+bXaAZMpF6eVu6kfBUs4BLa
        0x4GFkRTMBr0TTuZ8wn/aPVaUjE19k8=
X-Google-Smtp-Source: APXvYqwTvJlsY7hYMplqAo12Gu+/O3PBvHmwYpj9QVQWTQFiUk3r7eqruRx/ZJ/eiZqD594D+1+QMw==
X-Received: by 2002:a2e:814e:: with SMTP id t14mr18255015ljg.25.1557254975944;
        Tue, 07 May 2019 11:49:35 -0700 (PDT)
Received: from [192.168.1.19] (bgw158.neoplus.adsl.tpnet.pl. [83.28.86.158])
        by smtp.gmail.com with ESMTPSA id d23sm3171953ljj.38.2019.05.07.11.49.34
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 07 May 2019 11:49:35 -0700 (PDT)
Subject: Re: [PATCH v3 0/7] LMU Common code intro
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     Dan Murphy <dmurphy@ti.com>, pavel@ucw.cz,
        linux-leds@vger.kernel.org
References: <20190430191730.19450-1-dmurphy@ti.com>
 <34088323-9b40-7dea-5449-6a01bb721c00@gmail.com>
 <8166c0c1-facf-14da-7c71-5bc5a3cc23f7@gmail.com>
Message-ID: <bc5756ac-b383-dac3-4a45-c0ace03ce9ec@gmail.com>
Date:   Tue, 7 May 2019 20:49:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <8166c0c1-facf-14da-7c71-5bc5a3cc23f7@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Finally the patch set missed merge window for 5.2 due to
other requested improvements.

Thanks,
Jacek Anaszewski

On 5/1/19 11:45 AM, Jacek Anaszewski wrote:
> Ekhm, I forgot to add the main recipient.
> 
> Adding Lee.
> 
> On 5/1/19 12:05 AM, Jacek Anaszewski wrote:
>> Hi Lee,
>>
>> This patch set has dependency on the previous one for lm3532, which
>> also touches ti-lmu.txt bindings, and for which I already created
>> immutable branch. Now if I created another immutable branch for
>> this patch set we would have to resolve conflicts between the two,
>> as they would both be based on 5.1-rc1. Adds much overhead and
>> is error prone. Therefore I propose to apply this patch set on
>> top of my merge of LED tree with the immutable branch for lm3532.
>>
>> Please let me know if you see it differently. I'll wait for your
>> response until Friday, and then proceed with the above as I think
>> it should be harmless for MFD.
>>
>> Best regards,
>> Jacek Anaszewski
>>
>> On 4/30/19 9:17 PM, Dan Murphy wrote:
>>> Hello
>>>
>>> I have added the Reviewed-by for dt bindings as well as made the 
>>> Kconfig change
>>> pointed out for the common code flag
>>>
>>> Dan
>>>
>>> Dan Murphy (7):
>>>    dt-bindings: mfd: LMU: Fix lm3632 dt binding example
>>>    dt-bindings: mfd: LMU: Add the ramp up/down property
>>>    dt-bindings: mfd: LMU: Add ti,brightness-resolution
>>>    leds: TI LMU: Add common code for TI LMU devices
>>>    dt-bindings: ti-lmu: Modify dt bindings for the LM3697
>>>    mfd: ti-lmu: Remove support for LM3697
>>>    leds: lm3697: Introduce the lm3697 driver
>>>
>>>   .../devicetree/bindings/leds/leds-lm3697.txt  |  73 ++++
>>>   .../devicetree/bindings/mfd/ti-lmu.txt        |  56 ++-
>>>   drivers/leds/Kconfig                          |  15 +
>>>   drivers/leds/Makefile                         |   2 +
>>>   drivers/leds/leds-lm3697.c                    | 395 ++++++++++++++++++
>>>   drivers/leds/ti-lmu-led-common.c              | 155 +++++++
>>>   drivers/mfd/Kconfig                           |   2 +-
>>>   drivers/mfd/ti-lmu.c                          |  17 -
>>>   include/linux/mfd/ti-lmu-register.h           |  44 --
>>>   include/linux/mfd/ti-lmu.h                    |   1 -
>>>   include/linux/ti-lmu-led-common.h             |  47 +++
>>>   11 files changed, 712 insertions(+), 95 deletions(-)
>>>   create mode 100644 
>>> Documentation/devicetree/bindings/leds/leds-lm3697.txt
>>>   create mode 100644 drivers/leds/leds-lm3697.c
>>>   create mode 100644 drivers/leds/ti-lmu-led-common.c
>>>   create mode 100644 include/linux/ti-lmu-led-common.h
>>>
>>
>>
> 
