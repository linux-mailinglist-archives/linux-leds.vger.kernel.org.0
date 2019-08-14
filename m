Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1F7608DE2B
	for <lists+linux-leds@lfdr.de>; Wed, 14 Aug 2019 21:57:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728670AbfHNT53 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 14 Aug 2019 15:57:29 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:39760 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726865AbfHNT53 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 14 Aug 2019 15:57:29 -0400
Received: by mail-wr1-f66.google.com with SMTP id t16so237510wra.6;
        Wed, 14 Aug 2019 12:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:openpgp:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=5qgldDu2T1hX63irisfyyTG7dUkySAnDyAjfhhQzr4k=;
        b=gCiy40HTPZ3UWdrP7P6JLs6kPpvjkQXYPtPEuKaasnrnxg8Wve74YFtQtITCMqlkw0
         DcjN4bd5RB5LG6ui94XzCthyWctXvFv62bjRDdqTtCUw5Ove2J38lvJWivRgp/LKnJv7
         lsluVF/biXlOLUV3g4bKpJGbtHEkr3FwGjx4NmRSyFgunFcpbuavhqN1z/Js81cz/r4V
         s7912Q3FtGLPLXKKKDrvnvI/c1wvXS6YPsfEkvVUtfRE66XSu6z+Ium9yDJSsXXX5o+X
         0Na3aEVwzSVB73EYfxKoYCvLqm6BHSme3kA6T50qxZZYboo9jfNcvDiKNw9xn4NXuW0v
         0+qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=5qgldDu2T1hX63irisfyyTG7dUkySAnDyAjfhhQzr4k=;
        b=ENcWJpiucmRHeU1qdnNtrZbmslZKVgvF5uyDkquw0D6PRQSESTxOf7WumE8dtIePNq
         kH0DF7gGXTp//q4ouyBNdct5qVRPKSy7YLqxLSEBD0WbHUZnB4rYfp0+NM0q5ZYubowO
         oX+El9z5Kk9Te7A/pEU8q9ux/w5c5V+uleDrvbkmATW5T24gzJcNoY1XE4+DXm6dkubt
         YQphiNhkP3mvGrblnnM6q6318APvhEt1LiRATIgn9tC/N0xmkzzYcHpZBlBWd5soTSWL
         WaY1y9c7vxQgovhMup7bdEUT/XVlI3TnDUw19ml3GxCCgHzADibmsdofquDFShyAzs+w
         imWw==
X-Gm-Message-State: APjAAAXWLcJDuHrdRiij/j8jpAfW5LIuLjrUz7pxOef4p/S/pDNV+kAG
        GrXXpg3k5snycrp2wseuXK1cJQa+
X-Google-Smtp-Source: APXvYqzWFfD3OApf4zcdPwAoi5QqfmiQdV2i8XM+GipggWTJ0XQwgJa4s0qrVDZF1v5zTaMcd5biLg==
X-Received: by 2002:a5d:63c8:: with SMTP id c8mr1533891wrw.21.1565812646012;
        Wed, 14 Aug 2019 12:57:26 -0700 (PDT)
Received: from [192.168.1.19] (bky210.neoplus.adsl.tpnet.pl. [83.28.192.210])
        by smtp.gmail.com with ESMTPSA id b3sm1084391wrm.72.2019.08.14.12.57.24
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 14 Aug 2019 12:57:25 -0700 (PDT)
Subject: Re: [PATCH v4 2/2] leds: add LED driver for EL15203000 board
To:     Oleh Kravchenko <oleg@kaa.org.ua>, devicetree@vger.kernel.org,
        linux-leds@vger.kernel.org
References: <20190808203204.8614-1-oleg@kaa.org.ua>
 <20190808203204.8614-2-oleg@kaa.org.ua>
 <c2b006bb-2bb6-98b0-c907-190fd9fc41c7@gmail.com>
 <260f8b69-3f4a-d911-88f8-d6de59e79bc3@kaa.org.ua>
 <56fa6881-2af6-71ec-160c-7712075756be@gmail.com>
 <11f6da3b-860a-2e52-e4fa-2a650fd2407b@kaa.org.ua>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=jacek.anaszewski@gmail.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <b0965dd8-2085-db4d-519d-8ea8a51f57a6@gmail.com>
Date:   Wed, 14 Aug 2019 21:57:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <11f6da3b-860a-2e52-e4fa-2a650fd2407b@kaa.org.ua>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 8/14/19 9:46 PM, Oleh Kravchenko wrote:
> Hello Jacek,
> 
> 14.08.19 21:18, Jacek Anaszewski пише:
>>>> Why the sequence "1 800 2 800 4 800 8 800 16 800" is duplicated here?
>>>> It seems redundant. But aside of that - aren't the timings modifiable?
>>>> In other words - are these all patterns somehow configurable or they are
>>>> pre-programmed?
>>>>
>>>
>>> All pattern is predefined, you can't change them at all.
>>> I just tried to describe real things what happened in LED board.
>>> It's ticks every 800 milliseconds for Pipe LEDs.
>>
>> It makes me wonder how you figured out the values? If you have
>> a documentation for this controller, could you share how the pattern
>> settings are documented?
> 
> I saw the code of firmware.
> Not sure if I can find any documentation for it right now.

Have you tried to alter the values? Or check what happens when
the duplication is removed?

>>>>> +
>>>>> +		Inverted cascade mode for Pipe LED:
>>>>> +		"30 800 29 800 27 800 23 800 15 800 30 800 29 800 27 800 23 800 15 800"
>>>>
>>>> Similar duplication here.
>>>>
>>>>> +
>>>>> +		Bounce mode for Pipe LED:
>>>>> +		"1 800 2 800 4 800 8 800 16 800 16 800 8 800 4 800 2 800 1 800"
>>>>
>>>> Instead of two repeating "16 800" you could provide "16 1600".
>>>> But here again is the question whether these values are configurable.
>>>> From what I can see in your driver implementation you're expecting
>>>> exactly the values provided in these examples to enable given hardware
>>>> pattern (led_pattern_cmp()).
>>>>
>>>>> +
>>>>> +		Inverted bounce mode for Pipe LED:
>>>>> +		"30 800 29 800 27 800 23 800 15 800 15 800 23 800 27 800 29 800 30 800"
>>>>
>>>
>>> Should I cut this patterns to smaller? Or let keep it?
>>>
>>
>> For the first two we could do without sequence duplication.
> 
> Ok, I will reduce it.

Please hold on for a while. I will have some more remarks to the driver,
just collecting missing info for now to gain more complete view on this
device.

-- 
Best regards,
Jacek Anaszewski
