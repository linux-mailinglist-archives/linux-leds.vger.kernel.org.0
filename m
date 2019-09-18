Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 151F0B6ECE
	for <lists+linux-leds@lfdr.de>; Wed, 18 Sep 2019 23:29:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729578AbfIRV3F (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 18 Sep 2019 17:29:05 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:40999 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727737AbfIRV3F (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 18 Sep 2019 17:29:05 -0400
Received: by mail-wr1-f66.google.com with SMTP id h7so871182wrw.8;
        Wed, 18 Sep 2019 14:29:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=rifH4LsDo4++Qh/+DNBmH1Gppbtj87t+yksfSpQFJ9k=;
        b=YzGuu5gdu6/1iGRsADbu0LbYB05zEjV635mcItJiUaIOwYNTivP3hRK/kyA8wIxacD
         ENDvKHv8j3sJmtQ0Tcmv//DSn20WhpEsB6lVS7cAfDI2E1tdqMo/moSYJLp1I//f1dx/
         HI6cB6VftZok2XoiCbGIfK/xsms14cK6+MGIvTjy5oty/q1eW/cDt74w6mVxF++Z7m81
         XVurUX4IxZS28kyWA/5YKrIu1I9Czh3tR1cLmVexRKLmwSAeEXtr2HvQmtwjx4La1hwF
         9N0CjOg1n0y9gd8HKaiUQf3R3XMoOew5EECjuRTWzoZOx8l3seDEKIpFWeV5DWMJkGOB
         BYxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=rifH4LsDo4++Qh/+DNBmH1Gppbtj87t+yksfSpQFJ9k=;
        b=uB3V6flO6cLIROn8gRRl+P/ogOHWQ7CTU7iR8w1iG2Du+ZJ6c75Bd2+cPhDjSsQDIA
         XzfJevPLENKiiwrU0AwVXnq0ilc1JDYGj9NsS0A1AjC7baJCOpe9lLe+EbsQQPtPnH6+
         Z0oSJMwF02yaKgj4Fu/Fq1TYIKiI94TN9gQfVYSsFtjGPm5Ro4ckC+n6Iep0WgPjCUBv
         xfVgZ76IJhA5666theUFJ7gdaTqy78K6quavwFs/AmLgssX0+/sJfEvML6bfWRClUl7F
         SXptt/nLP2PtxPlzAkk+NNepiRLZG1nMBAKSUhtBbH+lauDR7VfX/lEqumjMydMyMBBa
         1uMw==
X-Gm-Message-State: APjAAAWbEoe9o3GNTuZE+HiSduuPVKgfp1EJXzloyP/Sxcz5q/JxtxaR
        RioH9hpBY23gQwBr5zECg/WUDFkG
X-Google-Smtp-Source: APXvYqyNyu9G86SbBGpckZNCs7Y5FXKroxBOkXlTwG7sNak1RR0gK0xvjEknDgPEnw5fqH6gtS7F+A==
X-Received: by 2002:adf:f00b:: with SMTP id j11mr4492646wro.298.1568842141376;
        Wed, 18 Sep 2019 14:29:01 -0700 (PDT)
Received: from [192.168.1.19] (dma211.neoplus.adsl.tpnet.pl. [83.24.56.211])
        by smtp.gmail.com with ESMTPSA id v2sm6851266wmf.18.2019.09.18.14.29.00
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 18 Sep 2019 14:29:00 -0700 (PDT)
Subject: Re: [PATCH v9 1/2] dt-bindings: Add docs for EL15203000
To:     Oleh Kravchenko <oleg@kaa.org.ua>, devicetree@vger.kernel.org,
        linux-leds@vger.kernel.org, pavel@ucw.cz
Cc:     Rob Herring <robh+dt@kernel.org>
References: <20190918105250.22855-1-oleg@kaa.org.ua>
 <20190918105250.22855-2-oleg@kaa.org.ua>
 <5219879e-84af-a98e-2fca-10684548d416@gmail.com>
 <2ac88d9d-afe6-9629-eb11-28dff59461eb@kaa.org.ua>
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
Message-ID: <c4c0be80-dc78-feaa-e22a-fa994a9d2949@gmail.com>
Date:   Wed, 18 Sep 2019 23:28:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <2ac88d9d-afe6-9629-eb11-28dff59461eb@kaa.org.ua>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 9/18/19 11:17 PM, Oleh Kravchenko wrote:
> Hello Jacek,
> 
> 19.09.19 00:02, Jacek Anaszewski пише:
>> Hi Oleh,
>>
>> Thank you for the update.
>>
>> I have some comments below. Please take a look.
>>
>> On 9/18/19 12:52 PM, Oleh Kravchenko wrote:
>>> Add documentation and example for dt-bindings EL15203000.
>>> LED board (aka RED LED board) from Crane Merchandising Systems.
>>>
>>> Signed-off-by: Oleh Kravchenko <oleg@kaa.org.ua>
>>> ---
>>>  .../bindings/leds/leds-el15203000.txt         | 147 ++++++++++++++++++
>>>  1 file changed, 147 insertions(+)
>>>  create mode 100644 Documentation/devicetree/bindings/leds/leds-el15203000.txt
>>>
>>> diff --git a/Documentation/devicetree/bindings/leds/leds-el15203000.txt b/Documentation/devicetree/bindings/leds/leds-el15203000.txt
>>> new file mode 100644
>>> index 000000000000..4a9b29cc9f46
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/leds/leds-el15203000.txt
>>> @@ -0,0 +1,147 @@
>>> +Crane Merchandising System - EL15203000 LED driver
>>> +--------------------------------------------------
>>> +
>>> +This LED Board (aka RED LEDs board) is widely used in
>>> +coffee vending machines produced by Crane Merchandising Systems.
>>> +The board manages 3 LEDs and supports predefined blinking patterns
>>> +for specific leds.
>>> +
>>> +Vending area LED encoded with symbol 'V' (hex code 0x56).
>>> +Doesn't have any hardware blinking pattern.
>>> +
>>> +Screen light tube LED which surrounds vending machine screen and
>>> +encoded with symbol 'S' (hex code 0x53). Supports blinking breathing pattern:
>>> +
>>> +    ^
>>> +    |
>>> +Max >_____***___________**
>>> +    |    *   *         *
>>> +    |   *     *       *
>>> +    |  *       *     *
>>> +    | *         *   *
>>> +Min >*___________***______
>>> +    |
>>> +    +------^------^------> time (sec)
>>> +    0      4      8
>>> +
>>> +
>>> +Water Pipe LED actually consists from 5 LEDs
>>
>> "(hex code 0x50)" is here missing if you want to be consistent.
>>
>>> +that exposed by protocol like one LED. Supports next patterns:
>>> +
>>> +- cascade pattern
>>> +
>>> +     ^
>>> +     |
>>> +LED0 >*****____________________*****____________________*****
>>> +     |
>>> +LED1 >_____*****____________________*****____________________
>>> +     |
>>> +LED2 >__________*****____________________*****_______________
>>> +     |
>>> +LED3 >_______________*****____________________*****__________
>>> +     |
>>> +LED4 >____________________*****____________________*****_____
>>> +     |
>>> +     +----^----^----^----^----^----^----^----^----^----^----> time (sec)
>>> +     0   0.8  1.6  2.4  3.2   4   4.8  5.6  6.4  7.2   8
>>> +
>>> +- inversed cascade pattern
>>> +
>>> +     ^
>>> +     |
>>> +LED0 >_____********************_____********************_____
>>> +     |
>>> +LED1 >*****_____********************_____********************
>>> +     |
>>> +LED2 >**********_____********************_____***************
>>> +     |
>>> +LED3 >***************_____********************_____**********
>>> +     |
>>> +LED4 >********************_____********************_____*****
>>> +     |
>>> +     +----^----^----^----^----^----^----^----^----^----^----> time (sec)
>>> +     0   0.8  1.6  2.4  3.2   4   4.8  5.6  6.4  7.2   8
>>> +
>>> +- bounce pattern
>>> +
>>> +     ^
>>> +     |
>>> +LED0 >*****________________________________________*****_____
>>> +     |
>>> +LED1 >_____*****______________________________*****_____*****
>>> +     |
>>> +LED2 >__________*****____________________*****_______________
>>> +     |
>>> +LED3 >_______________*****__________*****____________________
>>> +     |
>>> +LED4 >____________________**********_________________________
>>> +     |
>>> +     +----^----^----^----^----^----^----^----^----^----^----> time (sec)
>>> +     0   0.8  1.6  2.4  3.2   4   4.8  5.6  6.4  7.2   8
>>> +
>>> +- inversed bounce pattern
>>> +
>>> +     ^
>>> +     |
>>> +LED0 >_____****************************************_____*****
>>> +     |
>>> +LED1 >*****_____******************************_____*****_____
>>> +     |
>>> +LED2 >**********_____********************_____***************
>>> +     |
>>> +LED3 >***************_____**********_____********************
>>> +     |
>>> +LED4 >********************__________*************************
>>> +     |
>>> +     +----^----^----^----^----^----^----^----^----^----^----> time (sec)
>>> +     0   0.8  1.6  2.4  3.2   4   4.8  5.6  6.4  7.2   8
>>
>> Regarding this ASCII art - I presume you wanted to follow
>> Documentation/devicetree/bindings/leds/leds-trigger-pattern.txt.
>>
>> It was added to bindings because we support 'pattern' value
>> for linux,default-trigger, which in turn looks for 'led-pattern'
>> property, whose format needs to be documented in the LED bindings.
>>
>> leds-trigger-pattern.txt documents only common syntax for software
>> pattern engine. Currently we don't have a means to setup hw_pattern
>> for the pattern trigger from DT, which is obvious omission and your
>> patch just brings it to light.
>>
>> That said, I propose to fix it alongside and introduce led-hw-pattern
>> property. When present, ledtrig-pattern would setup the pattern
>> using pattern_set op, similarly as if it was set via sysfs hw_pattern
>> file.
>>
>> Only in this case placing the pattern depiction here would be justified.
>> Otherwise, it would have to land in the ABI documentation.
> 
> You are okay, if I move it to Documentation/ABI/testing/sysfs-class-led-driver-el15203000 ?
> 

Yes, we can cover led-hw-pattern property later.

-- 
Best regards,
Jacek Anaszewski
