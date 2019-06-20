Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 072D94DCED
	for <lists+linux-leds@lfdr.de>; Thu, 20 Jun 2019 23:42:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725921AbfFTVm3 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 20 Jun 2019 17:42:29 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:36217 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725911AbfFTVm3 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 20 Jun 2019 17:42:29 -0400
Received: by mail-wm1-f67.google.com with SMTP id u8so4566103wmm.1;
        Thu, 20 Jun 2019 14:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=V/+Pcj3pCtoU+EHKmdrhq3JyXQiHGnVwZAqOpI52Ra0=;
        b=IyYSvPhGwdUYoSakLN2RNIKqnfG1nQCIBrdFEYoduYHou/WWHaUj8+5PHUbyk0LUYg
         I7ao7rPjWcWMk0dxRfewtRMn2x3VxDziVhlI/2d/zUTGX/lMCHnE4udEnlm0DJfyDDYy
         AJYfyP3ej2cJdcDvYoQORELtSzvMHpPMcWK6j8NPK6yB5ahVejlb2ku/V7llpK1Kos9B
         ns8Vmaqwl7dyD0QTiwSYov3JhCGh5lEHMv5ebke/eW8bSFADLBq4ut9LFAIfozkkMQrL
         SHgh0CfR4R7iyw0Wn1VIYeE5wdwoGk2tizLfg/Nn3IA5T2j+QXstB8SrW0ae9LjTu4ns
         mH4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=V/+Pcj3pCtoU+EHKmdrhq3JyXQiHGnVwZAqOpI52Ra0=;
        b=sDskCp71YdG3rL4NuWNLpxmHqZlaoOi3rNH1rNwWKinvP7l3bf2bC6QocJkeahAdXw
         4DXCSvO+yd8obM9zQMyBr+WNP2HiabuIaO0FgwZ8TMrKv7JwWFY9el95TUjnFaCPWs2l
         wXm32CdBNAkpFCfQAyOfmTIQODXwI/9ui8UOJF1lGm7AdLpFq02iBOU47ydA5LYDzcns
         T8Imj8d6eBfrpDiHj7yWeYoHmoTSMPrdFNJusm3UnsRF1+RExSqzyRGF24D6x67TF6Xl
         A8WaOyIuOb/55Wtj/Y++JpD8MZw1wxrgYQK8+HT0lqM10cCCfN4OkkoYPSHr4XzuM2Wf
         wXgw==
X-Gm-Message-State: APjAAAVV6fcR1x5uCNbdXql6IHew6JpWz1LHoyqQEV0jnwzkrPD8m5VC
        CXBuaCRr8Zt4VoOC+ZOCqmcg5qGg
X-Google-Smtp-Source: APXvYqxuFobiPcwL8TnVeP/+gYa+0DsxrmEh2RcdTcifzw1FsOO9BjIkrV4tLecMDoMRyp3x8FEZOQ==
X-Received: by 2002:a1c:4d6:: with SMTP id 205mr905737wme.148.1561066945743;
        Thu, 20 Jun 2019 14:42:25 -0700 (PDT)
Received: from [192.168.1.17] (bfz244.neoplus.adsl.tpnet.pl. [83.28.63.244])
        by smtp.gmail.com with ESMTPSA id c6sm1201073wma.25.2019.06.20.14.42.24
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 20 Jun 2019 14:42:25 -0700 (PDT)
Subject: Re: [PATCH v3 6/9] leds: multicolor: Introduce a multicolor class
 definition
To:     Dan Murphy <dmurphy@ti.com>, pavel@ucw.cz, robh+dt@kernel.org
Cc:     devicetree@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20190523190820.29375-1-dmurphy@ti.com>
 <20190523190820.29375-7-dmurphy@ti.com>
 <2f91bd2b-1d69-c9c7-c20b-a7396c9e1ecd@gmail.com>
 <41353876-8671-3353-b27c-ab057699bbbe@ti.com>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <63a2baa3-a784-bea1-b4cf-afe91663c285@gmail.com>
Date:   Thu, 20 Jun 2019 23:42:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <41353876-8671-3353-b27c-ab057699bbbe@ti.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Dan,

On 6/20/19 10:06 PM, Dan Murphy wrote:
> Jacek
> 
> Thanks for the review

You're welcome.

