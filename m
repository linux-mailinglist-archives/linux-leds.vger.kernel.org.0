Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AAD7138C43B
	for <lists+linux-leds@lfdr.de>; Fri, 21 May 2021 11:59:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233360AbhEUKAh (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 21 May 2021 06:00:37 -0400
Received: from mail.kernel.org ([198.145.29.99]:53096 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236450AbhEUJ7U (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Fri, 21 May 2021 05:59:20 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id BACE96135A;
        Fri, 21 May 2021 09:57:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621591078;
        bh=i4/KWLucX/hjgHaCwrMiynh+kfxBdskVyva3d5c9t7Q=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=jt58pA8gUebfDrvf8VaIs9jNOmZdcHZVXBZu+j0balTLXBwqIxkuU8+pSogE0NjN5
         0APDefdnLHE9x+YIw/3IRpwbLQc0I9PkO6SMg8ZB8IhX50fbmRCIImhrprQeE2wMg0
         nZ0KXj2LG4SbiQ4BdHImK+2mKQqROjAF7DR2naJ1lxkkmat7lhlQVcJHJ0mb2BbkOb
         XLRD4gmAWCUOE0LW42MDwAVG5VbZ+2KYkIu2CMhWdJY49nxKgeUhCvWAquDcgZlcN9
         LeJrgkS5v5VtPURZHdGTFkpn760QlZzLFm/KQ9SXdk5Np8TAvyrvab6TVndKRxsLEx
         MzwdvcrAV59Ow==
Date:   Fri, 21 May 2021 11:57:52 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Marek =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>
Cc:     Pavel Machek <pavel@ucw.cz>, linuxarm@huawei.com,
        mauro.chehab@huawei.com, gregkh@linuxfoundation.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-leds@vger.kernel.org
Subject: Re: [PATCH v2 00/17] Adding support for controlling the leds found
 on Intel NUC
Message-ID: <20210521115752.419f3ebf@coco.lan>
In-Reply-To: <20210520214356.0392f374@thinkpad>
References: <cover.1621349813.git.mchehab+huawei@kernel.org>
        <20210519111107.GC24621@duo.ucw.cz>
        <20210519141508.6e7a4d56@coco.lan>
        <20210519194115.GA31672@duo.ucw.cz>
        <20210520010720.32265ad4@coco.lan>
        <20210520181919.608568b2@thinkpad>
        <20210520211615.437e22ee@coco.lan>
        <20210520214356.0392f374@thinkpad>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Em Thu, 20 May 2021 21:43:56 +0200
Marek Beh=C3=BAn <kabel@kernel.org> escreveu:

> On Thu, 20 May 2021 21:16:15 +0200
> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
>=20
> > So, assuming that we will have one trigger per each hardware
> > state, it could have something like (names subject to change):
> >=20
> > 	- hw:powerstate
> > 	- hw:disk_activity
> > 	- hw:ethernet_activity
> > 	- hw:wifi_active
> > 	- hw:power_limit
> >=20
> > Right? =20
>=20
> Yes, but we should really try to map ethernet_activity to netdev and
> disk_activity to a potential blkdev trigger :-) That's my opinion.
>=20
> > It still needs to indicate two other possible states:
> >=20
> > 	- software controlled led;
> > 	- led is disabled.
> >=20
> > Setting led's brightness to zero is different than disabling
> > it.=20
> >
> > Disabling can be done via BIOS, but BIOS config doesn't allow
> > setting the brightness. There are other difference on BIOS settings:
> > it allow disabling each/all LED controls and/or to disable software=20
> > control of each LED.
> >=20
> > So, we need a way at the API to uniquely identify when the LED
> > is software-controlled and when it is disabled.
> > Would it be something like:
> >=20
> > 	- hw:disable
> >=20
> > trigger? or better to implement it on a different way? =20
>=20
> What is the functional difference (visible to the user) between zero
> brightness and disabled LED? IMO if user says
>   echo 0 >brightness
> you can just disable the LED. Or is this impossible?

echo 0 >brightness will turn off the LED, but it won't
disable it. A trigger can still be enabled on it.

With a disabled LED, depending on how it was disabled,=20
it can't be enabled in runtime. One may need to boot the=20
machine and use BIOS setup to enable it. Trying to change
such LED in runtime will return an error.

> =20
> > > Is the speed of breathing/strobing also adjustable? Or only when
> > > pulsing?   =20
> >=20
> > Yes, speed is also adjustable, from 0.1 to 1.0 HZ, in 0.1 Hz
> > (NUC 8 and above).
> >=20
> > The NUC6 API is more limited than NUC8+: it has just two
> > blink patterns (blink, fade), and only 3 frequencies are allowed
> > (0.25 Hz, 0.50 Hz and 1.0 Hz).
> >  =20
> > > When this "hw:powerstate" trigger is enabled for this LED,
> > > only then another sysfs files should appear in this LED's sysfs
> > > directory.   =20
> >=20
> > OK, makes sense.=20
> >=20
> > Out of curiosity: is it reliable to make sysfs nodes appear and
> > disappear dynamically? Does inotify (or something similar) can
> > be used to identify when such nodes appear/disappear?
> >=20
> > I remember a long time ago I wanted to use something like that=20
> > at the media (or edac?) subsystem, but someone (Greg, I think)
> > recommended otherwise due to some potential racing issues. =20
>=20
> No idea, but I would guess yes.
>=20
> > > I'd rather use one file for frequencies and one for intervals, and map
> > > in to an array, but that is just my preference...   =20
> >=20
> > By intervals are you meaning 1/frequency? So, basically exposing
> > the frequency as two fields? If so, it sounds overkill to me to have bo=
th.  =20
>=20
> Sorry, I meant one file for frequencies and one for patterns.

Ah, makes sense. Yeah, that's how I mapped it.

> > Btw, maybe instead of "blink_behavior" it could use "blink_pattern".
> >=20
> > This would diverge from the datahseet name, but it probably describes
> > better what will be controlled when blink is enabled:
> >=20
> > 	- frequency (or inverval)
> > 	- pattern
> >  =20
> > > Regarding the enum with 8 colors: are these
> > > colors red, yellow, green, cyan, blue, magenta? Because if so, then
> > > this is RGB with each channel being binary :) So you can again use
> > > multicolor framework.   =20
> >=20
> > The dual-colored ones aren't RGB. Two types are supported:
> > 	- Blue/Amber
> > 	- Blue/White =20
>=20
> These would need a new API, ignore these for now.

This affects mainly NUC6 part of the API. I'll postpone it.

Yet, IMHO, the best here is to do exactly how I did: use the
"normal" leds class and add a "color" attribute that can=20
either be "blue" or "amber" written on it (for a  blue/amber=20
kind of LED).

Thanks,
Mauro
