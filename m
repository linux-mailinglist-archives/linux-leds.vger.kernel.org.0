Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2C6B413F3D
	for <lists+linux-leds@lfdr.de>; Sun,  5 May 2019 13:51:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727547AbfEELvs (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 5 May 2019 07:51:48 -0400
Received: from hamsrv800.servertools24.de ([213.238.32.28]:57265 "EHLO
        hamsrv800.servertools24.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725811AbfEELvs (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 5 May 2019 07:51:48 -0400
Received: from christian-pc.localdomain (p54A59A9B.dip0.t-ipconnect.de [84.165.154.155])
        by hamsrv800.servertools24.de (Postfix) with ESMTPSA id 747B52380C75;
        Sun,  5 May 2019 13:51:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-mauderer.de;
        s=default; t=1557057104;
        bh=I8XJ4O7tVcw20Pb9KPahvAy2A5I/M9BOYtPazYT6rWE=; l=2440;
        h=Subject:To:From;
        b=P61wsPPcOa6UumeM2sudQTuWGhIwE6auZPO1UJffAMFlW3KK76Zz7tX0yko8+POSE
         gkk7f/ZkevKTSWAdow2HjKj541erZWXXdJWys0uflo3jMsIrbrlDRAZLhchUZNzWoo
         MG6v0+0KQ5/H2dHCD6XlAY6lpiIlYd8NPBCoHYBw=
Authentication-Results: hamsrv800.servertools24.de;
        spf=pass (sender IP is 84.165.154.155) smtp.mailfrom=oss@c-mauderer.de smtp.helo=christian-pc.localdomain
Received-SPF: pass (hamsrv800.servertools24.de: connection is authenticated)
Subject: Re: [PATCH 1/2] dt-bindings: leds: Add binding for ubnt-spi LED.
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>
Cc:     Christian Mauderer <list@c-mauderer.de>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        Dan Murphy <dmurphy@ti.com>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
References: <20190504122825.11883-1-list@c-mauderer.de>
 <4889e87a-5c7a-da74-bff6-c20fd07ea0f4@gmail.com>
 <0175bf00-f2eb-98c7-ce0b-d9a2858872e7@c-mauderer.de>
 <5cc8907f-5cb4-e8b4-7309-cc446ef5bde7@gmail.com> <20190504203448.GA24856@amd>
 <20190504221719.GA7237@amd> <0001f61b-b245-0c70-ee39-a6ec95889938@gmail.com>
From:   Christian Mauderer <oss@c-mauderer.de>
Message-ID: <e58c6bbb-9003-be45-19dc-0b1851770f54@c-mauderer.de>
Date:   Sun, 5 May 2019 13:51:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <0001f61b-b245-0c70-ee39-a6ec95889938@gmail.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: <155705710384.77952.4319196299555801785@hamsrv800.servertools24.de>
X-PPP-Vhost: c-mauderer.de
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 05/05/2019 12:56, Jacek Anaszewski wrote:
> Hi,
> 
> On 5/5/19 12:17 AM, Pavel Machek wrote:
>> Hi!
>>
>>>>> I wasn't aware of that list. Maybe "power" or even better "status"
>>>>> would
>>>>> match the function.
>>>>
>>>> Hmm, I've just found out that there are two "wlan-ap" occurrences in
>>>> the existing mainline bindings, so I propose to follow that.
>>
>> Let me see... dove-d3plug.dts has "status", "wlan-ap", "wlan-act".
>>
>>>>> Should I add the color too? So "white:status"?
>>>>
>>>> Yes, why not if it is known. So, having the above I propose:
>>>>
>>>>         label = "white:wlan-ap";
>>>
>>> Linux now runs on many different devices, and I believe userland wants
>>> to know "this is main notification LED for this device" (and the only
>>> one in this case).
> 
> This LED is on the access point, so it should have this affiliation
> somehow represented in the name.
> 
>> ...and I guess if you have single LED it will be used for more than
>> "is AP active". IOW it will likely to be more similar to "status" than
>> "wlan-ap".
> 
> IMO if a LED is on some specific device, then it should be reflected
> in the "function" section of the LED name. It facilitates locating in
> physically. If usersapce wants to change its purpose it is free to do
> so. e.g. via triggers. But it will not affect the LED name.
> 

This looks like a strongly opinion based discussion. Currently it's only
relevant for the name in the examble in the dt-binding document. Isn't
it completely irrelevant what I use there? The controller could be used
on any device, couldn't it?

Regarding your argument toward naming (maybe relevant when I add it to
the device tree files in OpenWRT): Would that mean that if a
hypothetical server has one LED to show some arbitrary system states it
should be named "green:server" instead of "green:status" because it is
on a specific device (server in that case)?

I would expect a LED called "wlan-ap" to show the status of the WLAN.
Like many small WLAN access points, the airCube has multiple ports. So
it could be used as a generic router with WLAN switched off too. In that
case "wlan-ap" wouldn't really fit the function of the LED.

Like I said: Ubiquiti uses the LED in the original software to show some
system events like "I'm finished booting" (steady brightness) or "I'm
currently upgrading" (blinking pattern).

Best regards

Christian
