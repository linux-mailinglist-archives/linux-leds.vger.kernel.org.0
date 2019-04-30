Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AF2541011D
	for <lists+linux-leds@lfdr.de>; Tue, 30 Apr 2019 22:46:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726559AbfD3Uq3 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 30 Apr 2019 16:46:29 -0400
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:48254 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726164AbfD3Uq2 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 30 Apr 2019 16:46:28 -0400
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
        id 9B553805FF; Tue, 30 Apr 2019 22:46:16 +0200 (CEST)
Date:   Tue, 30 Apr 2019 22:46:25 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Dan Murphy <dmurphy@ti.com>
Cc:     Marek =?iso-8859-1?Q?Beh=FAn?= <marek.behun@nic.cz>,
        linux-leds@vger.kernel.org,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH leds/for-next v2 2/2] leds: turris-omnia: Add support for
 256 brightness values
Message-ID: <20190430204625.GA20410@amd>
References: <20190429212944.15643-1-marek.behun@nic.cz>
 <20190429212944.15643-3-marek.behun@nic.cz>
 <87eafec0-b074-689d-20b6-171a866745ea@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="tKW2IUtsqtDRztdT"
Content-Disposition: inline
In-Reply-To: <87eafec0-b074-689d-20b6-171a866745ea@ti.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--tKW2IUtsqtDRztdT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> > index 3747cbd0de2c..62d17c2f4878 100644
> > --- a/drivers/leds/Kconfig
> > +++ b/drivers/leds/Kconfig
> > @@ -139,8 +139,8 @@ config LEDS_TURRIS_OMNIA
> >  	  side of CZ.NIC's Turris Omnia router. There are 12 RGB LEDs on the
> >  	  front panel.
> >  	  This driver does not currently support setting LED colors, only
> > -	  on/off state. Also HW triggering is disabled when the controller
> > -	  is probed by this driver.
> > +	  brightness. Also HW triggering is disabled when the controller is
> > +	  probed by this driver.
> > =20
>=20
> I am not seeing where or how this is done in the driver on probe.

I checked, and I believe it was ok.

> >  config LEDS_LM3530
> >  	tristate "LCD Backlight driver for LM3530"
> > diff --git a/drivers/leds/leds-turris-omnia.c b/drivers/leds/leds-turri=
s-omnia.c
> > index dc9fac56b13a..0e805d94f298 100644
> > --- a/drivers/leds/leds-turris-omnia.c
> > +++ b/drivers/leds/leds-turris-omnia.c
> > @@ -54,7 +54,7 @@ static int omnia_led_brightness_set_blocking(struct l=
ed_classdev *led,
> >  	struct omnia_leds *leds =3D dev_get_drvdata(led->dev->parent);
> >  	int idx =3D omnia_led_idx(leds, led);
> >  	int ret;
> > -	u8 state;
> > +	u8 buf[5], state;
>=20
> Magic numbers

Nothing wrong with magic "5" when you have 0, 1, 2, 3 and 4
below. Constants are useful when they make code easier to read, not in
this case.

> >  	mutex_unlock(&leds->lock);
> > =20
> >  	return ret;
> > @@ -97,7 +105,7 @@ static int omnia_led_register(struct omnia_leds *led=
s,
> >  	ret =3D fwnode_property_read_string(node, "label", &str);
> >  	snprintf(led->name, sizeof(led->name), "omnia::%s", ret ? "" : str);
> > =20
> > -	led->cdev.max_brightness =3D 1;
> > +	led->cdev.max_brightness =3D 255;
>=20
> How about LED_FULL?

Please don't.

> > +	/* set all LEDs color to [255, 255, 255] */
> > +	buf[0] =3D CMD_LED_COLOR;
> > +	buf[1] =3D OMNIA_BOARD_LEDS;
> > +	buf[2] =3D buf[3] =3D buf[4] =3D 255;
> > +
>=20
> LED_FULL for this as above.

I'd actually prefer 255 here; due to the way hardware is designed,
it has brightness in byte. No need to put LED_FULL here, and force
reader to check the headers to see what value LED_FULL has.

Thanks,

									Pavel

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--tKW2IUtsqtDRztdT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlzItCEACgkQMOfwapXb+vIBPQCfW3kQ/ElY6yVaJJDHkDZ/OLNM
6GYAniJOeIPEtBU7pIH/WZ0cBdH8cgIr
=Rg7P
-----END PGP SIGNATURE-----

--tKW2IUtsqtDRztdT--
