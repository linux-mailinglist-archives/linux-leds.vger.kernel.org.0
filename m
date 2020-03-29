Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8A94A196F5E
	for <lists+linux-leds@lfdr.de>; Sun, 29 Mar 2020 20:43:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728497AbgC2Sns (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 29 Mar 2020 14:43:48 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:41988 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727591AbgC2Snr (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 29 Mar 2020 14:43:47 -0400
Received: by mail-wr1-f67.google.com with SMTP id h15so18321674wrx.9;
        Sun, 29 Mar 2020 11:43:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=AbAb1ydhIilk7qSTx9fF4NpyUVeTYvKr0g7ctf0qiEI=;
        b=p0sIwSGE87RrDQy+vYcpRkcHXHwB8hI+FwAsZ6rmBWor0vmMilfGtCOeCpF2MMZ5Aw
         Y35YNi8v4Lpm2XpIef28sClBdp5VhFHjjDBqNoR2KdIZiup7oDTxlsZmhe4mYbabqlU3
         a38OlT6mm9FgFRM8p3XFyTyrRFSwXHNDDh0+tq+RTRuZqPxxsDhyk+3tvljbr0hlN1Eb
         0S7DOF197og6b+PxJOY3+roW7c+CTFiHSTQXEoLHMF0IuDc5Chk3J6pgV/e+BzX0PrjZ
         O8fjZdKOmp6KXHiqz50Ruho5VRqW2KBBvWK0lbKjRw5YdJnhFwD6PGDvSrDe+g49fsJg
         LaTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=AbAb1ydhIilk7qSTx9fF4NpyUVeTYvKr0g7ctf0qiEI=;
        b=bzG38wRCUxl9W486FqSgzw02eXQKUT/6TpfK1jWDSac6djCpFD7gE/JxgYyGxVh11B
         3nRNCAD+KzDufLzCYPTlgAHyU0uYTAyv+7pwB/NniCm0OcoT89ZV/1nqUhJxohvLfuQA
         cz92HcGtluuUapwR67NBz5LKEVPFDmaI11RcU7wMR6R1mzZV6JTcLw0hWrWw2Y1F85ej
         R19HZx2qMc4fejyuMUTNPu6r5fPn95kUzgeLCnd31V9TGW7AU2/90Ap3XSj7k0vRF3T/
         2UB8c6NgVtK6FAx1G9BHDDD/q+co4SqNSbyRBpXi2SO+9JrrrRW570TVrv/v2gEzU2sp
         SQiA==
X-Gm-Message-State: ANhLgQ2Xdzlx3e0tbdW2KUg5uYPbJ6aRvjgJSxbGTSDr2/vipfc4Aun8
        qnEUm/v6rFyxPP69C32+6aKWHQXo
X-Google-Smtp-Source: ADFU+vtYiIGKIK0G5sjBOy04D5olEpGeybRJg5uven0j5ptv4wgJEtAYJOmc50+xzxgesxyaYEWEAQ==
X-Received: by 2002:a5d:6109:: with SMTP id v9mr11303697wrt.203.1585507425231;
        Sun, 29 Mar 2020 11:43:45 -0700 (PDT)
Received: from [192.168.1.23] (afdc26.neoplus.adsl.tpnet.pl. [95.49.80.26])
        by smtp.gmail.com with ESMTPSA id r5sm227225wmr.15.2020.03.29.11.43.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Mar 2020 11:43:44 -0700 (PDT)
Subject: Re: [PATCH v18 4/4] leds: multicolor: Introduce a multicolor class
 definition
To:     Dan Murphy <dmurphy@ti.com>, pavel@ucw.cz
Cc:     linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        Greg KH <gregkh@linuxfoundation.org>
References: <20200324181434.24721-1-dmurphy@ti.com>
 <20200324181434.24721-5-dmurphy@ti.com>
 <f43bf4c5-948d-b87f-9b95-98fcfeaae2fa@gmail.com>
 <9a707fe6-31c6-da9e-9372-51ca21bf3c88@ti.com>
 <1263c2f9-3cb3-f919-cce8-53201d64e121@gmail.com>
 <0e782f2d-2968-50c0-bf34-7ee781014ef8@ti.com>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Autocrypt: addr=jacek.anaszewski@gmail.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <ea7915a1-91ea-43d5-2e96-99d1ecc49875@gmail.com>
Date:   Sun, 29 Mar 2020 20:43:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <0e782f2d-2968-50c0-bf34-7ee781014ef8@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Dan,

On 3/29/20 5:14 PM, Dan Murphy wrote:
> Jacek
> 
> On 3/29/20 7:47 AM, Jacek Anaszewski wrote:
>> Dan,
>>
>> On 3/28/20 10:31 PM, Dan Murphy wrote:
>>> Jacek
>>>
>>> Thanks for the review
>>>
>>> On 3/28/20 9:03 AM, Jacek Anaszewski wrote:
>>>> Hi Dan,
>>>>
>>>> Thanks for the update. The picture would be more complete if
>>>> the patch set contained a client though.
>>> I was going to send the ones I did but they are pretty dirty from a code
>>> stand point.
>>>
>>> Besides I would expect the framework to change which then changes the
>>> driver code.
>>>
>>>> Anyway, please find my review remarks below.
>>>>
>>>> On 3/24/20 7:14 PM, Dan Murphy wrote:
>>>>> Introduce a multicolor class that groups colored LEDs
>>>>> within a LED node.
>>>>>
>> [...]
>>>>> +What:        /sys/class/leds/<led>/color_max_intensity
>>>>> +Date:        March 2020
>>>>> +KernelVersion:    5.8
>>>>> +Contact:    Dan Murphy <dmurphy@ti.com>
>>>>> +Description:    read
>>>>> +        Maximum intensity level for the LED color within the array.
>>>>> +        The max intensities for each color must be entered based
>>>>> on the
>>>>> +        color_index array.
>>>> I wonder if we should mention here that each LED within a cluster
>>>> should
>>>> have the same maximum intensity for linear color lightness calculation
>>>> via brightness file.
>>> Does it really have to?
>> Say we have two LEDs:
>>
>> red, intensity = 255, max_intensity = 255
>> green, intensity = 15, max_intensity = 15
>>
>> If setting global brightness to 127 we have:
>>
>> led[red].brightness = 127 * 255 / 255 = 127
>> led[green].brightness = 127 * 15 / 15 = 15 (cut down to max_intensity)
>>
>> Clearly for green LED you're not getting a value being a half of
>> the intensity range.
>>
>> In addition to my previous statement, global max_brightness
>> should also have the same value as all max color intensities.
> OK I will update the code and docs to indicate max_intensity should
> equal max_brightness.
>>
>> [...]
>>>>> +Directory Layout Example
>>>>> +========================
>>>>> +root:/sys/class/leds/multicolor:grouped_leds# ls -lR
>>>>> +-rw-r--r--    1 root     root          4096 Oct 19 16:16 brightness
>>>>> +-r--r--r--    1 root     root          4096 Oct 19 16:16 color_index
>>>>> +-rw-r--r--    1 root     root          4096 Oct 19 16:16
>>>>> color_intensity
>>>>> +-r--r--r--    1 root     root          4096 Oct 19 16:16
>>>>> color_max_intensity
>>>>> +-r--r--r--    1 root     root          4096 Oct 19 16:16
>>>>> num_color_leds
>>>>> +
>>>>> +Multicolor Class Brightness Control
>>>>> +===================================
>>>>> +The multiclor class framework will calculate each monochrome LEDs
>>>>> intensity.
>>>>> +
>>>>> +The brightness level for each LED is calculated based on the color
>>>>> LED
>>>>> +intensity setting divided by the color LED max intensity setting
>>>>> multiplied by
>>>>> +the requested brightness.
>>>>> +
>>>>> +led_brightness = brightness * color_intensity/color_max_intensity
>>>> Maybe some pseudo code would allow for better understanding here:
>>>>
>>>> for color in color_intensity
>>>>       led[color].brightness = brightness *
>>>>      led[color].intensity / led[color].max_intensity
>>> I think this would be fine at least there is a documented equation. I
>>> don't think we need to document the code.
>> You mean what would be fine - my or your solution ? :-)
> My solution is probably good enough for documentation

OK, this description actually mentions "The brightness level for each
LED" so it should be fine as is.

>> [...]
>>>>> +static ssize_t color_intensity_store(struct device *dev,
>>>>> +                struct device_attribute *intensity_attr,
>>>>> +                const char *buf, size_t size)
>>>>> +{
>>>>> +    struct led_classdev *led_cdev = dev_get_drvdata(dev);
>>>>> +    struct led_classdev_mc *priv = lcdev_to_mccdev(led_cdev);
>>>>> +    int nrchars, offset = 0;
>>>>> +    int intensity_value[LED_COLOR_ID_MAX];
>>>>> +    int i;
>>>>> +    ssize_t ret;
>>>>> +
>>>>> +    mutex_lock(&led_cdev->led_access);
>>>>> +
>>>>> +    for (i = 0; i < priv->num_colors; i++) {
>>>>> +        ret = sscanf(buf + offset, "%i%n",
>>>>> +                 &intensity_value[i], &nrchars);
>>>>> +        if (ret != 1) {
>>>>> +            dev_err(led_cdev->dev,
>>>>> +                "Incorrect number of LEDs expected %i values
>>>>> intensity was not applied\n",
>>>>> +                priv->num_colors);
>>>>> +            goto err_out;
>>>>> +        }
>>>>> +        offset += nrchars;
>>>>> +    }
>>>> I've just realized that moving to single color_intensity file
>>>> doesn't allow setting all colors together with new brightness
>>>> atomically. In effect, we will need to pass brightness to this file
>>>> too,
>>>> if we want to avoid "interesting" latching via brightenss file.
>>>>
>>>> Then we would need to call led_set_brightness() from here as well.
>>> Why?  This just caches the intensity of each colored LED.  Then the
>>> actual brightness is calculated only when the brightness file is
>>> updated.
>> And this is wrong. We should be able to set the color with a single
>> write.
> 
> Well that is a change in philosophy and direction from the prior patches.
> 
> You only wanted the LEDs to update when the brightness file was written.
> Why the change in stance?

It was devised for an interface with separate sysfs file per color.
Now we can leverage the fact that we will have single file for setting
all color intensities.

>>> This would be an automatic update of the LED and that is not the intent
>>> of the intensity file per the documentation.
>> Documentation needs to be changed then.
>>
>>> The user should be able to set the colors x number of times before the
>>> LED group is actually updated with the brightness.
>> What benefit would stem from that? In fact we should be able to
>> atomically set color in two ways, either via brightness or via
>> color_intensity file.
>>
>> But in previous message I unnecessarily proposed the addition
>> of brightness to the color_intensity interface. It is not needed
>> since updating color intensities should be considered as setting
>> entirely new color and that should reset global brightness to
>> max_brightness.
>>
>> Therefore here we should call at the end:
>>
>> led_set_brightness(led_cdev, led_cdev->max_brightness);
>>
>> That will update each color LED with new brightness values which
>> will correspond exactly to the color intensities just written.
>>
>> [...]
>>>>> diff --git a/include/linux/led-class-multicolor.h
>>>>> b/include/linux/led-class-multicolor.h
>>>>> new file mode 100644
>>>>> index 000000000000..bfbde2e98340
>>>>> --- /dev/null
>>>>> +++ b/include/linux/led-class-multicolor.h
>>>>> @@ -0,0 +1,124 @@
>>>>> +/* SPDX-License-Identifier: GPL-2.0 */
>>>>> +/* LED Multicolor class interface
>>>>> + * Copyright (C) 2019 Texas Instruments Incorporated -
>>>>> http://www.ti.com/
>>>>> + */
>>>>> +
>>>>> +#ifndef __LINUX_MULTICOLOR_LEDS_H_INCLUDED
>>>>> +#define __LINUX_MULTICOLOR_LEDS_H_INCLUDED
>>>>> +
>>>>> +#include <linux/leds.h>
>>>>> +#include <dt-bindings/leds/common.h>
>>>>> +
>>>>> +struct led_classdev_mc {
>>>>> +    /* led class device */
>>>>> +    struct led_classdev led_cdev;
>>>>> +
>>>>> +    struct device_attribute color_max_intensity_attr;
>>>>> +    struct device_attribute color_intensity_attr;
>>>>> +    struct device_attribute color_index_attr;
>>>> These are no longer needed as you define attrs statically.
>>> Ack
>>>>> +
>>>>> +    int color_brightness[LED_COLOR_ID_MAX];
>>>>> +
>>>>> +    int color_led_intensity[LED_COLOR_ID_MAX];
>>>>> +    int color_led_max_intensity[LED_COLOR_ID_MAX];
>>>>> +    const char *color_index[LED_COLOR_ID_MAX];
>>>> I think that we should get back to the available_colors bitmask
>>>> and allow the framework to allocate arrays by itself.
>>>> And yes, all the above should be pointers.
>>>>
>>>> Driver would only need to set led_mcdev->available_colors bits.
>>> Nack to the available_colors.  I did this originally and the issue is
>>> that the driver sets the bits in available_colors and no matter what the
>>> order is in the DT file the indexing is always red green and blue per
>>> the LED_COLORS array.  The framework has no legitimate way to know the
>>> order in which the colors were added.
>>>
>>> This posed an issue with the LP55xx code as the RGB was defined with
>>> different colors assigned to different channels.  Green was 0 blue was 2
>>> and red was 6.  So the driver would have to map the channels to the
>>> colors.  In forcing the device driver to set the color index it can then
>>> map the output channels itself.  The framework should not care what
>>> channel is for what color.  In either case the device driver will need
>>> to store the color index mapped to the channel output but having the
>>> index to color being a 1-1 mapping made the code much simpler for the
>>> device driver.
>>>
>>> Basically it turned out to be a simple for loop that just stored both
>>> channel and color as opposed to having to re-map the colors to indexes.
>>>
>>> So for the LP55xx I can get an index of green, blue red and that maps to
>>> the channels per the DT.  I don't think the framework should enforce a
>>> standard color index array ordering.
>> OK, if that indeed helps simplifying the code on the driver side.
>> But maybe it would be possible to come up with some generic helpers
>> for color sub-LEDs initialization?
> 
> Well the only helpers I can think of is a DT helper to parse the
> Multicolor child nodes.  But that maybe more complicated for the LP55xx
> as the children have additional
> 
> properties to parse through.  But the multicolor framework can parse the
> color and channel which means we would have to mandate the use of a
> specific common property node like
> 
> led_sources even if it is just a single channel.

Let's see how the driver will look like after adding array allocations.
Maybe something will come to one's mind after seeing the code.

>>> If we use the available_colors we don't even need the color_index and we
>>> can just pass the available_colors to the user space as a u32 and let
>>> the user space figure what colors are available. Which means the user
>>> space would assume the order per the LED_COLORS array.
>> Sysfs should be rather human readable so this would not necessarily
>> need to be the case.
>>
> That is what I was thinking as well.
> 
> Dan
> 

-- 
Best regards,
Jacek Anaszewski
