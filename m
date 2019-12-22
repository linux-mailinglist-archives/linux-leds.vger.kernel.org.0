Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A1683128F4F
	for <lists+linux-leds@lfdr.de>; Sun, 22 Dec 2019 19:30:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726048AbfLVSaQ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 22 Dec 2019 13:30:16 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:54352 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725919AbfLVSaQ (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 22 Dec 2019 13:30:16 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 01DB21C228F; Sun, 22 Dec 2019 19:30:14 +0100 (CET)
Date:   Sun, 22 Dec 2019 19:30:14 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Dan Murphy <dmurphy@ti.com>
Cc:     jacek.anaszewski@gmail.com, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v17 12/19] leds: lp55xx: Convert LED class registration
 to devm_*
Message-ID: <20191222183014.GD23369@amd>
References: <20191114133023.32185-1-dmurphy@ti.com>
 <20191114133023.32185-13-dmurphy@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="ZARJHfwaSJQLOEUz"
Content-Disposition: inline
In-Reply-To: <20191114133023.32185-13-dmurphy@ti.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--ZARJHfwaSJQLOEUz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu 2019-11-14 07:30:16, Dan Murphy wrote:
> Convert the LED class registration calls to the LED devm_*
> registration calls.
>=20
> Signed-off-by: Dan Murphy <dmurphy@ti.com>

Nothing obviously wrong here. Was it tested?

Acked-by: Pavel Machek <pavel@ucw.cz>

Best regards,
							Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--ZARJHfwaSJQLOEUz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl3/tjYACgkQMOfwapXb+vJFwACgpjp66oc30u2GmCjJyR03N/i3
husAoKDT0M63clwSKSCQthi31W6PrSzv
=73iq
-----END PGP SIGNATURE-----

--ZARJHfwaSJQLOEUz--
