Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2C0CA1228C
	for <lists+linux-leds@lfdr.de>; Thu,  2 May 2019 21:28:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726121AbfEBT2N (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 2 May 2019 15:28:13 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:37722 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725962AbfEBT2N (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 2 May 2019 15:28:13 -0400
Received: by mail-lj1-f195.google.com with SMTP id b12so3262656lji.4;
        Thu, 02 May 2019 12:28:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=e+LsBLoOMDYcJHGcdymvzMRZj4d5mzdj5SdX3j4QjyI=;
        b=um/+KSAsN8HJKncMKrBqfhLjvsoQnK4k+JtIO+LjliEYyWjF+0pPRlSE1wimLSX2rw
         wcNa1I95D3ebMSMSd9CZN9YLD2rgHbduV6chx2NDuTNYQMnR3JD4eIZLEvzkAhSlgwOV
         rhJUFGd94UqtvWNf7o5Cd5zpbMPFbSrV/TiDR7pvuZKPHsm+OJ+OcmxQDeN1noFx55qa
         dPHznDTDdOjGAjL+oS3sC6cA2YPftZBqdd2ABmYhSKv4UXLJB2nFinomU+vIbrR2mIFG
         S8KxCIfF6bq6gyAV+grrVC3cFmSflU05PREJSIVItYS50Kx2hwl/I2zYF8jWn4LcBIFu
         G4fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=e+LsBLoOMDYcJHGcdymvzMRZj4d5mzdj5SdX3j4QjyI=;
        b=AQ4Wc0Cb8VhZEeoWY2TBqaRM3E2QPjyn4qbeaWMCMZzKCL6Ln3MdvUBwF4xvsewv57
         FPMM8EKADm998HZmXSpMJnCGBSy0Yae3Wk+Q938QFGeKPB4w5q5SAwJXwr47RHffcUFi
         kiB9HdXci5ayMak8rKrolYg+p92OuFtkW8ZJH5J0b5dphzN9vlEDPV2n0HY2Y4I6XdBI
         OV3i1EFP6FlH1MiQKFK5eujonq3clXNoJ6WSHCbdnzvQDTha/+3P0t/Ymh2tS4IvVsL6
         /j5klczI8mUyIFqBtajTg04VpgE7gGzyo3c8p0CzfCcHUd8SJO/CR0RslK5lI9XSg3kO
         n3BQ==
X-Gm-Message-State: APjAAAXM9Vj5Z4F1KzJnvFMa9AMlcbZI6kcdN5a2oU3O2AVEhlPFnNxp
        ubjdFVnt9I+rx44Kbkkgphqelykg
X-Google-Smtp-Source: APXvYqyXoBxbwu/Lncgl3/qfOLy6bKoVk86Hh1SKPi0lhS102tEopRSnzeeqNbLIlxcA+dhQjazKNw==
X-Received: by 2002:a2e:844a:: with SMTP id u10mr2914093ljh.41.1556825291015;
        Thu, 02 May 2019 12:28:11 -0700 (PDT)
Received: from [192.168.1.19] (chq152.neoplus.adsl.tpnet.pl. [83.31.14.152])
        by smtp.gmail.com with ESMTPSA id b28sm4088lfc.7.2019.05.02.12.28.08
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 02 May 2019 12:28:10 -0700 (PDT)
Subject: Re: [PATCH] leds: avoid races with workqueue
To:     Pavel Machek <pavel@ucw.cz>
Cc:     linux-leds@vger.kernel.org, ibm-acpi@hmh.eng.br,
        ibm-acpi-devel@lists.sourceforge.net,
        platform-driver-x86@vger.kernel.org, stable@kernel.org
References: <20190426214246.GA24966@amd>
 <84fac57d-1121-a1da-fb45-16a2521bdef9@gmail.com> <20190427193411.GA9709@amd>
 <2578a614-beb9-1c9d-9f74-208a8a7ab64f@gmail.com> <20190427223207.GA3585@amd>
 <d2373c8b-5c66-c875-16c7-0c5a93470793@gmail.com> <20190429152259.GB10501@amd>
 <36e1fdd7-a220-4b0d-d558-829f522b0841@gmail.com> <20190501183600.GA20452@amd>
 <9337b5fb-0ff8-9925-29e6-a781884af861@gmail.com> <20190502191321.GB4845@amd>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <62a99fe8-5c61-c681-3f9d-54e0a27a63d2@gmail.com>
Date:   Thu, 2 May 2019 21:28:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190502191321.GB4845@amd>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 5/2/19 9:13 PM, Pavel Machek wrote:
> Hi!
> 
>>>>> +++ b/drivers/leds/led-class.c
>>>>> @@ -57,6 +57,7 @@ static ssize_t brightness_store(struct device *dev,
>>>>>   	if (state == LED_OFF)
>>>>>   		led_trigger_remove(led_cdev);
>>>>>   	led_set_brightness(led_cdev, state);
>>>>> +	flush_work(&led_cdev->set_brightness_work);
>>>>
>>>> Is this really required here? It creates non-uniform brightness
>>>> setting behavior depending on whether it is set from sysfs or
>>>> by in-kernel call to led_set_brightness().
>>>
>>> This fixes the echo 0 > brightness; echo 1 > brightness. It has to be
>>> at a place where we can sleep.
>>>
>>> If you have better idea, it is welcome, but it would be good to fix
>>> the bug.
>>
>> Currently not, so I applied the patch in this shape.
> 
> Thanks!
> 
> This is actually something that makes sense for stable.. perhaps the
> bots can pick it up.

I was thinking of it, but finally decided to submit this patch
to linux-stable when it will prove not having side effects.

But if you think it is ready for stable then I can add
relevant "Fixes" tag. Do you think that below will be an appropriate
base to refer to?

Fixes 1afcadfcd184 ("leds: core: Use set_brightness_work for the 
blocking op")

?
-- 
Best regards,
Jacek Anaszewski
