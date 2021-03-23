Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 89480346DDE
	for <lists+linux-leds@lfdr.de>; Wed, 24 Mar 2021 00:25:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231199AbhCWXYi (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 23 Mar 2021 19:24:38 -0400
Received: from 3.mo7.mail-out.ovh.net ([46.105.34.113]:38994 "EHLO
        3.mo7.mail-out.ovh.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234288AbhCWXYZ (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 23 Mar 2021 19:24:25 -0400
X-Greylist: delayed 4198 seconds by postgrey-1.27 at vger.kernel.org; Tue, 23 Mar 2021 19:24:25 EDT
Received: from player762.ha.ovh.net (unknown [10.109.146.20])
        by mo7.mail-out.ovh.net (Postfix) with ESMTP id 970F719C7C1
        for <linux-leds@vger.kernel.org>; Tue, 23 Mar 2021 23:07:53 +0100 (CET)
Received: from milecki.pl (ip-194-187-74-233.konfederacka.maverick.com.pl [194.187.74.233])
        (Authenticated sender: rafal@milecki.pl)
        by player762.ha.ovh.net (Postfix) with ESMTPSA id 86DC91C591AF3;
        Tue, 23 Mar 2021 22:07:45 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass (GARM-102R004ff11d61f-c83b-4b06-a604-ca9a14255473,
                    FF25B3CCD00EBCF90D9E5B8D6084FA1CF06082A2) smtp.auth=rafal@milecki.pl
X-OVh-ClientIp: 194.187.74.233
Subject: Re: [PATCH] dt-bindings: leds: leds-gpio: fix & extend node regex
To:     Rob Herring <robh@kernel.org>
Cc:     =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        devicetree@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>
References: <20210310070025.9150-1-zajec5@gmail.com>
 <20210316223122.GA3800914@robh.at.kernel.org>
 <37f56e82-f60a-2375-e809-2b12fde5311b@milecki.pl>
 <CAL_JsqL5fPhVCHtUZjoWy6O-y0JWdLTyNDHWv=t64OvUje2Rsg@mail.gmail.com>
From:   =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Message-ID: <ada9e6e0-ab1b-e86a-812b-e2e087594539@milecki.pl>
Date:   Tue, 23 Mar 2021 23:07:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <CAL_JsqL5fPhVCHtUZjoWy6O-y0JWdLTyNDHWv=t64OvUje2Rsg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 7401947464525647599
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrudegiedgudehkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgsehtkeertddtfeejnecuhfhrohhmpeftrghfrghlucfoihhlvggtkhhiuceorhgrfhgrlhesmhhilhgvtghkihdrphhlqeenucggtffrrghtthgvrhhnpeekudehjeehffdufefhgffhgeejjeelteekveeuleevgeekhffhffeiheellefgveenucfkpheptddrtddrtddrtddpudelgedrudekjedrjeegrddvfeefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrjeeivddrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehrrghfrghlsehmihhlvggtkhhirdhplhdprhgtphhtthhopehlihhnuhigqdhlvggushesvhhgvghrrdhkvghrnhgvlhdrohhrgh
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 23.03.2021 23:02, Rob Herring wrote:
> On Tue, Mar 16, 2021 at 5:25 PM Rafał Miłecki <rafal@milecki.pl> wrote:
>>
>> On 16.03.2021 23:31, Rob Herring wrote:
>>> On Wed, Mar 10, 2021 at 08:00:25AM +0100, Rafał Miłecki wrote:
>>>> From: Rafał Miłecki <rafal@milecki.pl>
>>>>
>>>> The old regex allowed only 1 character to follow the "led-" prefix which
>>>> was most likely just an overlook.
>>>
>>> Indeed.
>>>
>>>> Fix it and while at it allow dashes in
>>>> node names. It allows more meaningful names and it helpful e.g. when
>>>> having the same function name with 2 different colors. For example:
>>>> 1. led-power-white
>>>> 2. led-power-blue
>>>
>>> No, node names are supposed to be generic and reflect the class of
>>> device.
>>
>> There was some extra discussion on this patch that has ended up with a question about numbering nodes.
>>
>> Current binding assumes that nodes should be numbered with independent suffix numbers like:
>> led-0 { };
>> led-1 { };
>> led-2 { };
>>
>> Do you think this could / should be improved somehow?
> 
> No, we have other ways for meaningful names (label, color, function, etc.).
> 
>> One option I was thinking about was using:
>> led@0 { };
>> led@5 { };
>> where numbers ("0", "5") should match GPIO numbers.
>>
>> Is that a valid solution and does it improve things to make it worth it?
> 
> What if you have <gpioa 1> and <gpiob 1>?
> 
> The cells in a consumer for a provider are opaque to the consumer.

Thanks a lot for helping me understand that, it make sense ofc.
