Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA82029C1C6
	for <lists+linux-leds@lfdr.de>; Tue, 27 Oct 2020 18:28:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1819192AbgJ0R2W (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 27 Oct 2020 13:28:22 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:54138 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1819190AbgJ0R2T (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 27 Oct 2020 13:28:19 -0400
Received: by mail-wm1-f68.google.com with SMTP id d78so2143077wmd.3;
        Tue, 27 Oct 2020 10:28:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=jHNrAaSQ3QPMQMLs/NiD36NA12e7sFRL6CjasTy60tY=;
        b=sRONzpWbOTrTbXWLhwnjJ4pSlr9TlSsb0qJD+a4NOoGC3sHh2dK/CgSLDY+Kir7phZ
         LVHY3joN3uGKNM5fpcFjslSJzqk5jTDD31JLy7gwx+As8wd64ZNSKCMcAqUzIGHY2m4n
         7pQdkvmexEfaBbVPGIwKGfjs3umIdU6H1cPr8mDWxsKXoutN8Y7kRGsPcKNCf2R47eEp
         IOuiMrDoVtRiBzbtwHatEJoGJVcMtMAzRCT3/MxLaPppSf4KsQal1vqEOEBfOJ8kUD6C
         2zgyYj16PENWBrtRdxTF6HHFDPd94vRxJhwmL5VFZCX1u7aG2kr32e9p3ba2arBedtU0
         RvKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=jHNrAaSQ3QPMQMLs/NiD36NA12e7sFRL6CjasTy60tY=;
        b=GnqQg0eSvGGuD32uH1mAVrCrJenD66HdGnjXktATav+vtfV0+mXjgCds1jK2c9+A8E
         s1o5VB/KViSNNtGXfwWDuykbfqKpAmzy1+pgMCGAH/VldA0+R8bEi1FK9WkJNJj8uv1E
         JlkmxiVc1BJybqY8Mmb0fWgNY22MxDCRDD0vgksVUDT21WeQfI6k3eeCjxnEIYQTrqCf
         4GDN1yR0t47uMunqNWY9g3nxVOhm2Og8x4M8EzRXNPraDleSobCn7wnQtdx24ibt+IFj
         efJxEgVfbt9kogfQ8ESsgP+nDRh7SrAHMeR4tO62P4UijBExtYLKAi30CBr4jKjYUkil
         QG6g==
X-Gm-Message-State: AOAM531uhcu4+zBX2kv1MeOrE4qQ4rn5N+/L9+7mZ9PSKoTaJKDkcgDe
        v7MsLaYHndum0cImBTmunfI=
X-Google-Smtp-Source: ABdhPJwOyy0uznYALf7m26/ANTk1qCm2a4G5ZZqF1+WWAI9V86Ho3xQ3yfOEOJmZZdLM1DktsR8VWQ==
X-Received: by 2002:a7b:cc8b:: with SMTP id p11mr3977468wma.100.1603819696811;
        Tue, 27 Oct 2020 10:28:16 -0700 (PDT)
Received: from ?IPv6:2a01:110f:b59:fd00:659b:3847:24e3:b881? ([2a01:110f:b59:fd00:659b:3847:24e3:b881])
        by smtp.gmail.com with ESMTPSA id b5sm2807131wrs.97.2020.10.27.10.28.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2020 10:28:16 -0700 (PDT)
Subject: Re: [PATCH v5 2/2] leds: mt6360: Add LED driver for MT6360
To:     Gene Chen <gene.chen.richtek@gmail.com>
Cc:     Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Dan Murphy <dmurphy@ti.com>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Gene Chen <gene_chen@richtek.com>, Wilma.Wu@mediatek.com,
        shufan_lee@richtek.com, cy_huang@richtek.com,
        benjamin.chao@mediatek.com
References: <1602034966-3524-1-git-send-email-gene.chen.richtek@gmail.com>
 <1602034966-3524-3-git-send-email-gene.chen.richtek@gmail.com>
 <5a9b31c4-739c-06fc-2015-ed474993ad22@gmail.com>
 <CAE+NS35Y41mFKNhj+54BeeSYFu2J9BtvMWOxyMcf9a==39cbdA@mail.gmail.com>
 <8925db23-5cc4-3c5f-932a-461fe6450dad@gmail.com>
 <CAE+NS379bgtRotqzioR+Ya3mE1kZrKfe9qV=W2p=hH7Omrn8Hw@mail.gmail.com>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <1bb76c54-14af-6c78-4623-77c6678b262e@gmail.com>
Date:   Tue, 27 Oct 2020 18:28:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <CAE+NS379bgtRotqzioR+Ya3mE1kZrKfe9qV=W2p=hH7Omrn8Hw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 10/27/20 10:28 AM, Gene Chen wrote:
> Jacek Anaszewski <jacek.anaszewski@gmail.com> 於 2020年10月21日 週三 上午5:47寫道：
>>
>> On 10/20/20 8:44 AM, Gene Chen wrote:
>>> Jacek Anaszewski <jacek.anaszewski@gmail.com> 於 2020年10月9日 週五 上午5:51寫道：
>>>>
>>>> Hi Gene,
>>>>
>>>> On 10/7/20 3:42 AM, Gene Chen wrote:
>>>>> From: Gene Chen <gene_chen@richtek.com>
>>>>>
>>>>> Add MT6360 LED driver include 2-channel Flash LED with torch/strobe mode,
>>>>> 3-channel RGB LED support Register/Flash/Breath Mode, and 1-channel for
>>>>> moonlight LED.
>>>>>
>>>>> Signed-off-by: Gene Chen <gene_chen@richtek.com>
>>>>> ---
>>>>>     drivers/leds/Kconfig       |  12 +
>>>>>     drivers/leds/Makefile      |   1 +
>>>>>     drivers/leds/leds-mt6360.c | 783 +++++++++++++++++++++++++++++++++++++++++++++
>>>>>     3 files changed, 796 insertions(+)
>>>>>     create mode 100644 drivers/leds/leds-mt6360.c
>>>>>
>>>>> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
>>>>> index 1c181df..c7192dd 100644
>>>>> --- a/drivers/leds/Kconfig
>>>>> +++ b/drivers/leds/Kconfig
>>>>> @@ -271,6 +271,18 @@ config LEDS_MT6323
>>>>>           This option enables support for on-chip LED drivers found on
>>>>>           Mediatek MT6323 PMIC.
>>>>>
>>>>> +config LEDS_MT6360
>>>>> +     tristate "LED Support for Mediatek MT6360 PMIC"
>>>>> +     depends on LEDS_CLASS_FLASH && OF
>>>>> +     depends on LEDS_CLASS_MULTICOLOR
>>>>
>>>> Since CONFIG_LED_CLASS_MULTICOLOR can be turned off you need to have
>>>> below instead:
>>>>
>>>> depends on LEDS_CLASS_MULTICOLOR || !!LEDS_CLASS_MULTICOLOR

My typo here, should be one "!":

depends on LEDS_CLASS_MULTICOLOR || !LEDS_CLASS_MULTICOLOR

And you should also have

depends on LEDS_CLASS_FLASH || !LEDS_CLASS_FLASH

But to make it work correctly you would have to add registration
stubs to include/linux/led-class-flash.h similarly to LED mc stubs
in include/linux/led-class-multicolor.h.

>>>>
>>>> Unless you want to prevent enabling the driver without RGB LED,
>>>> but that does not seem to be reasonable at first glance.
>>>>
>>>
>>> May I change to "select LEDS_CLASS_MULTICOLOR"?
>>> I suppose RGB always use multicolor mode.
>>
>> You will also have moonlight LED that will not need multicolor
>> framework. Is it somehow troublesome to keep "depends on"?
>>
> 
> If only use ML LED and FLED,  DTSI will only define ML LED and FLED.
> Therefore, the drivers probe will not register rgb multicolor device.

Please test your use case again with my fixed "depends on".

In case when there is only ML LED and FLED in the DT it should
register both devices if LEDS_CLASS_FLASH is turned on.
Multicolor framework has nothing to do in this case.

But if you additionally had MC LED node, then it should
be registered only if LEDS_CLASS_MULTICOLOR is enabled.

Similarly, when FLED node is present, but LEDS_CLASS_FLASH
is off, and LEDS_CLASS_MULTICOLOR is on, the driver should still
compile, but register only LED MC device (if its node is present).

Possible should be also the case when both LEDS_CLASS_FLASH
and LEDS_CLASS_MULTICOLOR are off. Then only LED class device
for ML LED will be registered (provided there is ML DT node).
But to make it possible you should have also "depends on LEDS_CLASS"
in the Kconfig entry.

> I will remove "depends", use "select" instead.

-- 
Best regards,
Jacek Anaszewski
