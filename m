Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1421F3DABB2
	for <lists+linux-leds@lfdr.de>; Thu, 29 Jul 2021 21:14:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229961AbhG2TOa (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 29 Jul 2021 15:14:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229713AbhG2TOa (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 29 Jul 2021 15:14:30 -0400
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com [IPv6:2607:f8b0:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4B17C061765;
        Thu, 29 Jul 2021 12:14:26 -0700 (PDT)
Received: by mail-oi1-x235.google.com with SMTP id a19so9825170oiw.6;
        Thu, 29 Jul 2021 12:14:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=dq8X3bwjz9sqqkCm4+HA7qd+/0ngQHwPeVfx2qkB81Y=;
        b=u7xirmmJ5Hy56G/uAPI+A466Nr7diM5GyE+1ndVRveWCT+/AqYEJkZElxwouvwZghk
         5bRcYRaZU45Ju6dULijh7wlAuCJ5cMxvBCH3+yY6Dqj5XqMRNXGzmjMio6VPJyWQ3DtZ
         vg2ZBLJaAj6eSKqNpbzQCX9zYIqAY3UgvHnI3e/BTyz7+t5futV9yKOfpqHK5FUOhzuD
         vTr2QNFcrRxd+sJojLuUqu2X1m4ulqJOIrAMLZQJGUgScsZd/Ko+UpGjPh7eIVte4EQC
         73ocH3w+50kPf8eUfuDyCt/V1forChgqL7goG3MVX9032oC5Wsr7IDsNaoLBHP+GXTwD
         jUVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=dq8X3bwjz9sqqkCm4+HA7qd+/0ngQHwPeVfx2qkB81Y=;
        b=puujQ/UMp+jbBclZbW1qUrcoSuJ1e6DVPz7xvg+X4jcSMKQc3cDYWKeQoBvLaH3qGE
         BEU1ebwOnaER6r6Joe/3nlfqCRVb5PY0z/CJpS8C5aXogIJspC047tzL8zoaew2NWmgg
         +qH/VzVTlv6GHPy+wNPQ8LyrIioaLx873wamCrdFahh6a5RA1KdJTwmHquk0WfRtyOt+
         zLyCJBs6Pp5rMoaviFIq/Tg9DqGAenu3XxVcx7QhIu8LcOE0GD4Bj4Ily0Pgy/d/hVD2
         tV1uQx+XzL1SaouV141g6hoeOeoKuK+yQst1RJRrRcUNiVkYs7MWxqO4/f3k9kV7L3eh
         Hv2w==
X-Gm-Message-State: AOAM533iM9gxQGVt/oRXPwS0EiqBn/fILW6K5HVyTe9E+B/XMaeuHlV2
        jQNwPy8eq9WtGHmtq9a18Ia6tRLPiIfWS2zn
X-Google-Smtp-Source: ABdhPJyLfO/2HRJ0hVZIubo0kNuxVp9XStJqQnD4Zcl+AKZnqEkafj1F3lsi2V1UPF1a/smFr39hPA==
X-Received: by 2002:a54:468d:: with SMTP id k13mr11095578oic.125.1627586066226;
        Thu, 29 Jul 2021 12:14:26 -0700 (PDT)
Received: from ian.penurio.us ([47.184.51.90])
        by smtp.gmail.com with ESMTPSA id z6sm761213oiz.39.2021.07.29.12.14.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Jul 2021 12:14:25 -0700 (PDT)
Subject: Re: [RFC PATCH 0/8] Add configurable block device LED triggers
To:     Pavel Machek <pavel@ucw.cz>
Cc:     linux-block@vger.kernel.org, linux-leds@vger.kernel.org,
        axboe@kernel.dk, linux-kernel@vger.kernel.org,
        kernelnewbies@kernelnewbies.org,
        =?UTF-8?Q?Marek_Beh=c3=ban?= <kabel@kernel.org>
References: <20210729015344.3366750-1-arequipeno@gmail.com>
 <20210729085413.GA16945@amd> <b108799e-24a2-d5ec-e18e-b7ae8bded085@gmail.com>
 <20210729183541.GA6772@duo.ucw.cz>
From:   Ian Pilcher <arequipeno@gmail.com>
Message-ID: <7a353c64-a81f-a149-9541-ef328a197761@gmail.com>
Date:   Thu, 29 Jul 2021 14:14:24 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210729183541.GA6772@duo.ucw.cz>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 7/29/21 1:35 PM, Pavel Machek wrote:
> Yes, and I'd like to have that functionality, but I believe userland
> API should be similar to what we do elsewhere. Marek described it in
> more details.

On 7/29/21 6:59 AM, Marek Behún wrote:
...
 > - only one trigger, with name "blkdev"

I guess I'm missing something, because I just don't understand how this
can work for multiple, per-device LEDs.

-- 
========================================================================
                  In Soviet Russia, Google searches you!
========================================================================
