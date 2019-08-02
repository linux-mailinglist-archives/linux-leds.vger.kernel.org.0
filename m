Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 84BAA7FBDC
	for <lists+linux-leds@lfdr.de>; Fri,  2 Aug 2019 16:14:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391590AbfHBOOj (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 2 Aug 2019 10:14:39 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:39320 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389092AbfHBOOj (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 2 Aug 2019 10:14:39 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x72EEXAw106472;
        Fri, 2 Aug 2019 09:14:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1564755273;
        bh=Z5hefhV5hSx26XH6RwN+uY15+AnQr2UXcgts3xZH/Zc=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=xh3cexBLd9NglFOKglFA23i+G+4YtAZDXwMIFeLj2+P3/mgVVttlBlzben5wH13uq
         xQoE4CNoWvJKzCgsNg+y9NHbb0roUPTWDsjo4Y+o3mrOsV/x8+3dEpstgs0+gUMfhr
         OVKnFLxgPKksuhVGSgYnW3sOqkCWRbiO7Qc1kkog=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x72EEXfs092426
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 2 Aug 2019 09:14:33 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 2 Aug
 2019 09:14:33 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 2 Aug 2019 09:14:33 -0500
Received: from [10.250.65.13] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x72EEXJK014427;
        Fri, 2 Aug 2019 09:14:33 -0500
Subject: Re: [PATCH v4 6/9] leds: multicolor: Introduce a multicolor class
 definition
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>
CC:     <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20190725182818.29556-1-dmurphy@ti.com>
 <20190725182818.29556-7-dmurphy@ti.com>
 <fa74cc04-61fc-161f-2ce1-6de5921fce2f@gmail.com>
 <f83b0f42-a310-a800-1b78-d5fb89516114@ti.com>
 <f78ee3a4-596c-1b0c-3c91-15aad85ba9b2@gmail.com>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <eefe2541-29d4-e438-eade-6c15f506fc53@ti.com>
Date:   Fri, 2 Aug 2019 09:14:33 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <f78ee3a4-596c-1b0c-3c91-15aad85ba9b2@gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Jacek

On 7/31/19 3:44 PM, Jacek Anaszewski wrote:
> Dan,
>
[...]
> +    for (i = 0; i < mcled_cdev->num_leds; i++) {
> +        ret = sscanf(buf + offset, "%i%n", &value[i], &nrchars);
> +        if (ret != 1)
> +            break;
> +
> +        offset += nrchars;
> +    }
> +
> +    if (i != mcled_cdev->num_leds) {
>>> Shouldn't we return error if i != mcled_cdev->num_leds - 1 ?
>>> How can we know which color the value will be for if there is less
>>> values passed than the total number of colors in the cluster?
>> Ok so during my testing if I had the monochrome array as <R G B>
>>
>> When I wrote only <R G> and no blue I was getting random values in the
>> array for the
>>
>> remaining indexes and the blue LED would randomly turn on/off at
>> different levels.
>>
>> So if the user passes in less then expected only ids with data will be
>> written and the other colors will be turned off by the for loop below.
>  From what I see it will lead to wrong mapping of given color to the
> value array element in the following case:
>
> echo "<green> <blue>" > color_mix
>
> Then green intensity will be assigned to value[0] (expects red) and blue
> to value[1] (expects green). Unless I don't get something.
> Your ABI documentation doesn't mention any way to redefine the color_id
> returned by <color>/color_id file. And that is good.
>
This is exactly the issue I had previously brought up.  The user would 
need to

write all leading colors with a value, even if 0, to correctly set the 
target LEDs.

We can protect against the trailing colors but not leading colors.

The expectation is that the user space would read the color_id from the 
file and align

the array accordingly.  This is also why I exposed the intensity under 
the color so if the

user wanted to not use color_mix file they can update the intensity per 
LED color.

>>>> +        for (; i < LED_COLOR_ID_MAX; i++)
>>>> +            value[i] = 0;
>>> What use case is it for?
>> See above but this should be
>>
>> for (; i < mcled_cdev->num_leds; i++)
>>
I might be able to eliminate this loop by initializing the array to 0.


>>>> +    }
>>>> +
>>>> +    list_for_each_entry(priv, &data->color_list, list) {
>>>> +        if (data->cluster_brightness) {
>>>> +            adj_brightness =
>>>> calculate_brightness(data->cluster_brightness,
>>>> +                                  value[priv->color_index],
>>>> +                                 priv->max_intensity);
>>>> +            ret = ops->set_color_brightness(priv->mcled_cdev,
>>>> +                            priv->color_id,
>>>> +                            adj_brightness);
>>>> +            if (ret < 0)
>>>> +                goto done;
>>>> +        }
>>>> +
>>>> +        priv->intensity = value[priv->color_index];
>>>> +    }
>>> Here we could use just brightness_set op as a single call. We should
>>> always write all colors as a result of write to color_mix anyway.
>> I guess what is gained by just passing the array down to the device
>> driver and having it
>>
>> parse the array and do the peripheral call?
> Those array values would not be directly written to the device,
> but used for calculating the actual iout intensities. Driver
> will just have to call calculate_brightness() (sticking to the naming
> from this patch) and write the results calculated basing on brightness
> and max_brightness.

I would expect that we would do the same behavior for the color_mix file 
then.


> [...]
>>>> +
>>>> +    priv->new_intensity = value;
>>>> +
>>>> +    if (data->cluster_brightness) {
>>>> +        adj_value = calculate_brightness(data->cluster_brightness,
>>>> +                    priv->new_intensity,
>>>> +                    priv->max_intensity);
>>>> +        ret = ops->set_color_brightness(priv->mcled_cdev,
>>>> +                        priv->color_id, adj_value);
>>>> +        if (ret < 0) {
>>>> +            priv->new_intensity = priv->intensity;
>>> This is unnecessary complication. Just write the calculated iout
>>> intensity.
>> Not sure what complication you are referring to.
> The whole need for new_intensity and cluster_brightness, and then
> bringing back old intensity value on set_color_brightness() failure.

OK

>
>>> We need to highlight it in the documentation that exact requested color
>>> intensity values are written to the hardware only when
>>> brightness == max_brightness.
>> But that is not a true statement.  Thats not really how it was designed.
> But it probably should be. It would simplify the design.
>
> So my idea is like I previously described the way I had first understood
> this design:
>
> The colors set under colors directory don't reflect the iout
> intensities, but are only used for calculating them, basing on the
> brightness and max_intensity values.
>
> Effectively, after changing the colors/<color>/intensity the global
> (legacy monochrome) brightness value will be still valid, since iout
> color will be recalculated basing on it and the new color intensity.
>
OK.  This this would remove the ops from the driver as it is no longer 
needed.

The color_mix file will work the same way.

What is the trigger then to update the LEDs?

We cannot write the same brightness value to trigger as the class blocks 
calling down

to the driver if brightness_in == brightness_current.

Dan

