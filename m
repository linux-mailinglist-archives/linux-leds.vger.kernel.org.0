Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8BD5EAC906
	for <lists+linux-leds@lfdr.de>; Sat,  7 Sep 2019 21:36:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727130AbfIGTgP (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 7 Sep 2019 15:36:15 -0400
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:40989 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727012AbfIGTgP (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 7 Sep 2019 15:36:15 -0400
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
        id 55DF681D63; Sat,  7 Sep 2019 21:35:59 +0200 (CEST)
Date:   Sat, 7 Sep 2019 21:36:12 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Oleh Kravchenko <oleg@kaa.org.ua>
Cc:     linux-leds@vger.kernel.org
Subject: Re: [PATCH 1/2] leds: mlxreg: Fix possible buffer overflow
Message-ID: <20190907193612.GA25459@amd>
References: <20190903125020.20482-1-oleg@kaa.org.ua>
 <20190903141231.GA8199@amd>
 <E8C449CE-405A-473F-9A2F-393070C0DA28@kaa.org.ua>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="qMm9M+Fa2AknHoGS"
Content-Disposition: inline
In-Reply-To: <E8C449CE-405A-473F-9A2F-393070C0DA28@kaa.org.ua>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--qMm9M+Fa2AknHoGS
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue 2019-09-03 21:11:30, Oleh Kravchenko wrote:
> Hi Pavel,
>=20
> 3 =D0=B2=D0=B5=D1=80. 2019 =D1=80. =D0=BE 17:12 Pavel Machek <pavel@ucw.c=
z> =D0=BF=D0=B8=D1=88=D0=B5:
>=20
> >> On Tue 2019-09-03 15:50:19, Oleh Kravchenko wrote:
> >> Error was detected by PVS-Studio:
> >> V512 A call of the 'sprintf' function will lead to overflow of
> >> the buffer 'led_data->led_cdev_name'.
> >=20
> > Are you sure this is correct fix? Will the name be always properly
> > null terminated?
>=20
> snprintf() always terminate string by NULL

You are right, sorry for the noise.
									Pavel

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--qMm9M+Fa2AknHoGS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl10BqwACgkQMOfwapXb+vKaQACfcPPj5ywFzv3OgaijqINS98EJ
f1cAoKwc4Ect3pQqvjFaUmQdEtbbWgnL
=Kjnm
-----END PGP SIGNATURE-----

--qMm9M+Fa2AknHoGS--
