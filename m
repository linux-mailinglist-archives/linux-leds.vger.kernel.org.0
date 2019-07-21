Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 879306F62F
	for <lists+linux-leds@lfdr.de>; Sun, 21 Jul 2019 23:42:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726115AbfGUVmo (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 21 Jul 2019 17:42:44 -0400
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:52819 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726106AbfGUVmo (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 21 Jul 2019 17:42:44 -0400
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
        id 74A39803E5; Sun, 21 Jul 2019 23:42:30 +0200 (CEST)
Date:   Sun, 21 Jul 2019 23:42:40 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        simon@lineageos.org
Cc:     jacek.anaszewski@gmail.com, dmurphy@ti.com,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] leds: an30259a: Fix typo
Message-ID: <20190721214240.GA13062@amd>
References: <20190721205955.25317-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="/04w6evG8XlLl3ft"
Content-Disposition: inline
In-Reply-To: <20190721205955.25317-1-christophe.jaillet@wanadoo.fr>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--/04w6evG8XlLl3ft
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> All this file is about an30259a, including the reference to the datasheet
> at the top of the file.
>=20
> So change the 2 places where an32059a is used instead.
>=20
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

I see nothing wrong... But address listed as AUTHOR might be worth
Cc-ing? :-).

Acked-by: Pavel Machek <pavel@ucw.cz>
								Pavel

> an32059a is another chip from panasonic
> ---
>  drivers/leds/leds-an30259a.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/leds/leds-an30259a.c b/drivers/leds/leds-an30259a.c
> index 1c1f0c8c56f4..37e7c7998972 100644
> --- a/drivers/leds/leds-an30259a.c
> +++ b/drivers/leds/leds-an30259a.c
> @@ -353,7 +353,7 @@ MODULE_DEVICE_TABLE(i2c, an30259a_id);
> =20
>  static struct i2c_driver an30259a_driver =3D {
>  	.driver =3D {
> -		.name =3D "leds-an32059a",
> +		.name =3D "leds-an30259a",
>  		.of_match_table =3D of_match_ptr(an30259a_match_table),
>  	},
>  	.probe_new =3D an30259a_probe,
> @@ -364,5 +364,5 @@ static struct i2c_driver an30259a_driver =3D {
>  module_i2c_driver(an30259a_driver);
> =20
>  MODULE_AUTHOR("Simon Shields <simon@lineageos.org>");
> -MODULE_DESCRIPTION("AN32059A LED driver");
> +MODULE_DESCRIPTION("AN30259A LED driver");
>  MODULE_LICENSE("GPL v2");

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--/04w6evG8XlLl3ft
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl003FAACgkQMOfwapXb+vIhvACfffYPTcg88R+hIjGb2uFOzsEJ
GHsAn1qv18dNWh75KeM2t+2IxHE1AWat
=3+zP
-----END PGP SIGNATURE-----

--/04w6evG8XlLl3ft--
