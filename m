Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E1349370DB
	for <lists+linux-leds@lfdr.de>; Thu,  6 Jun 2019 11:52:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727992AbfFFJw5 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 6 Jun 2019 05:52:57 -0400
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:45405 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727943AbfFFJw5 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 6 Jun 2019 05:52:57 -0400
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
        id EFB7E80344; Thu,  6 Jun 2019 11:52:44 +0200 (CEST)
Date:   Thu, 6 Jun 2019 11:52:54 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Dan Murphy <dmurphy@ti.com>
Cc:     jacek.anaszewski@gmail.com, broonie@kernel.org,
        lgirdwood@gmail.com, lee.jones@linaro.org,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 2/5] mfd: ti-lmu: Add LM36274 support to the ti-lmu
Message-ID: <20190606095254.GD975@amd>
References: <20190605125634.7042-1-dmurphy@ti.com>
 <20190605125634.7042-3-dmurphy@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="W5WqUoFLvi1M7tJE"
Content-Disposition: inline
In-Reply-To: <20190605125634.7042-3-dmurphy@ti.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--W5WqUoFLvi1M7tJE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed 2019-06-05 07:56:31, Dan Murphy wrote:
> Add the LM36274 register support to the ti-lmu MFD driver.
>=20
> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> Acked-by: Lee Jones <lee.jones@linaro.org>
> Signed-off-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>

Acked-by: Pavel Machek <pavel@ucw.cz>

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--W5WqUoFLvi1M7tJE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlz44nYACgkQMOfwapXb+vIBfQCdGk9xzjbE/vpGRQZQMv7ssEGl
3SEAn2M45JHgQNJh7SsqvBboBx6h5iHt
=WjkQ
-----END PGP SIGNATURE-----

--W5WqUoFLvi1M7tJE--
