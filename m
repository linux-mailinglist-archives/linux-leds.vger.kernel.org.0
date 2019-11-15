Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5F2A8FE645
	for <lists+linux-leds@lfdr.de>; Fri, 15 Nov 2019 21:14:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726505AbfKOUOt (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 15 Nov 2019 15:14:49 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:33164 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726466AbfKOUOt (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 15 Nov 2019 15:14:49 -0500
Received: by mail-wr1-f67.google.com with SMTP id w9so12317672wrr.0;
        Fri, 15 Nov 2019 12:14:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=NlAiSfXhUmY3lXvVCIhSOV4paP8GStcIO/eWiGpAuzc=;
        b=d8UssxdEAmg5t0wZac7HDkM08KneEzLVp0A1FlN7NWC/fEZrmDzkPalCyYdsQWc/u1
         dKs1vFjBM0XQ3vREkWzg3RaAk7zDuuFs4LR5MQc/FIhBk7LkYvYdWK5a86P0VQVTL1jE
         XWu9j9pVW8VuaJ7ycTnnzxblKNplaXKT48frYHN7dTHza6AGxMJMvoHKT8KgLyIrtjW8
         8gblgNBJR1v5p/UklKRv0D6pN7+FpEEdPg/TBer9Be2u+28XD3N7pQ1hf4QH6WBPdKYy
         Z/A5/o7kQk3V44iG8ejYlR3dLlo0BsyC5G636wtnNvXu57XfCq7CgefGvCSJy7aFcq8u
         YL5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=NlAiSfXhUmY3lXvVCIhSOV4paP8GStcIO/eWiGpAuzc=;
        b=iNsfOcuordiUv7TkvhQnxYkaUk+q9yqzcQujYHotaKvAkrzBHPUh5o006syNBr6T0N
         8Tc3DHXpc7Bm9vU8EHu5dGFpl+aOPbAS+jsSeMLRP+j14rmy80J/U+P6EzwWCDEqsUZ1
         mlVRmjKhhsDc3Hi8IY9CgRpBk7o1bsBlMWMBbWmW6wavzaCLeWwNW6c5arDB04VSVg5l
         FSVupstyXQvvTSbC6G03wmDsVsIrbGaW8z6Rw1I1BAX+0/1uA909LBCT22axq4Nu4hnk
         xVPVN2ziLTkcZKta7ddjo0njgsIUIAoYM/ZufVPiwOQGrLrHM4zTe8c2mGVkKCXd60BZ
         uzpw==
X-Gm-Message-State: APjAAAX7eI2khpYt5O/ruDXiCBLNZkTpF0xZx4pKOIXre0Po+ctgDGX1
        D6rqE0Lx+zLbveTV5Qef8JU388L+
X-Google-Smtp-Source: APXvYqxQf2/5S4soVwjc7wOgV7VE8wf8S8Q7JScEOm+alfXprD4GLKM81l9bC0OfkS/M+KdUXq6u9g==
X-Received: by 2002:adf:c401:: with SMTP id v1mr8943327wrf.375.1573848885623;
        Fri, 15 Nov 2019 12:14:45 -0800 (PST)
Received: from [192.168.1.19] (bkx24.neoplus.adsl.tpnet.pl. [83.28.191.24])
        by smtp.gmail.com with ESMTPSA id o187sm11120248wmo.20.2019.11.15.12.14.43
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 15 Nov 2019 12:14:45 -0800 (PST)
Subject: Re: [PATCH v5 03/26] dt-bindings: leds: Add LED_FUNCTION definitions
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Pavel Machek <pavel@ucw.cz>
Cc:     linux-leds@vger.kernel.org,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Rob Herring <robh@kernel.org>, dtor@google.com,
        Guenter Roeck <linux@roeck-us.net>,
        Dan Murphy <dmurphy@ti.com>,
        Baolin Wang <baolin.wang@linaro.org>,
        Daniel Mack <daniel@zonque.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Oleh Kravchenko <oleg@kaa.org.ua>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Simon Shields <simon@lineageos.org>
References: <20190609190803.14815-1-jacek.anaszewski@gmail.com>
 <20190609190803.14815-4-jacek.anaszewski@gmail.com>
 <CAMuHMdXkQCVXdsbS1Tf+7wkafJ4JxhxXeh4R7OWOz5uGs-jL5Q@mail.gmail.com>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=jacek.anaszewski@gmail.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <6e937f6a-e527-ef78-768e-03a04c97d640@gmail.com>
Date:   Fri, 15 Nov 2019 21:14:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAMuHMdXkQCVXdsbS1Tf+7wkafJ4JxhxXeh4R7OWOz5uGs-jL5Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Geert,

On 11/15/19 2:01 PM, Geert Uytterhoeven wrote:
> Hi Jacek,
> 
> On Sun, Jun 9, 2019 at 9:09 PM Jacek Anaszewski
> <jacek.anaszewski@gmail.com> wrote:
>> Add initial set of common LED function definitions.
>>
>> Signed-off-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
> 
>> --- a/include/dt-bindings/leds/common.h
>> +++ b/include/dt-bindings/leds/common.h
>> @@ -30,4 +31,45 @@
>>  #define LED_COLOR_ID_IR                7
>>  #define LED_COLOR_ID_MAX       8
>>
>> +/* Standard LED functions */
>> +#define LED_FUNCTION_ACTIVITY "activity"
> 
> What's the appropriate function for "general purpose" or "user" LEDs on
> development boards, where the LEDs don't have fixed functions, unlike
> on real products?
> Perhaps just LED_FUNCTION_INDICATOR?

LED_FUNCTION_INDICATOR was introduced to address current occurrences
of indicator LEDs that are customary for LED flash controllers.
Such LEDs usually indicate that camera sensor is capturing images.
In the v5 of the patch set [0] I proposed also a documentation for
LED functions but there was little interest in it and no broader
discussion took place, so I didn't apply it.

It would be good to include that finally to avoid abusing the LED names
for irrelevant use cases.

> I noticed your very initial submission defined LED_FUNCTION_USER "user".
> I couldn't find an explanation for the rationale behind its removal in later
> revisions, or any discussion asking for that.

I was asked at some point to give rationale for standardizing particular
LED names and couldn't have come up with anything convincing for "user".
This is however an initial set of standard LED names, so we can always
add new ones. If you like please submit a patch adding what you deem
is missing.

[0]
https://lore.kernel.org/linux-leds/20190609190803.14815-27-jacek.anaszewski@gmail.com/

-- 
Best regards,
Jacek Anaszewski
