Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 10F914DAE4
	for <lists+linux-leds@lfdr.de>; Thu, 20 Jun 2019 22:06:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726482AbfFTUGk (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 20 Jun 2019 16:06:40 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:45150 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726338AbfFTUGk (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 20 Jun 2019 16:06:40 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5KK6K90119626;
        Thu, 20 Jun 2019 15:06:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1561061180;
        bh=Wfu4Q4NahOYVIgWoJmmtqDgJ5MC33mQqi/WAYuf8qlo=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=c+81RS3GNzjtJnRb6cRvtbrZMwujMlL0nJ3qaXYu6x2o3Bn9ADl2kw5mMuN29R8pA
         bXAKPIsAt20Q5GzBilCkO9QY0401+BUIyHwsoyk/kUkldYNQupByKspHkOg4cVCvcw
         PM9hMDjUoDIIrDwPvIsjacdgAfKRfKiIijj2iU5M=
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5KK6KGL030029
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 20 Jun 2019 15:06:20 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 20
 Jun 2019 15:06:19 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 20 Jun 2019 15:06:19 -0500
Received: from [10.250.65.13] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5KK6JLm065075;
        Thu, 20 Jun 2019 15:06:19 -0500
Subject: Re: [PATCH v3 6/9] leds: multicolor: Introduce a multicolor class
 definition
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>,
        <robh+dt@kernel.org>
CC:     <devicetree@vger.kernel.org>, <linux-leds@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20190523190820.29375-1-dmurphy@ti.com>
 <20190523190820.29375-7-dmurphy@ti.com>
 <2f91bd2b-1d69-c9c7-c20b-a7396c9e1ecd@gmail.com>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <41353876-8671-3353-b27c-ab057699bbbe@ti.com>
Date:   Thu, 20 Jun 2019 15:06:12 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <2f91bd2b-1d69-c9c7-c20b-a7396c9e1ecd@gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Jacek

Thanks for the review

On 6/20/19 11:10 AM, Jacek Anaszewski wrote:
> Hi Dan,
>
> Thank you for the v5.
>
> I will confine myself to commenting only some parts since
> the rest will undergo rework due to removal of sync API.
>
> On 5/23/19 9:08 PM, Dan Murphy wrote:
>> Introduce a multicolor class that groups colored LEDs
>> within a LED node.
>>
>> The framework allows for dynamically setting individual LEDs
>> or setting brightness levels of LEDs and updating them virtually
>> simultaneously.
>>
>> Signed-off-by: Dan Murphy <dmurphy@ti.com>
>> ---
>>   drivers/leds/Kconfig                 |  10 +
>>   drivers/leds/Makefile                |   1 +
>>   drivers/leds/led-class-multicolor.c  | 421 +++++++++++++++++++++++++++
>>   include/linux/led-class-multicolor.h |  95 ++++++
>>   4 files changed, 527 insertions(+)
>>   create mode 100644 drivers/leds/led-class-multicolor.c
>>   create mode 100644 include/linux/led-class-multicolor.h
>>
>> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
>> index 0414adebb177..0696a13c9527 100644
>> --- a/drivers/leds/Kconfig
>> +++ b/drivers/leds/Kconfig
>> @@ -29,6 +29,16 @@ config LEDS_CLASS_FLASH
>>         for the flash related features of a LED device. It can be built
>>         as a module.
>>   +config LEDS_CLASS_MULTI_COLOR
>> +    tristate "LED Mulit Color LED Class Support"
>> +    depends on LEDS_CLASS
>> +    help
>> +      This option enables the multicolor LED sysfs class in 
>> /sys/class/leds.
>> +      It wraps LED Class and adds multicolor LED specific sysfs 
>> attributes
>> +      and kernel internal API to it. You'll need this to provide 
>> support
>> +      for multicolor LEDs that are grouped together. This class is not
>> +      intended for single color LEDs.  It can be built as a module.
>
> extra whitespace:
>
> s/ It can/It can/

Ack

>
> [...]
>> +
>> +static int multicolor_set_brightness(struct led_classdev *led_cdev,
>> +                 enum led_brightness brightness)
>> +{
>> +    struct led_classdev_mc *mcled_cdev = lcdev_to_mccdev(led_cdev);
>> +    struct led_classdev_mc_data *data = mcled_cdev->data;
>> +    struct led_multicolor_ops *ops = mcled_cdev->ops;
>> +    struct led_classdev_mc_priv *priv;
>> +    unsigned long state = brightness;
>> +    int adj_value;
>> +    ssize_t ret = -EINVAL;
>> +
>> +    mutex_lock(&led_cdev->led_access);
>> +
>> +    if (ops->set_module_brightness) {
>> +        ret = ops->set_module_brightness(mcled_cdev, state);
>> +        goto unlock;
>> +    }
>> +
>> +    list_for_each_entry(priv, &data->color_list, list) {
>> +        if (state && priv->brightness && priv->max_brightness) {
>> +            adj_value = state * ((priv->brightness * 100) / 
>> priv->max_brightness);
>> +            adj_value = adj_value / 100;
>
> Why the multiplication an then division by 100? And priv->max_brightness
> stays unaltered? This changes the proportions. My python script works
> just fine without those.

Because the kernel does not do floating point math and the calculation 
is using the ratio

between the intensity and max_intensity and multiplying against the 
requested brightness.

priv->intensity = 100 (This is the current intensity of the color LED)

priv->max_intensity = 255

state = 80 (This is the requested cluster brightness)

100/255 = 0.392 which is 0.

0 * 80 = 0 this is not what the value should be

But with the multiplier.

10000/255 = 39.2 which is 39 which means that the intensity is only 39% 
of the

max_intensity.

39 * 80 = 3120  So to preserve the 39% from the 80 we multiply the 
percentage * requested cluster brightness

3120 / 100 = 31 then we normalize back

I am not sure how your script is working without the multiplier.


>
>> +        } else
>> +            adj_value = LED_OFF;
>> +
>> +        ret = ops->set_color_brightness(priv->mcled_cdev,
>> +                        priv->color_id,    adj_value);
>> +        if (ret < 0)
>> +            goto unlock;
>> +    }
>> +
>> +unlock:
>> +    mutex_unlock(&led_cdev->led_access);
>> +    return ret;
>> +}
> [...]
>> +int led_classdev_multicolor_register_ext(struct device *parent,
>> +                     struct led_classdev_mc *mcled_cdev,
>> +                     struct led_init_data *init_data)
>> +{
>> +    struct led_classdev *led_cdev;
>> +    struct led_multicolor_ops *ops;
>> +    struct led_classdev_mc_data *data;
>> +    int ret;
>> +    int i;
>> +
>> +    if (!mcled_cdev)
>> +        return -EINVAL;
>> +
>> +    ops = mcled_cdev->ops;
>> +    if (!ops || !ops->set_color_brightness)
>> +        return -EINVAL;
>> +
>> +    data = kzalloc(sizeof(*data), GFP_KERNEL);
>> +    if (!data)
>> +        return -ENOMEM;
>> +
>> +    mcled_cdev->data = data;
>> +    led_cdev = &mcled_cdev->led_cdev;
>> +
>> +    if (led_cdev->brightness_set_blocking)
>> +        led_cdev->brightness_set_blocking = multicolor_set_brightness;
>
> This is weird. In leds-lp50xx.c you don't initialize
> brightness_set_blocking and this still works?

I will have to look.  I don't believe I retested this on lp50xx only the 
lp55xx code.

>
> I believe this is kind of omission.
>
> And it is not reasonable to just override driver supplied op with
> generic one just like that.
>
> I propose to initialize brightness_set or brightness_set_blocking
> op as we used to do it for monochrome LEDs. Those function(s) on
> driver side will either use device's hardware support for setting
> color lightness, or will call a generic function provided by
> LED multi color class for calculating intensities of all colors
> it comprises in the cluster.
>
> I know this is different to what we've discussed on IRC, but now
> it looks for me the most reasonable way to go.

So you want the device driver to handle the brightness request and call 
into the framework for

calculating the color intensities?

That would work as well and solves a problem of HW supported brightness 
control like the LP50xx.

The LP50xx would not need to call into the function for calculated 
intensities.


>
>> + INIT_LIST_HEAD(&data->color_list);
>> +
>> +    /* Register led class device */
>> +    ret = led_classdev_register_ext(parent, led_cdev, init_data);
>> +    if (ret)
>> +        return ret;
>> +
>> +    ret = led_multicolor_init_color_dir(data, mcled_cdev);
>> +    if (ret)
>> +        return ret;
>> +
>> +    /* Select the sysfs attributes to be created for the device */
>> +    for (i = 0; i < mcled_cdev->num_leds; i++) {
>> +        ret = led_multicolor_init_color(data, mcled_cdev,
>> +                        mcled_cdev->available_colors[i]);
>> +        if (ret)
>> +            break;
>> +    }
>> +
>> +    return ret;
>> +}
>> +EXPORT_SYMBOL_GPL(led_classdev_multicolor_register_ext);
>> +
>> +void led_classdev_multicolor_unregister(struct led_classdev_mc 
>> *mcled_cdev)
>> +{
>> +    if (!mcled_cdev)
>> +        return;
>> +
>> +    led_classdev_unregister(&mcled_cdev->led_cdev);
>> +}
>> +EXPORT_SYMBOL_GPL(led_classdev_multicolor_unregister);
>> +
>> +static void devm_led_classdev_multicolor_release(struct device *dev, 
>> void *res)
>> +{
>> +    led_classdev_multicolor_unregister(*(struct led_classdev_mc 
>> **)res);
>> +}
>> +
>> +/**
>> + * devm_of_led_classdev_register - resource managed 
>> led_classdev_register()
>> + *
>> + * @parent: parent of LED device
>> + * @led_cdev: the led_classdev structure for this device.
>> + */
>> +int devm_led_classdev_multicolor_register(struct device *parent,
>> +                      struct led_classdev_mc *mcled_cdev)
>> +{
>> +    struct led_classdev_mc **dr;
>> +    int ret;
>> +
>> +    dr = devres_alloc(devm_led_classdev_multicolor_release,
>> +              sizeof(*dr), GFP_KERNEL);
>> +    if (!dr)
>> +        return -ENOMEM;
>> +
>> +    ret = led_classdev_multicolor_register(parent, mcled_cdev);
>> +    if (ret) {
>> +        devres_free(dr);
>> +        return ret;
>> +    }
>> +
>> +    *dr = mcled_cdev;
>> +    devres_add(parent, dr);
>> +
>> +    return 0;
>> +}
>> +EXPORT_SYMBOL_GPL(devm_led_classdev_multicolor_register);
>> +
>> +static int devm_led_classdev_multicolor_match(struct device *dev,
>> +                          void *res, void *data)
>> +{
>> +    struct mcled_cdev **p = res;
>> +
>> +    if (WARN_ON(!p || !*p))
>> +        return 0;
>> +
>> +    return *p == data;
>> +}
>> +
>> +/**
>> + * devm_led_classdev_multicolor_unregister() - resource managed
>> + *                    led_classdev_multicolor_unregister()
>> + * @parent: The device to unregister.
>> + * @mcled_cdev: the led_classdev_mc structure for this device.
>> + */
>> +void devm_led_classdev_multicolor_unregister(struct device *dev,
>> +                  struct led_classdev_mc *mcled_cdev)
>> +{
>> +    WARN_ON(devres_release(dev,
>> +                   devm_led_classdev_multicolor_release,
>> +                   devm_led_classdev_multicolor_match, mcled_cdev));
>> +}
>> +EXPORT_SYMBOL_GPL(devm_led_classdev_multicolor_unregister);
>> +
>> +MODULE_AUTHOR("Dan Murphy <dmurphy@ti.com>");
>> +MODULE_DESCRIPTION("Multi Color LED class interface");
>> +MODULE_LICENSE("GPL v2");
>> diff --git a/include/linux/led-class-multicolor.h 
>> b/include/linux/led-class-multicolor.h
>> new file mode 100644
>> index 000000000000..f9e71d984b03
>> --- /dev/null
>> +++ b/include/linux/led-class-multicolor.h
>> @@ -0,0 +1,95 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +
>> +/* LED Multicolor class interface
>> + * Copyright (C) 2019 Texas Instruments Incorporated - 
>> http://www.ti.com/
>> + */
>
> Let's have C++ comment style also here.
>
ACK


>> +#ifndef __LINUX_MULTICOLOR_LEDS_H_INCLUDED
>> +#define __LINUX_MULTICOLOR_LEDS_H_INCLUDED
>> +
>> +#include <linux/leds.h>
>> +#include <dt-bindings/leds/common.h>
> [...]
>
>
