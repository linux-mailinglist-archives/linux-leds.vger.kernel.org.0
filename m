Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DD3376E93A3
	for <lists+linux-leds@lfdr.de>; Thu, 20 Apr 2023 14:05:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233978AbjDTME7 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 20 Apr 2023 08:04:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229520AbjDTME6 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 20 Apr 2023 08:04:58 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F05219AF
        for <linux-leds@vger.kernel.org>; Thu, 20 Apr 2023 05:04:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1681992254;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=2IqO0QJ9HI2C8wG45AjZhDHrUxI4thUozNM/m4hfC5o=;
        b=etgnSiWGnTuu98A1DVZbWHgoxoF3YdsNmij39xsvTIKcGhZKAaHJDR5U06s6eB0XsWYeTh
        2kVc+qq96fPtIvrbYvobbB1mC1iYqLcUDHDjmmddA0X1CMhHJt4yO7eFoT54xa5qfod/4R
        kxTs1QZIxPc9xPHtWVI5JO7Z6X8vYnw=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-652-0QbB7x_hMw6z8NAeiKhvDw-1; Thu, 20 Apr 2023 08:04:13 -0400
X-MC-Unique: 0QbB7x_hMw6z8NAeiKhvDw-1
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-505b696f254so466266a12.3
        for <linux-leds@vger.kernel.org>; Thu, 20 Apr 2023 05:04:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681992251; x=1684584251;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2IqO0QJ9HI2C8wG45AjZhDHrUxI4thUozNM/m4hfC5o=;
        b=lQjUrP6JnInH+D39RfBCfwyO7ajZ0kSsn6LkahWctGm4YCUZFgLTtqtDFUsNXz43Dw
         5qC6VT8INeuRc7AbiExlvVAVVnb5TkVNKutEhkOOzSjn55DuBqC6QZYPyI8EFN4mWBtk
         yOYndMFmlxA1D+5gFGVZx7eRfJjzCpp/CWcJ+z03KIJ+FWvEAb5569/K82c5opbV2TkP
         MYWHTkYQ1+dYp67BRULLDPfl5Xta9xnRGnHDs8bqzqE74YH+IWeoY14sm35L2yZasD0/
         YIgyfSskJa3bMS4Zowk7KqV5FMivYHR/tddUNeAOaZqBImDWk431+a96G8iR8eiYrgNO
         w7Gw==
X-Gm-Message-State: AAQBX9ekmRnSgwBPxvKh0MTo0962FfVbVOIcJTy89IJgiCKoLDa+pthT
        SIEAXt+HgOgB+7YJgz8Bxzus0COGXztKrvXT9WMvRRrah6Ka6J+WxRT5LT0myLpQe+epAFozg79
        BV40p8ivCNdhqofVuRVyWwZpaEk31MA==
X-Received: by 2002:a50:e604:0:b0:506:e626:2da with SMTP id y4-20020a50e604000000b00506e62602damr1954212edm.4.1681992251689;
        Thu, 20 Apr 2023 05:04:11 -0700 (PDT)
X-Google-Smtp-Source: AKy350a6DOeBjhuZk2tHVt2zrqQSeasrgoP0EAiGJFZYKmkhLhnRn9t9/4v1xDJJDT6NID8bWKQrhQ==
X-Received: by 2002:a50:e604:0:b0:506:e626:2da with SMTP id y4-20020a50e604000000b00506e62602damr1954194edm.4.1681992251427;
        Thu, 20 Apr 2023 05:04:11 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a7-20020aa7d907000000b00506a09795e6sm684298edr.26.2023.04.20.05.04.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Apr 2023 05:04:10 -0700 (PDT)
Message-ID: <9ba72334-6c3a-e8cd-0692-b30278c4a88d@redhat.com>
Date:   Thu, 20 Apr 2023 14:04:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 0/4] Fix oops about sleeping in led_trigger_blink()
To:     Lee Jones <lee@kernel.org>
Cc:     Pavel Machek <pavel@ucw.cz>,
        Johannes Berg <johannes@sipsolutions.net>,
        linux-leds@vger.kernel.org
References: <20230412215855.593541-1-hdegoede@redhat.com>
 <20230420113653.GD970483@google.com>
Content-Language: en-US, nl
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230420113653.GD970483@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Lee,

On 4/20/23 13:36, Lee Jones wrote:
> On Wed, 12 Apr 2023, Hans de Goede wrote:
> 
>> Hi All,
>>
>> Here is a patch series to fix an oops about sleeping in led_trigger_blink()
>> + one other small bugfix.
>>
>> Patches 1-3 should arguably have a:
>>
>> Fixes: 0b9536c95709 ("leds: Add ability to blink via simple trigger")
>>
>> tag, but Fixes tags tend to lead to patches getting automatically added
>> to the stable series and I would prefer to see this series get some
>> significant testing time in mainline first, so I have chosen to omit
>> the tag.
> 
> With subjects with the word "fix" in it, they will be hoovered up by the
> Stable auto-picker anyway.

Ok, in that case patch 3 should have:

Fixes: 0b9536c95709 ("leds: Add ability to blink via simple trigger")

Patches 1-2 are more preparation patches for this. Patch 2 does
fix another race, but I'm not sure we ever hit that.

Can you add the fixes tag while merging these, or do you
want a v2 of this series ?

Regards,

Hans






> 
>> Hans de Goede (4):
>>   leds: Change led_trigger_blink[_oneshot]() delay parameters to
>>     pass-by-value
>>   leds: Fix set_brightness_delayed() race
>>   leds: Fix oops about sleeping in led_trigger_blink()
>>   leds: Clear LED_INIT_DEFAULT_TRIGGER when clearing current trigger
>>
>>  drivers/leds/led-core.c                  | 81 ++++++++++++++++++++----
>>  drivers/leds/led-triggers.c              | 17 ++---
>>  drivers/leds/trigger/ledtrig-disk.c      |  9 +--
>>  drivers/leds/trigger/ledtrig-mtd.c       |  8 +--
>>  drivers/net/arcnet/arcnet.c              |  8 +--
>>  drivers/power/supply/power_supply_leds.c |  5 +-
>>  drivers/usb/common/led.c                 |  4 +-
>>  include/linux/leds.h                     | 43 ++++++++++---
>>  net/mac80211/led.c                       |  2 +-
>>  net/mac80211/led.h                       |  8 +--
>>  net/netfilter/xt_LED.c                   |  3 +-
>>  11 files changed, 125 insertions(+), 63 deletions(-)
>>
>> -- 
>> 2.39.1
>>
> 

