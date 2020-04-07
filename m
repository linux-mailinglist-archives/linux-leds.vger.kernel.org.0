Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 64AC31A16B8
	for <lists+linux-leds@lfdr.de>; Tue,  7 Apr 2020 22:23:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726277AbgDGUXb (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 7 Apr 2020 16:23:31 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:55453 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726370AbgDGUXa (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 7 Apr 2020 16:23:30 -0400
Received: by mail-wm1-f67.google.com with SMTP id e26so3020558wmk.5
        for <linux-leds@vger.kernel.org>; Tue, 07 Apr 2020 13:23:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=BiCps6vbiZbIIkaC+xH2aIUN8IFOe0u1RbaysaGz3U0=;
        b=Cn9w5tqlozsHyMLWEnWmMIOxDe9s/huHBxgz1jcEqlhe3t9VJoVprPgyx6JNbyX+2/
         f2C4rmChEXVtEh57Q9w5VxUyRwdbcaLkXWipkO8/egn3Qcy9p4y9oZoMT0iOnHLxOzvH
         uGPmHs8dwA9DQZbQf5AFw+9h4fTgJUcQrHIq/pVSDo7hHxENJ20B7IzPpsctcbu2X5Eh
         ep2aLOeYpOCj2JZ7jxxFbi+YZA2MwbQJxZxFc3O/ywpAvlqG1lg4OCDJ4fVDnIcj0Mw9
         B2t09PCE614zhhNo3/QdGajUH7oQC/FxaJVcARh5cp3R8id1ofzikT1MaFUlio/4B8mj
         gcLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=BiCps6vbiZbIIkaC+xH2aIUN8IFOe0u1RbaysaGz3U0=;
        b=saVnI9KZrg5fU4vyQjU8n9DYyzrzk21MLA/gydaPjzKedtuJJafoeAYLlVfR4jsJVv
         yhI4iWFTntITD6tMMtsuUFOQaObjtQ+6C0oUA36YBs+jb/J/kX3n0EDtBXMLgekUMqY8
         WVV71EriPF7dWtlvTERBdfQXoPee0YIIdfzwnymNS+8uHwHApKhYzaQDwI+ZmuwF2Q6f
         fCZKP5Ud/cyQMvwhyCbWyKKR3i7FYUiDOqANWtDNLaHtEI1HQWisy2bkSTvcy8UEibJY
         gkwSXOGYsz3QvWxQK05WTgX+q7jERVQBmQ8L6z/152MUEn63XRNQaWhKlkLZ9gJYLL1/
         AFOg==
X-Gm-Message-State: AGi0PuZ48S15uNhXisoSMnYbyD5Qbrkdv76tCs7whnBYfUkKHcRHTkkx
        8btVDXuUbO+62m66V7UrIpsAFgXz
X-Google-Smtp-Source: APiQypJTc5uMgoGxesnvLF6tmfEnXhNqH5m2r/n2hIcHqNOTJnngNWjEOlRaQgNzETHYeZxjdBd49g==
X-Received: by 2002:a1c:f407:: with SMTP id z7mr1035858wma.36.1586291007619;
        Tue, 07 Apr 2020 13:23:27 -0700 (PDT)
Received: from [192.168.1.23] (acgc191.neoplus.adsl.tpnet.pl. [83.9.230.191])
        by smtp.gmail.com with ESMTPSA id j31sm26588419wre.36.2020.04.07.13.23.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2020 13:23:26 -0700 (PDT)
Subject: Re: Cleanups in "next" tree
To:     Pavel Machek <pavel@ucw.cz>
Cc:     linux-leds@vger.kernel.org
References: <20200322115906.GA10623@duo.ucw.cz>
 <3a103317-b9fb-5d0f-6944-0114b9af1629@gmail.com> <20200402225745.GA9830@amd>
 <a4802e70-106b-3476-536f-1d8798ce156f@gmail.com>
 <20200407072854.GA18673@amd.ucw.cz>
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
 AQYVCAIJCgsDFgIBAh4BAheAAhkBFiEEvx38ClaPBfeVdXCQvWpQHLeLfCYFAl5O5twFCRIR
 arsAIQkQvWpQHLeLfCYWIQS/HfwKVo8F95V1cJC9alAct4t8JhIgEACtWz3zR5uxaU/GozHh
 iZfiyUTomQpGNvAtjjZE6UKO/cKusCcvOv0FZbfGDajcMIU8f3FUxJdybrY86KJ9a3tOddal
 KtB2of3/Ot/EIQjpQb28iLoY8AWnf9G4LQZtoXHiUcOAVPkKgCFnz1IENK3uvyCB9c9//KhE
 cRZkeAIE2sTmcI4k7/dNHpRI4nha/ZytPwTdM3BjAfxxQI5nMLptm1ksEBI7W1SDOnY3dG2J
 QWmqpxIefjgyiy0aU+jAw1x3RdZrokVD8OCJiJM8+Z36imarEzqIRQLh+sDNLfV3wEaBn/HU
 0Vj6VrRyW2K0jAYToRFD3Ay/eGSfOOAEr/LoMr3NBTDkRLEWdOozllOwADEY9wH0BLHMp2WI
 hXGOStNiroIEhW2/E0udFJo9b3VoOWKWl+zcUP/keLxVUCXhpmeS7VpSkqsrCVqTVkEc8AXq
 xhJXeIQJC/XRpCYFc3pFUlVCFViF1ZU2OzE8TndRzzD8e/9ETrJ1GAYa78tNopYhY6AbGlv4
 U01nIC93bK07O4IhtBAKsiUz3JPX/KA/dXJOC86qP373cVWVYPvZW+KOya9/7rz0MGR1az9G
 HqJB7q7DVcCQKt9Egae/goznnXbET6ivCNKbqkH3n/JpiPIxkaXVrbn3QlVtzYpROsS/pCOp
 5Evig7kql5L0aYJIZs4zBFsKioYWCSsGAQQB2kcPAQEHQFCKEG5pCgebryz66pTa9eAo+r8y
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
 +Pi0GjVpEYQVWfm0PTCxNPOzOzGR4QB3BNFvABEBAAHCwZMEGAEIACYCGwwWIQS/HfwKVo8F
 95V1cJC9alAct4t8JgUCXk7nGAUJEhFq9wAhCRC9alAct4t8JhYhBL8d/ApWjwX3lXVwkL1q
 UBy3i3wmVBwP/RNNux3dC513quZ0hFyU6ZDTxbiafprLN2PXhmLslxPktJgW/xO5xp16OXkW
 YgNI/TKxj3+oSu+MhEAhAFA2urFWHyqedfqdndQTzbv4yqNuyhGupzPBWNSqqJ2NwKJc9f2R
 wqYTXVYIO+6KLa32rpl7xvJISkx06s70lItFJjyOf6Hn1y5RBMwQN9hP2YxLhYNO3rmlNSVy
 7Z/r95lZTDnnUCuxBZxnjx/pMHJ8LZtKY0t7D0esA+zYGUrmoAGUpNWEBP+uSL+f8rhjSAL0
 HgoRL39ixg5Bm0MzJn9z3or++Pl5bRnSvHy6OKh7rzTjCwaGoZD+6LHBwPFPlmInX1H+yHrX
 lu1uPAdqG5xcsZAZFTxBRMEnYu1yYebDSA9x+iulggMZQcWC2GvHCaKIpKcFY8XCxk7Hbl5c
 8hcPKWOy16NLO6Y66Ws4kMedXuNUHe4zBLVlRbcYUdgT9Brw8nxmxu3KhEVsJkwOpXLUDuzo
 hQNfg9em95lpAK+VOTocke8PSESy3GbEtmoMueW3caSeDHb5dRP6WrndaYhEOzAA/KjuPU7J
 LMXOABOMIq+R38y7e2B3TnVDCrccdZDseFPUWmH0cGCGihH/j2UZG+PImrSDCh3h5MedVHGo
 sI62tmWm0q6lrljwSZmMZ30w1QaGmdFpI3Q6V+nZ7TZldI3x
Message-ID: <7be0ce37-235d-9069-ea6e-1d353cc14729@gmail.com>
Date:   Tue, 7 Apr 2020 22:23:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200407072854.GA18673@amd.ucw.cz>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 4/7/20 9:28 AM, Pavel Machek wrote:
> Hi!
> 
>>> I'm sorry I failed to meet your high expectations... But I don't
>>> believe I done anything completely outside of usual kernel procedures.
>>
>> I believe code review is quite usual kernel procedure.
> 
> I don't disagree with that.
> 
>>> Could you list the patches and objections you have?
>>
>> I already expressed my concerns regarding Turris Omnia patch.
> 
> Ok.
> 
>> My comments regarding remaining patches:
>>
>> - "Make label "white:power" to be consistent with"
>>
>> I disagree here. "system" was OK.
> 
> It was too vague... I know the hardware and it is a LED above power
> button used as a power indicator.
> 
>> - "Warn about old defines that probably should not be used."
>>
>> Obsolete is only LED_FULL, so the comment is in wrong line
> 
> No, all of them are bad. Maybe LED_OFF could be used going forward,
> but... it is simply easier to write 0. The type is not really an en
> enumeration, it is brightness, with variable maximum value.

In this case brightness should be turned into an int and the change
should be applied throughout the whole kernel. Otherwise it is
questionable - why all enums are made obsolete if the type of struct
led_classdev's brightness property is still enum led_brightness?
Do we have some replacement? - one could ask.

> 
>> - "Group LED functions according to functionality, and add some"
>>
>> You're adding here some random comments referencing obsolete
>> naming. I think that it is enough to say what is current standard.
> 
> Ok, I'll drop that part. But I really want to get that documented
> _somewhere_, because obsolete naming is currently in use, and we won't
> be able to change it :-(.

You've pushed it out anyway...

>> Also, I had a patch [0] describing standard LED functions in my LED
>> naming patch set, but it was not merged. It could be worth getting
>> back to it at this occasion.
> 
> I'll take a look.
> 
> Best regards,
> 									Pavel
> 

-- 
Best regards,
Jacek Anaszewski
