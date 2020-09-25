Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 562B227833E
	for <lists+linux-leds@lfdr.de>; Fri, 25 Sep 2020 10:51:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727324AbgIYIvn (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 25 Sep 2020 04:51:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726990AbgIYIvn (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 25 Sep 2020 04:51:43 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39D78C0613CE;
        Fri, 25 Sep 2020 01:51:43 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id lo4so2555273ejb.8;
        Fri, 25 Sep 2020 01:51:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=mNbqVC+E8ON8znxKTKAqtEg83uwKwjLv6vJ72cPpeDU=;
        b=V9pQlmbEvv8v4KwM7JFjFzu4G6UHTYZWpwFVrsto3QeGmGiYm3b4c4PMiVBdQVbv1h
         bD8Don8RTXfreYYOHDkPV3SPzh+LYwdT2gSgzwbZ1ehEFt2SZ02s1uDjEq1oruql8sc8
         m1a/62Qi9zNJm9Rs7lQcJO5ViP27dN1tl6z86G1xglR5PRl2DitC0urkL6/Nf+hvI1cA
         Qr4+5bLWrENYikGfAtFAcnkKEof5xPMHTSGvh+j7KYS9xTQOku8DaAuo+KDfSay/4PVc
         6uCEw34LJEkY/1DhqPm6B9rNVJ9wJ69p7Jl2DNgR8DyZUNZsKqgPiaFnRA4PL+7XgtNS
         MUvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=mNbqVC+E8ON8znxKTKAqtEg83uwKwjLv6vJ72cPpeDU=;
        b=gWs44o/l82Dyhk6+dugM4sKrfECvbqV26Mff9bKqVcxzhFR/XKJPHnr/EUqmLm0pZn
         L/qxjko1SZwaJLZzOdA4H3BcRxr19OhnGh1lxGdlidXeQe5LbNUFNp/+Qy3iEdZLOrtF
         2rqPyqBXu2+Nox0sP0BpiY1sTYoz02ENa+vnw7CQZLSx2xdg8iyv7ohckujG6/7QFpdU
         Kd0nFa/R2ZnPNWsSM9ORFxmpMBE2QrNpsCzPpRB2eoHs0FILcv6mSRVpAKARV4I+Q8tn
         i1XMkEdvBMBmwFR/5YJGOY5kXIBff88TlirehuGWnlYlVFqDZHTs4yfgf5+YllQFZJ4x
         cmmg==
X-Gm-Message-State: AOAM532PEj6LTpxe4dWkB7BNoWrYKOVSEv7yaRoB1wZ2N4Lb4wnmXXaP
        jRLi6CEBKzqweREFi/d2qhYs11SnWjo=
X-Google-Smtp-Source: ABdhPJy9MUIflwaxOk+m6n3EwGlIQvRyaTkEAMs/tRkKzzjWpXtDtpI3HWvYLUcCNYLdgrIcCBbbRw==
X-Received: by 2002:a17:907:7215:: with SMTP id dr21mr1614618ejc.239.1601023901429;
        Fri, 25 Sep 2020 01:51:41 -0700 (PDT)
Received: from ?IPv6:2a01:110f:b59:fd00:d922:8747:4a19:cf92? ([2a01:110f:b59:fd00:d922:8747:4a19:cf92])
        by smtp.gmail.com with ESMTPSA id q26sm1415213ejr.97.2020.09.25.01.51.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Sep 2020 01:51:40 -0700 (PDT)
Subject: Re: ledtrig-cpu: Limit to 4 CPUs
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     linux-leds@vger.kernel.org, dmurphy@ti.com,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20200919093833.GA14326@duo.ucw.cz>
 <27e19ac9-4bc0-2945-3985-6cd6bb5407df@gmail.com>
 <20200920183401.GA21494@duo.ucw.cz>
 <781dcb5e-7bad-f740-5914-778ec8a7306b@gmail.com> <20200921224212.GA13299@amd>
 <db0b2dca-b7d3-8d76-cc6c-b399c1fa9921@gmail.com>
Message-ID: <c60858bd-9a9f-5537-9f96-2e44db0c0d9e@gmail.com>
Date:   Fri, 25 Sep 2020 10:51:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <db0b2dca-b7d3-8d76-cc6c-b399c1fa9921@gmail.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 9/22/20 10:41 PM, Jacek Anaszewski wrote:
> Hi Pavel,
> 
> On 9/22/20 12:42 AM, Pavel Machek wrote:
>> Hi!
>>
>>>> Can I get details of your setup?
>>>
>>> I don't use this trigger, but I can imagine that someone does.
>>
>> Well, if someone exists, we can increase the limit, or convince them
>> to change their setup.
> 
> Linux is used in many commercial projects and each such change generates
> a cost, so this is not a sheer matter of convincing someone.
> 
>>>> What CPU type that is, and how are you mapping CPU activity to LEDs?
>>>
>>> The type of CPU is irrelevant here. What is important is the fact
>>> that with this trigger it is possible to visually monitor CPU core
>>> online state. Probably it would be good to ask the author of that
>>> trigger about his use case.
>>
>> It is relevant -- cpu trigger never worked on x86. I had patch fixing
>> it, but got pushback.
> 
> You mean literally x86 (32-bit)? Because I checked yesterday on my
> x86_64 and it worked just fine, i.e. changing cpu online state
> generated events on all userspace LEDs I registered for each cpuN
> trigger.
> 
>>> I have spoken up, because I don't get the reason for your patch.
>>> This driver was reworked year ago to remove PAGE_SIZE limit,
>>> and I even applied it to my for-next tree, but that was at
>>> the time of handling maintainership to yourself, and you
>>> seem to not have picked that commit.
>>>
>>> Was that intentional? We had even Greg's ack [0].
>>
>> I checked, and I believe the commit is in:
> 
> Indeed, I blindly sought the changeset in git log for ledtrig-cpu.c
> file.
> 
>> #ifdef CONFIG_LEDS_TRIGGERS
>> static BIN_ATTR(trigger, 0644, led_trigger_read, led_trigger_write,
>> 0);
>> static struct bin_attribute *led_trigger_bin_attrs[] = {
>>
>> So.. no, it is not causing kernel crashes or something. But it is
>> example of bad interface, and _that_ is causing problems. (And yes, if
>> I realized it is simply possible to limit it, maybe the BIN_ATTR
>> conversion would not be neccessary...)
> 
> The limitation you proposed breaks the trigger on many plafforms.

Actually it precludes its use.

I still see the patch in your linux-next, so I reserve myself the
right to comment on your pull request.

-- 
Best regards,
Jacek Anaszewski
