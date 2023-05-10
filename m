Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9E3996FE19A
	for <lists+linux-leds@lfdr.de>; Wed, 10 May 2023 17:33:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237102AbjEJPdS (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 10 May 2023 11:33:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236614AbjEJPdR (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 10 May 2023 11:33:17 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF2262D66
        for <linux-leds@vger.kernel.org>; Wed, 10 May 2023 08:32:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1683732751;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=PVPBBjq6P+tiwQGILvj6w7+GEWzPDfiBOGoUCj76Gy0=;
        b=KnGnbAUz5BBbzA0htrGHCtpE/vKZcEGuCb9eUjDj8lzB/br2oeQr+upH5KoxUHqiJbG7Vm
        fttF+J5m7X8Bj1nqfT+dooqYJQt/waazypp2Ksro8IpHjN2Q4UaGXDXkEJwQu+CY9elQIs
        PbpnXZ9nkt+M9XlrZAGgBKFgwp0q/4U=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-583-qM6T4vQONiuu_nYfGHxAiQ-1; Wed, 10 May 2023 11:32:30 -0400
X-MC-Unique: qM6T4vQONiuu_nYfGHxAiQ-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-94a355c9028so847331066b.3
        for <linux-leds@vger.kernel.org>; Wed, 10 May 2023 08:32:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683732749; x=1686324749;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PVPBBjq6P+tiwQGILvj6w7+GEWzPDfiBOGoUCj76Gy0=;
        b=k4TaRpZww6kR78qWbW9oq3C4UgUIs/n+CO1z0fDyeEItZoBFCtHG7gRTrqPcwh1zJC
         eA1BSIVYVvUahigTWWM+D7Z2SMRTPi6j1GdTro7cYSHGFV3IIV+0mkXKdo7eO07/yTbG
         Mw+fVd1tkyftfybfQhBUsxOr5dpc+DMydJ4I+yZpvwQQfS1TtyQgfmyEcpyXwurGkP7Z
         u8eoH4Jhu2KQ/2DkAF2zQmxgnqIl6f7OQ/O07NT8PhT8a5oR5U5Bhorx3SwNI0hIQlEz
         JqrUPCz2OESBQ6phOTYXRtOqX7DyHfyqW5geNHZjhTmVGx9KZgPINzfllWINq9T8NGzC
         UG3Q==
X-Gm-Message-State: AC+VfDwC8MIq2s0t0+EEQ2waiG7J4dPE4P9Q6cCgWqD5RCkNpwVJnDEa
        MleCvgz4VahU3ekDvEJf4bCMcPHmUmQY6RvTnEiOWEJ72eDTnrFfsKrFM/PTjuxd4EN9i1oAIKJ
        1ptJUZTWbsrKFLSAlM+9T1Q==
X-Received: by 2002:a17:907:2689:b0:961:272d:bda5 with SMTP id bn9-20020a170907268900b00961272dbda5mr15791428ejc.49.1683732749037;
        Wed, 10 May 2023 08:32:29 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4uhlMfAFj9sJuB1p/1rvB+DicqV2eSRBx/uyLFMpnHJc5QIalosGey+Xrc5jQBRLaOTsDT9w==
X-Received: by 2002:a17:907:2689:b0:961:272d:bda5 with SMTP id bn9-20020a170907268900b00961272dbda5mr15791409ejc.49.1683732748720;
        Wed, 10 May 2023 08:32:28 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id v21-20020a1709060b5500b00965e68b8df5sm2786656ejg.76.2023.05.10.08.32.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 May 2023 08:32:28 -0700 (PDT)
Message-ID: <9b2e2363-8f32-ee58-0585-3531bce2f8c4@redhat.com>
Date:   Wed, 10 May 2023 17:32:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 1/4] leds: Change led_trigger_blink[_oneshot]() delay
 parameters to pass-by-value
Content-Language: en-US, nl
To:     Lee Jones <lee@kernel.org>
Cc:     Pavel Machek <pavel@ucw.cz>,
        Johannes Berg <johannes@sipsolutions.net>,
        linux-leds@vger.kernel.org
References: <20230412215855.593541-1-hdegoede@redhat.com>
 <20230412215855.593541-2-hdegoede@redhat.com>
 <20230510115730.GA8963@google.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230510115730.GA8963@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi,

On 5/10/23 13:57, Lee Jones wrote:
> On Wed, 12 Apr 2023, Hans de Goede wrote:
> 
>> led_blink_set[_oneshot]()'s delay_on and delay_off function parameters
>> are pass by reference, so that hw-blink implementations can report
>> back the actual achieved delays when the values have been rounded
>> to something the hw supports.
>>
>> This is really only interesting for the sysfs API / the timer trigger.
>> Other triggers don't really care about this and none of the callers of
>> led_trigger_blink[_oneshot]() do anything with the returned delay values.
>>
>> Change the led_trigger_blink[_oneshot]() delay parameters to pass-by-value,
>> there are 2 reasons for this:
>>
>> 1. led_cdev->blink_set() may sleep, while led_trigger_blink() may not.
>> So on hw where led_cdev->blink_set() sleeps the call needs to be deferred
>> to a workqueue, in which case the actual achieved delays are unknown
>> (this is a preparation patch for the deferring).
>>
>> 2. Since the callers don't care about the actual achieved delays, allowing
>> callers to directly pass a value leads to simpler code for most callers.
>>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>>  drivers/leds/led-triggers.c              | 16 ++++++++--------
>>  drivers/leds/trigger/ledtrig-disk.c      |  9 +++------
>>  drivers/leds/trigger/ledtrig-mtd.c       |  8 ++------
>>  drivers/net/arcnet/arcnet.c              |  8 ++------
>>  drivers/power/supply/power_supply_leds.c |  5 +----
>>  drivers/usb/common/led.c                 |  4 +---
>>  include/linux/leds.h                     | 16 ++++++++--------
>>  net/mac80211/led.c                       |  2 +-
>>  net/mac80211/led.h                       |  8 ++------
>>  net/netfilter/xt_LED.c                   |  3 +--
>>  10 files changed, 29 insertions(+), 50 deletions(-)
> 
> Just came to apply this and realised that you have touched other
> subsystems without Cc'ing the appropriate maintainers.

Good point, sorry about that.

> Please can you [RESEND] this set and include them please?

Ack, I'm rebasing them on 6.4-rc1, checking no new
users of led_trigger_blink() / led_trigger_blink_oneshot()
(which this set changes the prototype of) have shown up
and then I'll do a resend.

(if I have to make any changes other then the plain rebase
I'll make it a version 2 set instead.)

Regards,

Hans


