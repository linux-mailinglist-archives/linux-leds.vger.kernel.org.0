Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7E239B780D
	for <lists+linux-leds@lfdr.de>; Thu, 19 Sep 2019 12:57:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388002AbfISK5K (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 19 Sep 2019 06:57:10 -0400
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:33129 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387931AbfISK5K (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 19 Sep 2019 06:57:10 -0400
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
        id 01B8981AD9; Thu, 19 Sep 2019 12:56:53 +0200 (CEST)
Date:   Thu, 19 Sep 2019 12:57:07 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Dan Murphy <dmurphy@ti.com>, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/5] leds: lm3692x: Don't overwrite return value in error
 path
Message-ID: <20190919105707.GB29939@amd>
References: <cover.1568772964.git.agx@sigxcpu.org>
 <bc1a6e64da58d65b61c7e9358c745b0d467fc24c.1568772964.git.agx@sigxcpu.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="rJwd6BRFiFCcLxzm"
Content-Disposition: inline
In-Reply-To: <bc1a6e64da58d65b61c7e9358c745b0d467fc24c.1568772964.git.agx@sigxcpu.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--rJwd6BRFiFCcLxzm
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue 2019-09-17 19:19:55, Guido G=FCnther wrote:
> The driver currently reports successful initialization on every failure
> as long as it's able to power off the regulator. Don't check the return
> value of regulator_disable to avoid that.
>=20
> Signed-off-by: Guido G=FCnther <agx@sigxcpu.org>
> ---
>  drivers/leds/leds-lm3692x.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/leds/leds-lm3692x.c b/drivers/leds/leds-lm3692x.c
> index 487228c2bed2..f394669ad8f2 100644
> --- a/drivers/leds/leds-lm3692x.c
> +++ b/drivers/leds/leds-lm3692x.c
> @@ -312,15 +312,12 @@ static int lm3692x_init(struct lm3692x_led *led)
>  	if (led->enable_gpio)
>  		gpiod_direction_output(led->enable_gpio, 0);
> =20
> -	if (led->regulator) {
> -		ret =3D regulator_disable(led->regulator);
> -		if (ret)
> -			dev_err(&led->client->dev,
> -				"Failed to disable regulator\n");
> -	}
> +	if (led->regulator)
> +		regulator_disable(led->regulator);
> =20
>  	return ret;

Overwriting return value is bad, but we should still print some kind
of error message.

Best regards,
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--rJwd6BRFiFCcLxzm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl2DXwMACgkQMOfwapXb+vLVKQCdFZRYN+Beq5zfxKwigBWPqQOT
qf4An2eTJAoyLeS1QqbNHAPURS4A5BWn
=rm1P
-----END PGP SIGNATURE-----

--rJwd6BRFiFCcLxzm--
