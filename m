Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 51224C147F
	for <lists+linux-leds@lfdr.de>; Sun, 29 Sep 2019 15:01:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726018AbfI2NB4 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 29 Sep 2019 09:01:56 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:39700 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725974AbfI2NB4 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 29 Sep 2019 09:01:56 -0400
Received: by mail-wr1-f65.google.com with SMTP id r3so8003622wrj.6;
        Sun, 29 Sep 2019 06:01:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=bdCVpjeUeIvhTicwteXOBMxHJh/rxwiqJp3B1DRQ450=;
        b=lC5plcFEqfiPBelkcu2z/AFCQq6Eh9DIh9o6eqCz65MGOXul/YkGDVCU1R5nYNWWBs
         lYB6GIMoJ/B9MzPUNYqxsz2UoRzAGXgr4CKJ9Rs/o83jL+p6da+XQtJsAgj94Cm49hmg
         0o8+9SPsYSheSR/UOHLlMZ7U6COv/wS1KBvKfanAZnLQ1eCjENkoOA/IZIn/ccCmgYES
         8QjHFrlRrAjJFOTvHU0Lh5uleQmKnvpKsnsmOK6aNTR8aEhssRcwLpK9jdE+qqWGvIyc
         yzovnmkOXKAkCD61OT06JpoYm5pBuuid39Xr90TPWJu8cOnaSDky++mCuWzG6B4tlG31
         ePcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=bdCVpjeUeIvhTicwteXOBMxHJh/rxwiqJp3B1DRQ450=;
        b=Kz5apdNTSaW0vxHr0J6DvLNtji5k6TGSVKEPX9cOM5L2WcJM29NKG6/K8wfR+Zm+VE
         N0yDArsOrNJ9zG6NpSraQxuRzJddw9GttwR1LGGUkcRPeE1Vz6YH0xmOYmKYDWNTBZJY
         PkFOs5m5c8fd0jr/PTPR7ibikmBpN/0pZSF4xKo/u4ObbhhrIzTxLSmu1ZWd0jame9kA
         Ebe7zbs+nNKrDtsT1SzEfvMY3Kg6MKtROt3dduTo//tgwKkZsdj6sI5rFZX8qKIPfgVk
         4xyKn+4+CnmfX/wdBEuqsNMX2NuKXZP523EeXG3P5tpPalADXAiSVHvBp2ifDnQ5RNWl
         LcWg==
X-Gm-Message-State: APjAAAXxwaaLvYctEgx6gQKbbmdTQ8WNs1XIVxtqKYh86Zpb6CLlMMI7
        ka82cvkya84PLMZthO9DjyilPh9G
X-Google-Smtp-Source: APXvYqyTeezpv6e2vpPToWFa1EjUHrc4FkrzRy0TxAlAna9wJ9kyK+PNAaAAhe8lCJQBhWvXtszrvw==
X-Received: by 2002:adf:ef12:: with SMTP id e18mr4969169wro.65.1569762112856;
        Sun, 29 Sep 2019 06:01:52 -0700 (PDT)
Received: from [192.168.1.19] (blg187.neoplus.adsl.tpnet.pl. [83.28.200.187])
        by smtp.gmail.com with ESMTPSA id l7sm7684612wrv.77.2019.09.29.06.01.51
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 29 Sep 2019 06:01:52 -0700 (PDT)
Subject: Re: [PATCH v9 13/15] leds: lp55xx: Update the lp55xx to use the multi
 color framework
To:     Dan Murphy <dmurphy@ti.com>, pavel@ucw.cz
Cc:     linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20190925174616.3714-1-dmurphy@ti.com>
 <20190925174616.3714-14-dmurphy@ti.com>
 <59e58ccf-84fb-5db7-5008-20afc7436d35@gmail.com>
 <64d00aab-501c-d709-94af-4747a27df098@ti.com>
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
Message-ID: <35e25398-81de-3755-7979-72638a119c77@gmail.com>
Date:   Sun, 29 Sep 2019 15:01:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <64d00aab-501c-d709-94af-4747a27df098@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Dan,

