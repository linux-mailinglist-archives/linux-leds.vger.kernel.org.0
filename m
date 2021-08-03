Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BDB063DF6F5
	for <lists+linux-leds@lfdr.de>; Tue,  3 Aug 2021 23:38:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231127AbhHCVjK (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 3 Aug 2021 17:39:10 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:38634 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232384AbhHCVjJ (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 3 Aug 2021 17:39:09 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id DB5BF1C0B7A; Tue,  3 Aug 2021 23:38:56 +0200 (CEST)
Date:   Tue, 3 Aug 2021 23:38:56 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Amy Parker <apark0006@student.cerritos.edu>,
        linux-leds <linux-leds@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH 1/2] swap led_brightness from enum to typedef
Message-ID: <20210803213855.GA30387@amd>
References: <cover.1626383424.git.apark0006@student.cerritos.edu>
 <9b5902665dcc4c0fca7546987303e348d8657f59.1626383424.git.apark0006@student.cerritos.edu>
 <alpine.DEB.2.22.394.2107190912320.178229@ramsan.of.borg>
 <CAMuHMdXZcaR28fUuiNWF8jv-NnOYkAXxR8z+vOQ2rY3BqQMWTQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="Dxnq1zWXvFF0Q93v"
Content-Disposition: inline
In-Reply-To: <CAMuHMdXZcaR28fUuiNWF8jv-NnOYkAXxR8z+vOQ2rY3BqQMWTQ@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--Dxnq1zWXvFF0Q93v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > > The TODO located at drivers/leds/TODO requests:
> > >
> > > * Get rid of led_brightness
> > >
> > > It is really an integer, as maximum is configurable. Get rid of it, or
> > > make it into typedef or something.
> > >
> > > This patch changes the declaration of led_brightness from an enum to a
> > > typedef. In order to hold the currently existing enum values, macro
> > > definitions are provided. Files which use led_brightness are updated =
to
> > > conform to the new types.
> > >
> > > Signed-off-by: Amy Parker <apark0006@student.cerritos.edu>
> >
> > Thanks for your patch!
> >
> > > 207 files changed, 437 insertions(+), 438 deletions(-)
> >
> > This touches a lot of files, so we better get it right.
> >
> > > --- a/include/linux/leds.h
> > > +++ b/include/linux/leds.h
> > > @@ -26,12 +26,11 @@ struct device_node;
> > >  */
> > >
> > > /* This is obsolete/useless. We now support variable maximum brightne=
ss. */
> > > -enum led_brightness {
> > > -     LED_OFF         =3D 0,
> > > -     LED_ON          =3D 1,
> > > -     LED_HALF        =3D 127,
> > > -     LED_FULL        =3D 255,
> > > -};
> > > +typedef u8 led_brightness;
> >
> > In general, typedefs are frowned upon in the kernel, but there can be a
> > good reason to use one.
> > What if the maximum brightness is larger than 255?
> > Using "unsigned int" sounds better to me, but let's wait for Pavel...
>=20
> And as Dan just pointed out, "signed int" would be even better, as it
> would allow a function to return an error code.

We can not apply huge patch all at once, and changing from enum to int
directly will result in warnings in some configurations, no?

Agreed that int would be good.

Best regards,
								Pavel

--=20
http://www.livejournal.com/~pavelmachek

--Dxnq1zWXvFF0Q93v
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAmEJt28ACgkQMOfwapXb+vLrDACeLYg44ClynSPwfyzZhQonro29
ypwAnRkiArkpjCD+lk/lAFDe0o4lnu0A
=CCEG
-----END PGP SIGNATURE-----

--Dxnq1zWXvFF0Q93v--
