Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A8D2B3CAA5
	for <lists+linux-leds@lfdr.de>; Tue, 11 Jun 2019 14:01:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404340AbfFKMB7 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 11 Jun 2019 08:01:59 -0400
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:35740 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404218AbfFKMB6 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 11 Jun 2019 08:01:58 -0400
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
        id 4443F80233; Tue, 11 Jun 2019 14:01:46 +0200 (CEST)
Date:   Tue, 11 Jun 2019 14:01:56 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc:     Oleh Kravchenko <oleg@kaa.org.ua>, Dan Murphy <dmurphy@ti.com>,
        linux-leds@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: Add docs for EL15203000
Message-ID: <20190611120156.GA1161@amd>
References: <27c0b356-8111-6b36-23cc-8e654147178f@kaa.org.ua>
 <b6a5cc5e-74f1-d328-7a47-995670ba7aa7@ti.com>
 <adf5a755-c534-64c3-6e99-ba39ffea95e2@kaa.org.ua>
 <2eba86cb-01be-c002-32d0-80ab2ab14f97@gmail.com>
 <7e787498-537b-390d-589a-577f34ffbc3f@kaa.org.ua>
 <94968b55-a9cc-277e-ac25-bf765f9db138@kaa.org.ua>
 <e1fc84a1-75e4-6c56-d2ea-f6ade28087ac@kaa.org.ua>
 <e4e0223d-c463-e767-12b2-7e360eac000b@gmail.com>
 <38050529-5730-6e88-fe1a-909492711dd0@kaa.org.ua>
 <8f658d57-5079-ad76-ce3e-af3d031b4685@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="C7zPtVaVf+AK4Oqc"
Content-Disposition: inline
In-Reply-To: <8f658d57-5079-ad76-ce3e-af3d031b4685@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--C7zPtVaVf+AK4Oqc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> >I just want to clerify - for now LEDs board has 2 from 3 LEDs with effec=
t function.
> >
> >1. Screen frame led is just blinking, so blink_set() is fit well to this.
> >2. Pipe led actually consist from 3 leds and when effect is enabled next=
 pattern is used:
> >
> >       ^
> >       |
> >LED1  >   OFF  ON   ON   ON
> >       |
> >LED2  >   OFF  OFF  ON   ON
> >       |
> >LED3  >   OFF  OFF  OFF  ON
> >       |
> >       +----^----^----^----^----> time
>=20
> Pattern trigger applies to a single LED so it won't fit for this
> pattern.
>=20
> Currently we don't support patterns spanning on multiple LEDs,
> so you would have to come up with your own solution.
>=20
> What I can recommend is a trigger that would be created by your driver
> and would activate this sequence.

Yes, please.

While adding custom files to sysfs may appear easier, we'll need
"led-specific-triggers" for other reasons.

And for the record... Handling 3 LEDs as one is not something usual in
the LED subsystem; I guess it makes sense in your specific case, but
hopefully noone will copy that design.

(I guess they are not individually controllable?)

									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--C7zPtVaVf+AK4Oqc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlz/mDMACgkQMOfwapXb+vKWzgCgiPgB2oU0imIW7b++aMkJyPcd
5gIAnRlHpBLsgyLVhIIEWlrA1J+gujeg
=ZIFz
-----END PGP SIGNATURE-----

--C7zPtVaVf+AK4Oqc--
