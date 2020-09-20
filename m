Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B085271365
	for <lists+linux-leds@lfdr.de>; Sun, 20 Sep 2020 13:08:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726381AbgITLIN (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 20 Sep 2020 07:08:13 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:42458 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726262AbgITLIN (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 20 Sep 2020 07:08:13 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id CF1411C0B77; Sun, 20 Sep 2020 13:08:10 +0200 (CEST)
Date:   Sun, 20 Sep 2020 13:08:10 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Adrian Schmutzler <mail@adrianschmutzler.de>
Cc:     linux-leds@vger.kernel.org
Subject: Re: How to name multiple LEDs of the same type and color
Message-ID: <20200920110810.GA15219@duo.ucw.cz>
References: <00ab01d68eca$d2d4fcc0$787ef640$@adrianschmutzler.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="y0ulUmNC+osPPQO6"
Content-Disposition: inline
In-Reply-To: <00ab01d68eca$d2d4fcc0$787ef640$@adrianschmutzler.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--y0ulUmNC+osPPQO6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> I wonder what would be the correct way to deal with a set of LEDs with th=
e same color/function combination, e.g.
>

(Please wrap at 72).

> 	leds {
> 		compatible =3D "gpio-leds";
>=20
> 		link1 {
> 			function =3D LED_FUNCTION_RSSI;
> 			color =3D <LED_COLOR_ID_GREEN>;
> 			gpios =3D <&gpio 13 GPIO_ACTIVE_LOW>;
> 		};
>=20
> 		link2 {
> 			function =3D LED_FUNCTION_RSSI;
> 			color =3D <LED_COLOR_ID_GREEN>;
> 			gpios =3D <&gpio 14 GPIO_ACTIVE_LOW>;
> 		};
>=20
> 		link3 {
> 			function =3D LED_FUNCTION_RSSI;
> 			color =3D <LED_COLOR_ID_GREEN>;
> 			gpios =3D <&gpio 15 GPIO_ACTIVE_LOW>;
> 		};
> 	};

Well, this is not really three LEDs. This is more like... LED meter
composed of three LEDs. And we don't have good support for that.

But I guess we'll need it one day. There were some previous attempts:
https://lwn.net/Articles/802967/

Do you plan to control RSSI LEDs from kernel?

Best regards,
								Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--y0ulUmNC+osPPQO6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCX2c4GgAKCRAw5/Bqldv6
8o55AJ9S2pL7pxTV5pM4IY4luuU84Ste0ACgp1s4y+Ao5w8ZFJUkBBumhWMZ0C8=
=NQyc
-----END PGP SIGNATURE-----

--y0ulUmNC+osPPQO6--
