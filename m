Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 84754277BB
	for <lists+linux-leds@lfdr.de>; Thu, 23 May 2019 10:12:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726309AbfEWIMd (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 23 May 2019 04:12:33 -0400
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:52137 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726070AbfEWIMd (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 23 May 2019 04:12:33 -0400
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
        id D75F180312; Thu, 23 May 2019 10:12:21 +0200 (CEST)
Date:   Thu, 23 May 2019 10:12:31 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Dan Murphy <dmurphy@ti.com>
Cc:     jacek.anaszewski@gmail.com, broonie@kernel.org,
        lgirdwood@gmail.com, lee.jones@linaro.org,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RESEND PATCH v4 4/6] regulator: lm363x: Add support for LM36274
Message-ID: <20190523081231.GB20460@amd>
References: <20190522192733.13422-1-dmurphy@ti.com>
 <20190522192733.13422-5-dmurphy@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="tsOsTdHNUZQcU9Ye"
Content-Disposition: inline
In-Reply-To: <20190522192733.13422-5-dmurphy@ti.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--tsOsTdHNUZQcU9Ye
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed 2019-05-22 14:27:31, Dan Murphy wrote:
> Adding regulator support for the LM36274 backlight driver.
> This device can leverage this existing code as the functionality
> and registers are common enough between the LM36274 and the LM363x
> series of devices.
>=20
> Signed-off-by: Dan Murphy <dmurphy@ti.com>

Acked-by: Pavel Machek <pavel@ucw.cz>

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--tsOsTdHNUZQcU9Ye
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlzmVe8ACgkQMOfwapXb+vIZvwCdGjWPuXPS5trKLZTmMSOjaYQM
HjEAnROTQv3lgMrBAw1z8Xc1q+1zrC5w
=E+Tw
-----END PGP SIGNATURE-----

--tsOsTdHNUZQcU9Ye--
