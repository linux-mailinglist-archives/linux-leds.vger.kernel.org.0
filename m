Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1896638B3E2
	for <lists+linux-leds@lfdr.de>; Thu, 20 May 2021 18:00:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233227AbhETQBz (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 20 May 2021 12:01:55 -0400
Received: from mail.kernel.org ([198.145.29.99]:55498 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232163AbhETQBy (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Thu, 20 May 2021 12:01:54 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0D5136108D;
        Thu, 20 May 2021 16:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621526433;
        bh=i8aCh2Zp3gD4pGzjHEZYNwQdWU/wRXD4wEMaa8c0rn8=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=QWaCBinNSwImgKyrKjIF5B5qwnpLwqQLCNlDRT4wygz6xSf3wAhlkMQLzauGtuRPE
         Qf9Xz56xgHBDR3u16J06wZXJb6UbFCZi6PQRpwcinCBwbiwF7lNi9rro4nn3jEM9BW
         WdYnsmU8Ra5aEM2ckWQwBhY0BAVHXFafyqCAfGqDMall3DJKWYnfAJycXqtfgKLCRZ
         Tc0+OKrFp4Su46pTMBcrcrpIGYEN7w4iKl4yVqpmHBE5m2ucva8achqNnF4YTuPjvb
         sYLyfUn+aRKxP40SLP2tNpO8FDhBHSzJCYKcNJayvsT4t0CVyxRIkZbdlg2w33sXrC
         uPoVQ2h920jnw==
Date:   Thu, 20 May 2021 18:00:28 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Marek =?UTF-8?B?QmVow7pu?= <marek.behun@nic.cz>
Cc:     Marek =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>, linuxarm@huawei.com,
        mauro.chehab@huawei.com, Pavel Machek <pavel@ucw.cz>,
        gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
        linux-leds@vger.kernel.org
Subject: Re: [PATCH v2 16/17] leds: leds-nuc: add support for changing the
 ethernet type indicator
Message-ID: <20210520180028.495f94e4@coco.lan>
In-Reply-To: <20210520130014.7189a315@dellmb>
References: <cover.1621349813.git.mchehab+huawei@kernel.org>
        <792598f4a1a3219b6517057c92559b0f0a95b419.1621349814.git.mchehab+huawei@kernel.org>
        <20210519100253.49b155e9@thinkpad>
        <20210519121812.4285b3ea@coco.lan>
        <20210519141102.0161a9d9@thinkpad>
        <20210519162413.4feeab02@coco.lan>
        <20210519175503.567e6ecc@thinkpad>
        <20210519203014.1838de3a@coco.lan>
        <20210520130014.7189a315@dellmb>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Em Thu, 20 May 2021 13:00:14 +0200
Marek Beh=C3=BAn <marek.behun@nic.cz> escreveu:

> On Wed, 19 May 2021 20:30:14 +0200
> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
>=20
> > Em Wed, 19 May 2021 17:55:03 +0200
> > Marek Beh=C3=BAn <kabel@kernel.org> escreveu:
> >  =20
> > > On Wed, 19 May 2021 16:24:13 +0200
> > > Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
> > >    =20
> > > > On other words, if no extra care is taken, it could have bad side=20
> > > > effects at the machine's performance and affect system's latency,
> > > > eventually resulting on things like audio clicks and pops, if some
> > > > audio is playing while such calls keep happening.     =20
> > >=20
> > > In general we want for every LED that is registered into kernel as
> > > a LED classdev to be possible to control the brightness by
> > > software. If the hardware supports it, it should be available.    =20
> >=20
> > This is supported, but maybe not the same way as on other drivers.
> >=20
> > There are two separate things: ON/OFF and LED brightness, when turned
> > ON.
> >=20
> > On other words, NUC leds allow to set the brightness ranging from 0
> > to 100, but if the brightness is, let's say 50%, it means that, when
> > the LED is triggered by the hardware:
> >=20
> > 	- ON would mean 50%; and=20
> > 	- OFF would mean 0%. =20
>=20
> Not a problem, there are other controller which also work this way,
> leds-turris-omnia for example.=20

OK.

> Also LED triggers are supposed to work
> this way: if a LED supports non-binary brightness (for exmaple 0-100),
> and the user sets brightness 50, and then a trigger, then the trigger
> should blink the LED with brightness 50.
>=20
> > On other words, it actually adjusts the maximum brightness level.
> >=20
> > Btw, this also applies to software control, as the hardware can still
> > blink the LED, the available properties for software control indicator
> > are:
> > 	- brightness.
> > 	- blink behavior and frequency;
> > 	- led color (available only if BIOS says that it is a=20
> > 	  multi-colored led); =20
>=20
> - if the hw supports setting the LED to blink with a specific frequency
>   (not depending on any other HW like disk or ethernet, just blinking),
>   you should also implement the .blink_set method (look at
>   Documentation/leds/leds-class.rst section Hardware accelerated blink
>   of LEDs)

Ok.

How the blink pattern is specified? NUC supports 3 different
patterns (breathing, pulsing, strobing).

> - if BIOS says the LED is multi-colored, you should register it as
>   multi-colored LED via multicolor framework

Ok. I'll check how much work this will lead after we finish the API
discussions, as all sysfs attributes that won't fit at the triggers
will need to be implemented twice - one for mono-colored and another one
for multicolored, as the priv pointer will use different structures.

> > The exported attributes:
> >=20
> > 	static struct attribute *netdev_trig_attrs[] =3D {
> > 		&dev_attr_device_name.attr,
> > 		&dev_attr_link.attr,
> > 		&dev_attr_rx.attr,
> > 		&dev_attr_tx.attr,
> > 		&dev_attr_interval.attr,
> > 		NULL
> > 	};
> > 	ATTRIBUTE_GROUPS(netdev_trig);
> >=20
> > also won't apply, as the NUC API doesn't support setting device_name,=20
> > RX, TX, link or interval.
> >=20
> > Instead, it allows to set:
> > - the maximum brightness;
> > - the color (if the LED is multi-colored);
> > - the physical port(s) that will be monitored:
> > 	- LAN1
> > 	- LAN2
> > 	- LAN1+LAN2
> >=20
> > where LAN1 and LAN2 are two physical ports behind the NUC device.
> > The netdev layer knows those as "eno1" and "enp5s0" (not=20
> > necessarily at the same order). =20
>=20
> The only problem I see with trigger_data in this case is that only one
> netdevice can be set, while your LED can be configured to blink on
> activity on two netdevices.
>=20
> Otherwise all these settings are relevant.
> What your driver offload callback should do (once HW offloading of LED
> triggers is merged) is this:
>   - the offload method is called by the netdev trigger
>   - the offload method looks at the trigger_data structure. This
>     contains settings rx, tx, link, interval, device_name/device. If the
>     device_name is "eno1" or "end5s0" (or better, if the device points
>     to one of the 2 netdevices that are supported by the HW), and if
>     the rx, tx, link and interval parameters are configured to values
>     that can be done by the LED controller, than put the LED into HW
>     controlled state (to blink with these parameters on network
>     activity on that netdevice) and return 0
>   - otherwise the offload method should return -EOPNOTSUPP, and the
>     netdev trigger will know that the requested settings are not
>     supported by the HW, and the netdev trigger will blink the LED in
>     SW

See, there's nothing that the driver can possible do with
rx, tx, link, interval, device_name/device, as the the BIOS allows
to set to "LAN1", "LAN2" or "LAN1+LAN2". the WMI interface doesn't
provide *any* information about what LAN1 means.

In the case of my NUC, there are even two different drivers:

	00:1f.6 Ethernet controller: Intel Corporation Ethernet Connection (2) I21=
9-LM (rev 31)
	Kernel modules: e1000e

	05:00.0 Ethernet controller: Intel Corporation I210 Gigabit Network Connec=
tion (rev 03)
	Kernel modules: igb

So, even the probing order can be different after a reboot.

So, there isn't a portable way to tell if LAN1 means to either
"eno1" or "end5s0"(*), as netdev and the associated net drivers
talk with the hardware directly, and not via BIOS. So, the BIOS
internal name is not known. Even the DMI tables don't tell it:

	Handle 0x000F, DMI type 8, 9 bytes
	Port Connector Information
	        Internal Reference Designator: CON4501
	        Internal Connector Type: None
	        External Reference Designator: LAN
	        External Connector Type: RJ-45
	        Port Type: Network Port
=09
	Handle 0x0010, DMI type 8, 9 bytes
	Port Connector Information
	        Internal Reference Designator: CON4401
	        Internal Connector Type: None
	        External Reference Designator: LAN
	        External Connector Type: RJ-45
	        Port Type: Network Port

(*)  I'm using the interface names on this specific model, but
     I'm pretty sure other models will have different names
     and will even use different network drivers.

The point is, while the current netdev trigger API can be generic
enough when the LED is controlled by netdev, it is *not*
generic enough to cover the case where it is trigged by the
firmware, as the information exposed by the firmware can be
(and it is on this case) completely different than what netdev
exposes.


> > Also, while netdev trigger seems to use just one device name,
> > the NUC allows to monitor both interfaces at the same time. =20
>=20
> Yes. This can be solved in the future by extending netdev trigger to
> support blinking on activity on multiple netdevices. I also thought
> about this for use with another HW (mv88e6xxx switch).
>=20
> > See, unfortunately I can't see a common API that would fit
> > nicely on both cases. =20
>=20
> Well I can.

Then the API needs to change, in order to allow to abstract from
netdev-centric view of Ethernet interfaces. Or, instead, some
other trigger is needed for firmware-controlled events.

-

One thing that it is not clear to me: let's say that the LED
called "front1" is currently handling Ethernet events, but
the user wants to use, instead, the "front2" LED, disabling
the "front1" one (or using for another event, like wifi, which
is not monitored on BIOS default).

How this can be done using the trigger's API?

> The only problem here is that it is not supported yet. I will try to
> send patches ASAP and poke Pavel to review them.

Ok. Please c/c on such patches.

> > > Currently the netdev trigger does the blinking in software only
> > > (code in "ledtrig-netdev.c" file). There is a WIP to add the
> > > necessary support for the netdev trigger to have the ability to
> > > offload blinking to HW. I will try to respin this WIP and send
> > > patches for review.
> > >=20
> > > Once netdev trigger supports this feature, you can implement your
> > > driver in this way. You can even make your driver depend on netdev
> > > trigger    =20
> >  =20
> > > and set the specific LED into netdev triggering by default, and
> > > even forbidding anything else.    =20
> >=20
> > This is also probably one of the differences from other hardware:
> > In principle, *any* led can monitor *any* hardware event[1].
> >=20
> > [1] There are some bitmaps at the interface that would allow the
> >     BIOS to restrict it, but, at least on the device I have
> >     (Hades Canyon), there's no such restriction: the same bitmap
> >     masks are returned for all LEDs.
> >  =20
> > > But this is the corrent way to do this,
> > > instead of creating new sysfs API that is non-extendable.
> > >=20
> > > I am sorry that I did not explain this thoroughly in previous mails.
> > > Hopefully this explanation is better.   =20
> >=20
> > Yes, it is a lot better. Thanks for the explanation!
> >=20
> > Still, as I pointed above, I'm so far unable to see much in common=20
> > with the way the existing LED drivers work and the way NUC LEDS are
> > controlled.
> >=20
> > So, as much I would love to just reuse something that already exists,
> > perhaps it would make more sense to create a separate class for such
> > kind of usage. =20
>=20
> The problem is that this API is not yet available in upstream kernel. I
> will try to push it and return to you.

Ok.

>=20
> In the meantime let's see what others think about your code.

Ok, thank you!

Thanks,
Mauro
