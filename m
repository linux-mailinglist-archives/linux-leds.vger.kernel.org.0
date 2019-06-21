Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 931EC4E9C3
	for <lists+linux-leds@lfdr.de>; Fri, 21 Jun 2019 15:46:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726029AbfFUNqJ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 21 Jun 2019 09:46:09 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:38165 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726018AbfFUNqJ (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 21 Jun 2019 09:46:09 -0400
Received: by mail-wr1-f66.google.com with SMTP id d18so6665368wrs.5
        for <linux-leds@vger.kernel.org>; Fri, 21 Jun 2019 06:46:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Fsl6G8YTqffB4W+GrIdfXouKWDu5oZYLhjb4Pl5CbAc=;
        b=maUqdBdFPl+T4iwpSMixGvxDvl62/w+KU299aTJVywzS6RF+/FyD5ACJTozKISJVYq
         1+tdS+0sxEspNhEflbXcbBJ3+yoFsFxu94hv5EkqhGfVfOmqURvqs5vXE+iysGv2b1hA
         TwThPtQplB9jihopLAL5D4RbNaj+hnzEGg4k+M1zC4k+7RxxF5YjtQLS0pvB8J3YGZBC
         k4WhZ8fhm3mPcj96W/v1iXmdbJDc7K5QMjasLj7SE0PHCawZlDn0e3vAXe7xMmgpauSn
         qwkeEKiMf8uiOZwdPQeGXBoOR7mz/AEd4niWPzKothP67RjI5hr8krPYi15okJCFq6hZ
         ve/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Fsl6G8YTqffB4W+GrIdfXouKWDu5oZYLhjb4Pl5CbAc=;
        b=ohJ5CBrmX1E/UBrW/kFBRa1T/P73/UOhRZspIXpWCq2E1i5rVattgLK/F/tKBvLWeg
         ERON4aioQnYG0cTNIZPJuKUTwzamDP4heEyOKMFVmdGVRn+gx7sVMK0vdmlNdqrnRVPB
         ZSrs/zbwclPQubvSKU0u6k72OZRG0Yxua9iL0GeZ0zWLDWKKVF2iVfuXF6H5yDM30rkR
         Dp2FnQJsL/WgVlehlFZA8Be/Po9L+1Yxtc8Mu5mAqkfh8CcCS7QrTjFSxyRZcSKqREG2
         fRvLbLPY/anb+VoAERIq2q4RjJqkw116yepA42zcgEUcI4wGi65UssbOP74yAlNEFRKg
         8QpA==
X-Gm-Message-State: APjAAAU6SYL0W5kyq1Ud8OZ0udS9VOEST5nmYU6rVqTcc26zFeUs364r
        QQLBtMtU56O2p/HHffYScssp7w==
X-Google-Smtp-Source: APXvYqzuxd700m2oO/6gDaV4ikgi9SOYwRR+juNE8PLe86NWJtDUoBfzcLJE+P87+e1rwJ4AtW3/Sg==
X-Received: by 2002:adf:f186:: with SMTP id h6mr6525375wro.274.1561124766992;
        Fri, 21 Jun 2019 06:46:06 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net. [86.9.19.6])
        by smtp.googlemail.com with ESMTPSA id n14sm5486804wra.75.2019.06.21.06.46.05
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Fri, 21 Jun 2019 06:46:06 -0700 (PDT)
Subject: Re: Re: [PATCH 2/3] backlight/arcxcnn fix vendor prefix
To:     Brian Dodge <bdodge09@gmail.com>, Pavel Machek <pavel@ucw.cz>
Cc:     lee.jones@linaro.org, jingoohan1@gmail.com,
        jacek.anaszewski@gmail.com, robh+dt@kernel.org,
        mark.rutland@arm.com, dri-devel@lists.freedesktop.org,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        Peter Bacon <pbacon@psemi.com>
References: <1541592640-18478-1-git-send-email-bdodge09@gmail.com>
 <1541592640-18478-3-git-send-email-bdodge09@gmail.com>
 <20181111113053.GF27666@amd> <e372391c-1fd5-41ec-b766-7669fffb928d@gmail.com>
From:   Daniel Thompson <daniel.thompson@linaro.org>
Message-ID: <c4477220-7159-b5a8-16ea-4f4dbb645ced@linaro.org>
Date:   Fri, 21 Jun 2019 14:46:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <e372391c-1fd5-41ec-b766-7669fffb928d@gmail.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

[Sorry to those receiving this twice... had to dig this out from the 
archives and sent it to the lists from the wrong mailer]

On 27/11/2018 00:44, Brian Dodge wrote:
> Thank you Pavel, that is a good point.
> 
> The chip vendor has indicated that there is no reason to maintain the 
> old/improper prefix and wishes to go forward (only) with the "arctic" 
> prefix and any existing dts files are or will be updated.

Looks like this patch series has fallen into the cracks a little.

I think I assumed this info would end in the description of patch v2 1/3 
(in order to answer Rob's feedback) and I sat and waited for a respin. 
On the other hand... I didn't actually say that explicitly anywhere! 
So... I'd recommend a respin perhaps with a small bit of text explaining 
how the vendor can state that any existing dts files will be updated. 
This is a peripheral device so these strings are probably embedded into 
OEM devicetrees rather than exclusively under the control of the vendor.


Daniel.


> 
> On 11/11/18 6:30 AM, Pavel Machek wrote:
>> Hi!
>>
>>> The vendor-prefixes.txt file properly refers to ArcticSand
>>> as arctic but the driver improperly abbreviated the prefix
>>> to arc. This was a mistake in the original patch
>>>
>>> Signed-off-by: Brian Dodge <bdodge09@gmail.com>
>>> ---
>>>   drivers/video/backlight/arcxcnn_bl.c | 22 +++++++++++-----------
>>>   1 file changed, 11 insertions(+), 11 deletions(-)
>>>
>>>    *
>>> - * Copyright 2016 ArcticSand, Inc.
>>> - * Author : Brian Dodge <bdodge@arcticsand.com>
>>> + * Copyright 2018 pSemi, Inc.
>>> + * Author : Brian Dodge <bdodge@psemi.com>
>> Ummm. Copyright 2016-2018?
>>
>>> @@ -202,27 +202,27 @@ static void arcxcnn_parse_dt(struct arcxcnn *lp)
>>>       if (ret == 0)
>>>           lp->pdata->initial_brightness = prog_val;
>>>
>>> -    ret = of_property_read_u32(node, "arc,led-config-0", &prog_val);
>>> +    ret = of_property_read_u32(node, "arctic,led-config-0", &prog_val);
>>>       if (ret == 0)
>>>           lp->pdata->led_config_0 = (u8)prog_val;
>>>
>> If there's a dts using this, you want to update it at the same
>> time. You may want to support both names going forward.
>>                                     Pavel

