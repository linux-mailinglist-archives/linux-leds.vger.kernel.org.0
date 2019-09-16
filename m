Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A7A52B405D
	for <lists+linux-leds@lfdr.de>; Mon, 16 Sep 2019 20:31:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390448AbfIPSbj (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 16 Sep 2019 14:31:39 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:41186 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390349AbfIPSbi (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 16 Sep 2019 14:31:38 -0400
Received: by mail-wr1-f66.google.com with SMTP id h7so464336wrw.8;
        Mon, 16 Sep 2019 11:31:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=1iMF6L3+VhmjBO27E99c8WkPMR48r/DUbungJ/GCRrw=;
        b=Y14M6zH05fh0o5jHPNEfwTNNbox8UTowDHGQ1dqAynnIXP3awj3ELo3LjNvfPvhqmi
         1RvrMgMaG9lBcQl7HRFDyLHE6GR3eOSNNISNJVPRdA7OgYue48EzDQ1Ul4EbDkqN2pE5
         BHk9X1egnXipxxoQh5s8pRmsyDXJpsn50dngNLBjNf8PKW/d8gXTW5dJEStts48H3PgV
         UwEd7/Xt6yhf5Pq+sm41BIenWTgGxFkTdU2yTcQ8z8f3Tsg3tEeo1ZCoe0Ot2G69ZkM9
         siRBW/feh33L+Jw/hLaYOOO5gobGXR6KXhTmVYOdikTZA4ZFLwZwa/gpuKYhEvOhvGeB
         RqZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=1iMF6L3+VhmjBO27E99c8WkPMR48r/DUbungJ/GCRrw=;
        b=bHpqfnlxJHKtJMPhfYzFmmWHgAqWEoqgkP+bYk4HCLYkAjau3GaFytD5lBeafavz5r
         S9An5CBiVI5wUWOJeZZphWcA7diLjAW+lriVlNfEAHU5990z40DcmkDgo26K3LVB4M3N
         pjIlBoKs9s/xXx6SOnUvsDFjd3db+RIJbYU2nW061AqCAGrHbmaXRuBaxgdHM0Oq69SZ
         dK2bjW14b+t9S9apy2v4Xn3Q0Jv2LB1On3t9u3ETe2PeEDSQpSZO1pQc93XsmW6pWL5g
         R4HEVnPnXi9QAsHdgdeBovJMeq3E5BSCfmnEe9Iq82MY8DWnEy8xNo4rt20Qz6HShJ9P
         Og3w==
X-Gm-Message-State: APjAAAWm0/7HGBUdwprZWNj0a/67pNwuHCMyr0vRfA3MH1Ls9zUu+wXK
        cVmfArVph+vxXrneVadxQ346JKD5
X-Google-Smtp-Source: APXvYqyuVAR15t+jVRjP42X4hO3/ljtGSTmYQmtRF8sXKfbRs0haxRH/lQexOHIRM6q6ursD2E/1gQ==
X-Received: by 2002:a5d:4041:: with SMTP id w1mr879032wrp.313.1568658693398;
        Mon, 16 Sep 2019 11:31:33 -0700 (PDT)
Received: from [192.168.1.19] (bgp90.neoplus.adsl.tpnet.pl. [83.28.79.90])
        by smtp.gmail.com with ESMTPSA id j22sm71348381wre.45.2019.09.16.11.31.31
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Sep 2019 11:31:32 -0700 (PDT)
Subject: Re: [PATCH v5 1/9] leds: multicolor: Add sysfs interface definition
To:     Dan Murphy <dmurphy@ti.com>, pavel@ucw.cz
Cc:     robh+dt@kernel.org, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20190911180115.21035-1-dmurphy@ti.com>
 <20190911180115.21035-2-dmurphy@ti.com>
 <e34f4182-71d1-d51d-fb07-f88f6b88b6a3@gmail.com>
 <eb08cd1b-a3eb-18db-0dd2-5c34637df9d5@ti.com>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=jacek.anaszewski@gmail.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <4915583c-5381-72fd-8d4f-6901018f5c3e@gmail.com>
Date:   Mon, 16 Sep 2019 20:31:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <eb08cd1b-a3eb-18db-0dd2-5c34637df9d5@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Dan,

On 9/16/19 3:56 PM, Dan Murphy wrote:
> Hello
> 
> On 9/15/19 8:57 AM, Jacek Anaszewski wrote:
>> Hi Dan,
>>
>> On 9/11/19 8:01 PM, Dan Murphy wrote:
>>> Add a documentation of LED Multicolor LED class specific
>>> sysfs attributes.
>>>
>>> Signed-off-by: Dan Murphy <dmurphy@ti.com>
>>> ---
>>>   .../ABI/testing/sysfs-class-led-multicolor    | 73 +++++++++++++++++++
>>>   1 file changed, 73 insertions(+)
>>>   create mode 100644
>>> Documentation/ABI/testing/sysfs-class-led-multicolor
>>>
>>> diff --git a/Documentation/ABI/testing/sysfs-class-led-multicolor
>>> b/Documentation/ABI/testing/sysfs-class-led-multicolor
>>> new file mode 100644
>>> index 000000000000..4ea54c2ad4c8
>>> --- /dev/null
>>> +++ b/Documentation/ABI/testing/sysfs-class-led-multicolor
>>> @@ -0,0 +1,73 @@
>>> +What:        /sys/class/leds/<led>/brightness
>>> +Date:        Sept 2019
>>> +KernelVersion:    5.5
>>> +Contact:    Dan Murphy <dmurphy@ti.com>
>>> +Description:    read/write
>>> +        The multicolor class will redirect the device drivers call back
>>> +        function for brightness control to the multicolor class
>>> +        brightness control function.
>>> +
>>> +        Writing to this file will update all LEDs within the group to a
>>> +        calculated percentage of what each color LED in the group is
>>> set
>>> +        to.  The percentage is calculated via the equation below:
>>> +
>>> +        led_brightness = requested_value *
>>> led_color_intensity/led_color_max_intensity
>>> +
>>> +        For additional details please refer to
>>> +        Documentation/leds/leds-class-multicolor.rst.
>>> +
>>> +        The value of the color is from 0 to
>>> +        /sys/class/leds/<led>/max_brightness.
>>> +
>>> +What:        /sys/class/leds/<led>/colors/color_mix
>>> +Date:        Sept 2019
>>> +KernelVersion:    5.5
>>> +Contact:    Dan Murphy <dmurphy@ti.com>
>>> +Description:    read/write
>>> +        The values written to this file should contain the intensity
>>> +        values of each multicolor LED within the colors directory. The
>>> +        index of given color is reported by the color_id file
>>> present in
>>> +        colors/<color> directory. The index determines the position in
>>> +        the sequence of    intensities on which the related intensity
>>> +        should be passed to this file.
>>> +
>>> +        For additional details please refer to
>>> +        Documentation/leds/leds-class-multicolor.rst.
>> As already mentioned in the reply to Pavel - let's avoid the
>> introduction of another sysfs file with multiple values.
> 
> OK for clarification remove the color_mix and color_id files and keep
> the intensity files?

Exactly.

-- 
Best regards,
Jacek Anaszewski
