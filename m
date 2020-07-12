Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6075421C805
	for <lists+linux-leds@lfdr.de>; Sun, 12 Jul 2020 10:14:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728467AbgGLIOW (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 12 Jul 2020 04:14:22 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:49738 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725974AbgGLIOW (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 12 Jul 2020 04:14:22 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id F268E1C0BDD; Sun, 12 Jul 2020 10:14:19 +0200 (CEST)
Date:   Sun, 12 Jul 2020 10:14:19 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Dan Murphy <dmurphy@ti.com>, linux-leds@vger.kernel.org
Subject: Re: [PATCH] leds: gpio: Fix semantic error
Message-ID: <20200712081419.GH8295@amd>
References: <20200703181338.602569-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="9sSKoi6Rw660DLir"
Content-Disposition: inline
In-Reply-To: <20200703181338.602569-1-linus.walleij@linaro.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--9sSKoi6Rw660DLir
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri 2020-07-03 20:13:38, Linus Walleij wrote:
> The leds-gpio driver mixes up the legacy GPIO flags with the
> GPIO descriptor flags and passes a legacy flag to
> devm_gpiod_get_index().
>=20
> Fix this by replacing the flags variable with the strict
> descriptor flag.
>=20
> Fixes: 45d4c6de4e49 ("leds: gpio: Try to lookup gpiod from device")
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Thanks, applied.
								Pavel
							=09
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--9sSKoi6Rw660DLir
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl8KxlsACgkQMOfwapXb+vL+WwCeLCKCJ79U141plWdAhAIUCht8
ezQAn3UxlovM4Z5/KrfX7+30sYja2yIB
=9QNy
-----END PGP SIGNATURE-----

--9sSKoi6Rw660DLir--
