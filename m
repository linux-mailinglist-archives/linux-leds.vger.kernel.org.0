Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 11D8638B70C
	for <lists+linux-leds@lfdr.de>; Thu, 20 May 2021 21:16:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237705AbhETTRn (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 20 May 2021 15:17:43 -0400
Received: from mail.kernel.org ([198.145.29.99]:46716 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236921AbhETTRm (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Thu, 20 May 2021 15:17:42 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id B9E696135A;
        Thu, 20 May 2021 19:16:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621538181;
        bh=qY3hpBeVAuCX3rQmLLBqhaAD+XIAqD/Wva7r1sTpmjI=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=Ki2RQ4f3Izr1A7WBNsI0VLlib/aFJk9UldR0MensCn/hkE9QUESVFebdERfweBDCW
         rWUhODGM3tARvtEEH4yvTvnuN9aCH5EIK+y/nWOmq22eEQSp+SzIT2VbCkfPUDQjgD
         zE7b1d+8Yg4k0sohAl1X+P5ov5UZxZ0fEu8plUEZSBlBH77Du6Ks7nZXJOlPyG5vRh
         28xZGdzclB617Y0tsRF+avAnSKDk/YaOtqS0+6Iuz0ofETtaZZVdurOf0U/cmH3oJm
         B2LdjMLznrcyJcVZJh1U6wf3NegkE6PkFnQ1CdaKyRAwNSs2RakiahwYHsdZoa+1C/
         kj8weSC2ni/QQ==
Date:   Thu, 20 May 2021 21:16:15 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Marek =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>
Cc:     Pavel Machek <pavel@ucw.cz>, linuxarm@huawei.com,
        mauro.chehab@huawei.com, gregkh@linuxfoundation.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-leds@vger.kernel.org
Subject: Re: [PATCH v2 00/17] Adding support for controlling the leds found
 on Intel NUC
Message-ID: <20210520211615.437e22ee@coco.lan>
In-Reply-To: <20210520181919.608568b2@thinkpad>
References: <cover.1621349813.git.mchehab+huawei@kernel.org>
        <20210519111107.GC24621@duo.ucw.cz>
        <20210519141508.6e7a4d56@coco.lan>
        <20210519194115.GA31672@duo.ucw.cz>
        <20210520010720.32265ad4@coco.lan>
        <20210520181919.608568b2@thinkpad>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Em Thu, 20 May 2021 18:19:19 +0200
Marek Beh=C3=BAn <kabel@kernel.org> escreveu:

> On Thu, 20 May 2021 01:07:20 +0200
> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
>=20
> > So, the first thing that the API needs is a way to tell what LED
> > is monitoring the device's power state. =20
>=20
> If a LED can monitor the device's power state in HW, register a LED
> private trigger for this LED. If the LED is configured into this state
> by default, you can set this trigger to be the default_trigger prior
> registering the LED. The name of this private trigger can be
> "hw:powerstate" or something like that (I wonder what others will
> think about this name).

Ok.

So, assuming that we will have one trigger per each hardware
state, it could have something like (names subject to change):

	- hw:powerstate
	- hw:disk_activity
	- hw:ethernet_activity
	- hw:wifi_active
	- hw:power_limit

Right?

It still needs to indicate two other possible states:

	- software controlled led;
	- led is disabled.

Setting led's brightness to zero is different than disabling
it.=20

Disabling can be done via BIOS, but BIOS config doesn't allow
setting the brightness. There are other difference on BIOS settings:
it allow disabling each/all LED controls and/or to disable software=20
control of each LED.

So, we need a way at the API to uniquely identify when the LED
is software-controlled and when it is disabled.
Would it be something like:

	- hw:disable

trigger? or better to implement it on a different way?

> > Then, for each power state (S0, S3, S5), define if the LED will
> > be ON all the times or not.
> >=20
> > The "slowing breathing" is one of the possible blink patterns.
> > The driver supports 4 other blink patterns
> >=20
> > 	- Solid - the LED won't blink;
> > 	- Breathing - it looks like a sinusoidal wave pattern;
> > 	- Pulsing - it looks like a square wave pattern;
> > 	- Strobing - it turns ON suddenly, and then it slowly turns OFF.
> >=20
> > The speed of the blink is also adjustable, ranging from 0.1 Hz to 1 Hz,
> > on 0.1 Hz steps. =20
>=20
> Is the speed of breathing/strobing also adjustable? Or only when
> pulsing?

Yes, speed is also adjustable, from 0.1 to 1.0 HZ, in 0.1 Hz
(NUC 8 and above).

The NUC6 API is more limited than NUC8+: it has just two
blink patterns (blink, fade), and only 3 frequencies are allowed
(0.25 Hz, 0.50 Hz and 1.0 Hz).

> When this "hw:powerstate" trigger is enabled for this LED,
> only then another sysfs files should appear in this LED's sysfs
> directory.

OK, makes sense.=20

Out of curiosity: is it reliable to make sysfs nodes appear and
disappear dynamically? Does inotify (or something similar) can
be used to identify when such nodes appear/disappear?

I remember a long time ago I wanted to use something like that=20
at the media (or edac?) subsystem, but someone (Greg, I think)
recommended otherwise due to some potential racing issues.

>=20
> > ---
> >=20
> > Let me explain this specific part of the API from my original proposal.
> >=20
> > Those are the led names from the datasheets (NUC 8 and above),
> > and my proposal for the sysfs class directory name:
> >=20
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D	=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > LED name	sysfs
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D	=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > Skull		``/sys/class/leds/nuc::skull``
> > Skull eyes	``/sys/class/leds/nuc::eyes``
> > Power		``/sys/class/leds/nuc::power``
> > HDD		``/sys/class/leds/nuc::hdd``
> > Front1		``/sys/class/leds/nuc::front1``
> > Front2		``/sys/class/leds/nuc::front2``
> > Front3		``/sys/class/leds/nuc::front3``
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D	=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >=20
> > For each of the above, there's the need to identify what
> > hardware function is monitored (if any).
> >=20
> > My proposal were to add an "indicator" node (the name came from
> > the Intel datasheets) that shows what led will monitor the power state.
> >=20
> > Then, one blink_behavior and one blink_frequency per power state,
> > e. g.:
> >=20
> >     /sys/class/leds/nuc::front1
> >     |-- indicator
> >     |-- s0_blink_behavior
> >     |-- s0_blink_frequency
> >     |-- s3_blink_behavior
> >     |-- s3_blink_frequency
> >     |-- s5_blink_behavior
> >     `-- s5_blink_frequency =20
>=20
> I'd rather use one file for frequencies and one for intervals, and map
> in to an array, but that is just my preference...

By intervals are you meaning 1/frequency? So, basically exposing
the frequency as two fields? If so, it sounds overkill to me to have both.=
=20

Btw, maybe instead of "blink_behavior" it could use "blink_pattern".

This would diverge from the datahseet name, but it probably describes
better what will be controlled when blink is enabled:

	- frequency (or inverval)
	- pattern

>=20
> >=20
> > PS.: I don't care much about what names we'll use. Feel free to
> > rename them, if you think the above is not clear or generic enough.
> >=20
> > -
> >=20
> > To make part of the API complete, there's also the need of a node
> > to control the max brightness that the leds will achieve at the
> > ON state, and another one to control the color on each state,
> > as one could define, let's say, "white" when powered on, "blue"
> > when suspended and "yellow" when hibernating. The colors at the
> > NUC I have are RGB (but other models can use an enum for the
> > supported colors).
> >=20
> >     /sys/class/leds/nuc::front1
> >     |-- s0_brightness
> >     |-- s0_color		# only shown on colored leds
> >     |-- s3_brightness
> >     |-- s3_color		# only shown on colored leds
> >     |-- s0_brightness
> >     `-- s5_color		# only shown on colored leds =20
>=20
> If the BIOS reports a LED being full RGB LED, you should register it
> via multicolor framework.

OK.

> Regarding the enum with 8 colors: are these
> colors red, yellow, green, cyan, blue, magenta? Because if so, then
> this is RGB with each channel being binary :) So you can again use
> multicolor framework.

The dual-colored ones aren't RGB. Two types are supported:
	- Blue/Amber
	- Blue/White

the only one with 8 colors is at NUC6 API: the ring led. This one can be ma=
pped
as RGB with 1 bit per color, as those are the colors:

    +---------+
    | disable |
    +---------+
    | cyan    |
    +---------+
    | pink    |
    +---------+
    | yellow  |
    +---------+
    | blue    |
    +---------+
    | red     |
    +---------+
    | green   |
    +---------+
    | white   |
    +---------+

Thanks,
Mauro
