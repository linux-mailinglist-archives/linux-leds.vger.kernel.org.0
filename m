Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 54F314E9DC
	for <lists+linux-leds@lfdr.de>; Fri, 21 Jun 2019 15:48:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726032AbfFUNsz (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 21 Jun 2019 09:48:55 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:35603 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725975AbfFUNsy (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 21 Jun 2019 09:48:54 -0400
Received: by mail-wr1-f68.google.com with SMTP id m3so6699267wrv.2
        for <linux-leds@vger.kernel.org>; Fri, 21 Jun 2019 06:48:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=hVMU7oaSKdkRdlofymJ5DYfLIF+rwC/yvVaWh3kOoEw=;
        b=JgTh/4RaznsHwkTN653/84e9sr7CP/NNg3yehyl8WKHWGl0VbSpb8RVRqYFsGV7EWo
         LHVmS2028eAVgaoA36BkKonyKPyJhPREea/eOHDTH1R4xJtCMwwLY3WfoCC8p8kWXFCu
         zy5qu7gv46sJfHcgCqEx6cfCfFEFJi48fvpL3sfOX9fyYMAMW/M9Dz2lXEaQyFOTki4s
         jxDFwmpbiI3ycbK9UpNNJ7N/1/+QrDDmRKzxAp6JaahNzBnT80KH25uBBtwaXGQav74E
         lNgkT4HZBdmB9HFHWlbNSpIB6X5H91uOoR7sE2bBo14aK6OHLjGE4mbVa2PKDpEYVW8Z
         GqRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=hVMU7oaSKdkRdlofymJ5DYfLIF+rwC/yvVaWh3kOoEw=;
        b=sxEEupraaWh0dPLb+k5iRZglpWctjmjfOd5j3aMGdXXW4ea3JJcu25Q/SU0S3wqkRU
         LUfAUpUNHm4+WUpbF0L0A/WmlhdHweslzNmjVKLs1y4qOqTvWF7LKNFerewQ1ovZqR7V
         C/1wQ+jajy36w44Vc0VMrCKZ7i0betbZcrmWgaeVi9vd0ezjD+RbyQPL6L4b6OwZAExN
         KnWiJ8/+DvhFHtLZ8u/jD02ob/Fkg0yLGeI3b7pmLg9yQAcrGpeKPQLJgFKetWc5Uhzo
         CXFXCvTmrYOMtkJDraKuLSiG0o5MFpru9OfxQQ3s6uidEe0nA1XdTub4IrD3DSV5wPDR
         VXUg==
X-Gm-Message-State: APjAAAUsu1X6z8FK7w/Bhp23hj4DJtTh+AghTtwsUIkMy/iTf+YGV36H
        /CYXMjIgN/DF5WVOhmurStSv/g==
X-Google-Smtp-Source: APXvYqwR9joQI2E3Vm5sKE/BzZA1o04AWct01TioDhmMeym+jKVOUv8KuGh9LmMdwjzUIU+jGE4/2w==
X-Received: by 2002:adf:f946:: with SMTP id q6mr10474826wrr.109.1561124932997;
        Fri, 21 Jun 2019 06:48:52 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net. [86.9.19.6])
        by smtp.googlemail.com with ESMTPSA id 5sm5076469wrc.76.2019.06.21.06.48.51
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Fri, 21 Jun 2019 06:48:52 -0700 (PDT)
Subject: Re: Re: Re: [PATCH 2/3] backlight/arcxcnn fix vendor prefix
To:     Brian Dodge <bdodge09@gmail.com>, Pavel Machek <pavel@ucw.cz>
Cc:     lee.jones@linaro.org, jingoohan1@gmail.com,
        jacek.anaszewski@gmail.com, robh+dt@kernel.org,
        mark.rutland@arm.com, dri-devel@lists.freedesktop.org,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        Peter Bacon <pbacon@psemi.com>
References: <1541592640-18478-1-git-send-email-bdodge09@gmail.com>
 <1541592640-18478-3-git-send-email-bdodge09@gmail.com>
 <20181111113053.GF27666@amd> <e372391c-1fd5-41ec-b766-7669fffb928d@gmail.com>
 <c4477220-7159-b5a8-16ea-4f4dbb645ced@linaro.org>
From:   Daniel Thompson <daniel.thompson@linaro.org>
Message-ID: <da193d14-5cb7-3a1a-148e-fb8554c5def7@linaro.org>
Date:   Fri, 21 Jun 2019 14:48:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <c4477220-7159-b5a8-16ea-4f4dbb645ced@linaro.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 21/06/2019 14:46, Daniel Thompson wrote:
> [Sorry to those receiving this twice... had to dig this out from the 
> archives and sent it to the lists from the wrong mailer]
> 
> On 27/11/2018 00:44, Brian Dodge wrote:
>> Thank you Pavel, that is a good point.
>>
>> The chip vendor has indicated that there is no reason to maintain the 
>> old/improper prefix and wishes to go forward (only) with the "arctic" 
>> prefix and any existing dts files are or will be updated.
> 
> Looks like this patch series has fallen into the cracks a little.
> 
> I think I assumed this info would end in the description of patch v2 1/3 
> (in order to answer Rob's feedback) and I sat and waited for a respin. 
> On the other hand... I didn't actually say that explicitly anywhere! 
> So... I'd recommend a respin perhaps with a small bit of text explaining 
> how the vendor can state that any existing dts files will be updated. 
> This is a peripheral device so these strings are probably embedded into 
> OEM devicetrees rather than exclusively under the control of the vendor.

In fact there's a publicly available example using this binding:
https://chromium.googlesource.com/chromiumos/third_party/kernel/+/factory-gru-8652.B-chromeos-4.4/arch/arm64/boot/dts/rockchip/rk3399-gru-gru.dtsi

I'm not sure it could be changed without maintaining support for old names.


Daniel.


> 
> 
> Daniel.
> 
> 
>>
>> On 11/11/18 6:30 AM, Pavel Machek wrote:
>>> Hi!
>>>
>>>> The vendor-prefixes.txt file properly refers to ArcticSand
>>>> as arctic but the driver improperly abbreviated the prefix
>>>> to arc. This was a mistake in the original patch
>>>>
>>>> Signed-off-by: Brian Dodge <bdodge09@gmail.com>
>>>> ---
>>>>   drivers/video/backlight/arcxcnn_bl.c | 22 +++++++++++-----------
>>>>   1 file changed, 11 insertions(+), 11 deletions(-)
>>>>
>>>>    *
>>>> - * Copyright 2016 ArcticSand, Inc.
>>>> - * Author : Brian Dodge <bdodge@arcticsand.com>
>>>> + * Copyright 2018 pSemi, Inc.
>>>> + * Author : Brian Dodge <bdodge@psemi.com>
>>> Ummm. Copyright 2016-2018?
>>>
>>>> @@ -202,27 +202,27 @@ static void arcxcnn_parse_dt(struct arcxcnn *lp)
>>>>       if (ret == 0)
>>>>           lp->pdata->initial_brightness = prog_val;
>>>>
>>>> -    ret = of_property_read_u32(node, "arc,led-config-0", &prog_val);
>>>> +    ret = of_property_read_u32(node, "arctic,led-config-0", 
>>>> &prog_val);
>>>>       if (ret == 0)
>>>>           lp->pdata->led_config_0 = (u8)prog_val;
>>>>
>>> If there's a dts using this, you want to update it at the same
>>> time. You may want to support both names going forward.
>>>                                     Pavel
> 

