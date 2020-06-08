Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 542421F2037
	for <lists+linux-leds@lfdr.de>; Mon,  8 Jun 2020 21:41:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726490AbgFHTlX (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 8 Jun 2020 15:41:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726412AbgFHTlW (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 8 Jun 2020 15:41:22 -0400
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69CA7C08C5C2;
        Mon,  8 Jun 2020 12:41:22 -0700 (PDT)
Received: by mail-ej1-x642.google.com with SMTP id y13so19690997eju.2;
        Mon, 08 Jun 2020 12:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=4kmZUeusJdNud0HCb7ueQ/Vi2HXEelB2QgLF2ZGR80w=;
        b=VflLQYTMjXi/w5TxYoprAtKO2+ggHN6ZzZJIZjSu4dKlus3U6mZbG0vykZRnaFr9QZ
         v6V52ODQHs//T7XU/5RviTxyyZTmK3MNXiB1c4hG/NlMWkrpbP4aweI4YHpklvGv7tWq
         o5Kip+rTMG4MzO6dx3sSe0x3SqCEAYGDZdQ+G+uzosXwWaDFxTinA51TudEXGJKZgo57
         gUIYxq7/cA/3Ma+xSfWLyr0dLsz6C5o9+/RKTd0T6sd5eNvXx1V0zMpZh0NkmgQXphAH
         gcz3E4UFBFmB+wNuDhkQJP+1QgnYZ+UHKov3u2rfDqvjgZk3G/25KE26v2PoxLFQ9DuN
         57Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=4kmZUeusJdNud0HCb7ueQ/Vi2HXEelB2QgLF2ZGR80w=;
        b=ooVjcrfsZfr9nHdGydG7fObqP77123TL5TQfiApGN4jz3DfUE2+TMvbDSJr4dOPlzO
         NJna3cs1LgRYayipvKsxnP0w6595y/LuZ/CfL66+k+WWz85IJ35m74NtsZR/M4V+eiy+
         fBDDWG+D4oe4UpKsHsPR/XmHBtFmCpUgxP0g17Tb5mW/X/dFIacLBVnVKVV9WlrhHYct
         8/8NUtF1KlbEyott7CahycplIhCR9WVpO8+AQtWGZyLfbw8gqkuaSlgpvk6wjJMz9UbA
         2CqWhu7s4o320F7lnrHvDAmFmcB97ZNxquSo2ZBHKYEiwx7xIN+efvolaX6dxxOt8Q9c
         IXVg==
X-Gm-Message-State: AOAM532DrullY+tVmyosaXT3QHPEgU96p9QWCw9l8oNXdIRWNhbenMog
        ha26kG0rsirxtSAT/FohhkyeF9Dx
X-Google-Smtp-Source: ABdhPJwybXymJla3noiMugVepJec5T8PxwtZlWhFxWE+GECRjjdjDJSCaJQNQHklcg33FC+JgKasmA==
X-Received: by 2002:a17:906:5617:: with SMTP id f23mr21049232ejq.331.1591645280784;
        Mon, 08 Jun 2020 12:41:20 -0700 (PDT)
Received: from ?IPv6:2a01:110f:b59:fd00:3c4b:24e0:3c3a:dc89? ([2a01:110f:b59:fd00:3c4b:24e0:3c3a:dc89])
        by smtp.gmail.com with ESMTPSA id v7sm12948430edq.82.2020.06.08.12.41.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2020 12:41:20 -0700 (PDT)
Subject: Re: [PATCH v26 03/15] leds: multicolor: Introduce a multicolor class
 definition
To:     Dan Murphy <dmurphy@ti.com>, Pavel Machek <pavel@ucw.cz>
Cc:     devicetree@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20200604120504.32425-1-dmurphy@ti.com>
 <20200604120504.32425-4-dmurphy@ti.com> <20200606155324.GA21130@amd>
 <92d71058-a75b-fd3f-59b1-5133be1c21b5@ti.com>
 <a8cb3d33-7a7d-82ee-e598-0f48368677cd@gmail.com>
 <02cf192f-1948-74a5-f2ef-6c2146422ecb@ti.com>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <5bb77966-70d7-3331-1487-bb2af1b4b755@gmail.com>
Date:   Mon, 8 Jun 2020 21:41:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <02cf192f-1948-74a5-f2ef-6c2146422ecb@ti.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Dan,

On 6/8/20 4:34 PM, Dan Murphy wrote:
> Jacek
> 
> On 6/6/20 2:59 PM, Jacek Anaszewski wrote:
>> Dan,
>>
>> On 6/6/20 6:39 PM, Dan Murphy wrote:
>>> Pavek
>>>
>>> Thanks for the review
>>>
>>> On 6/6/20 10:53 AM, Pavel Machek wrote:
>>>> Hi!
>>>>
>>>>> Introduce a multicolor class that groups colored LEDs
>>>>> within a LED node.
>>>>>
>>>>> The multi color class groups monochrome LEDs and allows controlling 
>>>>> two
>>>>> aspects of the final combined color: hue and lightness. The former is
>>>>> controlled via the intensity file and the latter is controlled
>>>>> via brightness file.
>>>>>
>>>>> Acked-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
>>>>> Signed-off-by: Dan Murphy <dmurphy@ti.com>
>>>>> diff --git a/Documentation/ABI/testing/sysfs-class-led-multicolor 
>>>>> b/Documentation/ABI/testing/sysfs-class-led-multicolor
>>>>> new file mode 100644
>> [...]
>>>>> --- a/MAINTAINERS
>>>>> +++ b/MAINTAINERS
>>>>> @@ -9533,6 +9533,14 @@ F: Documentation/devicetree/bindings/leds/
>>>>>   F:    drivers/leds/
>>>>>   F:    include/linux/leds.h
>>>>> +LED MULTICOLOR FRAMEWORK
>>>>> +M:    Dan Murphy <dmurphy@ti.com>
>>>>> +L:    linux-leds@vger.kernel.org
>>>> I'd like to be mentioned here, too. "M: Pavel Machek
>>>> <pavel@ucw.cz>". And I'm not sure if I should be taking MAINTAINER
>>>> file update through a LED tree. Should definitely go to separate
>>>> patch.
>>>
>>> Oh definitely.  I thought it was implied that you and Jacek are both 
>>> Maintainers as well.
>>>
>>> I will add you but will wait to see if Jacek wants to be added.
>>
>> Actually I don't think that we need to add this separate entry
>> for LED multicolor class. This is still under LED subsystem,
>> and I didn't add anything for LED class flash.
> 
> We only need this because I am not a maintainer of the LED flash class 
> or the LED class.
> 
> But since I authored the code it only made sense to add me as a 
> maintainer for this specific class.
> 
> You are one of the maintainers of the LED subsystem and wrote the Flash 
> class so your maintainer ship is implied and you will be CC'd for all 
> patches.
> 
> This will not be the case for the multi color class

scripts/get_maintainer.pl returns yourself as well for LED drivers.
But it's up to you.

-- 
Best regards,
Jacek Anaszewski
