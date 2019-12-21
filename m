Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 600F4128B7A
	for <lists+linux-leds@lfdr.de>; Sat, 21 Dec 2019 21:22:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727384AbfLUUWA (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 21 Dec 2019 15:22:00 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:48428 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727278AbfLUUWA (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 21 Dec 2019 15:22:00 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 9E47B1C24A9; Sat, 21 Dec 2019 21:21:57 +0100 (CET)
Date:   Sat, 21 Dec 2019 21:21:56 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>
Cc:     linux-realtek-soc@lists.infradead.org, linux-leds@vger.kernel.org,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Dan Murphy <dmurphy@ti.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
Subject: Re: [RFC 14/25] arm64: dts: realtek: rtd1295-xnano-x5: Add regular
 LEDs to FD628
Message-ID: <20191221202156.GL32732@amd>
References: <20191212033952.5967-1-afaerber@suse.de>
 <20191212033952.5967-15-afaerber@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="rfwNdt5cNUUjB/69"
Content-Disposition: inline
In-Reply-To: <20191212033952.5967-15-afaerber@suse.de>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--rfwNdt5cNUUjB/69
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> Add child nodes for individual LED indicators plus the half-second colon.
>=20
> Signed-off-by: Andreas F=E4rber <afaerber@suse.de>
> ---

> +			apps@1,4 {
> +				reg =3D <1 4>;
> +				color =3D <LED_COLOR_ID_WHITE>;
> +				function =3D LED_FUNCTION_INDICATOR;
> +				function-enumerator =3D <1>;
> +			};
> +
> +			setup@2,4 {
> +				reg =3D <2 4>;
> +				color =3D <LED_COLOR_ID_WHITE>;
> +				function =3D LED_FUNCTION_INDICATOR;
> +				function-enumerator =3D <2>;
> +			};

having 10 "indicator" leds is not going to be exactly useful.

So, what does the display look like? "apps", "setup", "usb", "card",
=2E.. texts?

									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--rfwNdt5cNUUjB/69
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl3+fuQACgkQMOfwapXb+vKpLACfQv6vWFQeNIi5z/L8L8LVHFOD
K8EAoJZ1a/I813U8L01scB3b7YB0aRsq
=AN0b
-----END PGP SIGNATURE-----

--rfwNdt5cNUUjB/69--
