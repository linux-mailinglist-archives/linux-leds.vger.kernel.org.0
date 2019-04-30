Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 440D810292
	for <lists+linux-leds@lfdr.de>; Wed,  1 May 2019 00:43:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726115AbfD3Wnf (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 30 Apr 2019 18:43:35 -0400
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:57236 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726105AbfD3Wnf (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 30 Apr 2019 18:43:35 -0400
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
        id 91E2B805A7; Wed,  1 May 2019 00:43:23 +0200 (CEST)
Date:   Wed, 1 May 2019 00:43:32 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc:     Dan Murphy <dmurphy@ti.com>,
        Marek =?iso-8859-1?Q?Beh=FAn?= <marek.behun@nic.cz>,
        linux-leds@vger.kernel.org
Subject: Re: [PATCH leds/for-next v2 2/2] leds: turris-omnia: Add support for
 256 brightness values
Message-ID: <20190430224332.GE20410@amd>
References: <20190429212944.15643-1-marek.behun@nic.cz>
 <20190429212944.15643-3-marek.behun@nic.cz>
 <87eafec0-b074-689d-20b6-171a866745ea@ti.com>
 <20190430204625.GA20410@amd>
 <eb5f9ce0-914e-57dc-5e58-65c1f2ef52db@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="J4XPiPrVK1ev6Sgr"
Content-Disposition: inline
In-Reply-To: <eb5f9ce0-914e-57dc-5e58-65c1f2ef52db@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--J4XPiPrVK1ev6Sgr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue 2019-04-30 22:52:36, Jacek Anaszewski wrote:
> On 4/30/19 10:46 PM, Pavel Machek wrote:
> >Hi!
> >
> >>>diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> >>>index 3747cbd0de2c..62d17c2f4878 100644
> >>>--- a/drivers/leds/Kconfig
> >>>+++ b/drivers/leds/Kconfig
> >>>@@ -139,8 +139,8 @@ config LEDS_TURRIS_OMNIA
> >>>  	  side of CZ.NIC's Turris Omnia router. There are 12 RGB LEDs on the
> >>>  	  front panel.
> >>>  	  This driver does not currently support setting LED colors, only
> >>>-	  on/off state. Also HW triggering is disabled when the controller
> >>>-	  is probed by this driver.
> >>>+	  brightness. Also HW triggering is disabled when the controller is
> >>>+	  probed by this driver.
> >>
> >>I am not seeing where or how this is done in the driver on probe.
> >
> >I checked, and I believe it was ok.
> >
> >>>  config LEDS_LM3530
> >>>  	tristate "LCD Backlight driver for LM3530"
> >>>diff --git a/drivers/leds/leds-turris-omnia.c b/drivers/leds/leds-turr=
is-omnia.c
> >>>index dc9fac56b13a..0e805d94f298 100644
> >>>--- a/drivers/leds/leds-turris-omnia.c
> >>>+++ b/drivers/leds/leds-turris-omnia.c
> >>>@@ -54,7 +54,7 @@ static int omnia_led_brightness_set_blocking(struct =
led_classdev *led,
> >>>  	struct omnia_leds *leds =3D dev_get_drvdata(led->dev->parent);
> >>>  	int idx =3D omnia_led_idx(leds, led);
> >>>  	int ret;
> >>>-	u8 state;
> >>>+	u8 buf[5], state;
> >>
> >>Magic numbers
> >
> >Nothing wrong with magic "5" when you have 0, 1, 2, 3 and 4
> >below. Constants are useful when they make code easier to read, not in
> >this case.
> >
> >>>  	mutex_unlock(&leds->lock);
> >>>  	return ret;
> >>>@@ -97,7 +105,7 @@ static int omnia_led_register(struct omnia_leds *le=
ds,
> >>>  	ret =3D fwnode_property_read_string(node, "label", &str);
> >>>  	snprintf(led->name, sizeof(led->name), "omnia::%s", ret ? "" : str);
> >>>-	led->cdev.max_brightness =3D 1;
> >>>+	led->cdev.max_brightness =3D 255;
> >>
> >>How about LED_FULL?
> >
> >Please don't.
> >
> >>>+	/* set all LEDs color to [255, 255, 255] */
> >>>+	buf[0] =3D CMD_LED_COLOR;
> >>>+	buf[1] =3D OMNIA_BOARD_LEDS;
> >>>+	buf[2] =3D buf[3] =3D buf[4] =3D 255;
> >>>+
> >>
> >>LED_FULL for this as above.
> >
> >I'd actually prefer 255 here; due to the way hardware is designed,
> >it has brightness in byte. No need to put LED_FULL here, and force
> >reader to check the headers to see what value LED_FULL has.
>=20
> Let's be consistent. Please add constants for both 5 and 255.
> The conventions are established for a reason.

I don't believe such convention exists for kernel, and it certainly
makes code harder to read in case of "5"... That code is currently
simple and easy to read, lets keep it that way.

(You can try  grep -ri '\<5\>' net/ :-) ]

Thanks,

									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--J4XPiPrVK1ev6Sgr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlzIz5QACgkQMOfwapXb+vLejgCgmwUtFO2wh29A7ya7wCc6h6/U
uuAAnRQyP5NyLHNoXkf7dVGJjwYgkfye
=rO31
-----END PGP SIGNATURE-----

--J4XPiPrVK1ev6Sgr--
