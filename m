Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E0E4425787
	for <lists+linux-leds@lfdr.de>; Tue, 21 May 2019 20:26:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728256AbfEUS0N (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 21 May 2019 14:26:13 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:37748 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728067AbfEUS0N (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 21 May 2019 14:26:13 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x4LIQ29x012828;
        Tue, 21 May 2019 13:26:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1558463162;
        bh=R+f4E4/IBbnKEoMvmJCG3kgIgRbf7ZHNf39i2sfRMsk=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=V6XXDMsxOKHUw1/ubpmlyCjWf0crKu3dlKUoyas6QgJs6VBhFQscQ2wN+FaglzhLq
         /+ilr/Nc4uw5SiqKXFTo1Oni8ZybMPuwOqoybCKodHlTHdnJq6+aywAWXEWrQBbG9a
         MrF45sXSBCwJJsc9Z+fQO/j3t7php068/ynKfg70=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x4LIQ2wK042920
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 21 May 2019 13:26:02 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 21
 May 2019 13:26:02 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 21 May 2019 13:26:02 -0500
Received: from [10.250.90.63] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x4LIQ14s072941;
        Tue, 21 May 2019 13:26:01 -0500
Subject: Re: [PATCH v4 6/6] leds: lm36274: Introduce the TI LM36274 LED driver
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>
CC:     <lee.jones@linaro.org>, <rdunlap@infradead.org>,
        <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20190507201159.13940-1-dmurphy@ti.com>
 <20190507201159.13940-7-dmurphy@ti.com>
 <77f1ed5b-bfd2-510c-edd5-1b702f2d1d45@gmail.com>
 <8d126925-9e71-dba4-eb88-50fd6e6c06d8@ti.com>
 <a7cb6628-e501-b580-f714-0e5de78ea39c@gmail.com>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <d0c49197-984d-5cd8-032a-27d9c5ca6d29@ti.com>
Date:   Tue, 21 May 2019 13:25:56 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <a7cb6628-e501-b580-f714-0e5de78ea39c@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Jacek

On 5/21/19 12:40 PM, Jacek Anaszewski wrote:
> On 5/20/19 11:19 PM, Dan Murphy wrote:
>> Jacek
>>
>> On 5/20/19 2:54 PM, Jacek Anaszewski wrote:
>>> Hi Dan,
>>>
>>> On 5/7/19 10:11 PM, Dan Murphy wrote:
>>>> Introduce the LM36274 LED driver.  This driver uses the ti-lmu
>>>> MFD driver to probe this LED driver.  The driver configures only the
>>>> LED registers and enables the outputs according to the config file.
>>>>
>>>> The driver utilizes the TI LMU (Lighting Management Unit) LED common
>>>> framework to set the brightness bits.
>>>>
>>>> Signed-off-by: Dan Murphy <dmurphy@ti.com>
>>>> ---
>>>>    drivers/leds/Kconfig        |   7 ++
>>>>    drivers/leds/Makefile       |   1 +
>>>>    drivers/leds/leds-lm36274.c | 174 ++++++++++++++++++++++++++++++++++++
>>>>    3 files changed, 182 insertions(+)
>>>>    create mode 100644 drivers/leds/leds-lm36274.c
>>>>
>>>> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
>>>> index 255fdd5e8491..db83a3feca01 100644
>>>> --- a/drivers/leds/Kconfig
>>>> +++ b/drivers/leds/Kconfig
>>>> @@ -791,6 +791,13 @@ config LEDS_LM3697
>>>>          Say Y to enable the LM3697 LED driver for TI LMU devices.
>>>>          This supports the LED device LM3697.
>>>>    +config LEDS_LM36274
>>>> +    tristate "LED driver for LM36274"
>>>> +    depends on LEDS_TI_LMU_COMMON
>>>
>>> Shouldn't we have "depends on MFD_TI_LMU" as well here?
>>>
>>
>> Actually the LEDS_TI_LMU_COMMON flag should depend on MFD_TI_LMU.
>> Then it would inherit that dependency.
> 
> LEDS_TI_LMU_COMMON does not seem too have any dependency on MFD_TI_LMU,
> and it would be incorrect to require enabling MFD_TI_LMU for all drivers
> depending on TI_LMU_COMMON, that can be probed on their own, like
> leds-lm3697.c .
> 

Correct.

I can update the Kconfigs unless you want to ammend the commits.

Dan
