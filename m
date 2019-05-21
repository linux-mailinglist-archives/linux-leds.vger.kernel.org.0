Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 343D0256E2
	for <lists+linux-leds@lfdr.de>; Tue, 21 May 2019 19:41:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728318AbfEURlC (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 21 May 2019 13:41:02 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:42930 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728067AbfEURlC (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 21 May 2019 13:41:02 -0400
Received: by mail-lj1-f194.google.com with SMTP id 188so2445592ljf.9;
        Tue, 21 May 2019 10:41:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ZgkZB+n3Os2bKwEG5WFfzJWStFnM4Ge193yXD9xuuZE=;
        b=IZhY1TDYadhVaGMthYkGdu9+qrml8/V1mZWl8USyVVRFF0/Z1sBkw+Ybat3YmTYlGU
         1qzM1g81ZJ1NtLEdexEAkYAQASASucSrB9XoLTjMOi1YODutGVhBZK0QeMrPYWqR+Ykz
         jID1a2sXpWMKnc3K6MIRL6ExGb2zTYArb/yive9XzgHd8t+MtlaKt5t+O9R5p1nk2ZQ0
         VFR5TV/w4oKfIRK/so8kz1quxMgpX8OKMifnLmw0qtEDvlycTEB4vsyoNpSbljcmCXb1
         0WwpcjnttEbasarHdkMwPyzs9b8Q55FS3G++DhxbeJ3Iq/HSHbaYVT23LRHtsW1dN+78
         UrVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ZgkZB+n3Os2bKwEG5WFfzJWStFnM4Ge193yXD9xuuZE=;
        b=D/RB96Csf/S6d5QtbHdUVYcNsp9dbBBQYaIWmPTQkDXho0lPxekQ1HhOxE5o1HaeC5
         az8iLUrZN+PHSBVM+VpTmg+DOMjx5/b4TYUck793i3zBF9DAEbELSRmhn/9st/M9ubHt
         5OzBe/8JAeNlF7v7Pq5DOP40eTSCPyvCqTqi9ykwWQaXfj2YaaB8kwWQAQtgzHzzu0L5
         1jSPcR76g9bqAVsBwGHw+dBL/n61KhKEYW4wj9bPO8r4Jvsp0EUF0lWkRme/J0PpN3IE
         KFAJHgUNAIVzpQaniUCgaWu/mkdPAOLLhjqMRSOfJIV8OJ0Iq275RLW1VV8KpF+xTuQM
         J/Lw==
X-Gm-Message-State: APjAAAWxQZdemWe4oOY/lVRiQF1yeCyevMOj27oH2OPnwfdcvQn6ndsc
        I+gSF+OWvQ3rArLekHhnRBgvUOef
X-Google-Smtp-Source: APXvYqxcMm98WfiRTjFIrax6EdRbgquYrmSuBqKdNkMEQ5My/5b/1PP39T2Lma1EQkJrt7zcJpLFEg==
X-Received: by 2002:a2e:7001:: with SMTP id l1mr15569126ljc.11.1558460459568;
        Tue, 21 May 2019 10:40:59 -0700 (PDT)
Received: from [192.168.1.17] (dkv215.neoplus.adsl.tpnet.pl. [83.24.25.215])
        by smtp.gmail.com with ESMTPSA id x2sm4655145ljx.13.2019.05.21.10.40.57
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 21 May 2019 10:40:58 -0700 (PDT)
Subject: Re: [PATCH v4 6/6] leds: lm36274: Introduce the TI LM36274 LED driver
To:     Dan Murphy <dmurphy@ti.com>, pavel@ucw.cz
Cc:     lee.jones@linaro.org, rdunlap@infradead.org,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20190507201159.13940-1-dmurphy@ti.com>
 <20190507201159.13940-7-dmurphy@ti.com>
 <77f1ed5b-bfd2-510c-edd5-1b702f2d1d45@gmail.com>
 <8d126925-9e71-dba4-eb88-50fd6e6c06d8@ti.com>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <a7cb6628-e501-b580-f714-0e5de78ea39c@gmail.com>
Date:   Tue, 21 May 2019 19:40:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <8d126925-9e71-dba4-eb88-50fd6e6c06d8@ti.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 5/20/19 11:19 PM, Dan Murphy wrote:
> Jacek
> 
> On 5/20/19 2:54 PM, Jacek Anaszewski wrote:
>> Hi Dan,
>>
>> On 5/7/19 10:11 PM, Dan Murphy wrote:
>>> Introduce the LM36274 LED driver.  This driver uses the ti-lmu
>>> MFD driver to probe this LED driver.  The driver configures only the
>>> LED registers and enables the outputs according to the config file.
>>>
>>> The driver utilizes the TI LMU (Lighting Management Unit) LED common
>>> framework to set the brightness bits.
>>>
>>> Signed-off-by: Dan Murphy <dmurphy@ti.com>
>>> ---
>>>    drivers/leds/Kconfig        |   7 ++
>>>    drivers/leds/Makefile       |   1 +
>>>    drivers/leds/leds-lm36274.c | 174 ++++++++++++++++++++++++++++++++++++
>>>    3 files changed, 182 insertions(+)
>>>    create mode 100644 drivers/leds/leds-lm36274.c
>>>
>>> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
>>> index 255fdd5e8491..db83a3feca01 100644
>>> --- a/drivers/leds/Kconfig
>>> +++ b/drivers/leds/Kconfig
>>> @@ -791,6 +791,13 @@ config LEDS_LM3697
>>>          Say Y to enable the LM3697 LED driver for TI LMU devices.
>>>          This supports the LED device LM3697.
>>>    +config LEDS_LM36274
>>> +    tristate "LED driver for LM36274"
>>> +    depends on LEDS_TI_LMU_COMMON
>>
>> Shouldn't we have "depends on MFD_TI_LMU" as well here?
>>
> 
> Actually the LEDS_TI_LMU_COMMON flag should depend on MFD_TI_LMU.
> Then it would inherit that dependency.

LEDS_TI_LMU_COMMON does not seem too have any dependency on MFD_TI_LMU,
and it would be incorrect to require enabling MFD_TI_LMU for all drivers
depending on TI_LMU_COMMON, that can be probed on their own, like
leds-lm3697.c .

-- 
Best regards,
Jacek Anaszewski
