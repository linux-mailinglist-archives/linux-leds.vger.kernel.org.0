Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF3F63B402A
	for <lists+linux-leds@lfdr.de>; Fri, 25 Jun 2021 11:18:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231193AbhFYJVD (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 25 Jun 2021 05:21:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46884 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231144AbhFYJVC (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Fri, 25 Jun 2021 05:21:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1624612719;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=gf/AeSAoKtyKCgPiJUJSX6Cy8giuz8iiX2hwDNCu8IY=;
        b=K52sJHjCFxVxM8pEWQZmIEarFr/+0EJVeiPt0/QzftJNBaUQpGl5MvMJXzdhIKathE4KzX
        9CMc4KcVfPxAHqcDPF822elFuEVwWiCkc1w7trImHwpwNWCHY5Vwy5cyJUpVWeC1FWxWXS
        CLeklOYf6et2i8prsROCPdMQ1RwpdyM=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-293-w7vj_1lUMB-72izI3ezR0Q-1; Fri, 25 Jun 2021 05:18:38 -0400
X-MC-Unique: w7vj_1lUMB-72izI3ezR0Q-1
Received: by mail-ej1-f72.google.com with SMTP id c13-20020a17090603cdb029049617c6be8eso2873378eja.19
        for <linux-leds@vger.kernel.org>; Fri, 25 Jun 2021 02:18:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=gf/AeSAoKtyKCgPiJUJSX6Cy8giuz8iiX2hwDNCu8IY=;
        b=IVJD5/fQSyhooYgU4/jF3pX2U3L0MjI4lmmyIgZkLMJOxZtV+0WMXJjN8b8oMLB5sy
         wgsv530N6EFK84/w+F+nb6Hwq+3qoVN90jHVHJmeuPkyqKcR1dAuxuArU+ch4Ppr0Ym3
         tjiTCX5vbUySm79tsbc1eWmfF/vOxfLF1eNmUqaFKj8ZNXayHRrupnAYYOeXNSwNBZPB
         KL5rCtmJ1asRsO5Q5etYVWY2GfT69DR+/dR+Qq0lfpHq2kBpmEajgE318fO8wHKFyGnf
         OOewQuBpW6qLvR6yN4jsb9l1XjpMkP/wiEbO4HZzbW51LRm1XHvksZDF6VyGdjMRPbie
         8c/Q==
X-Gm-Message-State: AOAM531gw4T1kY2w7fbl8uOztRz2wYzA3hiKe7W0biHqAf414kD+cVIe
        ns/MdMbsrMwlw8j+/IysC3aSOAj3YvjP4bYnVmSZr6VIn70MzR1DKltkj0dYax39FzC7uen7kBL
        bEeMRiqfOXSX123BOepFLqw==
X-Received: by 2002:a17:906:b55:: with SMTP id v21mr9857258ejg.88.1624612717365;
        Fri, 25 Jun 2021 02:18:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwh7EVIsP2CNobqkk7E06ElkvSjU/XKuwVJtF3n4RNaDTw5EmbEh6fSRptX6AttOApksLE7Eg==
X-Received: by 2002:a17:906:b55:: with SMTP id v21mr9857240ejg.88.1624612717144;
        Fri, 25 Jun 2021 02:18:37 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id gv10sm2456585ejc.46.2021.06.25.02.18.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Jun 2021 02:18:36 -0700 (PDT)
Subject: Re: LEDs with hardware-accelerated patterns, suspend indication
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Jafar Akhondali <gigelaknak@gmail.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        mauro.chehab@huawei.com,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20210526153040.GA4537@amd>
 <5fbbab4f-3e22-5a4a-eea8-2531ee165cc4@redhat.com>
 <CAMW3L+19tP_9=+8j8LLjqCGDaaVZ86UMm9NwLbbpA77zOYnr1Q@mail.gmail.com>
 <79988fe2-7b3d-7485-131c-4f654ec6d8b8@redhat.com>
 <CAMW3L+13O4jXyp1LVtuxhpXP_fkfWXi9JoNS8FYUAMHaJBGKZg@mail.gmail.com>
 <17ec2040-24e9-4090-e64b-8048f0b4005b@redhat.com> <20210623203925.GI8540@amd>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <59ac4a5b-7dc5-bb9d-e161-c0a7ceb9f399@redhat.com>
Date:   Fri, 25 Jun 2021 11:18:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210623203925.GI8540@amd>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi,

On 6/23/21 10:39 PM, Pavel Machek wrote:
> Hi!
> 
>>> Sorry for the late reply.
>>> there are two categories of keyboard lighting modes:
>>> 1. static
>>> 2. dynamic
>>>
>>> In static mode, any of 4 zones can be configured to show specific color,
>>> independently.
>>>
>>> In dynamic mode, there is no control over specific zones.
>>> It's only possible to set some: color, speed, direction
>>> and: [R]ed,[G]reen, [B]lue
>>>
>>> so in dynamic mode, the user can't control zones,
>>> the dynamic effects take care of that.
>>
>> So we have 4 zones, which are individual controllable, so which should
>> probably be modeled as individual LED class devices. But when we enable
>> the hardware effects, then the individual addressing goes away and we
>> set one effect which applies to all zones.
>>
>> Jafar, do I understand this correctly?
>>
>> Pavel, how should this be mapped to the led-class API?
> 
> Fun :-).
> 
>> Some ideas:
>>
>> a) Only add the new lpattern to the main zone?
>> 2) Add the new lpattern to all zones, but only make it
>> writable in the main zone ?
> 
> Require lpattern in all zones to be same and active before actually
> enabling the pattern?

That seems less user friendly / a cumbersome interface I prefer
one of my 2 initial ideas.

Or maybe add lpattern symlinks to the other zones to the main zone,
I think that is actually best because it clearly shows how things
work, all 4 LED (zones) support a lpattern, but it is a single
shared lpattern.

> Decide lpattern is not suitable for this and figure out what to with
> multi-LED triggers? Someone wanted them for "meters" (CPU load 25% 50%
> 75% 100% LED bar)...

I think true multi-led triggers are overkill here, in essence this
is just a standard lpattern, except that it is shared between the
zones. 

> Skip this hardware feature for now. We don't have to support
> everything?

Although it is true that we don't have to support everything not
supporting this would give Linux a feature disparity with the
Windows utility for controlling the keyboard which IMHO is
undesirable.

Regards,

Hans



