Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 772761A705
	for <lists+linux-leds@lfdr.de>; Sat, 11 May 2019 08:56:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726849AbfEKG4w (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 11 May 2019 02:56:52 -0400
Received: from hamsrv800.servertools24.de ([213.238.32.28]:56455 "EHLO
        hamsrv800.servertools24.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726502AbfEKG4w (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Sat, 11 May 2019 02:56:52 -0400
Received: from christian-pc.localdomain (p54A59A9B.dip0.t-ipconnect.de [84.165.154.155])
        by hamsrv800.servertools24.de (Postfix) with ESMTPSA id 9573F2382F56;
        Sat, 11 May 2019 08:56:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-mauderer.de;
        s=default; t=1557557809;
        bh=LXo5UyeGN5Z5r+VKJ/g7HhUyQ09/a3Dzwm/SPTHXc3A=; l=4295;
        h=Subject:To:From;
        b=E0nugSGhBfRWlk3mUShtctpKn23bvXnhsouqpgqQxvPBozuda2r73945CC+L/sMd8
         9HAkf+UMFAo5uNtF4Gc8iqOawNDvpmfGML5jh8ntN09+M11cj6qFpU+24Enc3Itg/G
         Hfrimo7Sx+vua8EnZ/1Lg1GQp0w4gus9W6vgsXXY=
Authentication-Results: hamsrv800.servertools24.de;
        spf=pass (sender IP is 84.165.154.155) smtp.mailfrom=oss@c-mauderer.de smtp.helo=christian-pc.localdomain
Received-SPF: pass (hamsrv800.servertools24.de: connection is authenticated)
Subject: Re: [PATCH v3 1/2] dt-bindings: leds: Add binding for spi-byte LED.
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        devicetree@vger.kernel.org, Dan Murphy <dmurphy@ti.com>,
        Mark Rutland <mark.rutland@arm.com>
References: <20190505200022.32209-1-oss@c-mauderer.de>
 <CAL_JsqKmKzSw2-mfmBbhpyY=Ku6H7cE2KZrgkcPD7kAS_GqbFw@mail.gmail.com>
 <20190506162848.GA9522@amd>
 <CAL_JsqJerwvjghnuiwndE9Kp_qX5ef-aSa5JcdUAoE6R6YYuYA@mail.gmail.com>
 <54199d69-67a9-eb9d-e46d-b3ea43e2e7a3@c-mauderer.de>
 <20190506202511.GA4979@amd>
 <faba9d62-c650-5be8-a9c2-645be10dab6d@c-mauderer.de>
 <c10de8fe-5955-da5f-d197-cda9a0d5452f@c-mauderer.de>
 <ccddfde6-e60c-605c-beb4-9b89e8b81be9@gmail.com>
From:   Christian Mauderer <oss@c-mauderer.de>
Message-ID: <82b27718-3a58-6692-02e4-41b45c16b81e@c-mauderer.de>
Date:   Sat, 11 May 2019 08:56:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <ccddfde6-e60c-605c-beb4-9b89e8b81be9@gmail.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: <155755780891.63617.8443829080711161377@hamsrv800.servertools24.de>
X-PPP-Vhost: c-mauderer.de
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hello Jacek,

On 10/05/2019 22:42, Jacek Anaszewski wrote:
> Hi Christian,
> 
> On 5/10/19 9:50 PM, Christian Mauderer wrote:
>> On 07/05/2019 11:52, Christian Mauderer wrote:
>>> On 06/05/2019 22:25, Pavel Machek wrote:
>>>> Hi!
>>>>
>>>>>>> Ok, I'm afraid I caused this. What should the compatible be, then?
>>>>>>
>>>>>> Knowing nothing about the h/w other than the above description:
>>>>>> ubiquiti,aircube-leds
>>>>>>
>>>>>> Not sure if that's a registered or correct vendor prefix though.
>>>>>>
>>>>>> Rob
>>>>>>
>>>>>
>>>>> Where would such a vendor prefix be registered? Does that mean that
>>>>> only
>>>>> the vendor is allowed to use it? In that case: How would a reverse
>>>>> engineered prefix look like?
>>>>
>>>> You can use it, too. It is in
>>>> Documentation/devicetree/bindings/vendor-prefixes.txt :
>>>>
>>>> ubnt    Ubiquiti Networks
>>>>
>>>> So you can probably use ubnt, prefix.
>>>>
>>>>> (still with some missing parts like U-Boot) about two weeks later.
>>>>> I had
>>>>> a look at it and they are not using a device tree. So there is no
>>>>> "official" string that I could deduce from that archive.
>>>>
>>>> Mainline is the master. You are more "official" than them ;-).
>>>>                                     Pavel
>>>>
>>>
>>> Hello
>>>
>>> let me summarize the direction before I create a v4:
>>>
>>> Rob Herring suggested "ubnt,acb-spi-led" for the binding name in his
>>> Mail from 06.05.2019 17:59 UTC. If no one objects, I'll use that.
>>>
>>> With the more specific name I'll remove the off-value and max-value from
>>> the device tree. Instead I'll create some look up table in the driver.
>>> based on the name or go back to the defines like in the v1 patch. What
>>> kind of solution would be preferable depends on the next question:
>>>
>>> How should I name the driver? Should I use a device specific name like
>>> in v1 again (most likely now acb-spi-led)? That would allow to
>>> potentially add a hardware supported blinking in that driver. The
>>> alternative would be the more generic name that it has now
>>> (leds-spi-byte) without any plans to add the blinking but it could be
>>> potentially used for example for a digital potentiometer based
>>> brightness setting.
>>>
>>> Note that I didn't really had planned to implement the blinking support
>>> because I don't have a use case for it. So it would be either a feature
>>> that I would add because someone insists. Or it could be added in the
>>> future by a user who wants that feature (maybe Ubiquiti when they
>>> upgrade their kernel?).
>>>
>>> If it is a required feature for that driver: Please note that although
>>> of course I would do some basic tests during development it would be a
>>> mostly unused and therefore untested feature.
>>>
>>> Best regards
>>>
>>> Christian
>>>
>>
>> Hello,
>>
>> sorry for repeating my question. I assume I wrote to much text hiding
>> it: How should I name the driver?
>>
>> The name for the binding is clear (ubnt,acb-spi-led). Only the driver is
>> left (keep leds-spi-byte or rename to leds-ubnt-acb-spi or something
>> else).
> 
> Why leds-spi-byte name would prevent addition of blink support? It can
> be always added basing on OF compatible. If it is to be generic SPI
> byte driver, then I'd use leds-spi-byte. Actually also the things
> like allowed brightness levels could be determined basing on that,
> and not in device tree, but in the driver.
> 
> Please compare how e.g. drivers/leds/leds-is31fl32xx.c accomplishes
> that.
> 

I would have expected that adding a lot of device specific code (in that
case blinking) to a multi-purpose driver would be bad style. But I'll go
for the generic name if that is the accepted way. I already mentioned
multiple times that my target is currently only the brightness. So the
device specific code maybe is added quite a bit in the future anyway in
which case it would still be possible to rename a part (if it isn't used
otherwise) or at least split it into it's own c-file.

I'll prepare a v4 in the near future and send it to the list. I only
learned that it would be a good idea to wait for at least a day for some
other opinions before doing that ;-)

Best regards

Christian

