Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 88BE238B66D
	for <lists+linux-leds@lfdr.de>; Thu, 20 May 2021 20:59:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234999AbhETTBB (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 20 May 2021 15:01:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:41508 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234486AbhETTBA (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Thu, 20 May 2021 15:01:00 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id A366561244;
        Thu, 20 May 2021 18:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621537179;
        bh=3BaK/cYYLGQ2PCZfTfAkpx90yLmHedYxUfpazbxgnDU=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=ZAweZH/75wJWmfL+hTxEQmbv7U2lX1HRvgtlwOrEJs/HSrknG8Qck71tcPMXiJPa8
         85SRCo+4TCgOIkBP6uSIxbfmPjrccgy84eEfgqWl8+tAXMq2xHiyWyvhKSg2TeJwv0
         oHJ7fuI1ByIvoZS6GwTCc7XRIGRPuqwowzPpZgITFPmyKB2XfWSYGnDi8wayhpy1xT
         OXCSDZ1rgq5SVv1qRlsKXhhgczFeOjX2pTf3tmwrK7EcgbZH80c0IOfoo+asdjbP+2
         Ykc8JHrS8YQupZZxLzVc/MyB84T7Z/VxZjvFfO5EctVOyljSaEEtWEAssF17eWjac6
         IdiD6zKS498Ew==
Date:   Thu, 20 May 2021 20:59:33 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Marek =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>,
        linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Pavel Machek <pavel@ucw.cz>, gregkh@linuxfoundation.org
Subject: Re: [PATCH v2 16/17] leds: leds-nuc: add support for changing the
 ethernet type indicator
Message-ID: <20210520205933.3cfc57a9@coco.lan>
In-Reply-To: <20210520183633.084a8c3f@thinkpad>
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
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Em Thu, 20 May 2021 18:36:33 +0200
Marek Beh=C3=BAn <kabel@kernel.org> escreveu:

> On Thu, 20 May 2021 18:00:28 +0200
> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
>=20
> > Em Thu, 20 May 2021 13:00:14 +0200
> > Marek Beh=C3=BAn <marek.behun@nic.cz> escreveu:
> >  =20
> > > On Wed, 19 May 2021 20:30:14 +0200
> > > Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
> > >    =20
> > > > Em Wed, 19 May 2021 17:55:03 +0200
> > > > Marek Beh=C3=BAn <kabel@kernel.org> escreveu:
> > > >      =20
> > > > > On Wed, 19 May 2021 16:24:13 +0200
> > > > > Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
> > > > >        =20
> > > > > > On other words, if no extra care is taken, it could have bad si=
de=20
> > > > > > effects at the machine's performance and affect system's latenc=
y,
> > > > > > eventually resulting on things like audio clicks and pops, if s=
ome
> > > > > > audio is playing while such calls keep happening.         =20
> > > > >=20
> > > > > In general we want for every LED that is registered into kernel as
> > > > > a LED classdev to be possible to control the brightness by
> > > > > software. If the hardware supports it, it should be available.   =
     =20
> > > >=20
> > > > This is supported, but maybe not the same way as on other drivers.
> > > >=20
> > > > There are two separate things: ON/OFF and LED brightness, when turn=
ed
> > > > ON.
> > > >=20
> > > > On other words, NUC leds allow to set the brightness ranging from 0
> > > > to 100, but if the brightness is, let's say 50%, it means that, when
> > > > the LED is triggered by the hardware:
> > > >=20
> > > > 	- ON would mean 50%; and=20
> > > > 	- OFF would mean 0%.     =20
> > >=20
> > > Not a problem, there are other controller which also work this way,
> > > leds-turris-omnia for example.    =20
> >=20
> > OK.
> >  =20
> > > Also LED triggers are supposed to work
> > > this way: if a LED supports non-binary brightness (for exmaple 0-100),
> > > and the user sets brightness 50, and then a trigger, then the trigger
> > > should blink the LED with brightness 50.
> > >    =20
> > > > On other words, it actually adjusts the maximum brightness level.
> > > >=20
> > > > Btw, this also applies to software control, as the hardware can sti=
ll
> > > > blink the LED, the available properties for software control indica=
tor
> > > > are:
> > > > 	- brightness.
> > > > 	- blink behavior and frequency;
> > > > 	- led color (available only if BIOS says that it is a=20
> > > > 	  multi-colored led);     =20
> > >=20
> > > - if the hw supports setting the LED to blink with a specific frequen=
cy
> > >   (not depending on any other HW like disk or ethernet, just blinking=
),
> > >   you should also implement the .blink_set method (look at
> > >   Documentation/leds/leds-class.rst section Hardware accelerated blink
> > >   of LEDs)   =20
> >=20
> > Ok.
> >=20
> > How the blink pattern is specified? NUC supports 3 different
> > patterns (breathing, pulsing, strobing).
> >  =20
> > > - if BIOS says the LED is multi-colored, you should register it as
> > >   multi-colored LED via multicolor framework   =20
> >=20
> > Ok. I'll check how much work this will lead after we finish the API
> > discussions, as all sysfs attributes that won't fit at the triggers
> > will need to be implemented twice - one for mono-colored and another one
> > for multicolored, as the priv pointer will use different structures.
> >  =20
> > > > The exported attributes:
> > > >=20
> > > > 	static struct attribute *netdev_trig_attrs[] =3D {
> > > > 		&dev_attr_device_name.attr,
> > > > 		&dev_attr_link.attr,
> > > > 		&dev_attr_rx.attr,
> > > > 		&dev_attr_tx.attr,
> > > > 		&dev_attr_interval.attr,
> > > > 		NULL
> > > > 	};
> > > > 	ATTRIBUTE_GROUPS(netdev_trig);
> > > >=20
> > > > also won't apply, as the NUC API doesn't support setting device_nam=
e,=20
> > > > RX, TX, link or interval.
> > > >=20
> > > > Instead, it allows to set:
> > > > - the maximum brightness;
> > > > - the color (if the LED is multi-colored);
> > > > - the physical port(s) that will be monitored:
> > > > 	- LAN1
> > > > 	- LAN2
> > > > 	- LAN1+LAN2
> > > >=20
> > > > where LAN1 and LAN2 are two physical ports behind the NUC device.
> > > > The netdev layer knows those as "eno1" and "enp5s0" (not=20
> > > > necessarily at the same order).     =20
> > >=20
> > > The only problem I see with trigger_data in this case is that only one
> > > netdevice can be set, while your LED can be configured to blink on
> > > activity on two netdevices.
> > >=20
> > > Otherwise all these settings are relevant.
> > > What your driver offload callback should do (once HW offloading of LED
> > > triggers is merged) is this:
> > >   - the offload method is called by the netdev trigger
> > >   - the offload method looks at the trigger_data structure. This
> > >     contains settings rx, tx, link, interval, device_name/device. If =
the
> > >     device_name is "eno1" or "end5s0" (or better, if the device points
> > >     to one of the 2 netdevices that are supported by the HW), and if
> > >     the rx, tx, link and interval parameters are configured to values
> > >     that can be done by the LED controller, than put the LED into HW
> > >     controlled state (to blink with these parameters on network
> > >     activity on that netdevice) and return 0
> > >   - otherwise the offload method should return -EOPNOTSUPP, and the
> > >     netdev trigger will know that the requested settings are not
> > >     supported by the HW, and the netdev trigger will blink the LED in
> > >     SW   =20
> >=20
> > See, there's nothing that the driver can possible do with
> > rx, tx, link, interval, device_name/device, as the the BIOS allows
> > to set to "LAN1", "LAN2" or "LAN1+LAN2". the WMI interface doesn't
> > provide *any* information about what LAN1 means. =20
>=20
> On the contrary, there is something the driver can do with these
> attributes. If the specific combination is not supported, the driver
> should return -EOPNOTSUPP in the trigger_offload method and let the
> netdev trigger do the work in software.=20

Letting netdev to trigger is something we don't want to allow, as this
can cause side effects, making it doing slow the system due to BIOS calls
for no good reason.

> What exactly do the LEDs do
> when configured to blink on activity on a network device? Do they just
> blink on RX/TX, and otherwise are off?  Or are they on when a cable is
> plugged, blink on rx/tx and otherwise off?

They are on when a cable is plugged, blink on rx/tx and otherwise off.

Worth mentioning that, besides the LEDs controlled by this driver, each
RJ-45 port also a couple leds that behave just like normal RJ-45 ones:=20
a yellow led for Ethernet PHY detection and a green one for traffic.

>=20
> >
> > In the case of my NUC, there are even two different drivers:
> >=20
> > 	00:1f.6 Ethernet controller: Intel Corporation Ethernet Connection (2)=
 I219-LM (rev 31)
> > 	Kernel modules: e1000e
> >=20
> > 	05:00.0 Ethernet controller: Intel Corporation I210 Gigabit Network Co=
nnection (rev 03)
> > 	Kernel modules: igb
> >=20
> > So, even the probing order can be different after a reboot.
> >
> > So, there isn't a portable way to tell if LAN1 means to either
> > "eno1" or "end5s0"(*), as netdev and the associated net drivers
> > talk with the hardware directly, and not via BIOS. So, the BIOS
> > internal name is not known. Even the DMI tables don't tell it:
> >=20
> > 	Handle 0x000F, DMI type 8, 9 bytes
> > 	Port Connector Information
> > 	        Internal Reference Designator: CON4501
> > 	        Internal Connector Type: None
> > 	        External Reference Designator: LAN
> > 	        External Connector Type: RJ-45
> > 	        Port Type: Network Port
> > =09
> > 	Handle 0x0010, DMI type 8, 9 bytes
> > 	Port Connector Information
> > 	        Internal Reference Designator: CON4401
> > 	        Internal Connector Type: None
> > 	        External Reference Designator: LAN
> > 	        External Connector Type: RJ-45
> > 	        Port Type: Network Port
> >=20
> > (*)  I'm using the interface names on this specific model, but
> >      I'm pretty sure other models will have different names
> >      and will even use different network drivers. =20
>=20
> Have you looked into DSDT and SSDT tables?

It doesn't help.

	# ./generate/unix/bin/acpidump -b
	# for i in *.dat; do
	#	./generate/unix/bin/iasl -d $i
	# done

	$ grep -i lan *dsl
	dsdt.dsl:            \_SB.PCI0.GLAN.GPEH ()
	dsdt.dsl:        Device (GLAN)
	dsdt.dsl:                    Notify (GLAN, 0x02) // Device Wake
	dsdt.dsl:                    _HID =3D "ELAN2097"
	dsdt.dsl:            Name (_MLS, Package (0x01)  // _MLS: Multiple Languag=
e String

> > The point is, while the current netdev trigger API can be generic
> > enough when the LED is controlled by netdev, it is *not*
> > generic enough to cover the case where it is trigged by the
> > firmware, as the information exposed by the firmware can be
> > (and it is on this case) completely different than what netdev
> > exposes. =20
>=20
> If even DSDT data is not enough to reliably find out which of the 2
> network interfaces belongs to which LED setting, the worst case scenario
> here is for your driver to need to have a list containing this
> information for specific motherboards, and other people can then extend
> the driver to support their motherboards as well.

Needing something like that sucks and it is hard to maintain,
and depends on people reporting issues.

Ok, on some cases, there are no other options, but this is not
the case here, as the user of such API that wants to monitor
just a single interface (default is to monitor both) can easily=20
ask the driver to monitor LAN1. If it doesn't work, switch to LAN2.

That's a way more elegant than adding some guessing code that
would be checking for the machine codes, eventually printing
a warning and disabling support for monitoring LAN when the
machine is not properly identified.

Also, implementing such table can be painful. I can't see an
easy way to implement it, specially without having any information
about how all other models that support the WMI API are shipped,
and how to map "LAN1", "LAN2" into something that matches netdev
detection. OK, if each one have a different BUS ID,
a mapping table could associate each one with a different BUS
ID, and then some logic at netdev would convert BUS ID into
the device name.

> > > > Also, while netdev trigger seems to use just one device name,
> > > > the NUC allows to monitor both interfaces at the same time.     =20
> > >=20
> > > Yes. This can be solved in the future by extending netdev trigger to
> > > support blinking on activity on multiple netdevices. I also thought
> > > about this for use with another HW (mv88e6xxx switch).
> > >    =20
> > > > See, unfortunately I can't see a common API that would fit
> > > > nicely on both cases.     =20
> > >=20
> > > Well I can.   =20
> >=20
> > Then the API needs to change, in order to allow to abstract from
> > netdev-centric view of Ethernet interfaces. Or, instead, some
> > other trigger is needed for firmware-controlled events. =20
>=20
> No. If the necessary information for determining which network
> interface pairs to LED1 and which to LED2 cannot be reliably determined
> from ACPI tables, then IMO the driver should specify this information
> for each motherboard that wants to use this feature.

What's the gain of adding such extra complexity to the driver?

All the user wants is to blink a led only for one of the LAN ports.

Denying it and using a more complex API doesn't make much sense, IMO.

> > -
> >=20
> > One thing that it is not clear to me: let's say that the LED
> > called "front1" is currently handling Ethernet events, but
> > the user wants to use, instead, the "front2" LED, disabling
> > the "front1" one (or using for another event, like wifi, which
> > is not monitored on BIOS default).
> >=20
> > How this can be done using the trigger's API? =20
>=20
> cd /sys/class/leds/front1
> echo none >trigger
> cd /sys/class/leds/front2
> echo netdev >trigger

Clear enough to me.

> echo ifname >device_name
> echo 1 >rx
> echo 1 >tx

And that's the part that it makes no sense for this hardware ;-)

It can't identify RX/TX in separate. It can only monitor both RX and TX at
the same time.

So, for this specific device, neither "rx", "tx" or "interval"
attributes should be shown.

Provided that we could use the Ethernet label as "device_name", this
would work:

  echo "LAN1+LAN2" > device_name
  echo "LAN1" > device_name
  echo "LAN2" > device_name

or, in order to avoid confusion, we could use a different name on
this specific driver, like:

  echo "LAN1+LAN2" > port_name
  echo "LAN1" > port_name
  echo "LAN2" > port_name

FYI, the default (LAN1+LAN2) is usually good enough for most use
cases, for a couple of reasons:

	- I guess only high end models have more than one Eth port;
	- Most people use just one LAN cable;
	- the back panel leds at the RJ45 are enough to check if
	  ethernet signal was detected.

Yet, at least for me, having the NUC led monitoring eth is interesting,
as here I use the LAN ports to connect with some testing hardware.

So, when the LED is on, it means that my hardware is turned on and
the Ethernet connection should be working.


Thanks,
Mauro
