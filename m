Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D9CC52C3EEE
	for <lists+linux-leds@lfdr.de>; Wed, 25 Nov 2020 12:20:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726316AbgKYLUR (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 25 Nov 2020 06:20:17 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:39062 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726162AbgKYLUR (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 25 Nov 2020 06:20:17 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id A352D1C0B7D; Wed, 25 Nov 2020 12:20:14 +0100 (CET)
Date:   Wed, 25 Nov 2020 12:20:13 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Vadim Pasternak <vadimp@nvidia.com>
Cc:     Marek Behun <marek.behun@nic.cz>,
        "jacek.anaszewski@gmail.com" <jacek.anaszewski@gmail.com>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>
Subject: Re: [PATCH led-next 1/1] leds: mlxreg: Allow multi-instantiation of
 same name LED for modular systems
Message-ID: <20201125112013.GC29328@amd>
References: <20201006165850.17790-1-vadimp@nvidia.com>
 <20201007113105.GE12224@duo.ucw.cz>
 <20201007142049.02d8c3ba@nic.cz>
 <DM6PR12MB38986A442F12A2DFB5769235AF0B0@DM6PR12MB3898.namprd12.prod.outlook.com>
 <20201008075619.GB32424@amd>
 <DM6PR12MB389877E86421231E18EF7DCDAF0B0@DM6PR12MB3898.namprd12.prod.outlook.com>
 <20201008105550.44fa3165@nic.cz>
 <DM6PR12MB3898D2BDC4AC32036E792548AF0B0@DM6PR12MB3898.namprd12.prod.outlook.com>
 <20201008100508.GA16084@duo.ucw.cz>
 <DM6PR12MB3898258991C6F8C0044B9BBAAF0B0@DM6PR12MB3898.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="tqI+Z3u+9OQ7kwn0"
Content-Disposition: inline
In-Reply-To: <DM6PR12MB3898258991C6F8C0044B9BBAAF0B0@DM6PR12MB3898.namprd12.prod.outlook.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--tqI+Z3u+9OQ7kwn0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > And yes, if you have some kind of device with a status LED, then you ca=
n put
> > that into the first card. For example sda::status would be accetpable. =
But
> > cardXX is way too generic.
> >=20
> > Perhaps you can explain what "card" is in this context? What is its main
> > function?
>=20
> I provide support for new modular systems which could be equipped with the
> different types of replaceable line cards and management board.
> The first type of line card is 16x100GbE QSFP28 Ethernet ports.
> It equipped with Lattice CPLD device aimed for system and ASIC control, N=
vidia FPGA,
> Nvidia gearboxes (PHYs).
>=20
> After that we'll have other line cards: 8x200Gbe QSFP28 Eth ports, 4x400G=
be Eth QSFP-DD,
> smart cards equipped with Nvidia ARM CPU for offloading and for fast acce=
ss to the storage
> (EBoF).
>=20
> For this modular system CPLDs are connected through I2C bus and LED drive=
r will work
> over I2C. On main plane CPLD is connected through LPC, and LED driver wor=
ks over LPC.
>=20
> Card is common name. But I'd like to avoid some more specific names.
>=20
> For example, we have huge InfiniBand modular systems with 800 of IB 200G =
and 400G
> ports, which I didn't have yet in upstream. Those system have also replac=
eable line cards
> (so called leaves) and replaceable fabric cards (so called spines).
> If I'll give name 'card<bus#>, it will be good also for those systems.
> If I'll give more specific name, it'll be not so good name for
 > fabric cards.

Ok, I guess card<something> is best suggestion so far. If it is really
status for specific PCI card, then that's the right way to name it.

Maybe "pciecard<>" would be even better.

Plus we really should have documentation somewhere so that next
person trying to name a LED on a card ends up with same answer.

> I can use name 'fru' instead of 'card' which is standard name and stands =
for
> 'Filed Replicable Unit'. Such name will be good for line cards, for fabri=
c cards,
> for power units, FANs etcetera.

Best regards,

									Pavel
--=20
http://www.livejournal.com/~pavelmachek

--tqI+Z3u+9OQ7kwn0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl++Pe0ACgkQMOfwapXb+vIwLwCghocT97Vk8R5znKAzixkE3RG8
5tAAoJDda9ogZCDY5kQ4OAmE2zxYoIj/
=VgXo
-----END PGP SIGNATURE-----

--tqI+Z3u+9OQ7kwn0--
