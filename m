Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF47D42422A
	for <lists+linux-leds@lfdr.de>; Wed,  6 Oct 2021 18:07:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232071AbhJFQJB (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 6 Oct 2021 12:09:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239269AbhJFQJA (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 6 Oct 2021 12:09:00 -0400
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com [IPv6:2607:f8b0:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE813C061746;
        Wed,  6 Oct 2021 09:07:07 -0700 (PDT)
Received: by mail-ot1-x334.google.com with SMTP id l16-20020a9d6a90000000b0053b71f7dc83so3685598otq.7;
        Wed, 06 Oct 2021 09:07:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=5bOT1aMy04r9ERfNKx8ioqcPS9knlTxsfxOa2J+Yb5Y=;
        b=IZZq/SzRMxkg4IlYjcUKWCkoBGep2hVCqrniFpaVfOpoaAKwv7Mc/SoWmMkU/zzbPK
         J5v+68T2M4tq7iJAhZPL7sYpYThtIpC4SQvssa3MBr9dC8jq7ZwrJvsDpUIX6uLGYgI7
         F5/6+cba5dPK11kWB+qzzIZxAr/yfaB3MDTB0lS8Qqyf/SKn8OYx0TWfw1uYE0naSryg
         7TufkAUJTiAeDgcuyOETkjJwreDZH8R8xMEBAbElhRaDbLHzuZAetTTmg/7Tq5oIHyMN
         G4IKoMEwkX40unRqnsD1QVpPy3jyxlHxwjaYQMy+/9aNyCwI9w/nQf5r3M/ExTh8khky
         ezww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=5bOT1aMy04r9ERfNKx8ioqcPS9knlTxsfxOa2J+Yb5Y=;
        b=kByBObYNTT1suAq6A9NPDSEwZ/QJIPweLro7bdXDHksY/5z/2v42mfzm9tCQlqKbOT
         Xmy1p0Cnrzp4/BBg8XzDyAy6CPGKELP4pcjdSpjAjmaZWUA/DWhDd0jpmome8zxA8mHG
         pbkjL3lhtOEdvc6EFywlZ4Dvg3F1ZtKpRBtA7lUw5nWt7IxRS1/gKADL4kIUCYsbbiKa
         cVAiqOzTqjthR716wcH01+uRQoJy6mSDmUdpD2t0lGXvfDSKV8ZyGxU1IaU7ZjSvcLnB
         DXG0lQWB01CP8MC/vDz+efelrpw8UAPfV3CoRt0QoLGX1mkYMjty9Y66YN0Dr1rQi++a
         BOSw==
X-Gm-Message-State: AOAM530SkMt+aVjJQlZhgop9I/w14hhd4gh4El16zXFsu0+a01yNdHBY
        3D6TuaU/CXrFu+U5eb6tYz0=
X-Google-Smtp-Source: ABdhPJx6BuafJd7pONLsK6EnzcFoLFKomSIGF6cS093tfZS+Nn2KQf+ojMJIBGC9t32Iut0EDOkNyQ==
X-Received: by 2002:a05:6830:30a5:: with SMTP id g5mr4658532ots.132.1633536427260;
        Wed, 06 Oct 2021 09:07:07 -0700 (PDT)
Received: from [172.31.250.1] ([47.184.51.90])
        by smtp.gmail.com with ESMTPSA id 12sm4165212otg.69.2021.10.06.09.07.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Oct 2021 09:07:06 -0700 (PDT)
Message-ID: <749c46a3-5d02-08ef-2a45-e785d65999c7@gmail.com>
Date:   Wed, 6 Oct 2021 11:07:06 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [RESEND PATCH v5 2/2] leds: trigger: Add block device LED trigger
Content-Language: en-US
To:     =?UTF-8?Q?Marek_Beh=c3=ban?= <kabel@kernel.org>
Cc:     pavel@ucw.cz, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org,
        hch@infradead.org
References: <20211004155546.1120869-1-arequipeno@gmail.com>
 <20211004155546.1120869-3-arequipeno@gmail.com>
 <20211005232738.371df6b8@thinkpad>
From:   Ian Pilcher <arequipeno@gmail.com>
In-Reply-To: <20211005232738.371df6b8@thinkpad>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Marek -

Thanks for taking the time to review this.

On 10/5/21 16:27, Marek Behún wrote:
> first, as I replied in one of the previous versions: it is not customary
> to use the const keyword in Linux the way you do use it, i.e.
>    int f(const int var)
> Your argument was that this makes the code more safe when changes are
> made in the future. Maybe this is true (although in my opinion it is
> not), but since this isn't done anywhere in kernel AFAIK, please drop it
> in this proposal.

I can do this.

> Second, I really would like to solve the problem looking up the block
> device, given name. Since block API does not provide such function, I
> think we should try to add it. It does not make sense to not be able to
> set, for example "sda1" to trigger a LED, when /sys/class/block/sda1
> exists, but someone deleted the /dev/sda1 device file.

I agree with you (and Greg) that this would be preferable, and if
someone were to implement such an API I would happily use it.

However, having looked at fs/block_dev.c and fs/inode.c, I can say with
confidence that I don't have the knowledge of how the inode cache works
that would be needed to implement such an API properly .  More
importantly, I have the definite impression that the block subsystem
maintainers would not be receptive to the idea.

> Anyway, see other comments below:

A few explanatory responses below.  Any points that aren't mentioned
below are changes that I will go ahead and make.

>> +/* Delayed work to periodically check for activity & blink LEDs */
>> +static DECLARE_DELAYED_WORK(led_bdev_work, led_bdev_process);
>>
>> +/* How often to run the delayed work - in jiffies */
>> +static unsigned int led_bdev_interval;
> 
> This is wrong. The interval can't be same for all triggers, this does
> not make sense. I want to be able to set different intervals for
> different LEDs, as in netdev trigger. Sure maybe not many people will
> use it, but the possibility should be there.

I think that it's different, rather than wrong, but I believe that I
can change the interval to a per-LED setting, rather than global.

> The work will then also be per LED and your structures should become
> more simple. You won't need to have NxM mapping between LEDs and block
> devices.

I have feeling that per-LED work items are likely to cause contention
for the mutex, since they will probably all have the same (default)
interval and they will usually be set up at about the same time (i.e.
at system boot).  Instead, I would propose to have a single work item
that is simply scheduled for the next time work is "needed" and then
checks all LEDs that are due at that time.

I also don't see that this would eliminate the many-to-many mapping.  It
seems like a useful feature.  For example, one could have a bunch of
device-specific read activity LEDs and a shared write (or discard) LED.

>> +	led->index = led_bdev_next_index++;
> 
> This variable led_bdev_next_index never gets subtracted from, it only
> increases. So if I enable and disable blkdev trigger ULONG_MAX times,
> I won't be able to enable it anymore since you return -EOVERFLOW ?
> This doesn't make any sense.

Each trig_bdev and trig_led needs a unique index so that it can be added
to one or more xarrays.  The increment-only pattern (capped at
ULONG_MAX - 1) is an easy way to generate unique indices.

And yes, this does mean that you can only associate an LED or a block
device with the trigger about 4 billion times on a 32-bit platform.  I
really can't think of a scenario in which that limitation would be an
issue.

 >> +	bdev = blkdev_get_by_path(path, mode, THIS_MODULE);
 >
> And this is what we should discuss with blk API people. I would really
> like to find the block device by name as seen in /sys/class/block.

Right ... but how?

-- 
========================================================================
                  In Soviet Russia, Google searches you!
========================================================================