> On 6/20/19 11:10 AM, Jacek Anaszewski wrote:
>> Hi Dan,
>>
>> Thank you for the v5.
>>
>> I will confine myself to commenting only some parts since
>> the rest will undergo rework due to removal of sync API.
>>
>> On 5/23/19 9:08 PM, Dan Murphy wrote:
>>> Introduce a multicolor class that groups colored LEDs
>>> within a LED node.
>>>
>>> The framework allows for dynamically setting individual LEDs
>>> or setting brightness levels of LEDs and updating them virtually
>>> simultaneously.
>>>
>>> Signed-off-by: Dan Murphy <dmurphy@ti.com>
>>> ---
>>>   drivers/leds/Kconfig                 |  10 +
>>>   drivers/leds/Makefile                |   1 +
>>>   drivers/leds/led-class-multicolor.c  | 421 +++++++++++++++++++++++++++
>>>   include/linux/led-class-multicolor.h |  95 ++++++
>>>   4 files changed, 527 insertions(+)
>>>   create mode 100644 drivers/leds/led-class-multicolor.c
>>>   create mode 100644 include/linux/led-class-multicolor.h
>>>
>>> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
>>> index 0414adebb177..0696a13c9527 100644
>>> --- a/drivers/leds/Kconfig
>>> +++ b/drivers/leds/Kconfig
>>> @@ -29,6 +29,16 @@ config LEDS_CLASS_FLASH
>>>         for the flash related features of a LED device. It can be built
>>>         as a module.
>>>   +config LEDS_CLASS_MULTI_COLOR
>>> +    tristate "LED Mulit Color LED Class Support"
>>> +    depends on LEDS_CLASS
>>> +    help
>>> +      This option enables the multicolor LED sysfs class in 
>>> /sys/class/leds.
>>> +      It wraps LED Class and adds multicolor LED specific sysfs 
>>> attributes
>>> +      and kernel internal API to it. You'll need this to provide 
>>> support
>>> +      for multicolor LEDs that are grouped together. This class is not
>>> +      intended for single color LEDs.  It can be built as a module.
>>
>> extra whitespace:
>>
>> s/ It can/It can/
> 
> Ack
> 
>>
>> [...]
>>> +
>>> +static int multicolor_set_brightness(struct led_classdev *led_cdev,
>>> +                 enum led_brightness brightness)
>>> +{
>>> +    struct led_classdev_mc *mcled_cdev = lcdev_to_mccdev(led_cdev);
>>> +    struct led_classdev_mc_data *data = mcled_cdev->data;
>>> +    struct led_multicolor_ops *ops = mcled_cdev->ops;
>>> +    struct led_classdev_mc_priv *priv;
>>> +    unsigned long state = brightness;
>>> +    int adj_value;
>>> +    ssize_t ret = -EINVAL;
>>> +
>>> +    mutex_lock(&led_cdev->led_access);
>>> +
>>> +    if (ops->set_module_brightness) {
>>> +        ret = ops->set_module_brightness(mcled_cdev, state);
>>> +        goto unlock;
>>> +    }
>>> +
>>> +    list_for_each_entry(priv, &data->color_list, list) {
>>> +        if (state && priv->brightness && priv->max_brightness) {
>>> +            adj_value = state * ((priv->brightness * 100) / 
>>> priv->max_brightness);
>>> +            adj_value = adj_value / 100;
>>
>> Why the multiplication an then division by 100? And priv->max_brightness
>> stays unaltered? This changes the proportions. My python script works
>> just fine without those.
> 
> Because the kernel does not do floating point math and the calculation 
> is using the ratio
> 
> between the intensity and max_intensity and multiplying against the 
> requested brightness.
> 
> priv->intensity = 100 (This is the current intensity of the color LED)
> 
> priv->max_intensity = 255
> 
> state = 80 (This is the requested cluster brightness)
> 
> 100/255 = 0.392 which is 0.
> 
> 0 * 80 = 0 this is not what the value should be
> 
> But with the multiplier.
> 
> 10000/255 = 39.2 which is 39 which means that the intensity is only 39% 
> of the
> 
> max_intensity.
> 
> 39 * 80 = 3120  So to preserve the 39% from the 80 we multiply the 
> percentage * requested cluster brightness
> 
> 3120 / 100 = 31 then we normalize back
> 
> I am not sure how your script is working without the multiplier.

Try to remove brackets around division operation.
Then first we are multiplying and only after that dividing.

$ echo "80 * 100 / 255" | bc
31

>>> +        } else
>>> +            adj_value = LED_OFF;
>>> +
>>> +        ret = ops->set_color_brightness(priv->mcled_cdev,
>>> +                        priv->color_id,    adj_value);
>>> +        if (ret < 0)
>>> +            goto unlock;
>>> +    }
>>> +
>>> +unlock:
>>> +    mutex_unlock(&led_cdev->led_access);
>>> +    return ret;
>>> +}
>> [...]
>>> +int led_classdev_multicolor_register_ext(struct device *parent,
>>> +                     struct led_classdev_mc *mcled_cdev,
>>> +                     struct led_init_data *init_data)
>>> +{
>>> +    struct led_classdev *led_cdev;
>>> +    struct led_multicolor_ops *ops;
>>> +    struct led_classdev_mc_data *data;
>>> +    int ret;
>>> +    int i;
>>> +
>>> +    if (!mcled_cdev)
>>> +        return -EINVAL;
>>> +
>>> +    ops = mcled_cdev->ops;
>>> +    if (!ops || !ops->set_color_brightness)
>>> +        return -EINVAL;
>>> +
>>> +    data = kzalloc(sizeof(*data), GFP_KERNEL);
>>> +    if (!data)
>>> +        return -ENOMEM;
>>> +
>>> +    mcled_cdev->data = data;
>>> +    led_cdev = &mcled_cdev->led_cdev;
>>> +
>>> +    if (led_cdev->brightness_set_blocking)
>>> +        led_cdev->brightness_set_blocking = multicolor_set_brightness;
>>
>> This is weird. In leds-lp50xx.c you don't initialize
>> brightness_set_blocking and this still works?
> 
> I will have to look.  I don't believe I retested this on lp50xx only the 
> lp55xx code.
> 
>>
>> I believe this is kind of omission.
>>
>> And it is not reasonable to just override driver supplied op with
>> generic one just like that.
>>
>> I propose to initialize brightness_set or brightness_set_blocking
>> op as we used to do it for monochrome LEDs. Those function(s) on
>> driver side will either use device's hardware support for setting
>> color lightness, or will call a generic function provided by
>> LED multi color class for calculating intensities of all colors
>> it comprises in the cluster.
>>
>> I know this is different to what we've discussed on IRC, but now
>> it looks for me the most reasonable way to go.
> 
> So you want the device driver to handle the brightness request and call 
> into the framework for
> 
> calculating the color intensities?

Exactly.

> That would work as well and solves a problem of HW supported brightness 
> control like the LP50xx.
> 
> The LP50xx would not need to call into the function for calculated 
> intensities.

True.

-- 
Best regards,
Jacek Anaszewski
