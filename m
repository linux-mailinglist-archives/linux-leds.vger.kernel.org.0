Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7CACD1B7081
	for <lists+linux-leds@lfdr.de>; Fri, 24 Apr 2020 11:18:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726347AbgDXJSJ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 24 Apr 2020 05:18:09 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:47618 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726298AbgDXJSJ (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 24 Apr 2020 05:18:09 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 538E31C021D; Fri, 24 Apr 2020 11:18:07 +0200 (CEST)
Date:   Fri, 24 Apr 2020 11:18:06 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Lubomir Rintel <lkundrak@v3.sk>
Cc:     Dan Murphy <dmurphy@ti.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
Subject: Re: [PATCH v3] leds: ariel: Add driver for status LEDs on Dell Wyse
 3020
Message-ID: <20200424091806.GA2647@amd>
References: <20200322074134.79237-1-lkundrak@v3.sk>
 <ef7e8f03-0a43-156e-b86e-3ab3887f0245@ti.com>
 <20200417095041.GA448088@furthur.local>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="pWyiEgJYm5f9v55/"
Content-Disposition: inline
In-Reply-To: <20200417095041.GA448088@furthur.local>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--pWyiEgJYm5f9v55/
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > > +enum ec_index {
> > > +	EC_BLUE_LED	=3D 0x01,
> > > +	EC_AMBER_LED	=3D 0x02,
> >=20
> > Defining the value after the 0x0 is unnecessary as enums are incremental
> > only the first value needs to be defined if the following values are in
> > numerical order
>=20
> I believe this improves readability, especially in case such as this
> where the actual numeric values matter.
>=20
> > Can these also be #defined instead of an enum?=A0 Not requesting them t=
o be
> > just wondering about the design decision here.
>=20
> It seems to be that this is what enums are for and theres is no need to
> get the preprocessor involved?
>=20
> I guess this might be a personal preference, but it seems to me that
> both enums and preprocessor defines are used across the code base.

enums are okay.

> > > +	if (regmap_read(led->ec_ram, led->ec_index, &led_status))
> > > +		return LED_OFF;
> > > +
> > > +	if (led_status =3D=3D EC_LED_STILL)
> > > +		return LED_FULL;
> > > +	else
> > else is not needed here
> > > +		return LED_OFF;
> > > +}
>=20
> Yes, but should it be dropped? To me it seems like explicit else is
> better than implicit fallthrough. It is better when it's obvious that
> the LED_OFF is returned precisely only when the status is not
> EC_LED_STILL and that nothing ever happens afterwards -- and the
> compiler/linter will warn when anything unreachable is added afterwards.
>=20
> Not that it matters too much here. It's just that I've done this
> deliberately because it seems more readable to be and would prefer to
> leave it that way unless you really really care about that.

Both versions are okay. I may have tiny bit of preference for deleting
the else, but...

Thank you,
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--pWyiEgJYm5f9v55/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl6irs4ACgkQMOfwapXb+vK8kwCcCDKtiMSJ18qVzInjas7lgLgy
yIoAoIz4gszqMa7jJj2MT69quZ/KKDOB
=rDXr
-----END PGP SIGNATURE-----

--pWyiEgJYm5f9v55/--
