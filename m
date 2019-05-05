Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DD7C813E54
	for <lists+linux-leds@lfdr.de>; Sun,  5 May 2019 10:01:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726359AbfEEIBx (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 5 May 2019 04:01:53 -0400
Received: from hamsrv800.servertools24.de ([213.238.32.28]:38123 "EHLO
        hamsrv800.servertools24.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726310AbfEEIBx (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 5 May 2019 04:01:53 -0400
Received: from christian-pc.localdomain (p54A59A9B.dip0.t-ipconnect.de [84.165.154.155])
        by hamsrv800.servertools24.de (Postfix) with ESMTPSA id B1C222381401;
        Sun,  5 May 2019 10:01:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-mauderer.de;
        s=default; t=1557043308;
        bh=14MC+MAzNHs5WfJfSVJ3AIkIi1I5wcLiSJI37g/8Qm0=; l=1346;
        h=Subject:To:From;
        b=vudHXfe1o6L4DwwTYZ1mL6B6ZEjvrG8bnhfREfSgjGd6Is2xS7vKT8gaGkk5Hb1v4
         qR7oj0gAi7C+D4eH/xP1IFoMDG5mdglXBYFlwnVmmBW46As5i4cihM5BEY7COIe7pr
         VAgsNxKTCrOXTnCeaH+w56abN315SpjGrgkEh0rA=
Authentication-Results: hamsrv800.servertools24.de;
        spf=pass (sender IP is 84.165.154.155) smtp.mailfrom=oss@c-mauderer.de smtp.helo=christian-pc.localdomain
Received-SPF: pass (hamsrv800.servertools24.de: connection is authenticated)
Subject: Re: [PATCH 1/2] dt-bindings: leds: Add binding for ubnt-spi LED.
To:     Pavel Machek <pavel@ucw.cz>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc:     Christian Mauderer <list@c-mauderer.de>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        Dan Murphy <dmurphy@ti.com>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
References: <20190504122825.11883-1-list@c-mauderer.de>
 <4889e87a-5c7a-da74-bff6-c20fd07ea0f4@gmail.com>
 <0175bf00-f2eb-98c7-ce0b-d9a2858872e7@c-mauderer.de>
 <5cc8907f-5cb4-e8b4-7309-cc446ef5bde7@gmail.com> <20190504203448.GA24856@amd>
 <20190504221719.GA7237@amd>
From:   Christian Mauderer <oss@c-mauderer.de>
Message-ID: <cda5d92c-6738-ed7a-a480-de04ebd2d466@c-mauderer.de>
Date:   Sun, 5 May 2019 10:01:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190504221719.GA7237@amd>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-PPP-Message-ID: <155704330806.56220.9861718474588669005@hamsrv800.servertools24.de>
X-PPP-Vhost: c-mauderer.de
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 05/05/2019 00:17, Pavel Machek wrote:
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
> 
> ...and I guess if you have single LED it will be used for more than
> "is AP active". IOW it will likely to be more similar to "status" than
> "wlan-ap".
> 
> Best regards,
> 									Pavel
> 

As far as I understand it the dt-bindings is an example anyway, right?
So it's not really relevant what the LED does in my specific system.
Jacek said

> In label we expect "color:function" pattern.

Therefore I think that a "white:status" would be a good example label
and I'll use that.

I'll prepare a patch set v2 and (hopefully) send it in the next hours
after I've tested in on my hardware.

Best regards

Christian
