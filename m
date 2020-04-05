Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5161D19EC4C
	for <lists+linux-leds@lfdr.de>; Sun,  5 Apr 2020 17:08:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726598AbgDEPIm (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 5 Apr 2020 11:08:42 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:40257 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726452AbgDEPIm (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 5 Apr 2020 11:08:42 -0400
Received: by mail-wr1-f68.google.com with SMTP id s8so12188262wrt.7;
        Sun, 05 Apr 2020 08:08:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=hLkdf7CCKQAWd7+E4rtm5ttVQJDXTuxWKBKsMC1VNOw=;
        b=aaBe9uCdlusTmK47EMfCTf1vq/g2CFgkj1++nGwtGoW9NiuZSwLe5LDyUutB4f/IVA
         QU6js0LQzq8kpfwv1oQ+KKF7j3fXzicnGsqo2nDWHFV+wrGeDgZFe5sMzdhoNo79oA/k
         S6vNPK/89lcHa9Qxx5d9yNp9KZFORQwO6GWwqqRS5mMgrXtwyt02e/0/lG753qL4Ac4i
         1Gg9Di3COhX6H5DKEqjJF4PkPKqJz0wj3JbKKzIcqC4sQVXPKtdSVCplnmu31RMdJvbp
         X3zKb6MnCqXbmuC7pF0hbNCGtuJUyysnto4FyxFKgwvabuQL3NjlWXKtlmxcLkKRaHe5
         TmKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=hLkdf7CCKQAWd7+E4rtm5ttVQJDXTuxWKBKsMC1VNOw=;
        b=Gq3UXxhf/6l0Tte80+REsS1emFjcAKRjN4CKc4y4rEQIzzjIYWLE5SE5GqU0ebFS0z
         0SqXfc2ybMQMifa2vLlS24itRUP/6KRNXWOzKXO4sOuWfKG+56mTjFbdJBXVhhD7/j0q
         F9HCwRRKJvjia9kLrIxaPcJ/C4AP4N3IJxs9TxoMotpcdMSvv1Hu8/WfE8t8wTXckVuu
         KYzXcDWvw3fUkYQJxgNyAm4YSPXgiqB1kjVanBi81TouATVk5g6YLMTaCVQQo2EnTPLw
         pSDxU1Gx/oDAOFabsBisyDWbsCbyCRKKgjA5Nj07oeyEvEsfFyS7L1O06qcbfXkseC59
         ww5w==
X-Gm-Message-State: AGi0PuYctmpTTIMRWB/Uid4oTbl37IH8rFAoNHqxIt38iC1266OzcPhe
        i1K1SBa3tjIxi3dTJho+8rII0e88
X-Google-Smtp-Source: APiQypKPkpQPvF87GexoWkveNCeuFxOFc67IWUkxjcG6hUCNp1kX4sMc2uAk2pLwVtRnUCZsjd6RsQ==
X-Received: by 2002:adf:ee41:: with SMTP id w1mr5257107wro.276.1586099319338;
        Sun, 05 Apr 2020 08:08:39 -0700 (PDT)
Received: from [192.168.1.23] (afde158.neoplus.adsl.tpnet.pl. [95.49.82.158])
        by smtp.gmail.com with ESMTPSA id z21sm4409882wml.47.2020.04.05.08.08.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Apr 2020 08:08:38 -0700 (PDT)
Subject: Re: [PATCH v19 04/18] leds: multicolor: Introduce a multicolor class
 definition
To:     Dan Murphy <dmurphy@ti.com>, Randy Dunlap <rdunlap@infradead.org>,
        pavel@ucw.cz
Cc:     linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200402204311.14998-1-dmurphy@ti.com>
 <20200402204311.14998-5-dmurphy@ti.com>
 <619a1251-d062-b9bf-6752-b867fcaa600b@infradead.org>
 <34b07ce8-6a38-f45c-4624-730f5597f686@ti.com>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Autocrypt: addr=jacek.anaszewski@gmail.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <a6b93d69-a1d5-f515-ee37-6106b50120cf@gmail.com>
Date:   Sun, 5 Apr 2020 17:08:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <34b07ce8-6a38-f45c-4624-730f5597f686@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Dan,

On 4/3/20 4:39 PM, Dan Murphy wrote:
> Randy
> 
> Thanks for the review
> 
> On 4/2/20 10:47 PM, Randy Dunlap wrote:
>> Hi,
>> Here are a few changes for you to consider:
>>
>> On 4/2/20 1:42 PM, Dan Murphy wrote:
>>> Introduce a multicolor class that groups colored LEDs
>>> within a LED node.
>>>
>>> The multi color class groups monochrome LEDs and allows controlling two
>>        multicolor
> Ack
>>
>>> aspects of the final combined color: hue and lightness. The former is
>>> controlled via <color>_intensity files and the latter is controlled
>>> via brightness file.
>>>
>>> Signed-off-by: Dan Murphy <dmurphy@ti.com>
>>> ---
>>
>>> diff --git a/Documentation/leds/leds-class-multicolor.rst
>>> b/Documentation/leds/leds-class-multicolor.rst
>>> new file mode 100644
>>> index 000000000000..5bb004999248
>>> --- /dev/null
>>> +++ b/Documentation/leds/leds-class-multicolor.rst
>>> @@ -0,0 +1,95 @@
>>> +====================================
>>> +Multi Color LED handling under Linux
>>     Multicolor
> Ack
>>
>>> +====================================
>>> +
>>> +Description
>>> +===========
>>> +The multi color class groups monochrome LEDs and allows controlling two
>>         multicolor
> Ack
>>
>>> +aspects of the final combined color: hue and lightness. The former is
>>> +controlled via the color_intensity array file and the latter is
>>> controlled
>>> +via brightness file.
>>> +
>>> +For more details on hue and lightness notions please refer to
>>> +https://en.wikipedia.org/wiki/CIECAM02.
>>> +
>>> +Multicolor Class Control
>>> +========================
>>> +The multicolor class presents files that groups the colors as
>>> indexes in an
>>> +array.  These files are children under the LED parent node created
>>> by the
>>> +led_class framework.  The led_class framework is documented in
>>> led-class.rst
>>> +within this documentation directory.
>>> +
>>> +Each colored LED will be indexed under the color_* files. The order
>>> of the
>>> +colors are arbitrary the color_index file can be read to determine
>>> the color
>>> +to index value.
>>> +
>>> +The color_index file is an array that contains the string list of
>>> the colors as
>>> +they are defined in each color_* array file.
>>> +
>>> +The color_intensity is an array that can be read or written to for the
>>> +individual color intensities.  All elements within this array must
>>> be written in
>>> +order for the color LED intensities to be updated.
>>> +
>>> +The color_max_intensity is an array that can be read to indicate
>>> each color LED
>>> +maximum intensity value.
>>> +
>>> +The num_color_leds file returns the total number of color LEDs that are
>>> +presented in each color_* array.
>>> +
>>> +Directory Layout Example
>>> +========================
>>> +root:/sys/class/leds/multicolor:status# ls -lR
>>> +-rw-r--r--    1 root     root          4096 Oct 19 16:16 brightness
>>> +-r--r--r--    1 root     root          4096 Oct 19 16:16 color_index
>>> +-rw-r--r--    1 root     root          4096 Oct 19 16:16
>>> color_intensity
>>> +-r--r--r--    1 root     root          4096 Oct 19 16:16 num_color_leds
>>> +
>>> +Multicolor Class Brightness Control
>>> +===================================
>>> +The multiclor class framework will calculate each monochrome LEDs
>>> intensity.
>>         multicolor
> Ack
>>
>>> +
>>> +The brightness level for each LED is calculated based on the color LED
>>> +intensity setting divided by the parent max_brightness setting
>>> multiplied by
>>> +the requested brightness.
>>> +
>>> +led_brightness = brightness * color_intensity/max_brightness
>>> +
>>> +Example:
>>> +A user first writes the color_intensity file with the brightness levels
>>> +that for each LED that is necessary to achieve a blueish violet
>>> output from a
>> drop first "that".
> Ack
>>                       that are
>> necessary                                   from an
> Ack and NACK the "from an".  It is from a since R is a consonant

But it sounds like a vowel and this rule for creating articles
"applies to the sound of the letter beginning the word, not just the
letter itself" [0].

[0] https://www.grammar.com/a-vs-an-when-to-use/

-- 
Best regards,
Jacek Anaszewski
