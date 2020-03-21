Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7175618E2A3
	for <lists+linux-leds@lfdr.de>; Sat, 21 Mar 2020 16:43:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727518AbgCUPnz (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 21 Mar 2020 11:43:55 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:55988 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727056AbgCUPnz (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 21 Mar 2020 11:43:55 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 22EA01C031D; Sat, 21 Mar 2020 16:43:54 +0100 (CET)
Date:   Sat, 21 Mar 2020 16:43:53 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Lubomir Rintel <lkundrak@v3.sk>
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Dan Murphy <dmurphy@ti.com>, linux-kernel@vger.kernel.org,
        linux-leds@vger.kernel.org
Subject: Re: [PATCH] leds: ariel: Add driver for status LEDs on Dell Wyse 3020
Message-ID: <20200321154353.GF8386@duo.ucw.cz>
References: <20200314105652.351708-1-lkundrak@v3.sk>
 <20200315084230.GA1996@amd>
 <20200318094314.GA5052@furthur.local>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="GLp9dJVi+aaipsRk"
Content-Disposition: inline
In-Reply-To: <20200318094314.GA5052@furthur.local>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--GLp9dJVi+aaipsRk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > > +static int ariel_led_probe(struct platform_device *pdev)
> > > +{
> > > +	struct device *dev =3D &pdev->dev;
> > > +	struct ariel_led *leds;
> > > +	struct regmap *ec_ram;
> > > +	int ret;
> > > +
> > > +	leds =3D devm_kcalloc(dev, 3, sizeof(*leds), GFP_KERNEL);
> > > +	if (!leds)
> > > +		return -ENOMEM;
> > > +
> > > +	ec_ram =3D dev_get_regmap(dev->parent, "ec_ram");
> > > +	if (!ec_ram)
> > > +		return -ENODEV;
> > > +
> > > +	leds[0].ec_ram =3D ec_ram;
> > > +	leds[0].ec_index =3D EC_BLUE_LED;
> > > +	leds[0].led_cdev.name =3D "ariel:blue:power",
> > > +	leds[0].led_cdev.brightness_get =3D ariel_led_get;
> > > +	leds[0].led_cdev.brightness_set =3D ariel_led_set;
> > > +	leds[0].led_cdev.blink_set =3D ariel_blink_set;
> > > +	leds[0].led_cdev.default_trigger =3D "default-on";
> >=20
> > Move common settings to a loop?
> >=20
> > Definitely delete "ariel:" prefix.
> >=20
> > > +	leds[1].led_cdev.name =3D "ariel:amber:status",
> > > +	leds[2].led_cdev.name =3D "ariel:green:status",
> >=20
> > Do the LEDs have some label, or some kind of common function? Calling
> > it ":status" is not too useful...
>=20
> No label there. This is what it looks like:
> https://people.freedesktop.org/~lkundrak/ariel-leds.jpeg
>=20
> The green and amber, despite being packaged separately, can be
> controlled independently (they are not connected to the same inputs in
> reverse).
>=20
> What does the machine do with stock firmware & ThinOS:
> * On power on, EC lights up the Amber one & Blue one
> * As soon as the firmware takes control, it turns off Amber and turns on
>   Green
> * Just before passing control to the OS, firmware turns the Green LED to
>   blinking
> * As soon as OS initializes, it turns Green back to always-on
>=20
> Therefore the functionality generally is as follows:
> * Amber is always off (only on for a short time between CPU on and
>   firmware running)
> - Green blinking means "loading OS", otherwise always on when CPU is on
> - Blue is always on when the CPU is on

Ok, I guess your naming makes sense (without the ariel prefix).

Thank you,
									Pavel

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--GLp9dJVi+aaipsRk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCXnY2OQAKCRAw5/Bqldv6
8o81AJwLoeCBhDrCb+XuZsjflUb7e93M9wCfQBq2tJDnsG6iHGJy6uwxno/pm1o=
=TBXn
-----END PGP SIGNATURE-----

--GLp9dJVi+aaipsRk--
