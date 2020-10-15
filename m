Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A51CB28FA38
	for <lists+linux-leds@lfdr.de>; Thu, 15 Oct 2020 22:39:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729908AbgJOUjL (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 15 Oct 2020 16:39:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729881AbgJOUjL (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 15 Oct 2020 16:39:11 -0400
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B32A5C061755
        for <linux-leds@vger.kernel.org>; Thu, 15 Oct 2020 13:39:10 -0700 (PDT)
Received: by mail-ej1-x642.google.com with SMTP id dt13so5477605ejb.12
        for <linux-leds@vger.kernel.org>; Thu, 15 Oct 2020 13:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=HDxv9sIgm0iZpGJSQGaa/JC7ee2G0R3SMebABly9gOA=;
        b=iadpxNy0hncC/trZ/IK+THEA3sUrOSdz6yNHsOOvOd6NXJbAqpMy+lZScgrLWZ694v
         EEUJZW0TFrlzj0SLljIKV2iVE/UQ46OzvG9UcDU6Ir6kJWb0My2LTpMBqGD1YcQtQdR2
         QH67fHCAWdSXr9/OUctephDhWuVWJBX6QCKV5CHgaXG3U4hXC1l1kU41GSUfKdPG5Ke+
         dXHL62CIrVZt4fEc+bdfpYFbO4TvZtZ5CHEWq8cUuouOdCozPi69dESRwQphFPwBBADk
         sVREr5BBYl7FufZmfOYZd6Iq7aMN1Y3qMF4iIjJ86b5TdNYscNf6GXwOk83IqE/CrrLK
         J+0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=HDxv9sIgm0iZpGJSQGaa/JC7ee2G0R3SMebABly9gOA=;
        b=MskfNGusqW0KHxagfyLagR7bhS0Zgxx5LtJrszl5uHsiDP2e8ZS5iiEkZkN4Tr1K3Z
         DE/AK6/DRElepN205J8GtvGflCQ5/oMMTaDGH8OJlcaECTFQYvSlrp2KLuY/Hi6dL7Wu
         2lt0S+m3SYASZUmTSqJoX8K7CDxEM0dh7ATLLvhPwkm3ZxUvFih9eGA2nOKKQK7WbMpz
         O9EUXdyMIaJSFnB9ENDI9IJOCgA5TTj7v+tkX7BsyisjArfAzwW7QLudc5pMiblAaYjh
         u8UCNGd9YPF2LO8rEG0DLYlJaNOKTrEH5Xc4XPgwkoknlq9EPcbUpnF1Df4MhYpvt7e5
         tQ4A==
X-Gm-Message-State: AOAM533t22HBmXLud+xv3UomJ7LZifT2kXjLHCkqhFNK3DZyJxjHtw+Z
        LGAFz0N03OGZDoPfbZM/kPm/2snqlg8=
X-Google-Smtp-Source: ABdhPJwqIMhmpv0nI9iSUD43sGmkBo7yW1hNJLmIe9A/3hBZ3DqH2CmynPWLOVMAhUuFjBsXOr7O5Q==
X-Received: by 2002:a17:906:f151:: with SMTP id gw17mr111284ejb.119.1602794349466;
        Thu, 15 Oct 2020 13:39:09 -0700 (PDT)
Received: from ?IPv6:2a01:110f:b59:fd00:4c6f:302e:cc04:2bd8? ([2a01:110f:b59:fd00:4c6f:302e:cc04:2bd8])
        by smtp.gmail.com with ESMTPSA id w21sm168376ejo.70.2020.10.15.13.39.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2020 13:39:08 -0700 (PDT)
Subject: Re: [PATCH 2/2] leds: rt8515: Add Richtek RT8515 LED driver
To:     Linus Walleij <linus.walleij@linaro.org>,
        Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        newbytee@protonmail.com, Stephan Gerhold <stephan@gerhold.net>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
References: <20200812090711.2644688-1-linus.walleij@linaro.org>
 <20200812090711.2644688-2-linus.walleij@linaro.org>
 <c45a2758-cb43-2ccb-4056-ed25d73fa3f8@gmail.com>
 <CACRpkdYgf8OPc2EqmPu=O2dr+ns4e3kTGyVi3A2Thd9v1wQGuA@mail.gmail.com>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <542c2f4c-a51a-cc90-632f-31c891b7146f@gmail.com>
Date:   Thu, 15 Oct 2020 22:39:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <CACRpkdYgf8OPc2EqmPu=O2dr+ns4e3kTGyVi3A2Thd9v1wQGuA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Linus,

On 10/14/20 12:52 PM, Linus Walleij wrote:
> Hi Jakub!

Jacek :-)

> thanks for the review. I fixed all comments but I have a problem
> with the below:
> 
> On Thu, Aug 13, 2020 at 11:04 PM Jacek Anaszewski
> <jacek.anaszewski@gmail.com> wrote:
>> On 8/12/20 11:07 AM, Linus Walleij wrote:
> 
>>> +     /* Init flash intensity setting */
>>> +     s = &v4l2_sd_cfg->intensity;
>>> +     s->min = 0;
>>> +     s->max = rt->fled.led_cdev.max_brightness;
>>> +     s->step = 1;
>>
>> struct v4l2_flash_config's intensity property tells V4L2 flash framework
>> how to convert LED class brightness levels to microamperes used by
>> the V4L2 flash subdevice.
>>
>> See max77693_init_v4l2_flash_config() in drivers/leds/leds-max77693.c
>> for a reference.
> 
> I understand, but I'm a bit of lost here, because I do not have
> any datsheet for the Richtek RT8515. The outoftree code
> that exists for example for Asus Zenfone:
> https://github.com/ZenfoneArea/android_kernel_asus_zenfone5/blob/master/linux/modules/camera/drivers/media/i2c/rt8515.c
> 
> The intensity is set to min/max in percent
> (0-100%) so the numerals 1-100 step 1 so
> the same as the brightness.

In such case there is not much we can do and your solution
seems reasonable.

> Is the V4L2 API such defined that if you don't know
> what microamperes that correspond to a certain setting
> it is better to simply not implement it? I can certainly
> remove it.

That would be a question to the author of V4L2 API.

Adding Sakari.

> I don't quite understand why V4L2 needs to control this
> in uA but I suppose they have a good reason. It however
> creates a really high bar for out-of-tree code from
> non-cooperative vendors. I'll try to send a mail to
> Richtek and ask for the datasheet though, stranger things
> have happened.

-- 
Best regards,
Jacek Anaszewski
