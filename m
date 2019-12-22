Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AF585128F53
	for <lists+linux-leds@lfdr.de>; Sun, 22 Dec 2019 19:33:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726623AbfLVSdZ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 22 Dec 2019 13:33:25 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:54618 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725932AbfLVSdY (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 22 Dec 2019 13:33:24 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 2E2841C2453; Sun, 22 Dec 2019 19:33:23 +0100 (CET)
Date:   Sun, 22 Dec 2019 19:33:22 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Dan Murphy <dmurphy@ti.com>
Cc:     jacek.anaszewski@gmail.com, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v17 17/19] leds: lp5523: Fix checkpatch issues in the code
Message-ID: <20191222183322.GF23369@amd>
References: <20191114133023.32185-1-dmurphy@ti.com>
 <20191114133023.32185-18-dmurphy@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="Mjqg7Yu+0hL22rav"
Content-Disposition: inline
In-Reply-To: <20191114133023.32185-18-dmurphy@ti.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--Mjqg7Yu+0hL22rav
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu 2019-11-14 07:30:21, Dan Murphy wrote:
> Fix checkpatch errors and warnings for the LP5523.c device
> driver.
>=20
> Signed-off-by: Dan Murphy <dmurphy@ti.com>

Acked-by: Pavel Machek <pavel@ucw.cz>


--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--Mjqg7Yu+0hL22rav
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl3/tvIACgkQMOfwapXb+vKgHQCcDF45TOB9XMEUWoFzZQ2nmjM8
R8QAoLn56L5kxNd2H28sNa83nBGjJbEi
=aRxM
-----END PGP SIGNATURE-----

--Mjqg7Yu+0hL22rav--
