Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1987A121DE
	for <lists+linux-leds@lfdr.de>; Thu,  2 May 2019 20:29:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726114AbfEBS3Z (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 2 May 2019 14:29:25 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:39359 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725962AbfEBS3Z (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 2 May 2019 14:29:25 -0400
Received: by mail-wm1-f66.google.com with SMTP id n25so3890181wmk.4;
        Thu, 02 May 2019 11:29:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=SsplXKAeRkabPuKAwfI1OVTxmW/W7nsVKsv/rEGcfJ8=;
        b=hes5MEZMSiLSn8wlFgwFU7LyEwEGOu64ZzxzvMX/5Tqru9ohzXahF7TtZ9B/i79GMv
         UOgqAqVcU8A2PIyxr9DAHsx9l5tIBjGmliVIq//TkFdFpntBE1VeWj+B0YbPO4aALQxW
         CrSH3b8V/9BSv7HwHrmCb80Sdngspj+CpB1/q3OKqG2Qe1+xzgVvXuLWpo7Qh4vHAOYh
         D3OIvbcFXhy/Zks40WUSWse9t8fcK1SVT7+uFgQI1kaecHV8+MebkJIT99gvTUZyCi4p
         Q8wZ5aKswzJ9e8MuD9RLQzlTukFikxYUsesEODIklOVQ+I70fraeESpHSAUJi3yng/Me
         gNGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=SsplXKAeRkabPuKAwfI1OVTxmW/W7nsVKsv/rEGcfJ8=;
        b=eZWmVzpcYc/Es5wv05CGLxetbC142DZFMK3cFXjWeh5+tojAMTjuRjCYKBWJKZUS8i
         dIlLyeWt1DfX3PdRBU7+g0PsuyoT8NBHkqV9j/od5vA3Feq5LCjMvWgS5e2RvvyQTOLs
         17MutjvUeIleYt2n354DllovVefmGFxIHyNDu3cZTKe4TjEFzhaVfpueq3l/Mucgf9WP
         ph1K9Kbqa82OfdH/6RoXqxT7kDnvnmuarhARGpaWUm5ek8kQ7iZo+Fk4ahSzxcR0bNi6
         1rngTBsM5yxv286hC/+rISB4DddXGIgr8Amvehmz2DOTGXoyKskJlLVpYlkyOdK8fCkp
         WJ0g==
X-Gm-Message-State: APjAAAVj6iY2QRhOVI1rPiZ89SZYZkAgok8TPsr76nNkHSvG4uDxe+rC
        IMXWcP3f9LIoNQ+zpiIO2RBh7c1Q
X-Google-Smtp-Source: APXvYqyUm1udY1J+ei2wQ5foIOqhf/1cNbveQuHxmKk0zpIE6dhTUKZGeXsOP8KD0qQe0CB/zILZEQ==
X-Received: by 2002:a7b:c3da:: with SMTP id t26mr3560824wmj.40.1556821763141;
        Thu, 02 May 2019 11:29:23 -0700 (PDT)
Received: from [192.168.1.19] (chq152.neoplus.adsl.tpnet.pl. [83.31.14.152])
        by smtp.gmail.com with ESMTPSA id v192sm10070534wme.24.2019.05.02.11.29.21
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 02 May 2019 11:29:22 -0700 (PDT)
Subject: Re: [PATCH] leds: avoid races with workqueue
To:     Pavel Machek <pavel@ucw.cz>
Cc:     linux-leds@vger.kernel.org, ibm-acpi@hmh.eng.br,
        ibm-acpi-devel@lists.sourceforge.net,
        platform-driver-x86@vger.kernel.org
References: <20190426123513.GA18172@amd> <20190426214246.GA24966@amd>
 <84fac57d-1121-a1da-fb45-16a2521bdef9@gmail.com> <20190427193411.GA9709@amd>
 <2578a614-beb9-1c9d-9f74-208a8a7ab64f@gmail.com> <20190427223207.GA3585@amd>
 <d2373c8b-5c66-c875-16c7-0c5a93470793@gmail.com> <20190429152259.GB10501@amd>
 <36e1fdd7-a220-4b0d-d558-829f522b0841@gmail.com> <20190501183600.GA20452@amd>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <9337b5fb-0ff8-9925-29e6-a781884af861@gmail.com>
Date:   Thu, 2 May 2019 20:29:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190501183600.GA20452@amd>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Pavel,

On 5/1/19 8:36 PM, Pavel Machek wrote:
> Hi!
> 
>>> There are races between "main" thread and workqueue. They manifest
>>> themselves on Thinkpad X60:
>>> This should result in LED blinking, but it turns it off instead:
>>>      root@amd:/data/pavel# cd /sys/class/leds/tpacpi\:\:power
>>>      root@amd:/sys/class/leds/tpacpi::power# echo timer > trigger
>>>      root@amd:/sys/class/leds/tpacpi::power# echo timer > trigger
>>>      root@amd:/sys/class/leds/tpacpi::power#

I believe this line is redundant, so I removed it.

>>> It should be possible to transition from blinking to solid on by echo
>>> 0 > brightness; echo 1 > brightness... but that does not work, either,
>>> if done too quickly.
>>> Synchronization of the workqueue fixes both.
>>> Signed-off-by: Pavel Machek <pavel@ucw.cz>
>>>
>>> diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
>>> index 68aa923..dcb59c8 100644
>>> --- a/drivers/leds/led-class.c
>>> +++ b/drivers/leds/led-class.c
>>> @@ -57,6 +57,7 @@ static ssize_t brightness_store(struct device *dev,
>>>   	if (state == LED_OFF)
>>>   		led_trigger_remove(led_cdev);
>>>   	led_set_brightness(led_cdev, state);
>>> +	flush_work(&led_cdev->set_brightness_work);
>>
>> Is this really required here? It creates non-uniform brightness
>> setting behavior depending on whether it is set from sysfs or
>> by in-kernel call to led_set_brightness().
> 
> This fixes the echo 0 > brightness; echo 1 > brightness. It has to be
> at a place where we can sleep.
> 
> If you have better idea, it is welcome, but it would be good to fix
> the bug.

Currently not, so I applied the patch in this shape.

-- 
Best regards,
Jacek Anaszewski
