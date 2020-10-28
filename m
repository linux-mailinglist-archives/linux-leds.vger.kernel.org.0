Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB2E129DB1E
	for <lists+linux-leds@lfdr.de>; Thu, 29 Oct 2020 00:43:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732742AbgJ1XnO (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 28 Oct 2020 19:43:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389653AbgJ1Wvw (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 28 Oct 2020 18:51:52 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F1FEC0613CF;
        Wed, 28 Oct 2020 15:51:51 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id 184so880967lfd.6;
        Wed, 28 Oct 2020 15:51:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=a42ZTHpfclzQndPssC2x9RBSnJnu5sEHiL3sczOvFqA=;
        b=nSAhtm47X+auPNjUm0Gl04eSiakBsPenJVVSoyFzU/pprU0XGr5DEMq6OgTxpjZ3Ih
         jDgFuT/bFvUfv/l/vwh6+JUo0MCPFT1Af5T2UYRwpPeqUCzIFv6IrfmrePzRNrKuH8Y4
         iyh6Nw6+eOT7PmlnYh78R1ZV2+nmph/lraPLKOZIOrMo+7VSCarC4ysZkfcIv3GHSQNe
         t/ICb5hIzvQcDGo7ZUtiYWJaaWHqlOdlMSZ/kGRCYUct7YHIXSSlQIbaFF2cwHEXxNbC
         OUwfggreYv+T5rsWA3WxHrR2D2LrMqyOtXbXD5QYzTZ3pAkZa9eP0VBgxoi9kTTiJzOw
         Enkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=a42ZTHpfclzQndPssC2x9RBSnJnu5sEHiL3sczOvFqA=;
        b=jmRxWBSMXtMhxgp8wfIRX28g3XmbsIgjSEINrJY1Hiz0t+GltIpMKHx9Yx9YIZTlMV
         RC50/8MX0LfcCHlXVZ+ZZZkhdYrbkBKrmDtUSPMWEprwt8ch69O5ZJTGWVEgoVJ5QjPK
         Pr1dH6E6eyIGBtbWaMD1UJPtIdESHTZ816Y1pkm/j8XvhNJKQNpkUewFl2NS51lHk+Bs
         9ugOzj3nDqqAue8PxlzbLklnrw8QjE3B7pJueq4U7DWNn98Ad8ncfumrQl3nvpn4kH5H
         IVz1t5EIUpmlu83mt92hciZOrnD5HjoqVdm40DuXoL1SxRqimwsyR0Ol6y/oOv9DfVaK
         uQow==
X-Gm-Message-State: AOAM533DQmZgSiQATBjSVwYZULM1/2vL3eyJ0kVgSFpZi+TU/4Ul4ZEB
        H08cG60NhTPXnoc3GFrg7YrnJfxVa2E=
X-Google-Smtp-Source: ABdhPJxvjU/xZUgOs4eh3F51nFtkUBZ6AEgyIFVgPqBSDyfZZVgMO38UPP7i42q2dbewbtNJ96R4Sg==
X-Received: by 2002:a17:906:77d9:: with SMTP id m25mr3816259ejn.190.1603883227986;
        Wed, 28 Oct 2020 04:07:07 -0700 (PDT)
Received: from ?IPv6:2a01:110f:b59:fd00:588e:5ef8:851e:45b6? ([2a01:110f:b59:fd00:588e:5ef8:851e:45b6])
        by smtp.gmail.com with ESMTPSA id r24sm2664105edm.95.2020.10.28.04.07.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2020 04:07:07 -0700 (PDT)
Subject: Re: [PATCH v1 1/2] leds: rt4505: Add support for Richtek RT4505 flash
 led controller
To:     ChiYuan Huang <u0084500@gmail.com>
Cc:     Pavel Machek <pavel@ucw.cz>, dmurphy@ti.com, robh+dt@kernel.org,
        linux-leds@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>,
        cy_huang <cy_huang@richtek.com>, devicetree@vger.kernel.org
References: <1603784069-24114-1-git-send-email-u0084500@gmail.com>
 <20201027082900.GA21354@amd> <b0f5b3c8-bebd-eeb6-20b2-15529816720c@gmail.com>
 <CADiBU3_x=9wvPv4_YxWx4H_ecV7Kbt5ur91SDv+unH4z2hzS_Q@mail.gmail.com>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <e49d4119-48da-9dba-bbbe-b688cf28bfb8@gmail.com>
Date:   Wed, 28 Oct 2020 12:07:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <CADiBU3_x=9wvPv4_YxWx4H_ecV7Kbt5ur91SDv+unH4z2hzS_Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 10/28/20 5:57 AM, ChiYuan Huang wrote:
> Hi,
> 
> Jacek Anaszewski <jacek.anaszewski@gmail.com> 於 2020年10月28日 週三 上午12:40寫道：
>>
>> Hi Pavel, ChiYuan,
>>
>> On 10/27/20 9:29 AM, Pavel Machek wrote:
>>> Hi!
>>>
>>>> From: ChiYuan Huang <cy_huang@richtek.com>
>>>>
>>>> Add support for RT4505 flash led controller. It can support up to 1.5A
>>>> flash current with hardware timeout and low input voltage
>>>> protection.
>>>
>>> Please use upper-case "LED" everywhere.
>>>
>>> This should be 2nd in the series, after DT changes.
>>>
>>>> Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
>>>> ---
>>>>    drivers/leds/Kconfig       |  11 ++
>>>>    drivers/leds/Makefile      |   1 +
>>>>    drivers/leds/leds-rt4505.c | 397 +++++++++++++++++++++++++++++++++++++++++++++
>>>>    3 files changed, 409 insertions(+)
>>>>    create mode 100644 drivers/leds/leds-rt4505.c
>> [...]
>>>> +static int rt4505_torch_brightness_set(struct led_classdev *lcdev, enum led_brightness level)
>>>> +{
>>>
>>> 80 columns, where easy.
>>>
>>>> +    struct rt4505_priv *priv = container_of(lcdev, struct rt4505_priv, flash.led_cdev);
>>>> +    u32 val = 0;
>>>> +    int ret;
>>>> +
>>>> +    mutex_lock(&priv->lock);
>>>> +
>>>> +    if (level != LED_OFF) {
>>>> +            ret = regmap_update_bits(priv->regmap, RT4505_REG_ILED, RT4505_ITORCH_MASK,
>>>> +                                     (level - 1) << RT4505_ITORCH_SHIFT);
>>>> +            if (ret)
>>>> +                    goto unlock;
>>>> +
>>>> +            val = RT4505_TORCH_SET;
>>>> +    }
>>>> +
>>>> +    ret = regmap_update_bits(priv->regmap, RT4505_REG_ENABLE, RT4505_ENABLE_MASK, val);
>>>> +
>>>> +unlock:
>>>> +    mutex_unlock(&priv->lock);
>>>> +    return ret;
>>>> +}
>>>
>>> Why is the locking needed? What will the /sys/class/leds interface
>>> look like on system with your flash?
>>
>> The locking is needed since this can be called via led_set_brightness()
>> from any place in the kernel, and especially from triggers.
>>From this case, It means only led classdev
> brihtness_get/brightness_set need to be protected.
> I search led_flash_classdev, it only can be controlled via sysfs or V4l2.
> Like as described in last mail, flash related operation is protected
> by led access_lock and v4l2 framework.
> I'll keep the locking only in led classdev brightness_get/brightness_set API.
> If I misunderstand something, please help to point out.

Locking have to be used consistently for each access to the resource
being protected with the lock. Otherwise you can end up in a situation
when rt4505_torch_brightness_set and rt4505_flash_brightness_set will
try concurrently alter hardware state. Regardless of how harmful could
it be in case of this particular device it is certainly against
programming rules.

-- 
Best regards,
Jacek Anaszewski
