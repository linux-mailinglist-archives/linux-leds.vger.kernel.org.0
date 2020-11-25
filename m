Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F2C32C4878
	for <lists+linux-leds@lfdr.de>; Wed, 25 Nov 2020 20:35:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728754AbgKYTfY (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 25 Nov 2020 14:35:24 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:37434 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728521AbgKYTfY (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 25 Nov 2020 14:35:24 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id CC5BF1C0B7A; Wed, 25 Nov 2020 20:35:21 +0100 (CET)
Date:   Wed, 25 Nov 2020 20:35:21 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Dan Murphy <dmurphy@ti.com>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        newbytee@protonmail.com, Stephan Gerhold <stephan@gerhold.net>
Subject: Re: [PATCH 2/2 v3] leds: rt8515: Add Richtek RT8515 LED driver
Message-ID: <20201125193521.GA9791@amd>
References: <20201111011417.2275501-1-linus.walleij@linaro.org>
 <20201111011417.2275501-2-linus.walleij@linaro.org>
 <20201111113848.GX6899@valkosipuli.retiisi.org.uk>
 <CACRpkdYK+X==Xm3AfymV_HEaZHOvPS-LtCLKZXc2jmzV7KUZoQ@mail.gmail.com>
 <20201111165503.GZ6899@valkosipuli.retiisi.org.uk>
 <CACRpkdYvfxWE83O+4OAKx02kJK5XRBCLN0rFPjBYheQ65n4urA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="RnlQjJ0d97Da+TV1"
Content-Disposition: inline
In-Reply-To: <CACRpkdYvfxWE83O+4OAKx02kJK5XRBCLN0rFPjBYheQ65n4urA@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--RnlQjJ0d97Da+TV1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> Here is a schematic picture from the LG P970 service
> manual where you can see the connections from the RT8515
> to the LED:
> https://dflund.se/~triad/images/rt8515.jpg
>=20
> On this image you can see that there are two resistors connected
> from the pins "RFS" and "RTS" to ground.
>=20
> RFS (resistance flash setting?) is 20 kOhm
> RTS (resistance torch setting?) is 39 kOhm
>=20
> Some sleuthing finds us the RT9387A which we have a datasheet for:
> https://static5.arrow.com/pdfs/2014/7/27/8/21/12/794/rtt_/manual/94downlo=
ad_ds.jspprt9387a.jspprt9387a.pdf
> This apparently works the same way so now we have a
> RT9387A driver as well.

These links and RT9387A would be useful to mention in a comment in a
driver...

Best regards,
								Pavel

--=20
http://www.livejournal.com/~pavelmachek

--RnlQjJ0d97Da+TV1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl++sfkACgkQMOfwapXb+vIr+gCePuSK6mWzX6TRgAzDsIm+in6v
fXkAoLHXDXl59wp9+jepKlaOmWrMWAmu
=W1aG
-----END PGP SIGNATURE-----

--RnlQjJ0d97Da+TV1--
