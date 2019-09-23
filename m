Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2C9BEBBE09
	for <lists+linux-leds@lfdr.de>; Mon, 23 Sep 2019 23:36:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390628AbfIWVgM (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 23 Sep 2019 17:36:12 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:33881 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389058AbfIWVgM (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 23 Sep 2019 17:36:12 -0400
Received: by mail-wm1-f67.google.com with SMTP id y135so162427wmc.1;
        Mon, 23 Sep 2019 14:36:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=+TBCYfV6Zm9nb/+ZFfMgPppDw5pPT/EVuorxGYBzmaI=;
        b=L5LhuQH9TdLXmPCB5WPdH9dRnauSCkLGWxS23p5xR/MdPP4GXe/AAG2Gyox+EJqK0p
         J6P9FLzg4Ry9JN4UJzaOY9Oi00ISv5tA9vT33Zp9wuKUb3EhCT+pz0FmtcH1zbp7D2pe
         fv6cOWoaYFhiSryypphu37LJk+F973J3oFVxOdqdk6cI4MSRGpoNrPLKIdpYK7AS3CHC
         zTUI6pvUc9vr3kdFUVZafgsb23hx99y0Cn++868d3oL99e7HFHBT/i+3e3V3+PgUZqgD
         RqU5/kfJ5eQqGtaDol17KP+f/CVjqZcM3iHktc740iTpRyIwmj5B99ei3NU2FSJT9zVq
         1rcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=+TBCYfV6Zm9nb/+ZFfMgPppDw5pPT/EVuorxGYBzmaI=;
        b=EjrTuDI3PKuE9TQBCwVabMFuO6xUwBdg7ej4F5faEn4Z9hJenrfLpQGJsTHRW9vWrz
         y1fLxpSIRNYUcJi61A0UPodOGd8FFprEy0BXHE0d+0sDfRNspjAz/YGv89t0gS5X3qAD
         IH5XOX735AWIWTYPJEd7tL6qh4/1WPhjgMBLu6G+YF991LThMQAzTV14PbInSqrEWQOI
         RBeELx8hNVH79VbKFnW5CGULHHvSsh9Osu9pXWkqJ+tkLzpHpV0mKnWp8ylmygHsdIfy
         kYvQJqyc5ZmeTti4u1F3WjAuUHbJew1cs0ShIxvQvvFUFpAcO4aOcpj6EtxXFsxDKS0n
         Ppaw==
X-Gm-Message-State: APjAAAVV/3dJdwWQ1Bn6b1xgJwlLUyhN1KBlLJBHxacBSuzPSUiy4pTK
        gKNKZ/qlyHhJdpjIaB5U20yVlWSg
X-Google-Smtp-Source: APXvYqxcK+aGf/M1KTKa4D7Ib69sFnVJJIxi5dKVxAlw8oMkEPLCs5/ZohO89zxYVv/nt75xT9poiw==
X-Received: by 2002:a05:600c:295b:: with SMTP id n27mr1181426wmd.128.1569274568192;
        Mon, 23 Sep 2019 14:36:08 -0700 (PDT)
Received: from [192.168.1.19] (bdr247.neoplus.adsl.tpnet.pl. [83.28.3.247])
        by smtp.gmail.com with ESMTPSA id x5sm22545307wrg.69.2019.09.23.14.36.06
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 23 Sep 2019 14:36:07 -0700 (PDT)
Subject: Re: [PATCH v8 6/9] leds: multicolor: Introduce a multicolor class
 definition
To:     Dan Murphy <dmurphy@ti.com>, pavel@ucw.cz
Cc:     linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20190920174139.30079-1-dmurphy@ti.com>
 <20190920174139.30079-7-dmurphy@ti.com>
 <157045af-f6c4-919b-3617-350299639f8f@gmail.com>
 <c0499e2e-8595-5224-e13a-1b058695e785@ti.com>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=jacek.anaszewski@gmail.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <5b3d60a7-4893-0118-1f40-d4b4ad6d279f@gmail.com>
Date:   Mon, 23 Sep 2019 23:36:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <c0499e2e-8595-5224-e13a-1b058695e785@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Dan,

On 9/23/19 5:14 PM, Dan Murphy wrote:
> Jacek
> 
> On 9/21/19 8:30 AM, Jacek Anaszewski wrote:
>> Dan,
>>
>> On 9/20/19 7:41 PM, Dan Murphy wrote:
>>> Introduce a multicolor class that groups colored LEDs
>>> within a LED node.
>>>
>>> The framework allows for dynamically setting individual LEDs
>>> or setting brightness levels of LEDs and updating them virtually
>>> simultaneously.
>> Let's update this to the corresponding changed fragment from
>> the documentation after we finally agree upon it.
> 
[...]
>>> +static int led_multicolor_init_color_dir(struct led_classdev_mc_data
>>> *data,
>>> +                     struct led_classdev_mc *mcled_cdev)
>>> +{
>>> +    struct led_classdev *led_cdev = mcled_cdev->led_cdev;
>>> +    u32 color_id;
>>> +    int ret;
>>> +    int i, j = 0;
>>> +
>>> +    data->mcled_cdev = mcled_cdev;
>>> +
>>> +    ret = sysfs_create_group(&led_cdev->dev->kobj, &led_color_group);
>>> +    if (ret)
>>> +        return ret;
>>> +
>>> +    for (i = 0; i < LED_COLOR_ID_MAX; i++) {
>>> +        color_id = (mcled_cdev->available_colors & (1 << i));
>> This is nitpicking but for me it would look cleaner if we had
>> color_mask variable:
>>
>> color_id = (mcled_cdev->available_colors & color_mask);
>>
>>> +        if (color_id) {
>>> +            ret = led_multicolor_init_color(data, mcled_cdev, i, j);
>>> +            if (ret)
>>> +                break;
>>> +
>>> +            j++;
>>> +        }
>> And do the shifting here:
>>
>>         color_mask <<= 1;
> 
> Ack but responded to your follow up email on using bit ops.

Yeah, bitops will be better here.

>>> +    }
>>> +
>>> +    return ret;
>>> +}
>>> +
>>> +int led_classdev_multicolor_register_ext(struct device *parent,
>>> +                     struct led_classdev_mc *mcled_cdev,
>>> +                     struct led_init_data *init_data)
>>> +{
>>> +    struct led_classdev *led_cdev;
>>> +    struct led_classdev_mc_data *data;
>>> +    int ret;
>>> +
>>> +    if (!mcled_cdev)
>>> +        return -EINVAL;
>>> +
>>> +    data = kzalloc(sizeof(*data), GFP_KERNEL);
>>> +    if (!data)
>>> +        return -ENOMEM;
>>> +
>>> +    mcled_cdev->data = data;
>>> +    led_cdev = mcled_cdev->led_cdev;
>>> +    INIT_LIST_HEAD(&data->color_list);
>>> +
>>> +    /* Register led class device */
>>> +    ret = led_classdev_register_ext(parent, led_cdev, init_data);
>>> +    if (ret)
>>> +        return ret;
>>> +
>>> +    return led_multicolor_init_color_dir(data, mcled_cdev);
>>> +}
>>> +EXPORT_SYMBOL_GPL(led_classdev_multicolor_register_ext);
>>> +
>>> +void led_classdev_multicolor_unregister(struct led_classdev_mc
>>> *mcled_cdev)
>>> +{
>>> +    if (!mcled_cdev)
>>> +        return;
>>> +
>>> +    sysfs_remove_group(&mcled_cdev->led_cdev->dev->kobj,
>>> &led_color_group);
>>> +    led_classdev_unregister(mcled_cdev->led_cdev);
>>> +}
>>> +EXPORT_SYMBOL_GPL(led_classdev_multicolor_unregister);
>>> +
>>> +static void devm_led_classdev_multicolor_release(struct device *dev,
>>> void *res)
>>> +{
>>> +    led_classdev_multicolor_unregister(*(struct led_classdev_mc
>>> **)res);
>>> +}
>>> +
>>> +/**
>>> + * devm_of_led_classdev_register - resource managed
>>> led_classdev_register()
>>> + *
>>> + * @parent: parent of LED device
>>> + * @led_cdev: the led_classdev structure for this device.
>>> + */
>> Let's move documentation to the header. We should to the same with
>> the existing led-class.c API one day.
> 
> Well this will go away if we remove the non-ext function.
> 
> And this documentation needs to be updated anyway.
> 
> 
>>> +int devm_led_classdev_multicolor_register(struct device *parent,
>>> +                      struct led_classdev_mc *mcled_cdev)
>> We don't need non-ext version for a new API.
> 
> So we only need the ext version like in the flash class?

Yes. We can always fallback to the old LED name initialization way
that uses struct led_classdev's name property by setting init_data
to NULL.

>>> +{
>>> +    struct led_classdev_mc **dr;
>>> +    int ret;
>>> +
>>> +    dr = devres_alloc(devm_led_classdev_multicolor_release,
>>> +              sizeof(*dr), GFP_KERNEL);
>>> +    if (!dr)
>>> +        return -ENOMEM;
>>> +
>>> +    ret = led_classdev_multicolor_register(parent, mcled_cdev);
>>> +    if (ret) {
>>> +        devres_free(dr);
>>> +        return ret;
>>> +    }
>>> +
>>> +    *dr = mcled_cdev;
>>> +    devres_add(parent, dr);
>>> +
>>> +    return 0;
>>> +}
>>> +EXPORT_SYMBOL_GPL(devm_led_classdev_multicolor_register);
>>> +
>>> +static int devm_led_classdev_multicolor_match(struct device *dev,
>>> +                          void *res, void *data)
>>> +{
>>> +    struct mcled_cdev **p = res;
>>> +
>>> +    if (WARN_ON(!p || !*p))
>>> +        return 0;
>>> +
>>> +    return *p == data;
>>> +}
>>> +
>>> +/**
>>> + * devm_led_classdev_multicolor_unregister() - resource managed
>>> + *                    led_classdev_multicolor_unregister()
>>> + * @parent: The device to unregister.
>>> + * @mcled_cdev: the led_classdev_mc structure for this device.
>>> + */
>>> +void devm_led_classdev_multicolor_unregister(struct device *dev,
>>> +                  struct led_classdev_mc *mcled_cdev)
>>> +{
>>> +    WARN_ON(devres_release(dev,
>>> +                   devm_led_classdev_multicolor_release,
>>> +                   devm_led_classdev_multicolor_match, mcled_cdev));
>>> +}
>>> +EXPORT_SYMBOL_GPL(devm_led_classdev_multicolor_unregister);
>>> +
>>> +MODULE_AUTHOR("Dan Murphy <dmurphy@ti.com>");
>>> +MODULE_DESCRIPTION("Multi Color LED class interface");
>>> +MODULE_LICENSE("GPL v2");
>>> diff --git a/include/linux/led-class-multicolor.h
>>> b/include/linux/led-class-multicolor.h
>>> new file mode 100644
>>> index 000000000000..afcaf429fba5
>>> --- /dev/null
>>> +++ b/include/linux/led-class-multicolor.h
>>> @@ -0,0 +1,76 @@
>>> +/* SPDX-License-Identifier: GPL-2.0 */
>>> +/* LED Multicolor class interface
>>> + * Copyright (C) 2019 Texas Instruments Incorporated -
>>> http://www.ti.com/
>>> + */
>>> +
>>> +#ifndef __LINUX_MULTICOLOR_LEDS_H_INCLUDED
>>> +#define __LINUX_MULTICOLOR_LEDS_H_INCLUDED
>>> +
>>> +#include <linux/leds.h>
>>> +#include <dt-bindings/leds/common.h>
>>> +
>>> +struct led_classdev_mc;
>>> +
>>> +struct led_classdev_mc_data {
>>> +    struct led_classdev_mc *mcled_cdev;
>>> +    struct list_head color_list;
>>> +};
>>> +
>>> +struct led_classdev_mc {
>>> +    /* led class device */
>>> +    struct led_classdev *led_cdev;
>>> +
>>> +    /* Set brightness for a specific color id */
>>> +    int (*set_color_brightness)(struct led_classdev_mc *mcled_cdev,
>>> +                    int color_id, int value);
>>> +
>>> +    struct led_classdev_mc_data *data;
>>> +
>>> +    unsigned long available_colors;
>>> +    int num_leds;
>>> +};
>>> +
>>> +static inline struct led_classdev_mc *lcdev_to_mccdev(
>>> +                        struct led_classdev *lcdev)
>>> +{
>>> +    return container_of(lcdev, struct led_classdev_mc, led_cdev);
>>> +}
>>> +
>>> +/**
>>> + * led_classdev_multicolor_register_ext - register a new object of
>>> led_classdev
>>> + *                      class with support for multicolor LEDs
>>> + * @parent: the multicolor LED to register
>>> + * @mcled_cdev: the led_classdev_mc structure for this device
>>> + * @init_data: the LED class Multi color device initialization data
>>> + *
>>> + * Returns: 0 on success or negative error value on failure
>>> + */
>>> +extern int led_classdev_multicolor_register_ext(struct device *parent,
>> extern is implied by default for functions. We need also to do this
>> cleanup in leds.h soem day.
> 
> For clarity we can remove extern from all the APIs in the header?

Yes, in a dedicated patch.

>>> +                        struct led_classdev_mc *mcled_cdev,
>>> +                        struct led_init_data *init_data);
>>> +
>>> +#define led_classdev_multicolor_register(parent, mcled_cdev)        \
>>> +    led_classdev_multicolor_register_ext(parent, mcled_cdev, NULL)
>>> +
>>> +/**
>>> + * led_classdev_multicolor_unregister - unregisters an object of
>>> led_classdev
>>> + *                    class with support for multicolor LEDs
>>> + * @mcled_cdev: the multicolor LED to unregister
>>> + *
>>> + * Unregister a previously registered via
>>> led_classdev_multicolor_register
>>> + * object
>>> + */
>>> +extern void led_classdev_multicolor_unregister(struct
>>> led_classdev_mc *mcled_cdev);
>>> +
>>> +extern int devm_led_classdev_multicolor_register(struct device *parent,
>>> +                    struct led_classdev_mc *mcled_cdev);
>>> +
>>> +extern void devm_led_classdev_multicolor_unregister(struct device
>>> *parent,
>>> +                       struct led_classdev_mc *mcled_cdev);
>>> +
>>> +/* Set brightness for the monochrome LED cluster */
>>> +extern void led_mc_calc_brightness(struct led_classdev_mc *mcled_cdev,
>>> +                enum led_brightness brightness,
>>> +                int brightness_val[]);
>>> +
>>> +#endif    /* __LINUX_MULTICOLOR_LEDS_H_INCLUDED */
>>>
> 

-- 
Best regards,
Jacek Anaszewski
