Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 223743D736
	for <lists+linux-leds@lfdr.de>; Tue, 11 Jun 2019 21:52:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404868AbfFKTwq (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 11 Jun 2019 15:52:46 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:36015 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404282AbfFKTwq (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 11 Jun 2019 15:52:46 -0400
Received: by mail-wr1-f66.google.com with SMTP id n4so14394309wrs.3
        for <linux-leds@vger.kernel.org>; Tue, 11 Jun 2019 12:52:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=OfcJ1yXpOPKrLZEE60DtQTUi640XMcFyoXk9PuH4Nw4=;
        b=jK9Q6vrVFPvAt9ZdrXboA/XE/hDgprLvELfWI6VvoG+ZgY6VIAY+e/f8flexoiKfHx
         de9F4v3xZkiSQTqfPuXmuBlB7wuic0d/K2KtoKvVxaj+KwCzD51bvkC0bAMv+d2sY44k
         q7D0dp63LdcV9x6j77wxrRAN3wSEEf02uor1rqP3ggrNGIplltjNs/b7ebvSLfsQN1x3
         dlIDjnEYPTBaIVibG+JpDBCcIXQfR6qWuWEjqeSPGOiMZVnvnWRf+xmPfp2qI1ioHwc5
         3hH1HvY1U+utVEdqi+x63vKXLdPNn27VJFxKoNVUkCWxSlDiXZdtlfMuCzRo+ijLX3+c
         Br2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=OfcJ1yXpOPKrLZEE60DtQTUi640XMcFyoXk9PuH4Nw4=;
        b=afS7Nnj2qKyXzOfa3vIWHVrYDOfq6a707bmSqq+aFP6kNwfWnbF0TKjAveRX2EpqcN
         Q5BDvrJj8dW/BjYKoIeEIKgHAlZH6WbrcOM36LJ/Qyq7TMKX/EV4+lkefTxg4kHd0Xjz
         xcf3II4TjvheohH+DQ/TQa2DBXSe3FQNHPUpkkFDsjp1ZaHyTiTu4OfxEgCnhadFGbDp
         F2VJRqOax8lyvMP7X+8qK5AZL0c+pIIXocQN5vK3A+KgQSwlxe1wxAmzuJ21KtodQe5k
         j0INzahg+zlKXeZM4gn/8rLSQ4o+eMjef+87Kc1SZgdHSa6fN5rd/+rZLRvXm5Shndua
         /oBA==
X-Gm-Message-State: APjAAAW1MJoR43wwKKLxLkDRKBpE9IugrSE1WDVWOseE2ehjnswzYFqx
        aso2WmmwuTs6khndskqXYBpP1HWG
X-Google-Smtp-Source: APXvYqwL4WaVkDiBeL6hdelBgirA8e0Km1TzWIcz5VuRbb8QKIR9EnKx2PSFar1jHpuLTrqKBXz6bg==
X-Received: by 2002:adf:f246:: with SMTP id b6mr2712966wrp.92.1560282764539;
        Tue, 11 Jun 2019 12:52:44 -0700 (PDT)
Received: from [192.168.1.17] (bgt97.neoplus.adsl.tpnet.pl. [83.28.83.97])
        by smtp.gmail.com with ESMTPSA id r3sm19460731wrr.61.2019.06.11.12.52.41
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 11 Jun 2019 12:52:43 -0700 (PDT)
Subject: Re: [PATCH v2 1/2] dt-bindings: Add docs for EL15203000
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Oleh Kravchenko <oleg@kaa.org.ua>, Dan Murphy <dmurphy@ti.com>,
        linux-leds@vger.kernel.org
References: <27c0b356-8111-6b36-23cc-8e654147178f@kaa.org.ua>
 <b6a5cc5e-74f1-d328-7a47-995670ba7aa7@ti.com>
 <adf5a755-c534-64c3-6e99-ba39ffea95e2@kaa.org.ua>
 <2eba86cb-01be-c002-32d0-80ab2ab14f97@gmail.com>
 <7e787498-537b-390d-589a-577f34ffbc3f@kaa.org.ua>
 <94968b55-a9cc-277e-ac25-bf765f9db138@kaa.org.ua>
 <e1fc84a1-75e4-6c56-d2ea-f6ade28087ac@kaa.org.ua>
 <e4e0223d-c463-e767-12b2-7e360eac000b@gmail.com>
 <38050529-5730-6e88-fe1a-909492711dd0@kaa.org.ua>
 <8f658d57-5079-ad76-ce3e-af3d031b4685@gmail.com> <20190611120156.GA1161@amd>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <9e812391-56e9-2dd5-1f08-435df717b12b@gmail.com>
Date:   Tue, 11 Jun 2019 21:52:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190611120156.GA1161@amd>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 6/11/19 2:01 PM, Pavel Machek wrote:
> Hi!
> 
>>> I just want to clerify - for now LEDs board has 2 from 3 LEDs with effect function.
>>>
>>> 1. Screen frame led is just blinking, so blink_set() is fit well to this.
>>> 2. Pipe led actually consist from 3 leds and when effect is enabled next pattern is used:
>>>
>>>        ^
>>>        |
>>> LED1  >   OFF  ON   ON   ON
>>>        |
>>> LED2  >   OFF  OFF  ON   ON
>>>        |
>>> LED3  >   OFF  OFF  OFF  ON
>>>        |
>>>        +----^----^----^----^----> time
>>
>> Pattern trigger applies to a single LED so it won't fit for this
>> pattern.
>>
>> Currently we don't support patterns spanning on multiple LEDs,
>> so you would have to come up with your own solution.
>>
>> What I can recommend is a trigger that would be created by your driver
>> and would activate this sequence.
> 
> Yes, please.
> 
> While adding custom files to sysfs may appear easier, we'll need
> "led-specific-triggers" for other reasons.

For what reasons exactly?

This is similar to the generic hw trigger support proposed by
Marek Behun. In the reply to that patch I asked some questions [0].
So far the mechanism looks too me awkward and not introducing any
novelty besides requiring one more step - setting the trigger.

> And for the record... Handling 3 LEDs as one is not something usual in
> the LED subsystem; I guess it makes sense in your specific case, but
> hopefully noone will copy that design.
> 
> (I guess they are not individually controllable?)
> 
> 									Pavel
> 

[0] https://www.spinics.net/lists/linux-leds/msg12269.html

-- 
Best regards,
Jacek Anaszewski
