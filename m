Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB279277B3F
	for <lists+linux-leds@lfdr.de>; Thu, 24 Sep 2020 23:49:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726658AbgIXVtd (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 24 Sep 2020 17:49:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726205AbgIXVtd (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 24 Sep 2020 17:49:33 -0400
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63008C0613CE;
        Thu, 24 Sep 2020 14:49:33 -0700 (PDT)
Received: by mail-ed1-x541.google.com with SMTP id g4so466672edk.0;
        Thu, 24 Sep 2020 14:49:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=zIlU+zToQaAHqNEqYrQAGg0nqDkaUEztkKgkJGCqUco=;
        b=d12x+teJeyi0XVXstH/DEx5oV2emff1Oy2ZIr8CqaFOiFg+j+A7zkSR8BIy5nypzZ9
         WwfPzUUyKLMwfyDqN68CPC0kbQFRQB9WF4LE47A4dq7myeEEYTpukuMWxRHR6JO0YwT9
         znVkv+0TaVdV1M0y4KcXWm5TfN1hm2FMzgOKgD3vDRmxoXNG5C61UZRzHGp6Gr6xoiM3
         B5b3/oCfhJTwuBJHBhCiP1fukxo1g1covphWInSoHzQ9D+dbqOYjPEW9+vQ8z1ULJTSu
         Lf6QTqoPzzJGfe+PENfE/LvJlKuLx/TBaB0gpCv37Va5IHwQe9CrtOwjztuGTn42Epeg
         wf2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=zIlU+zToQaAHqNEqYrQAGg0nqDkaUEztkKgkJGCqUco=;
        b=UYu/OJ2Swqb0DlUFi9/QMiJVatRlO7XweZLrTrvkstJ562Hd2ciUcxsyhkSuqfiw9V
         JyE52Z11w7Y7Kd+dnh2fsOuV3Ugdt68avTbzvcwDsAYgSDVpApqCchxgt90ebnpN0fx1
         9DQjYPsolm0gnlEKMCxDxdT0woEzgnDyymsHUhDKcbOYX7kAnJ7QFR59s/P9wKzUMfYf
         1abmgXPzORxiTFyV6PARjP0xkGWcWAr8WIfgv1y+bh0YmDpJSQPU9UB6R9MNrTlnT2Qs
         iie9rsqFNRcxezvu1F7BtT98DhZP9UbRgQo5r0K8fn1cis2MA43TkFmpqOHfaNi07Fvf
         XNzA==
X-Gm-Message-State: AOAM531BKQsSyePq2XRk0nwLjGqXNG8X9yzGnD/6R9jUwgPyAXmNFz+H
        zN6bGcwxJGKbKBpJcG3l7Mk=
X-Google-Smtp-Source: ABdhPJxVW8jdAPuRbEprN28aAWCKRwi1/0OWvpvwnX1Rlub7Co7a3kMpuv5eRcFM0Tjszg2Rivgypg==
X-Received: by 2002:a05:6402:1d03:: with SMTP id dg3mr802579edb.249.1600984171457;
        Thu, 24 Sep 2020 14:49:31 -0700 (PDT)
Received: from ?IPv6:2a01:110f:b59:fd00:d922:8747:4a19:cf92? ([2a01:110f:b59:fd00:d922:8747:4a19:cf92])
        by smtp.gmail.com with ESMTPSA id u26sm475777ejj.11.2020.09.24.14.49.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Sep 2020 14:49:30 -0700 (PDT)
Subject: Re: [PATCH v4 2/2] leds: mt6360: Add LED driver for MT6360
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
References: <1600865452-19649-1-git-send-email-gene.chen.richtek@gmail.com>
 <1600865452-19649-3-git-send-email-gene.chen.richtek@gmail.com>
 <e82fd413-8343-5115-150e-02d96eecf6e8@gmail.com>
 <CAE+NS35BwgGD3GjKv5E08ECqKCortJxB-yHP9-kteqPiKm9edQ@mail.gmail.com>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <a24c797d-c8be-3cf6-d825-6ff368c570ec@gmail.com>
Date:   Thu, 24 Sep 2020 23:49:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <CAE+NS35BwgGD3GjKv5E08ECqKCortJxB-yHP9-kteqPiKm9edQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 9/24/20 8:21 AM, Gene Chen wrote:
> Jacek Anaszewski <jacek.anaszewski@gmail.com> 於 2020年9月24日 週四 上午5:49寫道：
> 
>>
>> Hi Gene,
>>
>> Thank you for the update. I have some more comments below.
>>
>> On 9/23/20 2:50 PM, Gene Chen wrote:
>>> From: Gene Chen <gene_chen@richtek.com>
>>>
>>> Add MT6360 LED driver include 2-channel Flash LED with torch/strobe mode,
>>> and 4-channel RGB LED support Register/Flash/Breath Mode
>>>
>>> Signed-off-by: Gene Chen <gene_chen@richtek.com>
>>> ---
>>>    drivers/leds/Kconfig       |  11 +
>>>    drivers/leds/Makefile      |   1 +
>>>    drivers/leds/leds-mt6360.c | 705 +++++++++++++++++++++++++++++++++++++++++++++
>>>    3 files changed, 717 insertions(+)
>>>    create mode 100644 drivers/leds/leds-mt6360.c
>>>
>>> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
>>> index 1c181df..5561b08 100644
>>> --- a/drivers/leds/Kconfig
>>> +++ b/drivers/leds/Kconfig
>>> @@ -271,6 +271,17 @@ config LEDS_MT6323
>>>          This option enables support for on-chip LED drivers found on
>>>          Mediatek MT6323 PMIC.
>>>
>>> +config LEDS_MT6360
>>> +     tristate "LED Support for Mediatek MT6360 PMIC"
>>> +     depends on LEDS_CLASS_FLASH && OF
>>> +     depends on V4L2_FLASH_LED_CLASS || !V4L2_FLASH_LED_CLASS
>>> +     depends on MFD_MT6360
>>> +     help
>>> +       This option enables support for dual Flash LED drivers found on
>>> +       Mediatek MT6360 PMIC.
>>> +       Independent current sources supply for each flash LED support torch
>>> +       and strobe mode.
>>> +
>>>    config LEDS_S3C24XX
>>>        tristate "LED Support for Samsung S3C24XX GPIO LEDs"
>>>        depends on LEDS_CLASS
>>> diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
>>> index c2c7d7a..5596427 100644
>>> --- a/drivers/leds/Makefile
>>> +++ b/drivers/leds/Makefile
>>> @@ -66,6 +66,7 @@ obj-$(CONFIG_LEDS_MIKROTIK_RB532)   += leds-rb532.o
>>>    obj-$(CONFIG_LEDS_MLXCPLD)          += leds-mlxcpld.o
>>>    obj-$(CONFIG_LEDS_MLXREG)           += leds-mlxreg.o
>>>    obj-$(CONFIG_LEDS_MT6323)           += leds-mt6323.o
>>> +obj-$(CONFIG_LEDS_MT6360)            += leds-mt6360.o
>>>    obj-$(CONFIG_LEDS_NET48XX)          += leds-net48xx.o
>>>    obj-$(CONFIG_LEDS_NETXBIG)          += leds-netxbig.o
>>>    obj-$(CONFIG_LEDS_NIC78BX)          += leds-nic78bx.o
>>> diff --git a/drivers/leds/leds-mt6360.c b/drivers/leds/leds-mt6360.c
>>> new file mode 100644
>>> index 0000000..1c3486e
>>> --- /dev/null
>>> +++ b/drivers/leds/leds-mt6360.c
>>> @@ -0,0 +1,705 @@
>>> +// SPDX-License-Identifier: GPL-2.0-only
>>> +
>>> +#include <linux/delay.h>
>>> +#include <linux/init.h>
>>> +#include <linux/interrupt.h>
>>> +#include <linux/kernel.h>
>>> +#include <linux/led-class-flash.h>
>>> +#include <linux/module.h>
>>> +#include <linux/platform_device.h>
>>> +#include <linux/property.h>
>>> +#include <linux/regmap.h>
>>> +#include <media/v4l2-flash-led-class.h>
>>> +
>>> +enum {
>>> +     MT6360_LED_ISNK1 = 0,
>>> +     MT6360_LED_ISNK2,
>>> +     MT6360_LED_ISNK3,
>>> +     MT6360_LED_ISNK4,
>>
>> One question about these ISINKs - how are they exploited in your device?
>> Are these LEDs used to indicate camera activity or it is one RGB LED
>> for status? And what functionality has the remaining amber one (sticking
>> to the naming from your DT bindings)?
>>
>> Can you share how the documenation for this device describes the purpose
>> of these sinks, if it does it at all?
>>
>> I got probably mislead by your naming in the driver and got fixed on
>> their function as camera activity indicators, for which V4L2 has
>> support. If that is not the case, then you'd better switch to using
>> multicolor framework for all four "indicator" LEDs.
>>
> 
> It's one RGB LED for status, not for camera.
> 
> The MT6360 integrates a three-channel RGB LED driver, designed to
> provide a variety of lighting effects for mobile device applications.
> The RGB LED driver includes a smart LED string controller, and it can
> drive 3 channels of LEDs with a sink current of up to 24mA. The
> default setting of RGB_ISINK1 is auto mode for TA charging indicator,
> and RGB_ISINK1 also supports software mode. It provides three
> operation modes for the RGB LEDs: flash mode, breath mode, and
> register mode. The device can increase or decrease the brightness of
> the RGB LEDs upon command via the I2C interface. The RGB_ISINK4
> provide more sink current up to 150mA, which we can moonlight mode.
> 
> Do you mean we should remove "isink register v4l2 device, only need
> register ledclass device"?

I'd say that in addition to the LED flash class device, you should
allow for registering LED multicolor device comprising RGB LEDs,
and one LED class device for ISINK4 (you could even add
LED_FUNCTION_MOONLIGHT for it).

I wonder what others think.

[...]
>>> +static int mt6360_led_probe(struct platform_device *pdev)
>>> +{
>>> +     struct mt6360_priv *priv;
>>> +     struct fwnode_handle *child;
>>> +     size_t count;
>>> +     int i = 0, ret;
>>> +
>>> +     count = device_get_child_node_count(&pdev->dev);
>>> +     if (!count || count > MT6360_MAX_LEDS)
>>
>> Please add dev_err() here.
>>
> 
> dev_err(&pdev->dev, "No child node or node count over max led number
> %d\n", count);

If we will exploit also LED multicolor class then DT bindings will
look different, so let's discuss this detail later.

-- 
Best regards,
Jacek Anaszewski
