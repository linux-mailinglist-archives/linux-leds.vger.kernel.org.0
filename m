Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 431F9128B9A
	for <lists+linux-leds@lfdr.de>; Sat, 21 Dec 2019 22:04:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726900AbfLUVEO (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 21 Dec 2019 16:04:14 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:52586 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726763AbfLUVEO (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 21 Dec 2019 16:04:14 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 183EC1C24A9; Sat, 21 Dec 2019 22:04:12 +0100 (CET)
Date:   Sat, 21 Dec 2019 22:04:06 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>
Cc:     linux-realtek-soc@lists.infradead.org, linux-leds@vger.kernel.org,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Dan Murphy <dmurphy@ti.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [RFC 22/25] leds: tm1826: Add combined glyph support
Message-ID: <20191221210406.GA13125@amd>
References: <20191212033952.5967-1-afaerber@suse.de>
 <20191212033952.5967-23-afaerber@suse.de>
 <20191221202755.GN32732@amd>
 <506d0697-1820-7811-1b38-910355812948@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="0F1p//8PRICkK4MW"
Content-Disposition: inline
In-Reply-To: <506d0697-1820-7811-1b38-910355812948@suse.de>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--0F1p//8PRICkK4MW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> >>Allow to squeeze the text "HEllO" into a 4-digit display,
> >>as seen on MeLE V9 TV box.
> >>
> >>Enable this combining mode only if the text would overflow.
> >
> >"HEll,nO"!
> >
> >:-)
> >
> >Ok, it is kind of cool, but... Can you take a look at
> >drivers/auxdisplay/charlcd.c ? It seems to support some kind of text
> >displays...
>=20
> Why don't you look at it before making such a suggestion? ;) It is in no =
way
> useful, as I pointed out in my cover letter. The only thing related today,
> as Geert pointed out, is in the input subsystem.

Okay, so maybe we should get

AUXILIARY DISPLAY DRIVERS
M:      Miguel Ojeda Sandonis <miguel.ojeda.sandonis@gmail.com>

on the Cc: list? What you really have is a display, not a bunch of LEDs.

> If you don't want this in leds, you'll have to help make leds subsystem m=
ore
> useful to external users - the latest function refactoring has been anyth=
ing
> but helpful here, as you've seen with the indicators, and we're completely
> lacking any indexing or bulk operations on the LED controller level, since
> you treat each LED as a standalone device. That's precisely why this code=
 is
> here in leds although - as I pointed out - it shouldn't belong here.

Well, your introduction mail was kind of long :-).

If someone wants to do heartbeat on

 --
|  | <- this segment
 --
|  |
 --

they are probably crazy. We may not want to support that. What about
doing it as auxdisplay driver, and then exporting the indicators
around that as LEDs?

Having USB activity trigger on 'USB' icon makes sense, on the other
hand. That would still be supported.

Hmm?
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--0F1p//8PRICkK4MW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl3+iMYACgkQMOfwapXb+vLZQgCghm+4BSW3+dMlaHTM2YeWiyDT
cAAAoKpPCbi0WzsihqRnnB2sB8k3SOLa
=w2fT
-----END PGP SIGNATURE-----

--0F1p//8PRICkK4MW--
