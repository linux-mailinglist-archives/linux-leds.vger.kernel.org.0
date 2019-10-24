Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AF1F5E3DEB
	for <lists+linux-leds@lfdr.de>; Thu, 24 Oct 2019 23:02:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728485AbfJXVCq (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 24 Oct 2019 17:02:46 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:55702 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726215AbfJXVCq (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 24 Oct 2019 17:02:46 -0400
Received: by mail-wm1-f65.google.com with SMTP id g24so4304413wmh.5;
        Thu, 24 Oct 2019 14:02:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=4aaqqb8YAfEVIim4bL+IVR5t1H8LDPcY2mjMsspokUw=;
        b=GUSnFExkql3TQkUBz5Egd4rqGwiwfMoiatOHhJCrNZ3rtBL1jagnNhdUL/gpRYAaJ4
         hGlyWUw/162oWoPT04Z6PH3YJd0WnoX/m6jk3oRh+ReOLnLl2SvsXtxXd+mS4R8blw+Q
         KJJXsHeGw7IJUHGe1/N08YOPwHVBtIPJ44bwtEeAob0UODrMwvq6KZPLA74jCMWBEFxl
         C9eub+FV8BgkCcYfu/kK+cuv58JRSDd6ve1QosNljsak/9MWt5yQ+XM3LUe5TMHAcpAa
         B10F76P0DZ+23vPCz0jAeSpOkipz0gU1EFQrshBxypzckT8XQRpF8DCWidYnUMuVwAHN
         e1AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=4aaqqb8YAfEVIim4bL+IVR5t1H8LDPcY2mjMsspokUw=;
        b=BGIkqncpAsQ30V7orh24hpNb10FxhnDFsnAqq1STGTtuqs2hIRzbXsFiaI1q9CZrAB
         GzKgnQzLXbHEj353evz62VY1fsbT61arKSbG5b9R1O7wmftR+ZQsCCmgpZlR2Cst1Hso
         x6lZOoWHiAoECiYxQ04fWQKh8aSnYoTiddYTspfqNA5LiOayECiDhTS5iECX+oqXNCG8
         O9xGYSKO/ub7I9M1s8c06dNdHKaEG4+gfkvDjbZwT09eXOhdLtTMxilSdki34lhKYPPb
         ZV0M0XrIFediu2zmfY4pwJhxjzDugxA6hJ7F6OQgYI7RDSUKwlR7D78zd7AVVrwq3LXh
         si3Q==
X-Gm-Message-State: APjAAAWnE0psIEGlzR4ih9koPDA4rcebEP7dhjiWcMs/3emCy9BGhnWU
        jVhkw9pWYgFo/UfFMQe4wdFcGZqC
X-Google-Smtp-Source: APXvYqyT69Wz/5qvqJ5BjNxyWNDSTMogbR3Yn37Dd51VlEsyM9CQQa8Cazg0LoWqfLnXffxApy35Vg==
X-Received: by 2002:a1c:a848:: with SMTP id r69mr254343wme.83.1571950962650;
        Thu, 24 Oct 2019 14:02:42 -0700 (PDT)
Received: from [192.168.1.19] (chm166.neoplus.adsl.tpnet.pl. [83.31.10.166])
        by smtp.gmail.com with ESMTPSA id f204sm2944227wmf.32.2019.10.24.14.02.41
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 24 Oct 2019 14:02:42 -0700 (PDT)
Subject: Re: [PATCH v14 13/19] leds: lp55xx: Add multicolor framework support
 to lp55xx
To:     Dan Murphy <dmurphy@ti.com>, pavel@ucw.cz
Cc:     linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20191018122521.6757-1-dmurphy@ti.com>
 <20191018122521.6757-14-dmurphy@ti.com>
 <a24832d9-1c3d-b3ea-4326-2ef4937d5a59@gmail.com>
 <44796209-104e-66f1-e1e0-2f3dfe3d7cd7@ti.com>
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
Message-ID: <0bdb9d2c-601f-9b5e-5ca2-6bd97ffacde5@gmail.com>
Date:   Thu, 24 Oct 2019 23:02:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <44796209-104e-66f1-e1e0-2f3dfe3d7cd7@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Dan,

On 10/23/19 2:22 PM, Dan Murphy wrote:
> Jacek
> 
> On 10/18/19 4:48 PM, Jacek Anaszewski wrote:
>> Dan,
>>
>> On 10/18/19 2:25 PM, Dan Murphy wrote:
>>> Add multicolor framework support for the lp55xx family.
>>>
>>> Signed-off-by: Dan Murphy <dmurphy@ti.com>
>>> ---
>>>   drivers/leds/Kconfig                      |   1 +
>>>   drivers/leds/leds-lp55xx-common.c         | 185 +++++++++++++++++++---
>>>   drivers/leds/leds-lp55xx-common.h         |   9 ++
>>>   include/linux/platform_data/leds-lp55xx.h |   7 +
>>>   4 files changed, 179 insertions(+), 23 deletions(-)
>>>
>>> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
>>> index fb614a6b9afa..5706bf8d8bd1 100644
>>> --- a/drivers/leds/Kconfig
>>> +++ b/drivers/leds/Kconfig
>>> @@ -377,6 +377,7 @@ config LEDS_LP50XX
>>>   config LEDS_LP55XX_COMMON
>>>       tristate "Common Driver for TI/National
>>> LP5521/5523/55231/5562/8501"
>>>       depends on LEDS_LP5521 || LEDS_LP5523 || LEDS_LP5562 ||
>>> LEDS_LP8501
>>> +    depends on OF
>>>       select FW_LOADER
>>>       select FW_LOADER_USER_HELPER
>>>       help
>>> diff --git a/drivers/leds/leds-lp55xx-common.c
>>> b/drivers/leds/leds-lp55xx-common.c
>>> index 882ef39e4965..197b87ca5ca2 100644
>>> --- a/drivers/leds/leds-lp55xx-common.c
>>> +++ b/drivers/leds/leds-lp55xx-common.c
>>> @@ -131,14 +131,62 @@ static struct attribute *lp55xx_led_attrs[] = {
>>>   };
>>>   ATTRIBUTE_GROUPS(lp55xx_led);
>>>   +#if IS_ENABLED(CONFIG_LEDS_CLASS_MULTI_COLOR)
>>> +static int lp55xx_map_channel(struct lp55xx_led *led, int color_id,
>>> +                  enum led_brightness brightness)
>> If you changed the type of the first parameter to
>> struct led_mc_color_conversion* then you could make this function local
>> in LED mc class and call it in led_mc_calc_color_components() after
>> calculating brightness components.
> 
> I prefer to leave this here and if this code is ever integrated we can
> see if there is a common need for the MC class to expose a mapping API.
> 
>>
>>> +{
>>> +    int i;
>>> +
>>> +    for (i = 0; i < led->mc_cdev.num_leds; i++) {
>>> +        if (led->color_components[i].color_id == color_id) {
>>> +            led->color_components[i].brightness = brightness;
>>> +            return 0;
>>> +        }
>>> +    }
>>> +
>>> +    return -EINVAL;
>>> +}
>>> +#endif
>>> +
>>> +static int lp55xx_set_mc_brightness(struct lp55xx_led *led,
>>> +                    struct lp55xx_device_config *cfg,
>>> +                     enum led_brightness brightness)
>>> +{
>>> +    int ret = -EINVAL;
>>> +#if IS_ENABLED(CONFIG_LEDS_CLASS_MULTI_COLOR)
>>> +    struct led_mc_color_conversion
>>> color_components[LP55XX_MAX_GROUPED_CHAN];
>> You wouldn't need this local variable then.
> 
>>> +    int i;
>>> +
>>> +    if (!cfg->multicolor_brightness_fn)
>>> +        return -EINVAL;
>>> +
>>> +    led_mc_calc_color_components(&led->mc_cdev, brightness,
>>> +                     color_components);
>> Because you could pass what you already have in the struct lp55xx_led:
>>
>> led_mc_calc_color_components(&led->mc_cdev, brightness,
>>                               led->color_components);
> 
> Well that is not entirely accurate the led->color_components is the data
> that we have from the DT that should not be changed. Passing this into
> the MC calc function would mean that the framework would have to map the
> output to the color_id.  As I indicated above for now I don't think the
> MC class should do any mapping of color_id to the output.

I proposed to use color_components because it is already there
and has required data in place. You could always copy
that data to some other local structure but it would be unnecessary
overhead.

Anyway, all what I proposed here are just nice-to-have details,
that can be covered in the future.

-- 
Best regards,
Jacek Anaszewski
