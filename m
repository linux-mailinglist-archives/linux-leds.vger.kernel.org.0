Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3EC5E389569
	for <lists+linux-leds@lfdr.de>; Wed, 19 May 2021 20:30:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231381AbhESSbu (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 19 May 2021 14:31:50 -0400
Received: from mail.kernel.org ([198.145.29.99]:38340 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230429AbhESSbt (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Wed, 19 May 2021 14:31:49 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0F37A61073;
        Wed, 19 May 2021 18:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621449029;
        bh=Fnxqszf74YyzkFDZnfpLU0ldlXlO3H2Au0hOt4w+wls=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=SiBH1aSLOnNtafQoGQj/5d89ef3OxFO/tYTXZoVyOYmRMUIG93UCM1XeDM3ueHozQ
         UT+OXAdQ10eGMFZ7M6v3nA2C32a8Aa032YlX+URkITpXdxmPCPT8hNAU2o8widiYDv
         5fdlkU3RZUKcCNpNtcPNG0cZra6aGZXrRBaqFsfJxrKoT96bdbEyjYJ28tvu1lv88B
         dtK6PYhcCYHbCvW8nUvNqq16pFNamacqqKj9XwBWJ5UdvwwLKhl+XpKDWJnnEhiwcC
         M/3N2gzx3fY0unrQmAGytlWGJrlrOw0uXPc6oCn57EKVHVQ6J8MoECaTPsNTuO5vD1
         J1lM8CmthaBRQ==
Date:   Wed, 19 May 2021 20:30:14 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Marek =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Pavel Machek <pavel@ucw.cz>, gregkh@linuxfoundation.org,
        linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
Subject: Re: [PATCH v2 16/17] leds: leds-nuc: add support for changing the
 ethernet type indicator
Message-ID: <20210519203014.1838de3a@coco.lan>
In-Reply-To: <20210519175503.567e6ecc@thinkpad>
References: <cover.1621349813.git.mchehab+huawei@kernel.org>
        <792598f4a1a3219b6517057c92559b0f0a95b419.1621349814.git.mchehab+huawei@kernel.org>
        <20210519100253.49b155e9@thinkpad>
        <20210519121812.4285b3ea@coco.lan>
        <20210519141102.0161a9d9@thinkpad>
        <20210519162413.4feeab02@coco.lan>
        <20210519175503.567e6ecc@thinkpad>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Em Wed, 19 May 2021 17:55:03 +0200
Marek Beh=C3=BAn <kabel@kernel.org> escreveu:

> On Wed, 19 May 2021 16:24:13 +0200
> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
>=20
> > On other words, if no extra care is taken, it could have bad side=20
> > effects at the machine's performance and affect system's latency,
> > eventually resulting on things like audio clicks and pops, if some
> > audio is playing while such calls keep happening. =20
>=20
> In general we want for every LED that is registered into kernel as a LED
> classdev to be possible to control the brightness by software. If the
> hardware supports it, it should be available.=20

This is supported, but maybe not the same way as on other drivers.

There are two separate things: ON/OFF and LED brightness, when turned ON.

On other words, NUC leds allow to set the brightness ranging from 0 to 100,
but if the brightness is, let's say 50%, it means that, when the LED
is triggered by the hardware:

	- ON would mean 50%; and=20
	- OFF would mean 0%.

On other words, it actually adjusts the maximum brightness level.

Btw, this also applies to software control, as the hardware can still
blink the LED, the available properties for software control indicator
are:
	- brightness.
	- blink behavior and frequency;
	- led color (available only if BIOS says that it is a=20
	  multi-colored led);

> There is a _blocking
> .brightness_set_blocking callback for LEDs which may block when setting
> brightness.
> But even if we did not want to support software control, the transparent
> trigger offloading is still relevant. See below.
>=20
> > So, IMO, there's very little sense on trying to re-implement the
> > already existing hardware-controlled events via software emulation. =20
>=20
> We have a misunderstanding here, probably because of my bad
> explanation, I will try to clarify.
>=20
> > Sorry, but I guess I missed something here. Are you meaning to use
> > the code under "ledtrig-netdev.c" or something else?=20
> >=20
> > The code at ledtrig-netdev.c allocates a trigger data, initializes a
> > spin lock, initializes a delayed work, registers a notifier, sets a=20
> > trigger interval, etc. It is perfectly fine for software-controlled
> > LEDs, but none of those will ever be used by the NUC driver,=20
> > if it only implements HW blinking for the Ethernet interfaces
> > (and, as said before, there's little sense emulating it via software
> > on such devices). =20
>=20
> The idea of transparent offloading of LED triggers to HW (if HW
> supports it) is to have a consistent and unified interface.

Makes sense, but not sure if the current API will work.

> Currently we have a driver (leds-ns2 I think) which allows putting the
> LED into HW controlled mode (to blink on SATA disk activity). This is
> done by writing 1 into /sys/class/leds/<LED>/sata.
>=20
> In your proposal you are creating several sysfs files:
>   indicator
>   hdd_default (notice difference from "sata" sysfs file in leds-ns2
>                driver)
>   ethernet_type
>=20
> So the problem here is that this API is not unified. This is different
> from how leds-ns2 driver does this, and both of these solutions are
> wrong, because they are not extendable.

Partially agreed, but I'm not so sure if the reverse is not true ;-)

I mean, the current LED API was designed and tested on drivers that
allow direct control of the LED (and then extended to some cases
where the hardware allows offloading).

The NUC API is just the opposite: there, the BIOS has full control of
the hardware, but it provides an interface that allows changing
the LED behavior, up to some extend. It also allows controlling the
LED hardware and make it blink while it is suspended/hibernating,=20
which is something that a direct LED control wouldn't allow.

So, for instance, if we stick with the current LED API, there's no
way to tell that the power LED should:

	- blink on every 5 seconds, using up to 20% of brightness
	  when the system is suspended;
	- strobe on every 10 seconds using up to 50% of brightness
	  when the system is hibernated;
	- use 100% of brigntness and don't blink when powered up.

> The correct way to do this is via LED triggers, i.e. if I want a LED to
> blink on network activity, then I should use netdev trigger and nothing
> else. The netdev trigger should determine whether the underlying LED
> driver can set the LED to blink on network activity in HW. If HW
> supports it, netdev trigger should use this, otherwise netdev trigger
> should blink the LED in software.

I understand the desire of exposing the same API, but the current
trigger code doesn't seem to be fit. I mean, the init sequence
done at netdev_trig_activate():

	trigger_data =3D kzalloc(sizeof(struct led_netdev_data), GFP_KERNEL);
	if (!trigger_data)
		return -ENOMEM;

	spin_lock_init(&trigger_data->lock);

	trigger_data->notifier.notifier_call =3D netdev_trig_notify;
	trigger_data->notifier.priority =3D 10;

	INIT_DELAYED_WORK(&trigger_data->work, netdev_trig_work);

	trigger_data->led_cdev =3D led_cdev;
	trigger_data->net_dev =3D NULL;
	trigger_data->device_name[0] =3D 0;

	trigger_data->mode =3D 0;
	atomic_set(&trigger_data->interval, msecs_to_jiffies(50));
	trigger_data->last_activity =3D 0;

	led_set_trigger_data(led_cdev, trigger_data);

	rc =3D register_netdevice_notifier(&trigger_data->notifier);
	if (rc)
		kfree(trigger_data);

doesn't make sense when the LED will be trigged by the hardware,
and registering a notifier for netdevice is overkill.

The exported attributes:

	static struct attribute *netdev_trig_attrs[] =3D {
		&dev_attr_device_name.attr,
		&dev_attr_link.attr,
		&dev_attr_rx.attr,
		&dev_attr_tx.attr,
		&dev_attr_interval.attr,
		NULL
	};
	ATTRIBUTE_GROUPS(netdev_trig);

also won't apply, as the NUC API doesn't support setting device_name,=20
RX, TX, link or interval.

Instead, it allows to set:
- the maximum brightness;
- the color (if the LED is multi-colored);
- the physical port(s) that will be monitored:
	- LAN1
	- LAN2
	- LAN1+LAN2

where LAN1 and LAN2 are two physical ports behind the NUC device.
The netdev layer knows those as "eno1" and "enp5s0" (not=20
necessarily at the same order).

Also, while netdev trigger seems to use just one device name,
the NUC allows to monitor both interfaces at the same time.

See, unfortunately I can't see a common API that would fit
nicely on both cases.

> Currently the netdev trigger does the blinking in software only
> (code in "ledtrig-netdev.c" file). There is a WIP to add the necessary
> support for the netdev trigger to have the ability to offload blinking
> to HW. I will try to respin this WIP and send patches for review.
>=20
> Once netdev trigger supports this feature, you can implement your
> driver in this way. You can even make your driver depend on netdev
> trigger=20

> and set the specific LED into netdev triggering by default, and
> even forbidding anything else.=20

This is also probably one of the differences from other hardware:
In principle, *any* led can monitor *any* hardware event[1].

[1] There are some bitmaps at the interface that would allow the
    BIOS to restrict it, but, at least on the device I have
    (Hades Canyon), there's no such restriction: the same bitmap
    masks are returned for all LEDs.

> But this is the corrent way to do this,
> instead of creating new sysfs API that is non-extendable.
>=20
> I am sorry that I did not explain this thoroughly in previous mails.
> Hopefully this explanation is better.

Yes, it is a lot better. Thanks for the explanation!

Still, as I pointed above, I'm so far unable to see much in common=20
with the way the existing LED drivers work and the way NUC LEDS are
controlled.

So, as much I would love to just reuse something that already exists,
perhaps it would make more sense to create a separate class for such
kind of usage.

>=20
> Marek
>=20
> PS: This is relevant for disk activity as well.



Thanks,
Mauro
