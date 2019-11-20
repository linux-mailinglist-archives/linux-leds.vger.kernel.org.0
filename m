Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AA21E10460C
	for <lists+linux-leds@lfdr.de>; Wed, 20 Nov 2019 22:50:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726703AbfKTVuc (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 20 Nov 2019 16:50:32 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:53630 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726701AbfKTVub (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 20 Nov 2019 16:50:31 -0500
Received: by mail-wm1-f65.google.com with SMTP id u18so1389421wmc.3;
        Wed, 20 Nov 2019 13:50:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=H6sCNefKXj2TspwxdIjIStmes2vc9xrBJ0b/VeHzAXQ=;
        b=tlI8pU0sLPo7z821B3wkemY2ldDQWgWu/Cpn71sJOy0UJLCw1eMt19bDYCsrVlhcmo
         7JzTSHqngDXfnP6RlkMhpdY6vso+NSBbEldjWtZkpG9VTJt2j+zVL/vptt8ucsQs+yGx
         gCQjyJwh/+/QJ3FywXzC/UNaOVC5fSgEaNwD7oNrwpvFEzSb+d1a9JNPseuKOyyr28eG
         YLT3UcogitAOE/DoILlNvaJoWfkIPi56QYGwML01sPengOP0Gd/GB5LyBZ8BpbP3rpNN
         6sLVpNcLFVyX5NY+m5zOYOrJqwJOuJeIajx6riEZb9kg+iCprzspLU9GCAhkvf5UIsyC
         hLNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=H6sCNefKXj2TspwxdIjIStmes2vc9xrBJ0b/VeHzAXQ=;
        b=Rl5K9rHb68BGHsJtqq9LCaod0N5E4VbuzcBI505bVy+5Qu35PSb736hRR2DGL0f5rf
         SNtYSisON1luq3iiq8gCcj3qgdCm6n/gO6uSDu7MN20LHuS/HUYCFl4gLoGaalqECFl/
         2b4vdavQg4s0D7Tr2DGXcgDJBRupa8GFP3/P8Wa4T2TW0udaQYeaZ23eyytSep1T9wMI
         OpVfWaXHD/QvneYQ3YUVeFrg3D3yxVYCwDJJ21v5/KW/2B2hehkZZg73Jmo7sHYFmxUk
         dQbha5Rv6X3Cr0ivJqg6trJvkwqPCbb62ZkLWSmz6NzvdolFiTOB1uY0YKcUEh4gNRl+
         TH7Q==
X-Gm-Message-State: APjAAAUE7F/iglrKbeAy32kXu8DzNZ6etZtP0H32IFOYK5T8l6sAfgZK
        20gwihGf1qnKR5Z+HR+siewG+xDd
X-Google-Smtp-Source: APXvYqzOB72l0TurgClQTE9tXJucNkNoZCrWFG6TsCtvvLghoWKJc6957vSSepHFuCJA1jynjlPFog==
X-Received: by 2002:a7b:cd13:: with SMTP id f19mr471523wmj.101.1574286627520;
        Wed, 20 Nov 2019 13:50:27 -0800 (PST)
Received: from [192.168.1.19] (civ146.neoplus.adsl.tpnet.pl. [83.31.45.146])
        by smtp.gmail.com with ESMTPSA id i7sm752610wrs.38.2019.11.20.13.50.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Nov 2019 13:50:26 -0800 (PST)
Subject: Re: [PATCH v3 2/3] leds: tps6105x: add driver for mfd chip led mode
To:     Sven Van Asbroeck <thesven73@gmail.com>
Cc:     Lee Jones <lee.jones@linaro.org>, Pavel Machek <pavel@ucw.cz>,
        Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Grigoryev Denis <grigoryev@fastwel.ru>,
        Axel Lin <axel.lin@ingics.com>, Dan Murphy <dmurphy@ti.com>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-leds@vger.kernel.org
References: <20191120144401.30452-1-TheSven73@gmail.com>
 <20191120144401.30452-3-TheSven73@gmail.com>
 <07b85f68-3668-e354-3379-13d32e84466f@gmail.com>
 <CAGngYiXP8xu3UQTZxEqSXNkic3iNU43hD-KBJQkAmduXPp8zhQ@mail.gmail.com>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Autocrypt: addr=jacek.anaszewski@gmail.com; prefer-encrypt=mutual; keydata=
 xsFNBFWjfaEBEADd66EQbd6yd8YjG0kbEDT2QIkx8C7BqMXR8AdmA1OMApbfSvEZFT1D/ECR
 eWFBS8XtApKQx1xAs1j5z70k3zebk2eeNs5ahxi6vM4Qh89vBM46biSKeeX5fLcv7asmGb/a
 FnHPAfQaKFyG/Bj9V+//ef67hpjJWR3s74C6LZCFLcbZM0z/wTH+baA5Jwcnqr4h/ygosvhP
 X3gkRzJLSFYekmEv+WHieeKXLrJdsUPUvPJTZtvi3ELUxHNOZwX2oRJStWpmL2QGMwPokRNQ
 29GvnueQdQrIl2ylhul6TSrClMrKZqOajDFng7TLgvNfyVZE8WQwmrkTrdzBLfu3kScjE14Q
 Volq8OtQpTsw5570D4plVKh2ahlhrwXdneSot0STk9Dh1grEB/Jfw8dknvqkdjALUrrM45eF
 FM4FSMxIlNV8WxueHDss9vXRbCUxzGw37Ck9JWYo0EpcpcvwPf33yntYCbnt+RQRjv7vy3w5
 osVwRR4hpbL/fWt1AnZ+RvbP4kYSptOCPQ+Pp1tCw16BOaPjtlqSTcrlD2fo2IbaB5D21SUa
 IsdZ/XkD+V2S9jCrN1yyK2iKgxtDoUkWiqlfRgH2Ep1tZtb4NLF/S0oCr7rNLO7WbqLZQh1q
 ShfZR16h7YW//1/NFwnyCVaG1CP/L/io719dPWgEd/sVSKT2TwARAQABzS1KYWNlayBBbmFz
 emV3c2tpIDxqYWNlay5hbmFzemV3c2tpQGdtYWlsLmNvbT7Cwa8EEwEIAEICGwMHCwkIBwMC
 AQYVCAIJCgsDFgIBAh4BAheABQkJZgNMFiEEvx38ClaPBfeVdXCQvWpQHLeLfCYFAl05/9sC
 GQEAIQkQvWpQHLeLfCYWIQS/HfwKVo8F95V1cJC9alAct4t8JqsxD/0U39aol03a1/rGQ/RE
 XJLh+3SxPTjOQ4IV84zGzyZn4pmgxT5fdr58SmkMvvGBEWkfIZoR6XuVKLV6q3OypnkmIdsN
 LUe3UbxO0BNvyryJ3ryp5J5baZ/NotD3w08QsZ9RcWhSpRCQbnPan3ZSsYXgy6PW84hb3enC
 8Ti4Ok2yX6OuLAeiYu2MhShm0hGMZ9lELJRAjS+LktjNcJ5u7MCMYPsmHZgCnt8Mau/epOry
 xf4NQngf/4jw+Iv6NcqQR6mmoiGUEkmXhZyCCAy7dza6WNgO6pFiCG17fcFfII8Chx87b+w3
 7IlFRNW5EWU7FSTiyvP9bxJAPA4DC0pXtPN3IXX+M4YHFbBLXcSMxvi7dfA8zNw+URA10irP
 vo0WYn33FgS+CQCYWZGKjG4FNG/wWzVzWNDTRZYnm97OpjqVxx0Oug9qVdZ4XN8+MiEptXcs
 BhOWq/Qi3vkZb37RMGE+p1MzXkOsJVcHtR6ztScPkUG1bB7BOfCv5y7y17jj1UMzM3Yj5r1g
 onWzq5mbOHkee4qfq0B8bJCHwy6NI4yVms0etGwiwtc6N4ZVrzhCT/Bq0Rw6jJDt35hpWixT
 Q4JmXQaV29sanXPa7xx3Y38cnt0CAWFDt20ZeZ1em3ZYpC9O9BeEisJZVASs1hsNkMPZXRNm
 2U8Fpk/h+RQOS8f5LM4zBFsKioYWCSsGAQQB2kcPAQEHQFCKEG5pCgebryz66pTa9eAo+r8y
 TkMEEnG8UR5oWFt3wsIbBBgBCAAgFiEEvx38ClaPBfeVdXCQvWpQHLeLfCYFAlsKioYCGwIA
 rwkQvWpQHLeLfCaNIAQZFggAHRYhBBTDHErITmX+em3wBGIQbFEb9KXbBQJbCoqGACEJEGIQ
 bFEb9KXbFiEEFMMcSshOZf56bfAEYhBsURv0pdvELgD/U+y3/hsz0bIjMQJY0LLxM/rFY9Vz
 1L43+lQHXjL3MPsA/1lNm5sailsY7aFBVJxAzTa8ZAGWBdVaGo6KCvimDB8GFiEEvx38ClaP
 BfeVdXCQvWpQHLeLfCbuOg/+PH6gY6Z1GiCzuYb/8f7D0NOcF8+md+R6KKiQZij/6G5Y7lXQ
 Bz21Opl4Vz/+39i5gmfBa9LRHH4ovR9Pd6H0FCjju4XjIOJkiJYs2HgCCm6nUxRJWzPgyMPS
 VbqCG2ctwaUiChUdbS+09bWb2MBNjIlI4b8wLWIOtxhyn25Vifm0p+QR5A2ym4bqJJ9LSre1
 qM8qdPWcnExPFU4PZFYQgZ9pX1Jyui73ZUP94L7/wg1GyJZL3ePeE4ogBXldE0g0Wq3ORqA9
 gA/yvrCSyNKOHTV9JMGnnPGN+wjBYMPMOuqDPC/zcK+stdFXc6UbUM1QNgDnaomvjuloflAx
 aYdblM26gFfypvpFb8czcPM+BP6X6vWk+Mw9+8vW3tyK9lSg+43OjIWlBGPpO9aLZsYYxAqv
 J5iSxcbbOLb5q8wWct6U7EZ1RnuOfVInoBttrlYvdWtcI/5NQTptkuB/DyRhrxBJc/fKzJ4w
 jS2ikcWe0FnxrQpcE2yqoUIFaZMdd/Cx9bRWAGZG087t5dUHJuMnVVcpHZFnHBKr8ag1eH/K
 tFdDFtyln5A/f9O22xsV0pyJni7e2z7lTBitrQFG69vnVGJlHbBE2dR4GddZqAlVOUbtEcE7
 /aMk4TrCtx0IyOzQiLA81aaJWhkD3fRO8cDlR4YQ3F0aqjYy8x1EnnhhohHOwU0EVaN9oQEQ
 AMPNymBNoCWc13U6qOztXrIKBVsLGZXq/yOaR2n7gFbFACD0TU7XuH2UcnwvNR+uQFwSrRqa
 EczX2V6iIy2CITXKg5Yvg12yn09gTmafuoIyKoU16XvC3aZQQ2Bn3LO2sRP0j/NuMD9GlO37
 pHCVRpI2DPxFE39TMm1PLbHnDG8+lZql+dpNwWw8dDaRgyXx2Le542CcTBT52VCeeWDtqd2M
 wOr4LioYlfGfAqmwcwucBdTEBUxklQaOR3VbJQx6ntI2oDOBlNGvjnVDzZe+iREd5l40l+Oj
 TaiWvBGXkv6OI+wx5TFPp+BM6ATU+6UzFRTUWbj+LqVA/JMqYHQp04Y4H5GtjbHCa8abRvBw
 IKEvpwTyWZlfXPtp8gRlNmxYn6gQlTyEZAWodXwE7CE+KxNnq7bPHeLvrSn8bLNK682PoTGr
 0Y00bguYLfyvEwuDYek1/h9YSXtHaCR3CEj4LU1B561G1j7FVaeYbX9bKBAoy/GxAW8J5O1n
 mmw7FnkSHuwO/QDe0COoO0QZ620Cf9IBWYHW4m2M2yh5981lUaiMcNM2kPgsJFYloFo2XGn6
 lWU9BrWjEoNDhHZtF+yaPEuwjZo6x/3E2Tu3E5Jj0VpVcE9U1Zq/fquDY79l2RJn5ENogOs5
 +Pi0GjVpEYQVWfm0PTCxNPOzOzGR4QB3BNFvABEBAAHCwWUEGAEIAA8FAlWjfaECGwwFCQlm
 AYAACgkQvWpQHLeLfCZqGxAAlWBWVvjU6xj70GwengiqYZwmW1i8gfS4TNibQT/KRq0zkBnE
 wgKwXRbVoW38pYVuGa5x/JDQMJDrLAJ0wrCOS3XxbSHCWOl/k2ZD9OaxUeXq6N+OmGTzfrYv
 PUvWS1Hy04q9AD1dIaMNruZQmvnRfkOk2UDncDIg0166/NTHiYI09H5mpWGpHn/2aT6dmpVw
 uoM9/rHlF5s5qAAo95tZ0QW2BtIceG9/rbYlL57waSMPF49awvwLQX5RhWoF8mPS5LsBrXXK
 hmizIsn40tLbi2RtWjzDWgZYitqmmqijeCnDvISN4qJ/nCLO4DjiSGs59w5HR+l0nwePDhOC
 A4RYZqS1e2Clx1VSkDXFpL3egabcIsqK7CZ6a21r8lXVpo4RnMlQsmXZTnRx4SajFvX7PrRg
 /02C811fLfh2r5O5if8sKQ6BKKlHpuuioqfj/w9z3B0aQ71e4n1zNJBO1kcdznikPLAbr7jG
 gkBUXT1yJiwpTfRQr5y2Uo12IJsKxohnNFVYtK8X/R6S0deKPjrZWvAkllgIPcHjMi2Va8yw
 KTj/JgcpUO5KN906Pf7ywZISe7Kbcc/qnE0YjPPSqFOvoeZvHe6EZCMW9+xZsaipvlqpByQV
 UHnVg09K9YFvjUBsBPdC8ef6YwgfR9o6AnPmxl0oMUIXkCCC5c99fzJY/k8=
Message-ID: <93dce6c1-e044-086d-3c4a-a3219c26ddee@gmail.com>
Date:   Wed, 20 Nov 2019 22:50:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <CAGngYiXP8xu3UQTZxEqSXNkic3iNU43hD-KBJQkAmduXPp8zhQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 11/20/19 10:41 PM, Sven Van Asbroeck wrote:
> Hi Jacek,
> 
> On Wed, Nov 20, 2019 at 4:33 PM Jacek Anaszewski
> <jacek.anaszewski@gmail.com> wrote:
>> This is covered in DT bindings, it is redundant in the commit message.
> 
> Ok, I will remove it from the commit message.
> 
>>> +     priv->cdev.name = "tps6105x::torch";
>>
>> Please remove above line.
>>
>> And use new LED registration API like below:
>>
>> struct led_init_data init_data = {
>>         .devicename = "tps6105x",
>>         .default_label = ":torch" };
>>
>> return devm_led_classdev_register_ext(&pdev->dev, &priv->cdev, &init_data);
> 
> I would love to do that, but my platform (with a tps6105x) can only boot a lts
> vendor kernel (4.14). classdev_register_ext() is not available there.
> 
> I can make the change you suggest, but cannot test to check if it will actually
> work. Is that ok for you?

Can't you backport also the LED core patches with *ext API?

-- 
Best regards,
Jacek Anaszewski
