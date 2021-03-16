Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B797533E1D3
	for <lists+linux-leds@lfdr.de>; Wed, 17 Mar 2021 00:01:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229537AbhCPXBW (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 16 Mar 2021 19:01:22 -0400
Received: from 1.mo179.mail-out.ovh.net ([178.33.111.220]:46775 "EHLO
        1.mo179.mail-out.ovh.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229646AbhCPXA7 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 16 Mar 2021 19:00:59 -0400
X-Greylist: delayed 964 seconds by postgrey-1.27 at vger.kernel.org; Tue, 16 Mar 2021 19:00:58 EDT
Received: from player762.ha.ovh.net (unknown [10.110.208.168])
        by mo179.mail-out.ovh.net (Postfix) with ESMTP id CE848192FBE
        for <linux-leds@vger.kernel.org>; Tue, 16 Mar 2021 23:44:52 +0100 (CET)
Received: from milecki.pl (ip-194-187-74-233.konfederacka.maverick.com.pl [194.187.74.233])
        (Authenticated sender: rafal@milecki.pl)
        by player762.ha.ovh.net (Postfix) with ESMTPSA id B5C461C1A0637;
        Tue, 16 Mar 2021 22:44:44 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass (GARM-104R00590ba227f-f0e6-4995-86e5-396bb2d1189f,
                    A1A54852ADC5FECC858E3B1428EFF252DD499A2B) smtp.auth=rafal@milecki.pl
X-OVh-ClientIp: 194.187.74.233
Subject: Re: [PATCH] dt-bindings: leds: leds-gpio: fix & extend node regex
To:     Rob Herring <robh@kernel.org>,
        =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        Florian Fainelli <f.fainelli@gmail.com>
References: <20210310070025.9150-1-zajec5@gmail.com>
 <20210316223122.GA3800914@robh.at.kernel.org>
From:   =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Message-ID: <37f56e82-f60a-2375-e809-2b12fde5311b@milecki.pl>
Date:   Tue, 16 Mar 2021 23:44:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210316223122.GA3800914@robh.at.kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 3811171185956523759
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrudefvddgudeiiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgsehtkeertddtfeejnecuhfhrohhmpeftrghfrghlucfoihhlvggtkhhiuceorhgrfhgrlhesmhhilhgvtghkihdrphhlqeenucggtffrrghtthgvrhhnpeekudehjeehffdufefhgffhgeejjeelteekveeuleevgeekhffhffeiheellefgveenucfkpheptddrtddrtddrtddpudelgedrudekjedrjeegrddvfeefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrjeeivddrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehrrghfrghlsehmihhlvggtkhhirdhplhdprhgtphhtthhopehlihhnuhigqdhlvggushesvhhgvghrrdhkvghrnhgvlhdrohhrgh
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 16.03.2021 23:31, Rob Herring wrote:
> On Wed, Mar 10, 2021 at 08:00:25AM +0100, Rafał Miłecki wrote:
>> From: Rafał Miłecki <rafal@milecki.pl>
>>
>> The old regex allowed only 1 character to follow the "led-" prefix which
>> was most likely just an overlook.
> 
> Indeed.
> 
>> Fix it and while at it allow dashes in
>> node names. It allows more meaningful names and it helpful e.g. when
>> having the same function name with 2 different colors. For example:
>> 1. led-power-white
>> 2. led-power-blue
> 
> No, node names are supposed to be generic and reflect the class of
> device.

There was some extra discussion on this patch that has ended up with a question about numbering nodes.

Current binding assumes that nodes should be numbered with independent suffix numbers like:
led-0 { };
led-1 { };
led-2 { };

Do you think this could / should be improved somehow?

One option I was thinking about was using:
led@0 { };
led@5 { };
where numbers ("0", "5") should match GPIO numbers.

Is that a valid solution and does it improve things to make it worth it?
