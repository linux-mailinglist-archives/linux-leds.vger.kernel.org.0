Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A3FB1BAC68
	for <lists+linux-leds@lfdr.de>; Mon, 27 Apr 2020 20:23:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726517AbgD0SXT (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 27 Apr 2020 14:23:19 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:40936 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725995AbgD0SXT (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 27 Apr 2020 14:23:19 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 03RINE38113931;
        Mon, 27 Apr 2020 13:23:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1588011795;
        bh=5OghnPjWwbHydybxjIUdOgiSz7YwnjBztLRIVw2Is3Q=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=JuG0cpohAAJR3y4mYtf5+3ljZoUjKeVucxBDh8VcLWIM/T58RTp8o5MdAZ2GhYeNP
         gL9u0EXpAzisZNhZmeCkSaBicgGZkopYR0o9/W9aXjqYiaYBYxk2BZszN7n7tM590k
         edNzlL9+N0VX5rbOZPdNHNLsHHnoPlY2i9OcgylE=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 03RINEnR111729
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 27 Apr 2020 13:23:14 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 27
 Apr 2020 13:23:14 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 27 Apr 2020 13:23:14 -0500
Received: from [10.250.52.63] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 03RINEIP053931;
        Mon, 27 Apr 2020 13:23:14 -0500
Subject: Re: [PATCH v20 12/17] leds: lp55xx: Add multicolor framework support
 to lp55xx
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>
CC:     <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20200423155524.13971-1-dmurphy@ti.com>
 <20200423155524.13971-13-dmurphy@ti.com>
 <24aa265c-46ca-1643-7781-9ddbf734405b@gmail.com>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <4f149443-87f9-ca3f-e131-2b494cbfed84@ti.com>
Date:   Mon, 27 Apr 2020 13:17:16 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <24aa265c-46ca-1643-7781-9ddbf734405b@gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Jacek

On 4/26/20 11:07 AM, Jacek Anaszewski wrote:
> Hi Dan,
>
> One nit below.
>
> On 4/23/20 5:55 PM, Dan Murphy wrote:
>> Add multicolor framework support for the lp55xx family.
>>
>> Signed-off-by: Dan Murphy <dmurphy@ti.com>
>> ---
>>   drivers/leds/Kconfig                      |   1 +
>>   drivers/leds/leds-lp5521.c                |  14 +-
>>   drivers/leds/leds-lp5523.c                |  14 +-
>>   drivers/leds/leds-lp5562.c                |  13 +-
>>   drivers/leds/leds-lp55xx-common.c         | 178 +++++++++++++++++++---
>>   drivers/leds/leds-lp55xx-common.h         |  11 +-
>>   drivers/leds/leds-lp8501.c                |  14 +-
>>   include/linux/platform_data/leds-lp55xx.h |   8 +
>>   8 files changed, 207 insertions(+), 46 deletions(-)
>>
> [...]
>> diff --git a/drivers/leds/leds-lp55xx-common.h 
>> b/drivers/leds/leds-lp55xx-common.h
>> index b9b1041e8143..a9d7ba3f2fd1 100644
>> --- a/drivers/leds/leds-lp55xx-common.h
>> +++ b/drivers/leds/leds-lp55xx-common.h
>> @@ -12,6 +12,8 @@
>>   #ifndef _LEDS_LP55XX_COMMON_H
>>   #define _LEDS_LP55XX_COMMON_H
>>   +#include <linux/led-class-multicolor.h>
>> +
>>   enum lp55xx_engine_index {
>>       LP55XX_ENGINE_INVALID,
>>       LP55XX_ENGINE_1,
>> @@ -109,6 +111,9 @@ struct lp55xx_device_config {
>>       /* access brightness register */
>>       int (*brightness_fn)(struct lp55xx_led *led);
>>   +    /* perform brightness value to multiple LEDs */
>> +    int (*multicolor_brightness_fn)(struct lp55xx_led *led);
>
> Isn't some word missing here? IMO it should be rephrased.
> Maybe "write multi color brightness to hw" ?
>
But brightness_fn does not say write_brightness_fn so I think this would 
look weird to add write to the function name

Dan


