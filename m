Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CB1446DE66A
	for <lists+linux-leds@lfdr.de>; Tue, 11 Apr 2023 23:27:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229612AbjDKV1B (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 11 Apr 2023 17:27:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229585AbjDKV1A (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 11 Apr 2023 17:27:00 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A71541FE2
        for <linux-leds@vger.kernel.org>; Tue, 11 Apr 2023 14:26:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1681248372;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=lgHbY/M7xSAW/npoy6nJEOknpD/Hh/0KxZ3zzNG9eDs=;
        b=GKk+2DSR74jz9gAoDdi+yoFvmQ4gDYzCwPZe3hGuK0CGBm6xq9K+thfxa659sG+zWIz1Ce
        NVA0FTkBMmXOdVhWqWiDXcT5yvZKQEV14O/z4b0djz++EVu7NWnxIbrmD1+Bhr6AzgYQDC
        fqhuEKr5abVczwerOMwOiN81NSKU9c0=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-522-4gSyxBUIMfWo4K1ZL62XCA-1; Tue, 11 Apr 2023 17:26:11 -0400
X-MC-Unique: 4gSyxBUIMfWo4K1ZL62XCA-1
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-50480ce89a2so1794825a12.3
        for <linux-leds@vger.kernel.org>; Tue, 11 Apr 2023 14:26:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681248370; x=1683840370;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lgHbY/M7xSAW/npoy6nJEOknpD/Hh/0KxZ3zzNG9eDs=;
        b=Ji/tS1K4ngu7619S2ChRhEjEZqfc2PvTXbfYI0bJF39ncj0OyH9oUofD3nWtLuKpcp
         B3dKsIkQuz7Bcb4Qm3FqWw/5dcsAn0LyRU/FUUlkUoVAt5Am7yba6sSnk9MBleve4bDU
         vTcgAHlvkDtjDxPJRrslkafih6sBAfQprwb3s/q80H4y+iQpihD6b/C2X2c51xjEJu0M
         cXeopiqREEg4aZdFLJxl4imF1Q9hXECb3ghR6FxIq0jWLGwsyv6H1aVKbgMCHmjKz2XT
         5q4czVDQKuUXGSuT9Fbs8T2oD1QAquHrP3xV5brmGsp19WdBiJG6vKE71lpSgQppw/nn
         8mtw==
X-Gm-Message-State: AAQBX9d9Pu9ybWBizmVwjJvt6d/ya26coxAa13962Crbb3hP8rsTQY6n
        2mPsi1OpVwJGdSWyTt38TO4T9JOky6mHE0nLZvxnlRiArUjYOnjf4pmuIj+wr9Ts2tRcLAQ/5rS
        Cb4TttnI3txQLfIPkkXKtUymo9UyFrA==
X-Received: by 2002:a05:6402:1b1e:b0:504:894b:1bb7 with SMTP id by30-20020a0564021b1e00b00504894b1bb7mr131135edb.5.1681248370146;
        Tue, 11 Apr 2023 14:26:10 -0700 (PDT)
X-Google-Smtp-Source: AKy350Zr8wNXV1vI0Ha3mRtOxIVr28P7JNJNd9aKU3Ri030hRw3Zzdf0/Qbd8bqSqpJxQRc5EG0fVQ==
X-Received: by 2002:a05:6402:1b1e:b0:504:894b:1bb7 with SMTP id by30-20020a0564021b1e00b00504894b1bb7mr131117edb.5.1681248369764;
        Tue, 11 Apr 2023 14:26:09 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id w30-20020a50d79e000000b00504890a0de5sm4105373edi.34.2023.04.11.14.26.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Apr 2023 14:26:09 -0700 (PDT)
Message-ID: <73428542-6aaf-5db3-9d67-f73cf1082695@redhat.com>
Date:   Tue, 11 Apr 2023 23:26:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: "leds: trigger: use RCU to protect the led_cdevs list" triggers
 RCU error checks
To:     Johannes Berg <johannes@sipsolutions.net>,
        Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>
Cc:     Linux LED Subsystem <linux-leds@vger.kernel.org>
References: <600cc06e-081d-cd90-947d-f8988f1af194@redhat.com>
 <b449dda32e0f3bb0adeeda4fd0e1e7f58a29b43f.camel@sipsolutions.net>
Content-Language: en-US, nl
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <b449dda32e0f3bb0adeeda4fd0e1e7f58a29b43f.camel@sipsolutions.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Johannes,

Thank you for the quick reply.

On 4/11/23 21:38, Johannes Berg wrote:
> Hi,
> 
>> Sorry to bring the bearer of bad news, but your commit 2a5a8fa8b23
>> ("leds: trigger: use RCU to protect the led_cdevs list"),
>> is causing the following RCU warning when used with blinking
>> triggers on I2C LED controllers which support hw blinking.
> 
> Err, well, surely that is a pre-existing driver bug then?

So I just checked and the following LED drivers all have
a blink_set() implementation which calls mutex_lock()
and/or does I2C transfers:

leds-an30259a.c
leds-aw2013.c
leds-bd2802.c
leds-lp3944.c
leds-pca9532.c
leds-pca963x.c
leds-wm831x-status.c

And I only found one i2c LED controller driver which defers
I2C transfers to a workqueue itself (leds-tca6507.c).

And looking at: include/linux/leds.h

Then the brightness_set callback is explicitly marked as
"Must not sleep." (and there is a brightness_set_blocking
which e.g. I2C drivers can use instead).

So I believe that the intention has always been that
a driver's blink_set callback is allowed to sleep.

With that said you seem to be right that there seems to
be a long standing bug where led_trigger_blink[_oneshot]
calls led_classdev.blink_set() in a context where it may
not sleep.

But that is more of a LED (trigger) core bug then an
issue with the driver(s).

>> The specific problem is drivers/leds/led-triggers.c:
>> led_trigger_blink_setup() which does:
>>
>>         rcu_read_lock();
>>         list_for_each_entry_rcu(led_cdev, &trig->led_cdevs, trig_list) {
>>                 if (oneshot)
>>                         led_blink_set_oneshot(led_cdev, delay_on, delay_off,
>>                                               invert);
>>                 else
>>                         led_blink_set(led_cdev, delay_on, delay_off);
>>         }
>>         rcu_read_unlock();
>>
>> And that led_blink_set() call then hits this path:
>>
>>         if (!test_bit(LED_BLINK_ONESHOT, &led_cdev->work_flags) &&
>>             led_cdev->blink_set &&
>>             !led_cdev->blink_set(led_cdev, delay_on, delay_off))
>>                 return;
>>
>> Which calls directly into the LED controller driver
> 
> Sure, so far so good.
> 
>> which talks to the LED controller over I2C which may sleep.
> 
> Which seems to me was already wrong before my patch, since the code was:
> 
>        read_lock_irqsave(&trig->leddev_list_lock, flags);
>        list_for_each_entry(led_cdev, &trig->led_cdevs, trig_list) {
>                if (oneshot)
>                        led_blink_set_oneshot(led_cdev, delay_on, delay_off,
>                                              invert);
>                else
>                        led_blink_set(led_cdev, delay_on, delay_off);
>        }
>        read_unlock_irqrestore(&trig->leddev_list_lock, flags);
> 
> 
> Surely, the code wasn't allowed to sleep in an _irqsave() section? You'd
> just see a different check complain, rather than about RCU, I guess.

Hmm, so the irqsave part of this was introduced by commit 27af8e2c90fb
("leds: trigger: fix potential deadlock with libata") but even before
then I think sleeping here was not allowed, given that an rwlock is
a spinlock variant the non irqsave version also leads to a section
where sleeping is not allowed I believe.

Further git archeology seems to indicate that this problem has existed
for a long long time already. I guess I'm the first user of a trigger
which calls led_trigger_blink[_oneshot] on a led_classdev with
a hw blink_set() implementation which sleeps. Or at least I'm
the first user to do so with various lock-debugging options
enabled ...

> So maybe you're bringing bad news, but I don't think it's for me ;-)

Yes it seems I have unearthed a bug which is much older then your
RCU changes.

> I don't see cht_wc_leds_brightness_get() or a driver/module called
> leds_cht_wcove even in linux-next, so I guess you should look wherever
> you got _that_ from.

Right that is part of a new LED driver I'm working on. I guess I could
fix things in the driver, but this seems to be a (trigger) core bug
so lets try to solve it there.

Regards,

Hans


