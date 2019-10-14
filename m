Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 579E6D69CA
	for <lists+linux-leds@lfdr.de>; Mon, 14 Oct 2019 20:57:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727083AbfJNS5x (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 14 Oct 2019 14:57:53 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:53932 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726706AbfJNS5x (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 14 Oct 2019 14:57:53 -0400
Received: by mail-wm1-f66.google.com with SMTP id i16so18322217wmd.3
        for <linux-leds@vger.kernel.org>; Mon, 14 Oct 2019 11:57:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=6O8Vz2s66qBucXasBxGc8xvRbR8UvtyU4OzRTHXR8aI=;
        b=A7vqUgpo4b6b75YarnBJxZe3R7hTbcyxRr3e0geqVvXeEPWfSY03yc/izveRJ4s1aF
         75zXU+p+Ny91UY/bMnpKECBtGzNSx+QWhfvijgQynq13kJxwfK7QxhCkzVWLYLf+DWcv
         kbKH7Rg4KeoVnYsYDRtz9fbB7+2kL1MMlEVykxmRlarpVtfXenz28+AnMSBD5OLdd2ET
         a/RkkLsxMGj9CH8s/d297kwS+q68Z/PXc8YMMG+ZHqaUByKX9OhnqNr6yV+bCQAt/hQP
         TL6kZL/7XwLMonK/sTq2YumbT7uJh+DnNzDELLzs1i4Bg/Uq9S3920hIt4EpK2NgMkWQ
         SbNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=6O8Vz2s66qBucXasBxGc8xvRbR8UvtyU4OzRTHXR8aI=;
        b=RUtRjXE2tAi5BsOIKGhKl+fYh9nIoh9F/WWIY9wnO6sYf/O1Q+7B8Q4t8lzf/gWHll
         ZUJeyVwrigdXTNFun4jcIJhU/rnEaDdAUUDterch5t/l4Qj7ssQoDsraQ8UVRENOeq4V
         8Fdao52yP1rKqezr0AP66ZsOXHuqujkl7j9r7KBKNvkgeWKFL6JAugmNKlY60xCCvkce
         nKZf1PvK+2hgzrN04XibrJzAIr5pLrWPxCekEqIW4wQ+GY6vJg6ymzNHpNKdZZplin12
         yvr+U5GeptLtQbG+vKXEowcCFDhCzIPI2cswHOSTU9QCC+VS4GoaZYybsU0a+KJyqD5D
         Dumw==
X-Gm-Message-State: APjAAAUAWV4OHVl6GVc3x+MNRtOMJsokgdJGBZ2q1ou1pIsq9YrfkWlM
        ppia0u7sLbpWuGAofzBpE/WN804M
X-Google-Smtp-Source: APXvYqyyPBrveDCoGR8k0+ZRLu9SYTO3SHip/uEPjFiQBIvSsb9kBO9QuNrqeBVy/SvBPqCyEv+ycg==
X-Received: by 2002:a7b:cd04:: with SMTP id f4mr16087057wmj.91.1571079470094;
        Mon, 14 Oct 2019 11:57:50 -0700 (PDT)
Received: from [192.168.1.19] (cka157.neoplus.adsl.tpnet.pl. [83.31.76.157])
        by smtp.gmail.com with ESMTPSA id a13sm51285846wrf.73.2019.10.14.11.57.48
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 14 Oct 2019 11:57:49 -0700 (PDT)
Subject: Re: [PATCH] leds: mlxreg: Fix possible buffer overflow
To:     Oleh Kravchenko <oleg@kaa.org.ua>
Cc:     Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org
References: <20190921220230.6850-1-oleg@kaa.org.ua>
 <20190926120734.GC9310@amd> <b20ad1ca-78ef-4f44-aae9-7e26bb24b3a2@kaa.org.ua>
 <a5647bbd-cb0f-ef8c-75f9-5000aae24d1b@gmail.com>
 <a5dadff5-17d1-1fe0-8e0a-a667eb26273d@kaa.org.ua>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=jacek.anaszewski@gmail.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <64094126-bbe3-bf7d-1788-6d24cc6a90d5@gmail.com>
Date:   Mon, 14 Oct 2019 20:57:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <a5dadff5-17d1-1fe0-8e0a-a667eb26273d@kaa.org.ua>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Oleh,

On 10/13/19 8:00 PM, Oleh Kravchenko wrote:
> Hello Jacek,
> 
> 13.10.19 20:48, Jacek Anaszewski пише:
>> Hi Oleh,
>>
>> On 10/13/19 7:33 PM, Oleh Kravchenko wrote:
>>> Hello Jacek,
>>> Could you please react on this patch?
>>
>> Sorry for dropping the ball on it. Either way, I can only give
>> my ack since I handed over LED git maintenance to Pavel.
> 
> I hope you will be still involved in Linux kernel development.
> Your code-reviews was good and very useful. 

I'm glad you found them useful.

I may not be as active as I used to but I will be hanging
around...

>> Acked-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
> 
> Thank you!

You're welcome.

>>> 26.09.19 15:07, Pavel Machek пише:
>>>> On Sun 2019-09-22 01:02:30, Oleh Kravchenko wrote:
>>>>> Error was detected by PVS-Studio:
>>>>> V512 A call of the 'sprintf' function will lead to overflow of
>>>>> the buffer 'led_data->led_cdev_name'.
>>>>>
>>>>> Signed-off-by: Oleh Kravchenko <oleg@kaa.org.ua>
>>>>
>>>> Acked-by: Pavel Machek <pavel@ucw.cz>
>>>>
>>>
>>

-- 
Best regards,
Jacek Anaszewski
