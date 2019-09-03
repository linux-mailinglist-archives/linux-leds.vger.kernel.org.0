Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 40E2FA7273
	for <lists+linux-leds@lfdr.de>; Tue,  3 Sep 2019 20:18:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728854AbfICSSm (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 3 Sep 2019 14:18:42 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:33670 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727667AbfICSSm (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 3 Sep 2019 14:18:42 -0400
Received: by mail-wr1-f67.google.com with SMTP id u16so18531972wrr.0;
        Tue, 03 Sep 2019 11:18:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=wl1pZ1vlpeWnFWRdemrfXh0aZrREjkA/gBz2GbdineM=;
        b=fx/MABa+b2Dqkw6SOkdcQUbvoul8mNXpPpVzEKGL65LVcLd4dRq86zJ0fe2G2xebv2
         0wGxEtrdPh2+TBfl5rN9s8PuWkFddr2RK43u3nUQWICYmxK6afF+Nc54rQaM7nO3cS1G
         6JpFW2p0oxxZX0Hk2tCY7Dvx+6IBxFyvxHb8mJXX7c9i1jeUyL0JQbsjR8N2pXjMt982
         cdYInfkdZVH3CTbt+3WMphqGa5wy+7fAnBqhZgzemhQeXbi4dl0rYghO0/ORGPWr95JL
         2lWs+764MJTpcU1rv3tDdej39Tj4Nu7+CYEjw74Iu3zEg3NJm5+1nxgNk+08OIlomQ/f
         xBxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=wl1pZ1vlpeWnFWRdemrfXh0aZrREjkA/gBz2GbdineM=;
        b=QwPhE0g6jUomRuCPsZUnGm35fpSMtnsVvC/W3OwPyO8Gkp60LGfJRoF5rtU0W9RhXI
         3ydxC8472Lh3Vz+jA93OmXegOebiLgqKbihjLMVp5wTzIAIbtSeinuV6Tlg8E7RRrDOP
         YDCcGZN9EZdz6/H+GFtdWvLxQhIToB8T3bn5CI/vLmZy17aRRNl1l7vBi/J03LY/IL4W
         LgzDi8CxmnEdCMjrW0aLrxjNAmxuKPhg0qPa1m1V4ra/CUJYQDshDPncGswL+M3Keqjr
         itzeV93fP90bfz4w2RlA0HoDVOfVTUiqNYpPrQcjf5sRn5PlJvggSdbZuxpug1p+okg1
         ogmA==
X-Gm-Message-State: APjAAAUZ1CSEOEaoMZDl9EOV1O/yAAMdOWdTY2V2q6g30t2M6rXFdgE8
        JYJAxr9sEbLQDXK91d1IILA=
X-Google-Smtp-Source: APXvYqxildbVCaq1kqbAGovTr1XSM20fnaaLiNR7g4Iou09ge9VabXye2FmacrTBbLW8WR5umTqkFg==
X-Received: by 2002:adf:a4c7:: with SMTP id h7mr28766062wrb.137.1567534719374;
        Tue, 03 Sep 2019 11:18:39 -0700 (PDT)
Received: from [192.168.1.19] (ckg67.neoplus.adsl.tpnet.pl. [83.31.82.67])
        by smtp.gmail.com with ESMTPSA id q19sm36074353wra.89.2019.09.03.11.18.37
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 03 Sep 2019 11:18:38 -0700 (PDT)
Subject: Re: [PATCH] leds: remove PAGE_SIZE limit of
 /sys/class/leds/<led>/trigger
To:     Akinobu Mita <akinobu.mita@gmail.com>,
        Greg KH <gregkh@linuxfoundation.org>
Cc:     linux-leds@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>
References: <1567090164-6819-1-git-send-email-akinobu.mita@gmail.com>
 <6ebeedab-4a7f-14ea-d62e-9184e911047f@gmail.com>
 <20190902181207.GA18577@kroah.com>
 <1cd468a3-b6e5-a93b-739a-f30288318356@gmail.com>
 <20190902190843.GB25019@kroah.com>
 <CAC5umyjTJSMdKMtZbF8Uxky6nOrAHesTHmZRV5VA1uPwX2rtxA@mail.gmail.com>
 <20190903140719.GA9506@kroah.com>
 <CAC5umyhApkfo+-7+nPFn20MLpG7dxrSE1+1FPhZp+p=hCsopeg@mail.gmail.com>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=jacek.anaszewski@gmail.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <52bef6f9-7d96-627b-069e-02b3ffa0559e@gmail.com>
Date:   Tue, 3 Sep 2019 20:18:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAC5umyhApkfo+-7+nPFn20MLpG7dxrSE1+1FPhZp+p=hCsopeg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 9/3/19 4:21 PM, Akinobu Mita wrote:
> 2019年9月3日(火) 23:07 Greg KH <gregkh@linuxfoundation.org>:
>>
>> On Tue, Sep 03, 2019 at 10:55:40PM +0900, Akinobu Mita wrote:
>>> 2019年9月3日(火) 4:08 Greg KH <gregkh@linuxfoundation.org>:
>>>>
>>>> On Mon, Sep 02, 2019 at 08:47:02PM +0200, Jacek Anaszewski wrote:
>>>>> On 9/2/19 8:12 PM, Greg KH wrote:
>>>>>> On Sun, Sep 01, 2019 at 06:53:34PM +0200, Jacek Anaszewski wrote:
>>>>>>> Hi Akinobu,
>>>>>>>
>>>>>>> Thank you for the patch.
>>>>>>>
>>>>>>> I have one nit below but in general it looks good to me.
>>>>>>> I've tested it with 2000 mtd triggers (~14kB file size)
>>>>>>> and it worked flawlessly.
>>>>>>>
>>>>>>> Still, I would like to have ack from Greg for it.
>>>>>>>
>>>>>>> Adding Greg on Cc.
>>>>>>>
>>>>>>> On 8/29/19 4:49 PM, Akinobu Mita wrote:
>>>>>>>> Reading /sys/class/leds/<led>/trigger returns all available LED triggers.
>>>>>>>> However, the size of this file is limited to PAGE_SIZE because of the
>>>>>>>> limitation for sysfs attribute.
>>>>>>>>
>>>>>>>> Enabling LED CPU trigger on systems with thousands of CPUs easily hits
>>>>>>>> PAGE_SIZE limit, and makes it impossible to see all available LED triggers
>>>>>>>> and which trigger is currently activated.
>>>>>>>>
>>>>>>>> This converts /sys/class/leds/<led>/trigger to bin attribute and removes
>>>>>>>> the PAGE_SIZE limitation.
>>>>>>
>>>>>> But this is NOT a binary file.  A sysfs binary file is used for when the
>>>>>> kernel passes data to or from hardware without any parsing of the data
>>>>>> by the kernel.
>>>>>>
>>>>>> You are not doing that here, you are abusing the "one value per file"
>>>>>> rule of sysfs so much that you are forced to work around the limitation
>>>>>> it put in place on purpose to keep you from doing stuff like this.
>>>>>>
>>>>>> Please fix this "correctly" by creating a new api that works properly
>>>>>> and just live with the fact that this file will never work correctly and
>>>>>> move everyone to use the new api instead.
>>>>>>
>>>>>> Don't keep on abusing the interface by workarounds like this, it is not
>>>>>> ok.
>>>>>
>>>>> In the message [0] you pledged to give us exception for that, provided
>>>>> it will be properly documented in the code. I suppose you now object
>>>>> because the patch does not meet that condition.
>>>>
>>>> Well, I honestly don't remember writing that email, but it was 5 months
>>>> and many thousands of emails ago :)
>>>>
>>>> Also, you all didn't document the heck out of this.  So no, I really do
>>>> not want to see this patch accepted as-is.
>>>>
>>>>> Provided that will be fixed, can we count on your ack for the
>>>>> implementation of the solution you proposed? :-)
>>>>
>>>> Let's see the patch that actually implements what I suggested first :)
>>>
>>> I'd propose introducing a new procfs file (/proc/led-triggers) and new
>>> /sys/class/leds/<led>/current-trigger api.
>>>
>>> Reading /proc/led-triggers file shows all available triggers.
>>> This violates "one value per file", but it's a procfs file.
>>
>> No, procfs files are ONLY for process-related things.  Don't keep the
>> insanity of this file format by just moving it out of sysfs and into
>> procfs :)
> 
> I see.
> 
> How about creating one file or directory for each led-trigger in
> /sys/kernel/led-triggers directory?
> 
> e.g.
> 
> $ ls /sys/kernel/led-triggers
> audio-micmute                              ide-disk        phy0assoc
> audio-mute                                 kbd-altgrlock   phy0radio
> ...
> hidpp_battery_3-full                       panic
I think that /sys/class/leds/triggers would better reflect the reality.
After all LED Trigger core belongs to LED subsystem.

-- 
Best regards,
Jacek Anaszewski
