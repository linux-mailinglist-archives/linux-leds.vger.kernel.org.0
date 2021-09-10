Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D4BF4072E0
	for <lists+linux-leds@lfdr.de>; Fri, 10 Sep 2021 23:23:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234458AbhIJVYT (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 10 Sep 2021 17:24:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234331AbhIJVYR (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 10 Sep 2021 17:24:17 -0400
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com [IPv6:2607:f8b0:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B1E8C061574;
        Fri, 10 Sep 2021 14:23:04 -0700 (PDT)
Received: by mail-ot1-x329.google.com with SMTP id l7-20020a0568302b0700b0051c0181deebso4055266otv.12;
        Fri, 10 Sep 2021 14:23:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=kiPr0VA4llBq0cLdvqK4IheV72+wX8xwDjal038cGwk=;
        b=NAJiZg1Qp+Vzk6wNyzdhAxYX9E3T4PYTAEka2KCcCEyt6TC0a/oOB2jIvCpI9rbJCj
         e2iRyCxbizmDW+pwNJyEDuDIfz86ClTHu8BlOJ6bRqaJObcUNiv9/GPggiw4dh0WE2DB
         mbpvbFB74ArOke8Dg2J4vn1/1ZH9IezJ/EYBbgGsGFArLplzg/cMSSPd2xIs0+g4LPaO
         Ho40TAiIpUHQgVeONJu/ybII5riuk2r/A51SdAo8y7LXUYjFSnRul77zTdTEmnosMcGF
         Osg0vYlYAiNKOlf72jGsKqKL8cMfG2WGWhFwYX6h2hY1/9ArgwyhgCrSg1gn6V0R8lY/
         RQxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=kiPr0VA4llBq0cLdvqK4IheV72+wX8xwDjal038cGwk=;
        b=OEIkTGiPgb/R+CiltY1pvOie6ZjMohvgiUmttzfeNo9z3PQp06es3PHrZdYhD0pHjI
         EOAbEHnrrZONMjgJbvuzSy1vLKOYoJIq3cEYMkkkq6tESyDdFMTApNtgSoSckTdxG2Ka
         O2cMrY9YbkbEhVeDdCALMMmd9Gu6H89iOhKuDvGow6imRRk9N1Bwy2ulX9dUv0yp7i4D
         R0KbhGiKVHijKB/pwh4aJQQ/aT8l0lUkLnzopHPPVbjGDt8t7JIBaQfoxzz9u5wOzB4A
         AxHCzY+V6I8Dgsw6wHjYU6E7qs+w6Tu+o/5UsK+E1ciWmdH6PcPcg2n6MjIeLrYgzJRv
         hPxQ==
X-Gm-Message-State: AOAM531sOMD9baI1xIrkiUeV9wTiLlcyjtNvzXyVttCuamZHbLAlgPQa
        eBM+Z0IqzEPvfKAUCwjyVEU=
X-Google-Smtp-Source: ABdhPJyZdrUeixHbtvWTBYk8MjtJJAy8X0S9xfPjQWwd/cuNQHBdNtqJ0YEiugNUDd8GKqud10c+SA==
X-Received: by 2002:a9d:4a88:: with SMTP id i8mr6198525otf.290.1631308983739;
        Fri, 10 Sep 2021 14:23:03 -0700 (PDT)
Received: from ian.penurio.us ([47.184.51.90])
        by smtp.gmail.com with ESMTPSA id k8sm1397988oom.20.2021.09.10.14.23.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Sep 2021 14:23:03 -0700 (PDT)
Subject: Re: [PATCH v2 09/15] leds: trigger: blkdev: Check devices for
 activity and blink LEDs
To:     =?UTF-8?Q?Marek_Beh=c3=ban?= <kabel@kernel.org>
Cc:     axboe@kernel.dk, pavel@ucw.cz, linux-leds@vger.kernel.org,
        linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
        gregkh@linuxfoundation.org
References: <20210909222513.2184795-1-arequipeno@gmail.com>
 <20210909222513.2184795-10-arequipeno@gmail.com>
 <20210910041713.4722760a@thinkpad>
 <77111c57-dfb5-44c6-c4e9-e18afb468b6e@gmail.com>
 <20210910171211.3c2236c3@thinkpad>
From:   Ian Pilcher <arequipeno@gmail.com>
Message-ID: <1e4986e2-53ba-9a0f-06d1-7cfb25d9f0e6@gmail.com>
Date:   Fri, 10 Sep 2021 16:23:02 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210910171211.3c2236c3@thinkpad>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 9/10/21 10:12 AM, Marek Behún wrote:
> On Fri, 10 Sep 2021 10:09:09 -0500
> Ian Pilcher <arequipeno@gmail.com> wrote:
>> You can't add partitions, only whole devices.
> 
> But I should be able to, since partition is a block device in /dev.
> Any block device from /sys/class/block should be possible to add.

I wasn't aware that was something that you were interested in doing.
This will require working with the block_device structure rather than
the gendisk.

One possible benefit of this change ... Assuming that block_device
structures are always allocated by bdev_alloc() *and* I'm correct in
thinking that this means that they are always allocated from the inode
cache, then they are always zeroed out when allocated, so there won't
be any need to explicitly initialize the pointer.

-- 
========================================================================
                  In Soviet Russia, Google searches you!
========================================================================
