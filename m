Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9787F45AEEF
	for <lists+linux-leds@lfdr.de>; Tue, 23 Nov 2021 23:20:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232974AbhKWWXI (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 23 Nov 2021 17:23:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229992AbhKWWXG (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 23 Nov 2021 17:23:06 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5363DC061574;
        Tue, 23 Nov 2021 14:19:57 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id y26so1681895lfa.11;
        Tue, 23 Nov 2021 14:19:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:to:cc:references
         :from:in-reply-to:content-transfer-encoding;
        bh=0dNze5BuC1E1VNp8jJzao1B85iEO1b+8dS4X+NzFIi0=;
        b=H0B75Z/eflYh1I5sL+6y+DFuJtxi/nLyh7cqhQjnOLvgIXXaCjmScqetS5a69H7BQN
         QIIQt278tX6rUQ9cISm+OuWFiqUeJNLEazBxFgsMmvBMfK8ATyK9n6fdESTVX9QLN0E8
         /CMBeK3f4GNe0VZLtVzLfrvTe3KctHFsEIUsFvuKDKyWCmOqhV/QMdYXnGQXEQA3B3Ak
         sZ4QSFARDjtUIWJFwJdhxCuep2b8vxeoqj8qC6CglsOsGWJIRRaLHjXHB1tLVM0Uhz7u
         XT8X/1ZwNeb256LAvDD7smQGXJBVF+Ra+vL9rDu2J3dTi+HhsTTk9Tx4wbZvLpCj/raK
         wIKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :to:cc:references:from:in-reply-to:content-transfer-encoding;
        bh=0dNze5BuC1E1VNp8jJzao1B85iEO1b+8dS4X+NzFIi0=;
        b=Zg84v355ZvE9Obv/9039Yd2qVJgNHBKOK5juuAnLbkGJuyTNd8m7yxZqdjE522DAup
         doIA0OQ29FKdOeIx5PWx/H9M3UGQ+M/QYCQ5o42NjMcWGQvTtbyKCqzJMZFb0/eDvixO
         Z91f2MeJLTloVnLHJcPc86F2siz65nu9/DGkJdk62+k0ZBOBK0RigALmYiK43diJy/8t
         AEm7bNp8lvdX6H17ejrO00iRQbQP0OIVOheHCtjCc/etdHDj9fcBPIXHZDtKcPFW4eC1
         NmNZGFiQIHNIXSvDFIgVC5PnRaRk0VmUYWWxss1ieRDaQ3SRuzCn8q9geznFZq9NJnjT
         YyLA==
X-Gm-Message-State: AOAM5303d5f81YOwjb2tNpSxTyiLVeAT8EAqu+KivqmqX4hW1ZHfB0Nn
        kfOtzbJOd7Fr7uo5dDadTcQ=
X-Google-Smtp-Source: ABdhPJydB2pVBVLZ4UviWeSt2y47haLdzS15XEYOImL+dDBbWY2vtAQSN82TzBEKYk7lLcyqrYymQA==
X-Received: by 2002:a05:6512:ad5:: with SMTP id n21mr8691655lfu.460.1637705995591;
        Tue, 23 Nov 2021 14:19:55 -0800 (PST)
Received: from [192.168.26.149] (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.googlemail.com with ESMTPSA id j19sm230962lji.94.2021.11.23.14.19.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Nov 2021 14:19:55 -0800 (PST)
Message-ID: <ec2b87c0-b417-25b9-6b87-e108d3fc5449@gmail.com>
Date:   Tue, 23 Nov 2021 23:19:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:95.0) Gecko/20100101
 Thunderbird/95.0
Subject: Re: [PATCH 1/2] dt-bindings: leds: add Broadcom's BCM63xxx controller
To:     Florian Fainelli <f.fainelli@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>
Cc:     linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        bcm-kernel-feedback-list@broadcom.com,
        =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
References: <20211115091107.11737-1-zajec5@gmail.com>
 <495a94ce-984e-f5c5-f5a2-74dc1b61e345@gmail.com>
 <5113880f-d37d-0835-c140-c3749048c519@gmail.com>
 <0795ecb9-f638-bb95-1e97-4c10800eb37c@gmail.com>
From:   =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
In-Reply-To: <0795ecb9-f638-bb95-1e97-4c10800eb37c@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 23.11.2021 23:17, Florian Fainelli wrote:
> On 11/22/21 2:00 PM, Rafał Miłecki wrote:
>> On 22.11.2021 22:51, Florian Fainelli wrote:
>>> On 11/15/21 1:11 AM, Rafał Miłecki wrote:
>>>> From: Rafał Miłecki <rafal@milecki.pl>
>>>>
>>>> Broadcom used 2 LEDs hardware blocks for their BCM63xx SoCs:
>>>> 1. Older one (BCM6318, BCM6328, BCM6362, BCM63268, BCM6838)
>>>> 2. Newer one (BCM6848, BCM6858, BCM63138, BCM63148, BCM63381, BCM68360)
>>>
>>> Just so the existing pattern/regexps continue to work, I would be naming
>>> this "bcm63xx" to be consistent with the rest of existing code-base.
>>
>> The problem I saw with "bcm63xx" is that it seems to match all SoCs:
>> those with old block and those with new block. So I guess both groups
>> have the same right to use that "bcm63xx" based binding.
>>
>> To avoid favouring old or new block I decided to avoid "bcm63xx".
>>
>> Given above explanation: do you still prefer using "bcm63xx" based
>> binding for the new block? I'm OK with that, I just want to make sure
>> you're aware of that minor issue. Please let me know :)
> 
> Maybe we use leds-bcm63138.c then since this is the first chip in the
> list that featured that block, similar to how leds-bcm6328.c was
> created? Then my second choice would be leds-bcm63xx.c just so the
> existing patterns match, really and because it's easy to visually not be
> able to tell the difference between two x versus three x.

Sounds good to me, thanks for your review!
