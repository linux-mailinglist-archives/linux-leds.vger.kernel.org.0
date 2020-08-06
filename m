Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E25623E212
	for <lists+linux-leds@lfdr.de>; Thu,  6 Aug 2020 21:25:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726204AbgHFTZG (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 6 Aug 2020 15:25:06 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:37374 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725272AbgHFTZG (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 6 Aug 2020 15:25:06 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 543C61C0BD2; Thu,  6 Aug 2020 21:25:03 +0200 (CEST)
Date:   Thu, 6 Aug 2020 21:24:54 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Alexander Dahl <ada@thorsis.com>
Cc:     linux-leds@vger.kernel.org, Luca Weiss <luca@z3ntu.xyz>
Subject: Re: Multicolor leds-gpio
Message-ID: <20200806192454.qasvwnqh33iavkf4@duo.ucw.cz>
References: <2530787.iFCFyWWcSu@g550jk>
 <20200805220547.mkjtuzcitwrb6whn@duo.ucw.cz>
 <2050851.IQFrM7rjFq@ada>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="rcz57kykwdsu2g4q"
Content-Disposition: inline
In-Reply-To: <2050851.IQFrM7rjFq@ada>
User-Agent: NeoMutt/20180716
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--rcz57kykwdsu2g4q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > > would it be possible to make the leds-gpio driver compatible with the=
 new
> > > multicolor framework for a light that's composed of 3 leds (red, gree=
n,
> > > blue) and where each led is controlled via a gpio (so it can produce 8
> > > different colors)? As far as I can tell leds-gpio is too generic to
> > > support that but please correct me if I'm wrong. What's the way forwa=
rd
> > > here for this use case? The same probably also applies to leds-pwm.
> >=20
> > For pwm it definitely makes sense.
>=20
> I think it also makes sense for plain GPIO, I asked the same thing last y=
ear=20
> IIRC.

It may make sense, yes.

> > For gpio... well, I'm not sure you'll get useful colors that way. You
> > can probably still do multicolor, yes.
>=20
> Let's assume a typical RGB LED, like the one on the SAMA5D27-SOM1-EK boar=
d,=20
> you would roughly get those colors:
>=20
> - R: red
> - G: green
> - B: blue
> - R + G: yellow
> - R + B: magenta
> - G + B: cyan
> - R + G + B: white
>=20
> I count more than twice the colors as with the simple leds-gpio approach =
only.=20
> ;-)

Well, you can still produce all the colors with three gpio leds.

And for resistors are not calibrated carefully, you'll get:

- R: red
- G: green
- B: blue
- R + G: green with hint of yellow
- R + B: blue
- G + B: blue
- R + G + B: blue

:-)

But yes, patch might be interesting. Will you create one?

Best regards,
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--rcz57kykwdsu2g4q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCXyxZBgAKCRAw5/Bqldv6
8kypAKC6TcnCqLaNtOAA8Fece3O5EeeBlwCcDTR/ZpqRtr3n9xhDYbBJl48KdWk=
=0/DG
-----END PGP SIGNATURE-----

--rcz57kykwdsu2g4q--
