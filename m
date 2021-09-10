Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 82CA9406F95
	for <lists+linux-leds@lfdr.de>; Fri, 10 Sep 2021 18:25:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229486AbhIJQ02 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 10 Sep 2021 12:26:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229481AbhIJQ01 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 10 Sep 2021 12:26:27 -0400
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com [IPv6:2607:f8b0:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F4E8C061574;
        Fri, 10 Sep 2021 09:25:16 -0700 (PDT)
Received: by mail-ot1-x32e.google.com with SMTP id o16-20020a9d2210000000b0051b1e56c98fso2954531ota.8;
        Fri, 10 Sep 2021 09:25:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=gTRko9+9hzxovpHC1NjogMeJSbh/DrCYskpnk56wVhg=;
        b=hIrZD5d9y72Du03LbBrq0ZlBzX1TMFmYA7DfMsrVsbKax+DgY+JqWzaZwHd55XDzmQ
         AvbkoSVr0EuAIFBOClSULLX18uEYfCmPGGBKcedzvSBT3loQmDO7qLNHGnhr2F1oalbK
         vfq3dS2b/YCOnm4TkTSfHuvexGQFKZvFQJ0GmQrgr8SJyIxvGS2JvCMtFUi7M5drp8Oh
         UiZ0Ep/++EV5wcuAyyIITdeQzRzHWqtncyobetT9/LZIs2GNwjnlY7OnDq3+2yqI2oXi
         XfyLMq+DB5kiiBzK74meH+eoLxBC9uGmIyO55uw42uHR6nuonSgZf+LOSK6Qdp1MKYqi
         6f3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=gTRko9+9hzxovpHC1NjogMeJSbh/DrCYskpnk56wVhg=;
        b=6UfZbiuknaze+764x2hpc6pr/jZPVsJ8lZcA5JvT2/sPahEW3/tBoxQBHO5Yc5cJoq
         TycZ9PgBx91s8uAuDkvlqNag8Ff6uC5M9+l52mnF+DEpGa5MnIe1VhaLw30Ld8Bl8YTL
         lm5A1VVEtMFSb/G1OcZqO0xIzWY4hJ6Usj3GESMzt2Np1lPmZLJxKiM1cEpqETOdO5z8
         lPeepM56C8KkdkGdDEAyHCzwESb4aloU9PanLISoFY24gaRv/OihJnh3rQbs/hDeWa+u
         4bR2INNH5605FgeIDblJiYTV3BVEKwSI3cFca9tQeeDTyJBTyCZVwLYL2BhkYfPwQnmN
         RorA==
X-Gm-Message-State: AOAM533pFf8qHfns3MZ26ifMLnyUYYWALqiC9r6O5/gljkwaaptI3tev
        puROTiOVl1N55zb1rYToiZc=
X-Google-Smtp-Source: ABdhPJwvzKxMjXRqzZPoqLUloRhQbL1Ihl+UFN62hj4nXhJwvwc5o+Ki76Et2WjaBndE0jd4cP+mqg==
X-Received: by 2002:a9d:6e0d:: with SMTP id e13mr5316104otr.304.1631291115499;
        Fri, 10 Sep 2021 09:25:15 -0700 (PDT)
Received: from ian.penurio.us ([47.184.51.90])
        by smtp.gmail.com with ESMTPSA id a13sm1264748ooi.3.2021.09.10.09.25.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Sep 2021 09:25:15 -0700 (PDT)
Subject: Re: [PATCH v2 11/15] leds: trigger: blkdev: Enable linking block
 devices to LEDs
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     axboe@kernel.dk, pavel@ucw.cz, linux-leds@vger.kernel.org,
        linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
        kabel@kernel.org
References: <20210909222513.2184795-1-arequipeno@gmail.com>
 <20210909222513.2184795-12-arequipeno@gmail.com> <YTr/2bflThomjHqL@kroah.com>
From:   Ian Pilcher <arequipeno@gmail.com>
Message-ID: <9ba618c6-20aa-c9fd-dfef-1cef57168742@gmail.com>
Date:   Fri, 10 Sep 2021 11:25:14 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YTr/2bflThomjHqL@kroah.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 9/10/21 1:48 AM, Greg KH wrote:
>> +/* Gets or allocs & initializes the blkdev disk for a gendisk */
>> +static int blkdev_get_disk(struct gendisk *const gd)
>> +{
>> +	struct ledtrig_blkdev_disk *disk;
>> +	struct kobject *dir;
>> +
>> +	if (gd->ledtrig != NULL) {
>> +		kobject_get(gd->ledtrig->dir);
> 
> When do you decrement this kobject?

That happens in blkdev_disk_unlink_locked() at line 399.  (Also in the
error path in blkdev_put_disk(), called at line 321.)

Looking at this now, blkdev_disk_unlink_locked() should be calling
blkdev_put_disk(), rather than calling kobject_put() directly.  I'll fix
that.

>> +static void blkdev_put_disk(struct ledtrig_blkdev_disk *const disk)
>> +{
>> +	kobject_put(disk->dir);
>> +
>> +	if (hlist_empty(&disk->leds)) {
>> +		disk->gd->ledtrig = NULL;
>> +		kfree(disk);
> 
> This should happen in the kobject release function, not here, right?

If you're referring to the kfree() call, it's freeing the
ledtrig_blkdev_disk structure, not the gendisk.  I use "gd" for gendisk
pointers and "disk" for ledtrig_blkdev_disk pointers.

> Did you try this out with removable block devices yet?

Absolutely.  I've tested removing both block devices and (user space)
LEDs.

-- 
========================================================================
                  In Soviet Russia, Google searches you!
========================================================================
