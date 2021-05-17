Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D8FD38279C
	for <lists+linux-leds@lfdr.de>; Mon, 17 May 2021 10:57:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235825AbhEQI7M (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 17 May 2021 04:59:12 -0400
Received: from mail.kernel.org ([198.145.29.99]:38052 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235814AbhEQI7K (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Mon, 17 May 2021 04:59:10 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6B86A60FF3;
        Mon, 17 May 2021 08:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621241874;
        bh=9m/fe1F7nVftTCvhOPNyP/Hs24KDdhVB4oKD2tHnvxg=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=pd+f1JMdHcNFzcHWfbN7yeJ9xpro4a6W7LRHMh9Di+o94Oku22LBUstC5lb3ikjHr
         Bbqgf2ImnPRYSYR4XyX4uZotqqaAqQcwZzJcp4ftxYl1DK/XBtCnsaLscLig9L8bm8
         2AFWFjRheqU8K2MyvosBzsA5bKUbi9uXmN5mKbnFFuPwuJ+/UtFGLsSigEMcg4u1he
         8KKcia6wnM3maX3MtnI7r1O4P166RUQWhX4da30fKfqSmkb8Kyjnm4mdETwrGKq9x4
         wnT7JUz7JdtTej4mxrwx9hDMxmAnt7ePJutjrESMZs0h3TzEpTHKFwLBr5Rb2NoZpj
         wIjrKOvsLgEww==
Date:   Mon, 17 May 2021 10:57:49 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     gregkh@linuxfoundation.org, linuxarm@huawei.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
        linux-leds@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH 17/17] staging: nuc-led: update the TODOs
Message-ID: <20210517105749.3180a59c@coco.lan>
In-Reply-To: <20210517080527.GA18642@amd>
References: <cover.1621161037.git.mchehab+huawei@kernel.org>
        <f23fed6a89f66564f5af52f241016a4b9823ce04.1621161037.git.mchehab+huawei@kernel.org>
        <20210516182149.GA3666@localhost>
        <20210517083001.7688acd7@coco.lan>
        <20210517080527.GA18642@amd>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Em Mon, 17 May 2021 10:05:27 +0200
Pavel Machek <pavel@ucw.cz> escreveu:

> Hi!
>=20
> > > > -  Need to validate the uAPI and document it before moving
> > > >    this driver out of staging.   =20
> > >  =20
> > > >  - Stabilize and document its sysfs interface.   =20
> > >   =20
> > > Would you mind starting with this one? =20
> >=20
> > Do you mean writing the ABI document for it? Surely I can do that,
> > but I'm not sure where to put such document while it is on staging. =20
>=20
> No need for formal ABI just yet, but it needs to be clear what the interf=
ace
> is.
>=20
> > > We should have existing APIs
> > > for most of functionality described... =20
> >=20
> > I tried to stay as close as possible to the existing API, but
> > there are some things that required a different one. =20
>=20
> I believe it should be possible to move _way_ closer to existing APIs.
>=20
> > For instance, with WMI rev 0.64 and 1.0, any LED of the device
> > can be programmed to be a power indicator.
> >=20
> > When a LED is programmed this way, there are up to 3 (on rev 1.0) or up
> > to 4 (on rev 0.64) different brightness level of the LED, and those
> > are associated with a power status (like S0, S3, S5, "ready mode"). =20
>=20
> I'll need a description how this works.
>=20
> > 	/sys/class/leds/nuc::front1/
> > 	=E2=94=9C=E2=94=80=E2=94=80 blink_behavior
> > 	=E2=94=9C=E2=94=80=E2=94=80 blink_frequency =20
>=20
> We have timer trigger for these.

Not really. The LED blink behavior is provided by the hardware itself.

The LEDs can blink *even* when the device is suspended or is
hibernating. That's something that a timer trigger can't do ;-)

See below for a draft of the ABI description.

>=20
> > 	=E2=94=9C=E2=94=80=E2=94=80 ethernet_type
> > 	=E2=94=9C=E2=94=80=E2=94=80 hdd_default
> > 	=E2=94=9C=E2=94=80=E2=94=80 indicator
> > 	=E2=94=9C=E2=94=80=E2=94=80 ready_mode_blink_behavior
> > 	=E2=94=9C=E2=94=80=E2=94=80 ready_mode_blink_frequency
> > 	=E2=94=9C=E2=94=80=E2=94=80 ready_mode_brightness
> > 	=E2=94=9C=E2=94=80=E2=94=80 s0_blink_behavior
> > 	=E2=94=9C=E2=94=80=E2=94=80 s0_blink_frequency
> > 	=E2=94=9C=E2=94=80=E2=94=80 s0_brightness
> > 	=E2=94=9C=E2=94=80=E2=94=80 s3_blink_behavior
> > 	=E2=94=9C=E2=94=80=E2=94=80 s3_blink_frequency
> > 	=E2=94=9C=E2=94=80=E2=94=80 s3_brightness
> > 	=E2=94=9C=E2=94=80=E2=94=80 s5_blink_behavior
> > 	=E2=94=9C=E2=94=80=E2=94=80 s5_blink_frequency
> > 	=E2=94=9C=E2=94=80=E2=94=80 s5_brightness =20
>=20
> No. Take a look at triggers; for example hdd monitor should look very
> much like existing disk trigger.

Ok, I'll double-check how this works. Yeah, it would be a way better if
the sysfs nodes could be hidden when changing the indicator type.

For instance, when monitoring disk activity, only those parameters
may be available:

    =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D	=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
    Parameter				Meaning
    =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D	=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
    brightness				Brightness in percent (from 0 to 100)
    color				LED color.
					See :ref:`nuc_color`.
    hdd_default				Default is LED turned ON or OFF.
					When set toOFF, the LED will turn on
					at disk activity.
					When set to ON, the LED will be turned
					on by default, turning off at disk
					activity.
    =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D	=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

(color is only available for multi-colored or RGB leds).

>=20
> > On other words, the "indicator" tells what type of hardware event
> > the LED is currently measuring:
> >=20
> > 	$ cat /sys/class/leds/nuc\:\:front1/indicator=20
> > 	Power State  [HDD Activity]  Ethernet  WiFi  Software  Power Limit  Di=
sable   =20
>=20
> So this will use existing "trigger" infrastructure.

Ok, I will take a look on that. Are there any driver that I could use
as an example, using it in a configurable way?

> > That should likely be easier to discuss if any changes at the
> > ABI would be needed. Before moving it out of staging, I would
> > add another one under Documentation/ABI describing the meaning
> > of each sysfs node. =20
>=20
> Lets get reasonable ABI before moving it _into_ tree, staging or
> otherwise.

I'm enclosing a document that I started to write today, describing the
way the current ABI was designed. The document doesn't describe in
full the NUC6 variant (which is really limited: just two LEDs
with fixed behavior).

Thanks,
Mauro


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Intel NUC WMI LEDs
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Some models of the Intel Next Unit of Computing (NUC) may have programmable
LEDs on its panel via its BIOS. A subset of those may also be programmed on
user space.

There are currently three different APIs on such devices, depending on the
NUC generation:

* NUC 6/7:
  https://www.intel.com/content/www/us/en/support/articles/000023426/intel-=
nuc/intel-nuc-kits.html
* NUC 8/9:
  https://raw.githubusercontent.com/nomego/intel_nuc_led/master/specs/INTEL=
_WMI_LED_0.64.pdf
* NUC 10 and newer:
  https://www.intel.com/content/dam/support/us/en/documents/intel-nuc/WMI-S=
pec-Intel-NUC-NUC10ixFNx.pdf

This document describes how to use the LEDs API, as supported by the "nuc-w=
mi"
driver.

Please notice that the LEDs can only be programmed if the BIOS settings
are allowing the Operational System to control them. Instructions about
how to enable it can be found at the manual of each specific NUC, if
the LEDs are userspace programmed for an specific device.

LED devices
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

When the driver detects NUC LEDs, some sysfs device nodes are created under
the leds class.

On NUC 6, there are (up to) two LEDs available:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D	=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
LED name	sysfs device node
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D	=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Power		``/sys/class/leds/nuc::power``
Ring		``/sys/class/leds/nuc::ring``
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D	=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

The NUC 6 API is limited, as it allows only to change the LED color, and
its blink state. Its API will be described on :ref:`NUC6 API`.

On NUC 8 and newer generations, up to seven LEDs are supported:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D	=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
LED name	sysfs device node
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D	=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Skull		``/sys/class/leds/nuc::skull``
Skull eyes	``/sys/class/leds/nuc::eyes``
Power		``/sys/class/leds/nuc::power``
HDD		``/sys/class/leds/nuc::hdd``
Front1		``/sys/class/leds/nuc::front1``
Front2		``/sys/class/leds/nuc::front2``
Front3		``/sys/class/leds/nuc::front3``
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D	=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

The API for NUC 8 and newer allows full control of the LEDs meaning.

NUC 6 API
=3D=3D=3D=3D=3D=3D=3D=3D=3D

TODO: describe the limited NUC6 API

NUC 8 and newer generations API
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D

On NUC8, and newer, several sysfs nodes will allow to control the
functionality of each LED::

    /sys/class/leds/nuc::front1
    |-- blink_behavior
    |-- blink_frequency
    |-- brightness
    |-- color
    |-- ethernet_type
    |-- hdd_default
    |-- indicator
    |-- max_brightness
    |-- power_limit_scheme
    |-- ready_mode_blink_behavior
    |-- ready_mode_blink_frequency
    |-- ready_mode_brightness
    |-- s0_blink_behavior
    |-- s0_blink_frequency
    |-- s0_brightness
    |-- s3_blink_behavior
    |-- s3_blink_frequency
    |-- s3_brightness
    |-- s5_blink_behavior
    |-- s5_blink_frequency
    `-- s5_brightness

The sessions below will explain the meaning of each aspect of the API.

.. note::

   For the entire NUC8+ API, the following rules apply:

   1. any user can read the LEDs parameter;
   2. changing a LED parameter is limited to the owner of the sysfs device
      nodes (usually, the ``root`` user);
   3. changing a LED parameter is case-insensitive;
   4. The LED ``indicator`` parameter controls the function of the LED.
      All other parameters can be enabled or disabled in runtime, depending
      on it. When a certain parameter is disabled, an error code will be
      returned.

LED indicator
-------------

Despite the LED's name, the LED API may allow them to indicate different
hardware events.

This is controlled via the ``indicator`` device node. Reading from it displ=
ays
all the supported events for a giving LED, and the currently ative one::

    $ cat /sys/class/leds/nuc::front1/indicator
    Power State  [HDD Activity]  Ethernet  WiFi  Software  Power Limit  Dis=
able

Each LED may support the following indicator types:

	=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D	=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
	Indicator type	Meaning
	=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D	=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
	Power State	Shows if the device is powered and what power level
			it is (e. g. if the device is suspended or not, and
			on which kind of suspended level).
	HDD Activity	Indicates if the LED is measuring the hard disk (or
			SDD) activity.
	Ethernet	Indicates the activity Ethernet adapter(s)
	WiFi		Indicates if WiFi is enabled
	Software	Doesn't indicate any hardware level. Instead, the LED
			status is controlled via software.
	Power Limit	Changes the LED color when the computer is throttling
			its power limits.
	Disable		The LED was disabled.
	=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D	=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

In order to change the type of indicator, you should
just write a new value to the indicator type::

    # echo "wifi" > /sys/class/leds/nuc::front1/indicator

    $ cat /sys/class/leds/nuc::front1/indicator
    Power State  HDD Activity  Ethernet  [WiFi]  Software  Power Limit  Dis=
able


Power State parameters
----------------------

When the LED indicator is measuring *Power State*, the following parameters
may be available:

    =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D	=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
    Parameter				Meaning
    =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D	=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
    <power_state>_brightness		Brightness in percent (from 0 to 100)
    <power_state>_blink_behavior	type of blink.
					See :ref:`nuc_blink_behavior`.
    <power_state>_blink_frequency	Blink frequency.
					See :ref:`nuc_blink_behavior`.
    <power_state>_color			LED color
					See :ref:`nuc_color`.
    =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D	=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Where <power_state> can be:

On NUC8/9 API:

    +------------+
    | S0	 |
    +------------+
    | S3	 |
    +------------+
    | S5	 |
    +------------+
    | Ready mode |
    +------------+

On NUC10 API:

    +------------+
    | S0	 |
    +------------+
    | S3	 |
    +------------+
    | Standby	 |
    +------------+

HDD Activity parameters
-----------------------

When the LED indicator is measuring *HDD Activity*, the following parameters
may be available:

    =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D	=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
    Parameter				Meaning
    =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D	=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
    brightness				Brightness in percent (from 0 to 100)
    color				LED color.
					See :ref:`nuc_color`.
    hdd_default				Default is LED turned ON or OFF.
					When set toOFF, the LED will turn on
					at disk activity.
					When set to ON, the LED will be turned
					on by default, turning off at disk
					activity.
    =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D	=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Ethernet parameters
-------------------

When the LED indicator is measuring *Ethernet*, the following parameters
may be available:

    =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D	=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
    Parameter				Meaning
    =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D	=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
    brightness				Brightness in percent (from 0 to 100)
    color				LED color.
					See :ref:`nuc_color`.
    ethernet_type			What Ethernet interface is monitored.
					Can be:
					LAN1, LAN2 or LAN1+LAN2.
    =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D	=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Power limit parameters
----------------------

When the LED indicator is measuring *Power limit*, the following parameters
may be available:

    =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D	=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
    Parameter				Meaning
    =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D	=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
    brightness				Brightness in percent (from 0 to 100)
    color				LED color.
					See :ref:`nuc_color`.
    power_limit_scheme			Indication scheme can be either:
					- green to red
					- single color
    =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D	=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D


.. nuc_color::

NUC LED colors
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

The NUC LED API may support 3 types of LEDs:

- Mono-colored LEDs;
- Dual-colored LEDs;
- multi-colored LEDs (only on NUC6/7);
- RGB LEDs.

Also, when a let is set to be a *Power limit* indicator, despite the
physical device's LED color, the API may limit it to be a led that
can display only green and red, or just a single color.

The ``color`` and ``<power_state>_color`` parameter supports all those
different settings.


NUC6/7
------

On NUC6 API, the power LED color can be:

    +---------+
    | disable |
    +---------+
    | blue    |
    +---------+
    | amber   |
    +---------+

And the ring LED color can be:

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

NUC 8 and newer generations
---------------------------

On NUC10 API, the color can be:

    =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D	=3D=3D=3D=3D=3D=3D	=3D=3D=3D=3D=3D=
	=3D=3D=3D=3D=3D
    Color name		Red	Green	Blue
    =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D	=3D=3D=3D=3D=3D=3D	=3D=3D=3D=3D=3D=
	=3D=3D=3D=3D=3D
    blue		0	0	255
    amber		255	191	0
    white		255	255	255
    red			255	0	0
    green		0	255	0
    yellow		255	255	0
    cyan		0	255	255
    magenta		255	0	255
    <r>,<g>,<b>		<r>	<g>	<b>
    =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D	=3D=3D=3D=3D=3D=3D	=3D=3D=3D=3D=3D=
	=3D=3D=3D=3D=3D

The color parameter will refuse to set a LED on a color that it is not
supported by the hardware or when the setting is incompatible with the
indicator type. So, when the indicator is set to *Power limit*, and
the  ``power_limit_scheme`` is set to ``green to red``, it doesn't
let to set the LED's color.

On the other hand, the behavior is identical if a color is written using
the color's name or its RGB value.

So::

   $ cat /sys/class/leds/nuc::front1/color
   red
   # echo "green" > /sys/class/leds/nuc::front1/color
   $ cat /sys/class/leds/nuc::front1/color
   green
   # echo "255,0,0" > /sys/class/leds/nuc::front1/color
   $ cat /sys/class/leds/nuc::front1/color
   red

.. nuc_blink_behavior::

NUC Blink behavior
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

The NUC LEDs hardware supports the following types of blink behavior:

    +------------+
    | Solid      |
    +------------+
    | Breathing  |
    +------------+
    | Pulsing    |
    +------------+
    | Strobing   |
    +------------+
   =20
Changing the blink behavior will change how the led will be turning
on and off when blinking. Setting it to ``Solid`` disables blinking.

Please notice that not all types of indicator supports blinking.

When blinking, the blink frequency can be changed via ``blink_frequency``
or ``<power_state>_blink_frequency``, depending on the indicator.

Setting it allows to change the blink frequency in Hz, ranging from 0.1 Hz
to 1.0 Hz.


