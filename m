Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA414356D9F
	for <lists+linux-leds@lfdr.de>; Wed,  7 Apr 2021 15:43:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236699AbhDGNnJ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 7 Apr 2021 09:43:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51908 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S238848AbhDGNnJ (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 7 Apr 2021 09:43:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1617802979;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=4JykgxwBpXHxPgpf4Ep9lgCb1Iwtb1yo1Z+KVdCJiIU=;
        b=dPQVwBVITpOj0lhGbFD2yecaZ4gX42g4kiVmgVT7gkRVZyTPjLBX+kUw4J4KuAW7EFecgB
        c0aH28D04xnQgnzwYxlLaCrn73VTDwqGiEMQxE6mFGEQLM5rmPvifo6IlHK6kHt6pm7bcy
        Vr9Djw9bb/+EkK2evAIw/jOkPiUl+xo=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-463-jj0BPIejNhaufsiH0MsiPg-1; Wed, 07 Apr 2021 09:42:57 -0400
X-MC-Unique: jj0BPIejNhaufsiH0MsiPg-1
Received: by mail-ej1-f71.google.com with SMTP id jt26so1116625ejc.18
        for <linux-leds@vger.kernel.org>; Wed, 07 Apr 2021 06:42:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=4JykgxwBpXHxPgpf4Ep9lgCb1Iwtb1yo1Z+KVdCJiIU=;
        b=BHLyE5E7JXOY7vx+ylUVbFCGtXcrUarcHrVJCJ96xQiVaBgGH8qeTk51mmRKtBe5ol
         C2Rg3k1coKLIcAWzT/kmOtj9i9+CS0WyC+GkRq8P2fmKzDNrxN/owMWkPKR+7YIBzE1H
         MMj693E3C6lTgNVKlkGNIhNyIwiFeFOFBaGNjh1rTxyRKld8+KnBPetvaHbs3dQnGR0E
         30j3l+OGolQmfxLfIE9UZmxmMW/B8oM3dXggkGd9iMyz8aRJuzQ/jo8aBgHmsa/Ie2Ae
         5iO9AxRTU5yoS43yZ621YdLnyovOQIxjTgXjNLgHnxVrUkLpes3gjO7Um7kFMLIHoak+
         TIXg==
X-Gm-Message-State: AOAM532b53XhQz3CB1g0FBPLqMWBdkBRazYPef4gHu0IVyxKtsLGTdZ6
        XVg/byUtCQynE7Tcu/Dm0xupXvEjz8z7mpUA9F4rbge6whKwUwoKtgWE8w8NRi8L4Z8DywcmBFd
        OaooNdZEwMLXslF7sofjOe9cyCKr0VuAWjRkvwG+GgaRDwCpCY4IJYVOE1E1FRnEH2rdvzRCQIQ
        ==
X-Received: by 2002:aa7:c1cc:: with SMTP id d12mr4642398edp.136.1617802973010;
        Wed, 07 Apr 2021 06:42:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwLWHOUjBVnbfbOvCrxRWY652+XA/iPZSKM+JJm7fNQ1uS8HH/a8rXcym4TKklzJMxhpnH+OQ==
X-Received: by 2002:aa7:c1cc:: with SMTP id d12mr4642380edp.136.1617802972863;
        Wed, 07 Apr 2021 06:42:52 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id a9sm2426599eda.13.2021.04.07.06.42.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Apr 2021 06:42:52 -0700 (PDT)
Subject: Re: [PATCH v2 resend 0/9] HID: lenovo: LED fixes and Thinkpad X1
 Tablet kbd support
To:     Jiri Kosina <jikos@kernel.org>
Cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Alexander Kobel <a-kobel@a-kobel.de>,
        Pavel Machek <pavel@ucw.cz>,
        =?UTF-8?Q?Marek_Beh=c3=ban?= <kabel@kernel.org>,
        linux-input@vger.kernel.org, linux-leds@vger.kernel.org
References: <20210404080432.4322-1-hdegoede@redhat.com>
 <nycvar.YFH.7.76.2104071250530.18270@cbobk.fhfr.pm>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <33820898-6610-df44-2cc8-6d06d489a7ea@redhat.com>
Date:   Wed, 7 Apr 2021 15:42:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <nycvar.YFH.7.76.2104071250530.18270@cbobk.fhfr.pm>
Content-Type: text/plain; charset=iso-8859-15
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi,

On 4/7/21 2:56 PM, Jiri Kosina wrote:
> On Sun, 4 Apr 2021, Hans de Goede wrote:
> 
>> Hi Jiri,
>>
>> This seems to have fallen through the cracks, again (IIRC this is the
>> second resend) can you please pick this series up?
>>
>> Patches 1 - 7 have:
>> Reviewed-by: Marek Behún <kabel@kernel.org>
>>
>> Patches 1, 4, 5, 7 have:
>> Acked-by: Pavel Machek <pavel@ucw.cz>
>>
>> With the ack from Pavel (the LED subsys maintainer) indicating that
>> there are no problems with the LED classdev API usage in these patches.
>>
>> Patches 8 - 9 are new in v2 of this series, these add support for the
>> Thinkpad X1 Tablet Thin keyboard. They have been tested by me on a
>> Thinkpad 10 ultra keyboard dock (so that that does not regress) and
>> by Alexander Kobel on a Thinkpad X1 Tablet Thin keyboard.
> 
> Now in for-5.13/lenovo,

Great, thank you.

> sorry for the delay

No problem.

Regards,

Hans

