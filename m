Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B463534BEF9
	for <lists+linux-leds@lfdr.de>; Sun, 28 Mar 2021 22:47:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231142AbhC1Uq1 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 28 Mar 2021 16:46:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230294AbhC1UqN (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 28 Mar 2021 16:46:13 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE222C061756;
        Sun, 28 Mar 2021 13:46:08 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id n138so15383872lfa.3;
        Sun, 28 Mar 2021 13:46:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=HL8YMDEmnVju0LcsFeN/jzyg7+yi9VknOC+AA9XVzkg=;
        b=CwdeypQOJCwjbPNgdF3D1sYZ7jajgF3bEjGw03HpAKYmnTG022kkkl5fyLja+RgE4H
         CCxn1GyyTfENpUYu5pQ7o8IOOkwiPL4ykbNdvqW5qrhBVuBAOogiEfYtOMJRj6udTnTa
         w6kxu8DmDsa6rO8flU0LVZY8RHWOhPXIzarppjzJQhflSLh214yf26Ywi/LzcWxzsu4i
         MhUlgE+XFQQOPgo7H/2OfHIFxFVSlsze+wmY/nAp1XyuPwXt3E+d3R8A53RXFUP5fCwS
         6D9O+z4BoRuDFCZwO6I5kmbSdfgrBUWTVAjzyWT30TNIlJba2gfmEzY1+FxMtPHJwOAq
         xcHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=HL8YMDEmnVju0LcsFeN/jzyg7+yi9VknOC+AA9XVzkg=;
        b=D8PBAG+Y4lSpfUw9EiISeM5V86+4B4kNnKsreuYXtDaDHUNrh5hIfqvQLLwzHl2QwD
         mx1rjSkLvTnmrfoSpzT2Ls45CZ97lQSLogeU4e86VMporbd1FEKczsjHnTYBuoyUvaJB
         c8ePmTlJXGIYy5lj6mgZknpGCi1zSqTO+Umc7kwNwl/GTK+776HswmCb0I2gJf855XZc
         581Kx9WJfS2Q12ARRPcbMUAa2uRyrtOBfJLS9hcpAGfwIbll9/LocYhpmCH+ByV4YCyU
         1msnTEelz5Ysgps4kxNUwPvRGMC13VTNhESIrtHFwdMQmhzofHUsZzK+dw7XDRJnga1z
         A24w==
X-Gm-Message-State: AOAM531c0lUZJHINi2O0WE+D5VZndxiq5kYm0BNtY9B7UXtFb58f3dk3
        JBknPbkZ+VTe/5gCnBito1nsAyTkFhB/kbNr
X-Google-Smtp-Source: ABdhPJwvZpiz8Kbli6vf6mJZLztxovbEYmAKYgSSIudyyICYsPUtFuzzzZemjpyOOZ+jNCHSXGLHRg==
X-Received: by 2002:ac2:5977:: with SMTP id h23mr15153971lfp.156.1616964367188;
        Sun, 28 Mar 2021 13:46:07 -0700 (PDT)
Received: from [192.168.1.221] (87-92-162-34.rev.dnainternet.fi. [87.92.162.34])
        by smtp.googlemail.com with ESMTPSA id j27sm1587771lfp.186.2021.03.28.13.46.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Mar 2021 13:46:06 -0700 (PDT)
Subject: Re: [PATCH 2/2] dt-binding: leds: Document leds-multi-gpio bindings
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Hermes Zhang <chenhui.zhang@axis.com>, dmurphy@ti.com,
        robh+dt@kernel.org, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        chenhuiz@axis.com, lkml@axis.com, kernel@axis.com
References: <20210324075631.5004-1-chenhui.zhang@axis.com>
 <20210324075631.5004-3-chenhui.zhang@axis.com>
 <0648fff2-5b38-66da-7eb0-9969e517421f@gmail.com>
 <20210325184140.GA16039@duo.ucw.cz>
From:   =?UTF-8?B?VmVzYSBKw6TDpHNrZWzDpGluZW4=?= <dachaac@gmail.com>
Message-ID: <6313e117-e0f8-ef7c-9165-96c5d2b9d318@gmail.com>
Date:   Sun, 28 Mar 2021 23:46:16 +0300
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210325184140.GA16039@duo.ucw.cz>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi,

On 25.3.2021 20.41, Pavel Machek wrote:
>>> +  led-gpios:
>>> +    description: Array of one or more GPIOs pins used to control the LED.
>>> +    minItems: 1
>>> +    maxItems: 8  # Should be enough
>>
>> We also have a case with multi color LEDs (which is probably a more common
>> than multi intensity LED. So I am wondering how these both could co-exist.
>>
>> From: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/leds/leds-gpio.yaml?h=v5.12-rc4#n58
>>
>>          led-0 {
>>              gpios = <&mcu_pio 0 GPIO_ACTIVE_LOW>;
>>              linux,default-trigger = "disk-activity";
>>              function = LED_FUNCTION_DISK;
>>          };
>>
>> Now 'gpios' (and in LED context) and 'led-gpios' is very close to each other
>> and could easily be confused.
>>
>> Perhaps this could be something like:
>>
>> intensity-gpios = ...
>>
>> or even simplified then just to gpios = <...>
> 
> ...
>> How would this sound?
> 
> Well, not too bad on a quick look.
> 
> Are you willing to implement such multi-color-multi-bit-multi-gpio
> driver?

We have a need for multi color GPIO LED support so I can work on that if 
no one else gets there before me -- I do not have hardware with multiple 
GPIO lines controlling the brightness so that needs a bit more effort in 
order to test that out.

At some point of time I could also revive the PWM stuff if no one else 
beats me to it -- but probably the GPIO variant is easier to get done as 
binary states are easier.

Thanks,
Vesa Jääskeläinen
