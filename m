Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 87358EB8D
	for <lists+linux-leds@lfdr.de>; Mon, 29 Apr 2019 22:21:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729212AbfD2UVx (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 29 Apr 2019 16:21:53 -0400
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:39894 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728928AbfD2UVx (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 29 Apr 2019 16:21:53 -0400
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
        id 097BF8064C; Mon, 29 Apr 2019 22:21:41 +0200 (CEST)
Date:   Mon, 29 Apr 2019 22:21:49 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Marek =?iso-8859-1?Q?Beh=FAn?= <marek.behun@nic.cz>
Cc:     linux-leds@vger.kernel.org,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH leds/for-next v1 2/2] leds: turris-omnia: Add support for
 256 brightness values
Message-ID: <20190429202149.GE24658@amd>
References: <20190429194433.29760-1-marek.behun@nic.cz>
 <20190429194433.29760-2-marek.behun@nic.cz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="ey/N+yb7u/X9mFhi"
Content-Disposition: inline
In-Reply-To: <20190429194433.29760-2-marek.behun@nic.cz>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--ey/N+yb7u/X9mFhi
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon 2019-04-29 21:44:33, Marek Beh=FAn wrote:
> The controller supports setting brightness of each channel of the RGB
> LEDs to values 0-255. We do not support RGB LED class yet, but we can
> use this to be able to have 256 brightness levels for each LED, instead
> of just on/off state.
>=20
> Signed-off-by: Marek Beh=FAn <marek.behun@nic.cz>

Have you tested this?

> diff --git a/drivers/leds/leds-turris-omnia.c b/drivers/leds/leds-turris-=
omnia.c
> index dc9fac56b13a..0097e62e25d8 100644
> --- a/drivers/leds/leds-turris-omnia.c
> +++ b/drivers/leds/leds-turris-omnia.c
> @@ -54,7 +54,7 @@ static int omnia_led_brightness_set_blocking(struct led=
_classdev *led,
>  	struct omnia_leds *leds =3D dev_get_drvdata(led->dev->parent);
>  	int idx =3D omnia_led_idx(leds, led);
>  	int ret;
> -	u8 state;
> +	u8 buf[5], state;
> =20
>  	if (idx < 0)
>  		return idx;
> @@ -63,8 +63,16 @@ static int omnia_led_brightness_set_blocking(struct le=
d_classdev *led,
>  	if (brightness)
>  		state |=3D CMD_LED_STATE_ON;
> =20
> +	buf[0] =3D CMD_LED_COLOR;
> +	buf[1] =3D idx;
> +	buf[2] =3D buf[3] =3D buf[4] =3D brightness;
> +
>  	mutex_lock(&leds->lock);
> +
>  	ret =3D i2c_smbus_write_byte_data(leds->client, CMD_LED_STATE, state);
> +	if (ret >=3D 0)

&& brightness

?

> +		ret =3D i2c_master_send(leds->client, buf, 5);
> +
>  	mutex_unlock(&leds->lock);

But more importantly,

        led->cdev.max_brightness =3D 1;

needs to be changed... right?
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--ey/N+yb7u/X9mFhi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlzHXN0ACgkQMOfwapXb+vJ12wCggxunYfQLU+adIAXjVzzxdjY3
kZ4AoLZmVK9gT0cO/aEqAc6dgc9mONpA
=xJbF
-----END PGP SIGNATURE-----

--ey/N+yb7u/X9mFhi--
