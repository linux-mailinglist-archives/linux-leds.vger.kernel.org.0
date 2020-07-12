Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E748821C812
	for <lists+linux-leds@lfdr.de>; Sun, 12 Jul 2020 10:28:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728070AbgGLI2U (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 12 Jul 2020 04:28:20 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:50526 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725974AbgGLI2T (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 12 Jul 2020 04:28:19 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 2C39F1C0BD2; Sun, 12 Jul 2020 10:28:17 +0200 (CEST)
Date:   Sun, 12 Jul 2020 10:28:16 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Dan Murphy <dmurphy@ti.com>, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: Re: [PATCH][next] leds: gpio: Use struct_size() in devm_kzalloc()
Message-ID: <20200712082816.GB12285@amd>
References: <20200619221403.GA12097@embeddedor>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="/NkBOFFp2J2Af1nK"
Content-Disposition: inline
In-Reply-To: <20200619221403.GA12097@embeddedor>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--/NkBOFFp2J2Af1nK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri 2020-06-19 17:14:03, Gustavo A. R. Silva wrote:
> Make use of the struct_size() helper instead of an open-coded version
> in order to avoid any potential type mistakes. Also, remove unnecessary
> function sizeof_gpio_leds_priv().
>=20
> This code was detected with the help of Coccinelle and, audited and
> fixed manually.
>=20
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Thanks, applied.
							Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--/NkBOFFp2J2Af1nK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl8KyaAACgkQMOfwapXb+vIxPACeMwqbV6ognQ842m9RCMe1jf61
43QAn2DTgcddgx0du0EsXNVu80K7AZK/
=0HiM
-----END PGP SIGNATURE-----

--/NkBOFFp2J2Af1nK--
