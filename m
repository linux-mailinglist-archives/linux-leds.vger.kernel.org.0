Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8E84BD5604
	for <lists+linux-leds@lfdr.de>; Sun, 13 Oct 2019 13:45:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728987AbfJMLpX (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 13 Oct 2019 07:45:23 -0400
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:41457 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728973AbfJMLpX (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 13 Oct 2019 07:45:23 -0400
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
        id 7D4B980249; Sun, 13 Oct 2019 13:45:06 +0200 (CEST)
Date:   Sun, 13 Oct 2019 13:45:08 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc:     Jean-Jacques Hiblot <jjhiblot@ti.com>, dmurphy@ti.com,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH] leds: tlc591xx: update the maximum brightness
Message-ID: <20191013114508.GI5653@amd>
References: <20190923100250.22326-1-jjhiblot@ti.com>
 <91864098-a6e8-e275-4b07-e4bb15469f78@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="81JctsDUVPekGcy+"
Content-Disposition: inline
In-Reply-To: <91864098-a6e8-e275-4b07-e4bb15469f78@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--81JctsDUVPekGcy+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > @@ -112,11 +113,11 @@ tlc591xx_brightness_set(struct led_classdev *led_=
cdev,
> >  	struct tlc591xx_priv *priv =3D led->priv;
> >  	int err;
> > =20
> > -	switch (brightness) {
> > +	switch ((int)brightness) {
> >  	case 0:

Can we get a rid of the cast here? Do we need to move away from the
enum for the brightness?

> Added tag:
>=20
> Fixes: e370d010a5fe ("leds: tlc591xx: Driver for the TI 8/16 Channel i2c
> LED driver")
>=20
> and applied to the for-5.5 branch.

Actually, careful with the Fixes tag. -stable people will want to
apply it, and it may not be a good idea in this case. Maximum
brightness of 256 is pretty unusual, so I'd call this "a bit risky".

Best regards,
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--81JctsDUVPekGcy+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl2jDkQACgkQMOfwapXb+vJBCQCgvqf2j9gKfJomgk6Yn1BeZYjo
XoYAoJFLFe+eYjrzhrdnCMOo+P0rglOz
=j3TJ
-----END PGP SIGNATURE-----

--81JctsDUVPekGcy+--
