Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5EAD32586C
	for <lists+linux-leds@lfdr.de>; Tue, 21 May 2019 21:41:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726771AbfEUTll (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 21 May 2019 15:41:41 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:45346 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726525AbfEUTll (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 21 May 2019 15:41:41 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x4LJfURx030004;
        Tue, 21 May 2019 14:41:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1558467690;
        bh=PM4L/D9FpKZ0tK5lsvnI3Q3CMgTLS/K4k7JDMM7uGss=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=mHVKvikDrWIG4uUrkIMU0HwH/RUGaNzKckcW+9yE7apqfHK1nHEfAAF9jhTGaWeVD
         O1Zlk+8v66NN+Y3IMPrmECilUThwtooGEXjJ8W//CUJyWlBaGtvVijIVm+0rRY9Jik
         MhhJyS5c/D0wpS2D9GCQK1KScvbyc2zYmUwzBczQ=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x4LJfUZU107622
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 21 May 2019 14:41:30 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 21
 May 2019 14:41:30 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 21 May 2019 14:41:30 -0500
Received: from [10.250.90.63] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x4LJfUqt115545;
        Tue, 21 May 2019 14:41:30 -0500
Subject: Re: [PATCH v4 6/6] leds: lm36274: Introduce the TI LM36274 LED driver
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>
CC:     <lee.jones@linaro.org>, <rdunlap@infradead.org>,
        <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20190507201159.13940-1-dmurphy@ti.com>
 <20190507201159.13940-7-dmurphy@ti.com>
 <77f1ed5b-bfd2-510c-edd5-1b702f2d1d45@gmail.com>
 <8d126925-9e71-dba4-eb88-50fd6e6c06d8@ti.com>
 <a7cb6628-e501-b580-f714-0e5de78ea39c@gmail.com>
 <d0c49197-984d-5cd8-032a-27d9c5ca6d29@ti.com>
 <97ff2f48-9ec0-06f1-b667-56fcdef8bf03@gmail.com>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <65c656cd-1b16-0960-fbeb-8172087b88f2@ti.com>
Date:   Tue, 21 May 2019 14:41:24 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <97ff2f48-9ec0-06f1-b667-56fcdef8bf03@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Jacek

On 5/21/19 1:46 PM, Jacek Anaszewski wrote:
> Dan,
> 
> On 5/21/19 8:25 PM, Dan Murphy wrote:
>> Jacek
>>
>> On 5/21/19 12:40 PM, Jacek Anaszewski wrote:
>>> On 5/20/19 11:19 PM, Dan Murphy wrote:
>>>> Jacek
>>>>
>>>> On 5/20/19 2:54 PM, Jacek Anaszewski wrote:
>>>>> Hi Dan,
>>>>>
>>>>> On 5/7/19 10:11 PM, Dan Murphy wrote:
>>>>>> Introduce the LM36274 LED driver.  This driver uses the ti-lmu
>>>>>> MFD driver to probe this LED driver.  The driver configures only the
>>>>>> LED registers and enables the outputs according to the config file.
>>>>>>
>>>>>> The driver utilizes the TI LMU (Lighting Management Unit) LED common
>>>>>> framework to set the brightness bits.
>>>>>>
>>>>>> Signed-off-by: Dan Murphy <dmurphy@ti.com>
>>>>>> ---
>>>>>>     drivers/leds/Kconfig        |   7 ++
>>>>>>     drivers/leds/Makefile       |   1 +
>>>>>>     drivers/leds/leds-lm36274.c | 174 ++++++++++++++++++++++++++++++++++++
>>>>>>     3 files changed, 182 insertions(+)
>>>>>>     create mode 100644 drivers/leds/leds-lm36274.c
>>>>>>
>>>>>> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
>>>>>> index 255fdd5e8491..db83a3feca01 100644
>>>>>> --- a/drivers/leds/Kconfig
>>>>>> +++ b/drivers/leds/Kconfig
>>>>>> @@ -791,6 +791,13 @@ config LEDS_LM3697
>>>>>>           Say Y to enable the LM3697 LED driver for TI LMU devices.
>>>>>>           This supports the LED device LM3697.
>>>>>>     +config LEDS_LM36274
>>>>>> +    tristate "LED driver for LM36274"
>>>>>> +    depends on LEDS_TI_LMU_COMMON
>>>>>
>>>>> Shouldn't we have "depends on MFD_TI_LMU" as well here?
>>>>>
>>>>
>>>> Actually the LEDS_TI_LMU_COMMON flag should depend on MFD_TI_LMU.
>>>> Then it would inherit that dependency.
>>>
>>> LEDS_TI_LMU_COMMON does not seem too have any dependency on MFD_TI_LMU,
>>> and it would be incorrect to require enabling MFD_TI_LMU for all drivers
>>> depending on TI_LMU_COMMON, that can be probed on their own, like
>>> leds-lm3697.c .
>>>
>>
>> Correct.
>>
>> I can update the Kconfigs unless you want to ammend the commits.
> 
> I added "depends on MFD_TI_LMU" to "config LEDS_LM36274".
> Please verify your patch sets pushed to [0].
> 

Pulled
Built
tested
verified

Good to go

Dan

> [0] https://git.kernel.org/pub/scm/linux/kernel/git/j.anaszewski/linux-leds.git/log/?h=ib-leds-mfd-regulator
> 
