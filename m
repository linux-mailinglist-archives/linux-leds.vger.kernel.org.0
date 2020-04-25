Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E1C3C1B8952
	for <lists+linux-leds@lfdr.de>; Sat, 25 Apr 2020 22:24:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726378AbgDYUYY (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 25 Apr 2020 16:24:24 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:53806 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726203AbgDYUYY (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 25 Apr 2020 16:24:24 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id C15F91C0239; Sat, 25 Apr 2020 22:24:22 +0200 (CEST)
Date:   Sat, 25 Apr 2020 22:24:22 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Dan Murphy <dmurphy@ti.com>
Cc:     jacek.anaszewski@gmail.com, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v20 04/17] dt: bindings: lp50xx: Introduce the lp50xx
 family of RGB drivers
Message-ID: <20200425202422.GB23926@amd>
References: <20200423155524.13971-1-dmurphy@ti.com>
 <20200423155524.13971-5-dmurphy@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="24zk1gE8NUlDmwG9"
Content-Disposition: inline
In-Reply-To: <20200423155524.13971-5-dmurphy@ti.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--24zk1gE8NUlDmwG9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> Introduce the bindings for the Texas Instruments LP5036, LP5030, LP5024,
> LP5018, LP5012 and LP5009 RGB LED device driver.  The LP5036/30/24/18/12/9
> can control RGB LEDs individually or as part of a control bank group.
> These devices have the ability to adjust the mixing control for the RGB
> LEDs to obtain different colors independent of the overall brightness of
> the LED grouping.
>=20
> Datasheet:
> http://www.ti.com/lit/ds/symlink/lp5012.pdf
> http://www.ti.com/lit/ds/symlink/lp5024.pdf
> http://www.ti.com/lit/ds/symlink/lp5036.pdf
>=20
> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> ---
>  .../devicetree/bindings/leds/leds-lp50xx.txt  | 148 ++++++++++++++++++

Not sure here, but should new bindings be .yml?
								Pavel
							=09
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--24zk1gE8NUlDmwG9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl6knHYACgkQMOfwapXb+vJNVwCgpSc/5s3nDzcUOoZVvDJcSHUQ
fXUAn2iYGcgsomZyT6ouUAqxH+Irmssk
=56x6
-----END PGP SIGNATURE-----

--24zk1gE8NUlDmwG9--
