Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5CF752591A
	for <lists+linux-leds@lfdr.de>; Tue, 21 May 2019 22:40:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727493AbfEUUkV (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 21 May 2019 16:40:21 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:43844 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727341AbfEUUkU (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 21 May 2019 16:40:20 -0400
Received: by mail-lj1-f193.google.com with SMTP id z5so9900lji.10;
        Tue, 21 May 2019 13:40:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=85X1q9FFhREECXDD2QJfVWU7IM8u4t7MWuEU1Zy1brk=;
        b=aXTYNU09ZejTperCr9pkAs0tgeih9kMpaGws7kJIAMBgmsZHqvDFKMzL1pDhMB/jF2
         RjiQ0ReEEMTIcoe1e22x8RU6cxDwZbaUvR/ptyWYx2/OU8sLjv3ODXf1Xdqq8z1bFI/t
         sDJ55XePWL6nJdTG+TWGSsGcy/6bWiwaexkYsEqblA2fJNx85gIHCuOhnONnnIi2pKWs
         vCMtM9EB7eibQe2K470fcLlJzTbywHiW/G6MaSpVCrnm0ujgIz4vEOUL2VoxTSeKE4DR
         oJCh8eP899sGmyou4P6aUxZvj+uPOz+FS1LBkjfhe7XNHIu8j2N8z9NZO7fM5so73Peu
         Nd0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=85X1q9FFhREECXDD2QJfVWU7IM8u4t7MWuEU1Zy1brk=;
        b=onv27KC+nvNp9ogcVEj9zPoVAS1kV+VK3goz6LE1Ak8p1huc9ID1GmMchB/g7WQJG+
         1QR3lAsS5+EAzwCdIzLShNesh8tS6V5dZISBlPVamcju/7Jqo5RthB8Mb7Bo1yXggIoG
         ghbmS0K7tnB7FZ2zkWEMu56mBLat4Z4jrbXFOJGfBf6RXNMazPPis6u2JpNDxiIIAytv
         0qVHsUTypU8gkNv8sx0S4/CQjqLJAdHgbDZKu7Ik/vzSHHIqAixnOA0dx/zAlqp7NeVj
         rktMXflbi0zDSwCp3wMYnSQPVDpEQrN2qwmfPqPcH9Pi2KaHiurYRqziranpbOR9HH73
         QqdQ==
X-Gm-Message-State: APjAAAUKpuzslZ9Fark02tE6jws/4sgjB6PUvFE3+mQizLrr3w5kpqC4
        ml4zRTedbDK/nAnts/WQ31o/+LHxKZg=
X-Google-Smtp-Source: APXvYqxC+WMoiiwCEUF4a/IDbNP9n3kqAc+VLG6h/a6t1nki/IkRRcEJAohziIJrV8q512hpDC/mkg==
X-Received: by 2002:a2e:4701:: with SMTP id u1mr37163319lja.38.1558471218147;
        Tue, 21 May 2019 13:40:18 -0700 (PDT)
Received: from [192.168.1.17] (dkv215.neoplus.adsl.tpnet.pl. [83.24.25.215])
        by smtp.gmail.com with ESMTPSA id u2sm4605326ljd.97.2019.05.21.13.40.16
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 21 May 2019 13:40:17 -0700 (PDT)
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
 <97ff2f48-9ec0-06f1-b667-56fcdef8bf03@gmail.com>
 <65c656cd-1b16-0960-fbeb-8172087b88f2@ti.com>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <f16b7eb7-411a-cac4-f8ec-b34a7731166c@gmail.com>
Date:   Tue, 21 May 2019 22:40:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <65c656cd-1b16-0960-fbeb-8172087b88f2@ti.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 5/21/19 9:41 PM, Dan Murphy wrote:
> Jacek
> 
> On 5/21/19 1:46 PM, Jacek Anaszewski wrote:
>> Dan,
>>
>> On 5/21/19 8:25 PM, Dan Murphy wrote:
>>> Jacek
>>>
>>> On 5/21/19 12:40 PM, Jacek Anaszewski wrote:
>>>> On 5/20/19 11:19 PM, Dan Murphy wrote:
>>>>> Jacek
>>>>>
>>>>> On 5/20/19 2:54 PM, Jacek Anaszewski wrote:
>>>>>> Hi Dan,
>>>>>>
>>>>>> On 5/7/19 10:11 PM, Dan Murphy wrote:
>>>>>>> Introduce the LM36274 LED driver.  This driver uses the ti-lmu
>>>>>>> MFD driver to probe this LED driver.  The driver configures only the
>>>>>>> LED registers and enables the outputs according to the config file.
>>>>>>>
>>>>>>> The driver utilizes the TI LMU (Lighting Management Unit) LED common
>>>>>>> framework to set the brightness bits.
>>>>>>>
>>>>>>> Signed-off-by: Dan Murphy <dmurphy@ti.com>
>>>>>>> ---
>>>>>>>      drivers/leds/Kconfig        |   7 ++
>>>>>>>      drivers/leds/Makefile       |   1 +
>>>>>>>      drivers/leds/leds-lm36274.c | 174 ++++++++++++++++++++++++++++++++++++
>>>>>>>      3 files changed, 182 insertions(+)
>>>>>>>      create mode 100644 drivers/leds/leds-lm36274.c
>>>>>>>
>>>>>>> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
>>>>>>> index 255fdd5e8491..db83a3feca01 100644
>>>>>>> --- a/drivers/leds/Kconfig
>>>>>>> +++ b/drivers/leds/Kconfig
>>>>>>> @@ -791,6 +791,13 @@ config LEDS_LM3697
>>>>>>>            Say Y to enable the LM3697 LED driver for TI LMU devices.
>>>>>>>            This supports the LED device LM3697.
>>>>>>>      +config LEDS_LM36274
>>>>>>> +    tristate "LED driver for LM36274"
>>>>>>> +    depends on LEDS_TI_LMU_COMMON
>>>>>>
>>>>>> Shouldn't we have "depends on MFD_TI_LMU" as well here?
>>>>>>
>>>>>
>>>>> Actually the LEDS_TI_LMU_COMMON flag should depend on MFD_TI_LMU.
>>>>> Then it would inherit that dependency.
>>>>
>>>> LEDS_TI_LMU_COMMON does not seem too have any dependency on MFD_TI_LMU,
>>>> and it would be incorrect to require enabling MFD_TI_LMU for all drivers
>>>> depending on TI_LMU_COMMON, that can be probed on their own, like
>>>> leds-lm3697.c .
>>>>
>>>
>>> Correct.
>>>
>>> I can update the Kconfigs unless you want to ammend the commits.
>>
>> I added "depends on MFD_TI_LMU" to "config LEDS_LM36274".
>> Please verify your patch sets pushed to [0].
>>
> 
> Pulled
> Built
> tested
> verified
> 
> Good to go
Thanks! Merged.

-- 
Best regards,
Jacek Anaszewski
