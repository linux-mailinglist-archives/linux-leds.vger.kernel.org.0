Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BBAC03C91C
	for <lists+linux-leds@lfdr.de>; Tue, 11 Jun 2019 12:39:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727390AbfFKKjZ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 11 Jun 2019 06:39:25 -0400
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:33536 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725811AbfFKKjY (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 11 Jun 2019 06:39:24 -0400
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
        id B140780239; Tue, 11 Jun 2019 12:39:12 +0200 (CEST)
Date:   Tue, 11 Jun 2019 12:39:22 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Oleh Kravchenko <oleg@kaa.org.ua>
Cc:     Dan Murphy <dmurphy@ti.com>, devicetree@vger.kernel.org,
        linux-leds@vger.kernel.org
Subject: Re: [PATCH v2 2/2] leds: add LED driver for EL15203000 board
Message-ID: <20190611103922.GB20775@amd>
References: <20190607190351.14092-2-oleg@kaa.org.ua>
 <50e38b87-a7ab-d83b-c4d4-7db9760cfdd6@ti.com>
 <cf0e62c5-2502-19d2-5956-f262eee2255d@kaa.org.ua>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="2B/JsCI69OhZNC5r"
Content-Disposition: inline
In-Reply-To: <cf0e62c5-2502-19d2-5956-f262eee2255d@kaa.org.ua>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--2B/JsCI69OhZNC5r
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> >> +=A0=A0=A0 u8=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 cmd[2];
> >
> > I am wondering if you should #define this as well.
> It's used only in one place, should I really wrap it to define?
> >
> > Then the #define can be used here and then in the for loop.
> >
> > There is no reason to do ARRAY_SIZE if it will always be 2.
>=20
> Result of ARRAY_SIZE() will be always constant and actually it=A0 can be =
avoided by define.
>=20
> But I prefer ARRAY_SIZE() :-)

Me too.

> > As pointed out your max_brightness is a binary and the 0x32 is an effec=
t you technically don't even need max_brightness if you
> >
> > expose the effects as a file.
> >
> > Does 0x32 turn the LED on or off?=A0 Or does it blink the LED?
>=20
> It depends on LED board,
>=20
> it can blink.
> It can play scene on LED array.
> It can blink smoothly.
>=20
> But it depend on the board, not a protocol.

But we expect drivers to control the boards, not protocols.

									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--2B/JsCI69OhZNC5r
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlz/hNoACgkQMOfwapXb+vK/RwCdGfCYEc19XIHAe3yG9TVrctvm
qVcAn2l6n9kA5ip3uolH5trhKnbzBipx
=4t39
-----END PGP SIGNATURE-----

--2B/JsCI69OhZNC5r--
