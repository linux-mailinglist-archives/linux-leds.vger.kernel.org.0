Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9771138C2D2
	for <lists+linux-leds@lfdr.de>; Fri, 21 May 2021 11:14:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235858AbhEUJP2 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 21 May 2021 05:15:28 -0400
Received: from mail.kernel.org ([198.145.29.99]:53196 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234287AbhEUJP2 (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Fri, 21 May 2021 05:15:28 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id AE8A3613AE;
        Fri, 21 May 2021 09:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621588445;
        bh=1qdT9S/SfkMROYxc6NjIRztiIRc7/iewyzNvhcacNNw=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=Xhd0IeiCplHjKW0D0INcPrbbUTaCoak0MA77qqrKcw1MrQG90StZQcb75PwG05fHt
         F1Vw2clZRaW9cTjU7bvI9ZYd3Q+WW9x+Cx/sImgPh5adMx9M1cAA2yNyMk9ji0FZ5N
         WFJcO/wf9dHvwlvOy0ZUWp2Y1BGxXF1vpBz6cPEoctpUROljF/cxrAIS/Pe/iZQO6p
         sCLTpzrErgZYha91H8eiUYdZD++Ae3rarwiKxKwAzBOW1EMtiiiIItK3zLfgXu0lGp
         Nji8bFA5N878xQry1XQp/Nnr0xMw4PahQF6qchc+Z2MMeJL/z/0075pCD6I2R33Z0S
         vgLZJ6bCx6IbA==
Date:   Fri, 21 May 2021 11:14:00 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Marek =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        linuxarm@huawei.com, mauro.chehab@huawei.com,
        Pavel Machek <pavel@ucw.cz>, gregkh@linuxfoundation.org
Subject: Re: [PATCH v2 16/17] leds: leds-nuc: add support for changing the
 ethernet type indicator
Message-ID: <20210521111400.127ffa10@coco.lan>
In-Reply-To: <20210520220703.5a86b994@thinkpad>
References: <cover.1621349813.git.mchehab+huawei@kernel.org>
        <792598f4a1a3219b6517057c92559b0f0a95b419.1621349814.git.mchehab+huawei@kernel.org>
        <20210519100253.49b155e9@thinkpad>
        <20210519121812.4285b3ea@coco.lan>
        <20210519141102.0161a9d9@thinkpad>
        <20210519162413.4feeab02@coco.lan>
        <20210519175503.567e6ecc@thinkpad>
        <20210519203014.1838de3a@coco.lan>
        <20210520130014.7189a315@dellmb>
        <20210520180028.495f94e4@coco.lan>
        <20210520183633.084a8c3f@thinkpad>
        <20210520205933.3cfc57a9@coco.lan>
        <20210520220703.5a86b994@thinkpad>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Em Thu, 20 May 2021 22:07:03 +0200
Marek Beh=C3=BAn <kabel@kernel.org> escreveu:

> On Thu, 20 May 2021 20:59:33 +0200
> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
>=20
> > > On the contrary, there is something the driver can do with these
> > > attributes. If the specific combination is not supported, the driver
> > > should return -EOPNOTSUPP in the trigger_offload method and let the
> > > netdev trigger do the work in software.    =20
> >=20
> > Letting netdev to trigger is something we don't want to allow, as this
> > can cause side effects, making it doing slow the system due to BIOS cal=
ls
> > for no good reason.
> > =20
> > > What exactly do the LEDs do
> > > when configured to blink on activity on a network device? Do they just
> > > blink on RX/TX, and otherwise are off?  Or are they on when a cable is
> > > plugged, blink on rx/tx and otherwise off?   =20
> >=20
> > They are on when a cable is plugged, blink on rx/tx and otherwise off.
> >=20
> > Worth mentioning that, besides the LEDs controlled by this driver, each
> > RJ-45 port also a couple leds that behave just like normal RJ-45 ones:=
=20
> > a yellow led for Ethernet PHY detection and a green one for traffic. =20
>=20
> So what the LED does when configured for ethernet is almost equivalent
> to netdev setting [link=3D1, rx=3D1, activity=3D1]. Almost because we sti=
ll have
> the correct device setting and interval setting.
>=20
> Theoretically what you can do is deny the netdev trigger for every
> other netdev setting (since, according to you, it would use too much
> CPU time in BIOS via software control). This could be done by the
> offload method returning another error value, or maybe just returning 0
> and printing info about this into kernel log. I wonder what others
> think about this possible resolution.

IMO, it would be preferred to have a different trigger here, as this
is not a netdev-based trigger. So, its implementation should not call:

	register_netdevice_notifier()

nor set timers, etc.

See, the hardware won't use any information provided by the netdev,
trigger and the API is not the same, as the hardware trigger only
wants to know if just one interface will trigger the led or both.

> > > If even DSDT data is not enough to reliably find out which of the 2
> > > network interfaces belongs to which LED setting, the worst case scena=
rio
> > > here is for your driver to need to have a list containing this
> > > information for specific motherboards, and other people can then exte=
nd
> > > the driver to support their motherboards as well.   =20
> >=20
> > Needing something like that sucks and it is hard to maintain,
> > and depends on people reporting issues. =20
>=20
> I don't see much difference between this and various drivers having
> different OF compatible strings for different chips all supported by
> one driver.

It is somewhat similar: on my experiences, the upstream OF compatibles
are almost always outdated uptream: only OOT Kernels have the full
OF stuff :-p

The major difference is that hardware vendors usually develop and
provide OF.

In this case, you want users to fill bug reports that will ask a
Kernel developer to add new entries for their machines to work
properly. While we do this on other drivers, doing that is time
consuming and may lead into errors. Believe me: this is needed
on media drivers, as there are things like GPIOs that are
device-specific. It is a pain to maintain those things.

> > > > Then the API needs to change, in order to allow to abstract from
> > > > netdev-centric view of Ethernet interfaces. Or, instead, some
> > > > other trigger is needed for firmware-controlled events.     =20
> > >=20
> > > No. If the necessary information for determining which network
> > > interface pairs to LED1 and which to LED2 cannot be reliably determin=
ed
> > > from ACPI tables, then IMO the driver should specify this information
> > > for each motherboard that wants to use this feature.   =20
> >=20
> > What's the gain of adding such extra complexity to the driver? =20
>=20
> Having a consistent API on different devices is a benefit in itself, I
> would think.

It wouldn't be consistent. Hardware sees the events on different
ways than netdev, and associating netdev's view of the interface with
the hardware's view will always be an issue, on any driver that would
trigger such kind of events.

See, let's assume someone would implement a hardware trigger for
the LEDs on an 48-ports Ethernet switch, and different versions of
such hub would use different Ethernet drivers.

No matter how netdev sees the hardware, or if some of the ports
can be replaced (some devices allow port hot-plugging), from userspace
perspective, what it really matter is the port number as seen at
the switch panel, no matter how netdev sees it.

So, for hardware-triggered events, the hardware "label" is a lot
more relevant than any linux-internal representation.

> > All the user wants is to blink a led only for one of the LAN ports.
> >=20
> > Denying it and using a more complex API doesn't make much sense, IMO. =
=20
>=20
> As I see it you are the one wanting to introduce more complexity into
> the sysfs ABI. There is already a solution together with documentation
> and everything for when the user wants to "blink a led only for one of
> the LAN ports". It is the netdev trigger. And you want to complicate
> that ABI.

No. The existing in-kernel API is to blink a led based on software
events originated from netdev from a single network port.=20

It could monitor an interface that doesn't physically exist=20
(a virtual network interface, like tun0). It could even monitor traffic
on a single VLAN, if the interface is specified like eth0.100[1].

[1] As we're discussing API here, I didn't test/check if the current
    implementation allows monitoring virtual and VLAN interfaces.
    From API's perspective, it makes perfect sense to be able to
    monitor any physical or logical interface supported by netdev.

The HW trigger is different: led blinks if the hardware detects Ethernet
activity on one or more physical interfaces.

See, the netdev trigger monitors a netdev event with may or may not
be due to an Ethernet port.

An Ethernet HW trigger monitors activity on a set of physical
Ethernet ports.

In essence, the only thing in common is that both triggers are related to
network, but they're actually monitoring two different types of events.

Merging them into a single one sounds a conceptual mistake on my eyes.

> You say that for this controller it would be bad to do in SW, because it
> would take too much time in BIOS calls. (I wonder how much...)=20

Yeah, it would be interesting to know how much. However, measuring BIOS
latency and time spent on such calls can be tricky: one needs to use a
high-res clock that it is not used anywhere else, in order to measure
it.=20

Thanks,
Mauro
