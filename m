Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4DCBEC108B
	for <lists+linux-leds@lfdr.de>; Sat, 28 Sep 2019 12:09:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725965AbfI1KJr (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 28 Sep 2019 06:09:47 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:40512 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725897AbfI1KJr (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 28 Sep 2019 06:09:47 -0400
Received: by mail-wm1-f67.google.com with SMTP id b24so7844469wmj.5;
        Sat, 28 Sep 2019 03:09:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:subject:to:cc:references:openpgp:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=0sOywUDaUoDpQOZ3Yx1LB5l0pRV3dhRVW6l5B2Q9ong=;
        b=aSdfeUxAHq3nFWIDmur1xpkSdwEP6pD/6G5Ay408LdFCKJlC1kT05OePMx6kFh7euD
         DrcSHeqfNqpyoEDq11Or/1anePGlgWe2TtnDQxlHqxoGuuYAgCfp/XgJ8AkB3C0WAuZc
         Ab/U3aAzp3MhqFJSuHyyVpitDWoNr2d+IC7TAU5ZtqsremrmACvcNyvgj5aB3x+OjLzG
         eYIwCYNe1qDr3bDJwOjgwknXxiHy1/ipZ+PegWMQPED/TMJpO6c3qS94WOXZ2+gBI+nq
         DcG3afuEnaLP/85eH6ZLafhw26d8BPFzVxM/Q49ysYV0HUu/7BusL6cckLJ3S9z3FS9T
         iVZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:references:openpgp:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=0sOywUDaUoDpQOZ3Yx1LB5l0pRV3dhRVW6l5B2Q9ong=;
        b=Cey6H19V8dbhunSrI6SvislR+RVfa7gunZweuZhFZDveEailyJB+Mp+xN6U8zlWNCp
         2rVT4Dx+tD36bbby9rXZGX1YcfMEdlyfG891ePsYmvK6UGmRQ/3UItN+exjMHNvqV57U
         ZIPu4ZHdokYea80d4uZ1R4LDm4NgJ/p0G6SeEjjaXN/1+iVc9vUtuNwOCZYooc0HlWzG
         6MJGbRIq3sIVh2YxLHiZlZx03VNFBSEIJsFspStSf9paJTC1jgW8ZVH9LwUaR5exggky
         7SDOf3+vEe/qkiOFXfH7stWfQcRUmW/Hx2cLHy7kJwn4oLen0b14n83j908s1GvkNDmg
         teFg==
X-Gm-Message-State: APjAAAVwNWXynnMf9skm1cR1ErDE0QwheSeDvJjMnGnbN8tNBsrQEYFy
        96CM7GfGnxqYU0scTZ3sJQxM0/ML
X-Google-Smtp-Source: APXvYqyOchv3XAaPF8DWN0cFjhgjBxknqpUPui78u7DhVswgTOnsW3fHZBzXEL/vfJZlWRYe20ir6Q==
X-Received: by 2002:a7b:c00e:: with SMTP id c14mr10545322wmb.60.1569665381450;
        Sat, 28 Sep 2019 03:09:41 -0700 (PDT)
Received: from [192.168.1.19] (chs80.neoplus.adsl.tpnet.pl. [83.31.16.80])
        by smtp.gmail.com with ESMTPSA id l1sm5735545wrb.1.2019.09.28.03.09.40
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 28 Sep 2019 03:09:40 -0700 (PDT)
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH v9 05/15] leds: multicolor: Introduce a multicolor class
 definition
To:     Dan Murphy <dmurphy@ti.com>, pavel@ucw.cz
Cc:     linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20190925174616.3714-1-dmurphy@ti.com>
 <20190925174616.3714-6-dmurphy@ti.com>
 <918ff939-8b6c-af35-ef08-0f13937d2fed@gmail.com>
 <4f23cd99-23a5-5185-dd42-d6d29c48f566@ti.com>
Openpgp: preference=signencrypt
Autocrypt: addr=jacek.anaszewski@gmail.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <03deb117-4bd4-b636-cbc9-4634afc73e78@gmail.com>
Date:   Sat, 28 Sep 2019 12:09:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <4f23cd99-23a5-5185-dd42-d6d29c48f566@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Dan,

On 9/26/19 1:52 PM, Dan Murphy wrote:
> Jacek
> 
> On 9/25/19 4:12 PM, Jacek Anaszewski wrote:
>> Dan,
>>
>> On 9/25/19 7:46 PM, Dan Murphy wrote:
>>> Introduce a multicolor class that groups colored LEDs
>>> within a LED node.
>>>
>>> The multi color class groups monochrome LEDs and allows controlling two
>>> aspects of the final combined color: hue and lightness. The former is
>>> controlled via <color>_intensity files and the latter is controlled
>>> via brightness file.
>>>
>>> Signed-off-by: Dan Murphy <dmurphy@ti.com>
>>> ---
>>>   drivers/leds/Kconfig                 |  10 ++
>>>   drivers/leds/Makefile                |   1 +
>>>   drivers/leds/led-class-multicolor.c  | 220 +++++++++++++++++++++++++++
>>>   include/linux/led-class-multicolor.h |  74 +++++++++
>>>   4 files changed, 305 insertions(+)
>>>   create mode 100644 drivers/leds/led-class-multicolor.c
>>>   create mode 100644 include/linux/led-class-multicolor.h
>>>
>>> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
>>> index 6e7703fd03d0..cfb1ebb6517f 100644
>>> --- a/drivers/leds/Kconfig
>>> +++ b/drivers/leds/Kconfig
>>> @@ -30,6 +30,16 @@ config LEDS_CLASS_FLASH
>>>         for the flash related features of a LED device. It can be built
>>>         as a module.
>>>   +config LEDS_CLASS_MULTI_COLOR
>>> +    tristate "LED Mulit Color LED Class Support"
>>> +    depends on LEDS_CLASS
>>> +    help
>>> +      This option enables the multicolor LED sysfs class in
>>> /sys/class/leds.
>>> +      It wraps LED class and adds multicolor LED specific sysfs
>>> attributes
>>> +      and kernel internal API to it. You'll need this to provide
>>> support
>>> +      for multicolor LEDs that are grouped together. This class is not
>>> +      intended for single color LEDs. It can be built as a module.
>>> +
>>>   config LEDS_BRIGHTNESS_HW_CHANGED
>>>       bool "LED Class brightness_hw_changed attribute support"
>>>       depends on LEDS_CLASS
>>> diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
>>> index 2da39e896ce8..841038cfe35b 100644
>>> --- a/drivers/leds/Makefile
>>> +++ b/drivers/leds/Makefile
>>> @@ -4,6 +4,7 @@
>>>   obj-$(CONFIG_NEW_LEDS)            += led-core.o
>>>   obj-$(CONFIG_LEDS_CLASS)        += led-class.o
>>>   obj-$(CONFIG_LEDS_CLASS_FLASH)        += led-class-flash.o
>>> +obj-$(CONFIG_LEDS_CLASS_MULTI_COLOR)    += led-class-multicolor.o
>>>   obj-$(CONFIG_LEDS_TRIGGERS)        += led-triggers.o
>>>     # LED Platform Drivers
>>> diff --git a/drivers/leds/led-class-multicolor.c
>>> b/drivers/leds/led-class-multicolor.c
>>> new file mode 100644
>>> index 000000000000..25371bd9a860
>>> --- /dev/null
>>> +++ b/drivers/leds/led-class-multicolor.c
>>> @@ -0,0 +1,220 @@
>>> +// SPDX-License-Identifier: GPL-2.0
>>> +// LED Multi Color class interface
>>> +// Copyright (C) 2019 Texas Instruments Incorporated -
>>> http://www.ti.com/
>>> +
>>> +#include <linux/device.h>
>>> +#include <linux/init.h>
>>> +#include <linux/led-class-multicolor.h>
>>> +#include <linux/module.h>
>>> +#include <linux/slab.h>
>>> +#include <linux/uaccess.h>
>>> +
>>> +#include "leds.h"
>>> +
>>> +#define INTENSITY_NAME        "_intensity"
>>> +#define MAX_INTENSITY_NAME    "_max_intensity"
>>> +
>>> +void led_mc_calc_brightness(struct led_classdev_mc *mcled_cdev,
>>> +                enum led_brightness brightness,
>>> +                int brightness_val[])
>>> +{
>>> +    struct led_mc_color_entry *priv;
>>> +    int i = 0;
>>> +
>>> +    list_for_each_entry(priv, &mcled_cdev->color_list, list) {
>> I think we should have some way to let the caller know exact mapping
>> of brightness_val to color_id. Possibly LED mc core should provide
>> a helper to get color_id by color entry index.
> 
> Why would we need that?

To make LED mc API more straightforward and avoid making
clients wondering in what order colors will be assigned to array
elements. And finally forcing them to go and analyze LED mc core.

>> But this remark is actually more relevant to the place of calling.
>> I'll try to propose something there.
>>
>> And regarding brightness_val name - how about:
>>
>> s/brightness_val/brightness_component/ ?
> 
> component does not make sense to me in this context.  Actually
> brightness_val
> 
> does not make sense either since it is an adjusted intensity and
> brightness is passed in in the second arg
> 
> I think intensity_values make more sense.

Every variable carries some value. so this is meaningless.
Intensity OTOH can be confused with <color>_intensity, which
is not going to be written to the hardware, but used
as a factor for calculating final LED iout brightness.

The aim of the equation is to multiple the ratio of
color intensity to its max intensity by global brightness.
The resulting value is written to the hardware to set
brightness of a LED being one of the components producing
the final final combined color.

I had to come up with literal description of the equation
to facilitate devising better variable name :-)

Having the above, how about "color_component" ?

>>
>>
>>> +        brightness_val[i] = brightness *
>>> +                    priv->intensity / priv->max_intensity;

Now, looking closer at this equation it becomes obvious to me
why Pavel opted for common max_brightness: in case of
<color>_intensity == <color>_max_intensity we will get the result
equal to max_brightness. And this is problematic: think of a case when
calculated value will be greater than given <color>_max_intensity.
It will have to be limited the that constraint and will fail to
produce proper color combination.

As a solution I see limiting max_brightness to the lowest supported
brightness from the LEDs in the cluster.

>>> +        i++;
>>> +    }
>>> +}
>>> +EXPORT_SYMBOL_GPL(led_mc_calc_brightness);
>>> +
>>> +static ssize_t intensity_store(struct device *dev,
>>> +                struct device_attribute *intensity_attr,
>>> +                const char *buf, size_t size)
>>> +{
>>> +    struct led_mc_color_entry *priv = container_of(intensity_attr,
>>> +                            struct led_mc_color_entry,
>>> +                              intensity_attr);
>>> +    struct led_classdev *led_cdev = priv->mcled_cdev->led_cdev;
>>> +    unsigned long value;
>>> +    ssize_t ret;
>>> +
>>> +    mutex_lock(&led_cdev->led_access);
>>> +
>>> +    ret = kstrtoul(buf, 10, &value);
>>> +    if (ret)
>>> +        goto unlock;
>>> +
>>> +    if (value > priv->max_intensity) {
>>> +        ret = -EINVAL;
>>> +        goto unlock;
>>> +    }
>>> +
>>> +    priv->intensity = value;
>>> +    ret = size;
>>> +
>>> +unlock:
>>> +    mutex_unlock(&led_cdev->led_access);
>>> +    return ret;
>>> +}
>>> +
>>> +static ssize_t intensity_show(struct device *dev,
>>> +                  struct device_attribute *intensity_attr,
>>> +                  char *buf)
>>> +{
>>> +    struct led_mc_color_entry *priv = container_of(intensity_attr,
>>> +                            struct led_mc_color_entry,
>>> +                              intensity_attr);
>>> +
>>> +    return sprintf(buf, "%d\n", priv->intensity);
>>> +}
>>> +
>>> +static ssize_t max_intensity_show(struct device *dev,
>>> +                   struct device_attribute *max_intensity_attr,
>>> +                   char *buf)
>>> +{
>>> +    struct led_mc_color_entry *priv = container_of(max_intensity_attr,
>>> +                            struct led_mc_color_entry,
>>> +                              max_intensity_attr);
>>> +
>>> +    return sprintf(buf, "%d\n", priv->max_intensity);
>>> +}
>>> +
>>> +static struct attribute *led_color_attrs[] = {
>>> +    NULL,
>>> +};
>>> +
>>> +static struct attribute_group led_color_group = {
>>> +    .name = "colors",
>>> +    .attrs = led_color_attrs,
>>> +};
>>> +
>>> +static int led_multicolor_init_color(struct led_classdev_mc
>>> *mcled_cdev,
>>> +                     int color_id, int color_index)
>>> +{
>>> +    struct led_classdev *led_cdev = mcled_cdev->led_cdev;
>>> +    struct led_mc_color_entry *mc_priv;
>>> +    char *intensity_file_name;
>>> +    char *max_intensity_file_name;
>>> +    size_t len;
>>> +    int ret;
>>> +
>>> +    mc_priv = devm_kzalloc(led_cdev->dev, sizeof(*mc_priv),
>>> GFP_KERNEL);
>>> +    if (!mc_priv)
>>> +        return -ENOMEM;
>>> +
>>> +    mc_priv->led_color_id = color_id;
>>> +    mc_priv->mcled_cdev = mcled_cdev;
>>> +
>>> +    sysfs_attr_init(&mc_priv->intensity_attr.attr);
>>> +    len = strlen(led_colors[color_id]) + strlen(INTENSITY_NAME) + 1;
>>> +    intensity_file_name = kzalloc(len, GFP_KERNEL);
>>> +    if (!intensity_file_name)
>>> +        return -ENOMEM;
>>> +
>>> +    snprintf(intensity_file_name, len, "%s%s",
>>> +         led_colors[color_id], INTENSITY_NAME);
>>> +    mc_priv->intensity_attr.attr.name = intensity_file_name;
>>> +    mc_priv->intensity_attr.attr.mode = 644;
>> Proper octal value should begin with 0.
>> But please use combinations of dedicated S_I* definitions
>> from include/uapi/linux/stat.h.
> 
> Using the S_I* causes checkpatch warnings
> 
> WARNING: Symbolic permissions 'S_IRUGO' are not preferred. Consider
> using octal permissions '0444'.
> #139: FILE: drivers/leds/led-class-multicolor.c:139:
> +    mc_priv->max_intensity_attr.attr.mode = S_IRUGO;

Ah, right. Anyway, you need to add leading 0.

>>
>>> +    mc_priv->intensity_attr.store = intensity_store;
>>> +    mc_priv->intensity_attr.show = intensity_show;
>>> +    ret = sysfs_add_file_to_group(&led_cdev->dev->kobj,
>>> +                      &mc_priv->intensity_attr.attr,
>>> +                      led_color_group.name);
>>> +    if (ret)
>>> +        goto intensity_err_out;
>>> +
>>> +    sysfs_attr_init(&mc_priv->max_intensity_attr.attr);
>>> +    len = strlen(led_colors[color_id]) + strlen(MAX_INTENSITY_NAME)
>>> + 1;
>>> +    max_intensity_file_name = kzalloc(len, GFP_KERNEL);
>>> +    if (!max_intensity_file_name) {
>>> +        ret = -ENOMEM;
>>> +        goto intensity_err_out;
>>> +    }
>>> +
>>> +    snprintf(max_intensity_file_name, len, "%s%s",
>>> +         led_colors[color_id], MAX_INTENSITY_NAME);
>>> +    mc_priv->max_intensity_attr.attr.name = max_intensity_file_name;
>>> +    mc_priv->max_intensity_attr.attr.mode = 444;
>>> +    mc_priv->max_intensity_attr.show = max_intensity_show;
>>> +    ret = sysfs_add_file_to_group(&led_cdev->dev->kobj,
>>> +                      &mc_priv->max_intensity_attr.attr,
>>> +                      led_color_group.name);
>>> +    if (ret)
>>> +        goto max_intensity_err_out;
>>> +
>>> +    mc_priv->max_intensity = LED_FULL;
>>> +    list_add_tail(&mc_priv->list, &mcled_cdev->color_list);
>>> +
>>> +max_intensity_err_out:
>>> +    kfree(max_intensity_file_name);
>>> +intensity_err_out:
>>> +    kfree(intensity_file_name);
>>> +    return ret;
>>> +}
>>> +
>>> +static int led_multicolor_init_color_dir(struct led_classdev_mc
>>> *mcled_cdev)
>>> +{
>>> +    struct led_classdev *led_cdev = mcled_cdev->led_cdev;
>>> +    int ret;
>>> +    int i, color_index = 0;
>>> +
>>> +    ret = sysfs_create_group(&led_cdev->dev->kobj, &led_color_group);
>>> +    if (ret)
>>> +        return ret;
>>> +
>>> +    for (i = 0; i < LED_COLOR_ID_MAX; i++) {
>>> +        if (test_bit(i, &mcled_cdev->available_colors)) {
>>> +            ret = led_multicolor_init_color(mcled_cdev, i,
>>> +                            color_index);
>> color_index is now unused AFAICS.
> 
> Ack
> 
>>
>>> +            if (ret)
>>> +                break;
>>> +
>>> +            color_index++;
>>> +        }
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
>>> +    int ret;
>>> +
>>> +    if (!mcled_cdev)
>>> +        return -EINVAL;
>>> +
>>> +    led_cdev = mcled_cdev->led_cdev;
>>> +    INIT_LIST_HEAD(&mcled_cdev->color_list);
>>> +
>>> +    /* Register led class device */
>>> +    ret = led_classdev_register_ext(parent, led_cdev, init_data);
>>> +    if (ret)
>>> +        return ret;
>>> +
>>> +    return led_multicolor_init_color_dir(mcled_cdev);
>>> +}
>>> +EXPORT_SYMBOL_GPL(led_classdev_multicolor_register_ext);
>> Why devm_* versions are missing now?
> 
> I was using the led-class-flash.c as an example and that class does not
> have the devm_* versions either.

Why did you have them in v8 then?

> Tried to make the 2 child classes look the same.

We can fix the shortcomings while adding new code.

> If they are missing from the led-class-flash code then that needs to be
> fixed as well.

Well, yes.

>>
>>> +
>>> +void led_classdev_multicolor_unregister(struct led_classdev_mc
>>> *mcled_cdev)
>>> +{
>>> +    struct led_mc_color_entry *priv, *next;
>>> +
>>> +    if (!mcled_cdev)
>>> +        return;
>>> +
>>> +    list_for_each_entry_safe(priv, next, &mcled_cdev->color_list, list)
>>> +        list_del(&priv->list);
>>> +
>>> +    sysfs_remove_group(&mcled_cdev->led_cdev->dev->kobj,
>>> &led_color_group);
>>> +    led_classdev_unregister(mcled_cdev->led_cdev);
>>> +}
>>> +EXPORT_SYMBOL_GPL(led_classdev_multicolor_unregister);
>>> +
>>> +MODULE_AUTHOR("Dan Murphy <dmurphy@ti.com>");
>>> +MODULE_DESCRIPTION("Multi Color LED class interface");
>>> +MODULE_LICENSE("GPL v2");
>>> diff --git a/include/linux/led-class-multicolor.h
>>> b/include/linux/led-class-multicolor.h
>>> new file mode 100644
>>> index 000000000000..280ba5a614b4
>>> --- /dev/null
>>> +++ b/include/linux/led-class-multicolor.h
>>> @@ -0,0 +1,74 @@
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
>>> +struct led_mc_color_entry {
>>> +    struct led_classdev_mc *mcled_cdev;
>>> +
>>> +    struct device_attribute max_intensity_attr;
>>> +    struct device_attribute intensity_attr;
>>> +
>>> +    enum led_brightness max_intensity;
>>> +    enum led_brightness intensity;
>>> +
>>> +    struct list_head list;
>>> +
>>> +    int led_color_id;
>>> +};
>>> +
>>> +struct led_classdev_mc {
>>> +    /* led class device */
>>> +    struct led_classdev *led_cdev;
>>> +    struct list_head color_list;
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
>>> +int led_classdev_multicolor_register_ext(struct device *parent,
>>> +                        struct led_classdev_mc *mcled_cdev,
>>> +                        struct led_init_data *init_data);
>>> +
>>> +#define led_classdev_multicolor_register(parent, mcled_cdev)        \
>>> +    led_classdev_multicolor_register_ext(parent, mcled_cdev, NULL)
>> Please turn it into inline.
> 
> Again same statement as above on the led-class-flash.  This is how this
> is defined there.
> 
> If that is not correct in the flash class then that needs to be fixed as
> well.

Did you see my patch fixing these things in leds.h [0]?
I just missed that problem in led-class-flash.h.

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
>>> +void led_classdev_multicolor_unregister(struct led_classdev_mc
>>> *mcled_cdev);
>>> +
>>> +/* Calculate brightness for the monochrome LED cluster */
>>> +void led_mc_calc_brightness(struct led_classdev_mc *mcled_cdev,
>>> +                enum led_brightness brightness,
>>> +                int brightness_val[]);
>>> +
>>> +#endif    /* __LINUX_MULTICOLOR_LEDS_H_INCLUDED */
>>>
> 

[0]
https://git.kernel.org/pub/scm/linux/kernel/git/j.anaszewski/linux-leds.git/commit/?h=for-next&id=7c322056e3564da1b5bdc3f3cb79229582955eb2

-- 
Best regards,
Jacek Anaszewski
