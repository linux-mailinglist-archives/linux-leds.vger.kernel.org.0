Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E908B2AEAB7
	for <lists+linux-leds@lfdr.de>; Wed, 11 Nov 2020 09:00:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725922AbgKKIAM (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 11 Nov 2020 03:00:12 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:44566 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725916AbgKKIAK (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 11 Nov 2020 03:00:10 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id F41B11C0B7C; Wed, 11 Nov 2020 08:59:59 +0100 (CET)
Date:   Wed, 11 Nov 2020 08:59:59 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Dan Murphy <dmurphy@ti.com>, linux-leds@vger.kernel.org,
        Sakari Ailus <sakari.ailus@iki.fi>, newbytee@protonmail.com,
        Stephan Gerhold <stephan@gerhold.net>
Subject: Re: [PATCH 2/2 v3] leds: rt8515: Add Richtek RT8515 LED driver
Message-ID: <20201111075958.GA16683@amd>
References: <20201111011417.2275501-1-linus.walleij@linaro.org>
 <20201111011417.2275501-2-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="bp/iNruPH9dso1Pn"
Content-Disposition: inline
In-Reply-To: <20201111011417.2275501-2-linus.walleij@linaro.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--bp/iNruPH9dso1Pn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> This adds a driver for the Richtek RT8515 dual channel
> torch/flash white LED driver.
>=20
> This LED driver is found in some mobile phones from
> Samsung such as the GT-S7710 and GT-I8190.

Cc: phone-devel@vger.

>  drivers/leds/Kconfig       |  11 ++
>  drivers/leds/Makefile      |   1 +
>  drivers/leds/leds-rt8515.c | 303 +++++++++++++++++++++++++++++++++++++

Let's put this into drivers/leds/flash. You may need to create it.

> +// SPDX-License-Identifier: GPL-2.0-only

GPL-2+ would be nicer if you can.

> +struct rt8515 {
> +	struct led_classdev_flash fled;
> +	struct v4l2_flash *v4l2_flash;
> +	struct mutex lock;
> +	struct regulator *reg;
> +	struct gpio_desc *ent;
> +	struct gpio_desc *enf;

-> enable_torch or at least en_torch / en_flash?

Otherwise it looks good.

Best regards,
							Pavel

--=20
http://www.livejournal.com/~pavelmachek

--bp/iNruPH9dso1Pn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl+rmf4ACgkQMOfwapXb+vITlwCcDcwJPpHiLwyHOYm9fsgAd+/R
Yn8An3w9TYjYdLbYzJBuvaZg4bUEUlQ+
=xy/j
-----END PGP SIGNATURE-----

--bp/iNruPH9dso1Pn--
