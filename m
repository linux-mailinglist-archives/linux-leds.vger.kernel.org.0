Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 73D836E9418
	for <lists+linux-leds@lfdr.de>; Thu, 20 Apr 2023 14:18:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234825AbjDTMSp (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 20 Apr 2023 08:18:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234826AbjDTMSo (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 20 Apr 2023 08:18:44 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A2734C1A
        for <linux-leds@vger.kernel.org>; Thu, 20 Apr 2023 05:17:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1681993077;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=fYkHirar8n5qlvrbZea8UuPJ5PvWK+R8q3/9VMG0mDE=;
        b=WsXUcfDpNf5x0IyJO9v3a03CURsVEy60sQdKqG0rg+Yo/z3lDOFaqK0vKETIVdkz/9MhV/
        oOswV8jASW5y1rCrQbKTdyHxY5ImQKeKxX/MA9Q33nEI0DkVKdKlb4OJYQXKxgJ2uo+c+V
        HX/m4sg0f8vBi/IRoxUiLv+quUK5LjE=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-638-1d4t-52IPGiR_ATZ19fJrg-1; Thu, 20 Apr 2023 08:17:54 -0400
X-MC-Unique: 1d4t-52IPGiR_ATZ19fJrg-1
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-506a455ee4cso473603a12.3
        for <linux-leds@vger.kernel.org>; Thu, 20 Apr 2023 05:17:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681993073; x=1684585073;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fYkHirar8n5qlvrbZea8UuPJ5PvWK+R8q3/9VMG0mDE=;
        b=RKeBsscW0e8T3PflGbVXZfasKpxVLWBLhPPLP59NihRk8V9x6aTajAE52HmmLYxO01
         9aqi94ynB5AWsgyidlqz8CyrzqVpUI+Wzs7JCB5vQz+mUQvjwdEy/cyKZpwhp4cBou2H
         Awvy1MVacEZeNpZhK0lX1DLNM/Rq8kydxrbQDOQtP3HPSADXmYPxD0iqP7rJMN2RJIE9
         sfM7DbnYnPJJymEi8VQEIgkwNingMqH5gcvFh91cOS3t5Bd0gi208w+Pxf8BMp35GrrF
         W5r4N9DZKivtFfi1OqjJ3hbNTGY/7+5lSRyx1PxwUgRt+iCd39VCoyvyaXX/YMrIELER
         AEDw==
X-Gm-Message-State: AAQBX9ctG4My6cty479ToUDQrtNtzhp3jRjXdpwR1I1xZjbPAVxPi3Je
        7PV+k2k2zYz00sY1Tx/HWEHo99lt4REM3O7VA/0SvxB0QfFJbPVRkCeT+eqEV2lEIslZ6+LuOma
        GvuHJuhu3HdSvW4QDhqOiNA==
X-Received: by 2002:a05:6402:14c7:b0:506:9cdd:fc89 with SMTP id f7-20020a05640214c700b005069cddfc89mr1377246edx.34.1681993073389;
        Thu, 20 Apr 2023 05:17:53 -0700 (PDT)
X-Google-Smtp-Source: AKy350abpLURgXbQ2WRSRKW2E0BGbShetFlkKOEtR5uCMhTsrNEBJOwRuoL4uH+yOaGHC0Mo/pAPSA==
X-Received: by 2002:a05:6402:14c7:b0:506:9cdd:fc89 with SMTP id f7-20020a05640214c700b005069cddfc89mr1377225edx.34.1681993073015;
        Thu, 20 Apr 2023 05:17:53 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id i9-20020aa7c709000000b0050499afe96bsm692196edq.10.2023.04.20.05.17.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Apr 2023 05:17:52 -0700 (PDT)
Message-ID: <10251577-a594-eb45-4348-ee0f9eac1194@redhat.com>
Date:   Thu, 20 Apr 2023 14:17:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 1/5] leds: Add Intel Cherry Trail Whiskey Cove PMIC LED
 driver
Content-Language: en-US, nl
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Lee Jones <lee@kernel.org>, Yauhen Kharuzhy <jekhor@gmail.com>,
        linux-leds@vger.kernel.org
References: <20230413151808.20900-1-hdegoede@redhat.com>
 <20230413151808.20900-2-hdegoede@redhat.com> <ZDlKyq0tLAbFGS8P@duo.ucw.cz>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <ZDlKyq0tLAbFGS8P@duo.ucw.cz>
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

Hi,

On 4/14/23 14:44, Pavel Machek wrote:
> On Thu 2023-04-13 17:18:04, Hans de Goede wrote:
>> From: Yauhen Kharuzhy <jekhor@gmail.com>
>>
>> Add support for LEDs connected to the Intel Cherry Trail Whiskey Cove
>> PMIC. Charger and general-purpose leds are supported. Hardware blinking
>> is implemented, breathing is not.
> 
> leds->LEDs.
> 
>> diff --git a/drivers/leds/leds-cht-wcove.c b/drivers/leds/leds-cht-wcove.c
>> new file mode 100644
>> index 000000000000..06447804d050
>> --- /dev/null
>> +++ b/drivers/leds/leds-cht-wcove.c
>> @@ -0,0 +1,368 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Driver for LEDs connected to the Intel Cherry Trail Whiskey Cove PMIC
>> + *
>> + * Copyright 2019 Yauhen Kharuzhy <jekhor@gmail.com>
>> + * Copyright 2023 Hans de Goede <hansg@kernel.org>
>> + *
>> + * Based on Lenovo Yoga Book Android kernel sources
>> + */
> 
> "sources." Should copyrights from Android be copied here?

Quick follow up on this, the original file has no copyright statements,
so there is nothing to copy. Also it uses a custom sysfs API, so
this new LED driver was pretty much done from scratch. The only thing
which comes from the Android source is hw-interface info like
register addresses and what various bits in the registers mean.

For v2 I've updated this comment to:

 * Register info comes from the Lenovo Yoga Book Android kernel sources:
 * YB1_source_code/kernel/cht/drivers/misc/charger_gp_led.c.

Regards,

Hans




