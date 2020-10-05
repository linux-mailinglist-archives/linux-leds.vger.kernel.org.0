Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F02F2283BFB
	for <lists+linux-leds@lfdr.de>; Mon,  5 Oct 2020 18:05:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726935AbgJEQFm (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 5 Oct 2020 12:05:42 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:44520 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726659AbgJEQFm (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 5 Oct 2020 12:05:42 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 8DB881C0B76; Mon,  5 Oct 2020 18:05:38 +0200 (CEST)
Date:   Mon, 5 Oct 2020 18:05:38 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     ultracoolguy@tutanota.com
Cc:     Dan Murphy <dmurphy@ti.com>, Marek Behun <kabel@blackhole.sk>,
        Linux Kernel <linux-kernel@vger.kernel.org>,
        Linux Leds <linux-leds@vger.kernel.org>
Subject: Re: [PATCH] leds: lm3697: Fix out-of-bound access
Message-ID: <20201005160538.GC28675@duo.ucw.cz>
References: <MIiYgay--3-2@tutanota.com>
 <20201005141334.36d9441a@blackhole.sk>
 <MIt2NiS--3-2@tutanota.com>
 <3c5fce56-8604-a7d5-1017-8a075f67061e@ti.com>
 <MItBqjy--3-2@tutanota.com>
 <966c3f39-1310-dd60-6f33-0d9464ed2ff1@ti.com>
 <MItOR9Z--3-2@tutanota.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="+nBD6E3TurpgldQp"
Content-Disposition: inline
In-Reply-To: <MItOR9Z--3-2@tutanota.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--+nBD6E3TurpgldQp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> Well, the major benefit I see is that it makes the driver slightly more r=
eadable. However I'm fine with whatever you guys decide.
>=20
> I'll attach the patch with the struct renaming removed just in case.

Thanks for the patches. Content is pretty good, but I'd really need
=46rom + Signed-off-by: with your real name to be able to apply it. (I'd
avoid renaming leds->banks variable in this patch, too, so we have
minimum stable patch).

Dan is maintaining this code, I suspect he'll come up with minimum
fix + followup cleanups shortly.

Best regards,
								Pavel


> diff --git a/drivers/leds/leds-lm3697.c b/drivers/leds/leds-lm3697.c
> index 024983088d59..bd53450050b2 100644
> --- a/drivers/leds/leds-lm3697.c
> +++ b/drivers/leds/leds-lm3697.c
> @@ -78,8 +78,9 @@ struct lm3697 {
>  	struct mutex lock;
> =20
>  	int bank_cfg;
> +	int num_banks;
> =20
> -	struct lm3697_led leds[];
> +	struct lm3697_led banks[];
>  };
> =20
>  static const struct reg_default lm3697_reg_defs[] =3D {
> @@ -180,8 +181,8 @@ static int lm3697_init(struct lm3697 *priv)
>  	if (ret)
>  		dev_err(&priv->client->dev, "Cannot write OUTPUT config\n");
> =20
> -	for (i =3D 0; i < LM3697_MAX_CONTROL_BANKS; i++) {
> -		led =3D &priv->leds[i];
> +	for (i =3D 0; i < priv->num_banks; i++) {
> +		led =3D &priv->banks[i];
>  		ret =3D ti_lmu_common_set_ramp(&led->lmu_data);
>  		if (ret)
>  			dev_err(&priv->client->dev, "Setting the ramp rate failed\n");
> @@ -228,7 +229,7 @@ static int lm3697_probe_dt(struct lm3697 *priv)
>  			goto child_out;
>  		}
> =20
> -		led =3D &priv->leds[i];
> +		led =3D &priv->banks[i];
> =20
>  		ret =3D ti_lmu_common_get_brt_res(&priv->client->dev,
>  						child, &led->lmu_data);
> @@ -307,16 +308,17 @@ static int lm3697_probe(struct i2c_client *client,
>  	int ret;
> =20
>  	count =3D device_get_child_node_count(&client->dev);
> -	if (!count) {
> -		dev_err(&client->dev, "LEDs are not defined in device tree!");
> -		return -ENODEV;
> +	if (!count || count > LM3697_MAX_CONTROL_BANKS) {
> +		return -EINVAL;
>  	}
> =20
> -	led =3D devm_kzalloc(&client->dev, struct_size(led, leds, count),
> +	led =3D devm_kzalloc(&client->dev, struct_size(led, banks, count),
>  			   GFP_KERNEL);
>  	if (!led)
>  		return -ENOMEM;
> =20
> +	led->num_banks =3D count;
> +
>  	mutex_init(&led->lock);
>  	i2c_set_clientdata(client, led);
> =20
> --=20
> 2.28.0
>=20


--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--+nBD6E3TurpgldQp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCX3tEUgAKCRAw5/Bqldv6
8lmbAKC63lUmw2jvOaUUA6KJ5FPtUHX5PACfQSiDYSFtXr3UkHaDdue6LG9i68Q=
=yhtN
-----END PGP SIGNATURE-----

--+nBD6E3TurpgldQp--
