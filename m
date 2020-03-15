Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 88A78185B45
	for <lists+linux-leds@lfdr.de>; Sun, 15 Mar 2020 09:42:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727821AbgCOImd (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 15 Mar 2020 04:42:33 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:49448 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726841AbgCOImd (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 15 Mar 2020 04:42:33 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 675BA1C032D; Sun, 15 Mar 2020 09:42:31 +0100 (CET)
Date:   Sun, 15 Mar 2020 09:42:30 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Lubomir Rintel <lkundrak@v3.sk>
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Dan Murphy <dmurphy@ti.com>, linux-kernel@vger.kernel.org,
        linux-leds@vger.kernel.org
Subject: Re: [PATCH] leds: ariel: Add driver for status LEDs on Dell Wyse 3020
Message-ID: <20200315084230.GA1996@amd>
References: <20200314105652.351708-1-lkundrak@v3.sk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="rwEMma7ioTxnRzrJ"
Content-Disposition: inline
In-Reply-To: <20200314105652.351708-1-lkundrak@v3.sk>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--rwEMma7ioTxnRzrJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> This adds support for controlling the LEDs attached to the Embedded
> Controller on a Dell Wyse 3020 "Ariel" board.
>=20
> Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>

Does not look bad.

> +static int ariel_led_probe(struct platform_device *pdev)
> +{
> +	struct device *dev =3D &pdev->dev;
> +	struct ariel_led *leds;
> +	struct regmap *ec_ram;
> +	int ret;
> +
> +	leds =3D devm_kcalloc(dev, 3, sizeof(*leds), GFP_KERNEL);
> +	if (!leds)
> +		return -ENOMEM;
> +
> +	ec_ram =3D dev_get_regmap(dev->parent, "ec_ram");
> +	if (!ec_ram)
> +		return -ENODEV;
> +
> +	leds[0].ec_ram =3D ec_ram;
> +	leds[0].ec_index =3D EC_BLUE_LED;
> +	leds[0].led_cdev.name =3D "ariel:blue:power",
> +	leds[0].led_cdev.brightness_get =3D ariel_led_get;
> +	leds[0].led_cdev.brightness_set =3D ariel_led_set;
> +	leds[0].led_cdev.blink_set =3D ariel_blink_set;
> +	leds[0].led_cdev.default_trigger =3D "default-on";

Move common settings to a loop?

Definitely delete "ariel:" prefix.

> +	leds[1].led_cdev.name =3D "ariel:amber:status",
> +	leds[2].led_cdev.name =3D "ariel:green:status",

Do the LEDs have some label, or some kind of common function? Calling
it ":status" is not too useful...

> +	ret =3D devm_led_classdev_register(dev, &leds[2].led_cdev);
> +	if (ret)
> +		return ret;
> +
> +	dev_info(dev, "Dell Wyse 3020 LEDs\n");
> +	return 0;
> +}

Just return ret; no need to print anything into the syslog.

Thanks!
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--rwEMma7ioTxnRzrJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl5t6nYACgkQMOfwapXb+vKBcgCgkvL/uHuv1zBBuhBprXU+YYXO
d84AoJ4BntW5hVTLpp469AW68EFnIwXW
=goUQ
-----END PGP SIGNATURE-----

--rwEMma7ioTxnRzrJ--
