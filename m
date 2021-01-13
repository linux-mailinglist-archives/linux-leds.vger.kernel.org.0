Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 68F5E2F4702
	for <lists+linux-leds@lfdr.de>; Wed, 13 Jan 2021 10:03:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727340AbhAMJBS (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 13 Jan 2021 04:01:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29034 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727389AbhAMJBR (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Wed, 13 Jan 2021 04:01:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1610528390;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=QuTRToQJZ9ENJOQ+foe03ejm+/o+GM2tw6NDRHaUP34=;
        b=MDpfO/Bm5WKjkN8+DTYLaDe/SB62GyFDmH/vZanD6JjyWW+cCXQlbJkThnNltc2vCnVWQy
        mEOVssmKpYb7kMP1pPSjD6Oz3bTuVdpUW/ggVlWiZ2XPYaOEE6sunun/2xDX1qFggRZ+nh
        Q7SyyCio1ljCKNnHoB1uCtcuCzOUCe8=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-127-jNnMw4duOOaLbHvckZcudg-1; Wed, 13 Jan 2021 03:59:46 -0500
X-MC-Unique: jNnMw4duOOaLbHvckZcudg-1
Received: by mail-ej1-f69.google.com with SMTP id gs3so639208ejb.5
        for <linux-leds@vger.kernel.org>; Wed, 13 Jan 2021 00:59:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=QuTRToQJZ9ENJOQ+foe03ejm+/o+GM2tw6NDRHaUP34=;
        b=b0+Lzb9W6ypZK0lx9Sk9xRrbnBqcFcfpJnHTdeN0aAqkuNqoxeiOK98vnaKA/oya1Q
         PFg1ZrW8YcDDmh5/h0LP7+YJjnL2ZAQ/Mxn/VeDxHrXKsYDd6KVWq6GJNaSRhR9KFF23
         mX1yKDTlcSznbQE0j2HDWbTO/QhrNJwtaLE2l5XwCmzXTPEG2MsvoT+4YT/H/cV3GNhe
         6vbK7my7KwyJVlpvRP2u1w2yxzKQh5zUnUj6wopWYQFXXmi04ZmGrtWJ+XGBBZ0/nMHA
         t0u0DlaAPM5wRq9dp6N1OAWomUqnjJZ2nGC/OoqTk1MPBYPXG3+VpRoxHz57zAKy22rU
         XssA==
X-Gm-Message-State: AOAM532yQheE1RxoZSmU6dgDjx29NVV5Oh+oyj2LHzGjCxLvWb4o7/Cb
        dId0w73xvuJ9VGTgkASila+uOgw6w5tHRqSEqRdpfCjUYuHmaGb67eUGG95gKLTJVBNFZ4fjtLJ
        bS63c2EBy5j4aZorNByB0oA==
X-Received: by 2002:a17:906:adce:: with SMTP id lb14mr825176ejb.502.1610528385584;
        Wed, 13 Jan 2021 00:59:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyFa+J3n+6YPkg6zlbrlGTjqx+UvGVawy0I7OSetvR0OSlaqpYHVx5JIy3LcDri33K59tFgZQ==
X-Received: by 2002:a17:906:adce:: with SMTP id lb14mr825165ejb.502.1610528385451;
        Wed, 13 Jan 2021 00:59:45 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-37a3-353b-be90-1238.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:37a3:353b:be90:1238])
        by smtp.gmail.com with ESMTPSA id ga11sm441697ejb.34.2021.01.13.00.59.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Jan 2021 00:59:44 -0800 (PST)
Subject: Re: 5.11 new lockdep warning related to led-class code (also may
 involve ata / piix controller)
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Jens Axboe <axboe@kernel.dk>, Dan Murphy <dmurphy@ti.com>,
        linux-ide@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <b204637d-3b72-8320-8a62-f075467d8681@redhat.com>
 <20210112223015.GB28214@duo.ucw.cz>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <f344f1db-1a7a-0a80-1cb1-f9c3fbf83abd@redhat.com>
Date:   Wed, 13 Jan 2021 09:59:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20210112223015.GB28214@duo.ucw.cz>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi,

On 1/12/21 11:30 PM, Pavel Machek wrote:
> Hi!
> 
>> Booting a 5.11-rc2 kernel with lockdep enabled inside a virtualbox vm (which still
>> emulates good old piix ATA controllers) I get the below lockdep splat early on during boot:
>>
>> This seems to be led-class related but also seems to have a (P)ATA
>> part to it. To the best of my knowledge this is a new problem in
>> 5.11 .
> 
> This is on my for-next branch:
> 
> commit 9a5ad5c5b2d25508996f10ee6b428d5df91d9160 (HEAD -> for-next, origin/for-next)
> 
>     leds: trigger: fix potential deadlock with libata
>     
>     We have the following potential deadlock condition:
>     
>      ========================================================
>      WARNING: possible irq lock inversion dependency detected
>      5.10.0-rc2+ #25 Not tainted
>      --------------------------------------------------------
>      swapper/3/0 just changed the state of lock:
>      ffff8880063bd618 (&host->lock){-...}-{2:2}, at: ata_bmdma_interrupt+0x27/0x200
>      but this lock took another, HARDIRQ-READ-unsafe lock in the past:
>       (&trig->leddev_list_lock){.+.?}-{2:2}
> 
> If I'm not mistaken, that should fix your issue.

I can confirm that this fixes things, thanks.

I assume that this will be part of some future 5.11 fixes pull-req?

Regards,

Hans

