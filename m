Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 67E7E6AED6
	for <lists+linux-leds@lfdr.de>; Tue, 16 Jul 2019 20:41:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728579AbfGPSln (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 16 Jul 2019 14:41:43 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:39251 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728121AbfGPSlm (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 16 Jul 2019 14:41:42 -0400
Received: by mail-wm1-f68.google.com with SMTP id u25so9304989wmc.4
        for <linux-leds@vger.kernel.org>; Tue, 16 Jul 2019 11:41:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=M8CBVePSvxV2aKHHaVhRfz7JP/L3OTOWwphdlXJNLuM=;
        b=m1r3eBBkIvmVCvVorxjqILNbfknHF2NfuAPmlZFXanFeERt4yjnr/eck7J49y6vEkK
         Nx9uZyq84OCkMAad2qfJBOWRcKIVDBIOJdVXDrdtz/QJ6CRBAtHA/eURdXDReb7ykKsX
         Y/jw2bVikMIzH0641ySCYlq9Kj0YWizcaOaZgMnAfkDVbK1r9NwyQmkFo4Ye+ceGcYkU
         VS2oG35l93X0qsxv/w7IBCZbkpNzso+jVD+HqFzGHStxPORad49jI+EfirhuR2dj64Bp
         Vv9MuabXbJJXvxd7us3JHDCMfDnlZyWGPaqDMsgZmrU9gWMMVzYpKbhIMzYA20WrBqZT
         oADg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=M8CBVePSvxV2aKHHaVhRfz7JP/L3OTOWwphdlXJNLuM=;
        b=JzsJQL+2LVX48++AzN+QnvPAO9LVRiNPgPKedrI/PiAGKU368FrYMjsdzpxOzrZcy6
         wHTtq2BNQGTR9qjqJOanYEbttMgNpTxlXkgcGYPYJBLHNbsORATMDNui22XsKMYW0ZrV
         4qsgli3Y/H3jgHdls1qtAi5IthJzuUvbdUX3JkWdjO0BllNmE/MT933IaaTdKQVnLtEo
         1FxF0GbjIQgRB4ERWKoIsdD8FR+bZLKayaUeXvGGPDnG4UKzP8HNlym/L/BB57Tr1zMn
         P/HlS847fAsJ4yWgsxvUVTZPZIMRKwxMKksOXPXCokI2/LGcprTBjA7eHED9KoC9ZnyS
         AUjw==
X-Gm-Message-State: APjAAAXtaXLOKnl7c7C6PuWd2U6ZzqwER9STivVvfxz4D6boeCYCYovS
        1eL7GenQX4LBWoeBkeL1UJSuCzD6
X-Google-Smtp-Source: APXvYqzE5VDiXi4nmAFe037MPCHzMUXcP/05hXpuBHJGHurHs2kWLbaVl8zSVXXgjjC8jGTw0p/Mtw==
X-Received: by 2002:a05:600c:224d:: with SMTP id a13mr5154198wmm.62.1563302499620;
        Tue, 16 Jul 2019 11:41:39 -0700 (PDT)
Received: from [192.168.1.19] (chm81.neoplus.adsl.tpnet.pl. [83.31.10.81])
        by smtp.gmail.com with ESMTPSA id s63sm18953278wme.17.2019.07.16.11.41.38
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 16 Jul 2019 11:41:39 -0700 (PDT)
Subject: Re: [PATCH v2 1/2] dt-bindings: Add docs for EL15203000
To:     Oleh Kravchenko <oleg@kaa.org.ua>, Pavel Machek <pavel@ucw.cz>
Cc:     Dan Murphy <dmurphy@ti.com>, linux-leds@vger.kernel.org
References: <27c0b356-8111-6b36-23cc-8e654147178f@kaa.org.ua>
 <b6a5cc5e-74f1-d328-7a47-995670ba7aa7@ti.com>
 <adf5a755-c534-64c3-6e99-ba39ffea95e2@kaa.org.ua>
 <2eba86cb-01be-c002-32d0-80ab2ab14f97@gmail.com>
 <7e787498-537b-390d-589a-577f34ffbc3f@kaa.org.ua>
 <94968b55-a9cc-277e-ac25-bf765f9db138@kaa.org.ua>
 <e1fc84a1-75e4-6c56-d2ea-f6ade28087ac@kaa.org.ua>
 <e4e0223d-c463-e767-12b2-7e360eac000b@gmail.com>
 <38050529-5730-6e88-fe1a-909492711dd0@kaa.org.ua>
 <8f658d57-5079-ad76-ce3e-af3d031b4685@gmail.com> <20190611120156.GA1161@amd>
 <9e812391-56e9-2dd5-1f08-435df717b12b@gmail.com>
 <8d0d6893-212c-41c4-fef8-76417eb45399@kaa.org.ua>
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
Message-ID: <7d71e2a7-5dcf-7dd8-71a7-eee5c07fb1d0@gmail.com>
Date:   Tue, 16 Jul 2019 20:41:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <8d0d6893-212c-41c4-fef8-76417eb45399@kaa.org.ua>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Oleh,

On 7/9/19 12:00 AM, Oleh Kravchenko wrote:
> Hello Jacek,
> 
> 11.06.19 22:52, Jacek Anaszewski пише:
>> On 6/11/19 2:01 PM, Pavel Machek wrote:
>>> Hi!
>>>
>>>>> I just want to clerify - for now LEDs board has 2 from 3 LEDs with effect function.
>>>>>
>>>>> 1. Screen frame led is just blinking, so blink_set() is fit well to this.
>>>>> 2. Pipe led actually consist from 3 leds and when effect is enabled next pattern is used:
>>>>>
>>>>>        ^
>>>>>        |
>>>>> LED1  >   OFF  ON   ON   ON
>>>>>        |
>>>>> LED2  >   OFF  OFF  ON   ON
>>>>>        |
>>>>> LED3  >   OFF  OFF  OFF  ON
>>>>>        |
>>>>>        +----^----^----^----^----> time
>>>>
>>>> Pattern trigger applies to a single LED so it won't fit for this
>>>> pattern.
>>>>
>>>> Currently we don't support patterns spanning on multiple LEDs,
>>>> so you would have to come up with your own solution.
>>>>
>>>> What I can recommend is a trigger that would be created by your driver
>>>> and would activate this sequence.
>>>
>>> Yes, please.
>>>
>>> While adding custom files to sysfs may appear easier, we'll need
>>> "led-specific-triggers" for other reasons.
>>
>> For what reasons exactly?
>>
>> This is similar to the generic hw trigger support proposed by
>> Marek Behun. In the reply to that patch I asked some questions [0].
>> So far the mechanism looks too me awkward and not introducing any
>> novelty besides requiring one more step - setting the trigger.
>>
>>> And for the record... Handling 3 LEDs as one is not something usual in
>>> the LED subsystem; I guess it makes sense in your specific case, but
>>> hopefully noone will copy that design.
>>>
>>> (I guess they are not individually controllable?)
>>>
>>>                                     Pavel
>>>
>>
>> [0] https://www.spinics.net/lists/linux-leds/msg12269.html
>>
> 
> I just figure out that this Pipe LED actually consist from 5 LEDs, not 3 :)
> And supports next level 'brightness' from SPI driver:
> - '0' Off
> - '1' On
> - '2' Cascade (waterfall down)
>  -'3' InverseCascade (waterfall up)
> - '4' Bounce
> - '5' InverseBounce
> 
> Please advice, can I proceed with sys attribute file to set '2'..'5' levels?

It looks like pattern trigger is the most appropriate solution for the
effects 2-5. Your driver will need to implement pattern_set op for the
LEDs supporting the effects, and then the effect will be enabled after
writing required sequence to the hw_pattern file. You will need to come
up with a sequence of values that the driver will recognize as a request
of enabling given hardware effect. Please compare
drivers/leds/leds-sc27xx-bltc.c and its ABI documentation [0] for
reference. See also hw_pattern file description in [1].

[0] Documentation/ABI/testing/sysfs-class-led-driver-sc27xx
[1] Documentation/ABI/testing/sysfs-class-led-trigger-pattern

-- 
Best regards,
Jacek Anaszewski
