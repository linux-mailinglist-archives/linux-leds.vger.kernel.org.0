Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 00F0A406DD7
	for <lists+linux-leds@lfdr.de>; Fri, 10 Sep 2021 17:00:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233907AbhIJPBg (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 10 Sep 2021 11:01:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233539AbhIJPBf (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 10 Sep 2021 11:01:35 -0400
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com [IPv6:2607:f8b0:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B17CC061574;
        Fri, 10 Sep 2021 08:00:24 -0700 (PDT)
Received: by mail-oi1-x234.google.com with SMTP id y128so3280106oie.4;
        Fri, 10 Sep 2021 08:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=wQtNDxK+stHmlXk66BKubuUVLuPTzjYg0fIt3ivIQek=;
        b=SYDaDPYgbgJN3VcKQZKoEAgtrCd84+T7uR+OJyE6WcjV+VguQxkSsdXPtKNkx4nQha
         JNFYscRaBlTDzffUmBCUUppIVYfajHkSlWSWzyXpqmC767U+6R/9A5ogSRbVsK3OO0o/
         qEwlnHPEfZQ5+N5YI8TEvgWpvCS2PxWqTFn46pLYj6WYNl3lzchHoT4kW/XnVr9uoi5W
         77DfL0xS9jrlYpgFgMQnGxYqF+OhX5t6BXuvAbdbt2OHhvsyFAeLitmz2eEJGoMrdBcM
         DUyHiJtGWQ60NQ+8t+eSTrG1/H8I5wB/kjfR46LhMG04SBECU40Df7WWLAqHlzOwCIpk
         TyTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=wQtNDxK+stHmlXk66BKubuUVLuPTzjYg0fIt3ivIQek=;
        b=nXHWRAjSHgrTI5XDLZOwHdMZu7PqjIyMezvJrTf8Gd3lyROkDy9r3X5Jt1dUDxOga9
         e/nXteHP+ie1eR0YoWaSy3YPlnyQAwQ3xX6tHCqAcouW9z6wfGsjBOpolk3w3Vdp0D2H
         IygWQtk/HIzkHcfJv5ocBxVw/tYHUb0NRDXySbcEucmXwHYrPH+2IcXn/mnGPjk68V7j
         lzJt5EWZ7B5x2orvTjF/113q35UNwD7a38g5aYhalgGRS0vic+ONp+SrBsecIt1yivIv
         IfGeL6Wk3jGXq/Cvw+7S14yvjwSZfVSGwQiU2DQn6lnSrx03HzqdWHJg7TgDSG45lqUE
         zHUA==
X-Gm-Message-State: AOAM530xIrAwVk2LLR9zuDIBpmty+Omz3ZeKtJzOBpDud6RNDRUIVO68
        QpzqFes3stV+T+SxTf8qkX8=
X-Google-Smtp-Source: ABdhPJzdUeZHCJK7gVOaL66L4g1Zgwg1Z0bGxP/5YNQqApki9OrQhrZPKoyKGL3damp5l3xmW1pi4g==
X-Received: by 2002:aca:5f04:: with SMTP id t4mr4493370oib.53.1631286023877;
        Fri, 10 Sep 2021 08:00:23 -0700 (PDT)
Received: from ian.penurio.us ([47.184.51.90])
        by smtp.gmail.com with ESMTPSA id s8sm1247577otd.76.2021.09.10.08.00.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Sep 2021 08:00:23 -0700 (PDT)
Subject: Re: [PATCH v2 04/15] block: Add block device LED trigger integrations
To:     =?UTF-8?Q?Marek_Beh=c3=ban?= <kabel@kernel.org>
Cc:     axboe@kernel.dk, pavel@ucw.cz, linux-leds@vger.kernel.org,
        linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
        gregkh@linuxfoundation.org
References: <20210909222513.2184795-1-arequipeno@gmail.com>
 <20210909222513.2184795-5-arequipeno@gmail.com>
 <20210910032319.71b843d7@thinkpad>
From:   Ian Pilcher <arequipeno@gmail.com>
Message-ID: <4b40f4fc-4baf-c75f-e61f-310fe6d15e0c@gmail.com>
Date:   Fri, 10 Sep 2021 10:00:23 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210910032319.71b843d7@thinkpad>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 9/9/21 8:23 PM, Marek Behún wrote:
> On Thu,  9 Sep 2021 17:25:02 -0500
> Ian Pilcher <arequipeno@gmail.com> wrote:
>> Call ledtrig_blkdev_disk_init() from device_add_disk() to ensure that
>> ledtrig is initialized to NULL, in case a driver allocates the structure
>> itself and doesn't use kzalloc()
> 
> No, this is not needed. If someone does not use kzalloc(), they should
> use it. No need to fix other code here.

Yeah.  I'm honestly not sure if this is necessary or not, as I don't
know if there are any drivers that actually have this problem.  I
decided to include this for now, because an uninitialized pointer can
cause memory corruption, etc., when the disk cleanup function follows a
garbage pointer.

This recent commit seems to indicate that until recently drivers were
responsible for doing gendisk allocation.

> commit f525464a8000f092c20b00eead3eaa9d849c599e
> Author: Christoph Hellwig <hch@lst.de>
> Date:   Fri May 21 07:50:55 2021 +0200
> 
>     block: add blk_alloc_disk and blk_cleanup_disk APIs
>     
>     Add two new APIs to allocate and free a gendisk including the
>     request_queue for use with BIO based drivers.  This is to avoid
>     boilerplate code in drivers.

Were those drivers expected to use kzalloc() or otherwise zero out the
entire structure?  I really don't know.

I think that it makes sense to defer to the block subsystem maintainers
on this question.

-- 
========================================================================
                  In Soviet Russia, Google searches you!
========================================================================
