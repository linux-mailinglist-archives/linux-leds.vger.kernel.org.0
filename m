Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5D702106CE
	for <lists+linux-leds@lfdr.de>; Wed,  1 May 2019 12:08:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726052AbfEAKIH (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 1 May 2019 06:08:07 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:36425 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725959AbfEAKIH (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 1 May 2019 06:08:07 -0400
Received: by mail-lj1-f195.google.com with SMTP id y8so8727036ljd.3
        for <linux-leds@vger.kernel.org>; Wed, 01 May 2019 03:08:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=x8bCsYtKP2EdkNBC24NcfJGziXNg5kvfWEO8aBKHXvg=;
        b=RwM8PdTFrLpfySgz8Mum+SwVuZG4JA1dnSkKIHT71UTPmeJz82X3CHCOviwqFVfKKC
         F+caN2NopE5WiCIbvc2PbeDHWpJrZt3nwGu8U6D20790tJhIr+czkC7HN3LcHg5bYMyc
         JK2nuimR4JbD31KbAT0qxREpT1/P2xD1R/sGAPmH5Cyya1+BBDcS2zcCpvcMQVK2cBxt
         gGv4jhWVFs73ua9oWeSrZdcsJ0iLYB86LPaz64uV8MttdPk+cYL8wI8UHKkzw8YX+mds
         oqHccJ9UKLLYYeDUWGdS43zp5I0jqSA8BgAZ9KN8gZwHT9GUXedFD0o/Trs20X8lUp/6
         yJlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=x8bCsYtKP2EdkNBC24NcfJGziXNg5kvfWEO8aBKHXvg=;
        b=Z6bKbIR2ucq+LiirdUH01Mv2UFpWEFqo7WI3xA7sfvPjwSfyOdg1mzgg/hnKzyMCKr
         OgsdDQ7MF6DRCyBSxqxCPRlNCTTPMvcdUI2jYDnG0YWZnSmq/z/94PRmKwjUgekNFvlz
         b2Ve1uO9d7a5bBTWlRqrcRHDLOyEyu1bFSOjLbNtLE65GD6kw/6vesbuLpI00DUFXo7f
         pUXf9Rrl+uYdSAfO5aOYcvV73RgwOUVBciQ3I4Kq7fdyytgMz7aZL2cWK23f1mq40hXE
         qNr1AligasaI0JxKQT/Lw51clGdlwTidhIjZB0701P+/RvXLTXFZizX8xZ/K0tniMY9N
         NZUg==
X-Gm-Message-State: APjAAAWktnkXDGaxNOw0Vde3jb3mM34Ihxp6K+IeZzjEl6tUpuuHXck3
        xJ8N6EcBdWtV/iWQCMo7McA=
X-Google-Smtp-Source: APXvYqxknAKdmruPJvk6Goi6Whai57MNeknIMrWU+u451sIfW80VcOKt09YZLqqgUHAcVnjmk2f4kQ==
X-Received: by 2002:a2e:9ac8:: with SMTP id p8mr34828478ljj.79.1556705285410;
        Wed, 01 May 2019 03:08:05 -0700 (PDT)
Received: from [192.168.1.19] (chf176.neoplus.adsl.tpnet.pl. [83.31.3.176])
        by smtp.gmail.com with ESMTPSA id t14sm7839036lji.33.2019.05.01.03.08.03
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 01 May 2019 03:08:04 -0700 (PDT)
Subject: Re: [PATCH leds/for-next v2 2/2] leds: turris-omnia: Add support for
 256 brightness values
To:     Marek Behun <marek.behun@nic.cz>, Dan Murphy <dmurphy@ti.com>
Cc:     linux-leds@vger.kernel.org, Pavel Machek <pavel@ucw.cz>
References: <20190429212944.15643-1-marek.behun@nic.cz>
 <20190429212944.15643-3-marek.behun@nic.cz>
 <87eafec0-b074-689d-20b6-171a866745ea@ti.com>
 <20190501023802.41f733ec@nic.cz>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <24afe765-3a63-d16c-7bfc-b5188b629a69@gmail.com>
Date:   Wed, 1 May 2019 12:08:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190501023802.41f733ec@nic.cz>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Marek,

On 5/1/19 2:38 AM, Marek Behun wrote:
> Hi Dan,
> 
> On Tue, 30 Apr 2019 14:46:09 -0500
> Dan Murphy <dmurphy@ti.com> wrote:
> 
>> I am not seeing where or how this is done in the driver on probe.
> 
> In function omnia_led_register
> https://git.kernel.org/pub/scm/linux/kernel/git/j.anaszewski/linux-leds.git/tree/drivers/leds/leds-turris-omnia.c?h=for-next#n107
> 
>>> +	u8 buf[5], state;
> ...
>>> +	buf[0] = CMD_LED_COLOR;
>>> +	buf[1] = idx;
>>> +	buf[2] = buf[3] = buf[4] = brightness;
>>
>> Magic numbers

Ideally would be to add also namespacing prefix,
to make it clear that these are driver specific macros.

> Hmm. Would these names be okay?
>    CMD_LED_COLOR_LENGTH

OMNIA_CMD_LED_COLOR_LEN

>    CMD_LED_COLOR_CMD

OMNIA_CMD_LED_COLOR

>    CMD_LED_COLOR_LED_ID

OMNIA_CMD_LED_COLOR_ID

>    CMD_LED_COLOR_RED

If LED color identifiers are not varying between
commands we can skip "CMD" part.

OMNIA_LED_COLOR_RED

>    CMD_LED_COLOR_GREEN

OMNIA_LED_COLOR_GREEN

>    CMD_LED_COLOR_BLUE

OMNIA_LED_COLOR_BLUE


> If constants are used they have to indicate which command they apply to.
> Or maybe a
>    struct cmd_led_color {
>      u8 cmd;
>      u8 id;
>      u8 red, green, blue;
>    }
> could be defined, but I think that this is used very sporadically in
> the kernel.
> 
>> What happens if the LEDs are in HW triggered mode already?
>> Should this not be checked especially if the driver is removed and re-installed the uP has
>> this configured as HW mode.  Unless you reset the uP as well.
> 
> In current version of this driver on driver probe all LEDs are put into
> SW mode. On driver remove they are put to HW mode. It is not possible
> to read from the microcontroller in which mode they are.
> 
>>> +	led->cdev.max_brightness = 255;
>>
>> How about LED_FULL?
> 
> I thought about this but was not sure, for the same reason Pavel
> mentioned: I wanted to indicate that this microcontroller supports 8bit
> per channel. LED_FULL is a kernel specific macro and although it will
> never change and is equal, it makes less (fewer?) sense to me to use it.
> But I will change it in the next version per your request.

Actually, thinking more of it - all in all this is legacy enum,
superseded by, yes, max_brightness property. So, I'd say 255 can stay.

-- 
Best regards,
Jacek Anaszewski
