Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3057CD69B9
	for <lists+linux-leds@lfdr.de>; Mon, 14 Oct 2019 20:49:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731007AbfJNSsy (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 14 Oct 2019 14:48:54 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:40428 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731506AbfJNSsx (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 14 Oct 2019 14:48:53 -0400
Received: by mail-wm1-f65.google.com with SMTP id b24so17755896wmj.5;
        Mon, 14 Oct 2019 11:48:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=qtApknBx8ly+kOurF6UQstOCC32vn7syQ2amILoeo/0=;
        b=Vqt8mvXidkSy00ESZyjP1bPGmSxQBm5K0P2gZqXZ8T7x9o5pr/lRcdirGqtlA91SjW
         TborCJb+J336HGiRdXghrHKUi4jIAk3SIzTiu0zaM3sr602dA6T2uXgtMJyHUuVimAq5
         +QLWDLhntxXHVIHu0fSquMLn7lfhgZ71awSaOqO3B7XYdepP9isc22XU2M+a1W4TuM02
         d935EKyUaKT8+Y8qk38ttA8/DSmWdHLChM2rY/vLZf8LZUk2vusIweqsgasJ8sgSUpLn
         tua4YECb8euwLrzbWggVZQ7RrXmlTJWPSQPTZN6os+rps8+TGjR3mJI2h4bGOWVNWBcm
         Nqjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=qtApknBx8ly+kOurF6UQstOCC32vn7syQ2amILoeo/0=;
        b=N5MFPnVy6vH7IVER//9wci6mi44eSzar3ZF4GOU99nEk1+Pbkj361YDPAfz28XAg25
         a7pKnfiUffdFzvk5/atkUG0wWsQtMbBHXKSc0FDHjkfX46YEKqJUpjuwCWOoXuzg3VXm
         UKB6Mi9omGcwqlJp7OQ3OLfq83bm7RUZ9H04x1EzfTlDcUXdmzC0eisnXWke1wONks4N
         U+Az33ZapwxmtqHzZ3hfqGqUcWFdIe32mv+ulU0/yDr0z8lfYzU+JxYHEDtZOyX3+gtL
         fJaFg6MEKofItUCD3I97oWPHD7rJvZ3ijeKERTvl997z7ixRNBY0QooaEuMvPSNTtvoE
         oDTw==
X-Gm-Message-State: APjAAAU7iqq/9QSs0KCwZ4+EJNwa0QuYPPtR5QVnPC2IFGFCp3MRM4eb
        6xuKHUJX3EhpCvkSlbDn0T8jpQ+s
X-Google-Smtp-Source: APXvYqwQikvvPcC74zrsm7UOvdnO4AoF0vSG2bgmWgUUEQhVhm2rfwlZrDKtvI6C6JqbPZ2qvBxndg==
X-Received: by 2002:a7b:cd04:: with SMTP id f4mr16062093wmj.91.1571078931088;
        Mon, 14 Oct 2019 11:48:51 -0700 (PDT)
Received: from [192.168.1.19] (cka157.neoplus.adsl.tpnet.pl. [83.31.76.157])
        by smtp.gmail.com with ESMTPSA id h7sm17523694wrt.17.2019.10.14.11.48.49
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 14 Oct 2019 11:48:50 -0700 (PDT)
Subject: Re: [PATCH v5 3/3] leds: Add control of the voltage/current regulator
 to the LED core
To:     Daniel Thompson <daniel.thompson@linaro.org>,
        Jean-Jacques Hiblot <jjhiblot@ti.com>
Cc:     Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org, dmurphy@ti.com, tomi.valkeinen@ti.com
References: <20190923102059.17818-1-jjhiblot@ti.com>
 <20190923102059.17818-4-jjhiblot@ti.com>
 <3e648fab-638f-4aa0-dda9-8ddba6562751@gmail.com> <20191013120937.GK5653@amd>
 <eb8c0df1-0d5b-11d0-9965-3192fa5675f3@ti.com>
 <20191014123849.fhvmqn7dyu6bminc@holly.lan>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=jacek.anaszewski@gmail.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <939cf695-b955-da01-2a2b-3b5ce0dc3660@gmail.com>
Date:   Mon, 14 Oct 2019 20:48:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191014123849.fhvmqn7dyu6bminc@holly.lan>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 10/14/19 2:38 PM, Daniel Thompson wrote:
> On Mon, Oct 14, 2019 at 12:49:07PM +0200, Jean-Jacques Hiblot wrote:
>>
>> On 13/10/2019 14:09, Pavel Machek wrote:
>>> Hi!
>>>
>>>> I must say I'm not a big fan of this change.
>>>> It adds a bunch of code to the LED core and gives small
>>>> functionality in a reward. It may also influence maximum
>>>> software blinking rate, so I'd rather avoid calling
>>>> regulator_enable/disable when timer trigger is set.
>>>>
>>>> It will of course require more code.
>>>>
>>>> Since AFAIR Pavel was original proponent of this change then
>>>> I'd like to see his opinion before we move on to discussing
>>>> possible improvements to this patch.
>>> Was I?
>>>
>>> Okay, this series looks quite confusing to me. First, 1/3 looks
>>> "interesting" (would have to analyze it way more).
>>>
>>> Second, 3/3... So we have a LED driver _and_ a regulator? So yes, the
>>> chip driving a LED is usually ... voltage/current regulator. What is
>>> second regulator doing there? Is that a common setup?
>>
>> This is quite common with current-sink LED drivers.
>>
>> The setup looks like this:
>>
>> +-----------+
>> |           |
>> | Regulator |
>> |           +------------------------+
>> |           |                        |
>> +-----------+                      __|__
>>                                    \   /
>>          +---------------------+    \ / led
>>          |                     |     V
>>          |    Led Driver       |   --+--
>>          |                     |     |
>>          |                     |     |
>>          |                +----------+
>>          |              \      |
>>          |               \     |
>>          |                +    |
>>          |                |    |
>>          +---------------------+
>>                           |
>>                        +--+--+
>>                        ///////
>>
>>
>> Only the regulator usually does not supply only one LED.
> 
> Given questions have been raised about the complexity of the change I
> wondered whether, for a system with this topology, the regulator
> could/should be enabled when the LED driver driver probes?

And this is how are doing that now.

Moreover, just after seeing your ASCII art it has become obvious to me
that we can't simply do regulator_disable() while setting brightness to
LED_OFF since it can result in powering off the LED controller, which
would need to be reconfigured on next transition to
brightness > LED_OFF.

It looks that the idea is flawed I'm afraid.

-- 
Best regards,
Jacek Anaszewski
