Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F162727166B
	for <lists+linux-leds@lfdr.de>; Sun, 20 Sep 2020 19:45:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726253AbgITRpD (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 20 Sep 2020 13:45:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725858AbgITRpD (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 20 Sep 2020 13:45:03 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37960C061755
        for <linux-leds@vger.kernel.org>; Sun, 20 Sep 2020 10:45:03 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id p9so14636802ejf.6
        for <linux-leds@vger.kernel.org>; Sun, 20 Sep 2020 10:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=5JpaZVzY//RCuGukhL2ByWmxjNt65zbykozqYSBiZ8Q=;
        b=QTxrCBsG8fLc5rovCXh6vHRQcvT6aAEAccmcZUi1lF3KiQG0ejndjv6BHjFmFkHgfA
         +/aeqrid5BxhavbM3QnVrd8DO6YDP7pAVX4+MmSqDv6fLoZS1PWypOHIJvGXtL+uNtUs
         /WGFcCC0Anw2GfUrWPpb20UoLsvIpqrPDMLv0+3y6aAaWwlTxigsmXxFcpa8kykY4Naz
         q32wi/DvBwxCfflE927bqnTGHyituJVUHj6O4YNfMtrtFPQZi0DO4nlyD/rhR3elOksW
         8+iecbHrDCuaZ6kodfBTLshO2H7Fl+ulwaPlmeCQUaPjvteoZ1/ARd4Vr+YtLlo5SaSJ
         I5kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=5JpaZVzY//RCuGukhL2ByWmxjNt65zbykozqYSBiZ8Q=;
        b=jbOuKN9AP7EXAY8YLsCooPUVVclkygvP0XJP86TEl41bUsHFCq+3pVidpIZLkZV4pC
         u2CStGYmdDrNYmeHIB24EYj59XIxs3TDLPCT2INnpMhBo0fgJamsiT/pVkHLdFsocA0H
         Lxh2beTxrtqnOngcPZvTPwykSbapEiRGSRZToYEJk+xgSuSBOuWQx5LbCjV6BuqkeQxK
         OZrlA1MV75WGIkg5Ida8h6f7P9oWwOeZRKO26Qh6FesqxgAprl568p/Tv/q6Sq924TdZ
         jJInu3/hdSBoA1MApgvkk6KWNYjMTETTfKcmdBlhZCvcuA7Ypn40Lu+BISInRMGJU1SH
         GwNQ==
X-Gm-Message-State: AOAM5305sijOkRPUkXop5KHnngAd7IJJ4Gi4leBY6GmjnqRi772XFWfz
        QyT15aypvqpfNt6BIrblnr6+igbvF7U=
X-Google-Smtp-Source: ABdhPJzzgy4+2tOBfGnsY7Js6vGcOxjrzNSGh6LcgjZNw35dvxlOmyKjNUyeMDa4bMSLvmv1LoHqnw==
X-Received: by 2002:a17:906:a002:: with SMTP id p2mr9054352ejy.399.1600623901549;
        Sun, 20 Sep 2020 10:45:01 -0700 (PDT)
Received: from ?IPv6:2a01:110f:b59:fd00:1879:e534:7e37:5e55? ([2a01:110f:b59:fd00:1879:e534:7e37:5e55])
        by smtp.gmail.com with ESMTPSA id dt8sm6528826ejc.113.2020.09.20.10.45.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 20 Sep 2020 10:45:01 -0700 (PDT)
Subject: Re: [PATCH v2 1/2] dt-bindings: leds: add LED_FUNCTION for
 wlan2g/wlan5g
To:     Marek Behun <marek.behun@nic.cz>
Cc:     Adrian Schmutzler <freifunk@adrianschmutzler.de>,
        linux-leds@vger.kernel.org
References: <20200919192427.57033-1-freifunk@adrianschmutzler.de>
 <20200919223134.2371459c@nic.cz>
 <946e7a49-db74-8d2d-0ac8-5075d20f41f3@gmail.com>
 <20200920153707.70164720@nic.cz>
 <5ae6b9f4-3c9b-3a47-5738-585b28d841c5@gmail.com>
 <20200920172848.3e49d613@nic.cz>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <8a14bce6-ae0d-d714-b431-786b2696bd88@gmail.com>
Date:   Sun, 20 Sep 2020 19:44:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200920172848.3e49d613@nic.cz>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 9/20/20 5:28 PM, Marek Behun wrote:
> On Sun, 20 Sep 2020 16:59:01 +0200
> Jacek Anaszewski <jacek.anaszewski@gmail.com> wrote:
[...]

>>
>> In case of my mt7601u dongle it looks like below:
>>
>> /sys/class/leds/mt7601u-phy2$ cat trigger
>> none kbd-scrolllock kbd-numlock kbd-capslock kbd-kanalock kbd-shiftlock
>> kbd-altgrlock kbd-ctrllock kbd-altlock kbd-shiftllock kbd-shiftrlock
>> kbd-ctrlllock kbd-ctrlrlock usb-gadget usb-host timer disk-activity
>> disk-read disk-write ide-disk mtd nand-disk heartbeat cpu cpu0 cpu1 cpu2
>> cpu3 cpu4 cpu5 cpu6 cpu7 panic pattern rfkill-any rfkill-none rfkill2
>> phy2rx phy2tx phy2assoc phy2radio [phy2tpt]
>>
> 
> (This is another thing that is wrong: there should be only phy, or
> wireless-phy trigger, and the mode (rx/tx/assoc/radio) and device
> (phy0, phy1, ...) should be set via device_name file, as in netdev
> trigger. Can we reimplement it and leave this ABI under configuration
> option _LEAGACY?).

I agree.

>> IMO if LED is not physically integrated with any device, then it should
>> not be named after the device that is to be initially associated with
>> via trigger. This association can be later changed in userspace, which
>> will render the name invalid. And current associated device can be read
>> by reading triggers sysfs file, provided that the trigger conveys
>> that information like in case of presented above phy* triggers.
> 
> There are devices which have LEDs connected via a LED controller for
> example via I2C bus, but the individual LEDs are dedicated (in the way
> that there is an icon or text written on the device's case next to each
> LED). In this case the trigger-source should be defined in device tree
> in such a way that it aligns with the manufacturer's intended function
> of the LED. And in this case I think the devicename part of the LED
> should be derived from this trigger source.

Agreed about trigger source, but I'd rather not go for consulting LED
name with trigger source. Actually I was considering that back then,
but it turned out to be troublesome as if would have required
implementing that mechanism for associations with all subsystems.

And also you would need an intermediary layer to allow asynchronous
matching of LEDs with their trigger sources (something like
drivers/media/v4l2-core/v4l2-async.c). This would be an overkill.

> 
> Sure, if for example an ethernet PHY registers its LEDs, it can
> hardcode init_data.devicename to "ethernet-phyN" or something like
> that. But for LEDs on a generic LED controller...
> 
> I think we should get opinions from other people in this.
> 
>> OTOH, a LED with devicename describing its physical location will
>> not change this location, even after changing the trigger
>> (or trigger source), thus it proves correct to have fixed devicename
>> section for the LED, but only if it is a part of some other pluggable
>> device.
>>
>> [0]
>> https://lore.kernel.org/linux-leds/20190609190803.14815-27-jacek.anaszewski@gmail.com/
>>
> 
> Marek
> 

-- 
Best regards,
Jacek Anaszewski
