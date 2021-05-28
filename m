Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7AE8E394098
	for <lists+linux-leds@lfdr.de>; Fri, 28 May 2021 12:04:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236404AbhE1KFo (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 28 May 2021 06:05:44 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:33236 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236448AbhE1KFP (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 28 May 2021 06:05:15 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 4562B1C0B76; Fri, 28 May 2021 12:03:40 +0200 (CEST)
Date:   Fri, 28 May 2021 12:03:39 +0200
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
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH v1 02/28] leds: core: The -ENOTSUPP should never be seen
 by user space
Message-ID: <20210528100339.GD2209@amd>
References: <20210510095045.3299382-1-andy.shevchenko@gmail.com>
 <20210510095045.3299382-3-andy.shevchenko@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="llIrKcgUOe3dCx0c"
Content-Disposition: inline
In-Reply-To: <20210510095045.3299382-3-andy.shevchenko@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--llIrKcgUOe3dCx0c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon 2021-05-10 12:50:19, Andy Shevchenko wrote:
> Replace -ENOTSUPP by -EOPNOTSUPP when returning from exported function.
>=20
> Fixes: 13ae79bbe4c2 ("leds: core: Drivers shouldn't enforce SYNC/ASYNC br=
ightness setting")
> Cc: Jacek Anaszewski <j.anaszewski@samsung.com>
> Signed-off-by: Andy Shevchenko <andy.shevchenko@gmail.com>

Are you sure this is real problem? This does not sound like an error
path that should happen.

BR,
								Pavel

>  int led_set_brightness_sync(struct led_classdev *led_cdev, unsigned int =
value)
>  {
> +	int ret;
> +
>  	if (led_cdev->blink_delay_on || led_cdev->blink_delay_off)
>  		return -EBUSY;
> =20
> @@ -297,7 +299,10 @@ int led_set_brightness_sync(struct led_classdev *led=
_cdev, unsigned int value)
>  	if (led_cdev->flags & LED_SUSPENDED)
>  		return 0;
> =20
> -	return __led_set_brightness_blocking(led_cdev, led_cdev->brightness);
> +	ret =3D __led_set_brightness_blocking(led_cdev, led_cdev->brightness);
> +	if (ret =3D=3D -ENOTSUPP)
> +		return -EOPNOTSUPP;
> +	return ret;
>  }
>  EXPORT_SYMBOL_GPL(led_set_brightness_sync);
> =20

--=20
http://www.livejournal.com/~pavelmachek

--llIrKcgUOe3dCx0c
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAmCwv/sACgkQMOfwapXb+vLXLwCgqSYKq9Bs5thCqRDnD2mipWqc
paMAoJpJMbJGh0zSFocqtFFyHDw/+Z6T
=QR02
-----END PGP SIGNATURE-----

--llIrKcgUOe3dCx0c--
