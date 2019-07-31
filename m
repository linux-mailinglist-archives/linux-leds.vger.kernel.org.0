Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2F71D7CEFB
	for <lists+linux-leds@lfdr.de>; Wed, 31 Jul 2019 22:44:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729861AbfGaUof (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 31 Jul 2019 16:44:35 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:34792 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729114AbfGaUof (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 31 Jul 2019 16:44:35 -0400
Received: by mail-wm1-f68.google.com with SMTP id w9so2090579wmd.1;
        Wed, 31 Jul 2019 13:44:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=F9dDOAim4u7njXt4All3xnBgKwi/y1cTqJXZLUsRqhs=;
        b=UvTo6c1kVK/Pn18OHlWL6U5mfEp+1EOPGwTqo4wOcCaxVESIVsE2ADWBa+8fV9d9ex
         s54BXFvnueO74E3p5SQQm+I0t7pkBzI/o0bTK0cBTo/g/+ZFwIzkBQgxJ4ECfPP5k4BV
         EP6D3KT71ycRKCXF1AGw1RP0pwrg8y7EDbbjzWgJrjWqNmgfyKUciz3qFd/YwubC9ruQ
         WSavDhI2sOR70VMuPppwYBoKgCvHUAfPcZ+IPotbAPqBmtAKOlalzdbHSpYD6dzH+QQ/
         qlbLkVFSgO7k9hLhn3cohoSoI1MHkZvZHO0b7BQ1vShHYU7maRUTaWAnutX94JjF0KK3
         vdRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=F9dDOAim4u7njXt4All3xnBgKwi/y1cTqJXZLUsRqhs=;
        b=XC/jq0ON+n5nhcRvnb6Ag3nx+UWxKoywrz2aXg36Z2wRFZzddUMeQhSqEofboMpF07
         l5o1cTSL7yqFAnKxvAQfw7UNBTgxFjsS9oLU5SO82xZTj5BNQz2ueqgegEjE+/Ogw4pD
         6RDrnzVmZm/fCC+B42LXCrnJDcy4LselDe0qttne68rqeXi74jHAhsgf9F1Dl/EGadSc
         tFBETFxNtnoFRrkP+zBHfh5E++OlL4RoXnlv57IajEQ6xmp8aZbHjRT7eCG5J4dCmhhh
         h591vLTyaaPmaFM9wTuITTu5/HLKmgIpvb8/36Yt9vbFiMyhsxMYzAuVdVVOMX0gE/CK
         D4mA==
X-Gm-Message-State: APjAAAUMaFc4UejZ7P2/BoWs05eHOaVv4c8Zbd6GFih8OGw09Ehg0ThI
        h2SS1IVbh+MLR1263amlPmPx8BXG
X-Google-Smtp-Source: APXvYqzPzOCmyXbeGy3Z3Ky/McZwp5cnMuLtXVeKKY3JiEdyu6/nai0ygkSYoLQG3lwq3raF2jb0Dg==
X-Received: by 2002:a05:600c:206:: with SMTP id 6mr86883689wmi.91.1564605870756;
        Wed, 31 Jul 2019 13:44:30 -0700 (PDT)
Received: from [192.168.1.19] (ciu68.neoplus.adsl.tpnet.pl. [83.31.44.68])
        by smtp.gmail.com with ESMTPSA id c11sm117910409wrq.45.2019.07.31.13.44.29
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 31 Jul 2019 13:44:30 -0700 (PDT)
Subject: Re: [PATCH v4 6/9] leds: multicolor: Introduce a multicolor class
 definition
To:     Dan Murphy <dmurphy@ti.com>, pavel@ucw.cz
Cc:     linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20190725182818.29556-1-dmurphy@ti.com>
 <20190725182818.29556-7-dmurphy@ti.com>
 <fa74cc04-61fc-161f-2ce1-6de5921fce2f@gmail.com>
 <f83b0f42-a310-a800-1b78-d5fb89516114@ti.com>
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
 emV3c2tpIDxqYWNlay5hbmFzemV3c2tpQGdtYWlsLmNvbT6JAlgEEwEIAEICGwMHCwkIBwMC
 AQYVCAIJCgsDFgIBAh4BAheABQkJZgNMFiEEvx38ClaPBfeVdXCQvWpQHLeLfCYFAl05/9sC
 GQEACgkQvWpQHLeLfCarMQ/9FN/WqJdN2tf6xkP0RFyS4ft0sT04zkOCFfOMxs8mZ+KZoMU+
 X3a+fEppDL7xgRFpHyGaEel7lSi1eqtzsqZ5JiHbDS1Ht1G8TtATb8q8id68qeSeW2mfzaLQ
 98NPELGfUXFoUqUQkG5z2p92UrGF4Muj1vOIW93pwvE4uDpNsl+jriwHomLtjIUoZtIRjGfZ
 RCyUQI0vi5LYzXCebuzAjGD7Jh2YAp7fDGrv3qTq8sX+DUJ4H/+I8PiL+jXKkEeppqIhlBJJ
 l4WcgggMu3c2uljYDuqRYghte33BXyCPAocfO2/sN+yJRUTVuRFlOxUk4srz/W8SQDwOAwtK
 V7TzdyF1/jOGBxWwS13EjMb4u3XwPMzcPlEQNdIqz76NFmJ99xYEvgkAmFmRioxuBTRv8Fs1
 c1jQ00WWJ5vezqY6lccdDroPalXWeFzfPjIhKbV3LAYTlqv0It75GW9+0TBhPqdTM15DrCVX
 B7Ues7UnD5FBtWwewTnwr+cu8te449VDMzN2I+a9YKJ1s6uZmzh5HnuKn6tAfGyQh8MujSOM
 lZrNHrRsIsLXOjeGVa84Qk/watEcOoyQ7d+YaVosU0OCZl0GldvbGp1z2u8cd2N/HJ7dAgFh
 Q7dtGXmdXpt2WKQvTvQXhIrCWVQErNYbDZDD2V0TZtlPBaZP4fkUDkvH+Sy5Ag0EVaN9oQEQ
 AMPNymBNoCWc13U6qOztXrIKBVsLGZXq/yOaR2n7gFbFACD0TU7XuH2UcnwvNR+uQFwSrRqa
 EczX2V6iIy2CITXKg5Yvg12yn09gTmafuoIyKoU16XvC3aZQQ2Bn3LO2sRP0j/NuMD9GlO37
 pHCVRpI2DPxFE39TMm1PLbHnDG8+lZql+dpNwWw8dDaRgyXx2Le542CcTBT52VCeeWDtqd2M
 wOr4LioYlfGfAqmwcwucBdTEBUxklQaOR3VbJQx6ntI2oDOBlNGvjnVDzZe+iREd5l40l+Oj
 TaiWvBGXkv6OI+wx5TFPp+BM6ATU+6UzFRTUWbj+LqVA/JMqYHQp04Y4H5GtjbHCa8abRvBw
 IKEvpwTyWZlfXPtp8gRlNmxYn6gQlTyEZAWodXwE7CE+KxNnq7bPHeLvrSn8bLNK682PoTGr
 0Y00bguYLfyvEwuDYek1/h9YSXtHaCR3CEj4LU1B561G1j7FVaeYbX9bKBAoy/GxAW8J5O1n
 mmw7FnkSHuwO/QDe0COoO0QZ620Cf9IBWYHW4m2M2yh5981lUaiMcNM2kPgsJFYloFo2XGn6
 lWU9BrWjEoNDhHZtF+yaPEuwjZo6x/3E2Tu3E5Jj0VpVcE9U1Zq/fquDY79l2RJn5ENogOs5
 +Pi0GjVpEYQVWfm0PTCxNPOzOzGR4QB3BNFvABEBAAGJAiUEGAEIAA8FAlWjfaECGwwFCQlm
 AYAACgkQvWpQHLeLfCZqGxAAlWBWVvjU6xj70GwengiqYZwmW1i8gfS4TNibQT/KRq0zkBnE
 wgKwXRbVoW38pYVuGa5x/JDQMJDrLAJ0wrCOS3XxbSHCWOl/k2ZD9OaxUeXq6N+OmGTzfrYv
 PUvWS1Hy04q9AD1dIaMNruZQmvnRfkOk2UDncDIg0166/NTHiYI09H5mpWGpHn/2aT6dmpVw
 uoM9/rHlF5s5qAAo95tZ0QW2BtIceG9/rbYlL57waSMPF49awvwLQX5RhWoF8mPS5LsBrXXK
 hmizIsn40tLbi2RtWjzDWgZYitqmmqijeCnDvISN4qJ/nCLO4DjiSGs59w5HR+l0nwePDhOC
 A4RYZqS1e2Clx1VSkDXFpL3egabcIsqK7CZ6a21r8lXVpo4RnMlQsmXZTnRx4SajFvX7PrRg
 /02C811fLfh2r5O5if8sKQ6BKKlHpuuioqfj/w9z3B0aQ71e4n1zNJBO1kcdznikPLAbr7jG
 gkBUXT1yJiwpTfRQr5y2Uo12IJsKxohnNFVYtK8X/R6S0deKPjrZWvAkllgIPcHjMi2Va8yw
 KTj/JgcpUO5KN906Pf7ywZISe7Kbcc/qnE0YjPPSqFOvoeZvHe6EZCMW9+xZsaipvlqpByQV
 UHnVg09K9YFvjUBsBPdC8ef6YwgfR9o6AnPmxl0oMUIXkCCC5c99fzJY/k+JAq0EGAEIACAW
 IQS/HfwKVo8F95V1cJC9alAct4t8JgUCWwqKhgIbAgCBCRC9alAct4t8JnYgBBkWCAAdFiEE
 FMMcSshOZf56bfAEYhBsURv0pdsFAlsKioYACgkQYhBsURv0pdvELgD/U+y3/hsz0bIjMQJY
 0LLxM/rFY9Vz1L43+lQHXjL3MPsA/1lNm5sailsY7aFBVJxAzTa8ZAGWBdVaGo6KCvimDB8G
 7joP/jx+oGOmdRogs7mG//H+w9DTnBfPpnfkeiiokGYo/+huWO5V0Ac9tTqZeFc//t/YuYJn
 wWvS0Rx+KL0fT3eh9BQo47uF4yDiZIiWLNh4Agpup1MUSVsz4MjD0lW6ghtnLcGlIgoVHW0v
 tPW1m9jATYyJSOG/MC1iDrcYcp9uVYn5tKfkEeQNspuG6iSfS0q3tajPKnT1nJxMTxVOD2RW
 EIGfaV9Scrou92VD/eC+/8INRsiWS93j3hOKIAV5XRNINFqtzkagPYAP8r6wksjSjh01fSTB
 p5zxjfsIwWDDzDrqgzwv83CvrLXRV3OlG1DNUDYA52qJr47paH5QMWmHW5TNuoBX8qb6RW/H
 M3DzPgT+l+r1pPjMPfvL1t7civZUoPuNzoyFpQRj6TvWi2bGGMQKryeYksXG2zi2+avMFnLe
 lOxGdUZ7jn1SJ6Abba5WL3VrXCP+TUE6bZLgfw8kYa8QSXP3ysyeMI0topHFntBZ8a0KXBNs
 qqFCBWmTHXfwsfW0VgBmRtPO7eXVBybjJ1VXKR2RZxwSq/GoNXh/yrRXQxbcpZ+QP3/Tttsb
 FdKciZ4u3ts+5UwYra0BRuvb51RiZR2wRNnUeBnXWagJVTlG7RHBO/2jJOE6wrcdCMjs0Iiw
 PNWmiVoZA930TvHA5UeGENxdGqo2MvMdRJ54YaIR
Message-ID: <f78ee3a4-596c-1b0c-3c91-15aad85ba9b2@gmail.com>
Date:   Wed, 31 Jul 2019 22:44:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <f83b0f42-a310-a800-1b78-d5fb89516114@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Dan,

On 7/31/19 9:06 PM, Dan Murphy wrote:
> Jacek
> 
> On 7/29/19 3:50 PM, Jacek Anaszewski wrote:
>> Dan,
>>
>> On 7/25/19 8:28 PM, Dan Murphy wrote:
>>> Introduce a multicolor class that groups colored LEDs
>>> within a LED node.
>>>
>>> The framework allows for dynamically setting individual LEDs
>>> or setting brightness levels of LEDs and updating them virtually
>>> simultaneously.
>>>
>>> Signed-off-by: Dan Murphy <dmurphy@ti.com>
>>> ---
>>>   drivers/leds/Kconfig                 |  10 +
>>>   drivers/leds/Makefile                |   1 +
>>>   drivers/leds/led-class-multicolor.c  | 402 +++++++++++++++++++++++++++
>>>   include/linux/led-class-multicolor.h |  96 +++++++
>>>   4 files changed, 509 insertions(+)
>>>   create mode 100644 drivers/leds/led-class-multicolor.c
>>>   create mode 100644 include/linux/led-class-multicolor.h
>>>
>>> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
>>> index f7a3dd7ecf3d..7f780d5b8490 100644
>>> --- a/drivers/leds/Kconfig
>>> +++ b/drivers/leds/Kconfig
>>> @@ -30,6 +30,16 @@ config LEDS_CLASS_FLASH
>>>         for the flash related features of a LED device. It can be built
>>>         as a module.
>>>   +config LEDS_CLASS_MULTI_COLOR
>>> +    tristate "LED Mulit Color LED Class Support"
>>> +    depends on LEDS_CLASS
>>> +    help
>>> +      This option enables the multicolor LED sysfs class in
>>> /sys/class/leds.
>>> +      It wraps LED Class and adds multicolor LED specific sysfs
>>> attributes
>> s/Class/class/
>>
>> I'll need to fix it in LED flash class entry too.
>>
>>> +      and kernel internal API to it. You'll need this to provide
>>> support
>>> +      for multicolor LEDs that are grouped together. This class is not
>>> +      intended for single color LEDs. It can be built as a module.
>>> +
>>>   config LEDS_BRIGHTNESS_HW_CHANGED
>>>       bool "LED Class brightness_hw_changed attribute support"
>>>       depends on LEDS_CLASS
>>> diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
>>> index 41fb073a39c1..897b810257dd 100644
>>> --- a/drivers/leds/Makefile
>>> +++ b/drivers/leds/Makefile
>>> @@ -4,6 +4,7 @@
>>>   obj-$(CONFIG_NEW_LEDS)            += led-core.o
>>>   obj-$(CONFIG_LEDS_CLASS)        += led-class.o
>>>   obj-$(CONFIG_LEDS_CLASS_FLASH)        += led-class-flash.o
>>> +obj-$(CONFIG_LEDS_CLASS_MULTI_COLOR)    += led-class-multicolor.o
>>>   obj-$(CONFIG_LEDS_TRIGGERS)        += led-triggers.o
>>>     # LED Platform Drivers
>>> diff --git a/drivers/leds/led-class-multicolor.c
>>> b/drivers/leds/led-class-multicolor.c
>>> new file mode 100644
>>> index 000000000000..123443e6d3eb
>>> --- /dev/null
>>> +++ b/drivers/leds/led-class-multicolor.c
>>> @@ -0,0 +1,402 @@
>>> +// SPDX-License-Identifier: GPL-2.0
>>> +// LED Multi Color class interface
>>> +// Copyright (C) 2019 Texas Instruments Incorporated -
>>> http://www.ti.com/
>>> +
>>> +#include <linux/device.h>
>>> +#include <linux/init.h>
>>> +#include <linux/led-class-multicolor.h>
>>> +#include <linux/module.h>
>>> +#include <linux/slab.h>
>>> +#include <linux/uaccess.h>
>>> +
>>> +#include "leds.h"
>>> +
>>> +struct led_classdev_mc_priv {
>>> +    struct led_classdev_mc *mcled_cdev;
>>> +
>>> +    struct device_attribute max_intensity_attr;
>>> +    struct device_attribute intensity_attr;
>>> +    struct device_attribute color_index_attr;
>>> +
>>> +    enum led_brightness max_intensity;
>>> +    enum led_brightness intensity;
>>> +    enum led_brightness new_intensity;
>>> +
>>> +    struct list_head list;
>>> +
>>> +    int color_id;
>>> +    int color_index;
>> We need to differentiate both more meaningfully.
>> Maybe led_color_id and cluster_color_id?
> 
> Thats looks better.
> 

Looking at it now I had to wonder what I had on mind.
So maybe even better shot:

int color_id // so as original
int color_seq_pos // i.e. position in the color_mix sequence

[...]

>>> +static ssize_t color_mix_store(struct device *dev,
>>> +                struct device_attribute *color_mix_attr,
>>> +                const char *buf, size_t size)
>>> +{
>>> +    struct led_classdev_mc_data *data = container_of(color_mix_attr,
>>> +                            struct led_classdev_mc_data,
>>> +                              color_mix_attr);
>>> +    struct led_classdev_mc *mcled_cdev = data->mcled_cdev;
>>> +    const struct led_multicolor_ops *ops = mcled_cdev->ops;
>>> +    struct led_classdev_mc_priv *priv;
>>> +    unsigned int value[LED_COLOR_ID_MAX];
>>> +    int adj_brightness;
>>> +    int nrchars, offset = 0;
>>> +    unsigned int i;
>>> +    int ret;
>>> +
>>> +    for (i = 0; i < mcled_cdev->num_leds; i++) {
>>> +        ret = sscanf(buf + offset, "%i%n", &value[i], &nrchars);
>>> +        if (ret != 1)
>>> +            break;
>>> +
>>> +        offset += nrchars;
>>> +    }
>>> +
>>> +    if (i != mcled_cdev->num_leds) {
>> Shouldn't we return error if i != mcled_cdev->num_leds - 1 ?
>> How can we know which color the value will be for if there is less
>> values passed than the total number of colors in the cluster?
> 
> Ok so during my testing if I had the monochrome array as <R G B>
> 
> When I wrote only <R G> and no blue I was getting random values in the
> array for the
> 
> remaining indexes and the blue LED would randomly turn on/off at
> different levels.
> 
> So if the user passes in less then expected only ids with data will be
> written and the other colors will be turned off by the for loop below.

From what I see it will lead to wrong mapping of given color to the
value array element in the following case:

echo "<green> <blue>" > color_mix

Then green intensity will be assigned to value[0] (expects red) and blue
to value[1] (expects green). Unless I don't get something.
Your ABI documentation doesn't mention any way to redefine the color_id
returned by <color>/color_id file. And that is good.

> 
>>
>>> +        for (; i < LED_COLOR_ID_MAX; i++)
>>> +            value[i] = 0;
>> What use case is it for?
> 
> See above but this should be
> 
> for (; i < mcled_cdev->num_leds; i++)
> 
> 
>>
>>> +    }
>>> +
>>> +    list_for_each_entry(priv, &data->color_list, list) {
>>> +        if (data->cluster_brightness) {
>>> +            adj_brightness =
>>> calculate_brightness(data->cluster_brightness,
>>> +                                  value[priv->color_index],
>>> +                                 priv->max_intensity);
>>> +            ret = ops->set_color_brightness(priv->mcled_cdev,
>>> +                            priv->color_id,
>>> +                            adj_brightness);
>>> +            if (ret < 0)
>>> +                goto done;
>>> +        }
>>> +
>>> +        priv->intensity = value[priv->color_index];
>>> +    }
>> Here we could use just brightness_set op as a single call. We should
>> always write all colors as a result of write to color_mix anyway.
> 
> I guess what is gained by just passing the array down to the device
> driver and having it
> 
> parse the array and do the peripheral call?

Those array values would not be directly written to the device,
but used for calculating the actual iout intensities. Driver
will just have to call calculate_brightness() (sticking to the naming
from this patch) and write the results calculated basing on brightness
and max_brightness.

> 
[...]
> 
>>> +
>>> +    priv->new_intensity = value;
>>> +
>>> +    if (data->cluster_brightness) {
>>> +        adj_value = calculate_brightness(data->cluster_brightness,
>>> +                    priv->new_intensity,
>>> +                    priv->max_intensity);
>>> +        ret = ops->set_color_brightness(priv->mcled_cdev,
>>> +                        priv->color_id, adj_value);
>>> +        if (ret < 0) {
>>> +            priv->new_intensity = priv->intensity;
>> This is unnecessary complication. Just write the calculated iout
>> intensity.
> 
> Not sure what complication you are referring to.

The whole need for new_intensity and cluster_brightness, and then
bringing back old intensity value on set_color_brightness() failure.

> 
>> We need to highlight it in the documentation that exact requested color
>> intensity values are written to the hardware only when
>> brightness == max_brightness.
> 
> But that is not a true statement.  Thats not really how it was designed.

But it probably should be. It would simplify the design.

So my idea is like I previously described the way I had first understood
this design:

The colors set under colors directory don't reflect the iout
intensities, but are only used for calculating them, basing on the
brightness and max_intensity values.

Effectively, after changing the colors/<color>/intensity the global
(legacy monochrome) brightness value will be still valid, since iout
color will be recalculated basing on it and the new color intensity.

-- 
Best regards,
Jacek Anaszewski
