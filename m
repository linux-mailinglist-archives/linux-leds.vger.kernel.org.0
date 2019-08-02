Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0ED30800EE
	for <lists+linux-leds@lfdr.de>; Fri,  2 Aug 2019 21:27:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405452AbfHBT1n (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 2 Aug 2019 15:27:43 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:33682 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405450AbfHBT1n (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 2 Aug 2019 15:27:43 -0400
Received: by mail-wr1-f68.google.com with SMTP id n9so78380397wru.0;
        Fri, 02 Aug 2019 12:27:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=eb4swWHH3LXxdKG0OgqKABMWblY7CnFPZGTwHwDtgc4=;
        b=L2Rn0f620LmPgfMz/QNmgC3WfMH09xGeufGieN1SgeSxYU1uh5imAFGub021j7BNft
         PwL8O+kA9E3bAoWqMwdoaUaQaFoewkVsbUxpmzqG41pD1PMZww/gsIeoFKsuQ5+065w/
         0UHukEsU5H0fhDEBT2p5B0qWLDVSlrkFeLsJ4HP/4JSqzHoYefRnpBJzAyz/dQ4Oc+SK
         jZRHP3itc2dkUthaP5znSQY1fl3b8YZwGlA2xnGe9KG2uAeK/7pjixBpoN1IhVh7dSun
         BBwelvsaplyf+b3H8D2Ee5uqqPuHq/Ju+kXA+W/KeERDn/cZ9ZSPIYdpXgyQyKbNISge
         ogag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=eb4swWHH3LXxdKG0OgqKABMWblY7CnFPZGTwHwDtgc4=;
        b=P705Xku+F2D+vRgTt93HdhiY8T3E1N3hevHIJZ1OjYdp35jH7eMfP5f7B82JP+MFR/
         z9dHp0yr7y2adNuivdnzvHlrRZVQtB3NEbyFaTsZnYgqiDndVMIEv6NTI23PozSRdFyd
         Vk/JVVgZabihc/T4NxDL8omZGgCow+hyIRz7UIA8wUX1/s2hGWYH/dR3HQaFRSIKmjuE
         C2ewbCwn8ZYuiXCmeIA1B40y+iX/JlDZx4KbBHuuVnwattrfMP5EVlmKqYdoIzSM9WYz
         01m73Ok5UBwz+GGwER03itlzWpK19p3l+JuTT7J5HvpkiMHQQl9sV6B50C+/RzxN5ow8
         egkw==
X-Gm-Message-State: APjAAAUm12bgi8/Z5SR1YZJsANPRlJ7I7yPNoQA/UKs4bWUFQ3xLLOcK
        zeyOau7M468DlkyeG3cyx5lo4gTM
X-Google-Smtp-Source: APXvYqwifUx/9EYc7My9IFUB7S1FEVuvTMvfhTCF53qN7+0YlcL0fwvv3HjeQi39RdSXMZqg62n9HA==
X-Received: by 2002:adf:f812:: with SMTP id s18mr11588153wrp.32.1564774059380;
        Fri, 02 Aug 2019 12:27:39 -0700 (PDT)
Received: from [192.168.1.19] (chr175.neoplus.adsl.tpnet.pl. [83.31.15.175])
        by smtp.gmail.com with ESMTPSA id 5sm63412936wmg.42.2019.08.02.12.27.38
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 02 Aug 2019 12:27:38 -0700 (PDT)
Subject: Re: [PATCH v4 6/9] leds: multicolor: Introduce a multicolor class
 definition
To:     Dan Murphy <dmurphy@ti.com>, pavel@ucw.cz
Cc:     linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20190725182818.29556-1-dmurphy@ti.com>
 <20190725182818.29556-7-dmurphy@ti.com>
 <fa74cc04-61fc-161f-2ce1-6de5921fce2f@gmail.com>
 <f83b0f42-a310-a800-1b78-d5fb89516114@ti.com>
 <f78ee3a4-596c-1b0c-3c91-15aad85ba9b2@gmail.com>
 <eefe2541-29d4-e438-eade-6c15f506fc53@ti.com>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=jacek.anaszewski@gmail.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <07583843-b91e-3028-2661-7d8f4395a0fa@gmail.com>
Date:   Fri, 2 Aug 2019 21:27:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <eefe2541-29d4-e438-eade-6c15f506fc53@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Dan,

On 8/2/19 4:14 PM, Dan Murphy wrote:
> Jacek
> 
> On 7/31/19 3:44 PM, Jacek Anaszewski wrote:
>> Dan,
>>
> [...]
>> +    for (i = 0; i < mcled_cdev->num_leds; i++) {
>> +        ret = sscanf(buf + offset, "%i%n", &value[i], &nrchars);
>> +        if (ret != 1)
>> +            break;
>> +
>> +        offset += nrchars;
>> +    }
>> +
>> +    if (i != mcled_cdev->num_leds) {
>>>> Shouldn't we return error if i != mcled_cdev->num_leds - 1 ?
>>>> How can we know which color the value will be for if there is less
>>>> values passed than the total number of colors in the cluster?
>>> Ok so during my testing if I had the monochrome array as <R G B>
>>>
>>> When I wrote only <R G> and no blue I was getting random values in the
>>> array for the
>>>
>>> remaining indexes and the blue LED would randomly turn on/off at
>>> different levels.
>>>
>>> So if the user passes in less then expected only ids with data will be
>>> written and the other colors will be turned off by the for loop below.
>>  From what I see it will lead to wrong mapping of given color to the
>> value array element in the following case:
>>
>> echo "<green> <blue>" > color_mix
>>
>> Then green intensity will be assigned to value[0] (expects red) and blue
>> to value[1] (expects green). Unless I don't get something.
>> Your ABI documentation doesn't mention any way to redefine the color_id
>> returned by <color>/color_id file. And that is good.
>>
> This is exactly the issue I had previously brought up.  The user would
> need to
> 
> write all leading colors with a value, even if 0, to correctly set the
> target LEDs.
> 
> We can protect against the trailing colors but not leading colors.
> 
> The expectation is that the user space would read the color_id from the
> file and align
> 
> the array accordingly.  This is also why I exposed the intensity under
> the color so if the
> 
> user wanted to not use color_mix file they can update the intensity per
> LED color.
>

I can't see the problem. Just require user to _always_ pass the number
of values equal to the number of colors under LED multicolor class
device. No more, no less. And fail it this condition is not met.

>>>>> +        for (; i < LED_COLOR_ID_MAX; i++)
>>>>> +            value[i] = 0;
>>>> What use case is it for?
>>> See above but this should be
>>>
>>> for (; i < mcled_cdev->num_leds; i++)
>>>
> I might be able to eliminate this loop by initializing the array to 0.
> 
> 
>>>>> +    }
>>>>> +
>>>>> +    list_for_each_entry(priv, &data->color_list, list) {
>>>>> +        if (data->cluster_brightness) {
>>>>> +            adj_brightness =
>>>>> calculate_brightness(data->cluster_brightness,
>>>>> +                                  value[priv->color_index],
>>>>> +                                 priv->max_intensity);
>>>>> +            ret = ops->set_color_brightness(priv->mcled_cdev,
>>>>> +                            priv->color_id,
>>>>> +                            adj_brightness);
>>>>> +            if (ret < 0)
>>>>> +                goto done;
>>>>> +        }
>>>>> +
>>>>> +        priv->intensity = value[priv->color_index];
>>>>> +    }
>>>> Here we could use just brightness_set op as a single call. We should
>>>> always write all colors as a result of write to color_mix anyway.
>>> I guess what is gained by just passing the array down to the device
>>> driver and having it
>>>
>>> parse the array and do the peripheral call?
>> Those array values would not be directly written to the device,
>> but used for calculating the actual iout intensities. Driver
>> will just have to call calculate_brightness() (sticking to the naming
>> from this patch) and write the results calculated basing on brightness
>> and max_brightness.
> 
> I would expect that we would do the same behavior for the color_mix file
> then.

Yes, this is what I meant while mentioning use of brightness_set op
for that. The final effect will be always the same - write of the
altered iout intensity registers. What will differ will be factors
of the equation that calculates iout intensity: for the call
originating from color_mix file the changing factor will be color
intensity and for the call originating from brightness file
it will be brightness. In both cases on the driver side we need
to call the same function to calculate iout values using the same
equation.

> 
>> [...]
>>>>> +
>>>>> +    priv->new_intensity = value;
>>>>> +
>>>>> +    if (data->cluster_brightness) {
>>>>> +        adj_value = calculate_brightness(data->cluster_brightness,
>>>>> +                    priv->new_intensity,
>>>>> +                    priv->max_intensity);
>>>>> +        ret = ops->set_color_brightness(priv->mcled_cdev,
>>>>> +                        priv->color_id, adj_value);
>>>>> +        if (ret < 0) {
>>>>> +            priv->new_intensity = priv->intensity;
>>>> This is unnecessary complication. Just write the calculated iout
>>>> intensity.
>>> Not sure what complication you are referring to.
>> The whole need for new_intensity and cluster_brightness, and then
>> bringing back old intensity value on set_color_brightness() failure.
> 
> OK
> 
>>
>>>> We need to highlight it in the documentation that exact requested color
>>>> intensity values are written to the hardware only when
>>>> brightness == max_brightness.
>>> But that is not a true statement.  Thats not really how it was designed.
>> But it probably should be. It would simplify the design.
>>
>> So my idea is like I previously described the way I had first understood
>> this design:
>>
>> The colors set under colors directory don't reflect the iout
>> intensities, but are only used for calculating them, basing on the
>> brightness and max_intensity values.
>>
>> Effectively, after changing the colors/<color>/intensity the global
>> (legacy monochrome) brightness value will be still valid, since iout
>> color will be recalculated basing on it and the new color intensity.
>>
> OK.  This this would remove the ops from the driver as it is no longer
> needed.
> 
> The color_mix file will work the same way.

I've been pondering over the need for color_set, but it should be
indeed not needed too. Write to <color>/intensity file will also
call brightness_set - it will be comparing anyway old intensities
and new ones and will write only the affected register.


> What is the trigger then to update the LEDs?
> 
> We cannot write the same brightness value to trigger as the class blocks
> calling down
> 
> to the driver if brightness_in == brightness_current.

All files (intensity, color_mix and brightness) will use the same
brightness_set op for changing the iout values.

-- 
Best regards,
Jacek Anaszewski
