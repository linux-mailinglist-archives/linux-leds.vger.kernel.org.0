Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0A0F19BEAA
	for <lists+linux-leds@lfdr.de>; Sat, 24 Aug 2019 17:53:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727440AbfHXPxT (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 24 Aug 2019 11:53:19 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:53100 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726628AbfHXPxS (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 24 Aug 2019 11:53:18 -0400
Received: by mail-wm1-f65.google.com with SMTP id o4so11537757wmh.2;
        Sat, 24 Aug 2019 08:53:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=vCwPhxu+XisVo9i1552VuYe7l2Hda+qqnfmRLD+DEa0=;
        b=g6yItDStVpTxrMuw1zrWX1FYg02WxYK8nGnjK04ARNPZi46+L0EAzkUEZNYl5LVwYI
         GM3adosi7CHNbt2xSARddVQ4NWcm6nYJDXTqKAVnoLMr3R1gKm2JVRVma2YT1xvKM6BF
         bgviYEqX2CvHlTCem48Q7dkYjSYp2miLB553ZJ1IklEjQGc/dwc8BgGDmpKXdTay4vOv
         D2kvv0Xtci8AvdmiauJoKDtvhi1kqTokBj2n7DJf8XOf6eK8ioH47aemkrqdh2BM4dbQ
         C3HSo/zOMk3nBjHIEXBpc20WnU6uyXuVsUM/zl7QTcnSHOQg6G6+VRU1L8UuX3/xadma
         tdxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=vCwPhxu+XisVo9i1552VuYe7l2Hda+qqnfmRLD+DEa0=;
        b=f746RLijoii1MbSs8otAqKvjdkK4v139fKEiXbXT+jMrXFFTO6I1dqd3SAp4Z/jHyL
         f0dzBDkEZkg4uH9EVqgataxgdi91PGByLHtOIdCvNahBxZtEdPgkaj5A7VOajLlwF2jU
         3hsarB4m71kgJmDbFI6jUkCozAMVpFNC/ucnaiYrqte41ZE/aj+AWKDViU3qzBGrQbRY
         DdfgzMR5JFmhQWHUT7+ApGbUi5Tf4i2Xu7bBBzt/8BmzznojRWXWIeG48TAv/T6C5RaC
         MDhtY+zG/dgBO4pniasMJc4Lw7+e0E/Zy437KNl3I2Z+/+NpeLeF499dRaXYUci926/N
         s6Jw==
X-Gm-Message-State: APjAAAV27uppofmm0m0m/+6/rS/G5lHJH+Z2uMOs2BcCGQKuM986mZVc
        BQo/V7xPPriVn5zhv21C+C8=
X-Google-Smtp-Source: APXvYqymVWrjrfwCy4Xz0GWctLage0SMcJKrmEeRaDCOterLyVx97RddgIdLl/i+Fh+xk7qb6rqaQg==
X-Received: by 2002:a1c:a7c9:: with SMTP id q192mr11135854wme.144.1566661995736;
        Sat, 24 Aug 2019 08:53:15 -0700 (PDT)
Received: from [192.168.1.19] (bkw182.neoplus.adsl.tpnet.pl. [83.28.190.182])
        by smtp.gmail.com with ESMTPSA id g14sm12075103wrb.38.2019.08.24.08.53.13
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 24 Aug 2019 08:53:15 -0700 (PDT)
Subject: Re: [PATCH v4 4/5] block: introduce LED block device activity trigger
To:     Akinobu Mita <akinobu.mita@gmail.com>
Cc:     Pavel Machek <pavel@ucw.cz>, linux-block@vger.kernel.org,
        linux-leds@vger.kernel.org, linux-nvme@lists.infradead.org,
        linux-scsi@vger.kernel.org,
        Frank Steiner <fsteiner-mail1@bio.ifi.lmu.de>,
        Dan Murphy <dmurphy@ti.com>, Jens Axboe <axboe@kernel.dk>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Hannes Reinecke <hare@suse.com>
References: <1565888399-21550-1-git-send-email-akinobu.mita@gmail.com>
 <1565888399-21550-5-git-send-email-akinobu.mita@gmail.com>
 <20190817145509.GA18381@amd> <925633c4-a459-5e84-9c9a-502a504fdc82@gmail.com>
 <20190819143842.GA25401@amd> <7c4c4853-7e3a-0618-92a0-337e248e2b4c@gmail.com>
 <c937b7e0-02c6-ae9a-aaf7-16a2ef29886d@gmail.com>
 <CAC5umyjxkeR3rhf3XZvwkxLvc-0ENEkQfOLnk8A12Qazr9Et8w@mail.gmail.com>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=jacek.anaszewski@gmail.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <86309c4f-bcee-182c-369f-fcc883f379c6@gmail.com>
Date:   Sat, 24 Aug 2019 17:53:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAC5umyjxkeR3rhf3XZvwkxLvc-0ENEkQfOLnk8A12Qazr9Et8w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 8/23/19 6:00 PM, Akinobu Mita wrote:
> 2019年8月20日(火) 3:38 Jacek Anaszewski <jacek.anaszewski@gmail.com>:
>>
>> On 8/19/19 8:22 PM, Jacek Anaszewski wrote:
>>> On 8/19/19 4:38 PM, Pavel Machek wrote:
>>>> On Sat 2019-08-17 22:07:43, Jacek Anaszewski wrote:
>>>>> On 8/17/19 4:55 PM, Pavel Machek wrote:
>>>>>> On Fri 2019-08-16 01:59:58, Akinobu Mita wrote:
>>>>>>> This allows LEDs to be controlled by block device activity.
>>>>>>>
>>>>>>> We already have ledtrig-disk (LED disk activity trigger), but the lower
>>>>>>> level disk drivers need to utilize ledtrig_disk_activity() to make the
>>>>>>> LED blink.
>>>>>>>
>>>>>>> The LED block device trigger doesn't require the lower level drivers to
>>>>>>> have any instrumentation. The activity is collected by polling the disk
>>>>>>> stats.
>>>>>>>
>>>>>>> Example:
>>>>>>>
>>>>>>> echo block-nvme0n1 > /sys/class/leds/diy/trigger
>>>>>>
>>>>>> Lets use one trigger "block" and have the device as a parameter,
>>>>>> please.
>>>>>>
>>>>>> We already have 1000 cpu triggers on 1000 cpu machines, and yes, its a
>>>>>> disaster we'll need to fix. Lets not repeat the same mistake here.
>>>>>>
>>>>>> I guess it may be slightly more work. Sorry about that.
>>>>>
>>>>> We should be able to list available block devices to set,
>>>>> so the problem would be not avoided anyway.
>>>>
>>>> Should we? We need to list triggers, but we may not list all the devices...
>>>
>>> This is similar to usbport trigger that lists available
>>> ports as files in a sub-directory. We might eventually go
>>> in this direction.
>>
>> I must withdraw this statement. This is not similar to usbport
>> trigger. The difference is that with ledtrig-block we have separate
>> triggers per each device and I am not aware if there is some centralized
>> mechanism similar to blocking_notifier_chain (usb_notifier_list
>> in drivers/usb/core/notify.c) available for block devices, that
>> would allow to gather all available block devs under common trigger.
>>
>> Moreover I remember Greg once discouraged using notifier chains
>> as they are unsafe, so we would need some other solution anyway.
> 
> I start thinking that we should implement the LED block device activity
> trigger in userspace.  The userspace application firstly activates
> one-shot LED trigger and periodically reads /sys/block/<disk>/stat and
> writes /sys/class/leds/<led>/shot if there is any disk activity.

This would suboptimal solution. I have another idea - let's get back
to the implementation of ledtrig-blk in genhd.c. We would be registering
one trigger on module initialization in a function with __init modifier.
Then we would need to add/remove triggers to the ledtrig-blk in
register_blkdev()/unregister_blkdev(). And registered triggers would
be listed in block_devs directory created by the trigger.

You can compare how drivers/usb/core/ledtrig-usbport.c maintains
similar directory of usb ports.

-- 
Best regards,
Jacek Anaszewski
