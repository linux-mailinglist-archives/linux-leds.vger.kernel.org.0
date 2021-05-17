Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB17438262E
	for <lists+linux-leds@lfdr.de>; Mon, 17 May 2021 10:05:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232919AbhEQIGr (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 17 May 2021 04:06:47 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:58736 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229736AbhEQIGp (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 17 May 2021 04:06:45 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id B35941C0B79; Mon, 17 May 2021 10:05:27 +0200 (CEST)
Date:   Mon, 17 May 2021 10:05:27 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     gregkh@linuxfoundation.org, linuxarm@huawei.com,
        mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
        linux-leds@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH 17/17] staging: nuc-led: update the TODOs
Message-ID: <20210517080527.GA18642@amd>
References: <cover.1621161037.git.mchehab+huawei@kernel.org>
 <f23fed6a89f66564f5af52f241016a4b9823ce04.1621161037.git.mchehab+huawei@kernel.org>
 <20210516182149.GA3666@localhost>
 <20210517083001.7688acd7@coco.lan>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="IJpNTDwzlM2Ie8A6"
Content-Disposition: inline
In-Reply-To: <20210517083001.7688acd7@coco.lan>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--IJpNTDwzlM2Ie8A6
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > > -  Need to validate the uAPI and document it before moving
> > >    this driver out of staging. =20
> >=20
> > >  - Stabilize and document its sysfs interface. =20
> >   =20
> > Would you mind starting with this one?
>=20
> Do you mean writing the ABI document for it? Surely I can do that,
> but I'm not sure where to put such document while it is on staging.

No need for formal ABI just yet, but it needs to be clear what the interface
is.

> > We should have existing APIs
> > for most of functionality described...
>=20
> I tried to stay as close as possible to the existing API, but
> there are some things that required a different one.

I believe it should be possible to move _way_ closer to existing APIs.

> For instance, with WMI rev 0.64 and 1.0, any LED of the device
> can be programmed to be a power indicator.
>=20
> When a LED is programmed this way, there are up to 3 (on rev 1.0) or up
> to 4 (on rev 0.64) different brightness level of the LED, and those
> are associated with a power status (like S0, S3, S5, "ready mode").

I'll need a description how this works.

> 	/sys/class/leds/nuc::front1/
> 	=E2=94=9C=E2=94=80=E2=94=80 blink_behavior
> 	=E2=94=9C=E2=94=80=E2=94=80 blink_frequency

We have timer trigger for these.

> 	=E2=94=9C=E2=94=80=E2=94=80 ethernet_type
> 	=E2=94=9C=E2=94=80=E2=94=80 hdd_default
> 	=E2=94=9C=E2=94=80=E2=94=80 indicator
> 	=E2=94=9C=E2=94=80=E2=94=80 ready_mode_blink_behavior
> 	=E2=94=9C=E2=94=80=E2=94=80 ready_mode_blink_frequency
> 	=E2=94=9C=E2=94=80=E2=94=80 ready_mode_brightness
> 	=E2=94=9C=E2=94=80=E2=94=80 s0_blink_behavior
> 	=E2=94=9C=E2=94=80=E2=94=80 s0_blink_frequency
> 	=E2=94=9C=E2=94=80=E2=94=80 s0_brightness
> 	=E2=94=9C=E2=94=80=E2=94=80 s3_blink_behavior
> 	=E2=94=9C=E2=94=80=E2=94=80 s3_blink_frequency
> 	=E2=94=9C=E2=94=80=E2=94=80 s3_brightness
> 	=E2=94=9C=E2=94=80=E2=94=80 s5_blink_behavior
> 	=E2=94=9C=E2=94=80=E2=94=80 s5_blink_frequency
> 	=E2=94=9C=E2=94=80=E2=94=80 s5_brightness

No. Take a look at triggers; for example hdd monitor should look very
much like existing disk trigger.

> On other words, the "indicator" tells what type of hardware event
> the LED is currently measuring:
>=20
> 	$ cat /sys/class/leds/nuc\:\:front1/indicator=20
> 	Power State  [HDD Activity]  Ethernet  WiFi  Software  Power Limit  Disa=
ble =20

So this will use existing "trigger" infrastructure.

> That should likely be easier to discuss if any changes at the
> ABI would be needed. Before moving it out of staging, I would
> add another one under Documentation/ABI describing the meaning
> of each sysfs node.

Lets get reasonable ABI before moving it _into_ tree, staging or
otherwise.

Best regards,
								Pavel
--=20
http://www.livejournal.com/~pavelmachek

--IJpNTDwzlM2Ie8A6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAmCiI8YACgkQMOfwapXb+vIUoQCfTZBA/7aUYLCij0dzPnB+ZoFC
bJUAoJn12VXrwjrwbPGTlEGAPrzZdEN4
=mabU
-----END PGP SIGNATURE-----

--IJpNTDwzlM2Ie8A6--
