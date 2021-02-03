Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0608E30D5CB
	for <lists+linux-leds@lfdr.de>; Wed,  3 Feb 2021 10:06:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233096AbhBCJD4 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 3 Feb 2021 04:03:56 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:40898 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233105AbhBCJDk (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 3 Feb 2021 04:03:40 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id B241B1C0B79; Wed,  3 Feb 2021 10:02:50 +0100 (CET)
Date:   Wed, 3 Feb 2021 10:02:50 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Sven Schuchmann <schuchmann@schleissheimer.de>
Cc:     Dan Murphy <dmurphy@ti.com>, Rob Herring <robh+dt@kernel.org>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] leds: lp50xx: remove unused regulator
Message-ID: <20210203090249.GA14154@amd>
References: <20210203083408.2534-1-schuchmann@schleissheimer.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="yrj/dFKFPuw6o+aM"
Content-Disposition: inline
In-Reply-To: <20210203083408.2534-1-schuchmann@schleissheimer.de>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--yrj/dFKFPuw6o+aM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed 2021-02-03 08:34:08, Sven Schuchmann wrote:
> The regulator for vled-supply is unused in the driver.
> It is just assigned from DT and disabled in lp50xx_remove.
> So the code can be removed from the driver.

Dan, what is going on here? Do we need to also enable the regulator,
or is the removal correct thing to do?

Best regards,
							Pavel


> Part 1 updates the documentation
> Part 2 removes the code
>=20
> Signed-off-by: Sven Schuchmann <schuchmann@schleissheimer.de>
>=20
> ---
>  drivers/leds/leds-lp50xx.c | 14 --------------
>  1 file changed, 14 deletions(-)
>=20
> diff --git a/drivers/leds/leds-lp50xx.c b/drivers/leds/leds-lp50xx.c
> index f13117eed976..b0871495bae3 100644
> --- a/drivers/leds/leds-lp50xx.c
> +++ b/drivers/leds/leds-lp50xx.c
> @@ -11,7 +11,6 @@
>  #include <linux/of.h>
>  #include <linux/of_gpio.h>
>  #include <linux/regmap.h>
> -#include <linux/regulator/consumer.h>
>  #include <linux/slab.h>
>  #include <uapi/linux/uleds.h>
> =20
> @@ -275,7 +274,6 @@ struct lp50xx_led {
>  /**
>   * struct lp50xx -
>   * @enable_gpio: hardware enable gpio
> - * @regulator: LED supply regulator pointer
>   * @client: pointer to the I2C client
>   * @regmap: device register map
>   * @dev: pointer to the devices device struct
> @@ -286,7 +284,6 @@ struct lp50xx_led {
>   */
>  struct lp50xx {
>  	struct gpio_desc *enable_gpio;
> -	struct regulator *regulator;
>  	struct i2c_client *client;
>  	struct regmap *regmap;
>  	struct device *dev;
> @@ -462,10 +459,6 @@ static int lp50xx_probe_dt(struct lp50xx *priv)
>  		return ret;
>  	}
> =20
> -	priv->regulator =3D devm_regulator_get(priv->dev, "vled");
> -	if (IS_ERR(priv->regulator))
> -		priv->regulator =3D NULL;
> -
>  	device_for_each_child_node(priv->dev, child) {
>  		led =3D &priv->leds[i];
>  		ret =3D fwnode_property_count_u32(child, "reg");
> @@ -583,13 +576,6 @@ static int lp50xx_remove(struct i2c_client *client)
>  		return ret;
>  	}
> =20
> -	if (led->regulator) {
> -		ret =3D regulator_disable(led->regulator);
> -		if (ret)
> -			dev_err(&led->client->dev,
> -				"Failed to disable regulator\n");
> -	}
> -
>  	mutex_destroy(&led->lock);
> =20
>  	return 0;

--=20
http://www.livejournal.com/~pavelmachek

--yrj/dFKFPuw6o+aM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAmAaZrkACgkQMOfwapXb+vJVAACePCdJ0/J96bFqKYIylfKvj3YI
aVQAn3Or6tou+NWIQCpTFM7mtRe3R7XT
=O55N
-----END PGP SIGNATURE-----

--yrj/dFKFPuw6o+aM--
