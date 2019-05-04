Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 05DEA13B06
	for <lists+linux-leds@lfdr.de>; Sat,  4 May 2019 17:50:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726647AbfEDPuR (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 4 May 2019 11:50:17 -0400
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:38656 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726258AbfEDPuR (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 4 May 2019 11:50:17 -0400
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
        id E40DD80310; Sat,  4 May 2019 17:50:05 +0200 (CEST)
Date:   Sat, 4 May 2019 17:50:16 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Marek Behun <marek.behun@nic.cz>
Cc:     linux-leds@vger.kernel.org, jacek.anaszewski@gmail.com,
        Dan Murphy <dmurphy@ti.com>
Subject: Re: Multicolor Framework: brightness-model vs curve definition
Message-ID: <20190504155016.GA7421@amd>
References: <20190501225120.1ce3cfc6@nic.cz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="lrZ03NoBR/3+SXJZ"
Content-Disposition: inline
In-Reply-To: <20190501225120.1ce3cfc6@nic.cz>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--lrZ03NoBR/3+SXJZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> I have been thinking about the last Multicolor Framework proposal by
> Dan.

We talked on the phone... and I promissed some links.

I'd really prefer drivers to present output power to the of the
kernel/userland, and deal with the RGB conversion else where. So if
driver was asked for (20, 50, 100), red output would go to (20/1000) W,
green (50/1000) W, ...

RGB is described here:

https://en.wikipedia.org/wiki/RGB_color_model (see section
"nonlinearity")

https://en.wikipedia.org/wiki/Gamma_correction

And concrete values are here:

https://en.wikipedia.org/wiki/SRGB#Specification_of_the_transformation

While playing with colors, I came up with this:

https://github.com/pavelmachek/unicsy_demo/blob/master/monitor/notint.py

See change_color for exact transformation (it could be improvede,
linear part is not there). It can be also used to display same color
on monitor and LED. It get somehow reasonable results for me...

Best regards (and good luck),
									Pavel

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--lrZ03NoBR/3+SXJZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEUEARECAAYFAlzNtLgACgkQMOfwapXb+vI6PgCgq7QvLJKOk83Iw1ctH9rl5IJ6
RpkAmKJ43pnoJ+0VVBotfaKRhc9BM6I=
=4oK3
-----END PGP SIGNATURE-----

--lrZ03NoBR/3+SXJZ--
