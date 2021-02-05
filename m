Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D0EF31101B
	for <lists+linux-leds@lfdr.de>; Fri,  5 Feb 2021 19:40:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233645AbhBEQ5e (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 5 Feb 2021 11:57:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233084AbhBEQzu (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 5 Feb 2021 11:55:50 -0500
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F31EC06174A;
        Fri,  5 Feb 2021 10:37:32 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id v24so11269001lfr.7;
        Fri, 05 Feb 2021 10:37:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=UP0XlE4LR2VUHfzWpArMCJWyCE5EqOZWjJJ7fRjzT1k=;
        b=QAK7yWLw33+gmq5epSQ5amUdSkHiXqWCkk6cUzN4oj6W+l6kwRX3dBOlxwZab0uKFb
         pCekN73CZXkdEa5BqNfTcZevrqK50f0W3IjqpLr9OWgTUhTgewjBK+ZuWEZaSuBKIUus
         mX8mB09NNQGcSssOCb4HNWhDfkABjENlfvZsdcZt/arrRzQ4AFOGPEwZ8Qq1Gw9xsgg5
         Y8I7H8+Pua36diFMi5RVu/1usgETAJjL3qbTBLt31iChX7lHlP5F4tXe/UVpWyXQkTDR
         2XA3ZgT6ZoKU3IXc93ZKUEY3kCjZfH75JlIFPVHeBGM4HsJCVeu0NnOhIMQF3m3kTC8t
         4i6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=UP0XlE4LR2VUHfzWpArMCJWyCE5EqOZWjJJ7fRjzT1k=;
        b=EGJHRkuTOkDnCvI4WwY/VbS1DjMBd774xSIyiLdYzXBZ75sAh7RJzYNCp2Sb+h15h7
         tFmd8Q6DWGEwFSkWDkNTuMaYcmwgIaI/Aj0dp+7yDgN5pZZG8vqlryZjPMdQROjl66Sx
         bBZAk4umzCTOf9H6B10MFOPq2sKbiQFk+D/pS/tAsWNqyk5q7GP1TNEHQBBduXm4Vgzn
         1wwnOddLlCLhGOmOOH3yy2ZP6NeahKVZeCTzUo53aRircSkpyx06HGoixnHoVSGShKhm
         ixqEMQZVUfwNCTBGgtrdrDs7+EwAbjb6P3SmO+oFDCcLCEMd9Hd1O8iNVp+AnKDeMeo1
         ZDeA==
X-Gm-Message-State: AOAM53266+5hUgJHTmX2gWs38jQoOyUKmlLn2DRXhDvz/9makZZYkUPs
        7gBhjo8xuD7SOIFOmPsD5o6g9UUMf6E=
X-Google-Smtp-Source: ABdhPJxfX7NqquPYdIrOxKtKzGX9emO9ypOPh3HU9g000h2WGQA06AIDPgDVg1/qLYlig0ncr1LEgQ==
X-Received: by 2002:ac2:5ded:: with SMTP id z13mr3222186lfq.160.1612550250894;
        Fri, 05 Feb 2021 10:37:30 -0800 (PST)
Received: from [192.168.0.131] ([194.183.54.57])
        by smtp.gmail.com with ESMTPSA id x4sm1063192lfe.255.2021.02.05.10.37.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Feb 2021 10:37:29 -0800 (PST)
Subject: Re: [PATCH v2 1/4] leds: lp50xx: add setting of default intensity
 from DT
To:     Pavel Machek <pavel@ucw.cz>,
        Sven Schuchmann <schuchmann@schleissheimer.de>
Cc:     Dan Murphy <dmurphy@ti.com>, Rob Herring <robh+dt@kernel.org>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20210204143726.27977-1-schuchmann@schleissheimer.de>
 <20210204145201.GB14305@duo.ucw.cz>
 <DB8P190MB063482D8E38C0529AD16A4D5D9B29@DB8P190MB0634.EURP190.PROD.OUTLOOK.COM>
 <20210205102338.GA27854@amd>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <c107d3b9-2141-7cad-837a-f8ef107df61c@gmail.com>
Date:   Fri, 5 Feb 2021 19:37:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210205102338.GA27854@amd>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Pavel,

On 2/5/21 11:23 AM, Pavel Machek wrote:
> Hi!
> 
>>>>       patternProperties:
>>>>         "(^led-[0-9a-f]$|led)":
>>>> @@ -99,6 +104,7 @@ examples:
>>>>                  reg = <0x1>;
>>>>                  color = <LED_COLOR_ID_RGB>;
>>>>                  function = LED_FUNCTION_CHARGING;
>>>> +               default-intensity = <100 0 0>;

How will you know which array position is for which child LED?
I presume DT child nodes are not guaranteed to be parsed in the order
of declaration?

>>>>
>>>>                  led-0 {
>>>>                      color = <LED_COLOR_ID_RED>;
>>>
>>> Should this go to leds-class-multicolor.yaml ?
>>
>> I think then all drivers should support it,  but I cannot change all drivers.
>> So I would only leave it in there.
> 
> It really should be in common binding, and no, that does not mean you
> need to change all the drivers.
> 
> Plus there's at most two of them at the moment.
> 
> Best regards,
> 							Pavel
> 

-- 
Best regards,
Jacek Anaszewski
