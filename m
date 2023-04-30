Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EE57A6F2A69
	for <lists+linux-leds@lfdr.de>; Sun, 30 Apr 2023 21:10:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229478AbjD3TKB (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 30 Apr 2023 15:10:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230494AbjD3TJ6 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 30 Apr 2023 15:09:58 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D73910E7
        for <linux-leds@vger.kernel.org>; Sun, 30 Apr 2023 12:09:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1682881749;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=juCuIg/b7bzO1iGibdEGDHdoi2EpeHt7AWQE6EggAao=;
        b=SD9bWMfIJq1J43dAc3U2Tx3JLR/aHZ0TDwlj6UDJoL1U5lYF9Q6xvewA7XrvWMa7Msd7ks
        eLMrSR2iRkG9OGOmhEOmI1GVnFUeTTJKB7OJoNKQM5/UgPvcFvI98zQa30mxSkW379te+8
        H+g7sPGBpicbThOfdmj4ZvgTR3vdTIE=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-257-P4ybi8_aN2K9DBYiIC_zOQ-1; Sun, 30 Apr 2023 15:09:07 -0400
X-MC-Unique: P4ybi8_aN2K9DBYiIC_zOQ-1
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-50bc6b01030so153926a12.3
        for <linux-leds@vger.kernel.org>; Sun, 30 Apr 2023 12:09:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682881745; x=1685473745;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=juCuIg/b7bzO1iGibdEGDHdoi2EpeHt7AWQE6EggAao=;
        b=crGtO7vtwpcPrPKNbsRHllV+9iTKHd/I35h5KJ9UQnp2xEo1+3ZKmZ8UcTT6yjHfhV
         ztE8t1ppbJLFeAp0zko00tX9HC81spfoN7Js9ymopiqQeXDZCjLMK1Gl8wV3b5A4GvDs
         uff0hzaoZ9e6iP7gWjRfsJ0KQIicPQkrsT8Cgc8onxflBj0lsqRtLSPKF62Y8oRdTS5V
         y557nhpERrM0Vr0LH+eyHus6z4E0bz7HFb7JN4VMVA1FxJXc7paSsloHEboridt5BpXO
         IT+9DG61fLW0U27AUNyIm5E2Ih1FyJN55RF+12YBC5hGCL89EP3HJfyZAXZtnEHGRX51
         NuiA==
X-Gm-Message-State: AC+VfDzlXObNI5SQADftQ1WO+pszGSm7yMwHxixUUmkd/5MzqkukFI28
        nMKOXCXnQ6if0bW5hKYsO7twVq1hwxQb6l9gPSS919B8KzZddKck0FVOpyGHCA/q1sWyZGC0xqw
        Y7IdBOylePASySVym6/42pA==
X-Received: by 2002:a17:906:9754:b0:953:4d9e:4dc5 with SMTP id o20-20020a170906975400b009534d9e4dc5mr12229693ejy.22.1682881745650;
        Sun, 30 Apr 2023 12:09:05 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6i9sHLX6kbhnDLMb/qSBoJzYbGlF0z9F9eODTj7DzppVdI5gathixOkBQH+xeVHGJq5Vo8WQ==
X-Received: by 2002:a17:906:9754:b0:953:4d9e:4dc5 with SMTP id o20-20020a170906975400b009534d9e4dc5mr12229683ejy.22.1682881745355;
        Sun, 30 Apr 2023 12:09:05 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id tp24-20020a170907c49800b00957304d68a7sm12046087ejc.202.2023.04.30.12.09.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 30 Apr 2023 12:09:04 -0700 (PDT)
Message-ID: <5127d077-5c27-7a85-4e21-92aaae6ff511@redhat.com>
Date:   Sun, 30 Apr 2023 21:09:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 1/5] leds: Add Intel Cherry Trail Whiskey Cove PMIC LED
 driver
To:     Lee Jones <lee@kernel.org>
Cc:     Pavel Machek <pavel@ucw.cz>, Yauhen Kharuzhy <jekhor@gmail.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        linux-leds@vger.kernel.org
References: <20230420123741.57160-1-hdegoede@redhat.com>
 <20230420123741.57160-2-hdegoede@redhat.com>
 <20230424141505.GL50521@google.com>
 <5f6452f3-4013-8dad-c220-3ad2f4922993@redhat.com>
 <20230427165726.GC620451@google.com>
Content-Language: en-US, nl
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230427165726.GC620451@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi,

