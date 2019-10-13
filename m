Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C5E3DD561A
	for <lists+linux-leds@lfdr.de>; Sun, 13 Oct 2019 14:09:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729007AbfJMMJ7 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 13 Oct 2019 08:09:59 -0400
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:41910 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728620AbfJMMJ7 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 13 Oct 2019 08:09:59 -0400
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
        id 43A738023D; Sun, 13 Oct 2019 14:09:41 +0200 (CEST)
Date:   Sun, 13 Oct 2019 14:09:52 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Jean-Jacques Hiblot <jjhiblot@ti.com>
Cc:     jacek.anaszewski@gmail.com, sre@kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.com, lee.jones@linaro.org,
        daniel.thompson@linaro.org, dmurphy@ti.com,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, tomi.valkeinen@ti.com
Subject: Re: [PATCH v9 3/5] leds: Add managed API to get a LED from a device
 driver
Message-ID: <20191013120952.GL5653@amd>
References: <20191007124437.20367-1-jjhiblot@ti.com>
 <20191007124437.20367-4-jjhiblot@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="zH41lVBEV8cLJnCl"
Content-Disposition: inline
In-Reply-To: <20191007124437.20367-4-jjhiblot@ti.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--zH41lVBEV8cLJnCl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> If the LED is acquired by a consumer device with devm_led_get(), it is
> automatically released when the device is detached.
>=20
> Signed-off-by: Jean-Jacques Hiblot <jjhiblot@ti.com>
> Acked-by: Pavel Machek <pavel@ucw.cz>
> ---
>  drivers/leds/led-class.c | 49 ++++++++++++++++++++++++++++++++++++++++
>  include/linux/leds.h     |  2 ++
>  2 files changed, 51 insertions(+)
>=20
> diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
> index 1d1f1d546dc7..639224392ffa 100644
> --- a/drivers/leds/led-class.c
> +++ b/drivers/leds/led-class.c
> @@ -264,6 +264,55 @@ void led_put(struct led_classdev *led_cdev)
>  }
>  EXPORT_SYMBOL_GPL(led_put);
> =20
> +static void devm_led_release(struct device *dev, void *res)
> +{
> +	struct led_classdev **p =3D res;
> +
> +	led_put(*p);
> +}
> +
> +/**
> + * devm_of_led_get - Resource-managed request of a LED device
> + * @dev:	LED consumer
> + * @index:	index of the LED to obtain in the consumer
> + *
> + * The device node of the device is parse to find the request LED device.
> + * The LED device returned from this function is automatically released
> + * on driver detach.
> + *
> + * @return a pointer to a LED device or ERR_PTR(errno) on failure.
> + */
> +struct led_classdev *__must_check devm_of_led_get(struct device *dev,
> +						  int index)
> +{
> +	struct led_classdev *led;
> +	struct led_classdev **dr;
> +
> +	if (!dev)
> +		return ERR_PTR(-EINVAL);
> +
> +	/* Consummer not using device tree? */

Typo "consumer". I may fix it before applying the patch.

Best regards,
									Pavel

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--zH41lVBEV8cLJnCl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl2jFBAACgkQMOfwapXb+vLi0ACghzv7nZ4xe3dVsGeLJ7I8UIbL
ZHoAoLAAx5gbRTPv4Bm9i1/pPNfJgf7j
=R/Sy
-----END PGP SIGNATURE-----

--zH41lVBEV8cLJnCl--
