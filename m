Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0AECB242A4
	for <lists+linux-leds@lfdr.de>; Mon, 20 May 2019 23:19:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726833AbfETVTb (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 20 May 2019 17:19:31 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:38088 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726814AbfETVTb (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 20 May 2019 17:19:31 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x4KLJGvR098218;
        Mon, 20 May 2019 16:19:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1558387156;
        bh=5KQWvFfE5qVNkLN90w84u0hBO49O6BvLTGp8FoqxAU4=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=o0zTjoajMbo0iwJ7IMQncJT1xAKBJk/WaHj2H8BIWoZqBLnkCEdylePdHod73z2Xw
         S/3hi8s3r3Sgtq5hCM+o5ZsvpcBM1tAbfwixDOVAGKXIIaQs58lsoGSworBcs/EPZD
         /w6PBqKG258UNQfrSLqJRF46yGdRJ4IRBFgBzvSU=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x4KLJGvT045333
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 20 May 2019 16:19:16 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 20
 May 2019 16:19:16 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 20 May 2019 16:19:16 -0500
Received: from [10.250.90.63] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x4KLJG9w105948;
        Mon, 20 May 2019 16:19:16 -0500
Subject: Re: [PATCH v4 6/6] leds: lm36274: Introduce the TI LM36274 LED driver
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>
CC:     <lee.jones@linaro.org>, <rdunlap@infradead.org>,
        <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20190507201159.13940-1-dmurphy@ti.com>
 <20190507201159.13940-7-dmurphy@ti.com>
 <77f1ed5b-bfd2-510c-edd5-1b702f2d1d45@gmail.com>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <8d126925-9e71-dba4-eb88-50fd6e6c06d8@ti.com>
Date:   Mon, 20 May 2019 16:19:15 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <77f1ed5b-bfd2-510c-edd5-1b702f2d1d45@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Jacek

On 5/20/19 2:54 PM, Jacek Anaszewski wrote:
> Hi Dan,
> 
> On 5/7/19 10:11 PM, Dan Murphy wrote:
>> Introduce the LM36274 LED driver.  This driver uses the ti-lmu
>> MFD driver to probe this LED driver.  The driver configures only the
>> LED registers and enables the outputs according to the config file.
>>
>> The driver utilizes the TI LMU (Lighting Management Unit) LED common
>> framework to set the brightness bits.
>>
>> Signed-off-by: Dan Murphy <dmurphy@ti.com>
>> ---
>>   drivers/leds/Kconfig        |   7 ++
>>   drivers/leds/Makefile       |   1 +
>>   drivers/leds/leds-lm36274.c | 174 ++++++++++++++++++++++++++++++++++++
>>   3 files changed, 182 insertions(+)
>>   create mode 100644 drivers/leds/leds-lm36274.c
>>
>> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
>> index 255fdd5e8491..db83a3feca01 100644
>> --- a/drivers/leds/Kconfig
>> +++ b/drivers/leds/Kconfig
>> @@ -791,6 +791,13 @@ config LEDS_LM3697
>>         Say Y to enable the LM3697 LED driver for TI LMU devices.
>>         This supports the LED device LM3697.
>>   +config LEDS_LM36274
>> +    tristate "LED driver for LM36274"
>> +    depends on LEDS_TI_LMU_COMMON
> 
> Shouldn't we have "depends on MFD_TI_LMU" as well here?
> 

Actually the LEDS_TI_LMU_COMMON flag should depend on MFD_TI_LMU.
Then it would inherit that dependency.

Dan

>> +    help
>> +      Say Y to enable the LM36274 LED driver for TI LMU devices.
>> +      This supports the LED device LM36274.
> 
