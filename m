Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E4EAF3940A7
	for <lists+linux-leds@lfdr.de>; Fri, 28 May 2021 12:09:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235876AbhE1KKn (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 28 May 2021 06:10:43 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:34056 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235361AbhE1KKm (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 28 May 2021 06:10:42 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 96D1C1C0B76; Fri, 28 May 2021 12:09:07 +0200 (CEST)
Date:   Fri, 28 May 2021 12:09:06 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Amireddy Mallikarjuna reddy 
        <mallikarjunax.reddy@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Marek =?iso-8859-1?Q?Beh=FAn?= <marek.behun@nic.cz>,
        Abanoub Sameh <abanoubsameh8@gmail.com>,
        Dan Murphy <dmurphy@ti.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 11/28] leds: lgm-sso: Remove explicit managed resource
 cleanups
Message-ID: <20210528100906.GG2209@amd>
References: <20210510095045.3299382-1-andy.shevchenko@gmail.com>
 <20210510095045.3299382-12-andy.shevchenko@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="XRI2XbIfl/05pQwm"
Content-Disposition: inline
In-Reply-To: <20210510095045.3299382-12-andy.shevchenko@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--XRI2XbIfl/05pQwm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon 2021-05-10 12:50:28, Andy Shevchenko wrote:
> The idea of managed resources that they will be cleaned up automatically
> and in the proper order. Remove explicit cleanups.

Are you really sure this is good idea with the regmap_update_bits in
between?

BR,
								Pavel

> ---
>  drivers/leds/blink/leds-lgm-sso.c | 6 ------
>  1 file changed, 6 deletions(-)
>=20
> diff --git a/drivers/leds/blink/leds-lgm-sso.c b/drivers/leds/blink/leds-=
lgm-sso.c
> index e76be25480b4..a7f2e5436ba2 100644
> --- a/drivers/leds/blink/leds-lgm-sso.c
> +++ b/drivers/leds/blink/leds-lgm-sso.c
> @@ -606,16 +606,10 @@ static void sso_led_shutdown(struct sso_led *led)
>  {
>  	struct sso_led_priv *priv =3D led->priv;
> =20
> -	/* unregister led */
> -	devm_led_classdev_unregister(priv->dev, &led->cdev);
> -
>  	/* clear HW control bit */
>  	if (led->desc.hw_trig)
>  		regmap_update_bits(priv->mmap, SSO_CON3, BIT(led->desc.pin), 0);
> =20
> -	if (led->gpiod)
> -		devm_gpiod_put(priv->dev, led->gpiod);
> -
>  	led->priv =3D NULL;
>  }
> =20

--=20
http://www.livejournal.com/~pavelmachek

--XRI2XbIfl/05pQwm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAmCwwUIACgkQMOfwapXb+vKUqgCgiJK5z0DCUwmfQHqSIZ8esUk7
fkYAoJ3fBhQzuSC2Y+Rwi+WNjChH4G8m
=3hpP
-----END PGP SIGNATURE-----

--XRI2XbIfl/05pQwm--
