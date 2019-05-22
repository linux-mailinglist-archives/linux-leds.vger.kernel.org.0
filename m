Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E5EAA27187
	for <lists+linux-leds@lfdr.de>; Wed, 22 May 2019 23:22:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729720AbfEVVWK (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 22 May 2019 17:22:10 -0400
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:36691 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729483AbfEVVWK (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 22 May 2019 17:22:10 -0400
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
        id 31D918027F; Wed, 22 May 2019 23:21:58 +0200 (CEST)
Date:   Wed, 22 May 2019 23:22:07 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Dan Murphy <dmurphy@ti.com>
Cc:     jacek.anaszewski@gmail.com, broonie@kernel.org,
        lgirdwood@gmail.com, lee.jones@linaro.org,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RESEND PATCH v4 1/6] regulator: lm363x: Make the gpio register
 enable flexible
Message-ID: <20190522212207.GA28132@amd>
References: <20190522192733.13422-1-dmurphy@ti.com>
 <20190522192733.13422-2-dmurphy@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="opJtzjQTFsWo+cga"
Content-Disposition: inline
In-Reply-To: <20190522192733.13422-2-dmurphy@ti.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--opJtzjQTFsWo+cga
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed 2019-05-22 14:27:28, Dan Murphy wrote:
> The use of and enablement of the GPIO can be used across devices.
> Use the enable_reg in the regulator descriptor for the register to
> write.
>=20
> Signed-off-by: Dan Murphy <dmurphy@ti.com>

Acked-by: Pavel Machek <pavel@ucw.cz>

> ---
>  drivers/regulator/lm363x-regulator.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/regulator/lm363x-regulator.c b/drivers/regulator/lm3=
63x-regulator.c
> index c876e161052a..382b1cecdd93 100644
> --- a/drivers/regulator/lm363x-regulator.c
> +++ b/drivers/regulator/lm363x-regulator.c
> @@ -263,8 +263,8 @@ static int lm363x_regulator_probe(struct platform_dev=
ice *pdev)
> =20
>  	if (gpiod) {
>  		cfg.ena_gpiod =3D gpiod;
> -
> -		ret =3D regmap_update_bits(regmap, LM3632_REG_BIAS_CONFIG,
> +		ret =3D regmap_update_bits(regmap,
> +					 lm363x_regulator_desc[id].enable_reg,
>  					 LM3632_EXT_EN_MASK,
>  					 LM3632_EXT_EN_MASK);
>  		if (ret) {

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--opJtzjQTFsWo+cga
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlzlvX8ACgkQMOfwapXb+vLXlgCglEDHe+NKnU6e+otIf6THvT7n
tM8An3GAcS5ZJPz9BeGzD1l7Y/uPpw7W
=cMZb
-----END PGP SIGNATURE-----

--opJtzjQTFsWo+cga--
