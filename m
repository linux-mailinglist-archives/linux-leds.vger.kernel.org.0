Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4393E2B4F34
	for <lists+linux-leds@lfdr.de>; Mon, 16 Nov 2020 19:26:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731655AbgKPSZh (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 16 Nov 2020 13:25:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729555AbgKPSZh (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 16 Nov 2020 13:25:37 -0500
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14303C0613CF;
        Mon, 16 Nov 2020 10:25:37 -0800 (PST)
Received: by mail-ej1-x641.google.com with SMTP id oq3so25785162ejb.7;
        Mon, 16 Nov 2020 10:25:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=iMNNFITQTVl6xH9FIhmZAJHI+XOQfJPxPlTQJWECZ4E=;
        b=Nm4uUOPdDKQPmpez1awCv77luKnrY1dTONrakQhSAqvfUuUI+Uiymcop9TBfqu/dsS
         sqb+7quMnWJ9wgObFrqMMhufxRs7YQb/B/7jaclPcQ8OzpeLfVMiG9UaJx3KdgHHucWE
         Wz1NPAiHzWkBUNs3fIcH4Bo0coThYIaeuJbGH5KgwGWGQcemM99JwPTkj3jiB8YWRSIe
         WjvFqy6E6SrxOrkYg3y75Zg4GUUVCpRZkCuBLWy3ChkhHIb4lgO9dTn8jQjqEl3Qw7r5
         TYst/PDWQHbStpxIlLmauJtpilbLTQLb2qDRTFLyNNpp3NNE+u4dPElY5b3dFSnxA87a
         bwUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=iMNNFITQTVl6xH9FIhmZAJHI+XOQfJPxPlTQJWECZ4E=;
        b=hJyAegnoJ4V4RPYoflqPzDO9uhGhsvfFDxnfhPqbeerpDmnL/mlpAd5/1PVfYrsa+X
         F9wbniVvbK7ber4d3g+nHqZGtH9RYPiaV0cyPQeTPN3rBMHTN5WaNnB2ZsyRLbslFf/o
         9oDlGv5lN+/7ku0AQdUGmUj+nMRMFybWmZH84iDJFUcGM6CNtDzFfQFFf9QUSD1gMvS9
         QZZUOL4WrmmQEkyuO/Fk9Gtt0qg1sVBUID5C8tD/YZjGg4PTKUk0bsjJpulKIRCKdGCW
         LuL4M00y1YP96+lVsody9CzWhBNtRLJJxciTzmfnxfilKwKLgRwbakbTilJY2/wAwNK2
         6sJA==
X-Gm-Message-State: AOAM530qIM9PfER6zGyaf0OdB7Fq7rGnoudlzoAZyvuTqAS+bxOk+++4
        ZXv7OTwvdsmQe5xyNLjdU/Q=
X-Google-Smtp-Source: ABdhPJyCa6sw3pwdJXhlWemEGMWgcpkeE5rSnyk3jlh1qlo9F5tW6ISm+hGVEDCgVQYrKP3pMnOxQw==
X-Received: by 2002:a17:906:cb2:: with SMTP id k18mr17223486ejh.71.1605551135755;
        Mon, 16 Nov 2020 10:25:35 -0800 (PST)
Received: from ?IPv6:2a01:110f:b59:fd00:9993:6bc3:e972:e19d? ([2a01:110f:b59:fd00:9993:6bc3:e972:e19d])
        by smtp.gmail.com with ESMTPSA id m16sm10738454eja.58.2020.11.16.10.25.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2020 10:25:35 -0800 (PST)
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
 <af17141f-23ae-063d-ade2-42dfdf611d81@gmail.com>
 <CAE+NS37-vQ4LLbCv-1+WsLe7qEQdVvBhhNKK4=oDj5VtWuaeoQ@mail.gmail.com>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <aab50d87-c696-6480-b5c7-2f75df19f50f@gmail.com>
Date:   Mon, 16 Nov 2020 19:25:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <CAE+NS37-vQ4LLbCv-1+WsLe7qEQdVvBhhNKK4=oDj5VtWuaeoQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 11/16/20 11:01 AM, Gene Chen wrote:
> Jacek Anaszewski <jacek.anaszewski@gmail.com> 於 2020年10月31日 週六 上午6:34寫道：
>>
>> On 10/30/20 9:51 AM, Gene Chen wrote:
>>> Jacek Anaszewski <jacek.anaszewski@gmail.com> 於 2020年10月28日 週三 上午1:28寫道：
>>>>
>>>> On 10/27/20 10:28 AM, Gene Chen wrote:
>>>>> Jacek Anaszewski <jacek.anaszewski@gmail.com> 於 2020年10月21日 週三 上午5:47寫道：
>>>>>>
>>>>>> On 10/20/20 8:44 AM, Gene Chen wrote:
>>>>>>> Jacek Anaszewski <jacek.anaszewski@gmail.com> 於 2020年10月9日 週五 上午5:51寫道：
>>>>>>>>
>>>>>>>> Hi Gene,
>>>>>>>>
>>>>>>>> On 10/7/20 3:42 AM, Gene Chen wrote:
>>>>>>>>> From: Gene Chen <gene_chen@richtek.com>
>>>>>>>>>
>>>>>>>>> Add MT6360 LED driver include 2-channel Flash LED with torch/strobe mode,
>>>>>>>>> 3-channel RGB LED support Register/Flash/Breath Mode, and 1-channel for
>>>>>>>>> moonlight LED.
>>>>>>>>>
>>>>>>>>> Signed-off-by: Gene Chen <gene_chen@richtek.com>
>>>>>>>>> ---
>>>>>>>>>       drivers/leds/Kconfig       |  12 +
>>>>>>>>>       drivers/leds/Makefile      |   1 +
>>>>>>>>>       drivers/leds/leds-mt6360.c | 783 +++++++++++++++++++++++++++++++++++++++++++++
>>>>>>>>>       3 files changed, 796 insertions(+)
>>>>>>>>>       create mode 100644 drivers/leds/leds-mt6360.c
>>>>>>>>>
>>>>>>>>> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
>>>>>>>>> index 1c181df..c7192dd 100644
>>>>>>>>> --- a/drivers/leds/Kconfig
>>>>>>>>> +++ b/drivers/leds/Kconfig
>>>>>>>>> @@ -271,6 +271,18 @@ config LEDS_MT6323
>>>>>>>>>             This option enables support for on-chip LED drivers found on
>>>>>>>>>             Mediatek MT6323 PMIC.
>>>>>>>>>
>>>>>>>>> +config LEDS_MT6360
>>>>>>>>> +     tristate "LED Support for Mediatek MT6360 PMIC"
>>>>>>>>> +     depends on LEDS_CLASS_FLASH && OF
>>>>>>>>> +     depends on LEDS_CLASS_MULTICOLOR
>>>>>>>>
>>>>>>>> Since CONFIG_LED_CLASS_MULTICOLOR can be turned off you need to have
>>>>>>>> below instead:
>>>>>>>>
>>>>>>>> depends on LEDS_CLASS_MULTICOLOR || !!LEDS_CLASS_MULTICOLOR
>>>>
>>>> My typo here, should be one "!":
>>>>
>>>> depends on LEDS_CLASS_MULTICOLOR || !LEDS_CLASS_MULTICOLOR
>>>>
>>>> And you should also have
>>>>
>>>> depends on LEDS_CLASS_FLASH || !LEDS_CLASS_FLASH
>>>>
>>>> But to make it work correctly you would have to add registration
>>>> stubs to include/linux/led-class-flash.h similarly to LED mc stubs
>>>> in include/linux/led-class-multicolor.h.
>>>>
>>>>>>>>
>>>>>>>> Unless you want to prevent enabling the driver without RGB LED,
>>>>>>>> but that does not seem to be reasonable at first glance.
>>>>>>>>
>>>>>>>
>>>>>>> May I change to "select LEDS_CLASS_MULTICOLOR"?
>>>>>>> I suppose RGB always use multicolor mode.
>>>>>>
>>>>>> You will also have moonlight LED that will not need multicolor
>>>>>> framework. Is it somehow troublesome to keep "depends on"?
>>>>>>
>>>>>
>>>>> If only use ML LED and FLED,  DTSI will only define ML LED and FLED.
>>>>> Therefore, the drivers probe will not register rgb multicolor device.
>>>>
>>>> Please test your use case again with my fixed "depends on".
>>>>
>>>> In case when there is only ML LED and FLED in the DT it should
>>>> register both devices if LEDS_CLASS_FLASH is turned on.
>>>> Multicolor framework has nothing to do in this case.
>>>>
>>>> But if you additionally had MC LED node, then it should
>>>> be registered only if LEDS_CLASS_MULTICOLOR is enabled.
>>>>
>>>> Similarly, when FLED node is present, but LEDS_CLASS_FLASH
>>>> is off, and LEDS_CLASS_MULTICOLOR is on, the driver should still
>>>> compile, but register only LED MC device (if its node is present).
>>>>
>>>
>>> I think this case only register LED device, not LED "MC" device.
>>> Because our FLASH is not a multicolor device.
>>
>> No, here I was describing following setup:
>>
>> - DT FLED node is present, CONFIG_LEDS_CLASS_FLASH is off
>> - DT MC node is present, CONFIG_LEDS_CLASS_MULTICOLOR is on
>>
>> ML LED presence in DT is irrelevant in this case.
>> It should be always registered if there is corresponding DT node
>> and LEDS_CLASS is on.
>>
> 
> As a long time discussion, we conclude some rules about MT6360 LED driver.
> FLED is necessary, so Kconfig depends on LED_CLASS_FLASH

Maybe it is necessary in your use case, but probably it is possible to
use the device without FLED. If so, then you should allow users
disabling it. Therefore you should have:

depends on LEDS_CLASS_FLASH || !LEDS_CLASS_FLASH

> ML LED is optional, which is registered as led class device.
> RGB LED can be either simple led class device or multicolor device,
> which is decided in DT node
> If Multicolor LED DT node is exist, it should be register multicolor
> device success.

But only if CONFIG_LEDS_CLASS_MULTICOLOR is enabled.

> Maybe it is more specific to send a new patch?
> 
> Sample DT as below
> LED "red" is simple led class device, LED "green&blue" is multicolor devices.
> led@0 {
>          reg = <0>;
>          function = LED_FUNCTION_INDICATOR;
>          color = <LED_COLOR_ID_RED>;
>          led-max-microamp = <24000>;
> };
> led@6 {
>          reg = <6>;
>          function = LED_FUNCTION_INDICATOR;
>          color = <LED_COLOR_ID_MULTI>;
> 
>          led@1 {
>                  reg = <1>;
>                  function = LED_FUNCTION_INDICATOR;
>                  color = <LED_COLOR_ID_GREEN>;
>                  led-max-microamp = <24000>;
>          };
>          led@2 {
>                  reg = <2>;
>                  function = LED_FUNCTION_INDICATOR;
>                  color = <LED_COLOR_ID_BLUE>;
>                  led-max-microamp = <24000>;
>          };
> };

It looks OK.

>>>> Possible should be also the case when both LEDS_CLASS_FLASH
>>>> and LEDS_CLASS_MULTICOLOR are off. Then only LED class device
>>>> for ML LED will be registered (provided there is ML DT node).
>>>> But to make it possible you should have also "depends on LEDS_CLASS"
>>>> in the Kconfig entry.
>>>>
>>>
>>> According to your suggestion,
>>> depends on LED_CLASS && LEDS_CLASS_FLASH && OF
>>
>> s/LED_CLASS/LEDS_CLASS/
>>
>> And you have to remove LEDS_CLASS_FLASH from above line.
>>
>>> depends on LEDS_CLASS_MULTICOLOR || !!LEDS_CLASS_MULTICOLOR
>>
>> s/!!LEDS_CLASS_MULTICOLOR/!LEDS_CLASS_MULTICOLOR/
>>
>>> depends on LEDS_CLASS_FLASH || !LEDS_CLASS_FLASH
>>> depends on MFD_MT6360
>>
>> You will need V4L2_FLASH_LED_CLASS dependency as well, to avoid
>> build break, when it is set to 'm'.
>>
>> To recap, following block of dependencies is required:
>>
>> depends on LEDS_CLASS && OF
>> depends on LEDS_CLASS_MULTICOLOR || !LEDS_CLASS_MULTICOLOR
>> depends on LEDS_CLASS_FLASH || !LEDS_CLASS_FLASH
>> depends on V4L2_FLASH_LED_CLASS || !V4L2_FLASH_LED_CLASS
>> depends on MFD_MT6360
>>
> 
> LEDS_MT6360 depends on LEDS_CLASS_FLASH, and LEDS_CLASS_FLASH depends
> on LEDS_CLASS
> Is "depends on LEDS_CLASS" still needed?

Yes, because you should allow disabling CONFIG_LEDS_CLASS_FLASH.
In such a case driver should still compile and register ML LED class
device when it has corresponding DT node.

>>> and source code add constraint
>>>
>>> #if IS_ENABLED(CONFIG_LEDS_CLASS_MULTICOLOR)
>>>       ret = devm_led_classdev_multicolor_register_ext(parent, &led->rgb,
>>> init_data);
>>> #endif
>>>
>>> #if IS_ENABLED(CONFIG_LEDS_CLASS_FLASH)
>>>       ret = devm_led_classdev_flash_register_ext(parent, &led->flash, init_data);
>>> #endif
>>
>> No, the guards should be in headers. That's why I recommended adding
>> no ops for LED flash class registration functions in previous email.
>>
>> Please compare include/linux/led-class-multicolor.h and do similar
>> changes in include/linux/led-class-flash.h.
>>
> 
> ACK, I will submit a fixed patch about leds-class-flash.h.
> 
> By the way, if CONFIG_LED_CLASS_MULTICOLOR is not enabled and we don't
> use #if IS_ENABLED,
> according to led-class-multicolor.h return -EINVAL,
> we will register multicolor device fail and cause probe fail.

Good point. So led-class-multicolor.h no-ops need to be fixed to return
0 instead of -EINVAL.

And no-ops in include/linux/led-class-flash.h should also return 0.

-- 
Best regards,
Jacek Anaszewski
