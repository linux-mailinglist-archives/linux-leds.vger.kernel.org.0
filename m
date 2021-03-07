Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB25A33041A
	for <lists+linux-leds@lfdr.de>; Sun,  7 Mar 2021 20:05:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231760AbhCGTFH (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 7 Mar 2021 14:05:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:27119 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231610AbhCGTEs (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 7 Mar 2021 14:04:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1615143887;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=xakOsbHdk63hG7UbqDIRNouESiVml99N7bAiUFLm/GI=;
        b=ZRLNyd1sfNz7FB4aGqDtFCABSnvzaBceR4fBNd7YmoFh3t/A9gmbGGm6kiGy2NWegvR6pV
        oR8EMGeqjO6nIWvtdJUmP007eRM4kDGuYuB4pG7eAZKRfaSVD99iZPyGTthoIttS9hT0uG
        5yC8F0m1ZEpgmYNn3pK4tm+TtkQzM38=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-152-MjsbDD7fMQWh4WbXbsrRcA-1; Sun, 07 Mar 2021 14:04:45 -0500
X-MC-Unique: MjsbDD7fMQWh4WbXbsrRcA-1
Received: by mail-ed1-f72.google.com with SMTP id l23so4025605edt.23
        for <linux-leds@vger.kernel.org>; Sun, 07 Mar 2021 11:04:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=xakOsbHdk63hG7UbqDIRNouESiVml99N7bAiUFLm/GI=;
        b=aIofYLx+cmjZR+kvnRCjPtZIknG9UBFuBAcFIxZ+nI8+kViJgI5+EXChcbjycPNWwa
         gpRWfDhOEk9gweu7Y0g1FcVAnoi5TY5T6xhX25Gk2TiuJ/mS1QUHa1tGXnaX9zk/1mTB
         xIY9h/SHP8eEyw8XMtJuFti7VAEZXGTHs/ccrBb13FVBwb9nb+RTBZeaxYLteBuL4Whw
         0smS3uw8w53PUD7DVgylVhd2871ilhSt58IXZcsK8IUOl/A/cL2kc+veemrje48K0hE0
         FKXKl+N/Ao7MyKFZm3X7mk/PIRS4tROAcs76P8j+hT6jV0VCcTi8IuwLiHbs4rk3UOly
         sV7g==
X-Gm-Message-State: AOAM531kuk4tcjJK9fMI64/T0RbQMkIneOGyCrQcnJz7GgT9zVM7IvP5
        u16K6pOxPUXAWrRfVmk8fhjgHFDr1SWjjsojaiHQKK+qdQEWp+bJUa5PNcxBAKOQ5C+ATnmUXSf
        fYeO4zaTzQCc3QANJiNpWwA==
X-Received: by 2002:a17:906:789:: with SMTP id l9mr11605647ejc.161.1615143884483;
        Sun, 07 Mar 2021 11:04:44 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxqi8mTySB5bP+ZnvkAFIpC14v4wJp0SEnu2Eb8qnKp6Fnavb7lJbWFXmVoi1UJqI5NFqmMPw==
X-Received: by 2002:a17:906:789:: with SMTP id l9mr11605627ejc.161.1615143884231;
        Sun, 07 Mar 2021 11:04:44 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id t15sm5716617edw.84.2021.03.07.11.04.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Mar 2021 11:04:43 -0800 (PST)
Subject: Re: [PATCH] leds: trigger: fix potential deadlock with libata
To:     Pavel Machek <pavel@ucw.cz>, Marc Kleine-Budde <mkl@pengutronix.de>
Cc:     Andrea Righi <andrea.righi@canonical.com>,
        Boqun Feng <boqun.feng@gmail.com>, Dan Murphy <dmurphy@ti.com>,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@pengutronix.de, schuchmann@schleissheimer.de
References: <20201102104152.GG9930@xps-13-7390>
 <20210306203954.ya5oqgkdalcw45c4@pengutronix.de>
 <20210307161357.GA2933@duo.ucw.cz>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <7a83931f-13bd-27c2-4050-4a21be74c49b@redhat.com>
Date:   Sun, 7 Mar 2021 20:04:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210307161357.GA2933@duo.ucw.cz>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi,

On 3/7/21 5:13 PM, Pavel Machek wrote:
> Hi!
> 
>>> --- a/drivers/leds/led-triggers.c
>>> +++ b/drivers/leds/led-triggers.c
>>> @@ -378,14 +378,15 @@ void led_trigger_event(struct led_trigger *trig,
>>>  			enum led_brightness brightness)
>>>  {
>>>  	struct led_classdev *led_cdev;
>>> +	unsigned long flags;
>>>  
>>>  	if (!trig)
>>>  		return;
>>>  
>>> -	read_lock(&trig->leddev_list_lock);
>>> +	read_lock_irqsave(&trig->leddev_list_lock, flags);
>>>  	list_for_each_entry(led_cdev, &trig->led_cdevs, trig_list)
>>>  		led_set_brightness(led_cdev, brightness);
>>> -	read_unlock(&trig->leddev_list_lock);
>>> +	read_unlock_irqrestore(&trig->leddev_list_lock, flags);
>>>  }
>>>  EXPORT_SYMBOL_GPL(led_trigger_event)
>>
>> meanwhile this patch hit v5.10.x stable and caused a performance
>> degradation on our use case:
>>
>> It's an embedded ARM system, 4x Cortex A53, with an SPI attached CAN
>> controller. CAN stands for Controller Area Network and here used to
>> connect to some automotive equipment. Over CAN an ISOTP (a CAN-specific
>> Transport Protocol) transfer is running. With this patch, we see CAN
>> frames delayed for ~6ms, the usual gap between CAN frames is 240µs.
>>
>> Reverting this patch, restores the old performance.
>>
>> What is the best way to solve this dilemma? Identify the critical path
>> in our use case? Is there a way we can get around the irqsave in
>> led_trigger_event()?
> 
> Hans was pushing for this patch, perhaps he has some ideas...

I was not pushing for this particular fix, I was asking about a fix
for the lockdep identified potential deadlock.

And you replied that this was already fixed in your for-next branch
when I asked, so all in all, other then reporting the potential deadlock
(after it was already fixed) I have very little do to with this patch.

With that all said, I must say that I'm surprised that switching from
read_lock() to read_lock_irqsave() causes such a hefty penalty, so I
wonder what is really going on here. Using the irqsave version disables
interrupts, but AFAIK only on the current core and only for the duration
of the led_set_brightness() call(s) . 

Is the system perhaps pinning IRQs to a specific CPU in combination with
a led_set_brightness() somehow taking much longer then it should?

Note that led_set_brightness() calls are not allowed to block, if they
block they should use the brightness_set_blocking callback in their
led_class_dev struct not the regular brightness_set callback. In which case
the LED-core will defer the actually setting of the LED to a workqueue.

So one thing which might be worthwhile to check is if any of the LED
drivers on the system in question are using the brightness_set callback,
where they should be using the blocking one.

Regards,

Hans

