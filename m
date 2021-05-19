Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD1D43890BE
	for <lists+linux-leds@lfdr.de>; Wed, 19 May 2021 16:24:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241568AbhESOZi (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 19 May 2021 10:25:38 -0400
Received: from mail.kernel.org ([198.145.29.99]:48728 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240879AbhESOZi (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Wed, 19 May 2021 10:25:38 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8B7D6611BD;
        Wed, 19 May 2021 14:24:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621434258;
        bh=0CWDlirDNb564C5woYVnNp0FVDEVs4hHAqWQ52u1YrE=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=TL7+7TbitxGb54496DnGRmG5cTqQQU7JCOro1iejEult23Q4BEU/NSpWGq+0FZpqm
         oFT4fNrlBu1aeSZwBM/OWs6JMUEr8sm8ItYUppoZPfcmWgPjxJHSeclXN1eWMlvopf
         x68EkSd0BR2pmahHal1rVAEZJlCGeGK5QpRTi7i5i1hOMvu4M66AdiBJEhO3qDrvc7
         pUItwvoCo3ZbR7rEe7RMMUlZ3UJwweuOmgq8sqEWMGhi6Ag7e/X6K9wrwy4pt9DVaX
         zpKWycgaAwMdYvFh6h/l7SUkwZ3+XInvkSuyliXlJLJ8OeHlbAqDK7/sU/zQViO0Hu
         2eKkOwHyzaXiA==
Date:   Wed, 19 May 2021 16:24:13 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Marek =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Pavel Machek <pavel@ucw.cz>, gregkh@linuxfoundation.org,
        linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
Subject: Re: [PATCH v2 16/17] leds: leds-nuc: add support for changing the
 ethernet type indicator
Message-ID: <20210519162413.4feeab02@coco.lan>
In-Reply-To: <20210519141102.0161a9d9@thinkpad>
References: <cover.1621349813.git.mchehab+huawei@kernel.org>
        <792598f4a1a3219b6517057c92559b0f0a95b419.1621349814.git.mchehab+huawei@kernel.org>
        <20210519100253.49b155e9@thinkpad>
        <20210519121812.4285b3ea@coco.lan>
        <20210519141102.0161a9d9@thinkpad>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Em Wed, 19 May 2021 14:11:02 +0200
Marek Beh=C3=BAn <kabel@kernel.org> escreveu:

> On Wed, 19 May 2021 12:18:12 +0200
> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
>=20
> > Em Wed, 19 May 2021 10:02:53 +0200
> > Marek Beh=C3=BAn <kabel@kernel.org> escreveu:
> >  =20
> > > What possible configurations does this support?
> > >=20
> > > Does this blink on rx/tx activity for a specific ethernet port?
> > >    =20
> >=20
> > When the indicator is set to monitor Ethernet, it can work on either
> > LAN1, LAN2 or both LAN interfaces.
> >  =20
> > > There is a work in progress to add support for transparent offloading=
 of
> > > LED triggers, with the netdev trigger being the first target.
> > >=20
> > > This means that after that is done, you could implement this driver so
> > > that when netdev trigger is enabled on a supported interface, your
> > > driver will offload the blinking to the HW.   =20
> >=20
> > On NUC leds, this is already offloaded to HW/firmware.=20
> >=20
> > All it takes is to tell the BIOS via ACPI/WMI what LED will be used
> > for monitoring the Ethernet activity, and on what port(s). =20
>=20
> Can the LED be put into software controlled mode and also into HW
> controlled mode so that HW blinks the LED on ethernet activity?

On a given time, a LED will either be in hardware-controlled mode or in
Software-controlled one. It should be noticed that software-controlled
mode should first be enabled by a BIOS option.

The default is to be hardware-controlled.

I don't intend to implement myself support for software-controlled
mode in Kernel, as this will probably be a lot worse than letting
the hardware control the led directly.=20

See, changing the LED in software on NUC happens via ACPI calls, meaning
that the Kernel should be interrupted in order to run some code
inside the BIOS that will actually program the hardware. Switching to
BIOS produces context switching and may also interrupt the other
CPUs, as the BIOS may need to do CPU locking, in order to prevent=20
L1/L2/L3 cache issues.

On other words, if no extra care is taken, it could have bad side=20
effects at the machine's performance and affect system's latency,
eventually resulting on things like audio clicks and pops, if some
audio is playing while such calls keep happening.

So, IMO, there's very little sense on trying to re-implement the
already existing hardware-controlled events via software emulation.

> If so, then this is what I am talking about: transparent HW offloading
> of LED triggers:
> - I have a LED in /sys/class/leds
> - I set "netdev" trigger on this LED
> - I set ethernet interface for which the LED should blink
> - if the HW can blink the LED for that particular ethernet interface,
>   the driver should use HW blinking...

Sorry, but I guess I missed something here. Are you meaning to use
the code under "ledtrig-netdev.c" or something else?=20

The code at ledtrig-netdev.c allocates a trigger data, initializes a
spin lock, initializes a delayed work, registers a notifier, sets a=20
trigger interval, etc. It is perfectly fine for software-controlled
LEDs, but none of those will ever be used by the NUC driver,=20
if it only implements HW blinking for the Ethernet interfaces
(and, as said before, there's little sense emulating it via software
on such devices).

Thanks,
Mauro
