Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F2B40760CF6
	for <lists+linux-leds@lfdr.de>; Tue, 25 Jul 2023 10:28:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229577AbjGYI2U (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 25 Jul 2023 04:28:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232853AbjGYI12 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 25 Jul 2023 04:27:28 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D132171E
        for <linux-leds@vger.kernel.org>; Tue, 25 Jul 2023 01:26:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1690273598;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ZT+2RRxN0kUwNANOIMYbqwe5aGSUH6lSFK4O6wUpQ+g=;
        b=CST7/gouoPLQu4nzhg0/a8ryACdGCx4HYQCE4xuvDuC056jaEJLGW1XTb6ZcGAIIYIP1aq
        Jz9h+hkco5BLUIGUSbsgRcWxeWEj/1kZCsr/DRizVjvPAgISSeQb4kEMRHWP51+nAI1CIu
        NXy1/yUaUqnAvdRHs+se69uFNBgJcA8=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-141--c1rS9AgMeW26JZ2VtbmkA-1; Tue, 25 Jul 2023 04:26:37 -0400
X-MC-Unique: -c1rS9AgMeW26JZ2VtbmkA-1
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-50a16ab50e6so3505296a12.0
        for <linux-leds@vger.kernel.org>; Tue, 25 Jul 2023 01:26:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690273595; x=1690878395;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZT+2RRxN0kUwNANOIMYbqwe5aGSUH6lSFK4O6wUpQ+g=;
        b=K+3W4GAMpRsLZ/6VWi0pw/zcP9LX39mk3yR+0ugeCFtgv4RN2eJQCjZn+MmcTomtIW
         TKt5Po1koU8ckcRXeiUQ1JKd6TvYp+p5YADYY5Z+aeKhILp0pbOAsxbpD38RIs4B6le1
         KIU+gA+cL9T1KgcfCde9g7X1KdKF0SCf/b584JAP94zfKhT8GmcUsx4xIWB9YEnrBmMA
         Hi3VjMRQGbt0thz9Fa1a4B783csgpUuV4xRh6/M1LvvEFNIuAOfYfk9Yu9THFSaIumG7
         DizCs4iRqmDg2rUfLZG2f1OJnjG9vGGhSdiwT5TzwkK4WviSXzZwLq24vT9UPDBSZUI/
         eoeA==
X-Gm-Message-State: ABy/qLY1zgltupWzzTd0LKeiyxDfgUlTLwBz3SGPMJehUtLcd8d7SdW/
        kA0jiIrei0eZOBh+FuzzIFtLIyPxamUG9ZOmeXSj1Mg/orawe36o2m6H0kJntCyqfhv5nuZiewx
        foCPIe+aDTPssMvFBppLuGkZRqAuekg==
X-Received: by 2002:aa7:d043:0:b0:522:1d9e:221 with SMTP id n3-20020aa7d043000000b005221d9e0221mr8599928edo.38.1690273595602;
        Tue, 25 Jul 2023 01:26:35 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEr7Vv8+sNfLW0+8rJtUgiPqoA2KPi18DQ5uEIiAk40ADGuysymaE41hmodPrWNGTsCHt06Dg==
X-Received: by 2002:aa7:d043:0:b0:522:1d9e:221 with SMTP id n3-20020aa7d043000000b005221d9e0221mr8599914edo.38.1690273595297;
        Tue, 25 Jul 2023 01:26:35 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id z25-20020aa7d419000000b0051debcb1fa2sm7236023edq.69.2023.07.25.01.26.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Jul 2023 01:26:34 -0700 (PDT)
Message-ID: <a22b8d63-ad45-de86-c8b6-3fc53eb3c576@redhat.com>
Date:   Tue, 25 Jul 2023 10:26:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [GIT PULL] Immutable branch between pdx86 and LED due for the
 v6.6 merge window
To:     Henning Schild <henning.schild@siemens.com>
Cc:     Lee Jones <lee@kernel.org>, Pavel Machek <pavel@ucw.cz>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        Guenter Roeck <linux@roeck-us.net>,
        "xingtong.wu" <xingtong.wu@siemens.com>
References: <f16a15a8-aa32-214d-7896-af598e9d5000@redhat.com>
 <20230719145058.5f09c0c2@md1za8fc.ad001.siemens.net>
Content-Language: en-US, nl
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230719145058.5f09c0c2@md1za8fc.ad001.siemens.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Henning,

On 7/19/23 14:50, Henning Schild wrote:
> Hi Hans,
> 
> i actually do have a bug-fix commit on top of that, with a
> 
> Fixes: 917f54340794 ("platform/x86: simatic-ipc: add CMOS battery
> monitoring")
> 
> one IPC model had a small issue left with reading out the battery state.
> 
> How should i proceed with that? Send that fix on top or make a v2 of
> the CMOS battery patch after all? And if i send on top, can i assume
> that the current sha will also be "immutable" when Linus takes it?
> That last question goes into the direction of using "Fixes:", which
> might not be needed/wanted anyhow because no backporting would ever be
> needed if the fix gets in together with the patch bringing the bug.

Since I've already send a pull-req (created an immutable branch
for other maintainers to merge) please send a follow-up patch with
just the fix.

The whole concept of an immutable branch is that it will not
change, so we cannot change the branch to squash in the fix.

Regards,

Habs



> 
> Am Fri, 14 Jul 2023 15:21:12 +0200
> schrieb Hans de Goede <hdegoede@redhat.com>:
> 
>> Hi Lee, Guenter,
>>
>> Here is a pull-request for some pending pdx86 simatic-ipc changes
>> which are a pre-requisite for merging the follow LED patch:
>>
>> https://lore.kernel.org/linux-leds/20230713115639.16419-3-henning.schild@siemens.com/
>>
>> (Guenter this also includes the watchdog change you acked for merging
>> through the pdx86 tree in case you want to merge this into the wd
>> tree)
>>
>> Regards,
>>
>> Hans
>>
>>
>> The following changes since commit
>> 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5:
>>
>>   Linux 6.5-rc1 (2023-07-09 13:53:13 -0700)
>>
>> are available in the Git repository at:
>>
>>   git://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git
>> tags/ib-pdx86-simatic-v6.6
>>
>> for you to fetch changes up to
>> 8766addf665e9f0ace15cca894ba225e5a4d580a:
>>
>>   platform/x86: simatic-ipc: use extra module loading for watchdog
>> (2023-07-14 15:06:40 +0200)
>>
>> ----------------------------------------------------------------
>> Immutable branch between pdx86 simatic branch and LED due for the
>> v6.6 merge window
>>
>> v6.5-rc1 + recent pdx86 simatic-ipc patches for
>> merging into the LED subsystem for v6.6.
>>
>> ----------------------------------------------------------------
>> Henning Schild (7):
>>       platform/x86: simatic-ipc: add another model BX-21A
>>       watchdog: simatic-ipc-wdt: make IO region access of one model
>> muxed platform/x86: simatic-ipc: add CMOS battery monitoring
>>       platform/x86: simatic-ipc: drop PCI runtime depends and header
>>       platform/x86: simatic-ipc: add another model
>>       platform/x86: simatic-ipc: add auto-loading of hwmon modules
>>       platform/x86: simatic-ipc: use extra module loading for watchdog
>>
>>  drivers/platform/x86/Kconfig                       |  49 +++-
>>  drivers/platform/x86/Makefile                      |   6 +-
>>  drivers/platform/x86/simatic-ipc-batt-apollolake.c |  51 +++++
>>  .../platform/x86/simatic-ipc-batt-elkhartlake.c    |  51 +++++
>>  drivers/platform/x86/simatic-ipc-batt-f7188x.c     |  70 ++++++
>>  drivers/platform/x86/simatic-ipc-batt.c            | 252
>> +++++++++++++++++++++ drivers/platform/x86/simatic-ipc-batt.h
>>    |  20 ++ drivers/platform/x86/simatic-ipc.c                 | 119
>> ++++++++-- drivers/watchdog/simatic-ipc-wdt.c                 |   9 +-
>>  include/linux/platform_data/x86/simatic-ipc-base.h |   4 +-
>>  include/linux/platform_data/x86/simatic-ipc.h      |   4 +-
>>  11 files changed, 607 insertions(+), 28 deletions(-)
>>  create mode 100644 drivers/platform/x86/simatic-ipc-batt-apollolake.c
>>  create mode 100644
>> drivers/platform/x86/simatic-ipc-batt-elkhartlake.c create mode
>> 100644 drivers/platform/x86/simatic-ipc-batt-f7188x.c create mode
>> 100644 drivers/platform/x86/simatic-ipc-batt.c create mode 100644
>> drivers/platform/x86/simatic-ipc-batt.h
>>
> 

