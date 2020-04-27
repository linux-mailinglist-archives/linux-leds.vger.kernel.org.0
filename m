Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 699351BAE33
	for <lists+linux-leds@lfdr.de>; Mon, 27 Apr 2020 21:42:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726768AbgD0Tmj (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 27 Apr 2020 15:42:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726384AbgD0Tmi (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Mon, 27 Apr 2020 15:42:38 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83032C0610D5;
        Mon, 27 Apr 2020 12:42:38 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id k13so21999583wrw.7;
        Mon, 27 Apr 2020 12:42:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=zX/yCU9mpboJUliofvxQr7UBLJDwPoQSlPea6kKg8KM=;
        b=LFLVnTtCANwmbGx07w7A2d1rWExGrk9F61XItaJsTSdgtxNzlJD2B+Qm4P9Y2WYHLY
         dmrfieWwyoanVul+nm5Pg+r/X4ueOAXwbyl93hnAZmhz98d6YMtG5V6sI/PnCGbJoM8a
         H8vtFUqOKKlahPDZoQSI622wRnbibBeVb386AZ6RzE7oPb0OINvtaoLjdqRKEPI/T5JV
         wRj3wsN27IiZQoLhAsvQJ8IVGy+wvaF4k5YX3RyhVSr/LNC0jCRG7qJiMbypX3+lNGFn
         x0o5dfDlyJSDqrP1o2a9uF1veIBjiYHzIcffIrGJ+zb/AUNtw95GuER5YX0wXUESQw6c
         h0jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=zX/yCU9mpboJUliofvxQr7UBLJDwPoQSlPea6kKg8KM=;
        b=Duwwyfd+hA71DCzc9JE9vf18XXHqMd4DHartT2p+WEoLj/e5w7R9teoMzRFP+dtqie
         V+HOAl+L9olerKoBAuSecpbd+9FTqWraZm5wtlo692V6OS/1xW1L1e/Nq7ylKgys7q26
         0/fXMIB8XDz/3J8gXQm3e2dF3apwYVKnNzVheKe504KjZ1K+FAstztlzMakN2cwYrVrI
         WCwyHvUuvq5hp5PINaoPghRzsFf4YXNxPYx2SqdGOc+04hHBKCkGQ2DL3Yrwae9yf9Mr
         OoRI5kJw2yYE/ohtjQt4yEhatbjV6cevlN1jDZBMU9TYFuQevxmWgtkQ//3BxjH6F6kR
         cXxw==
X-Gm-Message-State: AGi0PubI+7ocFM6C+0TmXhV4LTIOqLuWfZlh+sLET36gH80Gt+bLsYpl
        3GMPOFehwRBrWrvZASR8y1ECM7F3RfY=
X-Google-Smtp-Source: APiQypIaWZzdNOKJ0UqTJO6QRZHkSwHsWlu2x+vb/32bEwBI7+pOjbNcr/qqtIIR2FCbOePQ3nCXXg==
X-Received: by 2002:a5d:65cb:: with SMTP id e11mr28396924wrw.402.1588016557029;
        Mon, 27 Apr 2020 12:42:37 -0700 (PDT)
Received: from [192.168.1.23] (acft175.neoplus.adsl.tpnet.pl. [83.9.221.175])
        by smtp.gmail.com with ESMTPSA id v10sm22978999wrq.45.2020.04.27.12.42.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2020 12:42:36 -0700 (PDT)
Subject: Re: [PATCH v20 12/17] leds: lp55xx: Add multicolor framework support
 to lp55xx
To:     Dan Murphy <dmurphy@ti.com>, pavel@ucw.cz
Cc:     linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200423155524.13971-1-dmurphy@ti.com>
 <20200423155524.13971-13-dmurphy@ti.com>
 <24aa265c-46ca-1643-7781-9ddbf734405b@gmail.com>
 <4f149443-87f9-ca3f-e131-2b494cbfed84@ti.com>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <9ebe27ee-4dc5-110a-3897-328f5bbba902@gmail.com>
Date:   Mon, 27 Apr 2020 21:42:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <4f149443-87f9-ca3f-e131-2b494cbfed84@ti.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Dan,

On 4/27/20 8:17 PM, Dan Murphy wrote:
> Jacek
> 
> On 4/26/20 11:07 AM, Jacek Anaszewski wrote:
>> Hi Dan,
>>
>> One nit below.
>>
>> On 4/23/20 5:55 PM, Dan Murphy wrote:
>>> Add multicolor framework support for the lp55xx family.
>>>
>>> Signed-off-by: Dan Murphy <dmurphy@ti.com>
>>> ---
>>>   drivers/leds/Kconfig                      |   1 +
>>>   drivers/leds/leds-lp5521.c                |  14 +-
>>>   drivers/leds/leds-lp5523.c                |  14 +-
>>>   drivers/leds/leds-lp5562.c                |  13 +-
>>>   drivers/leds/leds-lp55xx-common.c         | 178 +++++++++++++++++++---
>>>   drivers/leds/leds-lp55xx-common.h         |  11 +-
>>>   drivers/leds/leds-lp8501.c                |  14 +-
>>>   include/linux/platform_data/leds-lp55xx.h |   8 +
>>>   8 files changed, 207 insertions(+), 46 deletions(-)
>>>
>> [...]
>>> diff --git a/drivers/leds/leds-lp55xx-common.h 
>>> b/drivers/leds/leds-lp55xx-common.h
>>> index b9b1041e8143..a9d7ba3f2fd1 100644
>>> --- a/drivers/leds/leds-lp55xx-common.h
>>> +++ b/drivers/leds/leds-lp55xx-common.h
>>> @@ -12,6 +12,8 @@
>>>   #ifndef _LEDS_LP55XX_COMMON_H
>>>   #define _LEDS_LP55XX_COMMON_H
>>>   +#include <linux/led-class-multicolor.h>
>>> +
>>>   enum lp55xx_engine_index {
>>>       LP55XX_ENGINE_INVALID,
>>>       LP55XX_ENGINE_1,
>>> @@ -109,6 +111,9 @@ struct lp55xx_device_config {
>>>       /* access brightness register */
>>>       int (*brightness_fn)(struct lp55xx_led *led);
>>>   +    /* perform brightness value to multiple LEDs */
>>> +    int (*multicolor_brightness_fn)(struct lp55xx_led *led);
>>
>> Isn't some word missing here? IMO it should be rephrased.
>> Maybe "write multi color brightness to hw" ?
>>
> But brightness_fn does not say write_brightness_fn so I think this would 
> look weird to add write to the function name

I referred to the comment, not to the function name.
And the comment for brightness_fn is vague IMO.
So I propose to change both comments:

s/access brightness register/set LED brightness/
s/perform brightness value to multiple LEDs/
   set multicolor LED brightness/

-- 
Best regards,
Jacek Anaszewski
