Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1129D14FC7
	for <lists+linux-leds@lfdr.de>; Mon,  6 May 2019 17:15:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725994AbfEFPPC (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 6 May 2019 11:15:02 -0400
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:47578 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726268AbfEFPPC (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 6 May 2019 11:15:02 -0400
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
        id 9FFDA8016C; Mon,  6 May 2019 17:14:49 +0200 (CEST)
Date:   Mon, 6 May 2019 17:15:01 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Dan Murphy <dmurphy@ti.com>
Cc:     Christian Mauderer <oss@c-mauderer.de>, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH v3 2/2] leds: spi-byte: add single byte SPI LED driver
Message-ID: <20190506151500.GA6221@amd>
References: <20190505200022.32209-1-oss@c-mauderer.de>
 <20190505200022.32209-2-oss@c-mauderer.de>
 <8c150278-4bf6-4202-998e-4d82a2a3cd3c@ti.com>
 <3f0d7a10-a67e-a2c2-98fe-a487493b8f2c@c-mauderer.de>
 <fb0bc2a0-1311-3a45-04db-5cddcba48392@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="k1lZvvs/B4yU6o8G"
Content-Disposition: inline
In-Reply-To: <fb0bc2a0-1311-3a45-04db-5cddcba48392@ti.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--k1lZvvs/B4yU6o8G
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > Of course it would have been possible to make it a lot more universal by
> > for example adding a prefix, a bit mask or other word lengths. But that
> > would have added a lot of complexity without any actual application.
> >=20
>=20
> I have to disagree here.  If this is supposed to be a universal SPI byte =
driver that
> needs special handling then it is either needs to be created in a univers=
al way or needs to be made
> target specific.
>=20

Let him be. The driver is good.

If some hardware needs more flexibility, we add it.

No need to have 1000 releases of everything.

									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--k1lZvvs/B4yU6o8G
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlzQT3QACgkQMOfwapXb+vIUQgCgqTn5AYU9YSSXR5GbdZp//ket
A1gAmwVcwMLdTNaim26kjCnfYzhgCFqx
=Rv6L
-----END PGP SIGNATURE-----

--k1lZvvs/B4yU6o8G--
