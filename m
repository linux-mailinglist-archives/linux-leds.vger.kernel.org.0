Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 04C75D5625
	for <lists+linux-leds@lfdr.de>; Sun, 13 Oct 2019 14:11:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728620AbfJMMLD (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 13 Oct 2019 08:11:03 -0400
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:41990 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729143AbfJMMLD (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 13 Oct 2019 08:11:03 -0400
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
        id 144198025D; Sun, 13 Oct 2019 14:10:44 +0200 (CEST)
Date:   Sun, 13 Oct 2019 14:10:55 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Riku Voipio <riku.voipio@iki.fi>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Dan Murphy <dmurphy@ti.com>, linux-leds@vger.kernel.org
Subject: Re: [PATCH 01/10] leds: pca953x: Use of_device_get_match_data()
Message-ID: <20191013121055.GO5653@amd>
References: <20191004214334.149976-1-swboyd@chromium.org>
 <20191004214334.149976-2-swboyd@chromium.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="Ck22u5fw4m2k6hx2"
Content-Disposition: inline
In-Reply-To: <20191004214334.149976-2-swboyd@chromium.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--Ck22u5fw4m2k6hx2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri 2019-10-04 14:43:25, Stephen Boyd wrote:
> This driver can use the of_device_get_match_data() API to simplify the
> code. Replace calls to of_match_device() with this newer API under the
> assumption that where it is called will be when we know the device is
> backed by a DT node. This nicely avoids referencing the match table when
> it is undefined with configurations where CONFIG_OF=3Dn.

Thanks, applied.

								Pavel

> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Geert Uytterhoeven <geert@linux-m68k.org>
> Cc: Riku Voipio <riku.voipio@iki.fi>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Frank Rowand <frowand.list@gmail.com>
> Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>
> Cc: Pavel Machek <pavel@ucw.cz>
> Cc: Dan Murphy <dmurphy@ti.com>
> Cc: <linux-leds@vger.kernel.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
>=20
> Please ack or pick for immediate merge so the last patch can be merged.
>=20
>  drivers/leds/leds-pca9532.c | 14 ++------------
>  1 file changed, 2 insertions(+), 12 deletions(-)
>=20
> diff --git a/drivers/leds/leds-pca9532.c b/drivers/leds/leds-pca9532.c
> index c7c7199e8ebd..7d515d5e57bd 100644
> --- a/drivers/leds/leds-pca9532.c
> +++ b/drivers/leds/leds-pca9532.c
> @@ -467,16 +467,11 @@ pca9532_of_populate_pdata(struct device *dev, struc=
t device_node *np)
>  {
>  	struct pca9532_platform_data *pdata;
>  	struct device_node *child;
> -	const struct of_device_id *match;
>  	int devid, maxleds;
>  	int i =3D 0;
>  	const char *state;
> =20
> -	match =3D of_match_device(of_pca9532_leds_match, dev);
> -	if (!match)
> -		return ERR_PTR(-ENODEV);
> -
> -	devid =3D (int)(uintptr_t)match->data;
> +	devid =3D (int)(uintptr_t)of_device_get_match_data(dev);
>  	maxleds =3D pca9532_chip_info_tbl[devid].num_leds;
> =20
>  	pdata =3D devm_kzalloc(dev, sizeof(*pdata), GFP_KERNEL);
> @@ -509,7 +504,6 @@ static int pca9532_probe(struct i2c_client *client,
>  	const struct i2c_device_id *id)
>  {
>  	int devid;
> -	const struct of_device_id *of_id;
>  	struct pca9532_data *data =3D i2c_get_clientdata(client);
>  	struct pca9532_platform_data *pca9532_pdata =3D
>  			dev_get_platdata(&client->dev);
> @@ -525,11 +519,7 @@ static int pca9532_probe(struct i2c_client *client,
>  			dev_err(&client->dev, "no platform data\n");
>  			return -EINVAL;
>  		}
> -		of_id =3D of_match_device(of_pca9532_leds_match,
> -				&client->dev);
> -		if (unlikely(!of_id))
> -			return -EINVAL;
> -		devid =3D (int)(uintptr_t) of_id->data;
> +		devid =3D (int)(uintptr_t)of_device_get_match_data(&client->dev);
>  	} else {
>  		devid =3D id->driver_data;
>  	}

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--Ck22u5fw4m2k6hx2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl2jFE8ACgkQMOfwapXb+vIMRgCfUGz2BiRVoRY4urcPw8LTSyxq
E+UAnjXZMxG56LJLaiqiK6kWf9dWNBaI
=Q5tE
-----END PGP SIGNATURE-----

--Ck22u5fw4m2k6hx2--
