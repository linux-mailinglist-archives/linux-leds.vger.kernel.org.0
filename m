Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 045BA799B6
	for <lists+linux-leds@lfdr.de>; Mon, 29 Jul 2019 22:17:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726277AbfG2TYu (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 29 Jul 2019 15:24:50 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:35327 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388252AbfG2TYu (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 29 Jul 2019 15:24:50 -0400
Received: by mail-wr1-f66.google.com with SMTP id y4so63090688wrm.2;
        Mon, 29 Jul 2019 12:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=KzFDXsZm34vYHoXXRNHS48SfK2h0C8sqr3jtXFIdm4g=;
        b=NmuBIAePTW8QVBl/aXLHiMGzEg2vfuCJkW2LPc23wYxwdC8H7ZSk0qqwub1vVxdLG0
         JBYgpLQmqr1dI+fkYI66YigMNgMEKXRqlyaRrqTvyOIBOQNQdL6EdmIrnziP2gEUl4Xk
         aBJXeh4fMov7Bdq7XwQRz30WYIR0xPAsSJAchhLXfQHa4I7rwo45louQdq+hne6lGTAR
         Wsv79ciooSIUAphTldkLbJThbwr5RC7ndhOHu7nJ1st9ERRVVlbxLH9u3cRF8Iz63gsn
         TOBFxem7R7XCz3y1UQn4TNFLKfXs3rdvXXK0qPgGwCg8vei0XB+E5G0oPAx/XQdZfWIL
         3RVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=KzFDXsZm34vYHoXXRNHS48SfK2h0C8sqr3jtXFIdm4g=;
        b=jfgwWBAIm7LygCZrpArWomCzwKEhD2dC9NU8LhFjDg9LorgOAyjLRc0ABgEOuQzABU
         cWT27tMCV+UqvXmdl9gBF5/4ekQv0bKs94hA4OPFkpYaN1nDMwRfAGKPEIGlvPdLbLhS
         g2rvzOUIrSHyP1FwqTOhR6QDOyv9GFY6TlyWoWpi4n4T1gTeW6IjtyBh3TCSOVdfJiX1
         dDDjwcNxlPccneduprEZOa07sWRksdc3ND6BAjQnKEyXofbut4A6Xy+G5nlcybDlQFr+
         jiaj7gqbtuTRFvdSmFWua80SRImdw9hu7ONdHooostTCY5yI6vZC/hrqv4cjG+VdF1zi
         oMNQ==
X-Gm-Message-State: APjAAAVOBQW63HZK0RzWS9VAu6LfmqBL8qKLWpoPyno5a2G+r67g/AdD
        meX7Exngre7awOq+p5Qi/LEDMEf0
X-Google-Smtp-Source: APXvYqxL7A2BC1Jc4ZKoJqXhrtH5QDbS/xfRVga49b6Ndry4o4Q8BoKkTjruQvBoTNV0KAjg2ue1DA==
X-Received: by 2002:adf:cd81:: with SMTP id q1mr120386836wrj.16.1564428287884;
        Mon, 29 Jul 2019 12:24:47 -0700 (PDT)
Received: from [192.168.1.19] (civ151.neoplus.adsl.tpnet.pl. [83.31.45.151])
        by smtp.gmail.com with ESMTPSA id l2sm42262102wmj.4.2019.07.29.12.24.46
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 29 Jul 2019 12:24:47 -0700 (PDT)
Subject: Re: [PATCH 1/3] block: umem: rename LED_* macros to LEDCTRL_*
To:     Pavel Machek <pavel@ucw.cz>, Akinobu Mita <akinobu.mita@gmail.com>
Cc:     linux-block@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-scsi@vger.kernel.org,
        Frank Steiner <fsteiner-mail1@bio.ifi.lmu.de>,
        Dan Murphy <dmurphy@ti.com>, Jens Axboe <axboe@kernel.dk>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>
References: <1564322446-28255-1-git-send-email-akinobu.mita@gmail.com>
 <1564322446-28255-2-git-send-email-akinobu.mita@gmail.com>
 <85aa571d-69c4-a35c-8b9a-770cc3662baa@gmail.com>
 <CAC5umyggeHZJrW7BR7o+GgnQiW5zaSP+cqMeW_CgWwqLVOjNZQ@mail.gmail.com>
 <20190729191338.GA2023@amd>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=jacek.anaszewski@gmail.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <bd8e7602-bc73-8b0f-5024-f67980f045a4@gmail.com>
Date:   Mon, 29 Jul 2019 21:24:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190729191338.GA2023@amd>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 7/29/19 9:13 PM, Pavel Machek wrote:
> On Tue 2019-07-30 00:21:14, Akinobu Mita wrote:
>> 2019年7月29日(月) 2:30 Jacek Anaszewski <jacek.anaszewski@gmail.com>:
>>>
>>> Hi Akinobu,
>>>
>>> On 7/28/19 4:00 PM, Akinobu Mita wrote:
>>>> The umem driver defines LED_* macros for MEMCTRLCMD_LEDCTRL register
>>>> values.  The LED_OFF and LED_ON macros conflict with the LED subsystem's
>>>> LED_OFF and LED_ON enums.
>>>>
>>>> This renames these LED_* macros to LEDCTRL_* in umem driver.
>>> [...]
>>>>
>>>> diff --git a/drivers/block/umem.h b/drivers/block/umem.h
>>>> index 5838497..8563fdc 100644
>>>> --- a/drivers/block/umem.h
>>>> +++ b/drivers/block/umem.h
>>>> @@ -32,16 +32,16 @@
>>>>  #define  MEM_2_GB            0xe0
>>>>
>>>>  #define MEMCTRLCMD_LEDCTRL   0x08
>>>> -#define  LED_REMOVE          2
>>>> -#define  LED_FAULT           4
>>>> -#define  LED_POWER           6
>>>> -#define       LED_FLIP               255
>>>> -#define  LED_OFF             0x00
>>>> -#define  LED_ON                      0x01
>>>> -#define  LED_FLASH_3_5               0x02
>>>> -#define  LED_FLASH_7_0               0x03
>>>> -#define  LED_POWER_ON                0x00
>>>> -#define  LED_POWER_OFF               0x01
>>>> +#define  LEDCTRL_REMOVE              2
>>>
>>> This way the namespacing prefix still begins with "LED",
>>> which can lead to further conflicts in the future.
>>
>> How about renaming 'LED_ON' to 'MEMCTRLCMD_LEDCTRL_ON', and 'LED_OFF' to
>> 'MEMCTRLCMD_LEDCTRL_OFF' ?
> 
> I'd say that "MEMCTRL_LED_ON" woudl e enough, but... :-).

I agree, it looks neater.

-- 
Best regards,
Jacek Anaszewski
