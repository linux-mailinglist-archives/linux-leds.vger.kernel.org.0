Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E1EBB128BBF
	for <lists+linux-leds@lfdr.de>; Sat, 21 Dec 2019 22:49:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726976AbfLUVtN (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 21 Dec 2019 16:49:13 -0500
Received: from mx2.suse.de ([195.135.220.15]:39084 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726900AbfLUVtM (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Sat, 21 Dec 2019 16:49:12 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 4707CAC6E;
        Sat, 21 Dec 2019 21:49:10 +0000 (UTC)
Subject: Re: [RFC 22/25] leds: tm1826: Add combined glyph support
To:     Pavel Machek <pavel@ucw.cz>
Cc:     linux-realtek-soc@lists.infradead.org, linux-leds@vger.kernel.org,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Dan Murphy <dmurphy@ti.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Miguel Ojeda Sandonis <miguel.ojeda.sandonis@gmail.com>
References: <20191212033952.5967-1-afaerber@suse.de>
 <20191212033952.5967-23-afaerber@suse.de> <20191221202755.GN32732@amd>
 <506d0697-1820-7811-1b38-910355812948@suse.de> <20191221210406.GA13125@amd>
From:   =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>
Organization: SUSE Software Solutions Germany GmbH
Message-ID: <1b3fc7f2-3c10-9b11-37ac-1bc7b0aa47d8@suse.de>
Date:   Sat, 21 Dec 2019 22:49:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191221210406.GA13125@amd>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi,

Am 21.12.19 um 22:04 schrieb Pavel Machek:
>>>> Allow to squeeze the text "HEllO" into a 4-digit display,
>>>> as seen on MeLE V9 TV box.
>>>>
>>>> Enable this combining mode only if the text would overflow.
>>>
>>> "HEll,nO"!
>>>
>>> :-)
>>>
>>> Ok, it is kind of cool, but... Can you take a look at
>>> drivers/auxdisplay/charlcd.c ? It seems to support some kind of text
>>> displays...
>>
>> Why don't you look at it before making such a suggestion? ;) It is in no way
>> useful, as I pointed out in my cover letter. The only thing related today,
>> as Geert pointed out, is in the input subsystem.
> 
> Okay, so maybe we should get
> 
> AUXILIARY DISPLAY DRIVERS
> M:      Miguel Ojeda Sandonis <miguel.ojeda.sandonis@gmail.com>
> 
> on the Cc: list?

Let's see if that email still exists - the code looked ancient, full of 
platform_data and driver-specific exported functions...

(the Yealink input driver was from 2005, too)

> What you really have is a display, not a bunch of LEDs.

We have an LED Controller connected to zero, one or more displays.
They are most certainly _not_ the same thing.

>> If you don't want this in leds, you'll have to help make leds subsystem more
>> useful to external users - the latest function refactoring has been anything
>> but helpful here, as you've seen with the indicators, and we're completely
>> lacking any indexing or bulk operations on the LED controller level, since
>> you treat each LED as a standalone device. That's precisely why this code is
>> here in leds although - as I pointed out - it shouldn't belong here.
> 
> Well, your introduction mail was kind of long :-).
> 
> If someone wants to do heartbeat on
> 
>   --
> |  | <- this segment
>   --
> |  |
>   --
> 
> they are probably crazy. We may not want to support that. What about
> doing it as auxdisplay driver, and then exporting the indicators
> around that as LEDs?

You're really just discussing which directory to put this file into - 
moving it around is the easiest thing...

> 
> Having USB activity trigger on 'USB' icon makes sense, on the other
> hand. That would still be supported.

Actually I disagree about those indicators - that was the reason they're 
indicators and not, e.g., "usb". IMO people would go crazy if large text 
like that blinked during USB transfers. I assumed the meaning of those 
LEDs were to indicate whether a USB/SD medium is connected, which I did 
not see any better function for, and I'm not aware of us having such 
triggers today.

Maybe you also overread that with trigger I was referring to using RTC 
as trigger for a) the colon blinking every half-second and b) the text 
getting updated based on avsilable RTC interrupts?

You could also think of GPIO-connected LEDs that you may want to animate 
without two different heartbeats/timers getting out of sync. Or think of 
an RGB LED that today we sadly need to model as multiple GPIO LEDs 
instead of as one with a color property we can change (and hardcoding a 
color in DT/name is not helping that use case either).

auxdisplay offers no API that I could register with to drive output, nor 
any triggers to automate such output - that's unique to LEDs. Like I 
said, we can place this spi_driver file into auxdisplay/, but that 
doesn't solve the driver design. So I really think we need to decouple 
the two and keep the LED Controller driver in leds and the display logic 
elsewhere, with suitable new APIs to connect them. We're lacking 
suggestions for the how, on DT and API levels - see my response on the 
cover letter.

Regards,
Andreas

-- 
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N�rnberg, Germany
GF: Felix Imend�rffer
HRB 36809 (AG N�rnberg)
