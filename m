Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7BCA5128AE3
	for <lists+linux-leds@lfdr.de>; Sat, 21 Dec 2019 19:50:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726593AbfLUSuA (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 21 Dec 2019 13:50:00 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:40338 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726107AbfLUSuA (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 21 Dec 2019 13:50:00 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 672B91C24A9; Sat, 21 Dec 2019 19:49:58 +0100 (CET)
Date:   Sat, 21 Dec 2019 19:49:57 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc:     linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Russell King <linux@armlinux.org.uk>
Subject: Re: [PATCH] leds: gpio: Fix uninitialized gpio label for fwnode
 based probe
Message-ID: <20191221184957.GD32732@amd>
References: <20191205212501.9163-1-jacek.anaszewski@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="1sNVjLsmu1MXqwQ/"
Content-Disposition: inline
In-Reply-To: <20191205212501.9163-1-jacek.anaszewski@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--1sNVjLsmu1MXqwQ/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> When switching to using generic LED name composition mechanism via
> devm_led_classdev_register_ext() API the part of code initializing
> struct gpio_led's template name property was removed alongside.
> It was however overlooked that the property was also passed to
> devm_fwnode_get_gpiod_from_child() in place of "label" parameter,
> which when set to NULL, results in gpio label being initialized to '?'.
>=20
> It could be observed in debugfs and failed to properly identify
> gpio association with LED consumer.
>=20
> Fix this shortcoming by updating the GPIO label after the LED is
> registered and its final name is known.
>=20
> Fixes: d7235f5feaa0 ("leds: gpio: Use generic support for composing LED n=
ames")
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Pavel Machek <pavel@ucw.cz>
> Cc: Russell King <linux@armlinux.org.uk>
> Signed-off-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>

Patch looks good, except:

> @@ -151,9 +151,14 @@ static struct gpio_leds_priv *gpio_leds_create(struc=
t platform_device *pdev)
>  		struct gpio_led led =3D {};
>  		const char *state =3D NULL;
> =20
> +		/**
> +		 * Acquire gpiod from DT with uninitialized label, which
> +		 * will be updated after LED class device is registered,
> +		 * Only then the final LED name is known.
> +		 */
>  		led.gpiod =3D devm_fwnode_get_gpiod_from_child(dev, NULL, child,
>  							     GPIOD_ASIS,
> -							     led.name);
> +							     NULL);

This is not linuxdoc, so comment should beging with /* AFAICT.

I'll probably hand-edit the patch.

Best regards,
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--1sNVjLsmu1MXqwQ/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl3+aVUACgkQMOfwapXb+vL+PQCgpPrrd5+TU6t6ly6WAIecPFXv
M18An3fiw3KJqQW36jXhE2nF9Iu4vC1+
=fYNB
-----END PGP SIGNATURE-----

--1sNVjLsmu1MXqwQ/--
