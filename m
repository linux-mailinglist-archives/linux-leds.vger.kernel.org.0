Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0AFF2172A08
	for <lists+linux-leds@lfdr.de>; Thu, 27 Feb 2020 22:22:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729607AbgB0VWt (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 27 Feb 2020 16:22:49 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:37547 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726460AbgB0VWt (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 27 Feb 2020 16:22:49 -0500
Received: by mail-wm1-f65.google.com with SMTP id a141so1013954wme.2;
        Thu, 27 Feb 2020 13:22:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=jjTC00oz0xJS2EtroPNnlXO/khwGqHM7na+1CB2ga9Q=;
        b=SZLLoYPk2ycxEmWzdxcVp9dB8L3T888idnFfa+DNUjRLDCFQ1+eocQ7Y404eg3Iw66
         MvVDcdOhhaM5AMnpX0EAzzuHKrqa5smyP5dIfnH4QjdjZpxeKIab9rYi2l5prNwWWbia
         i+moZQbwyzqLjLtgIWX+f+bKfiaFAnW0QCT6aAIRlQZu0uZZk0Nwg1dlUX0zj7J5V7Id
         9PsrjOnXnP4yYXNGrFLW8miKmTLZEVpZJAt1ADWgmISPmOtcF1DjYM9BVsYgoIOKxyYW
         tXn2JwLC6OqYLLXULlOKnsBRAu2FSALakMc+abRjGhDo7Vx+6LVu+KM3dB6qANjDbnNK
         v5nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=jjTC00oz0xJS2EtroPNnlXO/khwGqHM7na+1CB2ga9Q=;
        b=NoMoc9QndHxqEfidmC+eAqNQ1pMJHA0UBa4/f2rldxWnPuAWGRYt3xfPYAjsPD0My4
         FkNf6SUL5rG6WxztlVkLMcLpPLIW7EirPLO2XIkZjytPqpXCdFmzAM4Z3N8Jjg+Vq/n5
         EMxCJHp4uIjuaDOGD28qpvMCZJbw2WElslFjtSp93M/ybzg29ylNjqRNVnChy7VvEuCL
         kBbiPHXDDzTYW8wqbctJGHQGZ+ktJFxoCsUJAbNFcepN/CpWyk0Wkm2utP4P8fX1ZI8l
         yE2T3U72G65LMPZMFI/81vFvRFwA0D/T233ufcUQNbVytn2XjKSGwoUh4bqDhUQy7K2X
         0PLw==
X-Gm-Message-State: APjAAAWU9CbwOpEFSpw+PelkVW/V/SctQ+AYr6q4UyyYNXjzemueJWMH
        r6BcHhu6XSAuVy6/HMN1A4KCH8Td
X-Google-Smtp-Source: APXvYqya7eEhj7G7UENVqfpt8He9TD7I0fYw+9NXp7vM+b2Tvdl7IX+jVpzduHGEkg4j1521krlWOw==
X-Received: by 2002:a7b:cb86:: with SMTP id m6mr741164wmi.51.1582838565953;
        Thu, 27 Feb 2020 13:22:45 -0800 (PST)
Received: from [192.168.1.23] (afcq9.neoplus.adsl.tpnet.pl. [95.49.68.9])
        by smtp.gmail.com with ESMTPSA id c2sm941815wma.39.2020.02.27.13.22.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Feb 2020 13:22:45 -0800 (PST)
Subject: Re: [RESEND PATCH v17 00/17] Multi Color LED Framework
To:     Dan Murphy <dmurphy@ti.com>, Greg KH <gregkh@linuxfoundation.org>,
        Pavel Machek <pavel@denx.de>
Cc:     linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200127150032.31350-1-dmurphy@ti.com>
 <42d9687b-b488-22cf-0e9a-ff635b2094e3@ti.com> <20200225101940.GB16252@amd>
 <be76fdac-9d32-b9b2-c01d-3aa315b14463@gmail.com>
 <20200226125903.GA2800@duo.ucw.cz>
 <20f6bdd5-e899-aead-8c35-1c3a3d09145f@gmail.com>
 <20200227105808.GA27003@duo.ucw.cz> <20200227124329.GA994747@kroah.com>
 <4c273c06-5024-b2d4-c656-b165015090be@ti.com>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Autocrypt: addr=jacek.anaszewski@gmail.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <96a31ff6-5ecf-05a7-d61f-2804f2488d1b@gmail.com>
Date:   Thu, 27 Feb 2020 22:22:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <4c273c06-5024-b2d4-c656-b165015090be@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 2/27/20 2:07 PM, Dan Murphy wrote:
> Pavel
> 
> On 2/27/20 6:43 AM, Greg KH wrote:
>> On Thu, Feb 27, 2020 at 11:58:08AM +0100, Pavel Machek wrote:
>>> Hi, Jacek!
>>>
>>> (and thanks for doing this).
>>>
>>>> We have here long lasting discussion related to LED multicolor class
>>>> sysfs interface design. We went through several iterations and worked
>>>> out the solution with individual file per each color sub-LED in the
>>>> color directory as shown below:
>>>>
>>>> /sys/class/leds/<led>/colors/<color>_intensity
>>>>
>>>> This is in line with one-value-per-file sysfs rule, that is being
>>>> frequently highlighted, and we even had not so long ago a patch
>>>> for led cpu trigger solving the problem caused by this rule not
>>>> being adhered to.
>>> Yep. One of the problems is that it is nice to change all the hardware
>>> channels at once to produce color (it is often on i2c -- and slow), so
>>> current proposals use "interesting" kind of latching.
>>>
>>>> Now we have the voice below bringing to attention another caveat
>>>> from sysfs documentation:
>>>>
>>>> "it is socially acceptable to express an array of values of the same
>>>> type"
>>>>
>>>> and proposing the interface in the form of two files:
>>>>
>>>> channel_intensity (file containing array of u32's)
>>>> channel_names (usually containing "red green blue")
>>> And thus I want to have it in one file, so it is naturaly atomic. RGB
>>> leds with 3 channels are common; I have not user yet, but there are
>>> RGBW with 4 channels (and some more exotic stuff). I don't expect to
>>> have more than 5 channels.
> 
> This is not an accurate statement.  Right now a user can have up to 8
> channels to cover all the LEDs defined in the LED core
> 
> And if the led_colors array expands then this array can expand.
> 
> We have no control on how many entries the user will put in their DT so
> again this number is completely arbitrary.

I believe that some of mechanisms that were devised for the most
recent implementation proposal of LED mc class will need
to be reused for the array approach. E.g. available_colors bitmask
will make the parsing resistant to duplicates.

Of course LED multicolor DT node design should be applicable as well
to the array approach.

>> Writing 3 or 4 or 5 numbers all at once in a single sysfs file to
>> represent a single output should be fine.
>> thanks,

Thank you for making this clear.

Effectively, the way to go as I see it now is just moving from
colors directory to channel_intensity and channel_names files.

Besides that, since the issue of backwards compatibility with
LED class still remains, we need to apply the already worked out
formula for mapping brightness to color iout values.

This implies that color values written to channel_intensity file
will be written unchanged to the hw only when global brightness
is equal to max_brightness. This is because they will be multiplied
by brightness / max_brightness ratio.

Do you agree, Pavel?

-- 
Best regards,
Jacek Anaszewski
