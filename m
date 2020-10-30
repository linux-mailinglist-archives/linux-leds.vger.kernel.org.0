Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7E632A10EF
	for <lists+linux-leds@lfdr.de>; Fri, 30 Oct 2020 23:34:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725839AbgJ3Wen (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 30 Oct 2020 18:34:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725815AbgJ3Wen (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 30 Oct 2020 18:34:43 -0400
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com [IPv6:2a00:1450:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCDECC0613D5;
        Fri, 30 Oct 2020 15:34:42 -0700 (PDT)
Received: by mail-ed1-x544.google.com with SMTP id k9so8281521edo.5;
        Fri, 30 Oct 2020 15:34:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ejZA//8CR8vKHBVBVoHn31P+SbVlR2kYuuF5lBhYi7A=;
        b=fVpPUCDET3duNIv0x/AFrK3Ozs7QKpM3wdXeOT+U9BTPVFSkRn3aTJa4YHpmWalKLX
         KYTylHbj8THL5tSL0Q9tpqubri7f5ZxDx17ILB6Fa2IbwPsZ/KPXmtDs04lUZfSERa/+
         RTVkopfN9j5hDAObRWGM6jLIxl2UrSnbEuN3HDiJjpTzSVddIUC/UvQVXD3o8YIZlJ4N
         LodVBDrSCUTRXzVVoTVfqoGSwpuY8VX9HU3fOM+w6x2xHhZKLfXYfi5xbrYFTQAFWJoK
         bhq6EW1eTjoLOzrhLo62HNkWI5mhcppjynOSx5AwW9egsTSOqY84hq10k/uS1fxSmECu
         ymwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ejZA//8CR8vKHBVBVoHn31P+SbVlR2kYuuF5lBhYi7A=;
        b=WqdukSldFF/0ERCXBnEZZqTsDAcjn/5+iLkENCuBk53E6qg+TMFjQH1Uo/pf75sOf6
         He8xly1GsJLbCIPeTnYWGo228JcuPpmJ/25v8xi53z33m3tAPu+6Nz4Mi/aaFDcaEp1f
         Utb7yZe+qnBciEkmT5CP6BNsdOv7sPy4ZdgMdXJQ+6PGwWH5oH8msrPxjO1ojJIeOFjN
         FU+lxy3jJXw1ZrmLstSSfcvc6PUVX5fX51O9rw1FbrBKwZ8Ae9+Da5UhvCrt2N+mIDok
         j4WmrnPhuRF1sSS9aU6SZyNEfuuTLjLSrPv+BxdfLlb6v1aynVhKT62VNNl2ve8VFEqy
         NYJg==
X-Gm-Message-State: AOAM533bIf6jnya0uiaSrMvBJB6xca0+JdEMHnlf9uzQEWGhAjnsTZYT
        3kbDT6sgAfuvqJR62iSRvug=
X-Google-Smtp-Source: ABdhPJyMgcKGc2OExx+BJ1jqfdmuV+OVoyy+JHRlrlq7cf4IF3iMPtBlQiUoAnN9QGoPze475i4WUw==
X-Received: by 2002:a50:871d:: with SMTP id i29mr4916526edb.300.1604097281484;
        Fri, 30 Oct 2020 15:34:41 -0700 (PDT)
Received: from ?IPv6:2a01:110f:b59:fd00:28e3:24bf:72a1:43e4? ([2a01:110f:b59:fd00:28e3:24bf:72a1:43e4])
        by smtp.gmail.com with ESMTPSA id e17sm3456095ejh.64.2020.10.30.15.34.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2020 15:34:40 -0700 (PDT)
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
 <1bb76c54-14af-6c78-4623-77c6678b262e@gmail.com>
 <CAE+NS35z7_ZUdm6gRNw2z7Ozs+1A8_Vtj_9x-F65RLd4QqDFDA@mail.gmail.com>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <af17141f-23ae-063d-ade2-42dfdf611d81@gmail.com>
Date:   Fri, 30 Oct 2020 23:34:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <CAE+NS35z7_ZUdm6gRNw2z7Ozs+1A8_Vtj_9x-F65RLd4QqDFDA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 10/30/20 9:51 AM, Gene Chen wrote:
> Jacek Anaszewski <jacek.anaszewski@gmail.com> 於 2020年10月28日 週三 上午1:28寫道：
>>
>> On 10/27/20 10:28 AM, Gene Chen wrote:
>>> Jacek Anaszewski <jacek.anaszewski@gmail.com> 於 2020年10月21日 週三 上午5:47寫道：
>>>>
>>>> On 10/20/20 8:44 AM, Gene Chen wrote:
>>>>> Jacek Anaszewski <jacek.anaszewski@gmail.com> 於 2020年10月9日 週五 上午5:51寫道：
>>>>>>
>>>>>> Hi Gene,
>>>>>>
>>>>>> On 10/7/20 3:42 AM, Gene Chen wrote:
>>>>>>> From: Gene Chen <gene_chen@richtek.com>
>>>>>>>
>>>>>>> Add MT6360 LED driver include 2-channel Flash LED with torch/strobe mode,
>>>>>>> 3-channel RGB LED support Register/Flash/Breath Mode, and 1-channel for
>>>>>>> moonlight LED.
>>>>>>>
>>>>>>> Signed-off-by: Gene Chen <gene_chen@richtek.com>
>>>>>>> ---
>>>>>>>      drivers/leds/Kconfig       |  12 +
>>>>>>>      drivers/leds/Makefile      |   1 +
>>>>>>>      drivers/leds/leds-mt6360.c | 783 +++++++++++++++++++++++++++++++++++++++++++++
>>>>>>>      3 files changed, 796 insertions(+)
>>>>>>>      create mode 100644 drivers/leds/leds-mt6360.c
>>>>>>>
>>>>>>> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
>>>>>>> index 1c181df..c7192dd 100644
>>>>>>> --- a/drivers/leds/Kconfig
>>>>>>> +++ b/drivers/leds/Kconfig
>>>>>>> @@ -271,6 +271,18 @@ config LEDS_MT6323
>>>>>>>            This option enables support for on-chip LED drivers found on
>>>>>>>            Mediatek MT6323 PMIC.
>>>>>>>
>>>>>>> +config LEDS_MT6360
>>>>>>> +     tristate "LED Support for Mediatek MT6360 PMIC"
>>>>>>> +     depends on LEDS_CLASS_FLASH && OF
>>>>>>> +     depends on LEDS_CLASS_MULTICOLOR
>>>>>>
>>>>>> Since CONFIG_LED_CLASS_MULTICOLOR can be turned off you need to have
>>>>>> below instead:
>>>>>>
>>>>>> depends on LEDS_CLASS_MULTICOLOR || !!LEDS_CLASS_MULTICOLOR
>>
>> My typo here, should be one "!":
>>
>> depends on LEDS_CLASS_MULTICOLOR || !LEDS_CLASS_MULTICOLOR
>>
>> And you should also have
>>
>> depends on LEDS_CLASS_FLASH || !LEDS_CLASS_FLASH
>>
>> But to make it work correctly you would have to add registration
>> stubs to include/linux/led-class-flash.h similarly to LED mc stubs
>> in include/linux/led-class-multicolor.h.
>>
>>>>>>
>>>>>> Unless you want to prevent enabling the driver without RGB LED,
>>>>>> but that does not seem to be reasonable at first glance.
>>>>>>
>>>>>
>>>>> May I change to "select LEDS_CLASS_MULTICOLOR"?
>>>>> I suppose RGB always use multicolor mode.
>>>>
>>>> You will also have moonlight LED that will not need multicolor
>>>> framework. Is it somehow troublesome to keep "depends on"?
>>>>
>>>
>>> If only use ML LED and FLED,  DTSI will only define ML LED and FLED.
>>> Therefore, the drivers probe will not register rgb multicolor device.
>>
>> Please test your use case again with my fixed "depends on".
>>
>> In case when there is only ML LED and FLED in the DT it should
>> register both devices if LEDS_CLASS_FLASH is turned on.
>> Multicolor framework has nothing to do in this case.
>>
>> But if you additionally had MC LED node, then it should
>> be registered only if LEDS_CLASS_MULTICOLOR is enabled.
>>
>> Similarly, when FLED node is present, but LEDS_CLASS_FLASH
>> is off, and LEDS_CLASS_MULTICOLOR is on, the driver should still
>> compile, but register only LED MC device (if its node is present).
>>
> 
> I think this case only register LED device, not LED "MC" device.
> Because our FLASH is not a multicolor device.

No, here I was describing following setup:

- DT FLED node is present, CONFIG_LEDS_CLASS_FLASH is off
- DT MC node is present, CONFIG_LEDS_CLASS_MULTICOLOR is on

ML LED presence in DT is irrelevant in this case.
It should be always registered if there is corresponding DT node
and LEDS_CLASS is on.

> 
>> Possible should be also the case when both LEDS_CLASS_FLASH
>> and LEDS_CLASS_MULTICOLOR are off. Then only LED class device
>> for ML LED will be registered (provided there is ML DT node).
>> But to make it possible you should have also "depends on LEDS_CLASS"
>> in the Kconfig entry.
>>
> 
> According to your suggestion,
> depends on LED_CLASS && LEDS_CLASS_FLASH && OF

s/LED_CLASS/LEDS_CLASS/

And you have to remove LEDS_CLASS_FLASH from above line.

> depends on LEDS_CLASS_MULTICOLOR || !!LEDS_CLASS_MULTICOLOR

s/!!LEDS_CLASS_MULTICOLOR/!LEDS_CLASS_MULTICOLOR/

> depends on LEDS_CLASS_FLASH || !LEDS_CLASS_FLASH
> depends on MFD_MT6360

You will need V4L2_FLASH_LED_CLASS dependency as well, to avoid
build break, when it is set to 'm'.

To recap, following block of dependencies is required:

depends on LEDS_CLASS && OF
depends on LEDS_CLASS_MULTICOLOR || !LEDS_CLASS_MULTICOLOR
depends on LEDS_CLASS_FLASH || !LEDS_CLASS_FLASH
depends on V4L2_FLASH_LED_CLASS || !V4L2_FLASH_LED_CLASS
depends on MFD_MT6360

> 
> and source code add constraint
> 
> #if IS_ENABLED(CONFIG_LEDS_CLASS_MULTICOLOR)
>      ret = devm_led_classdev_multicolor_register_ext(parent, &led->rgb,
> init_data);
> #endif
> 
> #if IS_ENABLED(CONFIG_LEDS_CLASS_FLASH)
>      ret = devm_led_classdev_flash_register_ext(parent, &led->flash, init_data);
> #endif

No, the guards should be in headers. That's why I recommended adding
no ops for LED flash class registration functions in previous email.

Please compare include/linux/led-class-multicolor.h and do similar 
changes in include/linux/led-class-flash.h.

> =============
> 
> Or Should I seperate two drivers?
> one for RGB LED, one for ML LED and FLED

This would incur unnecessary code duplication.

-- 
Best regards,
Jacek Anaszewski
