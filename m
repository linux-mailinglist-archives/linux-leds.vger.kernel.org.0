Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CA591257BD
	for <lists+linux-leds@lfdr.de>; Tue, 21 May 2019 20:46:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729284AbfEUSqo (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 21 May 2019 14:46:44 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:41129 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729240AbfEUSqn (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 21 May 2019 14:46:43 -0400
Received: by mail-lf1-f66.google.com with SMTP id d8so13872553lfb.8;
        Tue, 21 May 2019 11:46:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=QauUjdnp9yGFnxXAzu+JIWLAgnuLKOd5eUrMlHdNl0c=;
        b=ko+3HCp84aZL1+k1Bb5stEsCb77OeNwCB7QehQN7jUJegHiejDn/BTPnxE6pn2vST/
         F2Ac8mCYqqCIr6YuV0aFV+kTpzpju8L4prSJIwmeUAc3sRtOuK+F4ojeB4l4ORbJANCS
         fNONAbH2Z3zJGTTVXaY3RjjgEVmMX2tG92T+sABXr85eUGX3+bKwDq67IzPjHThMoRqC
         yr/LaBPR5HfX3am7ivToJi+vYVOAZ/AfpbwVS1uZJ6iR5HCqRVJQr+ktNRRcUcKQVGjA
         SY3VmSfo6B+VKVg+Ywm5w+gm+WaEs3VwaMmdeWQ+KmB41RrqeklOmKGRqWp4abuKVLtp
         ilCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=QauUjdnp9yGFnxXAzu+JIWLAgnuLKOd5eUrMlHdNl0c=;
        b=O9kwMfYVt9nh6e3G/wHcdN4bHuPlAmMvfAougob8QoNOxgjv/Z6pZjDPAkL4CPRpsU
         +wZuq2E4LzLil1FQHWK/12pZohULtoSzi7BjzA44+yHDL/SbBSj62aJQSliYRs1qrOOM
         eOK5m0CKMplQgDWbvKMWOsUBShqXIggu838PzVB8DslCuHzC+6EfKUOpqRPGaWc3Em0v
         il2TV5E5EZWUR89+tllHqMCM74c3B7+jVLUSEbWP4RxcyFigiBPxGsp4X4z/oXCP3JZT
         Hjua2OGeWGF5yqLsxfII98lCHxva/gVmujLZOlIBvzU3J/mAsL2K5fYZznVjn+a2aL6C
         PmIw==
X-Gm-Message-State: APjAAAUea/gKy/B3c+H+btE+7ZqIGLPwK260OFEHHase+F6db/5VebKg
        QeMxqZ1o6eLi3wdLxjnzShmhpa+f
X-Google-Smtp-Source: APXvYqzIU2HImHolYaU1unbZJ3pRmSx81HGBlZv2lSH/uhyASopmO/4EABvzjnlH7Sn0B3R49X5rnQ==
X-Received: by 2002:ac2:48a8:: with SMTP id u8mr18792983lfg.141.1558464401520;
        Tue, 21 May 2019 11:46:41 -0700 (PDT)
Received: from [192.168.1.17] (dkv215.neoplus.adsl.tpnet.pl. [83.24.25.215])
        by smtp.gmail.com with ESMTPSA id y14sm1297129ljh.60.2019.05.21.11.46.39
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 21 May 2019 11:46:40 -0700 (PDT)
Subject: Re: [PATCH v4 6/6] leds: lm36274: Introduce the TI LM36274 LED driver
To:     Dan Murphy <dmurphy@ti.com>, pavel@ucw.cz
Cc:     lee.jones@linaro.org, rdunlap@infradead.org,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20190507201159.13940-1-dmurphy@ti.com>
 <20190507201159.13940-7-dmurphy@ti.com>
 <77f1ed5b-bfd2-510c-edd5-1b702f2d1d45@gmail.com>
 <8d126925-9e71-dba4-eb88-50fd6e6c06d8@ti.com>
 <a7cb6628-e501-b580-f714-0e5de78ea39c@gmail.com>
 <d0c49197-984d-5cd8-032a-27d9c5ca6d29@ti.com>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <97ff2f48-9ec0-06f1-b667-56fcdef8bf03@gmail.com>
Date:   Tue, 21 May 2019 20:46:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <d0c49197-984d-5cd8-032a-27d9c5ca6d29@ti.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Dan,

On 5/21/19 8:25 PM, Dan Murphy wrote:
> Jacek
> 
> On 5/21/19 12:40 PM, Jacek Anaszewski wrote:
>> On 5/20/19 11:19 PM, Dan Murphy wrote:
>>> Jacek
>>>
>>> On 5/20/19 2:54 PM, Jacek Anaszewski wrote:
>>>> Hi Dan,
>>>>
>>>> On 5/7/19 10:11 PM, Dan Murphy wrote:
>>>>> Introduce the LM36274 LED driver.  This driver uses the ti-lmu
>>>>> MFD driver to probe this LED driver.  The driver configures only the
>>>>> LED registers and enables the outputs according to the config file.
>>>>>
>>>>> The driver utilizes the TI LMU (Lighting Management Unit) LED common
>>>>> framework to set the brightness bits.
>>>>>
>>>>> Signed-off-by: Dan Murphy <dmurphy@ti.com>
>>>>> ---
>>>>>     drivers/leds/Kconfig        |   7 ++
>>>>>     drivers/leds/Makefile       |   1 +
>>>>>     drivers/leds/leds-lm36274.c | 174 ++++++++++++++++++++++++++++++++++++
>>>>>     3 files changed, 182 insertions(+)
>>>>>     create mode 100644 drivers/leds/leds-lm36274.c
>>>>>
>>>>> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
>>>>> index 255fdd5e8491..db83a3feca01 100644
>>>>> --- a/drivers/leds/Kconfig
>>>>> +++ b/drivers/leds/Kconfig
>>>>> @@ -791,6 +791,13 @@ config LEDS_LM3697
>>>>>           Say Y to enable the LM3697 LED driver for TI LMU devices.
>>>>>           This supports the LED device LM3697.
>>>>>     +config LEDS_LM36274
>>>>> +    tristate "LED driver for LM36274"
>>>>> +    depends on LEDS_TI_LMU_COMMON
>>>>
>>>> Shouldn't we have "depends on MFD_TI_LMU" as well here?
>>>>
>>>
>>> Actually the LEDS_TI_LMU_COMMON flag should depend on MFD_TI_LMU.
>>> Then it would inherit that dependency.
>>
>> LEDS_TI_LMU_COMMON does not seem too have any dependency on MFD_TI_LMU,
>> and it would be incorrect to require enabling MFD_TI_LMU for all drivers
>> depending on TI_LMU_COMMON, that can be probed on their own, like
>> leds-lm3697.c .
>>
> 
> Correct.
> 
> I can update the Kconfigs unless you want to ammend the commits.

I added "depends on MFD_TI_LMU" to "config LEDS_LM36274".
Please verify your patch sets pushed to [0].

[0] 
https://git.kernel.org/pub/scm/linux/kernel/git/j.anaszewski/linux-leds.git/log/?h=ib-leds-mfd-regulator

-- 
Best regards,
Jacek Anaszewski
