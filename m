Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 247F012AB95
	for <lists+linux-leds@lfdr.de>; Thu, 26 Dec 2019 11:16:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726023AbfLZKQR (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 26 Dec 2019 05:16:17 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:42804 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725954AbfLZKQR (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 26 Dec 2019 05:16:17 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 9BEFD1C213B; Thu, 26 Dec 2019 11:16:15 +0100 (CET)
Date:   Thu, 26 Dec 2019 11:16:14 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Dan Murphy <dmurphy@ti.com>, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] leds: lm3692x: Split out lm3692x_leds_disable
Message-ID: <20191226101614.GG4033@amd>
References: <cover.1577272495.git.agx@sigxcpu.org>
 <dce4e011e5172c4ded5f5a41f7b4f1154ac1ff66.1577272495.git.agx@sigxcpu.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="APlYHCtpeOhspHkB"
Content-Disposition: inline
In-Reply-To: <dce4e011e5172c4ded5f5a41f7b4f1154ac1ff66.1577272495.git.agx@sigxcpu.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--APlYHCtpeOhspHkB
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed 2019-12-25 12:16:38, Guido G=FCnther wrote:
> Move the relevant parts out of lm3692x_remove() and
> call it from there. No functional change.
>=20
> Signed-off-by: Guido G=FCnther <agx@sigxcpu.org>

Acked-by: Pavel Machek <pavel@ucw.cz>

								Pavel
							=09
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--APlYHCtpeOhspHkB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl4EiG4ACgkQMOfwapXb+vLSYQCfetPyh2iTsT94abcM8grFtKiX
+iUAoLdZAOWsW4DHiRv0LtIWbLtnFECv
=yUqk
-----END PGP SIGNATURE-----

--APlYHCtpeOhspHkB--
