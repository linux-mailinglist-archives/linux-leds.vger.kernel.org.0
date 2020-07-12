Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 86F9B21C7D7
	for <lists+linux-leds@lfdr.de>; Sun, 12 Jul 2020 09:20:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727777AbgGLHUq (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 12 Jul 2020 03:20:46 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:46684 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725974AbgGLHUq (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 12 Jul 2020 03:20:46 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 80D1A1C0BD5; Sun, 12 Jul 2020 09:20:42 +0200 (CEST)
Date:   Sun, 12 Jul 2020 09:20:41 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Dan Murphy <dmurphy@ti.com>, linux-leds@vger.kernel.org,
        Ben Dooks <ben-linux@fluff.org>,
        Sylwester Nawrocki <sylvester.nawrocki@gmail.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2] leds: s3c24xx: Convert to use GPIO descriptors
Message-ID: <20200712072041.GA4721@duo.ucw.cz>
References: <20200708071149.770334-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="lrZ03NoBR/3+SXJZ"
Content-Disposition: inline
In-Reply-To: <20200708071149.770334-1-linus.walleij@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--lrZ03NoBR/3+SXJZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed 2020-07-08 09:11:49, Linus Walleij wrote:
> This converts the s3c24xx LED driver to use GPIO descriptors
> and also modify all board files to account for these changes
> by registering the appropriate GPIO tables for each board.
>=20
> The driver was using a custom flag to indicate open drain
> (tristate) but this can be handled by standard descriptor
> machine tables.
>=20
> The driver was setting non-pull-up for the pin using the custom
> S3C24xx GPIO API, but this is a custom pin control system used
> by the S3C24xx and no generic GPIO function, so this has simply
> been pushed back into the respective board files.
>=20
> Cc: Ben Dooks <ben-linux@fluff.org>
> Cc: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
> Cc: Krzysztof Kozlowski <krzk@kernel.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Acked-by: Pavel Machek <pavel@ucw.cz>

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--lrZ03NoBR/3+SXJZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCXwq5yQAKCRAw5/Bqldv6
8kKiAKDDCF93S2OVhA11EHbGogqtOX791QCeJZZiioGhiUoPu6EPMCFL6KgkiKE=
=+cnv
-----END PGP SIGNATURE-----

--lrZ03NoBR/3+SXJZ--