On 4/27/23 18:57, Lee Jones wrote:
> On Mon, 24 Apr 2023, Hans de Goede wrote:
> 
>> Hi Lee,
>>
>> On 4/24/23 16:15, Lee Jones wrote:
>>> On Thu, 20 Apr 2023, Hans de Goede wrote:
>>>
>>>> From: Yauhen Kharuzhy <jekhor@gmail.com>
>>>>
>>>> Add support for LEDs connected to the Intel Cherry Trail Whiskey Cove
>>>> PMIC. Charger and general-purpose LEDs are supported. Hardware blinking
>>>> is implemented, breathing is not.
>>>>
>>>> This driver was tested with Lenovo Yoga Book notebook.
>>>>
>>>> Changes by Hans de Goede (in response to review of v2):
>>>> - Since the PMIC is connected to the battery any changes we make to
>>>>   the LED settings are permanent, even surviving reboot / poweroff.
>>>>   Save LED1 register settings on probe() and if auto-/hw-control was
>>>>   enabled on probe() restore the settings on remove() and shutdown().
>>>> - Delay switching LED1 to software control mode to first brightness write.
>>>> - Use dynamically allocated drvdata instead of a global drvdata variable.
>>>> - Ensure the LED is on when activating blinking.
>>>> - Fix CHT_WC_LED_EFF_BREATHING val ((3 << 1) rather then BIT(3)).
>>>>
>>>> Link: https://lore.kernel.org/r/20190212205901.13037-2-jekhor@gmail.com
>>>> Signed-off-by: Yauhen Kharuzhy <jekhor@gmail.com>
>>>> Co-developed-by: Hans de Goede <hdegoede@redhat.com>
>>>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>>>> ---
>>>> Changes in v2:
>>>> - Update comment about YB1 kernel source usage for register info
>>>> - Replace "cht-wc::" LED name prefix with "platform::"
>>>> - Add leds-cht-wcove to list of drivers using "platform::charging" in
>>>>   Documentation/leds/well-known-leds.txt
>>>> - Bail from cht_wc_leds_brightness_set() on first error
>>>> - Make default blink 1Hz, like sw-blink default blink
>>>> ---
>>>>  Documentation/leds/well-known-leds.txt |   2 +-
>>>>  drivers/leds/Kconfig                   |  11 +
>>>>  drivers/leds/Makefile                  |   1 +
>>>>  drivers/leds/leds-cht-wcove.c          | 373 +++++++++++++++++++++++++
>>>>  4 files changed, 386 insertions(+), 1 deletion(-)
>>>>  create mode 100644 drivers/leds/leds-cht-wcove.c
>>>
>>> Generally nice.  Couple of small nits.
>>>
>>>> diff --git a/Documentation/leds/well-known-leds.txt b/Documentation/leds/well-known-leds.txt
>>>> index 2160382c86be..7640debee6c0 100644
>>>> --- a/Documentation/leds/well-known-leds.txt
>>>> +++ b/Documentation/leds/well-known-leds.txt
>>>> @@ -65,7 +65,7 @@ Phones usually have multi-color status LED.
>>>>  
>>>>  * Power management
>>>>  
>>>> -Good: "platform:*:charging" (allwinner sun50i)
>>>> +Good: "platform:*:charging" (allwinner sun50i, leds-cht-wcove)
>>>>  
>>>>  * Screen
>>>>  
>>>> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
>>>> index 9dbce09eabac..90835716f14a 100644
>>>> --- a/drivers/leds/Kconfig
>>>> +++ b/drivers/leds/Kconfig
>>>> @@ -122,6 +122,17 @@ config LEDS_BCM6358
>>>>  	  This option enables support for LEDs connected to the BCM6358
>>>>  	  LED HW controller accessed via MMIO registers.
>>>>  
>>>> +config LEDS_CHT_WCOVE
>>>> +	tristate "LED support for Intel Cherry Trail Whiskey Cove PMIC"
>>>> +	depends on LEDS_CLASS
>>>> +	depends on INTEL_SOC_PMIC_CHTWC
>>>> +	help
>>>> +	  This option enables support for charger and general purpose LEDs
>>>> +	  connected to the Intel Cherrytrail Whiskey Cove PMIC.
>>>> +
>>>> +	  To compile this driver as a module, choose M here: the module
>>>> +	  will be called leds-cht-wcove.
>>>> +
>>>>  config LEDS_CPCAP
>>>>  	tristate "LED Support for Motorola CPCAP"
>>>>  	depends on LEDS_CLASS
>>>> diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
>>>> index d30395d11fd8..78b5b69f9c54 100644
>>>> --- a/drivers/leds/Makefile
>>>> +++ b/drivers/leds/Makefile
>>>> @@ -19,6 +19,7 @@ obj-$(CONFIG_LEDS_BCM6328)		+= leds-bcm6328.o
>>>>  obj-$(CONFIG_LEDS_BCM6358)		+= leds-bcm6358.o
>>>>  obj-$(CONFIG_LEDS_BD2802)		+= leds-bd2802.o
>>>>  obj-$(CONFIG_LEDS_BLINKM)		+= leds-blinkm.o
>>>> +obj-$(CONFIG_LEDS_CHT_WCOVE)		+= leds-cht-wcove.o
>>>>  obj-$(CONFIG_LEDS_CLEVO_MAIL)		+= leds-clevo-mail.o
>>>>  obj-$(CONFIG_LEDS_COBALT_QUBE)		+= leds-cobalt-qube.o
>>>>  obj-$(CONFIG_LEDS_COBALT_RAQ)		+= leds-cobalt-raq.o
>>>> diff --git a/drivers/leds/leds-cht-wcove.c b/drivers/leds/leds-cht-wcove.c
>>>> new file mode 100644
>>>> index 000000000000..908965e25552
>>>> --- /dev/null
>>>> +++ b/drivers/leds/leds-cht-wcove.c
>>>> @@ -0,0 +1,373 @@
>>>> +// SPDX-License-Identifier: GPL-2.0
>>>> +/*
>>>> + * Driver for LEDs connected to the Intel Cherry Trail Whiskey Cove PMIC
>>>> + *
>>>> + * Copyright 2019 Yauhen Kharuzhy <jekhor@gmail.com>
>>>> + * Copyright 2023 Hans de Goede <hansg@kernel.org>
>>>> + *
>>>> + * Register info comes from the Lenovo Yoga Book Android kernel sources:
>>>> + * YB1_source_code/kernel/cht/drivers/misc/charger_gp_led.c.
>>>
>>> How does one browse to this?
>>
>> There is a tarbal with kernel sources available for download from
>> the support page for the Android version of the Yoga Book (yb1-x90f / yb1-x90l).
>>
>> This is the file path within that tarbal. I add a deep-link
>> to the tarbal here, but I'm afraid that will not be a stable link.
>>
>> Or I guess I could omit the filename too? I added the filename because
>> even if you have the tarbal the file is still sort of non trivial to find.
> 
> That's not the issue I have with it.
> 
> How about:
> 
>   <tarball>/YB1_source_code/kernel/cht/drivers/misc/charger_gp_led.c
> 
> Or:
> 
>   file:///YB1_source_code/kernel/cht/drivers/misc/charger_gp_led.c
> 
> [...]
> 
>>>> +enum led_brightness cht_wc_leds_brightness_get(struct led_classdev *cdev)
>>>> +{
>>>> +	struct cht_wc_led *led = container_of(cdev, struct cht_wc_led, cdev);
>>>> +	unsigned int val;
>>>> +	int ret;
>>>> +
>>>> +	mutex_lock(&led->mutex);
>>>> +
>>>> +	ret = regmap_read(led->regmap, led->regs->ctrl, &val);
>>>> +	if (ret < 0) {
>>>> +		dev_err(cdev->dev, "Failed to read LED CTRL reg: %d\n", ret);
>>>> +		ret = LED_OFF;
>>>
>>>
>>> include/linux/leds.h:
>>>
>>> /* This is obsolete/useless. We now support variable maximum brightness. */
>>> enum led_brightness {
>>>    LED_OFF         = 0,
>>>    LED_ON          = 1,
>>>    LED_HALF        = 127,
>>>    LED_FULL        = 255,
>>> };
>>
>> I know but LED_OFF is still somewhat useful, it makes it
>> clear that wat is being returned is a brightness value
>> where as "ret = 0" reads like returning success.
>>
>> With that said if you prefer 0/1 over LED_OFF / LED_ON
>> I'm happy to replace them all ?
> 
> This is probably for Pavel to answer.
> 
> Ideally it'll either be:
> 
>  "still useful and thus not deprecated"
> 
> Or:
> 
>  "deprecated and therefore must not be used"
> 
> I'm less happy with a deprecated but still okay to use limbo-land.

I understand.

I'll just replace the use of LED_OFF with 0 for the v3 I'm
preparing, as well as address all your other review remarks.

Regards,

Hans


