Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4EEEA6CEDF
	for <lists+linux-leds@lfdr.de>; Thu, 18 Jul 2019 15:31:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727791AbfGRNb3 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 18 Jul 2019 09:31:29 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:46920 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390302AbfGRNb2 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 18 Jul 2019 09:31:28 -0400
Received: by mail-wr1-f68.google.com with SMTP id z1so28686790wru.13;
        Thu, 18 Jul 2019 06:31:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=WaAcYuOETNJBZmu5hJKbnkdvkEWzaL+ypcfEzgqEBts=;
        b=dXvHPolSM0Jnf/uuyDRv0dfLwA+w5Oy63rkf/2Y0dd2QSiidg7ts5xybH4zH/ilsMB
         Lj90fT4Mx4HjpquxhClbV3Xx4ooCMXtLXlwfsJydoT3BuRqxYuzh5Rswf6JmODKarzJN
         Zbu924RXczaofEKvod64JJqg89XpaC9hY9EjS4nj+4WJL6qDhUKRjV6USY2QEY63HEaQ
         Vn2bHvsc3oJ/mjLWJOD2/2i77X9mB28/7Q8H6sqhtoo1lRTWJh0kxMZSFxtadxHYvjg3
         dw+WJvEGvrFIDYQ0xGVgqRu5BdGVIsiEGVEi5dMnHUfYG4eqaS2r40o1l42dAEv3KZ3u
         RLNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=WaAcYuOETNJBZmu5hJKbnkdvkEWzaL+ypcfEzgqEBts=;
        b=Tn/Aa3mTraxqKGlUFDjCjx7/MA+RH6PHbo4pREodmUR6qrOm53y+d4pHO1Mv8TAr6o
         Exc6AnhgBg9ak2ptJRfo2zizhL7uoEuN3HOftUvnCp0jlZAUaFS+Co9HX/NIx+b0e5yc
         tN3IQacf+uSc6zJ2r0oToawJcD6utoY62CVxJ3uxdjElWhBlO8Xm9fk43OfQSrjF/LZh
         lUS+mchl5YLTtCQQ65lohP/MbzxN2ly5TLwgPN5f+rS7qbGHjU4DFM2Us3dYTzi8Fl71
         KAgz7sRlbVSrXkhEffN3kuRxivJzOA2Ovu5N4VMcEdC1kl4MIJMS0Zp/PBAA1xp9oI/i
         iiug==
X-Gm-Message-State: APjAAAWCHy3hpwdutdTHUsqVunFl4jVkKpAMn8lFJryA03+bHzVoue9+
        2nf3QKhHUXWAu03fWhN/rMY=
X-Google-Smtp-Source: APXvYqysL32h0Zhpaq6Dlqn3rVp59a8EJm4WrJo7YVfyOcLvVZLjx2pyxgTkg6yGsl51wt79McRRzQ==
X-Received: by 2002:a5d:4950:: with SMTP id r16mr43519141wrs.136.1563456685542;
        Thu, 18 Jul 2019 06:31:25 -0700 (PDT)
Received: from [192.168.1.19] (bkt159.neoplus.adsl.tpnet.pl. [83.28.187.159])
        by smtp.gmail.com with ESMTPSA id x20sm21075974wmc.1.2019.07.18.06.31.24
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 18 Jul 2019 06:31:24 -0700 (PDT)
Subject: Re: [PATCH v5 26/26] leds: Document standard LED functions
To:     Pavel Machek <pavel@ucw.cz>
Cc:     linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, robh@kernel.org, dtor@google.com,
        linux@roeck-us.net, dmurphy@ti.com
References: <20190609190803.14815-1-jacek.anaszewski@gmail.com>
 <20190609190803.14815-27-jacek.anaszewski@gmail.com>
 <20190718110352.GB3859@amd>
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
Message-ID: <d3f1532e-5fa5-d944-bb6b-1b97c1e6c9c9@gmail.com>
Date:   Thu, 18 Jul 2019 15:31:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190718110352.GB3859@amd>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Pavel,

Thanks for the review.

On 7/18/19 1:03 PM, Pavel Machek wrote:
> Hi!
> 
>> Add a documentation for standard LED functions with regard
>> to differences in meaning between cases when devicename section
>> of LED name is present or not.
>>
>> Signed-off-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
>> ---
>>  Documentation/leds/led-functions.txt | 223 +++++++++++++++++++++++++++++++++++
>>  Documentation/leds/leds-class.txt    |   3 +
>>  2 files changed, 226 insertions(+)
>>  create mode 100644 Documentation/leds/led-functions.txt
>>
>> diff --git a/Documentation/leds/led-functions.txt b/Documentation/leds/led-functions.txt
>> new file mode 100644
>> index 000000000000..003b6b6271d1
>> --- /dev/null
>> +++ b/Documentation/leds/led-functions.txt
>> @@ -0,0 +1,223 @@
>> +This file presents standardized LED functions and their meaning.
>> +
>> +Each LED function is described using below template:
>> +
>> +- LED function name
>> +    NDEV : <function meaning when LED devicename section is absent>
>> +    DEV  : <function meaning when LED devicename section is present>
>> +    DEVICENAME : <expected LED devicename for DEV case>
>> +    TRIGGER: <matching LED trigger>
>> +
>> +/* LED functions with corresponding trigger support */
>> +
>> +- activity
>> +    NDEV : system activity
>> +    DEV  : n/a
>> +    TRIGGER : "activity"
>> +
>> +- backlight
>> +    NDEV : n/a
>> +    DEV  : backlight of a frame buffer device
>> +    DEVICENAME : associated frame buffer device, e.g. fb0
>> +    TRIGGER: "backlight"
> 
> ndev: if there's single one on the platform?

Ack.

>> +- capslock
>> +    NDEV : n/a
>> +    DEV  : keyboard capslock state related to the specified input device
>> +    DEVICENAME : associated input device, e.g. input1
>> +    TRIGGER : "kbd-capslock"
>> +
> 
>> +- disk
>> +    NDEV : rw activity on any disk in the system
>> +    DEV  : rw activity on specified disk
>> +    DEVICENAME : associated disk, e.g.: hda, sdb
>> +    TRIGGER : "disk-activity", applies only to NDEV case
> 
> I'd sort this file according to the places where these leds are
> usually are present, to make it simpler for user to find the
> labels. capslock should go near scrollock etc.
> 
> Plus I guess explanation in which systems such LED is found would be
> good.

I need more input on that. No idea what you mean.

> Global "disk" LED is very common on the PCs, and we should make sure
> such LEDs have consistent labeling everywhere.

Could you please be more specific and give some examples of the rework
you propose? Whereas it's clear what you mean regarding keyboard LEDs,
I'm not sure what is your intention in case of "disk".

>> +- disk-read
>> +    NDEV : read activity on any disk in the system
>> +    DEV  : read activity on specified disk
>> +    DEVICENAME : associted disk, e.g.: hda, sdb
>> +    TRIGGER : "disk-read", applies only to NDEV case
>> +
>> +- disk-write
>> +    NDEV : write activity on any disk in the system
>> +    DEV  : write activity on specified disk
>> +    DEVICENAME : associated disk, .e.g" hda, sdb
>> +    TRIGGER : "disk-write", applies only to NDEV case
> 
> I don't see separated read/write LEDs very often. To keep the file
> size down, I'd list is at "disk-read, disk-write".

Ack.

-- 
Best regards,
Jacek Anaszewski
