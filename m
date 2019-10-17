Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DB57FDB6C5
	for <lists+linux-leds@lfdr.de>; Thu, 17 Oct 2019 21:05:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2439229AbfJQTFs (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 17 Oct 2019 15:05:48 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:45354 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390206AbfJQTFs (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 17 Oct 2019 15:05:48 -0400
Received: by mail-wr1-f68.google.com with SMTP id r5so3553258wrm.12;
        Thu, 17 Oct 2019 12:05:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=CrNjk51SHbPcyWRe9WcmjhhvATvb428Jmu9/d2AL6x0=;
        b=cYSgI7g7HRZVut8X2JeNT6JAaLlyyaPSZOa6XVP45lfIaTNaohjlecFcfcJA7Wdg8k
         l0+moeDMfJJRMXFGA2yhblx1YVAegtf47wltYhTjOuZ3GG8M8YTRQltitnAg6QTo2gL7
         BQMujhcbbHaWnocy79z3A8c+cxGyZ2bVMwZAZuxU14FUFeQ2TFyRzUxzFXutcnd2jbgg
         6YQdcBEfVNt3TC1ARmVhI7b08lMbdIbnmx34I89eAjUobxDs855ZsrrFnKczr1yPzl9E
         9VnMsaCeuZGfShFIaZx1F1UVePPR+/oCjEIztqIcASBiHIcvA5adrpSMCsgEIEJp7vYK
         s8vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=CrNjk51SHbPcyWRe9WcmjhhvATvb428Jmu9/d2AL6x0=;
        b=ASYmBHWXWltHgZT5gA/zxhaUlGSMZTsmSB/Ozz/2P+ZJqnvm4EXzjcBqy+k4pnYpsK
         N7n2A7QuFUX5O0X+WCTrPcMjDxArmoLu/6c0Ba8b6gojraPpU7SrWR3/FCWip9sH2qpa
         UgNPgjDNUYKsBRakH5U0pAZnEkznGhUSUiklJ93hDoEwEXpgZU9mEzqg6u2Ccpli7TRx
         J4sQ26WN2E7N4tUe3kmMmm/7jwi9vvNUre6Am/PUIlt09TrurmAMURWcNt19AMTnEFBa
         OgjOQHdJincNqQYSWUlUg3B7ASque8oGhMODU4//uS/BGZ7fXQmA1Etzs3yPPxEWXZDv
         MbXw==
X-Gm-Message-State: APjAAAVFFAjd7Sur0mQwpI6XSVAVK8deuSiFVdhJhVNa6v7Kduw72t+T
        QGqVuSt7anpons2K4sKkmD5AeX1x
X-Google-Smtp-Source: APXvYqxBJdyRloXYKmGoPnvOkOc/HTPU0VVGSsrUNhFWSILSfkQCji8XpR9/335GmJ2QlARTnBV0/w==
X-Received: by 2002:adf:f306:: with SMTP id i6mr4173375wro.209.1571339144845;
        Thu, 17 Oct 2019 12:05:44 -0700 (PDT)
Received: from [192.168.1.19] (ciu246.neoplus.adsl.tpnet.pl. [83.31.44.246])
        by smtp.gmail.com with ESMTPSA id t4sm2928777wrm.13.2019.10.17.12.05.43
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 17 Oct 2019 12:05:44 -0700 (PDT)
Subject: Re: [PATCH v5 3/3] leds: Add control of the voltage/current regulator
 to the LED core
To:     Jean-Jacques Hiblot <jjhiblot@ti.com>,
        Daniel Thompson <daniel.thompson@linaro.org>
Cc:     Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org, dmurphy@ti.com, tomi.valkeinen@ti.com
References: <20190923102059.17818-1-jjhiblot@ti.com>
 <20190923102059.17818-4-jjhiblot@ti.com>
 <3e648fab-638f-4aa0-dda9-8ddba6562751@gmail.com> <20191013120937.GK5653@amd>
 <eb8c0df1-0d5b-11d0-9965-3192fa5675f3@ti.com>
 <20191014123849.fhvmqn7dyu6bminc@holly.lan>
 <939cf695-b955-da01-2a2b-3b5ce0dc3660@gmail.com>
 <5e4ad085-4091-2c43-4001-3378076fd455@ti.com>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=jacek.anaszewski@gmail.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <202913d4-8926-e143-160f-b9652d1467cc@gmail.com>
Date:   Thu, 17 Oct 2019 21:05:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <5e4ad085-4091-2c43-4001-3378076fd455@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 10/16/19 10:13 AM, Jean-Jacques Hiblot wrote:
> 
> On 14/10/2019 20:48, Jacek Anaszewski wrote:
>> On 10/14/19 2:38 PM, Daniel Thompson wrote:
>>> On Mon, Oct 14, 2019 at 12:49:07PM +0200, Jean-Jacques Hiblot wrote:
>>>> On 13/10/2019 14:09, Pavel Machek wrote:
>>>>> Hi!
>>>>>
>>>>>> I must say I'm not a big fan of this change.
>>>>>> It adds a bunch of code to the LED core and gives small
>>>>>> functionality in a reward. It may also influence maximum
>>>>>> software blinking rate, so I'd rather avoid calling
>>>>>> regulator_enable/disable when timer trigger is set.
>>>>>>
>>>>>> It will of course require more code.
>>>>>>
>>>>>> Since AFAIR Pavel was original proponent of this change then
>>>>>> I'd like to see his opinion before we move on to discussing
>>>>>> possible improvements to this patch.
>>>>> Was I?
>>>>>
>>>>> Okay, this series looks quite confusing to me. First, 1/3 looks
>>>>> "interesting" (would have to analyze it way more).
>>>>>
>>>>> Second, 3/3... So we have a LED driver _and_ a regulator? So yes, the
>>>>> chip driving a LED is usually ... voltage/current regulator. What is
>>>>> second regulator doing there? Is that a common setup?
>>>> This is quite common with current-sink LED drivers.
>>>>
>>>> The setup looks like this:
>>>>
>>>> +-----------+
>>>> |           |
>>>> | Regulator |
>>>> |           +------------------------+
>>>> |           |                        |
>>>> +-----------+                      __|__
>>>>                                     \   /
>>>>           +---------------------+    \ / led
>>>>           |                     |     V
>>>>           |    Led Driver       |   --+--
>>>>           |                     |     |
>>>>           |                     |     |
>>>>           |                +----------+
>>>>           |              \      |
>>>>           |               \     |
>>>>           |                +    |
>>>>           |                |    |
>>>>           +---------------------+
>>>>                            |
>>>>                         +--+--+
>>>>                         ///////
>>>>
>>>>
>>>> Only the regulator usually does not supply only one LED.
>>> Given questions have been raised about the complexity of the change I
>>> wondered whether, for a system with this topology, the regulator
>>> could/should be enabled when the LED driver driver probes?
>> And this is how are doing that now.
>>
>> Moreover, just after seeing your ASCII art it has become obvious to me
>> that we can't simply do regulator_disable() while setting brightness to
>> LED_OFF since it can result in powering off the LED controller, which
>> would need to be reconfigured on next transition to
>> brightness > LED_OFF.
> 
> That is a problem only if the LED driver is powered by the same
> regulator, which is not the case in the diagram.

Indeed.

> This series make sense only for boards where LEDs have a dedicated
> voltage rail or can be modeled this way.
> 
> My use case is a LED panel driven by a LED current-sink controller that
> uses both a PWM-style control for brightness AND a active-low enable
> pin. If the enable pin is not HIGH, the panel is never completely dark
> even if the LED brightness is set to 0. I modeled this switch with a
> fixed-voltage regulator  which is a common way of doing it (it is after
> all how this things is done inside the panel).

So this use case would justify that feature. Nonetheless the solution
you proposed for mitigating regulator handling overhead may not work
for high blink rates. Maybe it would be worth to add an optional sysfs
file for determining if regulator should be handled by LED core.

The file could be created by LED class drivers that would demand it.

-- 
Best regards,
Jacek Anaszewski
