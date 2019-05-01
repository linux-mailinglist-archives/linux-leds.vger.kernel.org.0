Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D3E9E10675
	for <lists+linux-leds@lfdr.de>; Wed,  1 May 2019 11:42:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726090AbfEAJmw (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 1 May 2019 05:42:52 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:33474 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726052AbfEAJmv (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 1 May 2019 05:42:51 -0400
Received: by mail-wr1-f68.google.com with SMTP id e28so974229wra.0
        for <linux-leds@vger.kernel.org>; Wed, 01 May 2019 02:42:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=hVL7opI45UhQdD1zibQ+T2BNLcv3wmTWuC3oIItB/ME=;
        b=pFE2iJ9O8FRJxq5BEqK5qXgJwyVQlSg+EeEwTuCzv8rZ2P3f2B+r9iH7L/wWRS4ek1
         V3oLFTKi8BXA5VzOOr4vIVxOEfrSnDQXSTzj7nYyAX63kZxie5Kufpd3cZJ7ptwpoIr6
         fxb58cHi9CSeMpdB2K2WjeK+KGX3xhI5KDgOFEvtB09CuW0Uhb8r7+5ousg0g55FUIgJ
         qWMcDdEhz9k6AnVN9nUSI27KkUF36eub4VhJddIQcKoz/eq+j5RBuGv2TbZVLTXz8mSB
         jMLek2cS1G5EeGqSqAkhQcJnGTBQf3CKlIPrRvZkmefmVkejHQcOUeBXk9jsC3p3mU56
         v29w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=hVL7opI45UhQdD1zibQ+T2BNLcv3wmTWuC3oIItB/ME=;
        b=Zr/juJbqxykrV8BqaO6TWT5rwCBlHkklN9gONWiwYjJAYXGBPYL7vGrbh7E1wSg7Gl
         15dI1zw5EEXFJCxPYXBAdPb6F3ardzei5pU0rlhgDUSLEY0TM6WEKWnCo9ucmhmFPePj
         NXD66p/23vT168klM74EE/pR2A505k7gUSNhdHxUJXIovYicj1epjJCajAilzzTymFJ5
         ameGCv2BO2N9mGe3CckfuXPCzRvRJMIBLjJSftsN5+so1st4/YMECTSp8H8EDM4RzJrO
         FdN+rKD8G6vgOc4GwkR0Lo2m3zCFi7xxPrksQmyGjL7GRnWBVvCnyhMrRSLAwzLJEczP
         3CjQ==
X-Gm-Message-State: APjAAAU7A6uqfUf7HmEeiT5A825CE04CHd/3VCLOM6As0HM6yVajRe1U
        RJ+nzxxy1DG461VbV+kwo1dpTzN1
X-Google-Smtp-Source: APXvYqz5ZmDsmMZkaxoUPyeUffnh2VqIxIjeoFaxQqBgwpT0WXUibrJ41HvtLkL6p+quFceYZR3xFw==
X-Received: by 2002:a5d:69ce:: with SMTP id s14mr5904803wrw.223.1556703769683;
        Wed, 01 May 2019 02:42:49 -0700 (PDT)
Received: from [192.168.1.19] (chf176.neoplus.adsl.tpnet.pl. [83.31.3.176])
        by smtp.gmail.com with ESMTPSA id u8sm3777371wmc.14.2019.05.01.02.42.48
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 01 May 2019 02:42:48 -0700 (PDT)
Subject: Re: [PATCH leds/for-next v2 2/2] leds: turris-omnia: Add support for
 256 brightness values
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Dan Murphy <dmurphy@ti.com>,
        =?UTF-8?Q?Marek_Beh=c3=ban?= <marek.behun@nic.cz>,
        linux-leds@vger.kernel.org
References: <20190429212944.15643-1-marek.behun@nic.cz>
 <20190429212944.15643-3-marek.behun@nic.cz>
 <87eafec0-b074-689d-20b6-171a866745ea@ti.com> <20190430204625.GA20410@amd>
 <eb5f9ce0-914e-57dc-5e58-65c1f2ef52db@gmail.com> <20190430224332.GE20410@amd>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <d8dadafe-7f98-7097-a905-fe8ebba0fe4c@gmail.com>
Date:   Wed, 1 May 2019 11:42:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190430224332.GE20410@amd>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 5/1/19 12:43 AM, Pavel Machek wrote:
> On Tue 2019-04-30 22:52:36, Jacek Anaszewski wrote:
>> On 4/30/19 10:46 PM, Pavel Machek wrote:
>>> Hi!
>>>
>>>>> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
>>>>> index 3747cbd0de2c..62d17c2f4878 100644
>>>>> --- a/drivers/leds/Kconfig
>>>>> +++ b/drivers/leds/Kconfig
>>>>> @@ -139,8 +139,8 @@ config LEDS_TURRIS_OMNIA
>>>>>   	  side of CZ.NIC's Turris Omnia router. There are 12 RGB LEDs on the
>>>>>   	  front panel.
>>>>>   	  This driver does not currently support setting LED colors, only
>>>>> -	  on/off state. Also HW triggering is disabled when the controller
>>>>> -	  is probed by this driver.
>>>>> +	  brightness. Also HW triggering is disabled when the controller is
>>>>> +	  probed by this driver.
>>>>
>>>> I am not seeing where or how this is done in the driver on probe.
>>>
>>> I checked, and I believe it was ok.
>>>
>>>>>   config LEDS_LM3530
>>>>>   	tristate "LCD Backlight driver for LM3530"
>>>>> diff --git a/drivers/leds/leds-turris-omnia.c b/drivers/leds/leds-turris-omnia.c
>>>>> index dc9fac56b13a..0e805d94f298 100644
>>>>> --- a/drivers/leds/leds-turris-omnia.c
>>>>> +++ b/drivers/leds/leds-turris-omnia.c
>>>>> @@ -54,7 +54,7 @@ static int omnia_led_brightness_set_blocking(struct led_classdev *led,
>>>>>   	struct omnia_leds *leds = dev_get_drvdata(led->dev->parent);
>>>>>   	int idx = omnia_led_idx(leds, led);
>>>>>   	int ret;
>>>>> -	u8 state;
>>>>> +	u8 buf[5], state;
>>>>
>>>> Magic numbers
>>>
>>> Nothing wrong with magic "5" when you have 0, 1, 2, 3 and 4
>>> below. Constants are useful when they make code easier to read, not in
>>> this case.
>>>
>>>>>   	mutex_unlock(&leds->lock);
>>>>>   	return ret;
>>>>> @@ -97,7 +105,7 @@ static int omnia_led_register(struct omnia_leds *leds,
>>>>>   	ret = fwnode_property_read_string(node, "label", &str);
>>>>>   	snprintf(led->name, sizeof(led->name), "omnia::%s", ret ? "" : str);
>>>>> -	led->cdev.max_brightness = 1;
>>>>> +	led->cdev.max_brightness = 255;
>>>>
>>>> How about LED_FULL?
>>>
>>> Please don't.
>>>
>>>>> +	/* set all LEDs color to [255, 255, 255] */
>>>>> +	buf[0] = CMD_LED_COLOR;
>>>>> +	buf[1] = OMNIA_BOARD_LEDS;
>>>>> +	buf[2] = buf[3] = buf[4] = 255;
>>>>> +
>>>>
>>>> LED_FULL for this as above.
>>>
>>> I'd actually prefer 255 here; due to the way hardware is designed,
>>> it has brightness in byte. No need to put LED_FULL here, and force
>>> reader to check the headers to see what value LED_FULL has.
>>
>> Let's be consistent. Please add constants for both 5 and 255.
>> The conventions are established for a reason.
> 
> I don't believe such convention exists for kernel, and it certainly
> makes code harder to read in case of "5"... That code is currently
> simple and easy to read, lets keep it that way.

I don't see how a constant with informative name can be harder
to read than bare number.

> (You can try  grep -ri '\<5\>' net/ :-) ]

I have something more informative:

grep -r "^#define [_A-Za-z0-9]*\(SIZE\|LEN\)\s*[0-9]$" net/

-- 
Best regards,
Jacek Anaszewski
