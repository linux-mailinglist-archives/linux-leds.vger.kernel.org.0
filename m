Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B9D29370E9
	for <lists+linux-leds@lfdr.de>; Thu,  6 Jun 2019 11:53:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728009AbfFFJxg (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 6 Jun 2019 05:53:36 -0400
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:45421 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727971AbfFFJxg (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 6 Jun 2019 05:53:36 -0400
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
        id 09FA980344; Thu,  6 Jun 2019 11:53:23 +0200 (CEST)
Date:   Thu, 6 Jun 2019 11:53:33 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Dan Murphy <dmurphy@ti.com>
Cc:     jacek.anaszewski@gmail.com, broonie@kernel.org,
        lgirdwood@gmail.com, lee.jones@linaro.org,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 3/5] regulator: lm363x: Add support for LM36274
Message-ID: <20190606095333.GE975@amd>
References: <20190605125634.7042-1-dmurphy@ti.com>
 <20190605125634.7042-4-dmurphy@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="lkTb+7nhmha7W+c3"
Content-Disposition: inline
In-Reply-To: <20190605125634.7042-4-dmurphy@ti.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--lkTb+7nhmha7W+c3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed 2019-06-05 07:56:32, Dan Murphy wrote:
> Adding regulator support for the LM36274 backlight driver.
> This device can leverage this existing code as the functionality
> and registers are common enough between the LM36274 and the LM363x
> series of devices.
>=20
> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> Signed-off-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>

Acked-by: Pavel Machek <pavel@ucw.cz>

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--lkTb+7nhmha7W+c3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlz44p0ACgkQMOfwapXb+vJ8gACZAUAWUAhWCvT5/ElizOgFcglt
b/IAoL+eFksbXrdw+yKf2A46WjjwBzPJ
=3FpW
-----END PGP SIGNATURE-----

--lkTb+7nhmha7W+c3--
