Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 97A606D317
	for <lists+linux-leds@lfdr.de>; Thu, 18 Jul 2019 19:49:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728222AbfGRRtV (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 18 Jul 2019 13:49:21 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:41311 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727685AbfGRRtV (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 18 Jul 2019 13:49:21 -0400
Received: by mail-wr1-f67.google.com with SMTP id c2so26435604wrm.8;
        Thu, 18 Jul 2019 10:49:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=pgafvxZ2WNWOqgq4j6/+Wz8LCOx0VkOfOwXK6KTHB34=;
        b=VAxlwSVpmVGpT9xS2WTQl3NmzWZ20jUxLMaYhEhhFTBnQJ0smUNnpUv0E/+apDK+hY
         DWKMVRrbqlhgT7uKkSv4S1xXRXNLsmwv+oOnjBZZyOSp89NpwsU0lSBiSeT0oTF6TcZ4
         yOPeL4CzjUljTXllLsRszWlPsrWrtG2zBbfuX0BeHVO3MkjkAjPnC4MxTHS3fZEsPwMM
         w2ohrzgn8v7/HX9TY1UMlDH3Nl+14RaLI39kzW61ULL0Tc7xv0aSFc/tjuYcIiNtRtg/
         YZblwpMroF1o4LdvaaPUS4cq8aXDuQt2ULSnAQb/KMArm0J5WnyIqIl9DUPLHkpJBVRn
         1tMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=pgafvxZ2WNWOqgq4j6/+Wz8LCOx0VkOfOwXK6KTHB34=;
        b=p4yHfiwsc680RFi65MYBsVNCuy5U44r7seRHAgCn9oVirAoTYuaC0EC03TBk79iVLj
         Ok1Xgqgw+a+x3Z0LqRguSf25to+AoPEKp6X4feTU32Bthq1D1t5aEdCSLfMN09p0yUY+
         kWpSvzU3T3V194ofPrJbKBb3tNYppWgkoo2I2Sv7ssdBN/+cyMYF84eXA87349wlepkF
         rbv527xFzhASDeRA4Vxc45ctXRLIrfxOZNqivjUUtuKHbclK/5tRX1zbhpzKX7pwBClE
         CKjf7SFfskiZDQDRffMAb7oEikNxcjHvTtcZX09XeEemLkvxrMU82JMiiXL1RRSLVRph
         OBaA==
X-Gm-Message-State: APjAAAW2rW0k9GKbZ/ot7bnG8v7L5v53zyA4PAIl2oeAf7UTKspcuVic
        6Zc8kNu+jPFNhEvhBAZlcJTGpL//
X-Google-Smtp-Source: APXvYqwX6QHAojsT4El/TU5a8Dhou+Cy9JrzDxlSR6Xq30IWTzmVa7RKLhI201PVB1QL3KxlQEsMng==
X-Received: by 2002:a5d:518f:: with SMTP id k15mr10642655wrv.321.1563472157706;
        Thu, 18 Jul 2019 10:49:17 -0700 (PDT)
Received: from [192.168.1.19] (bkt159.neoplus.adsl.tpnet.pl. [83.28.187.159])
        by smtp.gmail.com with ESMTPSA id t3sm20585948wmi.6.2019.07.18.10.49.16
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 18 Jul 2019 10:49:17 -0700 (PDT)
Subject: Re: [PATCH v3 2/3] leds: Add control of the voltage/current regulator
 to the LED core
To:     Jean-Jacques Hiblot <jjhiblot@ti.com>, pavel@ucw.cz,
        robh+dt@kernel.org, mark.rutland@arm.com,
        daniel.thompson@linaro.org
Cc:     dmurphy@ti.com, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20190717135948.19340-1-jjhiblot@ti.com>
 <20190717135948.19340-3-jjhiblot@ti.com>
 <4bd3b558-ea5b-0d2e-16b2-5b2e8bb484d2@gmail.com>
 <49152281-059c-6006-4c0f-a6be96a12707@ti.com>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=jacek.anaszewski@gmail.com; prefer-encrypt=mutual; keydata=
 mQINBFWjfaEBEADd66EQbd6yd8YjG0kbEDT2QIkx8C7BqMXR8AdmA1OMApbfSvEZFT1D/ECR
 eWFBS8XtApKQx1xAs1j5z70k3zebk2eeNs5ahxi6vM4Qh89vBM46biSKeeX5fLcv7asmGb/a
 FnHPAfQaKFyG/Bj9V+//ef67hpjJWR3s74C6LZCFLcbZM0z/wTH+baA5Jwcnqr4h/ygosvhP
 X3gkRzJLSFYekmEv+WHieeKXLrJdsUPUvPJTZtvi3ELUxHNOZwX2oRJStWpmL2QGMwPokRNQ
 29GvnueQdQrIl2ylhul6TSrClMrKZqOajDFng7TLgvNfyVZE8WQwmrkTrdzBLfu3kScjE14Q
 Volq8OtQpTsw5570D4plVKh2ahlhrwXdneSot0STk9Dh1grEB/Jfw8dknvqkdjALUrrM45eF
 FM4FSMxIlNV8WxueHDss9vXRbCUxzGw37Ck9JWYo0EpcpcvwPf33yntYCbnt+RQRjv7vy3w5
 osVwRR4hpbL/fWt1AnZ+RvbP4kYSptOCPQ+Pp1tCw16BOaPjtlqSTcrlD2fo2IbaB5D21SUa
 IsdZ/XkD+V2S9jCrN1yyK2iKgxtDoUkWiqlfRgH2Ep1tZtb4NLF/S0oCr7rNLO7WbqLZQh1q
 ShfZR16h7YW//1/NFwnyCVaG1CP/L/io719dPWgEd/sVSKT2TwARAQABtC1KYWNlayBBbmFz
 emV3c2tpIDxqYWNlay5hbmFzemV3c2tpQGdtYWlsLmNvbT6JAj4EEwEIACgCGwMHCwkIBwMC
 AQYVCAIJCgsDFgIBAh4BAheABQJVo39tBQkJZgNMAAoJEL1qUBy3i3wmxLQQAK8QEQ0JqZEv
 5hrxiwT+Qtkx1TULYriK9sYcY9zbi18YxbKB0C4Znh5iP5o7k26WnPGLM+w4qWvTAkHjuAI7
 aBrvb4nGRvE5s14PQ9IHgL7iL3zAAHT1azIZng9dUCCSontB+vQZu1x/Un0lVlVCvsvO7QVt
 hAZUlT3iucNMO0jpCiS3raZkNfab8M+JWP/iplaV0Kn+O7LX3A/RdLmx5ZhuT+zvyHwl2c3K
 T56UHaQnjkuHB2Ytk8HtOjNXGNYnm4nLx3ok3jEN1nWDRV/DeiPn8zz4Zebsp686OH9vvX/0
 R4dk2YEjUCY/S7CbJxXzUnLjboUAGmtTVOu/uJ7y11iS9XEoJ09HEzijQwWctJXLojcTXCFw
 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
 eGGiEQ==
Message-ID: <928fd71b-d1d3-cbf3-1aed-ae7fa97f6cf0@gmail.com>
Date:   Thu, 18 Jul 2019 19:49:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <49152281-059c-6006-4c0f-a6be96a12707@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 7/18/19 3:31 PM, Jean-Jacques Hiblot wrote:
> 
> On 18/07/2019 14:24, Jacek Anaszewski wrote:
>> Hi Jean,
>>
>> Thank you for the updated patch set.
>>
>> I have some more comments below.
>>
>> On 7/17/19 3:59 PM, Jean-Jacques Hiblot wrote:
>>>   +static bool __led_need_regulator_update(struct led_classdev
>>> *led_cdev,
>>> +                    int brightness)
>>> +{
>>> +    bool new_state = (brightness != LED_OFF);
>> How about:
>>
>> bool new_state = !!brightness;
> 
> Throughout the code LED_OFF is used when the LED is turned off. I think
> it would be more consistent to use it there too.

Basically brightness is a scalar and 0 always means off.
We treat enum led_brightness as a legacy type - it is no
longer valid on the whole its span since LED_FULL = 255
was depreciated with addition of max_brightness property.

IMHO use of reverse logic here only hinders code analysis.

>>> +
>>> +    return led_cdev->regulator && led_cdev->regulator_state !=
>>> new_state;
>>> +}
>>> +static int __led_handle_regulator(struct led_classdev *led_cdev,
>>> +                int brightness)
>>> +{
>>> +    int rc;
>>> +
>>> +    if (__led_need_regulator_update(led_cdev, brightness)) {
>>> +
>>> +        if (brightness != LED_OFF)
>>> +            rc = regulator_enable(led_cdev->regulator);
>>> +        else
>>> +            rc = regulator_disable(led_cdev->regulator);
>>> +        if (rc)
>>> +            return rc;
>>> +
>>> +        led_cdev->regulator_state = (brightness != LED_OFF);
>>> +    }
>>> +    return 0;
>>> +}
>> Let's have these function names without leading underscores.
> OK.
>>
>>>   static int __led_set_brightness(struct led_classdev *led_cdev,
>>>                   enum led_brightness value)
>>>   {
>>> @@ -115,6 +142,8 @@ static void set_brightness_delayed(struct
>>> work_struct *ws)
>>>       if (ret == -ENOTSUPP)
>>>           ret = __led_set_brightness_blocking(led_cdev,
>>>                       led_cdev->delayed_set_value);
>>> +    __led_handle_regulator(led_cdev, led_cdev->delayed_set_value)
>> If you called it from __led_set_brightness() and
> 
> We cannot call it from __led_set_brightness() because it is supposed not
> to block.

You're right. The problematic part is that with regulator handling
we cannot treat the whole brightness setting operation uniformly
for brightness_set op case, i.e. without mediation of a workqueue.

Now you have to fire workqueue in led_set_brightness_nopm()
even for brightness_set() op path, if regulator state needs update.
This is ugly and can be misleading. Can be also error prone and
have non-obvious implications for software blink state transitions.

I think we would first need to improve locking between the workqueue
and led_timer_function(). I proposed a patch [0] over a year
ago.

Only then we could think of adding another asynchronous dependency
to the brightness setting chain.

[0] https://lkml.org/lkml/2018/1/17/1144

-- 
Best regards,
Jacek Anaszewski
