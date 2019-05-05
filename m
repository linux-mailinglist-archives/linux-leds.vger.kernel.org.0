Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0CA1413EF4
	for <lists+linux-leds@lfdr.de>; Sun,  5 May 2019 12:56:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726636AbfEEK4k (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 5 May 2019 06:56:40 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:36658 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726310AbfEEK4k (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 5 May 2019 06:56:40 -0400
Received: by mail-lf1-f66.google.com with SMTP id y10so521402lfl.3;
        Sun, 05 May 2019 03:56:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=rZem5h7+lJlRGCGAz91trtXO50zKcHCmewfgQF5jNjg=;
        b=JApbxfMiS9q/J1AQGa2+PUnd/92AKlK3q84cOsyibO+wTIbAnKJrqQgzplweATUuU3
         4a8/RhL3MJkLc58LKUGXYmgQqK1tcOON4sy1w0lEiaHD9eQiOU0Lx0D/4Bf/SFp/4Lki
         DjPoNsR4FGYjC0sw8WVhfBnVSd5J9df8QNbClMnbkNlsQO5C85Ubso8OX83rIkcrd4Ns
         fBub5kejH0si7HZyNXmFYLCbVrEr9ufopwH14igPtQItpbHQL0VXrFrPot2OFn+GYGf+
         WO8gj7pWBMK3jcsNysYJbAjuPMDy9RuwU7CJe4bt0QqJRE+qpv0jz7nz1KCn6lW2acYf
         OL6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=rZem5h7+lJlRGCGAz91trtXO50zKcHCmewfgQF5jNjg=;
        b=jYRUbvRhvjNhLIi9TunJgbuNxam/DuRlH20NffV2oBmurLeaMX4qbcnrGEKtcovIBn
         eTivm0X5DU1xX6Oom//cI+M5Vz7tWpMTw9Xiu+jt8GuXmy/s49BOSJQbK8YH7ajY8mDO
         9gvk+X0297twlQnFD1Uu7S+EnYkkcDmXQECaRR4fnBXMsKcSemVv6jD4jgsQTFumeNay
         4XNqiPUDy2pz6XIEhw07ff0Uq4Y2yT2ZWqrqEJ4LeqdKyYV4irfOLL44FJH3RqDXTGbi
         1uOogkuga5/Ye9dvQKGwZ5MxxfI5DOFitcdfR7IdpTfOCNKqNvj2lfSjmRQs7EOr5KyG
         nW9w==
X-Gm-Message-State: APjAAAVP98QVO4jBG0hAkUW6USc0oOzXdyDqf69Edb9MjGdJX+i1hVfd
        NaQi3xCZEDulC7GY87qY9XE=
X-Google-Smtp-Source: APXvYqwaFrxTYPeZD0Oy7GLHSlGWx7by20O0KnAQLsMUUw4S5+piVPoSwZyAODV0GH7EANN5n07wJA==
X-Received: by 2002:a19:97c8:: with SMTP id z191mr9792685lfd.167.1557053798347;
        Sun, 05 May 2019 03:56:38 -0700 (PDT)
Received: from [192.168.1.19] (chp150.neoplus.adsl.tpnet.pl. [83.31.13.150])
        by smtp.gmail.com with ESMTPSA id y186sm1462887lfa.14.2019.05.05.03.56.36
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 05 May 2019 03:56:37 -0700 (PDT)
Subject: Re: [PATCH 1/2] dt-bindings: leds: Add binding for ubnt-spi LED.
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Christian Mauderer <list@c-mauderer.de>, oss@c-mauderer.de,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        Dan Murphy <dmurphy@ti.com>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
References: <20190504122825.11883-1-list@c-mauderer.de>
 <4889e87a-5c7a-da74-bff6-c20fd07ea0f4@gmail.com>
 <0175bf00-f2eb-98c7-ce0b-d9a2858872e7@c-mauderer.de>
 <5cc8907f-5cb4-e8b4-7309-cc446ef5bde7@gmail.com> <20190504203448.GA24856@amd>
 <20190504221719.GA7237@amd>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <0001f61b-b245-0c70-ee39-a6ec95889938@gmail.com>
Date:   Sun, 5 May 2019 12:56:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190504221719.GA7237@amd>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi,

On 5/5/19 12:17 AM, Pavel Machek wrote:
> Hi!
> 
>>>> I wasn't aware of that list. Maybe "power" or even better "status" would
>>>> match the function.
>>>
>>> Hmm, I've just found out that there are two "wlan-ap" occurrences in
>>> the existing mainline bindings, so I propose to follow that.
> 
> Let me see... dove-d3plug.dts has "status", "wlan-ap", "wlan-act".
> 
>>>> Should I add the color too? So "white:status"?
>>>
>>> Yes, why not if it is known. So, having the above I propose:
>>>
>>> 		label = "white:wlan-ap";
>>
>> Linux now runs on many different devices, and I believe userland wants
>> to know "this is main notification LED for this device" (and the only
>> one in this case).

This LED is on the access point, so it should have this affiliation
somehow represented in the name.

> ...and I guess if you have single LED it will be used for more than
> "is AP active". IOW it will likely to be more similar to "status" than
> "wlan-ap".

IMO if a LED is on some specific device, then it should be reflected
in the "function" section of the LED name. It facilitates locating in
physically. If usersapce wants to change its purpose it is free to do
so. e.g. via triggers. But it will not affect the LED name.

-- 
Best regards,
Jacek Anaszewski
