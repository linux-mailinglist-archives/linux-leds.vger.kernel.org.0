Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A8ADA128F4C
	for <lists+linux-leds@lfdr.de>; Sun, 22 Dec 2019 19:28:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725932AbfLVS2R (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 22 Dec 2019 13:28:17 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:54156 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725919AbfLVS2R (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 22 Dec 2019 13:28:17 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 2F7771C2453; Sun, 22 Dec 2019 19:28:16 +0100 (CET)
Date:   Sun, 22 Dec 2019 19:28:15 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Dan Murphy <dmurphy@ti.com>
Cc:     jacek.anaszewski@gmail.com, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v17 11/19] ARM: dts: ste-href: Add reg property to the
 LP5521 channel nodes
Message-ID: <20191222182814.GC23369@amd>
References: <20191114133023.32185-1-dmurphy@ti.com>
 <20191114133023.32185-12-dmurphy@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="adJ1OR3c6QgCpb/j"
Content-Disposition: inline
In-Reply-To: <20191114133023.32185-12-dmurphy@ti.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--adJ1OR3c6QgCpb/j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu 2019-11-14 07:30:15, Dan Murphy wrote:
> Add the reg property to each channel node.  This update is
> to accomodate the multicolor framework.  In addition to the
> accomodation this allows the LEDs to be placed on any channel
> and allow designs to skip channels as opposed to requiring
> sequential order.
>=20
> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> CC: Linus Walleij <linus.walleij@linaro.org>

Acked-by: Pavel Machek <pavel@ucw.cz>


--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--adJ1OR3c6QgCpb/j
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl3/tb4ACgkQMOfwapXb+vJj2QCfR1COG03ghB8BwnbPmaFXLDjf
aKQAn35mbNpe77PSDiBuWyQ9DE96InxB
=M1Yn
-----END PGP SIGNATURE-----

--adJ1OR3c6QgCpb/j--
