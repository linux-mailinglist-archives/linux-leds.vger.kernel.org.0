Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30F0C38999B
	for <lists+linux-leds@lfdr.de>; Thu, 20 May 2021 01:07:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230026AbhESXIr (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 19 May 2021 19:08:47 -0400
Received: from mail.kernel.org ([198.145.29.99]:40738 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229990AbhESXIr (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Wed, 19 May 2021 19:08:47 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 993E8611AD;
        Wed, 19 May 2021 23:07:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621465646;
        bh=CyXZyA6mosLM8Q5H6YwXkClts+9EWa3zf1UbFdQNMrI=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=aXHR+AKxF4EN52kd6x8plyMzy1+4t0lW21FEqE168WQq3sgWJO0xkE6cu5qFdi3vm
         nijmX+4k4BMnC0DIOUmQ97vZEpIHvAvPbP4dLHlA4ZnNHfABkaDN8GioEfPE3eIqsK
         CreUT1iRPEVmCPIlNXJtj6+OV1XWfXjRVOGs7Yeypo14sHx5ntqU8WUisxMIOhfBbJ
         AoVqP50RT+p/BJF8jsm3bpOujtQStBy1dzwwe3rwnyGRmcNxg7r7cjgrw03DZvKNPn
         Ny9TRVeV0eX8UpLZ9ZIS9OaHCq2ZfB5SDZQte48eXiD07xy8NgR/2UAvHMCf2wDBYP
         5V/PEQUlK/MSA==
Date:   Thu, 20 May 2021 01:07:20 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        gregkh@linuxfoundation.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
Subject: Re: [PATCH v2 00/17] Adding support for controlling the leds found
 on Intel NUC
Message-ID: <20210520010720.32265ad4@coco.lan>
In-Reply-To: <20210519194115.GA31672@duo.ucw.cz>
References: <cover.1621349813.git.mchehab+huawei@kernel.org>
        <20210519111107.GC24621@duo.ucw.cz>
        <20210519141508.6e7a4d56@coco.lan>
        <20210519194115.GA31672@duo.ucw.cz>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Em Wed, 19 May 2021 21:41:15 +0200
Pavel Machek <pavel@ucw.cz> escreveu:

> Hi!
> 
> > > Marek and I are saying the same thing -- this needs to use close to
> > > existing APIs.  
> > 
> > Ok, but I'm not seeing an existing API that provides what those
> > LEDs need.  
> 
> Well, there "close to" part comes into play.
> 
> > > If you want to get something merged quickly, please submit basic
> > > functionality only (toggling the LED on/off) that completely fits
> > > existing APIs. We can review that.  
> > 
> > If you prefer working this way, I can send an initial patch with
> > just the very basic. Actually, if you apply just patch 2 of this
> > series, it will provide support for for just setting the brightness
> > on NUC8.  
> 
> I don't care much. We can discuss minimal interface additions
> neccessary to support your usecases.
> 
> But what you proposed was nowhere near close.

Ok. Let's try to come into an agreement about what's needed.

On my discussions with Marek, it sounds to me that the features
from the trigger API won't fit, as the attributes there won't
be supported by the NUC leds (and vice-versa).

Yet, we could try to have something that would look similar.

> 
> Note that we don't want to support every crazy feature, just because
> hardware can do it.

Neither do I ;-) 

I don't care much for Software controlled LEDs, nor for a feature
that would allow the BIOS to "hide" the LED colors as if it were
a single colored one, for instance.

Yet, the remaining stuff seems pretty much OK.

> 
> > However, the main reason why someone (including myself) want this
> > driver is to allow to dynamically change what hardware event will
> > be triggering the LED and how, and if suspend will blink or not[1].  
> 
> > Being able to also change the LED color is a plus.  
> 
> This one is hard if the LED does not support full color.

Only a subset of devices support RGB colors, but the API has support
for dual-color and 8-color LEDs. On those, the color is selected like
an enum.

The NUC8 device I use her has RGB color LEDs.

> 
> > [1] Disabling blink at suspend/hibernate is one of the things that
> > I use here: as the machine is at my bedroom, I don't want it to be
> > blinking all night long when the machine is sleeping :-)  
> 
> Ok, so lets start with the blink at suspend thing?

Yeah, that sounds to be a good start point.

> 
> Having power LED on when machine is on, and slowly "breathing" when
> machine is suspended is something I have seen before. Is that what
> your hardware is doing?

Yes, but see: my device has 6 leds (API supports up to 7 leds).

Any of them can be programmed to act as a power LED at runtime.

So, the first thing that the API needs is a way to tell what LED
is monitoring the device's power state.

Then, for each power state (S0, S3, S5), define if the LED will
be ON all the times or not.

The "slowing breathing" is one of the possible blink patterns.
The driver supports 4 other blink patterns

	- Solid - the LED won't blink;
	- Breathing - it looks like a sinusoidal wave pattern;
	- Pulsing - it looks like a square wave pattern;
	- Strobing - it turns ON suddenly, and then it slowly turns OFF.

The speed of the blink is also adjustable, ranging from 0.1 Hz to 1 Hz,
on 0.1 Hz steps.

---

Let me explain this specific part of the API from my original proposal.

Those are the led names from the datasheets (NUC 8 and above),
and my proposal for the sysfs class directory name:

=============	===============================
LED name	sysfs
=============	===============================
Skull		``/sys/class/leds/nuc::skull``
Skull eyes	``/sys/class/leds/nuc::eyes``
Power		``/sys/class/leds/nuc::power``
HDD		``/sys/class/leds/nuc::hdd``
Front1		``/sys/class/leds/nuc::front1``
Front2		``/sys/class/leds/nuc::front2``
Front3		``/sys/class/leds/nuc::front3``
=============	===============================

For each of the above, there's the need to identify what
hardware function is monitored (if any).

My proposal were to add an "indicator" node (the name came from
the Intel datasheets) that shows what led will monitor the power state.

Then, one blink_behavior and one blink_frequency per power state,
e. g.:

    /sys/class/leds/nuc::front1
    |-- indicator
    |-- s0_blink_behavior
    |-- s0_blink_frequency
    |-- s3_blink_behavior
    |-- s3_blink_frequency
    |-- s5_blink_behavior
    `-- s5_blink_frequency

PS.: I don't care much about what names we'll use. Feel free to
rename them, if you think the above is not clear or generic enough.

-

To make part of the API complete, there's also the need of a node
to control the max brightness that the leds will achieve at the
ON state, and another one to control the color on each state,
as one could define, let's say, "white" when powered on, "blue"
when suspended and "yellow" when hibernating. The colors at the
NUC I have are RGB (but other models can use an enum for the
supported colors).

    /sys/class/leds/nuc::front1
    |-- s0_brightness
    |-- s0_color		# only shown on colored leds
    |-- s3_brightness
    |-- s3_color		# only shown on colored leds
    |-- s0_brightness
    `-- s5_color		# only shown on colored leds

Thanks,
Mauro
