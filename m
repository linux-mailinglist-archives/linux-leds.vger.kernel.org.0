Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 19A473E7DA6
	for <lists+linux-leds@lfdr.de>; Tue, 10 Aug 2021 18:43:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233987AbhHJQoR (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 10 Aug 2021 12:44:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231569AbhHJQoQ (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 10 Aug 2021 12:44:16 -0400
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com [IPv6:2607:f8b0:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B20ECC0613C1;
        Tue, 10 Aug 2021 09:43:54 -0700 (PDT)
Received: by mail-ot1-x333.google.com with SMTP id r19-20020a0568301353b029050aa53c3801so5735541otq.2;
        Tue, 10 Aug 2021 09:43:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=QhOtPuefuEMutGsCac+f7EFLsvx2tEnekhhvoDt/lTU=;
        b=p3zrQvymLKbekm91ddwjWDFOReJMaIdqA40ppej9m6Dddym4prDrExG+jHtC+kRlb0
         zOwO8/fG+hehzgCCqoLI6DhnRBGBh30eAcg8xqqhwGPHVXtLQM8RdJBzu4Q0taaJ8bHd
         XKSrZr4BxvmtsZAMmIEntsZDMw23qP9cLucGQmSFU4vIZ9GWUXr/GNurRsQTjhVFD0BU
         DSgO5xiE9oAqvUgiJr8eJZHudcLHFTjwkyMIJqIRjqTn2xOUwI1c91spza2OH9Ctv7Gp
         u3T8FTaKEC0Dil+cudVsRyqVj+a0rEqh9cdmRhU82HimdP7xU5E9nK1QCzn2ByJU8WBw
         U0yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=QhOtPuefuEMutGsCac+f7EFLsvx2tEnekhhvoDt/lTU=;
        b=ij5TMK+SpK//kpxGloZHYPATCr3VCvppcBqn0NOLzElWCm0V8rTyaynpgYU1Q/AVx8
         85N1pmIkg9Qw4Ixe6PKO5JTW49Lc6UEBoseoR9UL4Ii3esUEfeyI5i4UYv4nhSrpU/Jp
         v5QRvw4933AM/H31g2zw1DiDyUZ06QdBwrRq/rcKTjzam43k6H/Tyl6khsdd2+1orY+c
         9d6iqDAdOmLXE3yqr3lmUixYdkxBqXleTkEl0+35INKnWGbGYyXtQV3S8Igvawa7RecN
         J+rcB6aeSLXyWjFFXQdUXVpB4S1Z+c2YSuuBKjiG+PmQHXu6x4Lr8+MEWH9PXfCTG3yv
         LDFQ==
X-Gm-Message-State: AOAM531bsWO09Wq/njhI8Bd4ZK6M1CqX1Z5PkTTOT0CqrrLEZ/ww2wXu
        0n1chKL5feWlD24+AgbVpiga36sTifMSvvK7
X-Google-Smtp-Source: ABdhPJwPiOzwiIW+6zBsXx6aoG+opP1d+hflXb52aJ5eawnb3ZjsavNTzWtFQply3xj7O1lZ1Udgvw==
X-Received: by 2002:a9d:61cc:: with SMTP id h12mr15104495otk.190.1628613833977;
        Tue, 10 Aug 2021 09:43:53 -0700 (PDT)
Received: from ian.penurio.us ([47.184.51.90])
        by smtp.gmail.com with ESMTPSA id r25sm3410110oos.24.2021.08.10.09.43.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Aug 2021 09:43:53 -0700 (PDT)
Subject: Re: [RFC PATCH v2 00/10] Add configurable block device LED triggers
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     =?UTF-8?Q?Marek_Beh=c3=ban?= <kabel@kernel.org>, axboe@kernel.dk,
        kernelnewbies@kernelnewbies.org, linux-kernel@vger.kernel.org,
        linux-block@vger.kernel.org, pavel@ucw.cz, pali@kernel.org,
        hch@lst.de, linux-leds@vger.kernel.org
References: <20210809033217.1113444-1-arequipeno@gmail.com>
 <20210809205633.4300bbea@thinkpad>
 <81c128a1-c1b8-0f1e-a77b-6704bade26c0@gmail.com>
 <20210810004331.0f0094a5@thinkpad>
 <7b5f3509-5bcd-388b-8d3b-4ea95a9483ad@gmail.com> <YRIeHH1SLl6tYCeY@kroah.com>
 <20210810153840.42419d06@thinkpad> <YRKRpQdLRJmAb5kZ@kroah.com>
 <b8e99efb-7385-0ca2-641c-f93006b20527@gmail.com> <YRKoLBigjbOb/iLa@kroah.com>
From:   Ian Pilcher <arequipeno@gmail.com>
Message-ID: <bf1c68c1-efb3-f274-33c6-a3519fb133ce@gmail.com>
Date:   Tue, 10 Aug 2021 11:43:52 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YRKoLBigjbOb/iLa@kroah.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 8/10/21 11:24 AM, Greg KH wrote:
> There should not be anything "odd" about block devices here, just do
> whatever all other LED drivers do when referencing a device.

AFAIK, the only LED trigger that does anything similar is the netdev
trigger.  It uses dev_get_by_name(), which is specific to network
devices.

The block subsystem doesn't appear to have any similar API, which is
why Enzo submitted his patch to export block_class and disk_type back
in April[1], when he wanted to do something similar.

I'm basically bypassing the need to export the symbols, because my
trigger code is actually in the block subsystem, rather than the LEDs
subsystem.

[1] https://www.spinics.net/lists/linux-leds/msg18244.html

-- 
========================================================================
                  In Soviet Russia, Google searches you!
========================================================================
