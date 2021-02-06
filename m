Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E0D0631201C
	for <lists+linux-leds@lfdr.de>; Sat,  6 Feb 2021 21:59:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229536AbhBFU7Y (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 6 Feb 2021 15:59:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229522AbhBFU7X (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 6 Feb 2021 15:59:23 -0500
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E49EC06174A;
        Sat,  6 Feb 2021 12:58:43 -0800 (PST)
Received: by mail-lj1-x22d.google.com with SMTP id s18so11750383ljg.7;
        Sat, 06 Feb 2021 12:58:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=fODc4Y13jnUgYFxRk0/SlJ0oEOTVWjVViI6j6TXwrmA=;
        b=i+BNW/3lPIn8qBEL4dJSYVVoNBe4G3m2fgH7TV4qRli2Y4zuXfrL3ikjrrJSXN9QOV
         /jx3qFgEgkW+O7Gl44iV8Vi3upllIZM4E2ARLbwYwztquYKNqOGjsor5pdhM8G8dx1C1
         bqw6EKRkRC51ozp047gC4F2wIBPE/O2iVcpAUOkCoD3oCzOY4NzC9fkdQZL3gGeI8cYC
         3hCFf/DBMCKnopIFFpORPEg8kciDMfINbpVT2nUvJ2W1glufCsg4bkGr7iN3vNQgexUs
         dL1a++FA+Mh8vP8liREDQuw0Ewsjbq+A6ZWdFDV/K51vKCH2hQOxq39Rm/Y+F9I+SxK5
         8RUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=fODc4Y13jnUgYFxRk0/SlJ0oEOTVWjVViI6j6TXwrmA=;
        b=IBWliyORz+uqgxjXBHQ0pZDtFdSRCu0TV71mA0ccCXvwNTZCUB0NCZKElZrGKLbAOq
         czK9LPIEvKY4Xa+oSSv8wAIq37HbbcWFNDoML5uo9Y0pyAKJ2enIuvW0xvIpQC/0SXIF
         hHYJWpD0fV0/7ZotBH8L0kS6JLRWDLkcRpV1nj+josW030wDCw7OlUNYTJ0lESHPlDYi
         Yza2Y+OYk3hdGSK4LBTFog0cF5Qq/qRhF9C41ZNmoIpt4wqlSKFZoiM7j/oqz7/3DxcU
         ZHXc5tw5QwLau0kMNb04encKal5vx50fEuzT3hiVJFD7wAcbBnaUJpwVa4VabVuD+DYo
         MeTA==
X-Gm-Message-State: AOAM532132npUc0fQgrD09OwR9TiykG3ZOFrXtqhq6G8zZgb5WiLd9iH
        Rab2yV/kurl35nQ6chdZy2ZmECumMTQ=
X-Google-Smtp-Source: ABdhPJz0+XIQ0VmKOXwuXGw+Yp6c6LpRsX19zuZPttNlimegwkGn6w0xU0Bd08AOaN/VgftdtgH/Fg==
X-Received: by 2002:a2e:8444:: with SMTP id u4mr1155075ljh.342.1612645121429;
        Sat, 06 Feb 2021 12:58:41 -0800 (PST)
Received: from [192.168.0.131] ([194.183.54.57])
        by smtp.gmail.com with ESMTPSA id b39sm1376435ljf.68.2021.02.06.12.58.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 06 Feb 2021 12:58:40 -0800 (PST)
Subject: Re: AW: [PATCH v2 1/4] leds: lp50xx: add setting of default intensity
 from DT
To:     Sven Schuchmann <schuchmann@schleissheimer.de>,
        Pavel Machek <pavel@ucw.cz>
Cc:     Dan Murphy <dmurphy@ti.com>, Rob Herring <robh+dt@kernel.org>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20210204143726.27977-1-schuchmann@schleissheimer.de>
 <20210204145201.GB14305@duo.ucw.cz>
 <DB8P190MB063482D8E38C0529AD16A4D5D9B29@DB8P190MB0634.EURP190.PROD.OUTLOOK.COM>
 <20210205102338.GA27854@amd> <c107d3b9-2141-7cad-837a-f8ef107df61c@gmail.com>
 <DB8P190MB06344FAD6492E56D28A4E916D9B19@DB8P190MB0634.EURP190.PROD.OUTLOOK.COM>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <d5631e35-cd62-106f-2ec4-de3163367bc0@gmail.com>
Date:   Sat, 6 Feb 2021 21:58:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <DB8P190MB06344FAD6492E56D28A4E916D9B19@DB8P190MB0634.EURP190.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Sven,

On 2/6/21 2:14 PM, Sven Schuchmann wrote:
> Hello Dan,
> 
>> Von: Jacek Anaszewski <jacek.anaszewski@gmail.com>
>> Gesendet: Freitag, 5. Februar 2021 19:37
>> Hi Pavel,
>>
>> On 2/5/21 11:23 AM, Pavel Machek wrote:
>>> Hi!
>>>
>>>>>>        patternProperties:
>>>>>>          "(^led-[0-9a-f]$|led)":
>>>>>> @@ -99,6 +104,7 @@ examples:
>>>>>>                   reg = <0x1>;
>>>>>>                   color = <LED_COLOR_ID_RGB>;
>>>>>>                   function = LED_FUNCTION_CHARGING;
>>>>>> +               default-intensity = <100 0 0>;
>>
>> How will you know which array position is for which child LED?
>> I presume DT child nodes are not guaranteed to be parsed in the order
>> of declaration?
> 
> I tried to fiddle this out, but it seems Jacek is right over here.
> The multi-led definition looks like this (from the documentation leds-lp50xx.yaml)
> 
>          multi-led@1 {
>                 #address-cells = <1>;
>                 #size-cells = <0>;
>                 reg = <0x1>;
>                 color = <LED_COLOR_ID_RGB>;
>                 function = LED_FUNCTION_CHARGING;
> 
>                 led-0 {
>                     color = <LED_COLOR_ID_RED>;
>                 };
> 
>                 led-1 {
>                     color = <LED_COLOR_ID_GREEN>;
>                 };
> 
>                 led-2 {
>                     color = <LED_COLOR_ID_BLUE>;
>                 };
>            };
> 
> But it seems that the color definition of each led is ignored.
> By ignored I mean the driver does not take care which color
> is at which position. So if I change led-0 to be LED_COLOR_ID_BLUE
> and led-2 to be LED_COLOR_ID_RED nothing will change if I write
> from userspace. Could you help to clarify?
> Then it is even hard to know which led to set with default-intensity.

See Documentation/ABI/testing/sysfs-class-led-multicolor and
documentation of multi_index and multi_intensity files.
It is the multi_index file that tells what is the order of colors
in the multi_intensity file.

And that depends on the order of enumeration of the nodes by DT parser.

> Also it seems that the enumeration of the multi-leds should
> start with multi-led@0 (and not 1 as in the documentation).

The @unit-address part of node name must match the first address
specified in the reg property of the node, so this is correct.
-- 
Best regards,
Jacek Anaszewski
