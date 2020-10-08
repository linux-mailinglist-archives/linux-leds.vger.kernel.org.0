Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE28E28704E
	for <lists+linux-leds@lfdr.de>; Thu,  8 Oct 2020 09:57:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728661AbgJHH4q (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 8 Oct 2020 03:56:46 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:57844 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729114AbgJHH4V (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 8 Oct 2020 03:56:21 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 88D5F1C0BA4; Thu,  8 Oct 2020 09:56:20 +0200 (CEST)
Date:   Thu, 8 Oct 2020 09:56:19 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Vadim Pasternak <vadimp@nvidia.com>
Cc:     Marek Behun <marek.behun@nic.cz>,
        "jacek.anaszewski@gmail.com" <jacek.anaszewski@gmail.com>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>
Subject: Re: [PATCH led-next 1/1] leds: mlxreg: Allow multi-instantiation of
 same name LED for modular systems
Message-ID: <20201008075619.GB32424@amd>
References: <20201006165850.17790-1-vadimp@nvidia.com>
 <20201007113105.GE12224@duo.ucw.cz>
 <20201007142049.02d8c3ba@nic.cz>
 <DM6PR12MB38986A442F12A2DFB5769235AF0B0@DM6PR12MB3898.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="TRYliJ5NKNqkz5bu"
Content-Disposition: inline
In-Reply-To: <DM6PR12MB38986A442F12A2DFB5769235AF0B0@DM6PR12MB3898.namprd12.prod.outlook.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--TRYliJ5NKNqkz5bu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > > > It could be more than one instance of LED with the same name in the
> > > > modular systems. For example, "status" or "uid" LED can be located
> > > > on chassis and on each line card of modular system.
> > > > In order to avoid conflicts with duplicated names, append platform
> > > > device Id, which is unquie, to LED name after driver name.
> > > > Thus, for example, "status" LED on chassis is to be called, like it
> > > > is called now on non modular systems, on which platform device Id is
> > > > not
> > > > specified: "mlxreg:status:green". While for the line cards LEDs it
> > > > will be called like: "mlxreg48:status:green",
> > > > "mlxreg66:status:green", etcetera.
> > >
> > > No.
> > >
> > > You really should not have mlxreg: in the LED label. It is useless.
>=20
> 'mlxreg' is device name, which could be CPLD or FPGA.
> It should be in label.

No.

You can try to explain what "mlxreg" means, but...

You can get away with "eth0" as a device name. We should talk about
"switch0" I guess.

> There also few other reasons for that.
>=20
> This name is used in thousands system in the field and
> customers use it in their application.

That may be reason not to change existing names.

> We used to provide our ASIC and CPLD or FPGA logic
> (Verilog) to ODM vendors, which build their own switch
> on top of it and use our drivers. So, the can implement
> additional LED on their switches, not controlled by our
> drivers and device name 'mlxreg' allows to distinct between
> LED objects.
>=20
> Actually name like 'mlxreg48', 'mlxreg56' are yet another
> 'mlxreg' devices with appended physical bus Id.

But noone is currently using mlxreg123 in their applications, so that
part is not going in.

Best regards,

									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--TRYliJ5NKNqkz5bu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl9+xiMACgkQMOfwapXb+vJExwCeO7oBPIZuXG5ZYQ98dA+Jt5SK
0m0AoIgqjoUXiD6/qfPdoxhh7M/z2bjF
=4rgj
-----END PGP SIGNATURE-----

--TRYliJ5NKNqkz5bu--