On 9/26/19 2:02 PM, Dan Murphy wrote:
> Jacek
> 
> On 9/25/19 5:00 PM, Jacek Anaszewski wrote:
>> Dan,
>>
>> On 9/25/19 7:46 PM, Dan Murphy wrote:
>>> Update the lp5523 to allow the use of the multi color framework.
>>>
>>> Signed-off-by: Dan Murphy <dmurphy@ti.com>
>>> ---
>>>   drivers/leds/Kconfig                      |   1 +
>>>   drivers/leds/leds-lp5523.c                |  13 ++
>>>   drivers/leds/leds-lp55xx-common.c         | 150 ++++++++++++++++++----
>>>   drivers/leds/leds-lp55xx-common.h         |  11 ++
>>>   include/linux/platform_data/leds-lp55xx.h |   6 +
>>>   5 files changed, 157 insertions(+), 24 deletions(-)
>>>
>>> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
>>> index 84f60e35c5ee..dc3d9f2194cd 100644
>>> --- a/drivers/leds/Kconfig
>>> +++ b/drivers/leds/Kconfig
>>> @@ -377,6 +377,7 @@ config LEDS_LP50XX
>>>   config LEDS_LP55XX_COMMON
>>>       tristate "Common Driver for TI/National
>>> LP5521/5523/55231/5562/8501"
>>>       depends on LEDS_LP5521 || LEDS_LP5523 || LEDS_LP5562 ||
>>> LEDS_LP8501
>>> +    depends on LEDS_CLASS_MULTI_COLOR && OF
>>>       select FW_LOADER
>>>       select FW_LOADER_USER_HELPER
>>>       help
>>> diff --git a/drivers/leds/leds-lp5523.c b/drivers/leds/leds-lp5523.c
>>> index d0b931a136b9..8b2cdb98fed6 100644
>>> --- a/drivers/leds/leds-lp5523.c
>>> +++ b/drivers/leds/leds-lp5523.c
>>> @@ -791,6 +791,18 @@ static ssize_t store_master_fader_leds(struct
>>> device *dev,
>>>       return ret;
>>>   }
>>>   +static int lp5523_led_intensity(struct lp55xx_led *led, int chan_num)
>> Why do we need this function? brightness op will not suffice?
> 
> I looked at this before sending it in.  This API adds the chan_num to
> write to.
> 
> The brightness_fn does not it takes it from the led structure.
> 
>>
>>> +{
>>> +    struct lp55xx_chip *chip = led->chip;
>>> +    int ret;
>>> +
>>> +    mutex_lock(&chip->lock);
>>> +    ret = lp55xx_write(chip, LP5523_REG_LED_PWM_BASE + chan_num,
>>> +             led->brightness);
>>> +    mutex_unlock(&chip->lock);
>>> +    return ret;
>>> +}
>>> +
>>>   static int lp5523_led_brightness(struct lp55xx_led *led)
>>>   {
>>>       struct lp55xx_chip *chip = led->chip;
>>> @@ -857,6 +869,7 @@ static struct lp55xx_device_config lp5523_cfg = {
>>>       .max_channel  = LP5523_MAX_LEDS,
>>>       .post_init_device   = lp5523_post_init_device,
>>>       .brightness_fn      = lp5523_led_brightness,
>>> +    .color_intensity_fn = lp5523_led_intensity,
>>>       .set_led_current    = lp5523_set_led_current,
>>>       .firmware_cb        = lp5523_firmware_loaded,
>>>       .run_engine         = lp5523_run_engine,
>>> diff --git a/drivers/leds/leds-lp55xx-common.c
>>> b/drivers/leds/leds-lp55xx-common.c
>>> index 44ced02b49f9..0e4b3a9d3047 100644
>>> --- a/drivers/leds/leds-lp55xx-common.c
>>> +++ b/drivers/leds/leds-lp55xx-common.c
>>> @@ -136,9 +136,26 @@ static int lp55xx_set_brightness(struct
>>> led_classdev *cdev,
>>>   {
>>>       struct lp55xx_led *led = cdev_to_lp55xx_led(cdev);
>>>       struct lp55xx_device_config *cfg = led->chip->cfg;
>>> +    int brightness_val[LP55XX_MAX_GROUPED_CHAN];
>>> +    int ret;
>>> +    int i;
>>> +
>>> +    if (led->mc_cdev.num_leds > 1) {
>>> +        led_mc_calc_brightness(&led->mc_cdev,
>>> +                       brightness, brightness_val);
>>> +        for (i = 0; i < led->mc_cdev.num_leds; i++) {
>>> +            led->brightness = brightness_val[i];
>>> +            ret = cfg->color_intensity_fn(led,
>>> +                              led->grouped_channels[i]);
>> Now we will have three separate calls for each color component
>> (and possibly sleeping on mutex on contention).
>>
>> Probably LED mc class use case will need a bit different design.
>>
>> Also, instead of grouped_channels we could possibly have
>>
>> led_mc_get_color_id(&led->mc_dev, i)
> color_id and grouped_channels are not a 1:1 mapping

OK, they're channel numbers.

>> which would map entry position index to color_id.
>>
>> I will stop reviewing here and will continue after taking
>> deeper look at this lp55xx design.

I've analyzed that design in greater detail and have started
to wonder why you can't pass two arrays to the new op:
channel numbers and corresponding calculated channel intensities?

-- 
Best regards,
Jacek Anaszewski
