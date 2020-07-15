Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF65C2214E3
	for <lists+linux-leds@lfdr.de>; Wed, 15 Jul 2020 21:11:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726785AbgGOTKw (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 15 Jul 2020 15:10:52 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:53830 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726722AbgGOTKs (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 15 Jul 2020 15:10:48 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 06FJAYKL092051;
        Wed, 15 Jul 2020 14:10:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1594840234;
        bh=bndH4C9S14fBJFWi20VbvHanSZKetAh2mwBglo7C1VQ=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=aLcUQBDy4vjBTaQPGYCD8bizPEbhSiGgswEW+AMxZ7OlwcNu2G+/V1qKrrFmq5cxe
         aIYSaaGqhxBgHUZZO4tU4FfkNpfPqGLAU7cN2EgQbc4uSt4o7WHXylaus3e7n9bVlB
         dDdzcHB+C39LtNZakuUhVR8eqs0kzIoWnoDE1RnI=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 06FJAYSE060345
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 15 Jul 2020 14:10:34 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 15
 Jul 2020 14:10:34 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 15 Jul 2020 14:10:34 -0500
Received: from [10.250.32.229] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 06FJAYYs008872;
        Wed, 15 Jul 2020 14:10:34 -0500
Subject: Re: [PATCH v4 2/2] leds: initial support for Turris Omnia LEDs
To:     =?UTF-8?Q?Marek_Beh=c3=ban?= <marek.behun@nic.cz>
CC:     <linux-leds@vger.kernel.org>, Pavel Machek <pavel@ucw.cz>,
        <jacek.anaszewski@gmail.com>
References: <20200715124034.9804-1-marek.behun@nic.cz>
 <20200715124034.9804-3-marek.behun@nic.cz>
 <e274c075-c630-6217-1124-b207c6f67bac@ti.com>
 <20200715210358.567e0df5@dellmb.labs.office.nic.cz>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <2c1470ae-5a5a-5f75-b08b-4fb47afe02ca@ti.com>
Date:   Wed, 15 Jul 2020 14:10:34 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200715210358.567e0df5@dellmb.labs.office.nic.cz>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Marek

On 7/15/20 2:03 PM, Marek Behún wrote:
> On Wed, 15 Jul 2020 08:27:51 -0500
> Dan Murphy <dmurphy@ti.com> wrote:
>
>> Can this be built as a module?
> Yes. But only if MC framework is compiled in. If MC framework is
> compiled as module as well, this results in
>    FATAL: modpost: GPL-incompatible module led-class-multicolor.ko uses
>    GPL-only symbol 'led_set_brightness'

Hmm.  That is interesting

<snip>

>>> +	led->subled_info[0].color_index = LED_COLOR_ID_RED;
>>> +	led->subled_info[0].channel = 0;
>>> +	led->subled_info[1].color_index = LED_COLOR_ID_GREEN;
>>> +	led->subled_info[1].channel = 1;
>>> +	led->subled_info[2].color_index = LED_COLOR_ID_BLUE;
>>> +	led->subled_info[2].channel = 2;
>> OK this is why you may want to have sub-nodes.  Where reg is the
>> channel and color is the color.  Then you can do a for_each_child.
> Rob says that it doesn't need to be in DT if the controller only
> supports RGB LEDs. This controller is only in Turris Omnia which was
> never made with another kind of LEDs. So I think it is pointless and
> would only grow the DT and complicate the driver.
OK I know there was a discussion on this
>>> +	cdev->max_brightness = 255;
>> This is not needed.  It is defaulted to LED_FULL in led_class
> This was discussed last year and resulted in LED_FULL being
> declared obsolete in the header file.

No I am referring to setting the max_brightness to 255 the LED class 
sets this to 255 if the value is not set.


>>> +/*
>>> + * On the front panel of the Turris Omnia router there is also a
>>> button which can be used to control
>>> + * the intensity of all the LEDs at once, so that if they are too
>>> bright, user can dim them.
>>> + * The microcontroller cycles between 8 levels of this global
>>> brightness (from 100% to 0%), but this
>>> + * setting can have any integer value between 0 and 100.
>>> + * It is usable to be able to change this value from software, so
>>> that it does not start at 100%
>> This does not make sense.
> It does. The user changes the brightness of all 12 LEDs with the button
> to his liking and wants to have the same setting after powering
> the router on again.

No the english does not make sense

" It is usable to be able to change this value from software, so
that it does not start at 100%"

"It is usable" is not really clear.

>>> + * after every power on and annoy the user.
>>> + * We expose this setting via a sysfs attribute file called
>>> "brightness". This file lives in the
>>> + * device directory of the LED controller, not an individual LED,
>>> so it should not confuse users.
>>> + */
>> Sorry if this has been discussed already
>>
>> This seems a bit wonky.  You are overriding the brightness set by the
>> LED class.
> I am not. Pressing the button does not change the brightness read from
> the /sys/class/leds/<LED>/brightness file. This is different brightness,
> it is above the classic brightnes in the PWM hierarchy in the
> microcontroller. I discussed this with Pavel and he said we can call
> this file brightness as well (since it is brightness of the whole
> panel), and the file does not reside in /sys/class/leds/<LED> directory.

OK then there needs to be some ABI documentation no?

Dan
