Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 60CC83DAAA3
	for <lists+linux-leds@lfdr.de>; Thu, 29 Jul 2021 20:03:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229485AbhG2SDm (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 29 Jul 2021 14:03:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229556AbhG2SDm (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 29 Jul 2021 14:03:42 -0400
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com [IPv6:2607:f8b0:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4FDAC061765;
        Thu, 29 Jul 2021 11:03:38 -0700 (PDT)
Received: by mail-oi1-x234.google.com with SMTP id q6so9533600oiw.7;
        Thu, 29 Jul 2021 11:03:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=fuxy55vow1KuFQW+e5yb6EGMBOauB93N2LgKK+CL0WI=;
        b=lqemvRFpqTzI7XRonm35qDC/47Br7jRmw5ZIeL7tPnv93kH67cCBJr/fPOx0tOyAzQ
         6IfcJvP+MHZTUFYB4KH6Jk64YnqTyAjUwN31KI2nZxPUe82DeTL4/gnq56XlmATMB6VI
         mLtoV7wS796JFGhZNZ61OJbinHuIuU7SKgYeYlSbLYlo5NTTtwV4D+LolFH7ymXpGuk1
         qU+5JjACZqTol+3S8iQRAxZe0XK231tx62Yk25uiOmFUuf0p1+dAkix2N2gqFfQzUChP
         +PWEwDahEdlToZaRN7o8QQ+6XjY4kYZunY5Oi67FJOqxc6f4FGqi0I6soKpdNh7+dnlR
         BlaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=fuxy55vow1KuFQW+e5yb6EGMBOauB93N2LgKK+CL0WI=;
        b=a5fHhOqw/jI3BrLorjX2uPGO85eDPXTBDRSsGz1cGirguD63dCp882U7rSIpJuQn2O
         acEmg+ThSm83699EGw+PPkUVBu1Ft6D2gMAOxIgKF1VLobdAMQQ6fBdNTgcIl6SNKnj6
         VPKsAzf9UMhIATbfsARTwBWqeinWpzS8IFZNtrglWs1AjnwPRg8r/LkZHb7dKJos9Ylp
         ydx+nEnUsEUm+9gCF4xpSEefnR4zGyXH7z5N+MewIlWPsOMn9tJtVkbyTDfZi/3pnGbL
         G+/DjrTijtBV6lTHJu1bkW8rSpYawiIwnHq6gT2Xs3H9tKsa7vqu/11yegqNlcycXeIV
         3iOg==
X-Gm-Message-State: AOAM533YOhbqaJBh4sAUHTT5x3/iE/KluNratGTAKg+AlClvBiOu6yZT
        uIfSJOpJYUV+cxhpI29CrLQm+G1yl59ufvEf
X-Google-Smtp-Source: ABdhPJyXmsbTqz9YWsoEDwcIymc9NYbh3+0BQLzPGgII3gFC3V5UIKDJp3lClz/q8gWq/3T9+FnrkA==
X-Received: by 2002:aca:7589:: with SMTP id q131mr10222440oic.76.1627581818302;
        Thu, 29 Jul 2021 11:03:38 -0700 (PDT)
Received: from ian.penurio.us ([47.184.51.90])
        by smtp.gmail.com with ESMTPSA id n202sm732402oig.10.2021.07.29.11.03.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Jul 2021 11:03:37 -0700 (PDT)
Subject: Re: [RFC PATCH 1/8] docs: Add block device LED trigger documentation
To:     =?UTF-8?Q?Marek_Beh=c3=ban?= <kabel@kernel.org>
Cc:     linux-block@vger.kernel.org, linux-leds@vger.kernel.org,
        axboe@kernel.dk, pavel@ucw.cz, linux-kernel@vger.kernel.org,
        kernelnewbies@kernelnewbies.org
References: <20210729015344.3366750-1-arequipeno@gmail.com>
 <20210729015344.3366750-2-arequipeno@gmail.com>
 <20210729135955.3e3f591c@thinkpad>
From:   Ian Pilcher <arequipeno@gmail.com>
Message-ID: <9e75ce6e-0823-6701-4f1d-7e06fc4cddc1@gmail.com>
Date:   Thu, 29 Jul 2021 13:03:36 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210729135955.3e3f591c@thinkpad>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 7/29/21 6:59 AM, Marek Behún wrote:
> I don't really see the purpose for having multiple different block
> device LED triggers. 

Is there a different/better way to control per-device LEDs?  (I'm
thinking of something like my NAS, which has 5 drive bays, each with
its own activity LED.)

> Moreover we really do not want userspace to be
> able to add LED triggers with arbitrary names, and as many as the
> userspace wants.

To be slightly flippant, why not?  "Userspace" in this case is the
system/device administrator.  They presumably know what LEDs they have
and what they want to use them for, something which the kernel cannot
know (assuming a "generic" disto kernel).

> There is no sense in making userspace be able to
> create 10000 triggers.

It would certainly be possible to impose a limit on the number of
triggers that could be created.  But then someone has to decide what
that limit should be.  Personally, I lean very much toward giving the
system administrator the freedom to configure their system as they see
fit, even if that means that they can break it.  (Where "break"
basically means that they need to reboot.)

> Also if userspace can create triggers with
> arbitrary names, it could "steal" a name for a real trigger. For
> example if netdev trigger is compiled as a module, and before loading
> someone creates blockdev trigger with name "netdev", the loading of
> netdev trigger will fail.

Would adding a prefix to the LED trigger name address your concern
about arbitrary names and potential conflicts?  I.e. the system
administrator creates a block device LED trigger named "foo", and it
shows up as an LED trigger named "blkdev:foo" (or something like that).

> I would like the blkdev trigger to work in a similar way the netdev
> trigger works:
> - only one trigger, with name "blkdev"
> - when activated on a LED, new sysfs files will be created:
>    * device_name, where user can write sda1, vdb, ...
>    * read (binary value, 1 means blink on read)
>    * write (binary value, 1 means blink on write)
>    * interval (blink interval)
>    Note that device_name could allow multiple names, in theory...
>    Also some other disk states may be included, like error, or something

How would you support multiple, per-device LEDs (the NAS use case above)
in this scheme?

> - also the blinking itself can be done as is done netdev trigger: every
>    50ms the work function would look at blkdev stats, and if current
>    stat (number of bytes read/written) is different from previous, then
>    blink the LED

Is there a reason that you prefer this approach to simply having the
block layer "fire" the trigger?

Thanks for the feedback!

-- 
========================================================================
                  In Soviet Russia, Google searches you!
========================================================================
