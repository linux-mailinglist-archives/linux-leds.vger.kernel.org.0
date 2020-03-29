Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7A816196E27
	for <lists+linux-leds@lfdr.de>; Sun, 29 Mar 2020 17:20:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728089AbgC2PUu (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 29 Mar 2020 11:20:50 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:36352 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728080AbgC2PUu (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 29 Mar 2020 11:20:50 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 02TFKdm9006689;
        Sun, 29 Mar 2020 10:20:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1585495239;
        bh=opppOPkT1iAvpXGqX1KWIYDk1ZCLfBICfdiebBaS9HA=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=kjnXnxv/NrO4qY9/37GRBUI6S7mKTBBObIK4D3D6JpVqAiSwhcSdUUR76POiaJDLI
         E49LlBmv98rHth0UnfQHaEisMarC7BX1K+VfSD/4dv+/mOZA4DoOaCCPm3RvECF+Gr
         c5uz80gbWyEz63jqE9eUeP72eGS3J97LW8SGHKgc=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02TFKdIT087506;
        Sun, 29 Mar 2020 10:20:39 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Sun, 29
 Mar 2020 10:20:38 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Sun, 29 Mar 2020 10:20:38 -0500
Received: from [10.250.52.63] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02TFKc50019039;
        Sun, 29 Mar 2020 10:20:38 -0500
Subject: Re: [PATCH v18 4/4] leds: multicolor: Introduce a multicolor class
 definition
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>
CC:     <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>
References: <20200324181434.24721-1-dmurphy@ti.com>
 <20200324181434.24721-5-dmurphy@ti.com>
 <f43bf4c5-948d-b87f-9b95-98fcfeaae2fa@gmail.com>
 <9a707fe6-31c6-da9e-9372-51ca21bf3c88@ti.com>
 <1263c2f9-3cb3-f919-cce8-53201d64e121@gmail.com>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <0e782f2d-2968-50c0-bf34-7ee781014ef8@ti.com>
Date:   Sun, 29 Mar 2020 10:14:53 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <1263c2f9-3cb3-f919-cce8-53201d64e121@gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Jacek

On 3/29/20 7:47 AM, Jacek Anaszewski wrote:
> Dan,
>
> On 3/28/20 10:31 PM, Dan Murphy wrote:
>> Jacek
>>
>> Thanks for the review
>>
>> On 3/28/20 9:03 AM, Jacek Anaszewski wrote:
>>> Hi Dan,
>>>
>>> Thanks for the update. The picture would be more complete if
>>> the patch set contained a client though.
>> I was going to send the ones I did but they are pretty dirty from a code
>> stand point.
>>
>> Besides I would expect the framework to change which then changes the
>> driver code.
>>
>>> Anyway, please find my review remarks below.
>>>
>>> On 3/24/20 7:14 PM, Dan Murphy wrote:
>>>> Introduce a multicolor class that groups colored LEDs
>>>> within a LED node.
>>>>
> [...]
>>>> +What:        /sys/class/leds/<led>/color_max_intensity
>>>> +Date:        March 2020
>>>> +KernelVersion:    5.8
>>>> +Contact:    Dan Murphy <dmurphy@ti.com>
>>>> +Description:    read
>>>> +        Maximum intensity level for the LED color within the array.
>>>> +        The max intensities for each color must be entered based on the
>>>> +        color_index array.
>>> I wonder if we should mention here that each LED within a cluster should
>>> have the same maximum intensity for linear color lightness calculation
>>> via brightness file.
>> Does it really have to?
> Say we have two LEDs:
>
> red, intensity = 255, max_intensity = 255
> green, intensity = 15, max_intensity = 15
>
> If setting global brightness to 127 we have:
>
> led[red].brightness = 127 * 255 / 255 = 127
> led[green].brightness = 127 * 15 / 15 = 15 (cut down to max_intensity)
>
> Clearly for green LED you're not getting a value being a half of
> the intensity range.
>
> In addition to my previous statement, global max_brightness
> should also have the same value as all max color intensities.
OK I will update the code and docs to indicate max_intensity should 
equal max_brightness.
>
> [...]
>>>> +Directory Layout Example
>>>> +========================
>>>> +root:/sys/class/leds/multicolor:grouped_leds# ls -lR
>>>> +-rw-r--r--    1 root     root          4096 Oct 19 16:16 brightness
>>>> +-r--r--r--    1 root     root          4096 Oct 19 16:16 color_index
>>>> +-rw-r--r--    1 root     root          4096 Oct 19 16:16
>>>> color_intensity
>>>> +-r--r--r--    1 root     root          4096 Oct 19 16:16
>>>> color_max_intensity
>>>> +-r--r--r--    1 root     root          4096 Oct 19 16:16 num_color_leds
>>>> +
>>>> +Multicolor Class Brightness Control
>>>> +===================================
>>>> +The multiclor class framework will calculate each monochrome LEDs
>>>> intensity.
>>>> +
>>>> +The brightness level for each LED is calculated based on the color LED
>>>> +intensity setting divided by the color LED max intensity setting
>>>> multiplied by
>>>> +the requested brightness.
>>>> +
>>>> +led_brightness = brightness * color_intensity/color_max_intensity
>>> Maybe some pseudo code would allow for better understanding here:
>>>
>>> for color in color_intensity
>>>       led[color].brightness = brightness *
>>>      led[color].intensity / led[color].max_intensity
>> I think this would be fine at least there is a documented equation. I
>> don't think we need to document the code.
> You mean what would be fine - my or your solution ? :-)
My solution is probably good enough for documentation
>
> [...]
>>>> +static ssize_t color_intensity_store(struct device *dev,
>>>> +                struct device_attribute *intensity_attr,
>>>> +                const char *buf, size_t size)
>>>> +{
>>>> +    struct led_classdev *led_cdev = dev_get_drvdata(dev);
>>>> +    struct led_classdev_mc *priv = lcdev_to_mccdev(led_cdev);
>>>> +    int nrchars, offset = 0;
>>>> +    int intensity_value[LED_COLOR_ID_MAX];
>>>> +    int i;
>>>> +    ssize_t ret;
>>>> +
>>>> +    mutex_lock(&led_cdev->led_access);
>>>> +
>>>> +    for (i = 0; i < priv->num_colors; i++) {
>>>> +        ret = sscanf(buf + offset, "%i%n",
>>>> +                 &intensity_value[i], &nrchars);
>>>> +        if (ret != 1) {
>>>> +            dev_err(led_cdev->dev,
>>>> +                "Incorrect number of LEDs expected %i values
>>>> intensity was not applied\n",
>>>> +                priv->num_colors);
>>>> +            goto err_out;
>>>> +        }
>>>> +        offset += nrchars;
>>>> +    }
>>> I've just realized that moving to single color_intensity file
>>> doesn't allow setting all colors together with new brightness
>>> atomically. In effect, we will need to pass brightness to this file too,
>>> if we want to avoid "interesting" latching via brightenss file.
>>>
>>> Then we would need to call led_set_brightness() from here as well.
>> Why?  This just caches the intensity of each colored LED.  Then the
>> actual brightness is calculated only when the brightness file is updated.
> And this is wrong. We should be able to set the color with a single
> write.

Well that is a change in philosophy and direction from the prior patches.

You only wanted the LEDs to update when the brightness file was written. 
Why the change in stance?

>> This would be an automatic update of the LED and that is not the intent
>> of the intensity file per the documentation.
> Documentation needs to be changed then.
>
>> The user should be able to set the colors x number of times before the
>> LED group is actually updated with the brightness.
> What benefit would stem from that? In fact we should be able to
> atomically set color in two ways, either via brightness or via
> color_intensity file.
>
> But in previous message I unnecessarily proposed the addition
> of brightness to the color_intensity interface. It is not needed
> since updating color intensities should be considered as setting
> entirely new color and that should reset global brightness to
> max_brightness.
>
> Therefore here we should call at the end:
>
> led_set_brightness(led_cdev, led_cdev->max_brightness);
>
> That will update each color LED with new brightness values which
> will correspond exactly to the color intensities just written.
>
> [...]
>>>> diff --git a/include/linux/led-class-multicolor.h
>>>> b/include/linux/led-class-multicolor.h
>>>> new file mode 100644
>>>> index 000000000000..bfbde2e98340
>>>> --- /dev/null
>>>> +++ b/include/linux/led-class-multicolor.h
>>>> @@ -0,0 +1,124 @@
>>>> +/* SPDX-License-Identifier: GPL-2.0 */
>>>> +/* LED Multicolor class interface
>>>> + * Copyright (C) 2019 Texas Instruments Incorporated -
>>>> http://www.ti.com/
>>>> + */
>>>> +
>>>> +#ifndef __LINUX_MULTICOLOR_LEDS_H_INCLUDED
>>>> +#define __LINUX_MULTICOLOR_LEDS_H_INCLUDED
>>>> +
>>>> +#include <linux/leds.h>
>>>> +#include <dt-bindings/leds/common.h>
>>>> +
>>>> +struct led_classdev_mc {
>>>> +    /* led class device */
>>>> +    struct led_classdev led_cdev;
>>>> +
>>>> +    struct device_attribute color_max_intensity_attr;
>>>> +    struct device_attribute color_intensity_attr;
>>>> +    struct device_attribute color_index_attr;
>>> These are no longer needed as you define attrs statically.
>> Ack
>>>> +
>>>> +    int color_brightness[LED_COLOR_ID_MAX];
>>>> +
>>>> +    int color_led_intensity[LED_COLOR_ID_MAX];
>>>> +    int color_led_max_intensity[LED_COLOR_ID_MAX];
>>>> +    const char *color_index[LED_COLOR_ID_MAX];
>>> I think that we should get back to the available_colors bitmask
>>> and allow the framework to allocate arrays by itself.
>>> And yes, all the above should be pointers.
>>>
>>> Driver would only need to set led_mcdev->available_colors bits.
>> Nack to the available_colors.  I did this originally and the issue is
>> that the driver sets the bits in available_colors and no matter what the
>> order is in the DT file the indexing is always red green and blue per
>> the LED_COLORS array.  The framework has no legitimate way to know the
>> order in which the colors were added.
>>
>> This posed an issue with the LP55xx code as the RGB was defined with
>> different colors assigned to different channels.  Green was 0 blue was 2
>> and red was 6.  So the driver would have to map the channels to the
>> colors.  In forcing the device driver to set the color index it can then
>> map the output channels itself.  The framework should not care what
>> channel is for what color.  In either case the device driver will need
>> to store the color index mapped to the channel output but having the
>> index to color being a 1-1 mapping made the code much simpler for the
>> device driver.
>>
>> Basically it turned out to be a simple for loop that just stored both
>> channel and color as opposed to having to re-map the colors to indexes.
>>
>> So for the LP55xx I can get an index of green, blue red and that maps to
>> the channels per the DT.  I don't think the framework should enforce a
>> standard color index array ordering.
> OK, if that indeed helps simplifying the code on the driver side.
> But maybe it would be possible to come up with some generic helpers
> for color sub-LEDs initialization?

Well the only helpers I can think of is a DT helper to parse the 
Multicolor child nodes.  But that maybe more complicated for the LP55xx 
as the children have additional

properties to parse through.  But the multicolor framework can parse the 
color and channel which means we would have to mandate the use of a 
specific common property node like

led_sources even if it is just a single channel.

>> If we use the available_colors we don't even need the color_index and we
>> can just pass the available_colors to the user space as a u32 and let
>> the user space figure what colors are available. Which means the user
>> space would assume the order per the LED_COLORS array.
> Sysfs should be rather human readable so this would not necessarily
> need to be the case.
>
That is what I was thinking as well.

Dan

