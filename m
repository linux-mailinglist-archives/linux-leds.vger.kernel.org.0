Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C59123AE6D
	for <lists+linux-leds@lfdr.de>; Mon,  3 Aug 2020 22:52:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728662AbgHCUvu (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 3 Aug 2020 16:51:50 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:60408 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728649AbgHCUvt (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 3 Aug 2020 16:51:49 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id F14F21C0BD7; Mon,  3 Aug 2020 22:51:46 +0200 (CEST)
Date:   Mon, 3 Aug 2020 22:51:46 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Eddie James <eajames@linux.ibm.com>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>, Dan Murphy <dmurphy@ti.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        vishwa@linux.ibm.com
Subject: Re: [PATCH v2 2/2] leds: pca955x: Add an IBM software implementation
 of the PCA9552 chip
Message-ID: <20200803205146.GA16295@amd>
References: <20200803145055.5203-1-eajames@linux.ibm.com>
 <20200803145055.5203-3-eajames@linux.ibm.com>
 <CAHp75VevG65uuE4Vv49tSdvpNnxE7AC7W_QR2s8twCPZ=4da_g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="KsGdsel6WgEHnImy"
Content-Disposition: inline
In-Reply-To: <CAHp75VevG65uuE4Vv49tSdvpNnxE7AC7W_QR2s8twCPZ=4da_g@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--KsGdsel6WgEHnImy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon 2020-08-03 19:42:17, Andy Shevchenko wrote:
> On Mon, Aug 3, 2020 at 5:51 PM Eddie James <eajames@linux.ibm.com> wrote:
> >
> > IBM created an implementation of the PCA9552 on a PIC16F
> > microcontroller. The I2C device addresses are different from the
> > hardware PCA9552, so add a new compatible string and associated
> > platform data to be able to probe this device.
>=20
> ...
>=20
> >         pca9550,
> >         pca9551,
> >         pca9552,
> > +       ibm_pca9552,
> >         pca9553,
>=20
> I would rather not mix like this, but use alpha order, for example.
> It's better to read and see which devices are supported by vendor.

Actually I see no huge reason to change that. pca9552 and ibm_pca9552
should be very similar, so it makes sense to keep them close together.
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--KsGdsel6WgEHnImy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl8oeOIACgkQMOfwapXb+vI1FgCdFq9zGGSyXDCSLDWE8Wu/vh7p
0QEAnjfmugf3BC4eK0GYtbFh5hfX4OkE
=Gzw4
-----END PGP SIGNATURE-----

--KsGdsel6WgEHnImy--
