Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3EFB010125
	for <lists+linux-leds@lfdr.de>; Tue, 30 Apr 2019 22:52:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727018AbfD3Uwl (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 30 Apr 2019 16:52:41 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:45390 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727012AbfD3Uwl (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 30 Apr 2019 16:52:41 -0400
Received: by mail-lj1-f194.google.com with SMTP id w12so2334221ljh.12
        for <linux-leds@vger.kernel.org>; Tue, 30 Apr 2019 13:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=XsOPpvWuwBXOSKCf38VaHwxJ5PevnO7TYnllA9/6o2c=;
        b=DZGJ8LdxSzAu13Do8pL969eZuh8dx8uGKW6MuK2pjS1dc7cD4Ztfm+V6wgZR9917/+
         DGiMegr59ANkd6p5uyioicWFOyZttQq95Lp4RWWrWbDqwOVMWMX5sV2SApaHldXoDpdU
         lWLjSsvcbc2ZDFOM76EWs3rQuF0+SN0lk1LXZQdf4MZRo6wEzOKCE9nElI/CpB2Vdexr
         aiNosSVQucR/7y6bKUJBZtBaukkrIT2RNDPIZBQlP/EkEgC/8+6o+0rqg2YEXXufWHxQ
         nu8SLWnSI81UN96zZgOZoaLnVF8OWQHbCHGlxv9reD65a1/6HFvog1Yq7CljvypmeC1v
         jE9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=XsOPpvWuwBXOSKCf38VaHwxJ5PevnO7TYnllA9/6o2c=;
        b=Jimtr8AJy2NApG+QROVdj3n9nUTXxM/E9gSN4Mp2eYpx4R1/RwWbEM2IkSb9Qci7Uz
         /GEsCMsqOBykUcsnqk0931FtDe7zvHynEt+3VFvjucaUNkSoAs9Ty/t4YZL+AqW3T0TU
         M1F7Oz6u3oBoExgVTs+pQSCBoGYhFceRSHx2kr60aUl/lMuUJx/D37V4ClTpAaPYVrkD
         jzJnyWxzFBIEmHQFSR64XvX55GZXBWwJIAVSxZTC4pzuP7Ss+RNViwfwOfLitUFh9PPU
         y4Ho0XIFNFXn/BIbaV8VRkyrAewMcKAakeUaWRsdcoEZybGwDvEf+ADV+RaRMN/zeXPC
         jZhw==
X-Gm-Message-State: APjAAAWRYL2alWeZydzsHE50rHvNz8l83W8FhqU7/lPGIqodtSMykyDh
        ePD/jQIQHQSGRHFbT3zVFCyVkFs1
X-Google-Smtp-Source: APXvYqxSys5lsstCr44HYAxPQo4NTspSssSmLavblRGEhYtYpinq2arWHRpUNLR8UeTb9rgnDmgGsw==
X-Received: by 2002:a2e:9155:: with SMTP id q21mr24213417ljg.178.1556657559073;
        Tue, 30 Apr 2019 13:52:39 -0700 (PDT)
Received: from [192.168.1.19] (chf176.neoplus.adsl.tpnet.pl. [83.31.3.176])
        by smtp.gmail.com with ESMTPSA id y19sm8202586lfb.24.2019.04.30.13.52.37
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 30 Apr 2019 13:52:38 -0700 (PDT)
Subject: Re: [PATCH leds/for-next v2 2/2] leds: turris-omnia: Add support for
 256 brightness values
To:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>
Cc:     =?UTF-8?Q?Marek_Beh=c3=ban?= <marek.behun@nic.cz>,
        linux-leds@vger.kernel.org
References: <20190429212944.15643-1-marek.behun@nic.cz>
 <20190429212944.15643-3-marek.behun@nic.cz>
 <87eafec0-b074-689d-20b6-171a866745ea@ti.com> <20190430204625.GA20410@amd>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <eb5f9ce0-914e-57dc-5e58-65c1f2ef52db@gmail.com>
Date:   Tue, 30 Apr 2019 22:52:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190430204625.GA20410@amd>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 4/30/19 10:46 PM, Pavel Machek wrote:
> Hi!
> 
>>> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
>>> index 3747cbd0de2c..62d17c2f4878 100644
>>> --- a/drivers/leds/Kconfig
>>> +++ b/drivers/leds/Kconfig
>>> @@ -139,8 +139,8 @@ config LEDS_TURRIS_OMNIA
>>>   	  side of CZ.NIC's Turris Omnia router. There are 12 RGB LEDs on the
>>>   	  front panel.
>>>   	  This driver does not currently support setting LED colors, only
>>> -	  on/off state. Also HW triggering is disabled when the controller
>>> -	  is probed by this driver.
>>> +	  brightness. Also HW triggering is disabled when the controller is
>>> +	  probed by this driver.
>>>   
>>
>> I am not seeing where or how this is done in the driver on probe.
> 
> I checked, and I believe it was ok.
> 
>>>   config LEDS_LM3530
>>>   	tristate "LCD Backlight driver for LM3530"
>>> diff --git a/drivers/leds/leds-turris-omnia.c b/drivers/leds/leds-turris-omnia.c
>>> index dc9fac56b13a..0e805d94f298 100644
>>> --- a/drivers/leds/leds-turris-omnia.c
>>> +++ b/drivers/leds/leds-turris-omnia.c
>>> @@ -54,7 +54,7 @@ static int omnia_led_brightness_set_blocking(struct led_classdev *led,
>>>   	struct omnia_leds *leds = dev_get_drvdata(led->dev->parent);
>>>   	int idx = omnia_led_idx(leds, led);
>>>   	int ret;
>>> -	u8 state;
>>> +	u8 buf[5], state;
>>
>> Magic numbers
> 
> Nothing wrong with magic "5" when you have 0, 1, 2, 3 and 4
> below. Constants are useful when they make code easier to read, not in
> this case.
> 
>>>   	mutex_unlock(&leds->lock);
>>>   
>>>   	return ret;
>>> @@ -97,7 +105,7 @@ static int omnia_led_register(struct omnia_leds *leds,
>>>   	ret = fwnode_property_read_string(node, "label", &str);
>>>   	snprintf(led->name, sizeof(led->name), "omnia::%s", ret ? "" : str);
>>>   
>>> -	led->cdev.max_brightness = 1;
>>> +	led->cdev.max_brightness = 255;
>>
>> How about LED_FULL?
> 
> Please don't.
> 
>>> +	/* set all LEDs color to [255, 255, 255] */
>>> +	buf[0] = CMD_LED_COLOR;
>>> +	buf[1] = OMNIA_BOARD_LEDS;
>>> +	buf[2] = buf[3] = buf[4] = 255;
>>> +
>>
>> LED_FULL for this as above.
> 
> I'd actually prefer 255 here; due to the way hardware is designed,
> it has brightness in byte. No need to put LED_FULL here, and force
> reader to check the headers to see what value LED_FULL has.

Let's be consistent. Please add constants for both 5 and 255.
The conventions are established for a reason.

-- 
Best regards,
Jacek Anaszewski
