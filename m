Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 637C0D8A99
	for <lists+linux-leds@lfdr.de>; Wed, 16 Oct 2019 10:14:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727322AbfJPIOC (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 16 Oct 2019 04:14:02 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:41374 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727050AbfJPIOC (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 16 Oct 2019 04:14:02 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9G8DvjU130553;
        Wed, 16 Oct 2019 03:13:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1571213637;
        bh=vvfizoAV18jYY7G0TZ4BBB9EIjhmzo2BOaH86imNQVs=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=bTRLib9nFNL33USrLAuq5kETjmb88wk1GI//n07zVRuwFr7JMeYcyFoBWgpD3TQXM
         ClwWfa22P3rZ3y4ufFgYm3zsf6K1T8IrruDZunl4L3tmZHetCparfmzQkQxSWRP70j
         tRQ4c4KnYjuzw78v7UtZjQA8/0HNxRDC+h977udE=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9G8DvkX080531
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 16 Oct 2019 03:13:57 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 16
 Oct 2019 03:13:57 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 16 Oct 2019 03:13:57 -0500
Received: from [10.250.99.146] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9G8Dtd6016253;
        Wed, 16 Oct 2019 03:13:56 -0500
Subject: Re: [PATCH v5 3/3] leds: Add control of the voltage/current regulator
 to the LED core
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Daniel Thompson <daniel.thompson@linaro.org>
CC:     Pavel Machek <pavel@ucw.cz>, <linux-leds@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <dmurphy@ti.com>,
        <tomi.valkeinen@ti.com>
References: <20190923102059.17818-1-jjhiblot@ti.com>
 <20190923102059.17818-4-jjhiblot@ti.com>
 <3e648fab-638f-4aa0-dda9-8ddba6562751@gmail.com> <20191013120937.GK5653@amd>
 <eb8c0df1-0d5b-11d0-9965-3192fa5675f3@ti.com>
 <20191014123849.fhvmqn7dyu6bminc@holly.lan>
 <939cf695-b955-da01-2a2b-3b5ce0dc3660@gmail.com>
From:   Jean-Jacques Hiblot <jjhiblot@ti.com>
Message-ID: <5e4ad085-4091-2c43-4001-3378076fd455@ti.com>
Date:   Wed, 16 Oct 2019 10:13:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <939cf695-b955-da01-2a2b-3b5ce0dc3660@gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


On 14/10/2019 20:48, Jacek Anaszewski wrote:
> On 10/14/19 2:38 PM, Daniel Thompson wrote:
>> On Mon, Oct 14, 2019 at 12:49:07PM +0200, Jean-Jacques Hiblot wrote:
>>> On 13/10/2019 14:09, Pavel Machek wrote:
>>>> Hi!
>>>>
>>>>> I must say I'm not a big fan of this change.
>>>>> It adds a bunch of code to the LED core and gives small
>>>>> functionality in a reward. It may also influence maximum
>>>>> software blinking rate, so I'd rather avoid calling
>>>>> regulator_enable/disable when timer trigger is set.
>>>>>
>>>>> It will of course require more code.
>>>>>
>>>>> Since AFAIR Pavel was original proponent of this change then
>>>>> I'd like to see his opinion before we move on to discussing
>>>>> possible improvements to this patch.
>>>> Was I?
>>>>
>>>> Okay, this series looks quite confusing to me. First, 1/3 looks
>>>> "interesting" (would have to analyze it way more).
>>>>
>>>> Second, 3/3... So we have a LED driver _and_ a regulator? So yes, the
>>>> chip driving a LED is usually ... voltage/current regulator. What is
>>>> second regulator doing there? Is that a common setup?
>>> This is quite common with current-sink LED drivers.
>>>
>>> The setup looks like this:
>>>
>>> +-----------+
>>> |           |
>>> | Regulator |
>>> |           +------------------------+
>>> |           |                        |
>>> +-----------+                      __|__
>>>                                     \   /
>>>           +---------------------+    \ / led
>>>           |                     |     V
>>>           |    Led Driver       |   --+--
>>>           |                     |     |
>>>           |                     |     |
>>>           |                +----------+
>>>           |              \      |
>>>           |               \     |
>>>           |                +    |
>>>           |                |    |
>>>           +---------------------+
>>>                            |
>>>                         +--+--+
>>>                         ///////
>>>
>>>
>>> Only the regulator usually does not supply only one LED.
>> Given questions have been raised about the complexity of the change I
>> wondered whether, for a system with this topology, the regulator
>> could/should be enabled when the LED driver driver probes?
> And this is how are doing that now.
>
> Moreover, just after seeing your ASCII art it has become obvious to me
> that we can't simply do regulator_disable() while setting brightness to
> LED_OFF since it can result in powering off the LED controller, which
> would need to be reconfigured on next transition to
> brightness > LED_OFF.

That is a problem only if the LED driver is powered by the same 
regulator, which is not the case in the diagram.

This series make sense only for boards where LEDs have a dedicated 
voltage rail or can be modeled this way.

My use case is a LED panel driven by a LED current-sink controller that 
uses both a PWM-style control for brightness AND a active-low enable 
pin. If the enable pin is not HIGH, the panel is never completely dark 
even if the LED brightness is set to 0. I modeled this switch with a 
fixed-voltage regulator  which is a common way of doing it (it is after 
all how this things is done inside the panel).

JJ
> It looks that the idea is flawed I'm afraid.
