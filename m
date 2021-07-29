Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 52D003DA99F
	for <lists+linux-leds@lfdr.de>; Thu, 29 Jul 2021 19:03:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229620AbhG2RDK (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 29 Jul 2021 13:03:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229565AbhG2RDK (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 29 Jul 2021 13:03:10 -0400
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com [IPv6:2607:f8b0:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4CD2C061765;
        Thu, 29 Jul 2021 10:03:05 -0700 (PDT)
Received: by mail-oi1-x234.google.com with SMTP id w6so9283763oiv.11;
        Thu, 29 Jul 2021 10:03:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=48GpcyRTXY0iV0Yn24BwGNhhL7mTyBkdtTI5JRfp5Nc=;
        b=c+Mm2sSrlJalV4WONcqQ73ypeaI1CHM4QAYBR98KYgFRIHa5/FzhOfhaaCI5TR7zrp
         3+Q7k/9LlKQqKt8xV+XT8S2Yi0vA+B1JqFlkSZAyInycsp5w+YXnUSvcqbRYag69vGXo
         8ZRjqzBgxmq1OidIiOd5BXV9vS8qBH79LW2jCdJfKZIbZuEBz7oEOJ55TwO4DgQkNv6N
         o6cI/jUXdhUufV95+07SsoJfUs1NpiZl/DO9O2uLFJU+8nuFes+iOLUA5VdqOC17sbBx
         p/5dT/eg+S2d2RYCG6CPPpXEW2ksJpMDyV+gdr7O69Qb8W9ODsPxTzXhyiRx71+rrm9Y
         ZbhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=48GpcyRTXY0iV0Yn24BwGNhhL7mTyBkdtTI5JRfp5Nc=;
        b=BkCggNo+aNGX9zuYeJHLIX+ojSAuFhuDhEMMlAAqZP4RlCGZwisUviTSqcqxyqHt7Q
         KsOoqEpvqWpouOFPlGO1/Cf7JigU6NLko9nJ8E7WBvJXlWQtPd1pW4rG1g2x8Etrwmhr
         E5CUo13w879cFLCLIIhr35eGGt5Qtm1weBKaGmvY4S89BfL8r3IEG9xj8KxSnjY+IRZC
         v2Bkjw3jKlo4vt9JSCtTsOnxHPGQ77+xxzzFdFBQUCHqT48Zh16vqH9lyRuZs/QnxkyR
         ULTqfg6HccL6DIFJRZyL5IUFlDoNQEk2oZoKi3B6YvLXxrY/uC4fTx/HaKthnULZeo0M
         GWWQ==
X-Gm-Message-State: AOAM532tXPIG0cXNe+9CqpkHnPl/i6UxZ4EaMEHprJqa2hEaSilV3rHP
        ohwMTa78YJpRHdAjUhRQ5YGhoWjS8phYP5Pv
X-Google-Smtp-Source: ABdhPJw7ocOYLDfL5dZaVR4MDFI8xCYr21lpH9j8rvUQmHcPSf4Avd82c6eds3Y6dtRmTNm44FvHWQ==
X-Received: by 2002:aca:da02:: with SMTP id r2mr3612195oig.141.1627578185251;
        Thu, 29 Jul 2021 10:03:05 -0700 (PDT)
Received: from ian.penurio.us ([47.184.51.90])
        by smtp.gmail.com with ESMTPSA id be15sm679082oib.18.2021.07.29.10.03.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Jul 2021 10:03:04 -0700 (PDT)
Subject: Re: [RFC PATCH 0/8] Add configurable block device LED triggers
To:     Pavel Machek <pavel@ucw.cz>
Cc:     linux-block@vger.kernel.org, linux-leds@vger.kernel.org,
        axboe@kernel.dk, linux-kernel@vger.kernel.org,
        kernelnewbies@kernelnewbies.org
References: <20210729015344.3366750-1-arequipeno@gmail.com>
 <20210729085413.GA16945@amd>
From:   Ian Pilcher <arequipeno@gmail.com>
Message-ID: <b108799e-24a2-d5ec-e18e-b7ae8bded085@gmail.com>
Date:   Thu, 29 Jul 2021 12:03:04 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210729085413.GA16945@amd>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 7/29/21 3:54 AM, Pavel Machek wrote:
> We normally have a trigger ("block device activity") which can then
> expose parameters ("I watch for read" and "I monitor sda1").
> 
> Is there a reason normal solution can not be used?

This big difference is that this allows different devices to drive
different LEDs.  For example, my NAS has 5 drive bays, each of which
has its own activity LED.  With these patches, I can create a
separate trigger for each of those LEDs and associate the drive in each
bay with the correct LED:

   sdb --> trigger1 --> LED1
    ⋮         ⋮         ⋮
   sdf --> trigger5 --> LED5

(sda is the SATA DOM boot drive.)

Note that this also supports associating multiple devices with a single
trigger, so it can be used for more complicated schemes.  For example,
if my NAS had an additional LED and an optical drive, I could do this:

   sr0 --+
         |
         +--> trigger0 --> LED0
         |
   sda --+

   sdb -----> trigger1 --> LED1
    ⋮         ⋮         ⋮
   sdf -----> trigger5 --> LED5

As far as I know, the current triggers (disk-activity, disk-read,
disk-write, and ide-disk) don't support this sort of arbitrary
device-trigger association.

This patch set also support triggering LEDs from pretty much any block
device (virtual as well as physical), not just ATA devices, although
that's just a matter of the place from which the trigger is "fired".

I hope this explains things.

Thanks!

-- 
========================================================================
                  In Soviet Russia, Google searches you!
========================================================================
