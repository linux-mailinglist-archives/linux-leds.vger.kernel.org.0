Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F8E4229884
	for <lists+linux-leds@lfdr.de>; Wed, 22 Jul 2020 14:49:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726841AbgGVMtb (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 22 Jul 2020 08:49:31 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:54018 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726161AbgGVMtb (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 22 Jul 2020 08:49:31 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 8E2601C0BD8; Wed, 22 Jul 2020 14:49:28 +0200 (CEST)
Date:   Wed, 22 Jul 2020 14:49:28 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     "Alexander A. Klimov" <grandmaster@al2klimov.de>
Cc:     jacek.anaszewski@gmail.com, dmurphy@ti.com, robh+dt@kernel.org,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] leds: Replace HTTP links with HTTPS ones
Message-ID: <20200722124928.3gya2v3g6g2mdgia@duo.ucw.cz>
References: <20200713145115.35121-1-grandmaster@al2klimov.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="kj5yxf4eo4ywrkfx"
Content-Disposition: inline
In-Reply-To: <20200713145115.35121-1-grandmaster@al2klimov.de>
User-Agent: NeoMutt/20180716
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--kj5yxf4eo4ywrkfx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> Rationale:
> Reduces attack surface on kernel devs opening the links for MITM
> as HTTPS traffic is much harder to manipulate.
>=20
> Deterministic algorithm:
> For each file:
>   If not .svg:
>     For each line:
>       If doesn't contain `\bxmlns\b`:
>         For each link, `\bhttp://[^# \t\r\n]*(?:\w|/)`:
> 	  If neither `\bgnu\.org/license`, nor `\bmozilla\.org/MPL\b`:
>             If both the HTTP and HTTPS versions
>             return 200 OK and serve the same content:
>               Replace HTTP with HTTPS.
>=20
> Signed-off-by: Alexander A. Klimov <grandmaster@al2klimov.de>

Thanks, applied.
								Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--kj5yxf4eo4ywrkfx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCXxg12AAKCRAw5/Bqldv6
8kj8AKC0kAL1fOx5tgtV1gIAvHOIwWwj6QCgsq0+6+rj1i2Lvg6b7fEjCUEEzxc=
=XAWI
-----END PGP SIGNATURE-----

--kj5yxf4eo4ywrkfx--
