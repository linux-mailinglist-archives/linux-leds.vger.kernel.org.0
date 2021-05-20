Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A0F338A9AC
	for <lists+linux-leds@lfdr.de>; Thu, 20 May 2021 13:04:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238670AbhETLFH (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 20 May 2021 07:05:07 -0400
Received: from mail.nic.cz ([217.31.204.67]:47082 "EHLO mail.nic.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238722AbhETLCn (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Thu, 20 May 2021 07:02:43 -0400
Received: from dellmb (unknown [IPv6:2001:1488:fffe:6:8747:7254:5571:3010])
        by mail.nic.cz (Postfix) with ESMTPSA id F0C4614097E;
        Thu, 20 May 2021 13:01:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
        t=1621508478; bh=5CWuz7SdgaLmm6Xqot+14eymtdpe1/I8yma6Ggv6mNA=;
        h=Date:From:To;
        b=O/mP4PVFypHTLtEJTHc1qHWaA2cLDmTHert5Bu8IDETnRTWD5G0pOtLE0rXXLAwb7
         55WpDE/na5zrlJ3KgYauyLhqNfXcB9T75JoXlc44SOJML1lMLXXikLd+szUIwBFGCu
         SwsYdwcjr66zbwH+iEx3zAuyTaHsEik5mXFMltjs=
Date:   Thu, 20 May 2021 13:00:14 +0200
From:   Marek =?UTF-8?B?QmVow7pu?= <marek.behun@nic.cz>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Marek =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>, linuxarm@huawei.com,
        mauro.chehab@huawei.com, Pavel Machek <pavel@ucw.cz>,
        gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
        linux-leds@vger.kernel.org
Subject: Re: [PATCH v2 16/17] leds: leds-nuc: add support for changing the
 ethernet type indicator
Message-ID: <20210520130014.7189a315@dellmb>
In-Reply-To: <20210519203014.1838de3a@coco.lan>
References: <cover.1621349813.git.mchehab+huawei@kernel.org>
        <792598f4a1a3219b6517057c92559b0f0a95b419.1621349814.git.mchehab+huawei@kernel.org>
        <20210519100253.49b155e9@thinkpad>
        <20210519121812.4285b3ea@coco.lan>
        <20210519141102.0161a9d9@thinkpad>
        <20210519162413.4feeab02@coco.lan>
        <20210519175503.567e6ecc@thinkpad>
        <20210519203014.1838de3a@coco.lan>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-100.0 required=5.9 tests=SHORTCIRCUIT,
        USER_IN_WELCOMELIST,USER_IN_WHITELIST shortcircuit=ham
        autolearn=disabled version=3.4.2
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.nic.cz
X-Virus-Scanned: clamav-milter 0.102.2 at mail
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Wed, 19 May 2021 20:30:14 +0200
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> Em Wed, 19 May 2021 17:55:03 +0200
> Marek Beh=C3=BAn <kabel@kernel.org> escreveu:
>=20
> > On Wed, 19 May 2021 16:24:13 +0200
> > Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
> >  =20
> > > On other words, if no extra care is taken, it could have bad side=20
> > > effects at the machine's performance and affect system's latency,
> > > eventually resulting on things like audio clicks and pops, if some
> > > audio is playing while such calls keep happening.   =20
> >=20
> > In general we want for every LED that is registered into kernel as
> > a LED classdev to be possible to control the brightness by
> > software. If the hardware supports it, it should be available.  =20
>=20
> This is supported, but maybe not the same way as on other drivers.
>=20
> There are two separate things: ON/OFF and LED brightness, when turned
> ON.
>=20
> On other words, NUC leds allow to set the brightness ranging from 0
> to 100, but if the brightness is, let's say 50%, it means that, when
> the LED is triggered by the hardware:
>=20
> 	- ON would mean 50%; and=20
> 	- OFF would mean 0%.

Not a problem, there are other controller which also work this way,
leds-turris-omnia for example. Also LED triggers are supposed to work
this way: if a LED supports non-binary brightness (for exmaple 0-100),
and the user sets brightness 50, and then a trigger, then the trigger
should blink the LED with brightness 50.

> On other words, it actually adjusts the maximum brightness level.
>=20
> Btw, this also applies to software control, as the hardware can still
> blink the LED, the available properties for software control indicator
> are:
> 	- brightness.
> 	- blink behavior and frequency;
> 	- led color (available only if BIOS says that it is a=20
> 	  multi-colored led);

- if the hw supports setting the LED to blink with a specific frequency
  (not depending on any other HW like disk or ethernet, just blinking),
  you should also implement the .blink_set method (look at
  Documentation/leds/leds-class.rst section Hardware accelerated blink
  of LEDs)
- if BIOS says the LED is multi-colored, you should register it as
  multi-colored LED via multicolor framework

> > There is a _blocking
> > .brightness_set_blocking callback for LEDs which may block when
> > setting brightness.
> > But even if we did not want to support software control, the
> > transparent trigger offloading is still relevant. See below.
> >  =20
> > > So, IMO, there's very little sense on trying to re-implement the
> > > already existing hardware-controlled events via software
> > > emulation.   =20
> >=20
> > We have a misunderstanding here, probably because of my bad
> > explanation, I will try to clarify.
> >  =20
> > > Sorry, but I guess I missed something here. Are you meaning to use
> > > the code under "ledtrig-netdev.c" or something else?=20
> > >=20
> > > The code at ledtrig-netdev.c allocates a trigger data,
> > > initializes a spin lock, initializes a delayed work, registers a
> > > notifier, sets a trigger interval, etc. It is perfectly fine for
> > > software-controlled LEDs, but none of those will ever be used by
> > > the NUC driver, if it only implements HW blinking for the
> > > Ethernet interfaces (and, as said before, there's little sense
> > > emulating it via software on such devices).   =20
> >=20
> > The idea of transparent offloading of LED triggers to HW (if HW
> > supports it) is to have a consistent and unified interface. =20
>=20
> Makes sense, but not sure if the current API will work.
>=20
> > Currently we have a driver (leds-ns2 I think) which allows putting
> > the LED into HW controlled mode (to blink on SATA disk activity).
> > This is done by writing 1 into /sys/class/leds/<LED>/sata.
> >=20
> > In your proposal you are creating several sysfs files:
> >   indicator
> >   hdd_default (notice difference from "sata" sysfs file in leds-ns2
> >                driver)
> >   ethernet_type
> >=20
> > So the problem here is that this API is not unified. This is
> > different from how leds-ns2 driver does this, and both of these
> > solutions are wrong, because they are not extendable. =20
>=20
> Partially agreed, but I'm not so sure if the reverse is not true ;-)
>=20
> I mean, the current LED API was designed and tested on drivers that
> allow direct control of the LED (and then extended to some cases
> where the hardware allows offloading).
>=20
> The NUC API is just the opposite: there, the BIOS has full control of
> the hardware, but it provides an interface that allows changing
> the LED behavior, up to some extend. It also allows controlling the
> LED hardware and make it blink while it is suspended/hibernating,=20
> which is something that a direct LED control wouldn't allow.

If the controller can make the LED to do a specific behaviour when the
system is suspended, please use the private LED trigger API and register
a LED private trigger (a trigger that is only available for that
specific LED) with a name like "suspend-indicator" or something.

> So, for instance, if we stick with the current LED API, there's no
> way to tell that the power LED should:
>=20
> 	- blink on every 5 seconds, using up to 20% of brightness
> 	  when the system is suspended;

There is. Implement the .blink_set method.

> 	- strobe on every 10 seconds using up to 50% of brightness
> 	  when the system is hibernated;

Implement a LED private trigger.

> 	- use 100% of brigntness and don't blink when powered up.

Implement a LED private trigger.

> > The correct way to do this is via LED triggers, i.e. if I want a
> > LED to blink on network activity, then I should use netdev trigger
> > and nothing else. The netdev trigger should determine whether the
> > underlying LED driver can set the LED to blink on network activity
> > in HW. If HW supports it, netdev trigger should use this, otherwise
> > netdev trigger should blink the LED in software. =20
>=20
> I understand the desire of exposing the same API, but the current
> trigger code doesn't seem to be fit. I mean, the init sequence
> done at netdev_trig_activate():
>=20
> 	trigger_data =3D kzalloc(sizeof(struct led_netdev_data),
> GFP_KERNEL); if (!trigger_data)
> 		return -ENOMEM;
>=20
> 	spin_lock_init(&trigger_data->lock);
>=20
> 	trigger_data->notifier.notifier_call =3D netdev_trig_notify;
> 	trigger_data->notifier.priority =3D 10;
>=20
> 	INIT_DELAYED_WORK(&trigger_data->work, netdev_trig_work);
>=20
> 	trigger_data->led_cdev =3D led_cdev;
> 	trigger_data->net_dev =3D NULL;
> 	trigger_data->device_name[0] =3D 0;
>=20
> 	trigger_data->mode =3D 0;
> 	atomic_set(&trigger_data->interval, msecs_to_jiffies(50));
> 	trigger_data->last_activity =3D 0;
>=20
> 	led_set_trigger_data(led_cdev, trigger_data);
>=20
> 	rc =3D register_netdevice_notifier(&trigger_data->notifier);
> 	if (rc)
> 		kfree(trigger_data);
>=20
> doesn't make sense when the LED will be trigged by the hardware,
> and registering a notifier for netdevice is overkill.
>=20
> The exported attributes:
>=20
> 	static struct attribute *netdev_trig_attrs[] =3D {
> 		&dev_attr_device_name.attr,
> 		&dev_attr_link.attr,
> 		&dev_attr_rx.attr,
> 		&dev_attr_tx.attr,
> 		&dev_attr_interval.attr,
> 		NULL
> 	};
> 	ATTRIBUTE_GROUPS(netdev_trig);
>=20
> also won't apply, as the NUC API doesn't support setting device_name,=20
> RX, TX, link or interval.
>=20
> Instead, it allows to set:
> - the maximum brightness;
> - the color (if the LED is multi-colored);
> - the physical port(s) that will be monitored:
> 	- LAN1
> 	- LAN2
> 	- LAN1+LAN2
>=20
> where LAN1 and LAN2 are two physical ports behind the NUC device.
> The netdev layer knows those as "eno1" and "enp5s0" (not=20
> necessarily at the same order).

The only problem I see with trigger_data in this case is that only one
netdevice can be set, while your LED can be configured to blink on
activity on two netdevices.

Otherwise all these settings are relevant.
What your driver offload callback should do (once HW offloading of LED
triggers is merged) is this:
  - the offload method is called by the netdev trigger
  - the offload method looks at the trigger_data structure. This
    contains settings rx, tx, link, interval, device_name/device. If the
    device_name is "eno1" or "end5s0" (or better, if the device points
    to one of the 2 netdevices that are supported by the HW), and if
    the rx, tx, link and interval parameters are configured to values
    that can be done by the LED controller, than put the LED into HW
    controlled state (to blink with these parameters on network
    activity on that netdevice) and return 0
  - otherwise the offload method should return -EOPNOTSUPP, and the
    netdev trigger will know that the requested settings are not
    supported by the HW, and the netdev trigger will blink the LED in
    SW


> Also, while netdev trigger seems to use just one device name,
> the NUC allows to monitor both interfaces at the same time.

Yes. This can be solved in the future by extending netdev trigger to
support blinking on activity on multiple netdevices. I also thought
about this for use with another HW (mv88e6xxx switch).

> See, unfortunately I can't see a common API that would fit
> nicely on both cases.

Well I can.

The only problem here is that it is not supported yet. I will try to
send patches ASAP and poke Pavel to review them.

> > Currently the netdev trigger does the blinking in software only
> > (code in "ledtrig-netdev.c" file). There is a WIP to add the
> > necessary support for the netdev trigger to have the ability to
> > offload blinking to HW. I will try to respin this WIP and send
> > patches for review.
> >=20
> > Once netdev trigger supports this feature, you can implement your
> > driver in this way. You can even make your driver depend on netdev
> > trigger  =20
>=20
> > and set the specific LED into netdev triggering by default, and
> > even forbidding anything else.  =20
>=20
> This is also probably one of the differences from other hardware:
> In principle, *any* led can monitor *any* hardware event[1].
>=20
> [1] There are some bitmaps at the interface that would allow the
>     BIOS to restrict it, but, at least on the device I have
>     (Hades Canyon), there's no such restriction: the same bitmap
>     masks are returned for all LEDs.
>=20
> > But this is the corrent way to do this,
> > instead of creating new sysfs API that is non-extendable.
> >=20
> > I am sorry that I did not explain this thoroughly in previous mails.
> > Hopefully this explanation is better. =20
>=20
> Yes, it is a lot better. Thanks for the explanation!
>=20
> Still, as I pointed above, I'm so far unable to see much in common=20
> with the way the existing LED drivers work and the way NUC LEDS are
> controlled.
>=20
> So, as much I would love to just reuse something that already exists,
> perhaps it would make more sense to create a separate class for such
> kind of usage.

The problem is that this API is not yet available in upstream kernel. I
will try to push it and return to you.

In the meantime let's see what others think about your code.

Marek
