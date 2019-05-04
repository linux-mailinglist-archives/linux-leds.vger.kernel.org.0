Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 97EFA13B27
	for <lists+linux-leds@lfdr.de>; Sat,  4 May 2019 18:20:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726320AbfEDQUL (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 4 May 2019 12:20:11 -0400
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:39297 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726217AbfEDQUL (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 4 May 2019 12:20:11 -0400
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
        id 1B70A80313; Sat,  4 May 2019 18:20:00 +0200 (CEST)
Date:   Sat, 4 May 2019 18:20:09 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     list@c-mauderer.de
Cc:     linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Dan Murphy <dmurphy@ti.com>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Christian Mauderer <oss@c-mauderer.de>
Subject: Re: [PATCH 2/2] leds: ubnt-spi: Add Ubnt AirCube ISP LED driver
Message-ID: <20190504162009.GB24060@amd>
References: <20190504122825.11883-1-list@c-mauderer.de>
 <20190504122825.11883-2-list@c-mauderer.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="eAbsdosE1cNLO4uF"
Content-Disposition: inline
In-Reply-To: <20190504122825.11883-2-list@c-mauderer.de>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--eAbsdosE1cNLO4uF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat 2019-05-04 14:28:25, list@c-mauderer.de wrote:
> From: Christian Mauderer <oss@c-mauderer.de>
>=20
> This driver adds support for the custom LED controller used in Ubiquity
> airCube ISP devices and most likely some other simmilar Ubiquity
> products.

similar.

> +config LEDS_UBNT_SPI
> +	tristate "LED support for Ubnt aircube ISP custom SPI LED controller"
> +	depends on LEDS_CLASS
> +	depends on SPI
> +	depends on OF
> +	help
> +	  This option enables basic support for the LED controller used in
> +	  Ubiquity airCube ISP devices. The controller is microcontroller based
> +	  and uses a single byte on the SPI to set brightness or blink patterns.

> +/*
> + *  Custom controller based LED controller used in Ubiquity airCube ISP.
> + *
> + *  Reverse engineered protocol:
> + *  - The device uses only a single byte sent via SPI.
> + *  - The SPI input doesn't contain any relevant information.
> + *  - Higher two bits set a mode. Lower six bits are a parameter.
> + *  - Mode: 00 -> set brightness between 0x00 (min) and 0x3F (max)
> + *  - Mode: 01 -> pulsing pattern (min -> max -> min) with an interval. =
=46rom
> + *    some tests, the period is about (50ms + 102ms * parameter). There =
is a
> + *    slightly different pattern starting from 0x100 (longer gap between=
 the
> + *    pulses) but the time still follows that calculation.
> + *  - Mode: 10 -> same as 01 but with only a ramp from min to max. Again=
 a
> + *    slight jump in the pattern at 0x100.
> + *  - Mode: 11 -> blinking (off -> 25% -> off -> 25% -> ...) with a peri=
od of
> + *    (105ms * parameter)
> + *
> + *  NOTE: This driver currently only implements mode 00 (brightness).
> + */

Aha, so this is not as simple as I thought.

"Slightly different pattern starting from 0x100"? What does 0x100 mean
here.

> +	mutex_init(&led->mutex);
> +	led->ldev.name =3D led->name;
> +	led->ldev.brightness =3D LED_OFF;
> +	led->ldev.max_brightness =3D led->max_bright - led->off_bright;

What happens when DTS has off_bright > max_bright? :-).

> +
> +static int ubnt_spi_remove(struct spi_device *spi)
> +{
> +	struct ubnt_spi_led	*led =3D spi_get_drvdata(spi);
> +
> +	led_classdev_unregister(&led->ldev);
> +
> +	return 0;
> +}

Do you need to do mutex_destroy?
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--eAbsdosE1cNLO4uF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlzNu7kACgkQMOfwapXb+vJhQACeNvTmhpog0jZ1KsNJt4pYf+H3
LroAnAoMKZEN/BYIwnQ5TdnysNXdj+JP
=y9kP
-----END PGP SIGNATURE-----

--eAbsdosE1cNLO4uF--
