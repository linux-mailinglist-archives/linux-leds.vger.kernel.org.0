Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EF26E370C7
	for <lists+linux-leds@lfdr.de>; Thu,  6 Jun 2019 11:50:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728116AbfFFJt3 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 6 Jun 2019 05:49:29 -0400
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:45277 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727734AbfFFJt3 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 6 Jun 2019 05:49:29 -0400
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
        id BF86280379; Thu,  6 Jun 2019 11:49:17 +0200 (CEST)
Date:   Thu, 6 Jun 2019 11:49:27 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Dan Murphy <dmurphy@ti.com>
Cc:     jacek.anaszewski@gmail.com, broonie@kernel.org,
        lgirdwood@gmail.com, lee.jones@linaro.org,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v5 2/6] dt-bindings: mfd: Add lm36274 bindings to ti-lmu
Message-ID: <20190606094926.GC975@amd>
References: <20190604174345.14841-1-dmurphy@ti.com>
 <20190604174345.14841-3-dmurphy@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="XWOWbaMNXpFDWE00"
Content-Disposition: inline
In-Reply-To: <20190604174345.14841-3-dmurphy@ti.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--XWOWbaMNXpFDWE00
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue 2019-06-04 12:43:41, Dan Murphy wrote:
> Add the LM36274 backlight driver with regulator support.
> This is a multi-function device for backlight applications.
>=20
> Backlight properties will be documented in it's a supplemental
> bindings document.
>=20
> Regulator support is documented in the regulator/lm363x-regulator.txt
>=20
> http://www.ti.com/lit/ds/symlink/lm36274.pdf
>=20
> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Acked-by: Lee Jones <lee.jones@linaro.org>
> Signed-off-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>

Acked-by: Pavel Machek <pavel@ucw.cz>

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--XWOWbaMNXpFDWE00
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlz44aYACgkQMOfwapXb+vK9sgCgtdTs0CxoahksYCg/Lkvf+yNm
8pMAoKKYUhNBsxGT/bUFKhbiaFQupr4Y
=XMMM
-----END PGP SIGNATURE-----

--XWOWbaMNXpFDWE00--
