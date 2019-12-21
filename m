Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 09EBB128AFB
	for <lists+linux-leds@lfdr.de>; Sat, 21 Dec 2019 20:04:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726593AbfLUTEg (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 21 Dec 2019 14:04:36 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:41348 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726107AbfLUTEg (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 21 Dec 2019 14:04:36 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 2545F1C24DF; Sat, 21 Dec 2019 20:04:34 +0100 (CET)
Date:   Sat, 21 Dec 2019 20:04:33 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Sven Van Asbroeck <thesven73@gmail.com>
Cc:     Lee Jones <lee.jones@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Grigoryev Denis <grigoryev@fastwel.ru>,
        Axel Lin <axel.lin@ingics.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Dan Murphy <dmurphy@ti.com>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-leds@vger.kernel.org
Subject: Re: [PATCH v6 1/2] leds: tps6105x: add driver for MFD chip LED mode
Message-ID: <20191221190433.GE4199@amd>
References: <20191216143259.24587-1-TheSven73@gmail.com>
 <20191216143259.24587-2-TheSven73@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="qFgkTsE6LiHkLPZw"
Content-Disposition: inline
In-Reply-To: <20191216143259.24587-2-TheSven73@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--qFgkTsE6LiHkLPZw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon 2019-12-16 09:32:58, Sven Van Asbroeck wrote:
> This driver adds support for the LED operational mode of the
> tps6105x MFD device.
>=20
> Acked-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
> Signed-off-by: Sven Van Asbroeck <TheSven73@gmail.com>

Thanks, applied both patches.
							Pavel
						=09
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--qFgkTsE6LiHkLPZw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl3+bMEACgkQMOfwapXb+vIx6ACcDv7Ephwh0LUfuY/MLy/h92le
o1gAnA6dSr3kGOpfRFy0NjsLndK5gvTa
=SMCJ
-----END PGP SIGNATURE-----

--qFgkTsE6LiHkLPZw--
