Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 053022E7BF6
	for <lists+linux-leds@lfdr.de>; Wed, 30 Dec 2020 19:49:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726185AbgL3StR (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 30 Dec 2020 13:49:17 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:54436 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726290AbgL3StR (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 30 Dec 2020 13:49:17 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 279931C0B92; Wed, 30 Dec 2020 19:48:19 +0100 (CET)
Date:   Wed, 30 Dec 2020 19:48:18 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Vadim Pasternak <vadimp@nvidia.com>
Cc:     Marek Behun <marek.behun@nic.cz>,
        "jacek.anaszewski@gmail.com" <jacek.anaszewski@gmail.com>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>
Subject: Re: [PATCH led-next 1/1] leds: mlxreg: Allow multi-instantiation of
 same name LED for modular systems
Message-ID: <20201230184818.GB25903@duo.ucw.cz>
References: <20201007142049.02d8c3ba@nic.cz>
 <DM6PR12MB38986A442F12A2DFB5769235AF0B0@DM6PR12MB3898.namprd12.prod.outlook.com>
 <20201008075619.GB32424@amd>
 <DM6PR12MB389877E86421231E18EF7DCDAF0B0@DM6PR12MB3898.namprd12.prod.outlook.com>
 <20201008105550.44fa3165@nic.cz>
 <DM6PR12MB3898D2BDC4AC32036E792548AF0B0@DM6PR12MB3898.namprd12.prod.outlook.com>
 <20201008100508.GA16084@duo.ucw.cz>
 <DM6PR12MB3898258991C6F8C0044B9BBAAF0B0@DM6PR12MB3898.namprd12.prod.outlook.com>
 <20201125112013.GC29328@amd>
 <DM6PR12MB3898A41B55476CD3C659A16DAFFA0@DM6PR12MB3898.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="neYutvxvOLaeuPCA"
Content-Disposition: inline
In-Reply-To: <DM6PR12MB3898A41B55476CD3C659A16DAFFA0@DM6PR12MB3898.namprd12.prod.outlook.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--neYutvxvOLaeuPCA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > > > And yes, if you have some kind of device with a status LED, then you
> > > > can put that into the first card. For example sda::status would be
> > > > accetpable. But cardXX is way too generic.
> > > >
> > > > Perhaps you can explain what "card" is in this context? What is its
> > > > main function?
> > >
> > > I provide support for new modular systems which could be equipped with
> > > the different types of replaceable line cards and management board.
> > > The first type of line card is 16x100GbE QSFP28 Ethernet ports.
> > > It equipped with Lattice CPLD device aimed for system and ASIC
> > > control, Nvidia FPGA, Nvidia gearboxes (PHYs).
> > >
> > > After that we'll have other line cards: 8x200Gbe QSFP28 Eth ports,
> > > 4x400Gbe Eth QSFP-DD, smart cards equipped with Nvidia ARM CPU for
> > > offloading and for fast access to the storage (EBoF).
> > >
> > > For this modular system CPLDs are connected through I2C bus and LED
> > > driver will work over I2C. On main plane CPLD is connected through LP=
C, and
> > LED driver works over LPC.
> > >
> > > Card is common name. But I'd like to avoid some more specific names.
> > >
> > > For example, we have huge InfiniBand modular systems with 800 of IB
> > > 200G and 400G ports, which I didn't have yet in upstream. Those system
> > > have also replaceable line cards (so called leaves) and replaceable f=
abric
> > cards (so called spines).
> > > If I'll give name 'card<bus#>, it will be good also for those systems.
> > > If I'll give more specific name, it'll be not so good name for
> >  > fabric cards.
> >=20
> > Ok, I guess card<something> is best suggestion so far. If it is really =
status for
> > specific PCI card, then that's the right way to name it.
> >=20
> > Maybe "pciecard<>" would be even better.
>=20
> Hi Pavel,
>=20
> Thank you for reply.
>=20
> I'd like to avoid 'pci' in name.
> Line card can be connected to the different kinds of fabric. It could be =
for example
> InfiniBand or NVlink connectivity.
>=20
> Also LED itself is accessed through I2C bus.
>=20
> If you are OK with card<something>, where something in this case is I2C b=
us number,
> I'll send v2 patch with this change.

I'd prefer to have something kind of unique. Not every pcie card has
i2c bus on it. If card is on pcie it would be best to name it as it is
common for pcie. InfiniBand would be named according to ib
conventions, etc...

If that is impossible, I guess we can live with card<something> but...

									Pavel
--=20
http://www.livejournal.com/~pavelmachek

--neYutvxvOLaeuPCA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCX+zLcgAKCRAw5/Bqldv6
8nHlAJ4k2PkuQn05056w3fjLqXGO0Gz+ogCdF02+r/qiA7d1g1fdL3iAymlpHTo=
=/rwQ
-----END PGP SIGNATURE-----

--neYutvxvOLaeuPCA--
