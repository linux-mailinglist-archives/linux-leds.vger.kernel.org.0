Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC6073E4D6B
	for <lists+linux-leds@lfdr.de>; Mon,  9 Aug 2021 21:54:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229812AbhHITyu (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 9 Aug 2021 15:54:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229516AbhHITyt (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 9 Aug 2021 15:54:49 -0400
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com [IPv6:2607:f8b0:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC479C0613D3;
        Mon,  9 Aug 2021 12:54:28 -0700 (PDT)
Received: by mail-oi1-x234.google.com with SMTP id bi32so1407674oib.2;
        Mon, 09 Aug 2021 12:54:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=eF/17oHdLHVi0xJUwmBxYd83d4UXKACoh9Nvbc+lX38=;
        b=Qx5ivI6cU6P2mhct69DR4Od968CCXsxwhHooCmsn7ViDPJWdv9wmba5Gv9GMRa4zXq
         j+3HVdFPZ2DHm0LP/70RPOToE5OSiVBeeon02jnXZB0j1y+ErkmMcpVrWQkpHxI6t+J+
         8u6l8jfRNo4eJbn1iZSDIGd+5ShRt88O3SP+dqMQEe0ijMnFX/ZR4WqP+h3r13TUVFk9
         hilvR8LexDb5R9Smon34lsaACVKFy7SEYMlUwrczgNv52naDtmJiOSOyCJk1wIam7WhS
         LPv/Uq2rWaFcuHKBSN6qIh8YpWFH71T6rVKVdxiG5yhIWJc10Yw1IwHxLBZr31r60Crk
         zF5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=eF/17oHdLHVi0xJUwmBxYd83d4UXKACoh9Nvbc+lX38=;
        b=L26fDr1aBSXuEVlOGPobo1sl3scYUdELH1xbFHF1Q2C2mpEKQVD9J0f64fmphTjTgC
         N5/43wcDxQpWyyN6Ic4cDd29BRbOR9d105XqEsmdFLO5BZLJKKUqqhgVXhAOn5SdznzR
         S+0lxHT+YuVbNynX6Rf+l1c9+nXm0p5lxHrSBXEJ28fGwhfMoKn2rMUNX5AHZIyyrGtQ
         3KNkP3Ct//MUpr2Do1/0YXe8Hl/5eBRpSlJ5jEV4zXwSYZ3z9K5EapcYr5+0I0ofosop
         7JpBA7etjo+zin15ajJS3tR9NCoA18vYNEQ4ZDat/cCMv9ZQzgAMO4upDBzkGcc/ChTD
         A48g==
X-Gm-Message-State: AOAM5319qK/Jmzp3Q5w3CHcj2BuIb4mq4OYc3uLvIWTUaxStBu3gc4Ou
        YwWaTzlPEODecnys4vxO38oFknstrCQlQB6Y
X-Google-Smtp-Source: ABdhPJyV0R3ALmj8cS21Wn76ApwuWuRO83XWXFzpzft+z2CK5Lf2m0xrYJAy2LgcTSHv279o8yQV6w==
X-Received: by 2002:aca:31d5:: with SMTP id x204mr674161oix.136.1628538868132;
        Mon, 09 Aug 2021 12:54:28 -0700 (PDT)
Received: from ian.penurio.us ([47.184.51.90])
        by smtp.gmail.com with ESMTPSA id n5sm541958oij.56.2021.08.09.12.54.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Aug 2021 12:54:27 -0700 (PDT)
Subject: Re: [RFC PATCH v2 00/10] Add configurable block device LED triggers
To:     =?UTF-8?Q?Marek_Beh=c3=ban?= <kabel@kernel.org>, pali@kernel.org
Cc:     linux-block@vger.kernel.org, linux-leds@vger.kernel.org,
        axboe@kernel.dk, pavel@ucw.cz, linux-kernel@vger.kernel.org,
        kernelnewbies@kernelnewbies.org
References: <20210809033217.1113444-1-arequipeno@gmail.com>
 <20210809205633.4300bbea@thinkpad>
From:   Ian Pilcher <arequipeno@gmail.com>
Message-ID: <81c128a1-c1b8-0f1e-a77b-6704bade26c0@gmail.com>
Date:   Mon, 9 Aug 2021 14:54:26 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210809205633.4300bbea@thinkpad>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Marek -

Thanks for taking the time to look at this.

On 8/9/21 1:56 PM, Marek Behún wrote:
> It may be simpler, but it is in contrast to how the netdev trigger
> works, which already is in upstream for many years. I really think we
> should try to have similar sysfs ABIs here. (I understand that the
> netdev trigger is currently unable to handle multiple network
> interfaces - but it is possible to extend it so.)

I'm not unalterably opposed to the idea, but I don't currently see a way
to do that without resolving block devices (struct gendisk) by name, and
that seems to be a no-no.

If you (or anyone else) has a suggestion on how to get around this
obstacle, I'd be willing to give it a shot.

> I think it is reasonable to be able to set something like this:
>    led0 : blink on activity on any of [sda, sdb, sdc]
>    led1 : blink on activity on sda
>    led2 : blink on activity on sdb
>    led3 : blink on activity on sdc
> 
> If I am reading your code correctly, it looks that only one LED can be
> configured for a block device. Is this true? If so, then the above
> configuration cannot be set.

You're correct that it's not possible with the current code.  Multiple
devices can be associated to with a single LED, but there's not
currently a way to drive more than 1 LED from a single device.  This
is something that could be changed.

> Also you are blinking the LED on any request to the block device. I
> would rather expect to be able to set the LED to blink on read and on
> write. (And possibly on other functions, like discard, or critical
> temperature, or error, ...) I would like to know what other people
> think about this.

I wanted to keep things as simple as possible for now.  I don't think
that there's any particular reason that separated LEDs couldn't be
configured for read and write requests.  (It looks like it should be
pretty easy to distinguish reads vs writes in a struct request.)

My feeling is that things like temperature, errors, etc. are better
monitored from user space, as they tend to require actively querying
the drive.

Like you, I'm interested in knowing if there is actually hardware out
there that has separate read/write LEDs.

All in all, I feel like I should be able to implement almost everything
that you've suggested, *if* I can figure out the block device lookup
issue, but I really don't have any ideas on that.

Thanks for your patience and feedback!

-- 
========================================================================
                  In Soviet Russia, Google searches you!
========================================================================
